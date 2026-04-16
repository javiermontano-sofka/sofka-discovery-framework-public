---
name: metodologia-aws-architecture-design
description: >
  Designs AWS cloud architectures for AI and GenAI workloads applying the Well-Architected Framework
  GenAI Lens (6 pillars: GENOPS, GENSEC, GENREL, GENPERF, GENCOST, GENSUS), AWS service selection
  matrices, RAG/Agent/Fine-Tuning patterns, cost optimization strategies, and enterprise reference
  architectures. Activated when designing, evaluating, or migrating AI systems on AWS.
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

# AWS Architecture Design for AI/GenAI Workloads

Diseñar, evaluar y optimizar arquitecturas AWS para sistemas de inteligencia artificial y AI generativa,
aplicando el Well-Architected Framework con GenAI Lens, patrones arquitectónicos probados, y matrices
de selección de servicios que equilibren rendimiento, costo, seguridad y sostenibilidad.

---

## Principio Rector

1. **Well-Architected First** — Toda decisión arquitectónica se evalúa contra los 6 pilares del GenAI Lens (Operational Excellence, Security, Reliability, Performance Efficiency, Cost Optimization, Sustainability). No se aprueba un diseño que viole cualquier pilar sin un ADR explícito documentando el trade-off.

2. **Service-Native over Custom** — Preferir servicios gestionados de AWS (Bedrock, SageMaker, OpenSearch Serverless, Bedrock Guardrails) sobre implementaciones custom. Solo justificar custom cuando los requisitos excedan las capacidades del servicio gestionado con evidencia medible.

3. **Cost-Aware by Design** — El costo no es una optimización posterior; es una restricción de diseño desde la primera iteración. Model tiering (Haiku→Sonnet→Opus), batch inference (50% savings), semantic caching, y provisioned throughput son decisiones arquitectónicas, no operacionales.

---

## Inputs

```
Parámetros:
  MODO:     [assessment | design | migration | optimization]
  FORMATO:  [ejecutivo | técnico | híbrido]
  VARIANTE: [rag | agents | fine-tuning | multi-model | streaming | batch | full]
  ESCALA:   [startup | growth | enterprise]

Detección automática:
  - Si existe infrastructure/ o cdk/ o cloudformation/ → MODO=optimization
  - Si existe sagemaker/ o bedrock/ → VARIANTE detectada del código
  - Si el input menciona "migrar" o "mover a AWS" → MODO=migration
  - Default: MODO=design, VARIANTE=full, ESCALA=growth
```

---

## When to Use

- Diseñar una nueva arquitectura AI/GenAI sobre AWS
- Evaluar una arquitectura existente contra Well-Architected GenAI Lens
- Seleccionar servicios AWS para componentes de AI (vector stores, compute, orchestration)
- Migrar workloads de AI de on-premise o otro cloud a AWS
- Optimizar costos de inferencia, training, o almacenamiento en AWS
- Diseñar patrones RAG, Agents, o Fine-Tuning con servicios nativos AWS

## When NOT to Use

- Arquitectura AI cloud-agnostic sin preferencia de proveedor → usar `ai-software-architecture`
- Diseño de pipelines ML sin especificidad AWS → usar `ai-pipeline-architecture`
- Patrones de diseño AI independientes de infraestructura → usar `ai-design-patterns`
- Arquitectura GenAI conceptual sin implementación AWS → usar `genai-architecture`
- Multi-cloud con AWS como componente menor → usar `cloud-native-architecture`

---

## Delivery Structure

### S1: Well-Architected Assessment for GenAI

Evaluar el workload contra los 6 pilares del GenAI Lens.

```
Load references:
  Read ${CLAUDE_SKILL_DIR}/references/well-architected-genai-lens.md
```

**Entregable**: Scorecard por pilar con findings categorizados.

