---
name: vector-database-design
author: "Javier Montaño (JM Labs)"
version: "2.0.0"
description: >
  Design vector storage for RAG and semantic search: pgvector setup, embedding
  model selection, chunking strategies, HNSW vs IVFFlat index comparison,
  hybrid search (dense + sparse), and metadata filtering.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
tags: [pgvector, rag, embeddings, hnsw, ivfflat, hybrid-search, chunking, semantic-search]
---

# Vector Database Design

> *"Embeddings are only as good as the chunking strategy that produces them — garbage in, garbage retrieved."*

## TL;DR

Five-step procedure to design a production vector database: pgvector schema design,
embedding model selection, document chunking strategy, HNSW vs IVFFlat index trade-offs,
hybrid search combining dense and sparse retrieval, and metadata filtering for RAG.

---

## Step 1 — Discover Requirements & Choose Infrastructure

### Discovery Questions

1. What is the document corpus size? (< 100k docs → pgvector; > 1M docs → consider Qdrant/Pinecone)
2. What is the query latency requirement? (< 100ms → HNSW; batch acceptable → IVFFlat)
3. Does the team already run Postgres / Supabase? (pgvector is the obvious choice)
4. Is hybrid search (keyword + semantic) required? (adds BM25/trgm component)
5. What content type: code, prose, structured JSON, multilingual?

### Infrastructure Decision

| Situation | Recommendation |
|-----------|---------------|
| Existing Postgres + < 500k vectors | pgvector (HNSW) |
| Supabase project | pgvector built-in |
| > 1M vectors, managed scaling | Qdrant Cloud or Pinecone |
| Need filtering + vectors | pgvector or Qdrant (both support metadata filtering) |
| Multimodal (images + text) | Pinecone or Weaviate |

---

## Step 2 — Embedding Model Selection

### Model Comparison (2025)

| Model | Dimensions | Context | Best For | Cost |
|-------|-----------|---------|---------|------|
| `text-embedding-3-small` | 1536 | 8191 tokens | General purpose, cost-efficient | $0.02/1M tokens |
| `text-embedding-3-large` | 3072 | 8191 tokens | High accuracy tasks | $0.13/1M tokens |
| `text-embedding-ada-002` | 1536 | 8191 tokens | Legacy (superseded by v3) | $0.10/1M tokens |
| `nomic-embed-text` | 768 | 8192 tokens | Open source, self-hosted | Free |
| `bge-large-en-v1.5` | 1024 | 512 tokens | Local inference | Free |

### Matryoshka Embeddings (Dimension Reduction)

```python
# OpenAI text-embedding-3 supports truncation via `dimensions` param
# Reduces storage/compute while preserving most accuracy

import openai

def embed(text: str, dimensions: int = 256) -> list[float]:
    """256 dimensions retains ~95% of full accuracy at 6x less storage."""
    response = openai.embeddings.create(
        model="text-embedding-3-small",
        input=text,
        dimensions=dimensions,
    )
    return response.data[0].embedding
```

---

## Step 3 — Document Chunking Strategy

Chunking is the most impactful decision for RAG quality.

### Chunking Strategies

| Strategy | Chunk Size | Overlap | Best For |
|----------|-----------|---------|---------|
| Fixed-size | 512 tokens | 50-100 tokens | General purpose, easy to implement |
| Recursive character split | 1000 chars | 200 chars | Prose, documentation |
| Semantic chunking | Variable | Sentence boundary | High coherence requirement |
| Document structure | By heading/section | None | Markdown, HTML docs |
| Sentence-level | 1-3 sentences | 1 sentence | Q&A, FAQ retrieval |

### Implementation with LangChain / Custom

