---
name: metodologia-ai-architecture-implementation
description: >
  Guides implementation of AI system architectures — technology selection, pipeline implementation, model serving setup,
  monitoring deployment, and CI/CD automation. This skill should be used when the user asks to "implement AI architecture",
  "build ML pipeline", "set up model serving", "deploy AI system", "implement MLOps", "configure drift monitoring",
  "set up feature store", or mentions AI implementation plan, ML infrastructure setup, model deployment guide,
  RAG implementation, or agent framework setup.
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

# AI Architecture Implementation: From Design to Production

Guiar la implementación de arquitecturas AI desde el diseño hasta producción — selección de tecnología,
implementación de pipelines, configuración de serving, despliegue de monitoreo, y automatización CI/CD.
Produce blueprints de implementación, guías de selección de tecnología, y un playbook fase-a-fase que
transforma decisiones arquitectónicas en infraestructura operativa.

---

## Principio Rector

1. **Phased delivery, not big bang.** Implementar en fases con valor entregable por fase. Fase 0 (Foundation) → Fase 1 (Data Pipeline) → Fase 2 (Model Development) → Fase 3 (Serving) → Fase 4 (CI/CD) → Fase 5 (Monitoring). Cada fase produce capacidad usable.

2. **Start simple, evolve with evidence.** No sobre-ingenierar para escala hipotética. Empezar con la implementación más simple que resuelva el problema actual. Feature Store no es necesario para un modelo; multi-model tiering no es necesario para un tier.

3. **Tests and monitoring from Phase 0, not Phase 5.** La infraestructura de testing y monitoreo se establece en la primera fase, no se agrega después de incidentes. Cada componente implementado incluye sus tests y sus métricas desde el día uno.

---

## Inputs

```
Parámetros:
  MODO:        [greenfield | brownfield | remediation | migration]
  FORMATO:     [ejecutivo | técnico | híbrido]
  VARIANTE:    [pipeline | serving | genai | mlops | full]
  STACK:       [python | java | typescript | polyglot]
  INFRA:       [kubernetes | serverless | containers | hybrid]

Detección automática:
  - Si existe codebase → MODO=brownfield
  - Si existe audit report → MODO=remediation
  - Si el input menciona "migrar" → MODO=migration
  - Si existe LangChain/LlamaIndex → VARIANTE incluye genai
  - Default: MODO=greenfield, VARIANTE=full, STACK=python, INFRA=containers
```

---

## When to Use

- Implementar una arquitectura AI diseñada (output de ai-software-architecture o ai-pipeline-architecture)
- Seleccionar stack tecnológico para un nuevo sistema AI (frameworks, tools, databases)
- Implementar Feature Store, Model Registry, o Drift Detection desde cero
- Configurar CI/CD para ML (Blue & Gold deployment, validation gates)
- Desplegar sistema de monitoring y observabilidad para AI
- Implementar pipeline RAG completo (ingestion, chunking, embedding, retrieval, generation)
- Ejecutar roadmap de remediación de una auditoría de arquitectura AI
- Migrar de notebooks a producción (MLOps maturity progression)

## When NOT to Use

- Diseñar la arquitectura (antes de implementar) → **metodologia-ai-software-architecture**
- Auditar un sistema existente → **metodologia-ai-architecture-audit**
- Seleccionar patrones de diseño → **metodologia-ai-design-patterns**
- Definir estrategia de testing (sin implementar) → **metodologia-ai-testing-strategy**
- Implementar específicamente en AWS → **metodologia-aws-architecture-implementation**
- Implementar infraestructura cloud genérica → **metodologia-infrastructure-architecture**

---

## Delivery Structure: 6 Sections

### S1: Technology Stack Selection

Selecciona las tecnologías para cada componente del sistema AI con justificación basada en constraints.

```
Load references:
  Read ${CLAUDE_SKILL_DIR}/references/technology-selection.md
```

