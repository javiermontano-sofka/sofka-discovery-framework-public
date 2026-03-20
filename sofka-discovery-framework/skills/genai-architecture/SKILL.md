---
name: metodologia-genai-architecture
description: >
  Generative AI architecture — RAG patterns, LLM orchestration, multi-model tiering, agent workflow design, vector database
  architecture, knowledge connectors, and GenAI quality assurance. This skill should be used when the user asks to "design RAG
  architecture", "architect LLM system", "select vector database", "design AI agents", "implement knowledge retrieval",
  "plan GenAI quality", or mentions RAG, embeddings, vector search, LLM orchestration, agent framework, context-aware
  generation, hallucination reduction, or multi-model routing.
model: opus
context: fork
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# GenAI Architecture: Architecture for Generative AI Systems

GenAI architecture defines how LLM-powered systems retrieve knowledge, orchestrate models, execute agent workflows, and ensure quality. This skill produces comprehensive architecture documentation covering RAG design, LLM orchestration with multi-model tiering, agent workflows, vector database selection, knowledge connector integration, and quality assurance for generative AI systems.

## Principio Rector

**RAG no es un feature — es una arquitectura.** Conectar un LLM a una base de datos vectorial no es RAG. RAG es un pipeline completo: query processing, retrieval, re-ranking, context assembly, generation, validation. Cada etapa tiene decisiones arquitectonicas que determinan la calidad del sistema.

### Filosofia de GenAI Architecture

1. **Retrieval quality > Generation quality.** El LLM mas avanzado del mundo producira respuestas incorrectas si la informacion recuperada es irrelevante o incompleta. La inversion arquitectonica debe priorizar la calidad de retrieval (chunking, embeddings, re-ranking, hybrid search) sobre la seleccion del LLM.
2. **Multi-model tiering, no model monolito.** Usar el modelo mas grande y costoso para cada consulta es insostenible. La arquitectura debe enrutar consultas al tier apropiado: modelos ligeros para tareas simples, modelos frontier para razonamiento complejo, cache para patrones conocidos.
3. **Guardrails son arquitectura, no afterthought.** Hallucination detection, safety filtering, PII masking, cost controls, y rate limiting son componentes arquitectonicos de primera clase, no checks opcionales que se agregan "despues del MVP".

## Inputs

The user provides a system or project name as `$ARGUMENTS`. Parse `$1` as the **system/project name** used throughout all output artifacts.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 RAG + S2 orchestration + S6 quality) | `tecnica` (full 6 sections, default)

Before generating architecture, detect the codebase context:

```
!find . -name "*.py" -o -name "*.ts" -o -name "*.yaml" -o -name "Dockerfile" | head -30
```

