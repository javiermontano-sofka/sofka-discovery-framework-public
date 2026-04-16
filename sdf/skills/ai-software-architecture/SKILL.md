---
name: metodologia-ai-software-architecture
description: >
  AI software architecture design — modules, layers, boundaries, design patterns, ADRs, quality attributes, and technical debt strategy
  for AI-enabled systems. This skill should be used when the user asks to "design AI system structure", "define AI module boundaries",
  "select AI architecture patterns", "document AI architecture decisions", "evaluate AI code architecture", or mentions AI pipelines,
  feature stores, model serving, drift detection, ML quality attributes, explainability architecture, or AI technical debt.
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

# AI Software Architecture: Internal Structure & Design Decisions for AI-Enabled Systems

AI software architecture defines how code is organized internally in systems that combine traditional software components with AI/ML capabilities — module boundaries spanning data pipelines, model serving, and feature stores; layer separation across the 6-layer AI stack; design patterns bridging traditional and AI-specific concerns; and the reasoning behind technical decisions. This skill produces comprehensive architecture documentation that enables teams to understand, maintain, and evolve AI-enabled systems.

## Principio Rector

**En sistemas de IA, la arquitectura implica dos tipos de deuda: la del codigo y la del modelo.** Ignorar cualquiera de las dos garantiza degradacion silenciosa. Por eso se documenta ANTES de implementar, se valida contra quality attributes medibles (incluyendo fairness, explainability, robustness), y cada decision vive en un ADR con alternativas y trade-offs.

### Filosofia de Arquitectura de Software para IA

1. **El modelo es un componente, no el sistema.** La arquitectura de IA es 80% ingenieria de datos, serving, y monitoreo. El modelo es el nucleo analitico, pero sin la arquitectura circundante es un notebook, no un sistema de produccion.
2. **Quality attributes mandan — incluyendo los de IA.** Performance y availability no bastan. Fairness, explainability, robustness y drift resilience son quality attributes de primera clase. Un modelo preciso pero opaco o sesgado es una bomba regulatoria.
3. **Drift es la deuda tecnica especifica de IA.** En software tradicional, la deuda se acumula por decisiones de codigo. En IA, la deuda se acumula porque los datos cambian y el modelo no. Monitorear drift no es opcional — es higiene arquitectonica.

## Inputs

The user provides a system or project name as `$ARGUMENTS`. Parse `$1` as the **system/project name** used throughout all output artifacts.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para analisis de estructura y patterns, HITL para ADRs y decisiones de modelo.
  - **desatendido**: Cero interrupciones. Arquitectura documentada automaticamente. Supuestos documentados.
  - **supervisado**: Autonomo con checkpoint en pattern selection, model topology, y ADRs.
  - **paso-a-paso**: Confirma cada module view, pattern, ADR, y plan de evolucion.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 module view + S3 patterns + S5 ADRs) | `tecnica` (full 6 sections, default)

Before generating architecture, detect the codebase context:

```
!find . -name "*.py" -o -name "*.ts" -o -name "*.java" -o -name "*.go" | head -30
```

