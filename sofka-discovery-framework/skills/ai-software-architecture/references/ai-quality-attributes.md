# AI Quality Attributes — Extended ATAM Scenarios

## Traditional Quality Attributes Applied to AI

### Performance
| Scenario | Stimulus | Response | Measure |
|---|---|---|---|
| Inference latency | User request | Prediction returned | p95 < 200ms under 1000 concurrent users |
| Training throughput | New dataset available | Model retrained | < 30 secs/GB data processing |
| Data pipeline | New data batch | Data cleansed and transformed | < 30 secs/GB |
| Feature computation | Feature request | Feature served | < 5 secs/GB to results store |

### Modifiability
| Scenario | Stimulus | Response | Measure |
|---|---|---|---|
| Algorithm swap | New algorithm available | Replace model without pipeline changes | <= 3 modules modified |
| Feature addition | New feature identified | Add to pipeline and retrain | <= 2 pipeline stages affected |
| Data source addition | New data source | Integrate into pipeline | <= 1 adapter + config change |

### Availability
| Scenario | Stimulus | Response | Measure |
|---|---|---|---|
| Model failure | Primary model crashes | Fallback model serves predictions | < 30s failover, >99.9% uptime |
| Data pipeline failure | Ingestion fails | Cached predictions served | < 1 min recovery |
| GPU exhaustion | Memory exceeded | Graceful degradation to CPU | No request dropped |

### Testability
| Scenario | Stimulus | Response | Measure |
|---|---|---|---|
| Model verification | New model version | Full test suite passes | < 15 min end-to-end |
| Data validation | New data batch | Quality checks pass | Automated, no manual review |
| Regression testing | Code change | No accuracy degradation | Delta < 0.01 from baseline |

### Deployability
| Scenario | Stimulus | Response | Measure |
|---|---|---|---|
| Model deployment | New model approved | Deployed to production | < 15 min with instant rollback |
| Pipeline update | Config change | Pipeline reconfigured | < 1 min, zero downtime |
| Rollback | Degradation detected | Previous version restored | < 30 seconds |

---

## AI-Specific Quality Attributes

### Accuracy & Predictive Power
| Metric | Description | Threshold | Objective |
|---|---|---|---|
| AP-7 | ML model accuracy | .88 | .94 |
| AP-8 | Area Under Curve (AUC) | .90 | .95 |
| AP-13 | Robustness to perturbations | +/-10% accuracy change | +/-5% accuracy change |

### Fairness & Bias
| Metric | Description | Threshold | Objective |
|---|---|---|---|
| AP-11 | Fairness across demographic groups | 90% parity | 95% parity |
| - | Disparate impact ratio | > 0.8 | > 0.9 |
| - | Equal opportunity difference | < 0.1 | < 0.05 |

**Measurement approach:**
- Slice-based testing across protected attributes (race, gender, age)
- Counterfactual fairness testing (change sensitive attribute, observe prediction)
- Demographic parity, equalized odds, calibration across groups

### Explainability & Transparency
| Metric | Description | Threshold | Objective |
|---|---|---|---|
| AP-12 | Explainability score | 0.7 | 0.8 |
| - | Feature attribution coverage | Top-5 features explain >60% | Top-5 explain >80% |
| - | Decision audit trail completeness | 90% | 100% |

**Techniques:**
- SHAP values for feature importance
- LIME for local interpretable explanations
- Attention visualization for transformer models
- Counterfactual explanations ("if X were different, prediction would be Y")

### Robustness
| Metric | Description | Threshold | Objective |
|---|---|---|---|
| AP-13 | Accuracy under perturbation | +/-10% change | +/-5% change |
| - | Adversarial resistance | Withstand standard attacks | Withstand adaptive attacks |
| - | Distribution shift tolerance | Performance degrades <15% | Degrades <5% |

**Testing approaches:**
- Adversarial examples (FGSM, PGD, C&W attacks)
- Input perturbation sensitivity analysis
- Concept drift simulation with shifted distributions
- Out-of-distribution detection accuracy

### Drift Resilience
| Metric | Description | Threshold | Objective |
|---|---|---|---|
| NF-8 | Drift detection delay | < 1 hour | < 10 minutes |
| - | Automated retraining trigger | Within 4 hours of drift | Within 1 hour |
| - | Model freshness | Retrained weekly | Retrained daily or on-demand |

**Types of drift:**
- **Data drift**: Input feature distributions change
- **Concept drift**: Relationship between features and target changes
- **Label drift**: Target variable distribution changes
- **Feature drift**: Feature computation or availability changes

### Compliance & Governance
| Metric | Description | Category |
|---|---|---|
| CP-1 | Authorized access to personal data | Data Access |
| CP-2 | Financial transaction archival | Audit Trail |
| CP-3 | Encryption at rest | Data Protection |
| CP-4 | Encryption in use | Data Protection |
| CP-5 | Model decision audit trails | Model Governance |
| CP-6 | Model version lineage logging | Model Governance |
| CP-7 | Model governance review workflows | Process Governance |

### Security for AI
| Metric | Description | Category |
|---|---|---|
| SEC-1 | PKI for external interfaces | Infrastructure |
| SEC-2 | User/execution audit logging | Auditability |
| SEC-3 | Security patching without pipeline interference | Operations |
| SEC-4 | Adversarial attack protection | Model Security |
| SEC-5 | Data access controls | Data Security |
| SEC-6 | Model extraction monitoring | IP Protection |
