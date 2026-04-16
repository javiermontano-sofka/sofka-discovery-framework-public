# Priming-RAG: Vector Databases
> Sovereign Architect — Vector database knowledge for RAG consumption
> Generated: 2026-03-18 | Version: v1.0

---

## Executive Summary
- pgvector extends PostgreSQL with vector similarity search [HECHO]
- Purpose-built options: Pinecone (managed), Weaviate (open-source), Qdrant (Rust) [HECHO]
- Embedding dimensions: OpenAI ada-002 (1536), text-embedding-3-small (1536) [HECHO]
- Key operations: similarity search (cosine, L2, inner product) [HECHO]
- Critical for RAG (Retrieval-Augmented Generation) applications [HECHO]

## Key Patterns

### pgvector
- `CREATE EXTENSION vector;` [HECHO]
- `embedding vector(1536)` column type [HECHO]
- `CREATE INDEX ON items USING ivfflat (embedding vector_cosine_ops)` [HECHO]
- HNSW index for better recall: `USING hnsw (embedding vector_cosine_ops)` [HECHO]
- Works with existing PostgreSQL (Supabase, RDS, etc.) [HECHO]

### Embedding Strategy
- Chunk text into 200-500 token segments with overlap [INFERENCIA]
- Store metadata alongside vectors for filtering [HECHO]
- Use hybrid search: vector similarity + keyword BM25 [HECHO]
- Re-rank results with cross-encoder for precision [HECHO]

### RAG Architecture
- Ingest: chunk → embed → store in vector DB [HECHO]
- Query: embed query → similarity search → retrieve top-k → augment prompt [HECHO]
- Use metadata filtering to narrow search space [HECHO]
- Implement caching for repeated queries [INFERENCIA]

## Anti-Patterns
- Embedding entire documents without chunking [HECHO]
- Not using indexes (brute force scan on large datasets) [HECHO]
- Ignoring metadata filtering (searching all vectors every time) [HECHO]
- Using wrong distance metric for the embedding model [HECHO]

## Query Hooks
- "pgvector vs Pinecone?" → pgvector if already on PostgreSQL, Pinecone for managed scale
- "How to chunk for RAG?" → 200-500 tokens with 50-token overlap, preserve sentence boundaries