**Decision Framework:**
1. **Constraints**: Cloud provider, Kubernetes availability, team expertise, budget, regulations
2. **Workload type**: Traditional ML, Deep Learning, LLM Application, Agentic AI
3. **Scale**: Prototype, Production single-model, Production multi-model, Enterprise

**Selection matrix por componente:**

| Componente | Tecnología | Alternativa | Justificación |
|------------|-----------|-------------|---------------|
| ML Framework | [selección] | [alternativa] | [por qué] |
| Pipeline Orchestration | [selección] | [alternativa] | [por qué] |
| Experiment Tracking | [selección] | [alternativa] | [por qué] |
| Model Registry | [selección] | [alternativa] | [por qué] |
| Model Serving | [selección] | [alternativa] | [por qué] |
| Vector DB (si GenAI) | [selección] | [alternativa] | [por qué] |
| LLM Framework (si GenAI) | [selección] | [alternativa] | [por qué] |
| Data Quality | [selección] | [alternativa] | [por qué] |
| Monitoring | [selección] | [alternativa] | [por qué] |
| CI/CD | [selección] | [alternativa] | [por qué] |

**Entregable:** Stack decision document con ADRs por cada selección no-obvia.

### S2: Data Pipeline Implementation

Implementa el pipeline de datos desde ingestion hasta feature serving.

```
Load references:
  Read ${CLAUDE_SKILL_DIR}/references/implementation-blueprints.md
```

**Componentes a implementar:**
- Data ingestion (sources → raw store)
- Data quality gates (schema validation, distribution checks, business rules)
- Feature engineering (transformation logic, shared between training/serving)
- Feature store setup (if applicable — offline + online + registry)
- Data versioning (training datasets)
- Pipeline orchestration (DAGs, scheduling, retry logic)
- Data monitoring (drift, freshness, coverage)

**Blueprint selection:**
- Single model, simple features → direct pipeline, no feature store
- Multiple models, shared features → Feature Store (Blueprint 1)
- Streaming requirements → Kafka/Kinesis + streaming feature computation
- Batch only → Airflow/Dagster + batch transformation

**Entregable:** Implemented pipeline with tests, monitoring, and documentation.

### S3: Model Development & Registry Setup

Implementa el ciclo de desarrollo de modelos con tracking, registro, y evaluación.

**Componentes a implementar:**
- Experiment tracking setup (MLflow/W&B)
- Training pipeline (reproducible: code + data + config = model)
- Evaluation framework (accuracy, fairness, robustness, explainability)
- Model registry (artifact storage, metadata, versioning, staging)
- Hyperparameter optimization (Optuna/Ray Tune integration)
- Fairness testing suite (demographic parity, equal opportunity)
- Explainability integration (SHAP/LIME for traditional ML, attention for transformers)

**Blueprint selection:**
- MVP → MLflow local, manual training, basic evaluation
- Production → MLflow/W&B + automated training pipeline + full evaluation suite
- Enterprise → Full MLOps platform + governance workflows + compliance

**Entregable:** Training pipeline, experiment tracking, model registry operational.

### S4: Serving & Inference Implementation

Implementa model serving, API layer, caching, y fallback mechanisms.

**Componentes a implementar:**
- Model serving deployment (vLLM/Triton/TorchServe/Seldon)
- API layer (REST/gRPC endpoints, versioning, documentation)
- Authentication and authorization (API keys, OAuth, service mesh)
- Rate limiting (per-client, per-endpoint)
- Caching layer (prediction cache + semantic cache for GenAI)
- Circuit breaker (fallback cascade: model → cache → previous → denial)
- Load testing baseline (P50, P95, P99, max throughput)

**GenAI-specific implementation:**
- Guardrails system (input validation, output filtering, PII masking)
- RAG pipeline (Blueprint 5: ingestion, chunking, embedding, retrieval, generation)
- Agent framework (tool definitions, governance, memory, orchestration)
- Multi-model routing (Blueprint 6: tier assignment, cost tracking)

