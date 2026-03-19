# State of the Art: Vector Database Design (2025-2026)

## Current Landscape

pgvector has become the default vector storage choice for teams already on PostgreSQL,
eliminating the need for a separate vector database in most use cases. Purpose-built
vector databases (Pinecone, Weaviate, Qdrant) remain relevant for large-scale (>100M
vectors) or specialized use cases. The embedding model landscape has consolidated around
OpenAI's text-embedding-3 series, with strong local alternatives via Ollama and nomic-embed.

---

## Key 2025-2026 Developments

### pgvector 0.7+ — Sparse Vector Support (2024-2025)

pgvector 0.7 added `sparsevec` type for efficient BM25/TF-IDF hybrid search within Postgres:

```sql
-- Sparse vector for BM25 scores (hybrid search without external BM25 engine)
CREATE TABLE document_chunks (
  id           UUID PRIMARY KEY,
  embedding    vector(1536),     -- Dense embedding
  bm25_vector  sparsevec(30000)  -- Sparse BM25 scores
);

-- Hybrid search: both vector types in one query
SELECT id, content
FROM document_chunks
ORDER BY (embedding <=> $1::vector) * 0.7
       + (bm25_vector <#> $2::sparsevec) * 0.3
LIMIT 10;
```

### HNSW — Now the Default Index (2024)

pgvector's HNSW implementation (added in 0.5.0) has become the standard choice,
replacing IVFFlat for most use cases:

```sql
-- Benchmarks (1M vectors, 1536 dims, cosine):
-- HNSW (m=16, ef=64): 99.2% recall, 2ms avg query, 8GB memory
-- IVFFlat (lists=1000, probes=10): 94.5% recall, 8ms avg query, 4GB memory
```

### Ollama + nomic-embed-text — Local Embeddings

Running embeddings locally is now practical for privacy-sensitive workloads:

```typescript
// Ollama local embedding API
const response = await fetch('http://localhost:11434/api/embeddings', {
  method: 'POST',
  body: JSON.stringify({
    model: 'nomic-embed-text',
    prompt: 'The document content to embed',
  }),
});
const { embedding } = await response.json();
// embedding: number[] (768 dimensions)
```

### Matryoshka Embeddings — OpenAI text-embedding-3

OpenAI's v3 models use Matryoshka Representation Learning: the first N dimensions of the
full embedding are themselves a valid embedding at lower quality:

```typescript
// Storage tiers for cost-sensitive applications
// Full precision: 1536 dims, maximum accuracy
const full = await openai.embeddings.create({
  model: 'text-embedding-3-small',
  input: text,
  dimensions: 1536,
});

// Compressed: 256 dims, ~85% accuracy, 6x storage savings
const compressed = await openai.embeddings.create({
  model: 'text-embedding-3-small',
  input: text,
  dimensions: 256,
});
```

### pgai — AI Workflows in Postgres (Timescale, 2024)

pgai brings embedding generation and LLM calls inside SQL:

```sql
-- Generate embeddings directly in SQL (no app-layer round-trip)
SELECT ai.openai_embed('text-embedding-3-small', content, _api_key => $$sk-...$$)
FROM documents;

-- Auto-embedding trigger
CREATE TRIGGER embed_on_insert
AFTER INSERT ON documents
FOR EACH ROW
EXECUTE FUNCTION ai.auto_embed('text-embedding-3-small', 'content', 'embedding');
```

### Qdrant Payload Filtering — Better Than pgvector for Metadata Filtering

For workloads requiring complex metadata filtering before vector search:

```python
# Qdrant: filter-first then vector search (pgvector searches vector then filters)
results = client.search(
    collection_name="documents",
    query_vector=query_embedding,
    query_filter=Filter(
        must=[
            FieldCondition(key="tenant_id", match=MatchValue(value="acme")),
            FieldCondition(key="published", match=MatchValue(value=True)),
        ]
    ),
    limit=10,
)
```

pgvector's limitation: metadata filter applied after ANN scan → poor recall when filters
are highly selective. Workaround: partial HNSW indexes per tenant.

---

## Vector Database Choice Matrix (2025)

| Dimension | pgvector | Pinecone | Qdrant | Weaviate |
|-----------|----------|----------|--------|---------|
| Setup | Your existing Postgres | Managed SaaS | Self-hosted / Cloud | Self-hosted / Cloud |
| Scale | < 50M vectors well | 1B+ | 100M+ | 100M+ |
| Metadata filtering | Basic (post-filter) | Advanced (pre-filter) | Advanced (pre-filter) | Advanced |
| Hybrid search | With sparsevec (0.7+) | Yes | Yes | Yes |
| Operational overhead | Low (unified DB) | Zero | Medium | Medium |
| Cost | Postgres hosting | $$$$ | $ (self-hosted) | $ (self-hosted) |
| Best for | Most web apps | Enterprise scale | Cost-sensitive | Multi-modal |

---

## Best Current Practices (2025)

1. **Start with pgvector** — reduces infra complexity; migrate to purpose-built only if needed.
2. **HNSW over IVFFlat** — better recall, faster queries; only use IVFFlat for > 10M vectors with memory constraints.
3. **text-embedding-3-small with 512 dims** — 70% cost savings, ~95% of full accuracy.
4. **Parent-child chunking** — embed small chunks for precision, retrieve large chunks for context.
5. **Hybrid search with RRF** — consistently outperforms pure semantic by 10-20% on benchmarks.
6. **Content hash before re-embedding** — avoid redundant API calls on document updates.
7. **Batch embedding calls** — 100 texts per API call, not 1.
8. **Row-Level Security for multi-tenant** — tenant_id filter at DB level, not app level.

---

## Recall Benchmarks (2025, 1M vectors, cosine)

- HNSW m=16, ef=40: 98.5% recall, 1.8ms p50
- HNSW m=16, ef=100: 99.7% recall, 4.2ms p50
- IVFFlat probes=10: 94.2% recall, 7.1ms p50
- Hybrid (semantic + BM25 RRF): +12% vs semantic-only on BEIR benchmark
- text-embedding-3-small 512 dims vs 1536 dims: 94.8% vs 97.1% on MTEB
