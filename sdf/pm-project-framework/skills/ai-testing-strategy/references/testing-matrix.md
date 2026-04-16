# AI Testing Scope Matrix

## 6 Test Types x 6 Layers

|  | UI Layer | API Layer | Pipeline Ops | Model Processing | Data Management | Infrastructure |
|---|---|---|---|---|---|---|
| **Functional** | Prediction display, explanation rendering, confidence visualization | Endpoint contracts, input/output schemas, versioned API | Stage orchestration, DAG execution, trigger logic | Prediction accuracy, classification correctness, regression precision | Data ingestion, transformation correctness, feature computation | Container orchestration, service discovery, scaling triggers |
| **Performance** | Response time, render speed, interaction latency | Throughput, latency under load, concurrent requests | Pipeline execution time, stage parallelism, resource utilization | Inference latency, batch throughput, GPU utilization, training time | Query performance, write throughput, read latency | CPU/GPU allocation, memory pressure, network bandwidth |
| **Security** | Input sanitization, XSS prevention, auth UI | Authentication, authorization, rate limiting, input validation | Pipeline access controls, secret management, artifact signing | Model extraction protection, adversarial input detection, inference access | Data encryption (rest/transit/use), access controls, PII masking | Network segmentation, container isolation, vulnerability scanning |
| **Compliance** | Consent UI, data display restrictions, audit visibility | API audit logging, data residency enforcement, retention headers | Pipeline governance workflows, approval gates, lineage tracking | Model governance, bias documentation, decision audit trails | Data lifecycle, retention policies, right to deletion, anonymization | Region-specific deployment, encryption compliance, access logging |
| **Fairness** | Explanation equity across demographics, UI accessibility | Response consistency across user segments | Pipeline behavior consistency across data segments | Demographic parity, equal opportunity, disparate impact, calibration | Training data representativeness, sampling bias, label quality | Resource allocation fairness across tenants/models |
| **Integration** | End-to-end user flows, cross-component rendering | Service-to-service contracts, API composition, webhook delivery | Stage-to-stage data contracts, error propagation, retry behavior | Model-pipeline integration, feature store consumption, registry interaction | Cross-store consistency, sync validation, lineage verification | Multi-service deployment, network connectivity, DNS resolution |

---

## Test Priority by System Maturity

| Maturity | Priority Tests |
|---|---|
| **MVP/Prototype** | Functional (Model Processing, API), basic Performance (inference latency) |
| **Production v1** | + Security (all layers), Compliance (Data Management), Integration (Pipeline-Model) |
| **Scaled Production** | + Performance (all layers), Fairness (Model, Data), full Integration suite |
| **Enterprise/Regulated** | Full matrix coverage with automated gates and audit evidence |

## Test Automation Tiers

| Tier | Scope | Frequency | Trigger |
|---|---|---|---|
| **T1 — Unit** | Individual functions, transformations, feature computations | Every commit | Git push |
| **T2 — Component** | Pipeline stages, model inference, data validation | Every PR | Pull request |
| **T3 — Integration** | Cross-stage, model-pipeline, feature store-model | Daily / pre-deploy | Schedule / deploy trigger |
| **T4 — System** | End-to-end pipeline, full prediction flow | Pre-release | Release candidate |
| **T5 — Acceptance** | Business KPIs, fairness metrics, compliance checks | Pre-promotion | Model promotion gate |
