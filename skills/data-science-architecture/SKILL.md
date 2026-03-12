---
name: sofka-data-science-architecture
description: >
  ML/AI system design — model lifecycle, feature stores, experiment tracking, model serving, MLOps pipelines.
  Use when the user asks to "design an ML system", "architect model serving", "set up experiment tracking",
  "design feature store", "plan MLOps pipeline", or mentions model registry, A/B testing, drift detection, or retraining triggers.
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

# Data Science Architecture: ML/AI System Design & Model Lifecycle

Data science architecture defines how machine learning systems are structured end-to-end — from feature engineering through model training, serving, monitoring, and governance. This skill produces ML system documentation that enables teams to build reproducible, scalable, and responsible AI systems.

## Principio Rector

**Un modelo en un notebook no es un producto. Un modelo en producción con monitoring sí lo es.** La arquitectura de data science diseña el ciclo completo: desde feature engineering hasta model serving, monitoring de drift, y governance. MLOps no es DevOps para ML — es la disciplina que convierte experimentos en productos confiables.

### Filosofía de ML Architecture

1. **Reproducibilidad obligatoria.** Cada experimento, cada training run, cada feature pipeline debe ser reproducible. Si no se puede reproducir, no se puede confiar.
2. **Monitoring > accuracy.** Un modelo con 95% accuracy que driftea sin detección es peor que uno con 85% monitoreado. Drift detection es día 1.
3. **Feature store = single source of truth.** Features compartidas entre modelos, versionadas, con lineage. No re-inventar features por modelo.

## Inputs

The user provides a system or project name as `$ARGUMENTS`. Parse `$1` as the **system/project name** used throughout all output artifacts.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para análisis de sistema ML y feature design, HITL para decisiones de serving y governance.
  - **desatendido**: Cero interrupciones. Arquitectura ML documentada automáticamente. Supuestos documentados.
  - **supervisado**: Autónomo con checkpoint en feature store design y model serving decisions.
  - **paso-a-paso**: Confirma cada topology, feature pipeline, serving pattern, y governance policy.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 topology + S4 serving + S6 governance) | `técnica` (full 6 sections, default)

Before generating architecture, detect the codebase context:

```
!find . -name "*.py" -o -name "*.ipynb" -o -name "*.yaml" -o -name "*.toml" -o -name "Dockerfile" | head -30
```

