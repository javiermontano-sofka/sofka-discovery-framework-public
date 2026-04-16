# AI-Specific Design Patterns — Detailed Catalog

## Feature Store Pattern

**Intent**: Centralize feature computation, storage, and serving to ensure consistency between training and inference, eliminate training-serving skew, and enable feature reuse across models.

**Structure**:
- **Offline Store**: Batch-computed features for training (high throughput, high latency acceptable)
- **Online Store**: Low-latency feature serving for inference (sub-millisecond reads)
- **Feature Registry**: Metadata catalog — feature definitions, owners, lineage, freshness SLAs
- **Transformation Engine**: Computes features from raw data using registered transformations

**Key decisions**:
- Managed (Feast, Tecton, Vertex AI Feature Store) vs. custom
- Point-in-time correctness for training data (prevent data leakage)
- Feature freshness requirements (real-time vs. near-real-time vs. batch)
- Feature versioning strategy

**Trade-offs**: Consistency + reuse vs. infrastructure overhead + governance cost.

---

## Champion-Challenger Pattern (A/B Testing)

**Intent**: Compare a production model (Champion) against candidate models (Challengers) using live traffic to make evidence-based promotion decisions.

**Structure**:
- **Traffic Router**: Splits requests between Champion and Challenger(s) based on configured percentages
- **Metric Collector**: Captures prediction results, latency, user feedback for all models
- **Statistical Analyzer**: Determines if Challenger performance is statistically significant
- **Decision Engine**: Promotes, retains, or retires models based on analysis

**Key decisions**:
- Traffic split percentage (typically 5-20% for Challenger)
- Statistical significance threshold (p-value, confidence interval)
- Duration of experiment
- Metrics to optimize (accuracy, latency, business KPIs)
- Multi-armed bandit vs. fixed split

**Trade-offs**: Evidence-based deployment vs. complexity + potential user impact during testing.

---

## Shadow Deployment Pattern

**Intent**: Run a new model in parallel with production without affecting users. New model receives real traffic but its predictions are discarded — only logged for comparison.

**Structure**:
- **Request Duplicator**: Copies production requests to shadow model
- **Shadow Model**: Processes duplicated requests independently
- **Comparison Engine**: Compares shadow predictions against production predictions
- **Report Generator**: Produces divergence analysis and performance comparison

**Key decisions**:
- Full shadow vs. sampled shadow (cost implications)
- Comparison metrics and divergence thresholds
- Duration before promotion decision
- Resource allocation for shadow infrastructure

**Trade-offs**: Zero user risk + real-world validation vs. doubled infrastructure cost + no user feedback integration.

---

## Drift Detection Pattern

**Intent**: Continuously monitor model inputs and outputs for distributional shifts that indicate model degradation, triggering retraining or alerts before performance drops.

**Types of drift**:
- **Data Drift**: Input feature distributions shift from training distribution
- **Concept Drift**: Relationship between inputs and outputs changes
- **Prediction Drift**: Model output distribution shifts unexpectedly
- **Label Drift**: Ground truth distribution changes

**Detection methods**:
- Statistical tests (KS test, PSI, chi-squared, Jensen-Shannon divergence)
- Window-based comparison (reference window vs. current window)
- Page-Hinkley test for sequential change detection
- Custom business rule thresholds

**Response actions**:
- Alert operations team
- Trigger automated retraining pipeline
- Degrade to lower autonomy level (e.g., from Level 4 to Level 3)
- Switch to fallback model
- Activate human-in-the-loop override

**Trade-offs**: Early degradation detection vs. false positive alerts + monitoring overhead.

---

## Explainability Wrapper Pattern

**Intent**: Wrap model inference with explanation generation, providing feature attributions, confidence scores, and human-readable justifications alongside predictions.

**Structure**:
- **Prediction Service**: Core model inference
- **Explanation Engine**: Generates explanations (SHAP, LIME, Integrated Gradients, attention maps)
- **Confidence Scorer**: Calibrated probability or uncertainty estimation
- **Format Adapter**: Converts explanations to appropriate format per consumer (technical vs. business vs. regulatory)

**Key decisions**:
- Explanation method (model-agnostic vs. model-specific)
- Explanation granularity (global vs. local)
- Latency budget for explanation generation
- Storage and retention of explanations (compliance requirement)

**Trade-offs**: Transparency + compliance vs. latency overhead + explanation fidelity.

---

## Canary Deployment Pattern

**Intent**: Gradually shift traffic from current model to new model, monitoring for regressions at each increment before proceeding.

**Stages**:
1. Deploy new model alongside current (0% traffic)
2. Route small percentage (1-5%) to new model
3. Monitor metrics for predefined duration
4. Increment traffic if metrics are healthy
5. Continue until 100% or rollback if regression detected

**Key decisions**:
- Initial canary percentage
- Increment steps and monitoring duration per step
- Rollback trigger criteria (latency, error rate, accuracy drop)
- Automated vs. manual progression

**Trade-offs**: Gradual risk mitigation vs. slower deployment + complexity.

---

## Bulkhead Pattern (for AI)

**Intent**: Isolate AI pipeline components so that failure in one does not cascade to others. Inspired by ship compartmentalization.

**AI-specific applications**:
- Separate inference services per model (one model's OOM doesn't kill others)
- Isolate feature computation from model serving
- Separate training workloads from inference workloads
- Resource quotas per pipeline stage

**Key decisions**:
- Granularity of isolation (per-model, per-pipeline-stage, per-tenant)
- Resource allocation per bulkhead
- Communication patterns between bulkheads (sync vs. async)
- Monitoring per bulkhead

**Trade-offs**: Fault isolation + independent scaling vs. resource overhead + operational complexity.

---

## N-Party Voting Pattern (Ensemble)

**Intent**: Multiple models independently process the same input; a voting mechanism aggregates their outputs to produce a final prediction with higher confidence and robustness.

**Voting strategies**:
- **Majority vote**: Most common prediction wins (classification)
- **Weighted vote**: Models weighted by historical accuracy or confidence
- **Stacking**: Meta-model trained on base model outputs
- **Averaging**: Mean/median of predictions (regression)

**Key decisions**:
- Number of models (odd for majority voting)
- Model diversity strategy (different algorithms, different training data, different features)
- Latency impact (parallel vs. sequential execution)
- Disagreement handling (high disagreement → human escalation)

**Trade-offs**: Robustness + reduced variance vs. latency + compute cost + complexity.
