# RAG Architecture Patterns

## Core RAG Pipeline

```
User Query → Query Processing → Retrieval → Context Assembly → LLM Generation → Response Validation → Output
```

### Stage Details

**Query Processing**:
- Entity extraction: identify key entities, concepts, and relationships in the query
- Intent classification: determine query type (factual, analytical, comparative, instructional)
- Query expansion: add synonyms, related terms, decompose complex queries into sub-queries
- Query rewriting: optimize query for retrieval (remove noise, focus on retrieval-relevant terms)

**Retrieval**:
- Vector similarity search: embed query, find nearest neighbors in vector store
- Keyword search: BM25 or similar for exact term matching
- Hybrid retrieval: combine vector + keyword with reciprocal rank fusion (RRF) or learned weights
- Metadata filtering: pre-filter by source, date, category, access level before similarity search
- Multi-index retrieval: query multiple collections/indices for diverse results

**Context Assembly**:
- Chunk ranking: re-rank retrieved chunks by relevance (cross-encoder, LLM-based)
- Context window management: select chunks that fit within LLM context window
- Deduplication: remove redundant or overlapping chunks
- Source attribution: maintain provenance for each chunk
- Context augmentation: add metadata, relationships, structured data alongside unstructured chunks

**LLM Generation**:
- Prompt construction: system prompt + context + query + output format instructions
- Temperature and parameter tuning per use case
- Multi-model tiering: route to appropriate model based on query complexity
- Streaming: progressive response delivery for long generations

**Response Validation**:
- Hallucination detection: verify claims against retrieved context
- Factual grounding: check that response is supported by provided sources
- Format compliance: verify response follows expected structure
- Safety filtering: content moderation, PII detection, harmful content detection
- Citation verification: ensure source citations are accurate and traceable

---

## RAG Variants

### Naive RAG
- Simple: embed query → retrieve top-K → concatenate → generate
- No re-ranking, no query processing, no validation
- Good for prototypes; insufficient for production

### Advanced RAG
- Query processing (rewriting, expansion, decomposition)
- Hybrid retrieval (vector + keyword)
- Re-ranking (cross-encoder)
- Context window optimization
- Response validation and citation
- Production-grade for most enterprise use cases

### Modular RAG
- Each stage is an independent, swappable module
- Custom retrieval strategies per query type
- Multiple LLMs for different tasks (routing, generation, validation)
- Plugin architecture for extending with new capabilities

---

## Context-Aware Generation (CAG)

**Intent**: Preload all relevant context into the LLM's context window, eliminating retrieval latency and complexity.

**When CAG beats RAG**:
- Small knowledge base (fits in context window)
- Low-latency requirements (no retrieval step)
- Highly curated content (no retrieval noise)
- Stable knowledge (infrequent updates)

**When RAG beats CAG**:
- Large knowledge base (exceeds context window)
- Frequently updated content
- Need for source attribution and citation
- Cost optimization (smaller context = fewer tokens)

**Hybrid approach**: CAG for core/stable knowledge + RAG for dynamic/extended knowledge.

---

## Chunking Strategies

| Strategy | Description | Best For |
|---|---|---|
| **Fixed-size** | Split by character/token count with overlap | Simple, predictable chunk sizes |
| **Semantic** | Split by topic/meaning boundaries | Preserving context coherence |
| **Sentence** | Split at sentence boundaries | Q&A, factual retrieval |
| **Paragraph** | Split at paragraph boundaries | Document-style content |
| **Recursive** | Hierarchically split (document → section → paragraph → sentence) | Long documents with structure |
| **Parent-child** | Store small chunks for retrieval, link to parent chunks for context | Precision retrieval + context |

**Overlap**: 10-20% overlap between chunks prevents information loss at boundaries.
**Metadata**: Every chunk stores: source document, position, creation date, access level, document type.
