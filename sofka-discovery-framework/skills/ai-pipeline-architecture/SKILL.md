---
name: metodologia-ai-pipeline-architecture
description: >
  AI pipeline architecture design — development pipelines, production pipelines, data stores, model registry, CI/CD for AI,
  and non-functional requirements. This skill should be used when the user asks to "design AI pipelines", "architect ML pipelines",
  "select data stores for AI", "design model registry", "implement CI/CD for ML", "define AI pipeline requirements",
  or mentions MLOps, training pipeline, inference pipeline, feature pipeline, Blue and Gold deployment, or pipeline patterns.
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

# AI Pipeline Architecture: Development & Production Pipelines for AI Systems

AI pipeline architecture defines how data flows through AI systems — from raw ingestion through model training and serving to production monitoring. This skill produces comprehensive pipeline architecture documentation covering development pipelines (experimentation to model artifact), production pipelines (data ingestion to prediction delivery), data store selection, model registry design, CI/CD strategy, and measurable requirements.

## Principio Rector

**El pipeline es la arquitectura. El modelo es solo un componente dentro de el.** La mayoria del esfuerzo en sistemas de IA de produccion esta en la infraestructura de datos, no en el algoritmo. Un pipeline mal disenado convierte un buen modelo en un sistema fragil. Un pipeline bien disenado permite que modelos mediocres evolucionen.

### Filosofia de Pipeline Architecture

1. **Dos pipelines, un registro.** Development pipeline y production pipeline son sistemas distintos con requisitos distintos (experimentacion vs. confiabilidad). El model registry es el puente que los conecta. Sin registro, no hay reproducibilidad.
2. **Data quality es el primer gate, no el ultimo test.** En pipelines de IA, basura entra, basura sale — con la agravante de que el modelo amplifica los sesgos de datos malos. Quality gates al inicio del pipeline, no al final.
3. **Blue y Gold, no YOLO deploy.** Desplegar un modelo nuevo directamente a produccion es irresponsable. La estrategia Blue (produccion) y Gold (staging con validacion) garantiza que ningun modelo llega a usuarios sin pasar gates automatizados.

## Inputs

The user provides a system or project name as `$ARGUMENTS`. Parse `$1` as the **system/project name** used throughout all output artifacts.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 dev pipeline + S2 prod pipeline + S5 CI/CD) | `tecnica` (full 6 sections, default)

Before generating architecture, detect the codebase context:

```
!find . -name "*.py" -o -name "Dockerfile" -o -name "*.yaml" -o -name "*.yml" | head -30
```