```python
# Recursive text splitter — respects sentence and paragraph boundaries
from langchain.text_splitter import RecursiveCharacterTextSplitter

splitter = RecursiveCharacterTextSplitter(
    chunk_size=1000,
    chunk_overlap=200,
    separators=["\n\n", "\n", ". ", " ", ""],
    length_function=len,
)

chunks = splitter.split_text(document_content)

# Enrich each chunk with metadata for filtering
enriched_chunks = [
    {
        "content": chunk,
        "metadata": {
            "source_id": document.id,
            "source_url": document.url,
            "page_number": estimate_page(chunk, document),
            "chunk_index": i,
            "total_chunks": len(chunks),
            "heading": extract_nearest_heading(chunk, document),
        }
    }
    for i, chunk in enumerate(chunks)
]
```

### Parent-Child Chunking (Best Retrieval + Context)

```python
# Store small chunks for precise retrieval
# Store parent chunks for context in generation
small_splitter = RecursiveCharacterTextSplitter(chunk_size=300, chunk_overlap=50)
large_splitter = RecursiveCharacterTextSplitter(chunk_size=1500, chunk_overlap=100)

# Index small chunks; retrieve and return parent chunks
small_chunks = small_splitter.split_text(doc)
parent_chunks = large_splitter.split_text(doc)

# Map small → parent for retrieval expansion
```

---

## Step 4 — pgvector Schema & Index Design

### Schema

```sql
-- Enable pgvector extension
CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE document_chunks (
  id          UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  document_id UUID        NOT NULL REFERENCES documents(id) ON DELETE CASCADE,
  content     TEXT        NOT NULL,
  embedding   vector(1536),          -- Match your model's dimensions
  metadata    JSONB       NOT NULL DEFAULT '{}',
  chunk_index INT         NOT NULL,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Metadata for filtering
CREATE INDEX idx_chunks_document ON document_chunks(document_id);
CREATE INDEX idx_chunks_metadata ON document_chunks USING GIN(metadata);
```

### HNSW vs IVFFlat Index

| Factor | HNSW | IVFFlat |
|--------|------|---------|
| Query speed | Very fast (log scale) | Fast (linear in cluster) |
| Build time | Slow (builds full graph) | Fast |
| Memory | High | Low |
| Recall accuracy | Higher | Lower (tune `probes`) |
| Incremental inserts | Yes (no rebuild) | Degrades without rebuild |
| Best for | Production, < 10M vectors | Batch workloads, memory-constrained |

```sql
-- HNSW index (recommended for production)
CREATE INDEX idx_chunks_embedding_hnsw ON document_chunks
  USING hnsw (embedding vector_cosine_ops)
  WITH (m = 16, ef_construction = 64);
-- m: number of connections per layer (16 is default; higher = more recall, more memory)
-- ef_construction: search width during build (higher = better index, slower build)

-- IVFFlat index (alternative for large datasets)
-- Must have data first (k-means clustering)
CREATE INDEX idx_chunks_embedding_ivf ON document_chunks
  USING ivfflat (embedding vector_cosine_ops)
  WITH (lists = 100);  -- lists ≈ sqrt(row_count)
-- Set probes at query time: SET ivfflat.probes = 10;
```

### Cosine Similarity Query

```sql
-- Semantic search with metadata filter
SELECT
  dc.id,
  dc.content,
  dc.metadata,
  1 - (dc.embedding <=> $1::vector) AS similarity
FROM document_chunks dc
WHERE dc.metadata->>'source_type' = 'documentation'
  AND dc.created_at > NOW() - INTERVAL '30 days'
ORDER BY dc.embedding <=> $1::vector  -- <=> cosine, <-> L2, <#> inner product
LIMIT 10;
```

---

## Step 5 — Hybrid Search

Combines dense (semantic) + sparse (keyword/BM25) retrieval for best recall.

