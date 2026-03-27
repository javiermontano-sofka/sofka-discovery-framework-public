# Body of Knowledge: Vector Database Design

## Embedding Models

### Model Comparison (2025)

| Model | Dimensions | Max Tokens | Cost | Best For |
|-------|-----------|------------|------|----------|
| `text-embedding-3-small` (OpenAI) | 1536 | 8191 | $0.02/1M | General purpose, cost-sensitive |
| `text-embedding-3-large` (OpenAI) | 3072 | 8191 | $0.13/1M | Higher accuracy, production |
| `text-embedding-ada-002` (OpenAI) | 1536 | 8191 | $0.10/1M | Legacy, avoid for new projects |
| `nomic-embed-text` (local) | 768 | 8192 | Free | Privacy-sensitive, on-prem |
| `all-MiniLM-L6-v2` (HuggingFace) | 384 | 256 | Free | Short text, fast |
| `voyage-3` (Voyage AI) | 1024 | 32000 | $0.06/1M | Long documents |
| Cohere `embed-v3` | 1024 | 512 | $0.10/1M | Multilingual |

**Key principle**: embed your query with the same model as your documents. Never mix models.

### Dimension Reduction

`text-embedding-3-small` and `text-embedding-3-large` support native dimension reduction:
```typescript
const embedding = await openai.embeddings.create({
  model: 'text-embedding-3-small',
  input: text,
  dimensions: 512,  // Reduce from 1536 — ~30% accuracy loss, 3x storage savings
});
```

---

## Chunking Strategies

### Fixed-Size Chunking

```typescript
function chunkByTokens(text: string, chunkSize = 512, overlap = 50): string[] {
  // Use tiktoken for accurate token counting
  const tokens = encode(text);
  const chunks: string[] = [];

  for (let i = 0; i < tokens.length; i += chunkSize - overlap) {
    const chunk = tokens.slice(i, i + chunkSize);
    chunks.push(decode(chunk));
    if (i + chunkSize >= tokens.length) break;
  }

  return chunks;
}
```

**Pro**: Simple. **Con**: May split sentences mid-thought.

### Semantic Chunking (Sentence-level)

```typescript
import { SentenceSplitter } from 'llamaindex';

const splitter = new SentenceSplitter({
  chunkSize: 512,
  chunkOverlap: 50,
});

const chunks = splitter.splitText(document);
// Respects sentence boundaries, better coherence
```

### Document-Structure Chunking (Best for structured docs)

```typescript
function chunkMarkdown(markdown: string): Chunk[] {
  const sections = markdown.split(/^#{1,3}\s/m);
  return sections.map((section, i) => ({
    content: section.trim(),
    metadata: { section_index: i },
  })).filter(c => c.content.length > 100);
}
```

### Chunking Strategy Decision Tree

```
Is the document structured (Markdown, HTML, code)?
  YES → Structure-aware chunking (respect headers/sections)
  NO →
    Does semantic coherence matter more than simplicity?
      YES → Sentence splitter with overlap
      NO → Fixed token chunks (512-1024 tokens, 10-15% overlap)

Are documents very long (>10K tokens)?
  YES → Consider parent-child chunking (embed small, retrieve large)
```

### Parent-Child Chunking

Store both large parent chunks and small child chunks. Embed children, retrieve parent:

```typescript
// Store parent (for context-rich retrieval)
await db.query(`
  INSERT INTO documents (id, content, metadata)
  VALUES ($1, $2, $3)
`, [parentId, fullSection, { type: 'parent' }]);

// Store children (for embedding + search)
for (const chunk of childChunks) {
  const embedding = await embed(chunk.content);
  await db.query(`
    INSERT INTO document_chunks (id, parent_id, content, embedding, metadata)
    VALUES ($1, $2, $3, $4, $5)
  `, [chunkId, parentId, chunk.content, embedding, chunk.metadata]);
}

// Search: find children, return parents
async function search(query: string) {
  const queryEmbedding = await embed(query);
  const children = await vectorSearch(queryEmbedding);
  const parentIds = [...new Set(children.map(c => c.parent_id))];
  return getParents(parentIds);  // Return rich context
}
```

---

## pgvector Setup

### Installation and Schema