Detect ML frameworks (PyTorch, TensorFlow, scikit-learn), orchestrators (Airflow, Dagster, Prefect, Kubeflow), and serving frameworks (TensorFlow Serving, TorchServe, Triton, vLLM).

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/pipeline-patterns.md
Read ${CLAUDE_SKILL_DIR}/references/data-stores.md
Read ${CLAUDE_SKILL_DIR}/references/requirements-tables.md
```

---

## When to Use

- Designing data and model pipelines for new AI systems
- Evaluating existing pipeline architecture against production requirements
- Selecting data store technologies for AI workloads (relational, object, key-value, graph, vector)
- Designing model registry and versioning strategy
- Implementing CI/CD for ML (Blue and Gold deployment)
- Defining non-functional requirements for AI pipelines (performance, security, compliance)
- Planning pipeline evolution from experimental notebooks to production infrastructure

## When NOT to Use

- Internal module boundaries and layer architecture → **metodologia-ai-software-architecture**
- CONOPS and operational concept → **metodologia-ai-conops**
- Design pattern selection and system tactics → **metodologia-ai-design-patterns**
- Testing strategy → **metodologia-ai-testing-strategy**
- GenAI/LLM-specific patterns (RAG, agents) → **metodologia-genai-architecture**
- Infrastructure provisioning and platform design → **metodologia-infrastructure-architecture**

---

## Delivery Structure: 6 Sections

### S1: Development Pipeline Architecture

Maps the experimentation-to-artifact pipeline where models are built, trained, and validated.

**Stages:**
- **Data Quality Checks**: Schema validation, anomaly detection, distribution analysis, business rule verification
- **Data Transforms**: Feature engineering, normalization, encoding, embedding generation
- **Data Summary**: Statistical profiling, correlation analysis, class balance assessment
- **Model Building**: Algorithm selection, architecture definition, initial training
- **Model Tuning**: Hyperparameter optimization, cross-validation, regularization
- **Model Verification**: Holdout evaluation, fairness testing, robustness assessment, explainability scoring
- **Code Commit**: Model artifacts + code + configs registered in model registry with full lineage
- **CI/CD Dev Ops**: Automated pipeline testing, artifact validation, security scanning

**Key decisions:**
- Experiment tracking tool (MLflow, W&B, Neptune, SageMaker Experiments)
- Training orchestration (Kubeflow Pipelines, Vertex AI, SageMaker Pipelines, Airflow)
- Reproducibility strategy (data versioning, environment pinning, seed management)

### S2: Production Pipeline Architecture

Maps the data-to-prediction pipeline that serves AI capabilities in production.

**Stages:**
- **Data Cleansing**: Automated validation, anomaly detection, quality enforcement with feedback loops
- **Data Transformation**: Feature computation via feature store, embedding generation, format conversion
- **Model Execution**: Prediction generation with model registry integration, A/B testing, monitoring hooks
- **Results Store**: Prediction storage, feature attribution, explanation logging, BI integration
- **Pipeline Operations**: Monitoring, alerting, self-healing, visualization, configurable logging

**Key decisions:**
- Batch vs. streaming vs. hybrid pipeline topology
- Feature store adoption (Feast, Tecton, Vertex AI Feature Store, or custom) → evolving toward Feature Platform (compute + store + monitoring + governance as integrated platform)
- Model serving framework (TF Serving, TorchServe, Triton, vLLM, SageMaker Endpoints)
- Monitoring granularity (sample rate, logging level, retention policy)
- Streaming pipeline pattern (Kappa for pure streaming, Lambda for batch+streaming hybrid)

### S3: Data Store Technology Selection

Selects appropriate storage technologies for each pipeline component.

**Store types and AI use cases:**
- **Relational** (PostgreSQL, MySQL): Metadata, experiment tracking, model registry, audit trails
- **Object** (S3, GCS): Training data, model artifacts, archives
- **Key-Value** (Redis, DynamoDB): Feature serving cache, prediction cache, real-time lookup
- **Graph** (Neo4j): Knowledge graphs, entity relationships, fraud networks
- **Vector** (Pinecone, Qdrant, pgvector): Embedding storage, semantic search, RAG retrieval

**Selection criteria:** Query complexity, latency requirements, scale, consistency model, cost, AI-native capability.

**Multi-store pattern:** Most production AI systems combine 3-4 store types with synchronization and lineage tracking across boundaries.

### S4: Model Registry & Versioning

Designs the bridge between development and production pipelines.

**Registry capabilities:**
- Model artifact storage with version history
- Metadata: training metrics, data hash, hyperparameters, lineage
- Stage management: Staging → Canary → Production → Archived
- Access control and approval workflows
- A/B experiment configuration
- Rollback support with instant reversion

**Key decisions:**
- Registry tool (MLflow, SageMaker Model Registry, Vertex AI, W&B)
- Versioning strategy (semantic versioning, timestamp-based, hash-based)
- Promotion workflow (automated gates vs. manual approval vs. hybrid)
- Multi-model coordination (dependent models, ensemble management)

### S5: CI/CD for AI (Blue & Gold)

Designs the deployment strategy connecting development artifacts to production serving.

**Blue Pipeline** (Production): Currently serving, fully validated, rollback target.
**Gold Pipeline** (Staging): New version under validation, receives shadow/canary traffic.

**Validation gates:**
1. Model validation: accuracy, AUC, fairness, robustness meet thresholds
2. Feature validation: distributions match expected profiles
3. Data quality: input data passes schema and quality checks
4. Performance: latency and throughput within SLA
5. Security: no new vulnerabilities, access controls intact
6. Regression: no degradation vs. current Blue performance

**Promotion flow:** Gold passes all gates → canary traffic → gradual shift → full promotion → Gold becomes Blue → previous Blue archived.

**Key decisions:**
- Canary percentage and duration
- Automated vs. manual gate approval
- Rollback trigger criteria
- Pipeline-level vs. model-level deployment

### S6: Requirements Framework (AP/NF/SEC/CP)

Defines measurable requirements across four categories with thresholds and objectives.

**Performance (AP-1 to AP-13):** Data processing speed, model accuracy, fairness, explainability, robustness.

**Non-Functional (NF-1 to NF-9):** Availability (>99.9%), recovery time (<1 min), fault detection (<0.5 secs), drift detection (<1 hour), pipeline isolation.

**Security (SEC-1 to SEC-6):** PKI for external interfaces, audit logging, adversarial protection, data access controls, model extraction monitoring.

**Compliance (CP-1 to CP-7):** Authorized data access, transaction archival, encryption at rest/in use, audit trails, model governance workflows.

---

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Batch Pipeline** | Simple, cost-effective, easy debugging | High latency, not real-time | Offline analytics, nightly retraining |
| **Streaming Pipeline** | Real-time predictions, low latency | Complex, exactly-once semantics hard | Real-time fraud, recommendations |
| **Hybrid Pipeline** | Best of both, flexible | Two systems to maintain, consistency | Most production AI systems |
| **Feature Store** | Consistency, reuse, drift monitoring | Infra overhead, governance cost | Multiple models sharing features |
| **Blue & Gold CI/CD** | Safe deployments, instant rollback | Doubled infrastructure during validation | All production AI systems |
| **Single Model Registry** | Central governance, clear lineage | Single point of failure, access bottleneck | Standard team size |
| **Distributed Registry** | Team autonomy, reduced bottleneck | Consistency challenges, governance complexity | Large multi-team orgs |

---

## Assumptions

- Team has or will build experience with ML pipeline orchestration
- Infrastructure supports the compute requirements for training and inference
- Data sources are identified and access is available or negotiable
- Model registry and CI/CD are organizational priorities (not afterthoughts)
- Monitoring and observability budget is allocated

## Limits

- Focuses on *pipeline architecture*, not infrastructure provisioning (see **metodologia-infrastructure-architecture**)
- Does not design *internal module structure* (see **metodologia-ai-software-architecture**)
- Does not select *design patterns or tactics* (see **metodologia-ai-design-patterns**)
- Does not define *testing strategy* beyond pipeline gates (see **metodologia-ai-testing-strategy**)
- GenAI-specific pipelines (RAG indexing, agent orchestration) require **metodologia-genai-architecture**
- AWS-specific pipeline services (SageMaker Pipelines, Step Functions, Bedrock) covered by **metodologia-aws-architecture-design**

---

## Edge Cases

**Notebook-to-Production Migration:**
Data scientists work in Jupyter notebooks; production requires orchestrated pipelines. Bridge with notebook-aware orchestrators (Papermill, Ploomber). Prioritize extracting feature engineering and model training into reusable pipeline stages.

**Multi-Team Pipeline Ownership:**
Different teams own different pipeline stages (data eng owns ingestion, ML eng owns training, platform owns serving). Clear data contracts between stages are essential. Feature store becomes the coordination point.

**Real-Time + Batch Hybrid:**
System needs both real-time predictions (online serving) and batch analytics (offline scoring). Lambda or Kappa architecture patterns. Feature store must support both online (low-latency) and offline (batch) serving.

**Regulated Pipeline (Finance, Healthcare):**
Every pipeline stage must produce audit-worthy artifacts. Data lineage tracking from source to prediction. Model governance gates require human approval before production promotion.

---

## Validation Gate

Before finalizing delivery, verify:

- [ ] Development and production pipelines are designed as separate systems connected by model registry
- [ ] Each pipeline stage has defined inputs, outputs, and quality gates
- [ ] Data store selection justified by workload characteristics (not technology preference)
- [ ] Model registry design includes versioning, lineage, staging, and rollback
- [ ] CI/CD strategy uses Blue & Gold (or equivalent staged deployment)
- [ ] Validation gates cover model quality, data quality, performance, security, and regression
- [ ] Requirements framework includes all four categories (AP, NF, SEC, CP) with thresholds
- [ ] Training-serving skew risk explicitly addressed in pipeline design
- [ ] Monitoring strategy covers all pipeline stages (not just model serving)
- [ ] Pipeline architecture is deployable (not just theoretical)

---

## Cross-References

- **metodologia-ai-software-architecture**: Provides module structure context; receives pipeline as component
- **metodologia-ai-conops**: Provides operational requirements and success metrics
- **metodologia-ai-design-patterns**: Patterns applied within pipeline stages (Feature Store, Champion-Challenger)
- **metodologia-ai-testing-strategy**: Testing strategy for pipeline validation and integration
- **metodologia-genai-architecture**: GenAI-specific pipeline patterns (RAG indexing, embedding pipelines)
- **metodologia-infrastructure-architecture**: Provides compute and storage platform for pipelines
- **metodologia-aws-architecture-design**: Maps pipeline components to AWS services (SageMaker, Step Functions, Bedrock)
- **metodologia-devsecops-architecture**: Pipeline security controls and supply chain security

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | Yes | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

## Output Artifact

**Primary:** `A-02_AI_Pipeline_Architecture_Deep.html` — Development pipeline diagram, production pipeline diagram, data store selection matrix, model registry design, Blue & Gold CI/CD flow, requirements framework tables.

**Secondary:** Pipeline stage contracts (.md), data store comparison matrix, model registry workflow diagram (Mermaid/PNG/SVG), requirements checklist.

---
**Fuente**: Avila, R.D. & Ahmad, I. (2025). *Architecting AI Software Systems*. Packt.
