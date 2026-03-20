# AI Pipeline Requirements Framework

## Performance Requirements (AP)

| Metric | Description | Threshold | Objective |
|---|---|---|---|
| AP-1 | Total time to conduct data cleansing | 30 secs/GB | 10 secs/GB |
| AP-2 | Total time to conduct data transformations | 30 secs/GB | 10 secs/GB |
| AP-3 | Time to execute the model | 10 secs | 5 secs |
| AP-4 | Time to write to the results store | 5 secs/GB | 3 secs/GB |
| AP-5 | Time to write to end user stores | 5 secs/GB | 3 secs/GB |
| AP-6 | Data store transactions | 10,000 events/sec | 20,000 events/sec |
| AP-7 | Machine learning model accuracy | .88 | .94 |
| AP-8 | Machine learning Area Under Curve (AUC) | .90 | .95 |
| AP-9 | Time to update pipeline operations | 1 sec | .5 secs |
| AP-10 | Time to reconfigure to safe configuration | 1 sec | .5 secs |
| AP-11 | Model fairness across demographic groups | 90% parity | 95% parity |
| AP-12 | Model explainability score | 0.7 | 0.8 |
| AP-13 | Model robustness to input perturbations | +/-10% accuracy change | +/-5% accuracy change |

## Non-Functional Requirements (NF)

| Metric | Description | Threshold | Objective |
|---|---|---|---|
| NF-1 | Availability - uptime | > 99.9% | > 99.99% |
| NF-2 | Time to restore upon error | < 1 min | < 30 secs |
| NF-3 | No single point of failure | N/A | N/A |
| NF-4 | Time to update pipeline | < 3 mins | < 1 min |
| NF-5 | Time to detect fault | < .5 secs | < .1 secs |
| NF-6 | Deploy security patch | < 600 secs | < 180 secs |
| NF-7 | Report pipeline health updates | < 10 secs | < 5 secs |
| NF-8 | Model drift detection delay | < 1 hour | < 10 mins |
| NF-9 | Feature pipeline isolation | N/A | N/A |

## Security Requirements (SEC)

| Metric | Description | Threshold | Objective |
|---|---|---|---|
| SEC-1 | Pipeline shall use PKI for external interfaces | N/A | N/A |
| SEC-2 | Pipeline shall record all users' date, time, and executions | N/A | N/A |
| SEC-3 | All hardware patchable without pipeline interference | N/A | N/A |
| SEC-4 | Pipeline shall protect models against adversarial attacks | N/A | N/A |
| SEC-5 | Pipeline shall implement data access controls | N/A | N/A |
| SEC-6 | Pipeline shall monitor for model extraction attacks | N/A | N/A |

## Compliance Requirements (CP)

| Metric | Description | Threshold | Objective |
|---|---|---|---|
| CP-1 | Only authorized users view customers' personal data | N/A | N/A |
| CP-2 | All financial transactions shall be archived | N/A | N/A |
| CP-3 | All financial ID information encrypted at rest | N/A | N/A |
| CP-4 | All financial ID information encrypted in use | N/A | N/A |
| CP-5 | All model decisions shall maintain complete audit trails | N/A | N/A |
| CP-6 | All model versions logged in model registry with lineage | N/A | N/A |
| CP-7 | Pipeline shall support model governance review workflows | N/A | N/A |

---

## How to Use These Tables

1. **Baseline**: Use threshold values as minimum acceptable performance
2. **Target**: Use objective values as aspirational targets for optimization
3. **Customize**: Replace domain-generic values with project-specific requirements
4. **Validate**: Map each requirement to architectural components that satisfy it
5. **Test**: Define test cases that verify each requirement (see **metodologia-ai-testing-strategy**)
6. **Monitor**: Implement continuous monitoring for all quantitative requirements