Detect LLM frameworks (LangChain, LlamaIndex, Haystack, Semantic Kernel), vector DBs (Pinecone, Qdrant, Weaviate, Chroma, pgvector), and embedding models.

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/rag-patterns.md
Read ${CLAUDE_SKILL_DIR}/references/llm-orchestration.md
Read ${CLAUDE_SKILL_DIR}/references/vector-db-comparison.md
```

---

## When to Use

- Designing RAG architecture for enterprise knowledge systems
- Selecting and configuring vector databases for embedding storage and retrieval
- Designing LLM orchestration with multi-model tiering and routing
- Architecting agent workflows with tool use, memory, and guardrails
- Integrating structured knowledge connectors (CRM, ERP, ITSM)
- Planning quality assurance for GenAI (hallucination reduction, grounding, continuous improvement)
- Evaluating CAG vs. RAG vs. hybrid approaches

## When NOT to Use

- Traditional ML model architecture (non-generative) -> **metodologia-ai-software-architecture**
- CONOPS and operational concept -> **metodologia-ai-conops**
- Data pipelines and ML CI/CD -> **metodologia-ai-pipeline-architecture**
- General AI design patterns (Feature Store, Drift Detection) -> **metodologia-ai-design-patterns**
- Testing strategy for AI systems -> **metodologia-ai-testing-strategy**
- Infrastructure provisioning for GenAI -> **metodologia-infrastructure-architecture**

---

## Delivery Structure: 6 Sections

### S1: RAG Architecture & Retrieval Design

Designs the complete retrieval-augmented generation pipeline from query to validated response.

**Pipeline stages:**
- **Query processing**: Entity extraction, intent classification, query expansion, query rewriting
- **Retrieval**: Vector similarity search, keyword search, hybrid retrieval, metadata filtering
- **Context assembly**: Chunk re-ranking, context window management, deduplication, source attribution
- **Generation**: Prompt construction, parameter tuning, streaming delivery
- **Validation**: Hallucination detection, factual grounding, format compliance, safety filtering

**RAG variants:**
- Naive RAG (prototype only), Advanced RAG (production standard), Modular RAG (extensible)
- GraphRAG: Knowledge graph-enhanced retrieval for entity-rich domains — combines vector similarity with graph traversal for relationship-aware context
- Agentic RAG: Agent-driven retrieval with iterative search, query decomposition, and self-evaluation loops

**CAG alternative:** Preload all context into LLM window — viable for small, stable knowledge bases.

**Key decisions:**
- Chunking strategy (fixed-size, semantic, recursive, parent-child)
- Retrieval approach (vector-only, keyword-only, hybrid with RRF)
- Re-ranking method (cross-encoder, LLM-based, reciprocal rank fusion)
- Context window budget allocation (system prompt, context, query, output reserve)
- CAG vs. RAG vs. hybrid based on knowledge base size and update frequency

### S2: LLM Orchestration & Multi-Model Tiering

Designs the model routing and orchestration layer for cost-effective, performant LLM usage.

**Tier structure:**
- **Tier 1 (Primary)**: Frontier models for complex reasoning and generation
- **Tier 2 (Secondary)**: Mid-size models for standard tasks
- **Tier 3 (Lightweight)**: Small/specialized models for simple operations
- **Tier 4 (Fallback)**: Rule-based or cached responses

**Routing logic:**
- Complexity classification (lightweight model or heuristic)
- Confidence-based escalation (low confidence → higher tier)
- Cost-aware routing (budget constraints per query/user/session)
- Latency-aware routing (SLA requirements constrain tier)
- Fallback cascade (progressive degradation through tiers)

**Key decisions:**
- Model selection per tier (vendor, version, fine-tuned vs. general)
- Routing strategy (rule-based, classifier-based, hybrid)
- Cost budget per query, per user, per time period
- Caching strategy for repeated or similar queries
- Provider redundancy (multi-vendor for availability)

### S3: Agent Workflow Architecture

Designs agentic AI systems with tool use, reasoning, and multi-step execution.

**Core agent flow:**
Query Input -> Entity Extraction -> Intent Classification -> Intelligent Routing -> Contextual Augmentation -> Response Generation -> Validation -> Output

**Tool architecture:**
- Knowledge tools: vector DB search, SQL queries, web search, document retrieval
- Action tools: API calls (CRM, ERP, ITSM), code execution, notifications
- Reasoning tools: calculator, code interpreter, sub-agent delegation
- MCP (Model Context Protocol) integration: standardized tool interface for interoperability across agent frameworks and LLM providers

**Tool governance:**
- Tool whitelisting per agent role
- Input/output validation for all tool calls
- Rate limiting and cost controls
- Timeout and circuit breaker per tool
- Audit logging of all tool invocations

**Key decisions:**
- Tool selection strategy (LLM-driven, rule-based, hybrid)
- Agent memory design (conversation history, working memory, long-term memory)
- Multi-agent orchestration (sequential, parallel, hierarchical)
- Human-in-the-loop triggers (low confidence, high stakes, tool errors)

### S4: Vector Database & Embedding Design

Selects vector database technology and designs the embedding pipeline.

**Vector DB selection criteria:** Scale, latency, accuracy (recall), metadata filtering, update frequency, cost, ecosystem integration.

**Index architecture patterns:**
- Single collection (small-medium knowledge base)
- Multi-collection (multi-domain, access control)
- Hierarchical index (document-level + chunk-level, two-stage retrieval)
- Hybrid index (vector + keyword with reciprocal rank fusion)

**Embedding pipeline:**
- Model selection (general-purpose, domain-specific, multilingual, code)
- Dimensionality considerations (quality vs. storage vs. search speed)
- Consistency requirement: same model for indexing and querying
- Fine-tuning strategy for domain-specific retrieval quality

**Operational design:**
- Incremental updates vs. full re-indexing
- Stale document detection and removal
- Backup, recovery, and disaster recovery
- Monitoring (query latency, recall quality, index growth)
- Cost optimization (quantization, tiered storage, caching)

**Key decisions:**
- Managed vs. self-hosted vector DB
- Embedding model selection and fine-tuning approach
- Index architecture (single, multi-collection, hierarchical, hybrid)
- Update strategy (real-time, batch, event-driven)

### S5: Knowledge Connectors & Integration

Designs integration with structured knowledge sources alongside unstructured RAG retrieval.

**Connector types:**
- **CRM** (Salesforce, HubSpot): Customer profiles, interaction history, account data
- **ERP** (SAP, Oracle): Product information, inventory, pricing, orders
- **ITSM** (ServiceNow, Jira SM): Ticket history, resolution patterns, known issues
- **Web Search**: Real-time information augmentation for time-sensitive queries
- **Internal APIs**: Custom business systems, microservices, data warehouses

**Security architecture:**
- Row-level security enforcement at connector level
- OAuth/SAML authentication for connector access
- Audit logging of all connector queries
- Data masking for sensitive fields (PII, financial)
- Rate limiting per user and per connector

**Integration patterns:**
- Real-time query (synchronous connector call during agent execution)
- Pre-cached context (batch sync of structured data into vector DB)
- Hybrid (real-time for transactional, cached for reference data)

**Key decisions:**
- Which structured sources to integrate (based on agent use cases)
- Authentication and authorization model per connector
- Data freshness requirements (real-time vs. cached)
- Fallback behavior when connector is unavailable

### S6: Quality Assurance for GenAI

Defines the quality framework for GenAI systems covering hallucination reduction, grounding, and continuous improvement.

**Hallucination reduction:**
- Factual grounding: verify every claim against retrieved context
- Citation enforcement: require source references in generated responses
- Confidence scoring: calibrated confidence per response or per claim
- Retrieval quality feedback: low-quality retrieval flagged before generation

**Evaluation framework:**
- **Retrieval quality**: Precision@K, Recall@K, MRR, NDCG — use RAGAS framework for automated RAG evaluation
- **Generation quality**: Faithfulness (grounded in context), relevance (answers the query), completeness, coherence — LLM-as-judge for scalable evaluation
- **End-to-end quality**: User satisfaction, task completion rate, hallucination rate, citation accuracy
- **Operational metrics**: Latency (P50, P95, P99), cost per query, token usage, cache hit rate
- **Agent quality**: Tool selection accuracy, task completion rate, loop detection, cost per task

**Continuous improvement cycle:**
1. Monitor: track quality metrics in production
2. Identify: detect degradation patterns (new topics, low-quality sources, drift)
3. Diagnose: root cause analysis (retrieval failure, generation error, missing knowledge)
4. Improve: update knowledge base, tune prompts, adjust retrieval parameters, fine-tune models
5. Validate: A/B test improvements against baseline

**Guardrails architecture:**
- Input guardrails: prompt injection detection, PII masking, topic scoping
- Output guardrails: hallucination detection, safety filtering, format validation
- Operational guardrails: cost controls, rate limiting, timeout enforcement
- Content guardrails: brand alignment, regulatory compliance, harmful content detection

**Key decisions:**
- Evaluation metrics selection (which metrics matter most for the use case)
- Human evaluation cadence (continuous sampling vs. periodic review)
- Improvement trigger criteria (what quality level triggers intervention)
- Guardrail strictness (block vs. warn vs. log)

---

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Advanced RAG** | High retrieval quality, production-grade | Complex pipeline, more infrastructure | Enterprise knowledge systems |
| **CAG (Context-Aware)** | Low latency, simple architecture | Limited knowledge size, no source attribution | Small, stable knowledge bases |
| **Multi-model tiering** | Cost optimization, appropriate quality per query | Routing complexity, multi-vendor management | High-volume production systems |
| **Agentic architecture** | Multi-step reasoning, tool use, autonomy | Complexity, unpredictable costs, safety risks | Complex workflows, multi-source tasks |
| **Managed vector DB** | Fast setup, low ops overhead | Vendor lock-in, less control, recurring cost | Teams without vector DB expertise |
| **Self-hosted vector DB** | Full control, no vendor lock-in | Ops burden, scaling responsibility | Teams with infra expertise, data residency requirements |
| **Hybrid retrieval** | Best of vector + keyword search | Two index systems, fusion complexity | Most production RAG systems |
| **Structured connectors** | Rich, accurate context from business systems | Integration complexity, security scope | Enterprise systems with CRM/ERP/ITSM |

---

## Assumptions

- Use case benefits from generative AI (not all AI problems need LLMs)
- Knowledge sources are identified and accessible
- LLM API access is available (cloud provider or self-hosted)
- Budget for LLM inference costs is allocated and bounded
- Team has or will build experience with LLM application patterns
- Data privacy and security requirements are understood

## Limits

- Focuses on *GenAI architecture*, not general ML architecture (see **metodologia-ai-software-architecture**)
- Does not design *traditional ML pipelines* (see **metodologia-ai-pipeline-architecture**)
- Does not select *general AI patterns* (see **metodologia-ai-design-patterns**)
- Does not define *comprehensive testing strategy* (see **metodologia-ai-testing-strategy**)
- Infrastructure provisioning for GenAI requires **metodologia-infrastructure-architecture**
- LLM fine-tuning methodology is out of scope (operational, not architectural)

---

## Edge Cases

**Enterprise with Strict Data Residency:**
Cloud-managed vector DBs may not meet data residency requirements. Self-hosted vector DB (Qdrant, Milvus) with region-specific deployment. Self-hosted LLM (vLLM, TGI) if data cannot leave premises. All connectors must enforce data residency at query level.

**Multi-Language Knowledge Base:**
Embedding model must support all required languages. Multilingual models (Cohere multilingual, mE5) for cross-language retrieval. Consider language-specific collections for highest quality. Query language detection for routing to appropriate collection.

**High-Volume, Low-Latency Requirements:**
CAG for core knowledge + aggressive caching + Tier 3 models for common queries. Pre-computed responses for high-frequency patterns. Streaming for perceived latency reduction. Vector DB with in-memory index for sub-millisecond retrieval.

**Rapidly Changing Knowledge:**
Real-time indexing pipeline for new documents. Stale content detection and automatic removal. Version-aware retrieval (prefer recent documents). Web search integration for real-time information not yet indexed.

**Multi-Tenant GenAI System:**
Namespace or collection isolation per tenant. Row-level security in structured connectors per tenant. Cost allocation and rate limiting per tenant. Tenant-specific fine-tuning or prompt customization.

---

## Validation Gate

Before finalizing delivery, verify:

- [ ] RAG pipeline designed with all stages (query processing, retrieval, assembly, generation, validation)
- [ ] Retrieval strategy justified (vector-only, keyword, hybrid) with rationale
- [ ] Chunking strategy selected based on content type and retrieval requirements
- [ ] LLM orchestration includes multi-model tiering with routing logic
- [ ] Agent workflow defined with tool governance (whitelist, validation, rate limits, audit)
- [ ] Vector DB selected based on evaluation criteria (not technology preference)
- [ ] Embedding model selected with consistency requirement documented
- [ ] Knowledge connectors designed with security model (row-level security, auth, audit)
- [ ] Quality framework includes hallucination reduction, evaluation metrics, and continuous improvement
- [ ] Guardrails are architectural components (input, output, operational, content)

---

## Cross-References

- **metodologia-ai-software-architecture**: GenAI components fit within the AI system module view
- **metodologia-ai-conops**: CONOPS defines interaction level and success metrics for GenAI system
- **metodologia-ai-pipeline-architecture**: Embedding pipeline and indexing pipeline are pipeline components
- **metodologia-ai-design-patterns**: Champion-Challenger and Canary apply to LLM model promotion
- **metodologia-ai-testing-strategy**: GenAI-specific tests (hallucination, retrieval quality) extend the testing matrix
- **metodologia-aws-architecture-design**: AWS-specific GenAI services (Bedrock, Bedrock Agents, Bedrock KB, OpenSearch Serverless)
- **metodologia-infrastructure-architecture**: GPU provisioning, vector DB hosting, LLM serving infrastructure
- **metodologia-security-architecture**: GenAI-specific security (prompt injection, data exfiltration, model access)

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | Yes | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

## Output Artifact

**Primary:** `A-05_GenAI_Architecture_Deep.html` — RAG pipeline diagram, LLM orchestration flow, agent workflow architecture, vector DB selection matrix, knowledge connector integration diagram, quality assurance framework.

**Secondary:** RAG pipeline specification (.md), vector DB evaluation matrix, agent tool catalog, embedding pipeline design, guardrails configuration, quality metrics dashboard specification.

---
**Fuente**: Avila, R.D. & Ahmad, I. (2025). *Architecting AI Software Systems*. Packt.