| Pilar | Código | Evaluación | Findings |
|-------|--------|------------|----------|
| Operational Excellence | GENOPS01-05 | Score 1-5 | Lista de gaps |
| Security | GENSEC01-06 | Score 1-5 | Lista de gaps |
| Reliability | GENREL01-06 | Score 1-5 | Lista de gaps |
| Performance Efficiency | GENPERF01-04 | Score 1-5 | Lista de gaps |
| Cost Optimization | GENCOST01-05 | Score 1-5 | Lista de gaps |
| Sustainability | GENSUS01-03 | Score 1-5 | Lista de gaps |

Para cada finding: clasificar como HIGH / MEDIUM / LOW risk, proponer remediation con servicio AWS específico.

**Métricas clave por pilar**:
- GENOPS: Model evaluation automation %, prompt template version control
- GENSEC: Guardrail coverage %, PII detection rate, prompt injection test pass rate
- GENREL: Inference availability (target 99.9%+), P99 latency, RTO/RPO
- GENPERF: Tokens/sec, P95 inference latency, resource utilization %
- GENCOST: Cost per 1K tokens by model tier, batch vs real-time ratio, cache hit rate
- GENSUS: Smallest viable model adoption %, serverless compute ratio

### S2: AWS Service Selection & Architecture Patterns

Seleccionar servicios AWS óptimos para cada componente del sistema AI.

```
Load references:
  Read ${CLAUDE_SKILL_DIR}/references/aws-service-catalog.md
  Read ${CLAUDE_SKILL_DIR}/references/aws-genai-patterns.md
```

**Entregable**: Service mapping table + architecture diagram.

Proceso de selección por componente:

| Componente | Decisión | Criterios |
|------------|----------|-----------|
| Foundation Model Access | Bedrock vs SageMaker endpoint | Control level, model availability, pricing |
| Compute | Inferentia2 vs GPU vs Lambda | Latency requirements, volume, cost sensitivity |
| Vector Store | OpenSearch vs pgvector vs MemoryDB | Existing stack, query patterns, scale |
| Orchestration | Step Functions vs Bedrock Agents | Complexity, human-in-loop, custom logic |
| API Layer | API Gateway vs ALB+ECS | WebSocket needs, throttling, auth |
| Security | Bedrock Guardrails + WAF + IAM | Compliance requirements, PII sensitivity |
| Monitoring | CloudWatch + X-Ray + Model Monitor | Observability depth, custom metrics |

Para cada decisión: documentar alternativa descartada y razón con evidencia.

Patrones arquitectónicos (seleccionar según VARIANTE):
1. **RAG on AWS**: Bedrock KB / Custom pipeline con OpenSearch
2. **Agentic Workflows**: Bedrock Agents + Action Groups + Knowledge Bases
3. **Fine-Tuning**: Bedrock Fine-Tuning / SageMaker Training
4. **Multi-Model Routing**: Router Lambda + model tiering + cache
5. **Streaming GenAI**: Kinesis + Bedrock streaming + WebSocket API GW
6. **Batch Processing**: Step Functions + Bedrock Batch Inference + S3

### S3: RAG & Agent Architecture on AWS

Diseñar la arquitectura detallada de RAG y/o Agents usando servicios AWS nativos.

**Entregable**: Component diagram + data flow + configuration specs.

**RAG Architecture Decision Tree**:
1. ¿Managed o custom? → Bedrock Knowledge Bases (managed) vs Custom pipeline (control)
2. ¿Vector store? → OpenSearch Serverless (zero-ops) vs Aurora pgvector (existing PG) vs MemoryDB (low-latency)
3. ¿Chunking strategy? → Fixed-size / Semantic / Hierarchical (Bedrock KB soporta los 3)
4. ¿Hybrid search? → OpenSearch nativo (dense + sparse) vs custom reranking
5. ¿Embedding model? → Titan Embeddings v2 (cost) vs Cohere (quality) vs custom (SageMaker)