```sql
-- Enable extension (Supabase: built-in, self-hosted: requires pg_vector package)
CREATE EXTENSION IF NOT EXISTS vector;

-- Documents table with embedding column
CREATE TABLE document_chunks (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  document_id UUID NOT NULL REFERENCES documents(id) ON DELETE CASCADE,
  content     TEXT NOT NULL,
  embedding   vector(1536),  -- Match your model's dimension
  metadata    JSONB,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

### HNSW Index (Recommended)

```sql
-- HNSW: Hierarchical Navigable Small World
-- Better recall, faster queries, but higher memory during build
CREATE INDEX idx_chunks_embedding_hnsw
ON document_chunks
USING hnsw (embedding vector_cosine_ops)
WITH (
  m = 16,           -- Max connections per layer (16-64, higher = better recall, more memory)
  ef_construction = 64  -- Build-time search width (higher = better index quality, slower build)
);

-- At query time, tune recall vs speed
SET hnsw.ef_search = 40;  -- Default 40, higher = better recall, slower
```

### IVFFlat Index (Alternative)

```sql
-- IVFFlat: Inverted File with Flat quantization
-- Lower memory, faster build, worse recall than HNSW
-- Must have data before creating (needs to sample for centroids)

-- Rule of thumb: lists ≈ sqrt(row_count)
CREATE INDEX idx_chunks_embedding_ivfflat
ON document_chunks
USING ivfflat (embedding vector_cosine_ops)
WITH (lists = 100);  -- 100 centroids for ~10k rows

-- At query time
SET ivfflat.probes = 10;  -- Number of lists to search (higher = better recall)
```

### Index Type Decision

| Factor | HNSW | IVFFlat |
|--------|------|---------|
| Recall (accuracy) | Higher (~99% at ef=40) | Lower (~90% at probes=10) |
| Query latency | Faster | Slower |
| Index build time | Slower | Faster |
| Memory during build | High | Low |
| Requires data first | No | Yes |
| Best for | Production (<50M rows) | Large datasets, batch |

---

## Similarity Search Queries

```sql
-- Cosine similarity (most common for normalized embeddings)
SELECT id, content, metadata,
  1 - (embedding <=> $1::vector) AS similarity
FROM document_chunks
ORDER BY embedding <=> $1::vector
LIMIT 10;

-- L2 distance (Euclidean — for non-normalized embeddings)
SELECT id, content,
  embedding <-> $1::vector AS distance
FROM document_chunks
ORDER BY embedding <-> $1::vector
LIMIT 10;

