# AI Architecture Audit Checklists

## Checklist 1: Data Pipeline Audit

- [ ] Data sources identified and documented
- [ ] Data quality gates at pipeline entry (schema, types, ranges)
- [ ] Distribution monitoring active (KS test, PSI against reference)
- [ ] Missing value handling documented and tested
- [ ] Outlier detection and handling in place
- [ ] Data lineage tracked from source to prediction
- [ ] Data versioning for training datasets
- [ ] Training-serving feature consistency verified
- [ ] Feature freshness within SLA
- [ ] Feature store in use (if multiple models share features)
- [ ] Dead features identified and removed
- [ ] PII detection active on data pipeline
- [ ] Data retention policies enforced
- [ ] Data access controls per role

## Checklist 2: Model Lifecycle Audit

- [ ] Model registry in place with version history
- [ ] Model metadata tracked (metrics, data hash, hyperparameters, lineage)
- [ ] Model staging workflow defined (dev → staging → canary → production)
- [ ] Promotion criteria documented (accuracy, fairness, performance thresholds)
- [ ] Rollback procedure tested and documented
- [ ] A/B testing infrastructure available
- [ ] Model performance monitoring in production (accuracy, latency, throughput)
- [ ] Drift detection active (data drift, concept drift, prediction drift)
- [ ] Retraining triggers defined (scheduled, drift-based, manual)
- [ ] Model governance approvals required before production
- [ ] Experiment tracking in place (MLflow, W&B, SageMaker)
- [ ] Reproducibility verified (same data + code + config = same model)

## Checklist 3: Inference & Serving Audit

- [ ] Inference latency within SLA (P50, P95, P99 measured)
- [ ] Throughput capacity sufficient for peak load
- [ ] Auto-scaling configured and tested
- [ ] Circuit breaker on model failures
- [ ] Fallback mechanism defined (cached prediction → previous model → human → denial)
- [ ] Request queue for async workloads (if applicable)
- [ ] Batch inference for non-real-time workloads (cost optimization)
- [ ] Model serving framework appropriate for workload
- [ ] GPU/CPU utilization monitored and optimized
- [ ] Cold start latency acceptable (serverless/container)

## Checklist 4: GenAI-Specific Audit

- [ ] Prompt templates version-controlled
- [ ] Input guardrails active (prompt injection, PII, topic scoping)
- [ ] Output guardrails active (hallucination detection, safety, format)
- [ ] Cost controls on LLM calls (per-query, per-user, per-period)
- [ ] Token usage tracked and attributed
- [ ] Multi-model tiering implemented (not using largest model for all queries)
- [ ] Semantic caching for repeated queries
- [ ] RAG retrieval quality measured (Precision@K, Recall@K)
- [ ] Chunking strategy documented and validated
- [ ] Vector DB operational (backup, monitoring, index optimization)
- [ ] Agent tool governance (whitelist, rate limits, audit logging)
- [ ] Human-in-the-loop for high-stakes agent actions

## Checklist 5: Security Audit

- [ ] OWASP LLM Top 10 assessed
- [ ] Prompt injection testing performed
- [ ] Data exfiltration prevention in place
- [ ] Model extraction monitoring active
- [ ] Access controls on model endpoints (AuthN/AuthZ)
- [ ] API rate limiting configured
- [ ] Encryption at rest for model artifacts and data
- [ ] Encryption in transit (TLS 1.2+)
- [ ] Audit logging for all model invocations
- [ ] Security scanning on model dependencies
- [ ] Adversarial input testing performed
- [ ] Private networking for model endpoints (no public internet)

## Checklist 6: Observability Audit

- [ ] Model performance metrics collected (accuracy, latency, throughput)
- [ ] Data quality metrics collected (schema violations, distribution drift)
- [ ] Pipeline health metrics collected (stage execution time, error rate)
- [ ] Infrastructure metrics collected (CPU, GPU, memory, storage)
- [ ] Alerting configured with appropriate thresholds
- [ ] Alert fatigue assessed (false positive rate acceptable)
- [ ] Dashboards available for operations and business stakeholders
- [ ] Distributed tracing across pipeline stages
- [ ] Log aggregation and searchability
- [ ] Incident response runbooks for common AI failures
