# AI Architecture Audit Framework

## Audit Dimensions (6D)

### D1: Structural Integrity
| Check | Description | Evidence |
|-------|-------------|----------|
| Layer separation | 6-layer stack boundaries respected (Hardware→Data→Model→Inference→Application→Monitoring) | Dependency analysis, import graph |
| Module cohesion | Each module has single responsibility, AI and traditional components separated | Code structure review |
| Dependency direction | Upper layers depend on lower; no circular dependencies | Static analysis tool output |
| Contract compliance | Data contracts between pipeline stages defined and enforced | Contract test results |
| Interface stability | Model interfaces versioned, backward compatible | API versioning scheme |

### D2: AI Quality Attributes
| Attribute | Threshold | Objective | Measurement |
|-----------|-----------|-----------|-------------|
| Accuracy | >= .88 | >= .94 | Holdout evaluation |
| Fairness | >= 90% parity | >= 95% parity | Demographic parity, equal opportunity |
| Explainability | >= 0.7 score | >= 0.8 score | SHAP/LIME coverage of top features |
| Robustness | +/-10% under perturbation | +/-5% | Adversarial testing |
| Drift resilience | Detection < 1 hour | Detection < 10 min | Monitoring lag measurement |
| Latency P95 | < 500ms | < 200ms | Load testing |
| Availability | >= 99.9% | >= 99.95% | Uptime monitoring |

### D3: Pattern Adherence
| Pattern | Present | Correctly Implemented | Evidence |
|---------|---------|----------------------|----------|
| Feature Store | Y/N | Y/N/Partial | Config + usage analysis |
| Champion-Challenger | Y/N | Y/N/Partial | A/B test infrastructure |
| Drift Detection | Y/N | Y/N/Partial | Monitoring dashboards |
| Explainability Wrapper | Y/N | Y/N/Partial | Explanation generation code |
| Canary Deployment | Y/N | Y/N/Partial | Deployment scripts |
| Circuit Breaker | Y/N | Y/N/Partial | Fallback handling code |
| Guardrails | Y/N | Y/N/Partial | Input/output validation |

### D4: Anti-Pattern Detection
| Anti-Pattern | Symptom | Detection Method |
|-------------|---------|-----------------|
| Training-Serving Skew | Feature computation differs between training and serving | Compare feature pipelines |
| YOLO Deploy | No staging/canary, direct to production | Deployment pipeline review |
| Notebook-to-Production | Jupyter code copy-pasted into production | Code structure analysis |
| Silent Degradation | No drift monitoring, accuracy unknown | Monitoring coverage audit |
| Pipeline Jungle | Tangled dependencies, no clear data contracts | Dependency graph analysis |
| Feature Sprawl | Hundreds of unmanaged features | Feature store inventory |
| God Model | One model handles all use cases | Model registry review |
| Unguarded LLM | No input/output validation on LLM calls | Code review |
| Token Budget Blindness | No cost tracking on LLM calls | Cost monitoring review |

### D5: Security & Compliance
| Control | Required | Implemented | Gap |
|---------|----------|-------------|-----|
| Data encryption at rest | Y | Y/N | — |
| Data encryption in transit | Y | Y/N | — |
| Model access controls (IAM) | Y | Y/N | — |
| Audit trail for predictions | Regulated | Y/N | — |
| PII detection/masking | Regulated | Y/N | — |
| Prompt injection protection | GenAI | Y/N | — |
| Adversarial input validation | Y | Y/N | — |
| Model governance workflow | Y | Y/N | — |
| Data lineage tracking | Y | Y/N | — |

### D6: Technical Debt Inventory
| Debt Type | Description | Impact | Priority |
|-----------|-------------|--------|----------|
| Model drift debt | Stale models without monitoring | Accuracy degradation | Critical |
| Training-serving skew | Different feature computation | Silent errors | Critical |
| Pipeline jungle | Tangled dependencies | Fragility, slow changes | High |
| Dead feature debt | Unused features still computed | Wasted compute | Medium |
| Experiment debt | Orphaned experiments | Code clutter | Medium |
| Responsible AI debt | Missing fairness/explainability | Regulatory risk | High |
| LLMOps debt | Unversioned prompts, no cost tracking | Cost overruns | High |

---

## Audit Severity Levels

| Level | Definition | SLA |
|-------|-----------|-----|
| **CRITICAL** | System failure risk, data loss, security breach, regulatory violation | Fix within 1 sprint |
| **HIGH** | Significant degradation, missing safety controls, major debt | Fix within 2 sprints |
| **MEDIUM** | Suboptimal patterns, moderate debt, missing best practices | Plan within quarter |
| **LOW** | Minor improvements, optimization opportunities | Backlog |
| **INFO** | Observations, recommendations, future considerations | Document |

## Audit Evidence Types

- `[CÓDIGO]` — Source code inspection
- `[CONFIG]` — Configuration file review
- `[MÉTRICA]` — Measured performance data
- `[DOC]` — Documentation review
- `[ENTREVISTA]` — Team interview
- `[HERRAMIENTA]` — Tool output (static analysis, profiler, monitor)
- `[INFERENCIA]` — Reasoned from available evidence
