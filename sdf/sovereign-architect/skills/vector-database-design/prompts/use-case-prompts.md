# Use Case Prompts — Vector Database Design

## Scenario 1: Set Up pgvector for Document Q&A

```
Set up a document Q&A system using pgvector on an existing PostgreSQL database (Supabase).

Documents: ~10,000 PDF documents, average 20 pages each
Users: ~500 concurrent, 100 queries/minute
Latency target: < 200ms for retrieval step
Languages: English only

Deliver:
1. Enable pgvector extension and create schema (documents + document_chunks tables)
2. Choose embedding model with justification (dimension, cost, latency)
3. Chunking strategy for PDF documents (what chunk size? overlap?)
4. HNSW index configuration (m, ef_construction values with rationale)
5. TypeScript indexDocumentPDF(path) function
6. TypeScript search(query, topK) function
7. ef_search setting recommendation for 200ms latency target
```

## Scenario 2: Design Hybrid Search for E-commerce

```
Design a product search system for an e-commerce catalog:
- 500,000 products, each with: name, description, category, brand, tags[]
- Search requirements:
  * "red running shoes Nike" — keyword match should rank highly
  * "comfortable shoes for standing all day" — semantic search needed
  * "shoes under $100" — metadata filter (not embedding-relevant)
- Current system: PostgreSQL full-text search only (users complain about poor semantic results)

Design the hybrid search:
1. Schema: product_chunks table with embedding + tsvector + price/category columns
2. Embedding strategy: should each product be one embedding or multiple?
3. HNSW index for semantic, GIN for full-text
4. Hybrid search SQL using RRF (Reciprocal Rank Fusion)
5. How to handle the metadata filter ($price < 100) efficiently with pgvector
6. Expected query time vs current full-text only approach
```

## Scenario 3: Multi-Tenant RAG with Row-Level Security

```
Design a multi-tenant knowledge base where:
- Each company's documents are private (never cross-contaminate search results)
- 200 tenants, average 5,000 chunks each = 1M total chunks
- All tenants share one PostgreSQL instance (cost efficiency)
- Some tenants are "power users" with 100k+ chunks

Design:
1. Schema with tenant_id column and FK constraints
2. RLS policy to enforce tenant isolation
3. How to set the tenant_id context in app code before querying
4. Index strategy: one global HNSW vs partial indexes per tenant?
5. For the "power user" tenant with 100k chunks, what index parameters?
6. Query pattern: ensure RLS filter happens before vector scan
7. Test query that verifies tenant B cannot see tenant A's chunks
```

## Scenario 4: Optimize Slow RAG Retrieval

```
Current RAG system has poor performance:
- Average retrieval latency: 850ms (target: < 100ms)
- Recall@5: 67% (target: 80%)
- Embedding model: text-embedding-ada-002 (1536 dims)
- Index: no vector index (Seq Scan on 500k rows)
- Chunking: 2000 tokens fixed, no overlap

EXPLAIN output shows:
Seq Scan on document_chunks (cost=0..450000 rows=500000)
  (actual time=0.05..820ms rows=10 loops=1)
  Filter: (tenant_id = 'abc123')
  Rows Removed by Filter: 499990

Diagnose and fix:
1. Why is the Seq Scan happening despite document_chunks having rows?
2. Create the correct HNSW index with recommended parameters
3. Fix the chunking strategy (2000 tokens with no overlap is problematic — why?)
4. Should we migrate from ada-002 to text-embedding-3-small? Cost/accuracy analysis.
5. Show EXPLAIN output we expect after fixes
6. How to measure recall@5 to verify the 80% target
```

## Scenario 5: Build a Code Search System

```
Build semantic search over a codebase for a developer productivity tool:
- Repository: 50,000 TypeScript files, average 200 lines each
- Use cases: "find all places where we validate user permissions",
             "show me examples of how we use the payment API"
- Stack: Node.js + pgvector + OpenAI

Specific challenges for code:
1. Should code be chunked by function/class or by fixed tokens?
2. How to preserve context (imports, class name) in each chunk?
3. Should comments be included in the embedding text?
4. Code has different vocabulary than English prose — does text-embedding-3-small work?
5. How to index the entire repo efficiently (parallel embedding, batch calls)?
6. Show the ingestFile(path) and searchCode(query) TypeScript functions
7. How to handle file updates incrementally (only re-embed changed files)?
```
