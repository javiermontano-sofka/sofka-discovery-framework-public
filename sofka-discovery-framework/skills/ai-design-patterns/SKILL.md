---
name: metodologia-ai-design-patterns
description: >
  AI-specific design patterns and system tactics — Feature Store, Champion-Challenger, Shadow Deployment, Drift Detection,
  Explainability Wrapper, Canary Deployment, Bulkhead, and traditional patterns adapted for AI. This skill should be used
  when the user asks to "select AI design patterns", "apply ML patterns", "design drift detection", "implement feature store",
  "plan shadow deployment", "design champion-challenger", "select availability tactics for AI", or mentions AI anti-patterns,
  maintainability tactics, fault recovery for models, or pattern selection for ML systems.
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

# AI Design Patterns: Patterns & Tactics for AI-Enabled Systems

AI design patterns define reusable solutions to recurring architectural problems in AI systems. This skill produces a pattern selection analysis covering maintainability tactics, availability tactics, AI-specific patterns (Feature Store, Champion-Challenger, Shadow Deployment, Drift Detection), traditional patterns adapted for AI, anti-pattern detection, and a decision framework that maps system requirements to recommended patterns.

## Principio Rector

**Los patrones son decisiones arquitectonicas, no decoraciones.** Cada patron seleccionado tiene un costo (complejidad, infraestructura, operaciones) y un beneficio (resiliencia, mantenibilidad, seguridad). Seleccionar un patron sin justificacion es tan peligroso como no tener ningun patron.

### Filosofia de Design Patterns para IA

1. **Tacticas primero, patrones despues.** Las tacticas (deteccion de fallas, recuperacion, prevencion) son los bloques constituyentes. Los patrones combinan tacticas en soluciones cohesivas. Seleccionar un patron sin entender las tacticas subyacentes produce implementaciones fragiles.
2. **Anti-patrones como guia negativa.** Conocer los anti-patrones (Training-Serving Skew, YOLO Deploy, Silent Degradation) es tan valioso como conocer los patrones. La deteccion de anti-patrones en el sistema existente informa que patrones aplicar.
3. **El contexto determina el patron, no la moda.** Feature Store no es necesario para un modelo unico con features simples. Champion-Challenger no aplica si solo hay un modelo. Shadow Deployment no justifica su costo para modelos de bajo riesgo. Cada patron debe justificarse por las necesidades del sistema.

## Inputs

The user provides a system or project name as `$ARGUMENTS`. Parse `$1` as the **system/project name** used throughout all output artifacts.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S3 AI patterns + S6 decision framework) | `tecnica` (full 6 sections, default)

Before generating pattern analysis, detect the codebase context:

```
!find . -name "*.py" -o -name "*.yaml" -o -name "*.yml" -o -name "Dockerfile" | head -30
```

