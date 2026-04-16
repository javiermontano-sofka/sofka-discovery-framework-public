# Sample Output: Vector Database Design

## Context

- **Project**: Internal knowledge base with document Q&A
- **Documents**: ~8,000 PDFs and Markdown files, company documentation [HECHO]
- **Stack**: Node.js + TypeScript + PostgreSQL on Supabase + OpenAI [HECHO]
- **Scale**: ~200 concurrent users, 50 queries/minute [SUPUESTO — validate post-launch]

---

## Embedding Model Decision

**Chosen**: `text-embedding-3-small` at 768 dimensions

**Rationale**:
- Full 1536 dims: $0.02/1M tokens, 97% MTEB accuracy
- Reduced 768 dims: $0.02/1M tokens (same — pricing is per input token), 95% MTEB accuracy
- Storage savings: 50% (768 × 4 bytes = 3KB vs 6KB per vector)
- For an internal knowledge base, 95% accuracy is sufficient

**Not chosen**: `nomic-embed-text` (local) — team has no GPU, Supabase-hosted = no network hop for the DB, OpenAI API is acceptable.

---

## Schema

```sql
-- Enable extension
CREATE EXTENSION IF NOT EXISTS vector;

-- Source documents
CREATE TABLE documents (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title        TEXT NOT NULL,
  source_url   TEXT,
  content_hash TEXT NOT NULL,  -- MD5 of full content (skip re-embed if unchanged)
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Chunks with embeddings
CREATE TABLE document_chunks (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  document_id  UUID NOT NULL REFERENCES documents(id) ON DELETE CASCADE,
  content      TEXT NOT NULL,
  content_hash TEXT NOT NULL GENERATED ALWAYS AS (md5(content)) STORED,
  embedding    vector(768),
  metadata     JSONB,           -- { chunk_index, section_title, page_number }
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- HNSW index (recommended for < 50M vectors)
CREATE INDEX idx_chunks_embedding
ON document_chunks
USING hnsw (embedding vector_cosine_ops)
WITH (m = 16, ef_construction = 64);

-- Full-text index for hybrid search
CREATE INDEX idx_chunks_fts
ON document_chunks
USING GIN (to_tsvector('english', content));
```

---

## Chunking Implementation

```typescript
// lib/chunker.ts
import { encode, decode } from 'gpt-tokenizer';

const CHUNK_TOKENS = 512;
const OVERLAP_TOKENS = 50;

export function chunkDocument(
  content: string,
  metadata: { documentId: string; title: string }
): Chunk[] {
  const tokens = encode(content);
  const chunks: Chunk[] = [];
  let chunkIndex = 0;

  for (let i = 0; i < tokens.length; i += CHUNK_TOKENS - OVERLAP_TOKENS) {
    const slice = tokens.slice(i, i + CHUNK_TOKENS);
    const text = decode(slice).trim();

    if (text.length < 50) continue;  // Skip very short tail chunks

    chunks.push({
      content: text,
      metadata: {
        ...metadata,
        chunk_index: chunkIndex++,
        token_count: slice.length,
      },
    });

    if (i + CHUNK_TOKENS >= tokens.length) break;
  }

  return chunks;
}
```

---

## Indexing Pipeline

```typescript
// lib/indexer.ts
import OpenAI from 'openai';
import { createClient } from '@supabase/supabase-js';
import { chunkDocument } from './chunker';
import { md5 } from './utils';

const openai = new OpenAI();
const supabase = createClient(process.env.SUPABASE_URL!, process.env.SUPABASE_SERVICE_KEY!);

const EMBED_BATCH_SIZE = 100;

export async function indexDocument(doc: {
  title: string;
  content: string;
  sourceUrl?: string;
}) {
  const contentHash = md5(doc.content);

  // Skip if content unchanged
  const { data: existing } = await supabase
    .from('documents')
    .select('id, content_hash')
    .eq('content_hash', contentHash)
    .single();

  if (existing) {
    console.log(`Document unchanged (hash: ${contentHash}), skipping`);
    return existing.id;
  }

  // Upsert document record
  const { data: document } = await supabase
    .from('documents')
    .upsert({ title: doc.title, source_url: doc.sourceUrl, content_hash: contentHash })
    .select('id')
    .single();

  const documentId = document!.id;

  // Delete old chunks for this document
  await supabase.from('document_chunks').delete().eq('document_id', documentId);

  // Chunk document
  const chunks = chunkDocument(doc.content, { documentId, title: doc.title });

  // Batch embed
  for (let i = 0; i < chunks.length; i += EMBED_BATCH_SIZE) {
    const batch = chunks.slice(i, i + EMBED_BATCH_SIZE);

    const response = await openai.embeddings.create({
      model: 'text-embedding-3-small',
      input: batch.map((c) => c.content),
      dimensions: 768,
    });

    const rows = batch.map((chunk, j) => ({
      document_id: documentId,
      content: chunk.content,
      embedding: JSON.stringify(response.data[j].embedding),
      metadata: chunk.metadata,
    }));

    await supabase.from('document_chunks').insert(rows);
  }

  return documentId;
}
```