**Entregable:** Serving infrastructure operational, API documented, load tested.

### S5: CI/CD & Deployment Automation

Implementa Blue & Gold deployment con validation gates automatizados.

**Componentes a implementar:**
- Code CI (linting, type checking, unit tests, security scan)
- Data CI (data quality tests triggered on pipeline changes)
- Model CI (model quality tests triggered on model changes)
- Blue & Gold pipeline (Blue=production, Gold=staging with validation)
- Canary deployment (gradual traffic shift with metric monitoring)
- Rollback automation (one-click rollback to previous version)
- Promotion workflow (automated gates + configurable manual approval)

**Gate configuration:**
- Code quality gate: lint + type check + unit tests + security scan
- Data quality gate: schema + distribution + freshness
- Model quality gate: accuracy ≥ threshold + fairness ≥ threshold + latency ≤ SLA
- Regression gate: no accuracy drop > X% vs. current production
- Security gate: vulnerability scan + access control verification

**Entregable:** CI/CD pipeline operational, gates configured, rollback tested.

### S6: Monitoring & Observability Implementation

Implementa el stack de observabilidad completo para el sistema AI.

**Componentes a implementar:**
- Infrastructure monitoring (CPU, GPU, memory, storage, network)
- Application monitoring (request rate, error rate, latency)
- Model monitoring (accuracy tracking, prediction distribution, confidence)
- Data monitoring (input drift, feature freshness, quality violations)
- Drift detection system (Blueprint 3: statistical monitoring + alerts)
- Dashboards (executive, operations, ML, data)
- Alerting (thresholds, escalation policies, on-call integration)
- Runbooks (incident response for common AI failures)

**Dashboard hierarchy:**
- Executive: Business KPIs, model impact, cost summary
- Operations: System health, latency, errors, throughput
- ML: Model metrics, drift, fairness, prediction quality
- Data: Pipeline health, quality scores, freshness

**Entregable:** Full observability stack, dashboards, alerts, runbooks.

---

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|----------|---------|------------|-------------|
| **Managed MLOps platform** | Fast setup, integrated tools | Vendor lock-in, less customization | Teams without ML infra expertise |
| **Open-source stack** | Full control, no lock-in | Integration effort, operations burden | Teams with strong infra skills |
| **Monorepo** | Unified CI/CD, shared code | Build complexity, repo size | Small-medium teams, shared components |
| **Multi-repo** | Team autonomy, independent releases | Integration testing harder, code duplication | Large teams, independent services |
| **Kubernetes-native** | Scaling, orchestration, ecosystem | Complexity, K8s expertise required | Multi-model, high-scale systems |
| **Serverless** | Zero-ops, pay-per-use | Cold starts, limited customization | Event-driven, low-to-medium traffic |

---

## Assumptions

1. Arquitectura AI ya diseñada (output de ai-software-architecture, ai-pipeline-architecture, o similar)
2. Cloud provider y presupuesto definidos
3. Equipo técnico disponible con habilidades core (Python, ML basics, CI/CD)
4. Ambiente de desarrollo provisionado o provisionable
5. Acceso a datos de entrenamiento (o plan para obtenerlos)

## Limits

1. NO diseña la arquitectura — implementa una arquitectura ya diseñada
2. NO selecciona patrones — implementa patrones ya seleccionados (ver **metodologia-ai-design-patterns**)
3. NO genera modelos ML — implementa la infraestructura para entrenarlos y servirlos
4. Implementación AWS-específica requiere **metodologia-aws-architecture-implementation**
5. NO reemplaza la expertise del equipo — guía y estructura, no ejecuta en solitario

---

## Edge Cases

1. **Equipo sin experiencia ML**: Fase 0 extendida con capacitación. Empezar con managed services (SageMaker, Vertex). Reducir complejidad de Feature Store y multi-model tiering hasta que el equipo madure.