**Agent Architecture Decision Tree**:
1. ¿Managed o custom? → Bedrock Agents (declarative) vs LangChain on ECS (full control)
2. ¿Tools? → Action Groups (Lambda) con least privilege por función
3. ¿Knowledge? → Bedrock Knowledge Bases (integrated) vs custom RAG
4. ¿Guardrails? → Bedrock Guardrails (content filter + PII + topic denial)
5. ¿Memory? → DynamoDB (persistent) vs ElastiCache (ephemeral)
6. ¿Stopping conditions? → Max iterations + token budget + time limit

**Data Flow Template**:
```
Ingestion: S3 → [Lambda trigger] → Bedrock Embeddings → Vector Store
Query:     Client → API GW → Lambda → Vector Search → Bedrock Generation → Response
Agent:     Client → API GW → Bedrock Agent → [Action Group Lambda] → [KB RAG] → Response
```

### S4: Security & Compliance (GENSEC)

Diseñar la postura de seguridad para el workload GenAI en AWS.

**Entregable**: Security architecture diagram + controls matrix.

**Capas de seguridad (defense in depth)**:

| Capa | Servicio AWS | Control |
|------|-------------|---------|
| Perimetral | WAF + CloudFront | Prompt injection filtering, rate limiting |
| API | API Gateway + Cognito | AuthN/AuthZ, API keys, usage plans |
| Network | PrivateLink + VPC Endpoints | No internet exposure for model endpoints |
| Data in transit | TLS 1.2+ | Encrypted API calls to Bedrock/SageMaker |
| Data at rest | KMS (CMK) | Model artifacts, training data, vector stores |
| Content safety | Bedrock Guardrails | PII redaction, topic denial, content filtering |
| PII detection | Amazon Macie | Scan training data, S3 buckets |
| Audit | CloudTrail + Security Hub | All model invocations logged, centralized findings |
| Agent scope | IAM + Action Groups | Least privilege per Lambda, tool whitelisting |

**OWASP Top 10 for LLMs — AWS Mitigations**:
- LLM01 Prompt Injection → WAF rules + Bedrock Guardrails input filtering
- LLM02 Insecure Output → Bedrock Guardrails output filtering + application validation
- LLM03 Training Data Poisoning → Macie + data provenance in S3 + versioning
- LLM06 Sensitive Information → Bedrock Guardrails PII redaction + Macie scanning
- LLM08 Excessive Agency → Action Group scope limits + human approval (Step Functions)

### S5: Cost Optimization & FinOps for GenAI

Diseñar la estrategia de optimización de costos para workloads GenAI en AWS.

**Entregable**: Cost model + optimization roadmap.

**Cost Levers (mayor a menor impacto)**:

| Lever | Savings | Implementation |
|-------|---------|----------------|
| Model tiering | 60-90% | Haiku for simple, Sonnet for standard, Opus for complex |
| Batch inference | 50% | Bedrock batch for non-real-time workloads |
| Provisioned throughput | 30-50% | Committed capacity for predictable workloads |
| Semantic caching | 20-40% | ElastiCache similarity cache for repeated queries |
| Prompt optimization | 10-30% | Compression, fewer examples, shorter system prompts |
| AI silicon | 40-50% | Inferentia2 (inference), Trainium (training) vs GPU |
| Vector quantization | 50-75% storage | Reduce embedding dimensions, binary quantization |

**Cost Tracking Architecture**:
```
Bedrock/SageMaker → CloudWatch Metrics → Cost Explorer (per-model tags)
                  → AWS Budgets (alerts per model/team/project)
                  → Cost & Usage Report (per-invocation attribution)
```

**FinOps Cadence**:
- Daily: Token usage by model tier (CloudWatch dashboard)
- Weekly: Cost anomaly detection (AWS Cost Anomaly Detection)
- Monthly: Model tier optimization review, batch vs real-time ratio analysis
- Quarterly: Provisioned throughput commitment review, silicon evaluation

### S6: Reliability & Performance at Scale

Diseñar para alta disponibilidad, rendimiento consistente, y escalabilidad en AWS.