---

## Search Implementation

### Semantic Search

```typescript
export async function semanticSearch(query: string, topK = 5) {
  const response = await openai.embeddings.create({
    model: 'text-embedding-3-small',
    input: query,
    dimensions: 768,
  });

  const { data } = await supabase.rpc('match_chunks', {
    query_embedding: response.data[0].embedding,
    match_count: topK,
  });

  return data;
}
```

```sql
-- Supabase RPC function for vector search
CREATE OR REPLACE FUNCTION match_chunks(
  query_embedding vector(768),
  match_count integer DEFAULT 5
)
RETURNS TABLE (
  id uuid,
  content text,
  metadata jsonb,
  similarity float
)
LANGUAGE sql STABLE
AS $$
  SELECT id, content, metadata,
    1 - (embedding <=> query_embedding) AS similarity
  FROM document_chunks
  ORDER BY embedding <=> query_embedding
  LIMIT match_count;
$$;
```

### Hybrid Search (Semantic + Full-Text)

```sql
CREATE OR REPLACE FUNCTION hybrid_search(
  query_text text,
  query_embedding vector(768),
  match_count integer DEFAULT 5
)
RETURNS TABLE (id uuid, content text, metadata jsonb, score float)
LANGUAGE sql STABLE
AS $$
WITH semantic AS (
  SELECT id, content, metadata,
    ROW_NUMBER() OVER (ORDER BY embedding <=> query_embedding) AS rank
  FROM document_chunks
  LIMIT 40
),
keyword AS (
  SELECT id, content, metadata,
    ROW_NUMBER() OVER (ORDER BY ts_rank(
      to_tsvector('english', content),
      plainto_tsquery('english', query_text)
    ) DESC) AS rank
  FROM document_chunks
  WHERE to_tsvector('english', content) @@ plainto_tsquery('english', query_text)
  LIMIT 40
),
fused AS (
  SELECT
    COALESCE(s.id, k.id) AS id,
    COALESCE(s.content, k.content) AS content,
    COALESCE(s.metadata, k.metadata) AS metadata,
    COALESCE(1.0 / (60 + s.rank), 0) + COALESCE(1.0 / (60 + k.rank), 0) AS score
  FROM semantic s
  FULL OUTER JOIN keyword k USING (id)
)
SELECT id, content, metadata, score
FROM fused
ORDER BY score DESC
LIMIT match_count;
$$;
```

---

## Performance Results

After deploying HNSW index and hybrid search:

| Metric | Before | After |
|--------|--------|-------|
| Avg query latency | 1200ms (Seq Scan) | 18ms (HNSW) |
| Recall@5 (test set 200 Q) | — | 84% |
| p99 latency | 4200ms | 45ms |
| Storage per chunk | 6KB (1536d) | 3KB (768d) |

---

## Quality Gate Checklist

- [x] HNSW index created before production traffic
- [x] `ef_search` default 40 (configurable per query)
- [x] Same model for indexing and querying (`text-embedding-3-small` + 768d)
- [x] Content hash prevents redundant re-embedding
- [x] Batch embedding (100 texts per API call)
- [x] Hybrid search with RRF for better recall
- [x] Recall@5 measured: 84% (target: 80%)
- [x] `LIMIT` always present in vector search queries
- [x] Delete + re-insert on document update (clean slate)