-- Inner product (for models trained with dot-product)
SELECT id, content,
  (embedding <#> $1::vector) * -1 AS score
FROM document_chunks
ORDER BY embedding <#> $1::vector
LIMIT 10;
```

---

## Hybrid Search (Vector + Full-Text)

### Reciprocal Rank Fusion (RRF)

RRF combines rankings from multiple retrieval systems without needing normalized scores:

```sql
-- Hybrid search combining semantic + keyword ranking
WITH semantic_results AS (
  SELECT id, content,
    ROW_NUMBER() OVER (ORDER BY embedding <=> $1::vector) AS rank
  FROM document_chunks
  LIMIT 50
),
keyword_results AS (
  SELECT id, content,
    ROW_NUMBER() OVER (ORDER BY ts_rank(to_tsvector('english', content),
      plainto_tsquery('english', $2)) DESC) AS rank
  FROM document_chunks
  WHERE to_tsvector('english', content) @@ plainto_tsquery('english', $2)
  LIMIT 50
),
fused AS (
  SELECT
    COALESCE(s.id, k.id) AS id,
    COALESCE(s.content, k.content) AS content,
    COALESCE(1.0 / (60 + s.rank), 0) +
    COALESCE(1.0 / (60 + k.rank), 0) AS rrf_score
  FROM semantic_results s
  FULL OUTER JOIN keyword_results k USING (id)
)
SELECT id, content, rrf_score
FROM fused
ORDER BY rrf_score DESC
LIMIT 10;
```

---

## Full RAG Pipeline in TypeScript

```typescript
import OpenAI from 'openai';
import { Pool } from 'pg';

const openai = new OpenAI();
const pool = new Pool({ connectionString: process.env.DATABASE_URL });

// Step 1: Index a document
async function indexDocument(documentId: string, content: string) {
  const chunks = chunkByTokens(content, 512, 50);

  await Promise.all(chunks.map(async (chunk, i) => {
    const response = await openai.embeddings.create({
      model: 'text-embedding-3-small',
      input: chunk,
    });

    await pool.query(
      `INSERT INTO document_chunks (document_id, content, embedding, metadata)
       VALUES ($1, $2, $3::vector, $4)`,
      [
        documentId,
        chunk,
        JSON.stringify(response.data[0].embedding),
        JSON.stringify({ chunk_index: i }),
      ]
    );
  }));
}

// Step 2: Retrieve relevant chunks
async function retrieve(query: string, topK = 5): Promise<string[]> {
  const response = await openai.embeddings.create({
    model: 'text-embedding-3-small',
    input: query,
  });

  const { rows } = await pool.query(
    `SELECT content, 1 - (embedding <=> $1::vector) AS similarity
     FROM document_chunks
     ORDER BY embedding <=> $1::vector
     LIMIT $2`,
    [JSON.stringify(response.data[0].embedding), topK]
  );

  return rows.map(r => r.content);
}

// Step 3: Generate answer with context
async function answer(question: string): Promise<string> {
  const context = await retrieve(question);

  const completion = await openai.chat.completions.create({
    model: 'gpt-4o-mini',
    messages: [
      {
        role: 'system',
        content: 'Answer questions using only the provided context. If unsure, say so.',
      },
      {
        role: 'user',
        content: `Context:\n${context.join('\n\n')}\n\nQuestion: ${question}`,
      },
    ],
  });

  return completion.choices[0].message.content ?? '';
}
```

---

## Multi-Tenant Vector Storage

```sql
-- Isolate embeddings by tenant
CREATE TABLE document_chunks (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id   UUID NOT NULL,
  document_id UUID NOT NULL,
  content     TEXT NOT NULL,
  embedding   vector(1536),
  FOREIGN KEY (tenant_id, document_id) REFERENCES documents(tenant_id, id)
);

-- Index per tenant (partial index — much smaller than full table index)
-- For high-volume tenants: create individual indexes
CREATE INDEX idx_chunks_tenant_1_embedding
  ON document_chunks USING hnsw (embedding vector_cosine_ops)
  WHERE tenant_id = '11111111-1111-1111-1111-111111111111';

-- Or: single index with tenant filter in query
CREATE INDEX idx_chunks_embedding ON document_chunks
  USING hnsw (embedding vector_cosine_ops);

-- Query always filters by tenant (RLS enforces this)
ALTER TABLE document_chunks ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON document_chunks
  USING (tenant_id = current_setting('app.tenant_id')::UUID);
```

---

## Embedding Update Strategy

When documents change, re-embedding is expensive. Strategies:

1. **Delete + re-insert** (simplest): delete all chunks for document, re-embed, insert.
2. **Content hash check**: store `content_hash TEXT` on chunks; skip re-embed if hash unchanged.
3. **Incremental**: only re-embed changed sections (requires section-level tracking).

```sql
ALTER TABLE document_chunks ADD COLUMN content_hash TEXT
  GENERATED ALWAYS AS (md5(content)) STORED;

-- Check before re-embedding
SELECT id FROM document_chunks
WHERE document_id = $1
  AND content_hash != md5($2);  -- $2 = new content
```

---

## Performance Tuning

### Batch Embedding (avoid per-item API calls)

```typescript
// Bad: 1000 API calls
for (const chunk of chunks) {
  await embed(chunk);
}

// Good: batch up to model's limit
const BATCH_SIZE = 100;
for (let i = 0; i < chunks.length; i += BATCH_SIZE) {
  const batch = chunks.slice(i, i + BATCH_SIZE);
  const response = await openai.embeddings.create({
    model: 'text-embedding-3-small',
    input: batch,  // Array of strings
  });
  // response.data[j].embedding corresponds to batch[j]
}
```

### pgvector Query Performance Checklist

1. Ensure HNSW or IVFFlat index exists (check with `\d document_chunks`)
2. Set `hnsw.ef_search` per session based on recall requirements
3. Add `WHERE tenant_id = $1` before ORDER BY — planner may filter before vector scan
4. Use `LIMIT` always — without it, planner ignores index
5. Run `EXPLAIN (ANALYZE, BUFFERS)` to verify "Index Scan using hnsw" appears
6. Monitor with `pg_stat_user_indexes` — low `idx_scan` means index isn't being used
