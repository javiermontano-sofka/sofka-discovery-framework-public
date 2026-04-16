---
name: metodologia-ai-testing-strategy
description: >
  Comprehensive testing strategy for AI systems — testing scope matrix (6 types x 6 layers), model prediction testing,
  data quality testing, compliance and fairness testing, integration approaches, and CI/CD test automation. This skill
  should be used when the user asks to "define AI testing strategy", "test ML models", "design data quality tests",
  "plan fairness testing", "test AI pipelines", "design integration tests for ML", or mentions adversarial testing,
  drift simulation, model regression testing, bias testing, explainability testing, or AI test automation.
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

# AI Testing Strategy: Comprehensive Verification for AI-Enabled Systems

AI testing strategy defines how to verify that an AI system behaves correctly, fairly, securely, and reliably across all layers — from data ingestion through model inference to production monitoring. This skill produces a testing strategy document covering the testing scope matrix, model and prediction tests, data quality tests, compliance and fairness tests, integration approaches, and CI/CD test automation for AI pipelines.

## Principio Rector

**Si no puedes probarlo, no lo despliegues.** En sistemas de IA, "funciona en mi notebook" no es evidencia de calidad. La estrategia de testing debe cubrir las 6 capas del sistema y los 6 tipos de prueba, con automatizacion como requisito, no como aspiracion.

### Filosofia de Testing para IA

1. **La matriz completa o nada.** Testing parcial en sistemas de IA es peor que no testear — da falsa confianza. Un modelo con 95% accuracy pero sin fairness testing puede ser discriminatorio. Un pipeline con integration tests pero sin data quality tests puede procesar basura silenciosamente.
2. **Data quality testing ES el test mas importante.** En sistemas tradicionales, los bugs estan en el codigo. En sistemas de IA, los bugs estan en los datos. Schema validation, distribution testing, lineage tracking, y training-serving skew detection son la primera linea de defensa.
3. **Testing continuo, no testing puntual.** Los modelos degradan con el tiempo (drift). Los datos cambian. Las features evolucionan. La estrategia de testing debe incluir monitoreo continuo en produccion, no solo gates en el pipeline de deployment.

## Inputs

The user provides a system or project name as `$ARGUMENTS`. Parse `$1` as the **system/project name** used throughout all output artifacts.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 matrix + S2 model testing + S6 automation) | `tecnica` (full 6 sections, default)

Before generating testing strategy, detect the codebase context:

```
!find . -name "*.py" -o -name "test_*" -o -name "*_test.*" -o -name "*.yaml" | head -30
```

