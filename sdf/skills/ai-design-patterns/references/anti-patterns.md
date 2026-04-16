# AI System Anti-Patterns

## Training-Serving Skew

**Symptom**: Model performs well in development but poorly in production.
**Cause**: Feature computation logic differs between training pipeline and serving pipeline. Features computed differently, missing features, or stale features in production.
**Fix**: Feature Store pattern — single source of truth for feature computation used by both training and serving. Shared transformation code. Integration tests comparing training and serving feature outputs.

---

## YOLO Deploy (No Staging)

**Symptom**: Model deployed directly to production without staged validation.
**Cause**: Skipping Blue & Gold deployment, no canary, no shadow testing.
**Fix**: Blue & Gold CI/CD with mandatory validation gates (model quality, data quality, performance, security, regression). Shadow deployment before canary. Automated rollback triggers.

---

## Notebook-to-Production Copy-Paste

**Symptom**: Production code is a cleaned-up copy of Jupyter notebook. Fragile, untested, non-reproducible.
**Cause**: No pipeline infrastructure. Data scientists work in notebooks; engineering team copy-pastes to production.
**Fix**: Extract notebook logic into reusable pipeline stages. Use orchestrators (Airflow, Dagster) for production. Papermill/Ploomber for notebook-aware orchestration as interim.

---

## Monolithic Pipeline

**Symptom**: Single, massive pipeline that handles everything — ingestion, transformation, training, serving, monitoring. Any change requires full redeployment.
**Cause**: Organic growth without architecture. Started as a script, became a monolith.
**Fix**: Decompose into stages with defined contracts. Apply Pipe-and-Filter pattern. Bulkhead isolation between stages. Independent scaling per stage.

---

## Silent Model Degradation

**Symptom**: Model accuracy degrades gradually. No one notices until business metrics crater.
**Cause**: No drift detection, no continuous performance monitoring, no automated alerts.
**Fix**: Drift Detection pattern with statistical tests on inputs and outputs. Automated alerts at threshold. Scheduled model revalidation against recent ground truth. Dashboard visibility.

---

## Feature Sprawl

**Symptom**: Hundreds of features, many redundant or unused. Feature engineering is ad-hoc and duplicated across teams.
**Cause**: No feature governance. Each model team creates features independently.
**Fix**: Feature Store with registry. Feature ownership and lifecycle management. Deprecation workflow for unused features. Feature impact analysis before removal.

---

## Alert Fatigue from ML Monitoring

**Symptom**: Operations team ignores ML alerts because too many false positives.
**Cause**: Overly sensitive thresholds, no alert prioritization, monitoring everything equally.
**Fix**: Tiered alerting (critical, warning, info). Composite health scores instead of per-metric alerts. Suppress alerts during known events (retraining, deployment). Alert on trends, not single-point anomalies.

---

## God Model

**Symptom**: Single model handles all use cases, all input types, all predictions.
**Cause**: Scope creep. "The model can do it all."
**Fix**: Decompose into specialized models per use case. Champion-Challenger per domain. Clear model scope boundaries. Model router that directs requests to appropriate specialist model.

---

## Compliance Afterthought

**Symptom**: Audit reveals model decisions are unexplainable, training data lineage is lost, no fairness testing.
**Cause**: Compliance requirements treated as post-hoc addition, not architectural driver.
**Fix**: Explainability Wrapper from day one. Data lineage tracking across pipeline. Fairness metrics in validation gates. Model governance workflow in model registry. Audit trail for all model decisions.

---

## Detection Checklist

| Anti-Pattern | Detection Signal |
|---|---|
| Training-Serving Skew | Production accuracy << validation accuracy |
| YOLO Deploy | No staging environment for models |
| Notebook Copy-Paste | Production code imports Jupyter-specific libraries |
| Monolithic Pipeline | Single deployment unit for entire ML pipeline |
| Silent Degradation | No drift monitoring, no model performance dashboards |
| Feature Sprawl | Features > 3x what any single model uses |
| Alert Fatigue | >50% of ML alerts acknowledged without action |
| God Model | Single model endpoint handles >3 distinct use cases |
| Compliance Afterthought | No explainability infrastructure, no fairness tests |
