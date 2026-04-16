# Vector Database Architecture & Comparison

## Vector Database Selection Framework

### Key Selection Criteria

| Criterion | Description | Impact |
|---|---|---|
| **Scale** | Number of vectors, dimensionality, concurrent queries | Determines infrastructure requirements |
| **Latency** | Query response time requirements | Influences index type and deployment mode |
| **Accuracy** | Recall requirements (exact vs. approximate) | Trades off against latency and cost |
| **Filtering** | Metadata filtering alongside similarity search | Affects query flexibility and performance |
| **Updates** | Frequency of inserts, updates, deletes | Determines index rebuild strategy |
| **Cost** | Managed vs. self-hosted, storage vs. compute | Budget constraints drive platform choice |
| **Ecosystem** | Integration with existing ML stack | Reduces integration effort |

### Platform Comparison

| Feature | Pinecone | Qdrant | Weaviate | Milvus | Chroma | pgvector |
|---|---|---|---|---|---|---|
| **Deployment** | Managed only | Self-hosted + Cloud | Self-hosted + Cloud | Self-hosted + Cloud | Self-hosted (embedded) | PostgreSQL extension |
| **Max vectors** | Billions | Billions | Billions | Billions | Millions | Millions |
| **Metadata filtering** | Yes (server-side) | Yes (rich filtering) | Yes (GraphQL) | Yes (expressions) | Yes (basic) | Yes (SQL WHERE) |
| **Hybrid search** | Dense + sparse | Dense + sparse | Dense + BM25 | Dense + sparse | Dense only | Dense + tsvector |
| **Multi-tenancy** | Namespaces | Collections + payload | Multi-tenancy native | Partitions | Collections | Schemas/tables |
| **RBAC** | API key + namespace | API key + collection | OIDC + RBAC | RBAC | None | PostgreSQL RBAC |
| **Ease of start** | Very easy (managed) | Easy | Moderate | Moderate | Very easy (embedded) | Easy (if using PG) |
| **Production readiness** | High | High | High | High | Low-Medium | Medium |
| **Cost model** | Per-pod (serverless available) | Self-hosted or cloud | Self-hosted or cloud | Self-hosted or cloud | Free (self-hosted) | Free (PG extension) |

---

## Embedding Model Selection

### Model Categories

| Category | Models | Dimensions | Best For |
|---|---|---|---|
| **General purpose** | OpenAI text-embedding-3, Cohere embed-v3, Voyage | 256-3072 | Broad semantic search |
| **Domain-specific** | Fine-tuned sentence-transformers, domain BERT | 384-768 | Specialized domains (legal, medical, code) |
| **Multilingual** | Cohere multilingual, mE5, multilingual-e5 | 384-1024 | Cross-language retrieval |
| **Code** | CodeBERT, StarCoder embeddings, Voyage Code | 768-1024 | Code search and understanding |
| **Lightweight** | MiniLM, TinyBERT, all-MiniLM-L6-v2 | 384 | Low-latency, edge deployment |

### Selection Factors
- **Quality vs. latency**: Larger models produce better embeddings but are slower
- **Dimensionality vs. storage**: Higher dimensions = better quality but more storage and slower search
- **Fine-tuning potential**: Domain-specific fine-tuning improves retrieval quality significantly
- **Consistency**: Use the SAME embedding model for indexing and querying (model mismatch = poor retrieval)

---

## Index Architecture Patterns

### Single Collection
- All documents in one collection
- Simple metadata filtering for scoping
- Good for: small-medium knowledge bases, single domain

### Multi-Collection
- Separate collections per domain, source type, or access level
- Query routing selects appropriate collection(s)
- Good for: multi-domain systems, access control requirements

### Hierarchical Index
- Summary index (document-level embeddings) for coarse retrieval
- Detail index (chunk-level embeddings) for fine retrieval
- Two-stage retrieval: find relevant documents, then find relevant chunks
- Good for: large document collections, precision requirements

### Hybrid Index
- Vector index for semantic search
- Keyword index (BM25) for exact matching
- Reciprocal Rank Fusion (RRF) to merge results
- Good for: most production RAG systems (combines strengths of both approaches)

---

## Operational Considerations

### Index Maintenance
- **Incremental updates**: Add new documents without full re-index
- **Stale document detection**: Identify and remove outdated content
- **Re-indexing strategy**: When to rebuild (embedding model change, schema change)
- **Backup and recovery**: Vector index snapshots and restoration

### Monitoring
- **Query latency**: P50, P95, P99 response times
- **Recall quality**: Periodic evaluation against labeled test sets
- **Index size**: Growth rate, storage utilization
- **Query patterns**: Most common queries, zero-result queries, low-score queries

### Cost Optimization
- **Dimensionality reduction**: Matryoshka embeddings, PCA for storage savings
- **Quantization**: Reduce vector precision (float32 → float16 → int8) for speed/storage
- **Tiered storage**: Hot vectors in memory, warm on SSD, cold archived
- **Caching**: Cache frequent query results to reduce vector search load