Detect existing patterns (feature stores, A/B testing, monitoring, model serving, drift detection).

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/ai-patterns-detail.md
Read ${CLAUDE_SKILL_DIR}/references/tactics-catalog.md
Read ${CLAUDE_SKILL_DIR}/references/anti-patterns.md
```

---

## When to Use

- Selecting design patterns for new AI system architecture
- Evaluating existing AI system against known patterns and anti-patterns
- Designing fault detection and recovery for AI systems (drift, model failure, data quality)
- Implementing feature store, champion-challenger, or shadow deployment
- Defining maintainability and availability tactics for AI pipelines
- Planning migration from ad-hoc ML code to pattern-based architecture
- Reviewing anti-patterns and proposing remediation strategies

## When NOT to Use

- Internal module structure and layer architecture -> **metodologia-ai-software-architecture**
- CONOPS and operational concept -> **metodologia-ai-conops**
- Pipeline design and CI/CD -> **metodologia-ai-pipeline-architecture**
- Testing strategy -> **metodologia-ai-testing-strategy**
- GenAI/LLM-specific patterns (RAG, agents) -> **metodologia-genai-architecture**
- Traditional software patterns without AI context -> **metodologia-software-architecture**

---

## Delivery Structure: 6 Sections

### S1: Maintainability Tactics for AI

Identifies tactics that enable the AI system to evolve, be tested, and be configured without fragility.

**Tactic categories:**
- **Modifiability**: Module decomposition, configuration externalization, abstract model interfaces, dependency injection for data sources and model versions
- **Testability**: Observability hooks per pipeline stage, reproducible environments, data versioning, A/B testing infrastructure
- **Adaptability**: Plugin architecture for models and features, feature toggles, multi-model support
- **Configurability**: DAG-based pipeline orchestration, threshold management, configurable logging granularity

**Key decisions:**
- Which tactics are mandatory vs. aspirational for the system's maturity level
- Tactic priority ordering (what to implement first given constraints)
- Tactic-to-component mapping (which architectural component realizes each tactic)

### S2: Availability Tactics for AI

Identifies tactics that ensure the AI system detects, recovers from, and prevents failures.

**Fault detection tactics:**
- Model performance monitoring (accuracy, latency, throughput)
- Data quality monitoring (schema, distribution, anomalies)
- Drift detection (data drift, concept drift, prediction drift)
- Pipeline health checks and resource monitoring

**Fault recovery tactics:**
- Model rollback via registry
- Prediction caching for model unavailability
- Human-in-the-loop fallback
- Pipeline checkpoint/restart
- Circuit breaker for failing models

**Fault prevention tactics:**
- Adversarial testing
- Chaos engineering for ML
- Canary analysis automation
- Data validation gates at pipeline entry

**Key decisions:**
- Recovery time objectives per component
- Fallback hierarchy (cached prediction -> previous model -> human -> graceful denial)
- Monitoring granularity vs. performance overhead

### S3: AI-Specific Patterns Catalog

Catalogs the patterns purpose-built for AI system challenges.

**Patterns:**
- **Feature Store**: Centralized feature computation, training-serving consistency, feature reuse
- **Champion-Challenger**: Evidence-based model promotion via live traffic comparison
- **Shadow Deployment**: Risk-free model validation using production traffic
- **Drift Detection**: Continuous distributional monitoring with automated response
- **Explainability Wrapper**: Explanation generation alongside predictions for transparency and compliance
- **Canary Deployment**: Gradual traffic shift with metric-driven rollback
- **Bulkhead**: Fault isolation between pipeline components and model instances
- **Model Distillation**: Compress large model into smaller, faster model preserving key capabilities
- **Prompt Caching**: Store and reuse prompt-response pairs for repeated or similar queries
- **Guardrail Pattern**: Input/output validation layer between user and model (content safety, PII, topic control)

For each pattern: intent, structure, key decisions, and trade-offs. Detail in `references/ai-patterns-detail.md`.

**Key decisions:**
- Which patterns are required vs. optional for the system
- Pattern interactions and dependencies (Feature Store enables Champion-Challenger)
- Implementation priority based on risk and value

### S4: Traditional Patterns Adapted for AI

Maps traditional software patterns to AI-specific applications.

**Service-oriented:**
- Model-as-a-Service: Independent model deployment with versioned API
- Feature-as-a-Service: Reusable feature computation endpoints
- Explanation-as-a-Service: Centralized explanation generation

**Load management:**
- Balancer: Distribute inference across model replicas
- Throttle: Rate-limit inference to prevent overload
- Batch Inference: Group requests for GPU efficiency

**Resilience:**
- Fail-and-Repeat: Retry failed predictions with backoff
- Circuit Breaker: Open circuit after consecutive model failures
- Bulkhead: Isolate per-tenant or per-priority model instances

**Consensus:**
- N-Party Voting: Ensemble multiple models for robustness
- Confidence Thresholding: Serve only high-confidence predictions; escalate low-confidence

**Key decisions:**
- Which traditional patterns need AI-specific adaptation vs. use as-is
- Pattern composition (combining multiple patterns for compound behavior)

### S5: Anti-Pattern Detection for AI Systems

Identifies known anti-patterns, detects their presence, and prescribes remediation.

**Anti-patterns:**
- **Training-Serving Skew**: Feature computation divergence between training and production
- **YOLO Deploy**: Direct-to-production model deployment without staging
- **Notebook-to-Production**: Copy-paste from Jupyter to production code
- **Monolithic Pipeline**: Single deployment unit for entire ML pipeline
- **Silent Model Degradation**: No drift monitoring, gradual accuracy loss undetected
- **Feature Sprawl**: Hundreds of unmanaged, redundant features
- **Alert Fatigue**: Too many false-positive ML alerts, team ignores them
- **God Model**: Single model handling all use cases
- **Compliance Afterthought**: Explainability and fairness added post-hoc
- **Unguarded LLM**: LLM exposed without input/output validation, prone to injection and misuse
- **Token Budget Blindness**: No cost controls on LLM calls, unbounded agent loops, surprise bills

For each: symptom, cause, detection signal, and recommended pattern fix.

**Key decisions:**
- Which anti-patterns are present in the current system
- Remediation priority (risk-based ordering)
- Pattern-to-anti-pattern mapping (which pattern fixes which anti-pattern)

### S6: Pattern Selection Decision Framework

Provides a systematic approach for selecting patterns based on system requirements.

**Selection dimensions:**
- **Risk level**: High-risk systems need more patterns (Explainability, Drift Detection, N-Party Voting)
- **Scale**: High-volume systems need load management patterns (Balancer, Throttle, Batch)
- **Model count**: Multi-model systems need Champion-Challenger, Feature Store, Bulkhead
- **Regulatory**: Regulated systems need Explainability Wrapper, audit trails, governance patterns
- **Maturity**: Early-stage systems start with core patterns; mature systems add optimization patterns

**Pattern dependency graph:**
```
Feature Store -> Champion-Challenger -> Canary Deployment
Drift Detection -> Model Rollback -> Circuit Breaker
Explainability Wrapper -> Audit Trail -> Compliance
Shadow Deployment -> Canary Deployment -> Blue & Gold CI/CD
```

**Implementation roadmap template:**
- Phase 1 (Foundation): Feature Store, Model Registry, basic monitoring
- Phase 2 (Resilience): Drift Detection, Circuit Breaker, Bulkhead, Rollback
- Phase 3 (Optimization): Champion-Challenger, Shadow Deployment, Canary
- Phase 4 (Governance): Explainability Wrapper, N-Party Voting, compliance patterns

---

## Trade-off Matrix

| Pattern | Enables | Constrains | When to Use |
|---|---|---|---|
| **Feature Store** | Consistency, reuse, drift monitoring | Infrastructure overhead, governance cost | Multiple models sharing features |
| **Champion-Challenger** | Evidence-based promotion | Traffic split complexity, experiment duration | Multiple model candidates, sufficient traffic |
| **Shadow Deployment** | Risk-free validation with real traffic | Doubled infrastructure cost, no user feedback | High-risk model changes |
| **Drift Detection** | Early degradation warning | False positive alerts, monitoring overhead | All production AI systems |
| **Explainability Wrapper** | Transparency, compliance, trust | Latency overhead, explanation fidelity | Regulated domains, high-stakes decisions |
| **Canary Deployment** | Gradual risk mitigation | Slower deployment, routing complexity | All model deployments |
| **Bulkhead** | Fault isolation, independent scaling | Resource overhead, operational complexity | Multi-model or multi-tenant systems |
| **N-Party Voting** | Robustness, reduced variance | Latency, compute cost, model diversity | High-stakes or adversarial environments |
| **Model Distillation** | Lower latency, reduced cost | Quality loss, training effort | High-volume inference with latency constraints |
| **Prompt Caching** | Cost reduction, latency improvement | Cache invalidation, storage cost | High-volume systems with repeated query patterns |
| **Guardrail Pattern** | Safety, compliance, brand protection | Added latency, false positives | All production GenAI systems |

---

## Assumptions

- System has or will build AI pipeline infrastructure (not running ad-hoc scripts)
- Team understands the distinction between model development and model operations
- Infrastructure supports the compute requirements for pattern implementation (e.g., shadow deployment doubles compute)
- Monitoring and observability budget is allocated
- Model registry exists or is planned (many patterns depend on it)

## Limits

- Focuses on *patterns and tactics*, not pipeline design (see **metodologia-ai-pipeline-architecture**)
- Does not design *internal module structure* (see **metodologia-ai-software-architecture**)
- Does not define *testing strategy* beyond pattern-specific validation (see **metodologia-ai-testing-strategy**)
- GenAI-specific patterns (RAG, agent orchestration) require **metodologia-genai-architecture**
- Does not cover infrastructure provisioning for patterns (see **metodologia-infrastructure-architecture**)

---

## Edge Cases

**Early-Stage System with One Model:**
Most patterns are overkill for a single-model MVP. Start with Drift Detection and basic monitoring. Add Feature Store only when a second model needs shared features. Add Champion-Challenger only when there are model alternatives to compare.

**Real-Time vs. Batch Pattern Selection:**
Some patterns behave differently in real-time vs. batch contexts. Champion-Challenger in real-time splits live traffic; in batch, it runs parallel jobs on the same dataset. Feature Store online store is for real-time; offline store is for batch. Ensure pattern documentation specifies both modes.

**Multi-Team Pattern Governance:**
Different teams may implement the same pattern differently (e.g., each team builds their own drift detection). Establish shared pattern implementations as platform capabilities. Feature Store and Model Registry are infrastructure-level patterns, not team-level.

**Regulated Environment Pattern Requirements:**
In finance and healthcare, Explainability Wrapper and audit trails are mandatory, not optional. Drift Detection thresholds may be set by regulators. Champion-Challenger experiments may require ethics board approval. Document regulatory pattern mandates separately from optional patterns.

---

## Validation Gate

Before finalizing delivery, verify:

- [ ] Maintainability tactics selected and mapped to system components
- [ ] Availability tactics cover fault detection, recovery, and prevention
- [ ] AI-specific patterns documented with intent, structure, key decisions, and trade-offs
- [ ] Traditional patterns adapted for AI context (not just renamed)
- [ ] Anti-patterns assessed against current system state with detection signals
- [ ] Pattern selection justified by system requirements (risk, scale, model count, regulation, maturity)
- [ ] Pattern dependency graph documented (prerequisite patterns identified)
- [ ] Implementation roadmap phases defined with incremental value delivery
- [ ] Trade-offs explicitly stated for each selected pattern
- [ ] Patterns are implementable (not just theoretical — team capability and infrastructure considered)

---

## Cross-References

- **metodologia-ai-software-architecture**: Provides module structure context; patterns apply within modules
- **metodologia-ai-conops**: Interaction level drives pattern selection (higher autonomy = more patterns needed)
- **metodologia-ai-pipeline-architecture**: Patterns operate within pipeline stages; Feature Store is a pipeline component
- **metodologia-ai-testing-strategy**: Tests validate pattern behavior (drift detection accuracy, rollback speed)
- **metodologia-genai-architecture**: GenAI-specific patterns (RAG, agents) complement these general AI patterns
- **metodologia-aws-architecture-design**: AWS-native pattern implementations (Bedrock Guardrails, Bedrock Agents, SageMaker A/B)
- **metodologia-infrastructure-architecture**: Infrastructure supports pattern deployment (compute, storage, networking)
- **metodologia-devsecops-architecture**: Security tactics complement availability tactics

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | Yes | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

## Output Artifact

**Primary:** `A-03_AI_Design_Patterns_Deep.html` — Maintainability tactics matrix, availability tactics matrix, AI patterns catalog with diagrams, traditional patterns adapted, anti-pattern detection results, pattern selection decision framework.

**Secondary:** Pattern decision records (.md), anti-pattern detection checklist, pattern dependency graph (Mermaid/PNG/SVG), implementation roadmap.

---
**Fuente**: Avila, R.D. & Ahmad, I. (2025). *Architecting AI Software Systems*. Packt.