**Entregable**: Reliability architecture + performance baselines + scaling plan.

**Reliability Patterns**:

| Pattern | AWS Implementation |
|---------|-------------------|
| Multi-AZ inference | SageMaker multi-AZ endpoints, OpenSearch multi-AZ |
| Multi-region | Bedrock cross-region inference profiles, S3 CRR |
| Fallback cascade | Primary model → Secondary → Cache → Graceful degradation |
| Circuit breaker | Lambda + DynamoDB state, API Gateway throttling |
| Request queuing | SQS for async inference, dead-letter for failures |
| Health monitoring | Route 53 health checks, CloudWatch alarms, auto-recovery |

**Performance Baselines** (establecer antes de producción):

| Metric | Target | Measurement |
|--------|--------|-------------|
| Inference latency P50 | < 500ms | CloudWatch Bedrock metrics |
| Inference latency P99 | < 2s | CloudWatch Bedrock metrics |
| RAG retrieval latency | < 200ms | X-Ray trace segments |
| Embedding generation | < 100ms | CloudWatch custom metric |
| Availability | 99.9%+ | Route 53 + CloudWatch composite alarm |
| Throughput | Per SLA | Provisioned throughput or auto-scaling |

**Scaling Strategy**:
- **Bedrock**: On-demand (auto-scales) → Provisioned throughput (guaranteed)
- **SageMaker**: Auto-scaling policies (target tracking on InvocationsPerInstance)
- **OpenSearch Serverless**: OCU auto-scaling (search + indexing)
- **Lambda**: Concurrency limits + provisioned concurrency for cold starts
- **ECS/Fargate**: Target tracking on CPU/memory + step scaling

---

## Trade-off Matrix

| Dimension | Bedrock Managed | SageMaker Custom | Hybrid |
|-----------|----------------|-----------------|--------|
| Time-to-market | ★★★★★ | ★★☆☆☆ | ★★★☆☆ |
| Model flexibility | ★★★☆☆ | ★★★★★ | ★★★★★ |
| Operational burden | ★★★★★ (zero-ops) | ★★☆☆☆ | ★★★☆☆ |
| Cost control | ★★★☆☆ | ★★★★★ | ★★★★☆ |
| Customization | ★★☆☆☆ | ★★★★★ | ★★★★☆ |
| Security posture | ★★★★★ | ★★★★☆ | ★★★★☆ |
| Multi-region | ★★★★☆ | ★★★☆☆ | ★★★☆☆ |

---

## Assumptions

1. El cliente tiene o puede obtener una cuenta AWS con acceso a Bedrock en la región requerida
2. Los modelos foundation necesarios están disponibles en la región AWS del cliente
3. Los requisitos de residencia de datos son compatibles con las regiones AWS disponibles
4. El equipo tiene conocimiento básico de AWS (IAM, VPC, S3) o hay capacitación planificada
5. Los datos de entrenamiento/RAG no contienen restricciones legales que impidan su uso en servicios gestionados AWS

---

## Limits

1. NO genera código IaC (CDK/CloudFormation/Terraform) — define la arquitectura que el equipo implementa
2. NO reemplaza un AWS Solutions Architect review — complementa con perspectiva AI-first
3. NO incluye pricing exacto — los precios AWS cambian; se proporcionan magnitudes y estrategias
4. NO cubre servicios en preview/beta — solo GA (Generally Available)
5. NO diseña la lógica de negocio de la aplicación — solo la infraestructura y servicios AI

---

## Edge Cases

1. **Modelo no disponible en la región**: Documentar cross-region inference profile como solución. Si compliance impide cross-region, evaluar SageMaker con modelo self-hosted como alternativa.

2. **Workload con picos extremos (100x baseline)**: Diseñar con SQS queue + async inference. Provisioned throughput para baseline, on-demand para picos, batch para backlog.

3. **Migración desde otro cloud (GCP/Azure)**: Mapear servicios equivalentes (Vertex AI→Bedrock, Azure OpenAI→Bedrock), identificar vendor lock-in points, diseñar abstraction layer si multi-cloud es requisito futuro.