Use detected languages, frameworks, and ML libraries (PyTorch, TensorFlow, scikit-learn, LangChain, Hugging Face) to tailor pattern recommendations and component naming.

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/ai-architecture-stack.md
Read ${CLAUDE_SKILL_DIR}/references/ai-quality-attributes.md
Read ${CLAUDE_SKILL_DIR}/references/ai-patterns-catalog.md
```

---

## When to Use

- Designing modular structure for new AI-enabled systems or major AI refactors
- Evaluating existing architecture against AI quality attributes (fairness, explainability, robustness)
- Selecting design patterns for AI systems (Feature Store, Champion-Challenger, Shadow Deployment, Drift Detection)
- Documenting architectural decisions for model selection, training strategy, inference topology
- Identifying anti-patterns and debt in AI pipelines before they compound
- Communicating AI architecture to development teams, data scientists, and stakeholders
- Planning evolution strategy for AI systems aligned with business and technical constraints

## When NOT to Use

- CONOPS and operational concept for AI systems → **metodologia-ai-conops**
- Detailed pipeline architecture (dev/prod pipelines, CI/CD for AI) → **metodologia-ai-pipeline-architecture**
- Deep pattern catalog with tactics and anti-patterns → **metodologia-ai-design-patterns**
- Comprehensive testing strategy for AI systems → **metodologia-ai-testing-strategy**
- GenAI/LLM-specific architecture (RAG, agents, vector DBs) → **metodologia-genai-architecture**
- AWS-specific service selection and Well-Architected assessment → **metodologia-aws-architecture-design**
- End-to-end solution design across multiple systems → **metodologia-solutions-architecture**
- Enterprise portfolio alignment → **metodologia-enterprise-architecture**
- Infrastructure and platform design → **metodologia-infrastructure-architecture**

---

## Delivery Structure: 6 Sections

### S1: AI System Module View

Maps the internal module structure through the 6-layer AI architecture stack: Hardware, Data, Model, Inference, Application, Monitoring & Control.

**Includes:**
- Module decomposition across the 6 layers — what modules exist per layer, responsibilities, dependencies
- Dependency graph showing coupling between traditional software modules and AI-specific modules
- Layer map with clear separation and dependency direction (upper layers depend on lower layers)
- Module-to-team ownership mapping (data engineering, ML engineering, platform, product)
- Identified dependency violations and cycles — especially training-serving skew risks

**Key decisions:**
- Granularity: monolithic pipeline vs. decomposed stages vs. microservice-per-model
- Direction: all dependencies flow inward (Hexagonal) vs. layered flow vs. event-driven
- Shared components: feature stores, model registries, embedding caches — minimize coupling
- Cross-module contracts: data contracts between pipeline stages, model interface contracts

### S2: AI Component View

Decomposes selected modules into components — what they do, interfaces exposed, dependencies. Focus on the five core production pipeline components.

**Components:**
- **Data Cleansing**: Schema validation, anomaly detection, data quality enforcement
- **Data Transformation**: Feature engineering, embedding generation, format conversion
- **ML Model**: Model registry integration, A/B testing framework, explainability hooks
- **Pipeline Operations**: Monitoring, alerting, self-healing, visualization
- **Results Store**: Prediction storage, feature attribution, audit trails, BI integration

**Key decisions:**
- Component interfaces: input/output contracts, versioning for stability
- Dependency injection for model swapping without pipeline changes
- Monitoring hooks: performance metrics, prediction distributions, resource utilization

### S3: Design Patterns

Documents selected patterns with justification, detected anti-patterns, and alternatives. Bridges traditional and AI-specific pattern catalogs.

**AI-specific patterns** (Feature Store, Champion-Challenger, Shadow Deployment, Drift Detection, Explainability Wrapper, Canary Deployment, Bulkhead):
- Why chosen: which AI quality attribute it enables
- How applied: concrete examples from the system
- Implications: compute cost, operational complexity, team structure

**Traditional patterns adapted for AI** (Service-Oriented, Balancer, Circuit, Throttle, N-Party Voting):
- How the pattern changes when applied to AI workloads
- GPU-aware, drift-aware, or fairness-aware adaptations

**Anti-patterns detected** (Training-serving skew, Pipeline jungle, Dead feature columns, Undeclared consumers):
- Location in codebase, consequences if unaddressed, refactoring approach

**Principle:** Patterns serve quality attributes. A Feature Store without multiple consumers is overhead. Shadow Deployment without evaluation criteria is wasted compute.

### S4: Quality Attribute Scenarios (ATAM + AI)

ATAM-style scenarios extended with AI-specific quality attributes: **Stimulus → Response → Measure**

| Quality Attribute | Example Scenario |
|---|---|
| **Performance** | Inference request completes within 200ms (p95) under 1000 concurrent users |
| **Accuracy** | ML model accuracy >= .88 threshold, .94 objective |
| **Fairness** | Model fairness across demographic groups >= 90% parity (threshold), 95% (objective) |
| **Explainability** | Explainability score >= 0.7 (threshold), 0.8 (objective); top-5 features explain >60% |
| **Robustness** | Model accuracy change under perturbation <= +/-10% (threshold), +/-5% (objective) |
| **Drift Resilience** | Drift detected within <1 hour (threshold), <10 minutes (objective) |
| **Availability** | Service remains available during model failure with <30s failover to fallback |
| **Modifiability** | Swapping model algorithm requires changes to <=3 modules |
| **Deployability** | New model version deployed in <15 min with instant rollback |
| **Compliance** | All model decisions have complete audit trails; governance review workflows enforced |

### S5: Architecture Decision Records (ADRs)

Captures significant AI architecture decisions with context, decision, consequences, and alternatives.

**AI-specific ADR topics:**
- Model architecture selection (transformer vs. ensemble vs. linear)
- Training strategy (batch vs. online vs. transfer learning)
- Inference topology (real-time vs. batch vs. streaming vs. edge)
- Feature store adoption (build vs. buy vs. skip)
- Monitoring strategy (drift detection algorithm, alert thresholds)
- Multi-model strategy (single model vs. tiered vs. ensemble)
- Data pipeline architecture (batch vs. streaming vs. hybrid)
- Explainability approach (SHAP vs. LIME vs. attention-based)

**ADR structure:** Title, Status, Context (business + technical constraints), Decision (what + why), Consequences (positive/negative/neutral), Alternatives considered, Related decisions.

**Scope:** Decisions affecting multiple pipeline stages, requiring significant refactoring if changed, or trading off AI quality attributes.

### S6: Debt & Evolution Plan

Identifies current architectural debt — including AI-specific debt — and a strategy for evolution.

**AI-specific debt types:**
- **Model drift debt**: Models serving stale predictions because monitoring is absent or ignored
- **Training-serving skew debt**: Different feature computation in training vs. production
- **Pipeline jungle debt**: Tangled dependencies between pipeline stages with no clear contracts
- **Dead feature debt**: Features computed but never used by any model
- **Undeclared consumer debt**: Downstream systems depending on model outputs without formal contracts
- **Experiment debt**: Abandoned experiments leaving orphaned code, configs, and data
- **Responsible AI debt**: Missing fairness audits, absent explainability mechanisms, no bias monitoring — accumulates regulatory and reputational risk
- **LLMOps debt**: Prompt templates without version control, untracked context window usage, no cost attribution per LLM call

**Evolution strategy:**
- Phased approach: debt reduction does not block feature delivery
- Strangler fig for pipeline modernization: old and new pipelines coexist during transition
- Testing coverage: increase before major refactors — especially model regression tests
- Monitoring-first: instrument before optimizing
- Team structure: align teams to pipeline boundaries (data, model, serving, ops)

---

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Monolithic Pipeline** | Simple deployment, easy debugging | Tight coupling, hard to scale components independently | Early-stage, single-model systems |
| **Microservice-per-Model** | Independent scaling, tech diversity | Distributed complexity, network overhead | Multi-model, multi-team, high-scale |
| **Feature Store** | Consistency, reuse, drift monitoring | Infrastructure overhead, governance cost | Multiple models share features |
| **Champion-Challenger** | Data-driven updates, risk management | Doubled compute, statistical significance needed | Production model updates |
| **Shadow Deployment** | Real-world validation without risk | Doubled inference compute, no user signal | High-stakes, regulated predictions |
| **Drift Detection** | Proactive model updates, early warning | Monitoring infrastructure, threshold calibration | All production AI systems |
| **Explainability Wrapper** | Transparency, compliance, trust | Added latency, explanation fidelity trade-off | Regulated industries, user-facing |
| **Bulkhead Isolation** | Fault containment, independent scaling | Resource overhead per compartment | Multi-model serving, critical availability |

---

## Assumptions

- System contains or will contain AI/ML components alongside traditional software
- Team includes or will include ML engineers, data engineers, and software engineers
- Quality attributes and constraints have been discussed (from prior discovery or CONOPS)
- Access to codebase for structure inspection is available
- Time is available for architecture documentation (not reverse-engineered under pressure)
- Organizational maturity allows for dedicated monitoring and governance processes

## Limits

- Focuses on *logical architecture*, not physical deployment (see **metodologia-infrastructure-architecture**)
- Does not design *external integration* points (see **metodologia-solutions-architecture**)
- Does not address *team structure* or *enterprise governance* (see **metodologia-enterprise-architecture**)
- Does not detail *pipeline implementation* (see **metodologia-ai-pipeline-architecture**)
- Does not provide *deep pattern implementation guides* (see **metodologia-ai-design-patterns**)
- GenAI/LLM-specific patterns (RAG, agents) require **metodologia-genai-architecture**

---

## Edge Cases

**Greenfield AI System:**
No existing structure; risk of over-engineering for hypothetical scale. Start with monolithic pipeline, defer microservice decomposition. Use ADRs for reversible decisions. Prioritize monitoring from day one.

**Legacy System Adding AI:**
Existing architecture not designed for AI workloads. Watch for: impedance mismatch between request-response web app and batch training pipelines, data access patterns that don't support feature engineering, deployment processes that can't handle model artifacts. Use strangler fig for gradual AI integration.

**Multi-Model System:**
Multiple models serving different use cases from shared data. Risk of resource contention, dependency conflicts, cascade failures. Apply Bulkhead pattern. Feature Store becomes essential. Model registry is non-optional.

**Real-Time AI System:**
Latency requirements constrain model complexity, feature computation, and explanation depth. May need edge inference, model compression, or prediction caching. Quality attribute trade-offs between accuracy and latency must be explicit in ADRs.

**Regulated AI System (Finance, Healthcare):**
Compliance requirements (audit trails, explainability, fairness) are architectural constraints, not afterthoughts. Explainability Wrapper pattern is mandatory. Data lineage tracking at every pipeline stage. Model governance workflows built into CI/CD.

---

## Validation Gate

Before finalizing delivery, verify:

- [ ] Architecture decisions are explicit, not implicit — especially model and data decisions
- [ ] Modules span both traditional software and AI components coherently
- [ ] 6-layer stack decomposition is clear with defined responsibilities per layer
- [ ] Dependency direction enforces separation between traditional and AI components
- [ ] Quality attributes include AI-specific: fairness, explainability, robustness, drift resilience
- [ ] Quality attributes are measurable (thresholds and objectives defined)
- [ ] AI-specific patterns are justified by quality attributes they enable
- [ ] Anti-patterns identified with remediation plan (training-serving skew, pipeline jungle)
- [ ] ADRs explain *why* model/training/inference decisions were made
- [ ] Evolution strategy addresses both code debt and model drift debt
- [ ] Debt is quantified and prioritized — model drift debt treated as first-class concern
- [ ] Monitoring strategy covers model performance, data quality, and infrastructure
- [ ] Codebase structure matches architecture (or evolution plan bridges the gap)

---

## Cross-References

- **metodologia-ai-conops**: Provides upstream operational concept, stakeholders, and interaction spectrum
- **metodologia-ai-pipeline-architecture**: Receives architecture direction; designs pipeline implementation
- **metodologia-ai-design-patterns**: Deep pattern catalog and system tactics for AI
- **metodologia-ai-testing-strategy**: Testing strategy aligned to architecture quality attributes
- **metodologia-genai-architecture**: GenAI/LLM-specific architectural patterns (RAG, agents, vector DBs)
- **metodologia-aws-architecture-design**: Maps AI architecture to AWS services (Bedrock, SageMaker, OpenSearch)
- **metodologia-software-architecture**: Traditional software architecture (non-AI) — complementary skill
- **metodologia-solutions-architecture**: Integrates AI architecture into end-to-end solution design
- **metodologia-infrastructure-architecture**: Receives compute and storage needs; designs the platform
- **metodologia-devsecops-architecture**: Uses architecture decisions to design pipeline security controls

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | Yes | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `A-01_AI_Software_Architecture_Deep.html` — Executive summary, 6-layer module view, component cards, hybrid design patterns, AI quality attribute scenarios, ADRs, debt inventory and evolution roadmap.

**Secondary:** ADR repository (.md files, version-controlled), AI architecture stack diagram (Mermaid/PNG/SVG), quality attribute scenario checklist, pattern selection decision tree.

---
**Fuente**: Avila, R.D. & Ahmad, I. (2025). *Architecting AI Software Systems*. Packt. | Bass, L., Clements, P., & Kazman, R. (2021). *Software Architecture in Practice* (4th ed.). Addison-Wesley.