Detect existing test frameworks (pytest, unittest, Great Expectations, deepchecks), CI/CD tools (GitHub Actions, Jenkins, GitLab CI), and monitoring (Evidently, WhyLabs, Prometheus).

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/testing-matrix.md
Read ${CLAUDE_SKILL_DIR}/references/ai-test-types.md
Read ${CLAUDE_SKILL_DIR}/references/integration-approaches.md
```

---

## When to Use

- Defining a comprehensive testing strategy for new or existing AI systems
- Designing model validation tests (accuracy, fairness, robustness, explainability)
- Planning data quality tests for AI pipelines (schema, distribution, lineage)
- Implementing compliance and fairness testing (bias detection, audit trails, governance)
- Selecting integration testing approaches for AI systems (top-down, bottom-up, parallel, harness)
- Automating AI tests within CI/CD pipelines
- Evaluating test coverage gaps in existing AI systems

## When NOT to Use

- Internal module structure and layer architecture -> **metodologia-ai-software-architecture**
- CONOPS and operational concept -> **metodologia-ai-conops**
- Pipeline design and CI/CD deployment strategy -> **metodologia-ai-pipeline-architecture**
- Design pattern selection -> **metodologia-ai-design-patterns**
- GenAI/LLM-specific testing (hallucination, RAG quality) -> **metodologia-genai-architecture**
- Traditional software testing without AI context -> **metodologia-testing-strategy**

---

## Delivery Structure: 6 Sections

### S1: Testing Scope Matrix

Defines the complete testing landscape across 6 test types and 6 system layers.

**Test types:**
- **Functional**: Correctness of predictions, transformations, orchestration, and data flows
- **Performance**: Latency, throughput, resource utilization across all layers
- **Security**: Input validation, access controls, encryption, adversarial protection
- **Compliance**: Governance workflows, audit trails, data privacy, regulatory adherence
- **Fairness**: Demographic parity, equal opportunity, disparate impact, explanation equity
- **Integration**: Cross-component contracts, stage-to-stage data flow, end-to-end paths

**Layers:**
- UI, API, Pipeline Ops, Model Processing, Data Management, Infrastructure

**Key decisions:**
- Which cells in the matrix are mandatory vs. aspirational for current maturity
- Test priority ordering based on system risk profile
- Coverage target per cell (percentage of scenarios tested)

### S2: Model & Prediction Testing

Defines tests that verify model behavior, accuracy, robustness, and regression safety.

**Test categories:**
- **Accuracy & metrics**: Holdout evaluation, slice-based analysis, calibration testing, threshold sensitivity
- **Adversarial testing**: Input perturbation, boundary testing, evasion attacks, data poisoning detection
- **Concept drift simulation**: Synthetic drift injection, detection delay measurement, retraining trigger verification
- **Counterfactual testing**: Feature sensitivity analysis, explanation consistency, actionable recourse
- **Regression testing**: Version-over-version comparison, no-regression gates, Champion vs. Challenger metrics

**Metric thresholds** (from requirements framework):
- AP-7: Model accuracy >= .88 (threshold), >= .94 (objective)
- AP-8: AUC >= .90 (threshold), >= .95 (objective)
- AP-11: Fairness parity >= 90% (threshold), >= 95% (objective)
- AP-13: Robustness to perturbation: +/-10% accuracy change (threshold), +/-5% (objective)

**Key decisions:**
- Test dataset management (static holdout vs. rolling window vs. both)
- Adversarial testing scope (automated tools vs. red team vs. both)
- Regression gate strictness (any degradation blocks vs. threshold-based)

### S3: Data Quality & Pipeline Testing

Defines tests for data integrity, feature quality, and pipeline reliability.

**Data quality tests:**
- Schema validation (types, formats, ranges, cardinality)
- Distribution testing (KS test, PSI against reference distributions)
- Missing value and outlier handling verification
- Lineage tracking completeness and queryability

**Feature quality tests:**
- Training-serving skew detection (compare training feature computation vs. serving)
- Feature freshness within SLA
- Feature coverage (percentage of predictions with all features)
- Feature importance stability across retraining cycles

**Pipeline tests:**
- Stage-to-stage data contracts (schema, types, ranges)
- Error propagation and retry behavior
- Checkpoint/restart from failed stage
- Pipeline execution time against SLA (AP-1, AP-2 thresholds)

**Key decisions:**
- Data quality tool selection (Great Expectations, deepchecks, Pandera, custom)
- Reference distribution management (when to update reference baselines)
- Contract testing scope (which stage boundaries need contracts)

### S4: Compliance, Fairness & Ethics Testing

Defines tests for regulatory adherence, bias detection, and ethical AI operation.

**Compliance tests:**
- Model governance workflow verification (approval gates, documentation requirements)
- Audit trail completeness (decision logging, immutability, queryability)
- Data privacy (PII detection, masking, consent tracking, right-to-deletion)
- Encryption verification (at rest CP-3, in use CP-4)
- Retention policy enforcement (CP-2: financial transaction archival)

**Fairness tests:**
- Demographic parity across protected groups
- Equal opportunity (true positive rate consistency)
- Disparate impact ratio (four-fifths rule)
- Intersectional analysis (combinations of protected attributes)
- Calibration fairness (confidence scores accurate across groups)

**Explainability tests:**
- Every prediction generates explanation within latency budget
- Explanation consistency (similar inputs produce similar explanations)
- Explanation completeness (top-N features cover >80% prediction weight)
- AP-12: Explainability score >= 0.7 (threshold), >= 0.8 (objective)

**Key decisions:**
- Protected attributes definition (which groups to test fairness across)
- Fairness metric selection (which fairness definition applies to this domain)
- Compliance framework mapping (GDPR, HIPAA, SOX, PCI-DSS requirements per test)

### S5: Integration Approaches & Harness Design

Selects the integration testing strategy and designs the test harness for end-to-end validation.

**Approaches:**
- **Top-Down**: Start from API, stub model and data, progressively replace. Best for user-facing systems.
- **Bottom-Up**: Start from data, validate quality first, progressively add model and API. Best for data-intensive systems.
- **Parallel (Sandwich)**: Test top and bottom simultaneously, meet at model layer. Best for large teams.
- **Big Bang**: All components at once. Only for simple systems or final smoke tests.
- **Integration Harness (Digital Twin)**: Faithful replica of production for realistic testing.

**Harness components:**
- Data simulator (realistic test data matching production distributions)
- Traffic replayer (production traffic patterns against test environment)
- Environment mirror (infrastructure configuration at reduced scale)
- Comparison engine (test vs. production baseline behavior)

**Contract testing:**
- Data contracts between pipeline stages
- Feature contracts between feature store and models
- Model contracts between model and API (input/output schema, latency SLA)
- API contracts (request/response, versioning, deprecation)

**Key decisions:**
- Integration approach selection based on system type and risk profile
- Harness fidelity level (exact replica vs. representative subset)
- Test data strategy (synthetic, anonymized production, sampled production)
- Contract ownership (producer-owned, consumer-owned, shared)

### S6: CI/CD Test Automation for AI

Defines how tests are automated within the CI/CD pipeline for continuous validation.

**Automation tiers:**
- **T1 Unit** (every commit): Feature computations, transformations, utility functions
- **T2 Component** (every PR): Pipeline stages, model inference, data validation
- **T3 Integration** (daily/pre-deploy): Cross-stage flows, model-pipeline, feature store-model
- **T4 System** (pre-release): End-to-end pipeline, full prediction flow
- **T5 Acceptance** (pre-promotion): Business KPIs, fairness metrics, compliance checks

**CI/CD gates:**
- Code quality gate: linting, type checking, unit tests pass
- Data quality gate: schema validation, distribution checks pass
- Model quality gate: accuracy, AUC, fairness meet thresholds
- Performance gate: latency, throughput within SLA
- Security gate: vulnerability scan, access control verification
- Regression gate: no degradation vs. current production model

**GenAI-specific test automation:**
- Prompt regression testing (prompt template changes validated against golden dataset)
- Guardrail effectiveness testing (known-bad inputs verify filter activation)
- Retrieval quality regression (RAG precision/recall tracked across knowledge base updates)
- Hallucination rate tracking (automated grounding checks on sampled responses)
- Cost regression testing (token usage per query type tracked, alerts on budget drift)

**Continuous monitoring (post-deployment):**
- Drift detection on inputs and outputs
- Performance degradation alerting
- Fairness metric tracking
- Prediction quality sampling and human review

**Key decisions:**
- Gate strictness (hard block vs. warning vs. override with approval)
- Test environment provisioning strategy (on-demand vs. persistent)
- Test data refresh cadence
- Monitoring alert routing and escalation

---

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Full matrix coverage** | Comprehensive quality assurance | High test maintenance cost, slow pipeline | Regulated, high-risk AI systems |
| **Model-focused testing** | Fast iteration, model quality | Misses data quality and integration issues | Early-stage, single-model systems |
| **Data-first testing** | Catches most common AI failures | Model behavior tested late | Data-intensive pipeline systems |
| **Automated gates** | Consistent quality, no human bottleneck | Rigid, may block valid models on edge cases | Mature CI/CD with clear thresholds |
| **Manual gates** | Flexibility, expert judgment | Slow, inconsistent, human bottleneck | Novel domains, unclear thresholds |
| **Integration harness** | Realistic testing, high confidence | Infrastructure cost, maintenance overhead | Production-critical AI systems |
| **Contract testing** | Clear team boundaries, fast feedback | Contract maintenance, versioning overhead | Multi-team AI systems |

---

## Assumptions

- AI system has defined requirements with measurable thresholds (AP, NF, SEC, CP metrics)
- Test infrastructure (compute, storage) budget is allocated
- Team has access to representative test data (synthetic or anonymized production)
- CI/CD pipeline exists or is planned for the AI system
- Fairness-relevant protected attributes are identified by the business

## Limits

- Focuses on *testing strategy*, not test implementation code (see testing frameworks documentation)
- Does not design *pipeline architecture* (see **metodologia-ai-pipeline-architecture**)
- Does not select *design patterns* (see **metodologia-ai-design-patterns**)
- GenAI-specific testing (hallucination detection, RAG retrieval quality) requires **metodologia-genai-architecture**
- Does not cover infrastructure testing (see **metodologia-infrastructure-architecture**)

---

## Edge Cases

**No Ground Truth Available:**
Some AI systems (unsupervised, generative) lack clear ground truth. Use proxy metrics (human evaluation, downstream task performance), A/B testing against baselines, and consistency testing (similar inputs should produce similar outputs).

**Regulated Environment with Audit Requirements:**
Every test execution must produce evidence artifacts. Test reports must be immutable and timestamped. Consider the Integration Harness as mandatory for reproducible audit-ready testing. Bottom-Up integration approach ensures data compliance is validated first.

**Continuous Learning System:**
Model updates frequently with new data. Testing strategy must handle continuous model versioning. Regression testing must compare against stable baseline, not just previous version. Drift detection thresholds need regular recalibration.

**Multi-Model Ensemble:**
Testing individual models is necessary but insufficient. Ensemble behavior must be tested as a unit. Disagreement patterns between models should be analyzed. Voting/aggregation logic needs dedicated tests.

**Privacy-Constrained Testing:**
Production data cannot be used for testing (GDPR, HIPAA). Synthetic data generation must match production distributions without exposing real data. Differential privacy techniques for test data. Anonymization verification before test data creation.

---

## Validation Gate

Before finalizing delivery, verify:

- [ ] Testing scope matrix covers all 6 types x 6 layers (cells prioritized, not necessarily all filled)
- [ ] Model testing includes accuracy, adversarial, drift, counterfactual, and regression tests
- [ ] Data quality testing covers schema, distribution, lineage, and training-serving skew
- [ ] Compliance testing addresses governance, audit trails, privacy, and encryption requirements
- [ ] Fairness testing uses appropriate metrics for the domain with defined thresholds
- [ ] Integration approach selected and justified (top-down, bottom-up, parallel, harness)
- [ ] CI/CD automation tiers defined with clear gates and triggers
- [ ] Continuous monitoring strategy extends testing beyond deployment
- [ ] Test data strategy addresses privacy, representativeness, and freshness
- [ ] Testing strategy is implementable (tools selected, team capability considered)

---

## Cross-References

- **metodologia-ai-software-architecture**: Architecture defines testable components; testing validates architecture
- **metodologia-ai-conops**: Success metrics from CONOPS become test acceptance criteria
- **metodologia-ai-pipeline-architecture**: Pipeline stages define test boundaries; requirements framework provides thresholds
- **metodologia-ai-design-patterns**: Patterns require pattern-specific tests (drift detection accuracy, rollback speed)
- **metodologia-genai-architecture**: GenAI-specific tests (hallucination, retrieval quality) complement this general strategy
- **metodologia-aws-architecture-design**: AWS testing infrastructure (SageMaker Model Monitor, Bedrock evaluation, CloudWatch)
- **metodologia-testing-strategy**: Traditional testing strategy provides foundation; this skill adds AI-specific layers
- **metodologia-quality-engineering**: Quality engineering provides broader quality framework context

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | Yes | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

## Output Artifact

**Primary:** `A-04_AI_Testing_Strategy_Deep.html` — Testing scope matrix (6x6), model test specifications, data quality test plan, compliance and fairness test design, integration approach diagram, CI/CD automation pipeline with gates.

**Secondary:** Test case templates (.md), fairness test specification, integration harness design, CI/CD gate configuration, test data strategy document.

---
**Fuente**: Avila, R.D. & Ahmad, I. (2025). *Architecting AI Software Systems*. Packt.
