# AI-Specific Test Types

## Model & Prediction Testing

### Accuracy & Metrics Testing
- Evaluate model against holdout test set with standard metrics (accuracy, AUC, F1, precision, recall)
- Slice-based evaluation: test accuracy across subgroups (demographics, edge cases, high-value segments)
- Calibration testing: predicted probabilities match observed frequencies
- Threshold sensitivity: model behavior at different classification thresholds

### Adversarial Testing
- Input perturbation: small changes to inputs should not cause large prediction changes
- Boundary testing: inputs at decision boundaries, extreme values, edge cases
- Evasion attacks: crafted inputs designed to fool the model
- Data poisoning detection: verify training pipeline rejects poisoned data
- Robustness metrics: accuracy change within +/-5% under perturbation (AP-13 objective)

### Concept Drift Simulation
- Inject synthetic drift into test data and verify detection triggers
- Test model behavior under gradual drift vs. sudden shift
- Validate retraining pipeline activates correctly upon drift detection
- Measure detection delay against NF-8 threshold (<1 hour threshold, <10 min objective)

### Counterfactual Testing
- "What if" scenarios: change one feature, observe prediction change
- Verify explanations are consistent with counterfactual behavior
- Identify minimum changes needed to flip a prediction (actionable recourse)

### Regression Testing for Models
- New model version must not degrade on any slice where previous version performed well
- Performance comparison across all established test datasets
- Champion-Challenger regression gate: Challenger must match or exceed Champion on all metrics

---

## Data Quality Testing

### Schema Validation
- Input data matches expected schema (types, formats, ranges, cardinality)
- Missing value handling: verify pipeline behavior with NULL, NaN, empty strings
- New category detection: unseen categorical values handled gracefully

### Distribution Testing
- Feature distributions match training reference (KS test, PSI)
- Class balance monitoring for classification tasks
- Correlation stability between features over time
- Outlier detection and handling verification

### Lineage Tracking Testing
- Verify data lineage from source to prediction is complete and queryable
- Audit trail includes: data source, transformation steps, feature versions, model version
- Right-to-deletion verification: removing a data point propagates through entire pipeline

### Feature Quality Testing
- Feature computation consistency between training and serving (training-serving skew prevention)
- Feature freshness: features served within defined SLA
- Feature coverage: percentage of predictions with all features available
- Feature importance stability: top features remain consistent across retraining cycles

---

## Error & Fault Recovery Testing

### Model Fallback Testing
- Primary model unavailable: verify fallback to previous version, cached predictions, or default response
- Cascading failure prevention: model failure does not propagate to other pipeline components
- Recovery time measurement against NF-2 threshold (<1 min threshold, <30 sec objective)

### Pipeline Isolation Testing
- Stage failure does not crash entire pipeline (Bulkhead verification)
- Data corruption in one stage does not propagate downstream
- Resource exhaustion in one component does not starve others

### Registry Failover Testing
- Model registry unavailability: serving continues with last-loaded model
- Registry corruption detection and recovery
- Multi-region registry synchronization verification

### Circuit Breaker Testing
- Circuit opens after N consecutive failures
- Half-open state correctly tests recovery
- Closed state resumes normal operation after successful probes
- Metrics logged for every state transition

### Graceful Degradation Testing
- System behavior at each degradation level is defined and tested
- Transition from normal to degraded mode is smooth (no request drops)
- Degraded mode provides useful (if reduced) functionality
- Recovery from degraded to normal mode is automatic when root cause resolves

---

## Compliance, Fairness & Ethics Testing

### Model Governance Testing
- Model promotion requires documented approval workflow
- All model versions logged with complete metadata
- Model retirement process verified (archived, not deleted)

### Bias & Fairness Testing
- Demographic parity: prediction rates consistent across protected groups (AP-11: 90% threshold, 95% objective)
- Equal opportunity: true positive rates consistent across groups
- Disparate impact ratio: passes 80% rule (four-fifths rule)
- Intersectional analysis: fairness across combinations of protected attributes

### Explainability Testing
- Every prediction can generate an explanation within latency budget
- Explanations are consistent: similar inputs produce similar explanations
- Explanation completeness: top-N features cover >80% of prediction weight
- Explainability score meets threshold (AP-12: 0.7 threshold, 0.8 objective)

### Audit Trail Testing
- All model decisions logged with timestamp, input features, output, confidence, explanation
- Audit logs are immutable and tamper-evident
- Logs queryable by time range, model version, user, decision type
- Retention meets regulatory requirements (CP-2: financial transactions archived)

### Privacy Testing
- PII detection and masking in model inputs and outputs
- Training data de-identification verification
- Consent tracking integration
- Right-to-deletion end-to-end verification