4. **Regulación estricta (HIPAA, PCI-DSS, SOX)**: Activar BAA para Bedrock, VPC-only deployment, KMS CMK, CloudTrail con log file validation, Macie continuous scan. Documentar compliance matrix.

5. **Presupuesto extremadamente limitado**: Priorizar Bedrock on-demand (sin upfront), Lambda para compute, Aurora Serverless v2 con pgvector (si ya existe), Bedrock batch inference para todo lo que tolere latencia.

---

## Validation Gate

Antes de entregar, verificar:

- [ ] Cada componente tiene servicio AWS asignado con alternativa documentada
- [ ] Los 6 pilares Well-Architected GenAI Lens están evaluados con score
- [ ] Security: Guardrails + IAM + PrivateLink + KMS configurados
- [ ] Cost model incluye estimación por modelo tier y estrategia de optimización
- [ ] Reliability: Multi-AZ mínimo, fallback cascade definido, RTO/RPO declarado
- [ ] Performance baselines definidos (P50, P95, P99 latency targets)
- [ ] Anti-patterns del catálogo AWS verificados como ausentes en el diseño
- [ ] Diagrama de arquitectura incluye todas las capas (Client→API→App→FM→Data→Observability)
- [ ] Cross-references a skills complementarios incluidos

---

## Cross-References

| Skill | Relación |
|-------|----------|
| `ai-software-architecture` | Arquitectura interna del sistema AI (este skill diseña la infra AWS) |
| `genai-architecture` | Patrones GenAI cloud-agnostic (este skill los implementa en AWS) |
| `ai-pipeline-architecture` | Pipelines AI conceptuales (este skill los mapea a servicios AWS) |
| `ai-design-patterns` | Patrones y tácticas AI (este skill los despliega en AWS) |
| `ai-testing-strategy` | Estrategia de testing (este skill define la infra AWS para testing) |
| `ai-conops` | CONOPS del sistema (este skill implementa los modos operacionales en AWS) |
| `cloud-migration` | Migración cloud (este skill se especializa en AI workloads) |
| `finops` | FinOps general (este skill se especializa en costos GenAI) |
| `security-architecture` | Seguridad general (este skill añade GENSEC para AI) |
| `solutions-architecture` | Diseño de solución (este skill se especializa en AI en AWS) |

---

## Output Format Protocol

```
if FORMATO == "ejecutivo":
  Resumen 1 página + diagrama de arquitectura + cost summary + top 5 recommendations
  Audiencia: C-Level, decisores de inversión

if FORMATO == "técnico":
  Full 6-section delivery + service mapping tables + configuration specs
  Audiencia: Arquitectos, DevOps, ML Engineers

if FORMATO == "híbrido":
  Executive summary (1 página) + Technical deep-dive (S1-S6 completos)
  Audiencia: Technical leads que reportan a C-Level
```

## Output Artifact

```
## {System Name} — AWS Architecture for AI/GenAI

### Executive Summary
[1 párrafo: objetivo, patrón seleccionado, servicios clave, costo estimado magnitud]

### Well-Architected Scorecard
[S1 scorecard table — 6 pilares con scores y top findings]

### Architecture Diagram
[ASCII o Mermaid — todas las capas del reference architecture]

### Service Selection
[S2 service mapping — cada componente con servicio, alternativa, justificación]

### {Pattern} Architecture Detail
[S3 — RAG/Agent/Fine-Tuning design específico]

### Security Controls
[S4 — defense in depth layers + OWASP LLM mitigations]

### Cost Model
[S5 — cost levers, FinOps cadence, optimization roadmap]

### Reliability & Performance
[S6 — reliability patterns, performance baselines, scaling strategy]

### Validation Checklist
[Checklist completado con evidencia]

### ADRs
[Decisiones arquitectónicas clave con contexto y trade-offs]
```