Use detected frameworks (PyTorch, TensorFlow, scikit-learn, MLflow, Kubeflow, etc.) to tailor recommendations.

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/ml-system-patterns.md
```

---

## When to Use

- Designing end-to-end ML systems from data ingestion through model serving
- Architecting feature stores and feature engineering pipelines
- Setting up experiment tracking and model registry infrastructure
- Designing model serving architectures (real-time, batch, streaming)
- Planning MLOps pipelines with CI/CD for ML, monitoring, and retraining
- Establishing responsible AI governance (bias detection, explainability, audit)

## When NOT to Use

- General data pipeline design without ML components → use data-engineering skill
- BI dashboards and reporting architecture → use bi-architecture skill
- Application-level software architecture → use software-architecture skill
- Infrastructure provisioning and compute scaling → use infrastructure-architecture skill

---

## Delivery Structure: 6 Sections

### S1: ML System Topology

Maps the overall ML system structure — training vs serving paths, online vs batch inference, data flow.

**Includes:**
- Training pipeline topology (data ingestion, preprocessing, training, evaluation, registration)
- Serving topology (online endpoints, batch scoring, streaming inference)
- Data flow diagram showing feature computation, model input/output, feedback loops
- Environment separation (dev, staging, production) with promotion gates
- Infrastructure mapping (GPU/CPU allocation, storage, networking)

**MLOps maturity level** (assess before designing):
- Level 0: Manual notebooks, no reproducibility — define bridge to production code
- Level 1: Automated training pipelines, manual deployment — add CI/CD for model promotion
- Level 2: Full CI/CD for training and deployment — add drift monitoring and automated retraining
- Level 3: Autonomous operations with self-healing pipelines — add cost governance and audit

**Key decisions:**
- Online vs batch vs streaming inference: latency requirements drive this (sub-100ms = online, minutes-acceptable = batch, continuous = streaming)
- Centralized vs federated training: single platform vs team-owned pipelines
- Feature computation: training-serving skew prevention strategy is non-negotiable

### S2: Feature Engineering & Store Design

Defines how features are computed, stored, served, and reused across models.

**Feature store comparison — select based on ecosystem:**

| Criterion | Feast | Tecton | Hopsworks |
|---|---|---|---|
| **Best for** | Open-source, cloud-agnostic | Real-time features at scale | End-to-end ML platform |
| **Online store** | Redis, DynamoDB, Bigtable | Managed low-latency store | RonDB (sub-ms) |
| **Offline store** | BigQuery, Snowflake, Redshift, S3 | S3/Spark-based | Hive/S3 |
| **Streaming transforms** | Limited (requires external) | Native Spark/Flink | Native Spark/Flink |
| **Cost model** | Free + infra costs | Per-feature-read pricing | License + infra |
| **Choose when** | Budget-constrained, <50 features online | High-throughput real-time serving | Want unified ML platform |

**Includes:**
- Feature pipeline architecture (batch transforms, streaming aggregations, on-demand computation)
- Feature store design (offline store for training, online store for serving)
- Feature registry (discovery, documentation, ownership, lineage)
- Training-serving consistency (point-in-time correctness, backfill strategy)

**Key decisions:**
- Push vs pull feature computation: latency vs freshness trade-off
- Materialization strategy: precompute vs on-demand vs hybrid
- Online store technology: Redis/DynamoDB for sub-millisecond serving; offline in Parquet/Delta — never serve training features from the online store
- Schema evolution: backward compatibility for downstream models

### S3: Experiment Tracking & Model Registry

Documents how experiments are tracked, models versioned, and lineage maintained.

**Experiment tracking tool comparison:**

| Criterion | MLflow | W&B (Weights & Biases) | Vertex AI Experiments |
|---|---|---|---|
| **Best for** | Open-source, self-hosted control | Collaboration, visualization | GCP-native teams |
| **Hosting** | Self-managed or Databricks | SaaS (cloud-hosted) | Managed on GCP |
| **Strengths** | Model registry, broad integrations | Real-time collab, sweep search, report sharing | Tight Vertex pipeline integration |
| **Weaknesses** | UI less polished, scaling effort | Vendor lock-in, cost at scale | GCP-only, less flexible |
| **Cost model** | Free (OSS) + infra | Free tier → $50/user/mo (Team) | Pay-per-use GCP pricing |
| **Choose when** | Multi-cloud, Databricks shop | Research-heavy teams needing rich comparison UI | Already on GCP Vertex |

**Includes:**
- Experiment tracking setup (parameters, metrics, artifacts, code snapshots)
- Model registry design (versioning, staging → production promotion)
- Lineage tracking (data version, feature version, code version, model version)
- Reproducibility framework (environment capture, seed management, deterministic training)

**Key decisions:**
- Model versioning granularity: full model vs incremental checkpoints
- Approval gates: automated quality checks vs manual review for production promotion
- Artifact storage: object store + model registry + container registry integration

### S4: Model Serving Architecture

Designs how models are deployed, scaled, and managed in production.

**Model monitoring stack — select by need:**

| Tool | Focus | Best For | Integration |
|---|---|---|---|
| **Evidently** | Data/model drift, test suites | OSS teams, CI/CD integration | Python lib, dashboards, Grafana |
| **Arize** | Production monitoring, embeddings | Real-time debugging, LLM observability | SDK, auto-instrumentation |
| **WhyLabs** | Continuous profiling, anomaly detection | High-volume streaming, privacy-preserving | whylogs agent, lightweight |
| **Fiddler** | Explainability + monitoring | Regulated industries, model cards | REST API, notebook SDK |

Selection criteria: choose Evidently for budget-conscious OSS; Arize for real-time + LLM workloads; WhyLabs for high-throughput with minimal overhead; Fiddler when explainability is a regulatory requirement.

**Includes:**
- Serving infrastructure (REST/gRPC endpoints, serverless functions, embedded models)
- A/B testing infrastructure (traffic splitting, power analysis for sample size, guardrail metrics that auto-halt experiments, rollback at p < 0.05 with 95% CI)
- Canary deployment (1% → 5% → 25% → 100% ramp, health checks, automatic rollback)
- Shadow mode (parallel inference without serving, comparison metrics)
- Latency optimization (model compilation, quantization, caching, batching)

**Key decisions:**
- Model format: native framework vs ONNX vs TensorRT — ONNX for portability, TensorRT for NVIDIA-specific latency wins
- Scaling strategy: horizontal (replicas) vs vertical (GPU) vs serverless (Lambda/Cloud Run for bursty traffic)
- Fallback behavior: degraded predictions, cached results, or error response — define per-model

### S5: MLOps Pipeline Design

Defines CI/CD for ML — automated training, testing, deployment, monitoring, and retraining.

**GPU cost optimization formulas:**
- Spot/preemptible instances: 60-90% savings for fault-tolerant training with checkpointing every N steps
- Quantization ROI: INT8 cuts inference cost 2-4x with <1% accuracy loss for most classification tasks; FP16 is safe default for training
- Cascade routing: cheap model (e.g., logistic regression) handles 70-80% of requests; expensive model only when confidence < threshold — reduces serving cost 3-5x
- Right-sizing: use T4 ($0.35/hr) for inference before reaching for A100 ($3.67/hr); profile actual GPU utilization — most serving workloads use <30% of an A100
- Multi-instance GPU (MIG): share A100 into 7 partitions for small-model serving
- Budget alerts: set daily spend caps with anomaly detection; alert at 80% threshold

**Includes:**
- CI/CD pipeline stages (data validation, training, evaluation, deployment, monitoring)
- Automated retraining triggers (schedule, drift detection, performance degradation below threshold)
- Model testing framework (unit tests, integration tests, performance benchmarks, bias checks)
- Pipeline orchestration (DAG design, dependency management, failure handling)

**Key decisions:**
- Trigger-based vs scheduled retraining: data volatility determines cadence
- Full retrain vs incremental update: model type and data volume trade-off
- Automated vs gated deployment: risk tolerance for production changes

### S6: Governance & Responsible AI

Establishes guardrails for bias detection, explainability, audit trails, and compliance.

**Responsible AI checklist (mandatory for production models):**
1. **Model card published** — fields: model details, intended use, training data summary, evaluation metrics across subgroups, fairness analysis, limitations, ethical considerations
2. **Bias metrics computed** — demographic parity difference < 0.1, equalized odds difference < 0.1 (adjust thresholds by domain; healthcare/finance require stricter)
3. **Explainability integrated** — SHAP values for tabular, Grad-CAM for vision, attention weights for NLP; global + local explanations available
4. **Data audit completed** — training data profiled for representation gaps, label quality, proxy variables
5. **Human override mechanism** — defined escalation path for high-stakes decisions
6. **Audit trail active** — who trained what, when, with which data, approved by whom
7. **Compliance mapped** — EU AI Act risk classification, GDPR data processing basis, industry-specific requirements

**Includes:**
- Bias detection framework (pre-training data audit, post-training fairness metrics)
- Explainability tooling (SHAP, LIME, feature importance, model cards)
- Data privacy controls (PII handling, differential privacy, federated learning)
- Model risk classification (low/medium/high risk with corresponding controls)

**Key decisions:**
- Fairness metrics: demographic parity, equalized odds, calibration — context-dependent; document why chosen metric fits the use case
- Audit granularity: decision-level logging vs aggregate monitoring
- Human-in-the-loop: when automated decisions require human oversight

---

## Trade-off Matrix

| Decision | Enables | Constrains | Threshold |
|---|---|---|---|
| **Centralized Feature Store** | Feature reuse, consistency | Team autonomy, single point of failure | 3+ models sharing features |
| **Real-Time Serving** | Low latency, interactive UX | Infrastructure cost, complexity | Sub-second SLA required |
| **Batch Inference** | Cost efficiency, simpler infra | Stale predictions | Minutes-to-hours latency acceptable |
| **Automated Retraining** | Fresh models, reduced toil | Compute cost, bad deployment risk | Stable pipelines with drift monitoring |
| **Shadow Deployment** | Risk-free validation | Double compute cost | High-risk models, regulatory requirements |
| **Model Ensemble** | Higher accuracy, robustness | Latency, debugging difficulty | Single-model accuracy insufficient |

---

## Assumptions

- ML use cases validated (business value confirmed before architecture)
- Training data accessible and profiled for quality
- Team has ML engineering capability (not just data science notebooks)
- Infrastructure budget supports chosen serving and training patterns
- Regulatory requirements known (industry, geography, data sensitivity)

## Limits

- Focuses on *ML system architecture*, not algorithm selection or hyperparameter tuning
- Does not design *data pipelines* upstream of ML
- Does not address *application integration* patterns
- Model performance optimization requires domain expertise beyond architectural design

---

## Edge Cases

**Notebook-to-Production Migration:**
Most ML starts in notebooks. Define the bridge: refactor into modular code, add tests, containerize, integrate with CI/CD. Provide incremental adoption path — expect resistance.

**Multi-Model Systems:**
When multiple models interact (ensemble, pipeline, routing), address dependency management, versioning across models, and cascade failure scenarios. Pin model versions for reproducibility.

**Edge/On-Device Deployment:**
Constraints: model size (<50MB typical), quantization (INT8/TFLite), OTA update mechanisms, offline capability. Architecture must address fallback when connectivity is lost.

**Regulated Industries (Healthcare, Finance):**
Audit trail, explainability, and bias detection are mandatory from day one. Model cards, decision logging, human override mechanisms are not optional.

**Cold Start / No Historical Data:**
Feature stores and training pipelines assume historical data. Include bootstrapping strategies, rule-based fallbacks, and progressive learning with feedback loops.

**LLM/Foundation Model Integration:**
When wrapping or fine-tuning LLMs, address: prompt versioning, evaluation frameworks (human + automated), cost per inference tracking, guardrails for hallucination and toxicity, RAG pipeline architecture if applicable.

---

## Validation Gate

Before finalizing delivery, verify:

- [ ] Training and serving paths separated with consistent feature computation
- [ ] Feature store prevents training-serving skew
- [ ] Experiment tracking captures full lineage (data, code, parameters, metrics)
- [ ] Model registry has promotion workflow (staging → production → rollback)
- [ ] Serving architecture meets latency SLA (measured, not estimated)
- [ ] A/B testing or shadow deployment strategy defined with statistical rigor
- [ ] Retraining triggers and pipeline automation specified
- [ ] Drift detection monitors both data distribution and model performance
- [ ] Responsible AI checklist completed (model card, bias metrics, explainability)
- [ ] GPU cost optimization applied (right-sizing, spot instances, quantization)

---

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | ✅ | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `A-01_Data_Science_Architecture.html` — ML system topology, feature store design, experiment tracking, model serving architecture, MLOps pipeline, governance framework.

**Secondary:** Model cards (.md), feature registry catalog, MLOps pipeline DAG diagram, bias audit report template.

---
**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026