```sql
-- Hybrid search using RRF (Reciprocal Rank Fusion)
-- Dense: pgvector cosine similarity
-- Sparse: full-text search with ts_rank

WITH semantic AS (
  SELECT id, content,
         ROW_NUMBER() OVER (ORDER BY embedding <=> $1::vector) AS rank
  FROM document_chunks
  WHERE embedding <=> $1::vector < 0.3  -- cosine distance threshold
  LIMIT 20
),
keyword AS (
  SELECT id, content,
         ROW_NUMBER() OVER (ORDER BY ts_rank(to_tsvector('english', content), query) DESC) AS rank
  FROM document_chunks,
       plainto_tsquery('english', $2) AS query
  WHERE to_tsvector('english', content) @@ query
  LIMIT 20
),
rrf AS (
  SELECT
    COALESCE(s.id, k.id) AS id,
    COALESCE(s.content, k.content) AS content,
    (COALESCE(1.0 / (60 + s.rank), 0) + COALESCE(1.0 / (60 + k.rank), 0)) AS rrf_score
  FROM semantic s
  FULL OUTER JOIN keyword k ON s.id = k.id
)
SELECT id, content, rrf_score
FROM rrf
ORDER BY rrf_score DESC
LIMIT 5;
```

### TypeScript RAG Pipeline

```typescript
// lib/rag.ts
export async function retrieve(query: string, filters?: Record<string, string>) {
  const embedding = await embed(query);

  const results = await db.$queryRaw<Chunk[]>`
    SELECT id, content, metadata,
           1 - (embedding <=> ${embedding}::vector) AS similarity
    FROM document_chunks
    WHERE 1 - (embedding <=> ${embedding}::vector) > 0.7
      ${filters ? Prisma.sql`AND metadata @> ${filters}::jsonb` : Prisma.empty}
    ORDER BY embedding <=> ${embedding}::vector
    LIMIT 5
  `;

  return results;
}

export async function generateWithContext(question: string) {
  const chunks = await retrieve(question);
  const context = chunks.map(c => c.content).join('\n\n---\n\n');

  return openai.chat.completions.create({
    model: 'gpt-4o-mini',
    messages: [
      { role: 'system', content: 'Answer based on the provided context only.' },
      { role: 'user', content: `Context:\n${context}\n\nQuestion: ${question}` },
    ],
    temperature: 0,
  });
}
```

---

## Quality Criteria

1. **Embedding model dimension matches vector column** — `vector(1536)` for OpenAI v3-small; mismatches cause silent errors.
2. **HNSW index built after initial data load** — Building on empty table then inserting defeats HNSW quality.
3. **Cosine distance operator matches index** — `<=>` with `vector_cosine_ops` index; mixing operators bypasses the index.
4. **Chunk size validated for retrieval quality** — Tested against representative queries, not just inserted blindly.
5. **Metadata filtering at DB level** — Not post-filtering in application code; defeats index efficiency.
6. **Similarity threshold enforced** — `WHERE similarity > 0.7` prevents returning irrelevant chunks to LLM.
7. **Parent-child or context window** — Retrieved chunk includes surrounding context for generation.
8. **Embedding cost tracked** — Embeddings are not free; batch processing and caching used for repeated content.

---

## Anti-Patterns

- **Embedding entire documents as one vector** — A 10-page PDF produces one vector; retrieval returns the whole document or misses specific answers. Always chunk.
- **No vector index (brute-force search)** — `SELECT ... ORDER BY embedding <=> $1 LIMIT 10` without an index does O(n) comparisons; acceptable at < 10k rows, catastrophic at 1M+.
- **Wrong distance metric for the model** — OpenAI embeddings are normalized (unit vectors); cosine and dot product give the same ranking, but L2 (`<->`) does not. Check model documentation.
- **Chunking without overlap** — Information spanning chunk boundaries is never retrieved; always use 10-20% overlap.
- **Re-embedding unchanged documents on every pipeline run** — Recompute embeddings only on content change (hash-based change detection); embeddings are expensive.
- **Storing raw embeddings in application memory** — Cache at the database layer with pgvector, not in Redis or application memory; embeddings are large (6KB per 1536-dim vector).
- **Not testing retrieval quality with real queries** — "Indexing works" is not the same as "retrieval returns relevant results"; evaluate with MRR or NDCG metrics.