2. **Migración desde notebooks**: Priorizar extracción de feature engineering y training logic a módulos Python testeables. Notebooks quedan solo para exploración. Fase 2 se convierte en la fase más larga.

3. **Remediación post-auditoría**: Ordenar implementación por priority score del audit report, no por la secuencia estándar de fases. Puede requerir empezar por Fase 5 (monitoring) si el hallazgo crítico es "no hay observabilidad".

4. **Sistema GenAI puro (sin ML tradicional)**: Fases 2 y 3 se fusionan en "RAG/Agent Implementation". Feature Store no aplica. Focus en guardrails, vector DB, prompt management, cost controls.

5. **Restricciones de presupuesto extremas**: Open-source everything. MLflow (free), Feast (free), Evidently (free), GitHub Actions (free tier). Docker Compose para desarrollo, single-instance para producción inicial.

---

## Validation Gate

- [ ] Stack tecnológico seleccionado con ADR por cada decisión no-obvia
- [ ] Repository structure creada con tests y CI desde Fase 0
- [ ] Data pipeline implementado con quality gates operativos
- [ ] Feature store/pipeline produciendo features consistentes (training = serving)
- [ ] Model registry operativo con versioning, metadata, y staging workflow
- [ ] Serving layer operativo con API documentada y load tested
- [ ] Guardrails implementados (si GenAI) — input + output + operational
- [ ] CI/CD con validation gates configurados y testeados
- [ ] Blue & Gold deployment operativo con rollback verificado
- [ ] Monitoring stack completo: infrastructure, application, model, data
- [ ] Drift detection activo con alertas configuradas
- [ ] Runbooks documentados para failure scenarios comunes
- [ ] Cada fase tiene Definition of Done cumplida con evidencia

---

## Cross-References

| Skill | Relación |
|-------|----------|
| `ai-software-architecture` | Proporciona diseño de arquitectura a implementar |
| `ai-pipeline-architecture` | Proporciona diseño de pipelines a implementar |
| `ai-design-patterns` | Proporciona patrones seleccionados a implementar |
| `ai-testing-strategy` | Proporciona estrategia de testing a implementar en CI/CD |
| `genai-architecture` | Proporciona diseño GenAI a implementar |
| `ai-architecture-audit` | Proporciona roadmap de remediación a ejecutar |
| `ai-conops` | Proporciona modos operacionales y métricas de éxito |
| `aws-architecture-implementation` | Implementación AWS-específica (complementaria) |
| `aws-architecture-design` | Diseño AWS que se implementa con el skill AWS |
| `infrastructure-architecture` | Proporciona diseño de infraestructura base |

---

## Output Format Protocol

```
if FORMATO == "ejecutivo":
  Stack summary + implementation timeline + resource needs + milestones
  Audiencia: Project managers, sponsors

if FORMATO == "técnico":
  Full 6-section implementation guide + blueprints + configurations
  Audiencia: ML engineers, DevOps, platform engineers

if FORMATO == "híbrido":
  Executive timeline + technical deep-dive completo
  Audiencia: Tech leads planning implementation sprints
```

## Output Artifact

```
## {System Name} — AI Architecture Implementation Guide

### Stack Decision
[S1: Technology selection matrix with ADRs]

### Phase 0: Foundation
[Repository structure, CI skeleton, development environment]

### Phase 1: Data Pipeline
[S2: Pipeline implementation, quality gates, feature store]

### Phase 2: Model Development
[S3: Training pipeline, experiment tracking, model registry]

### Phase 3: Serving & Inference
[S4: Model serving, API, caching, guardrails, RAG/agents]

### Phase 4: CI/CD & Deployment
[S5: Blue & Gold pipeline, gates, canary, rollback]

### Phase 5: Monitoring & Operations
[S6: Observability stack, dashboards, alerts, runbooks]

### Implementation Timeline
[Gantt chart with milestones and dependencies]
```
