# AI Design Patterns Catalog — Quick Reference

## AI-Specific Architectural Patterns

### Feature Store Pattern
**Problem**: Inconsistent feature computation between training and serving; redundant feature engineering across teams.
**Solution**: Centralize feature computation, storage, and serving. Single source of truth for feature definitions.
**Enables**: Consistency, reuse, drift monitoring
**Constrains**: Additional infrastructure, governance overhead
**When to use**: Multiple models share features; training-serving skew is a risk; feature drift monitoring needed
**Examples**: Feast, Tecton, Vertex AI Feature Store

### Champion-Challenger Pattern (A/B Testing)
**Problem**: Uncertainty about whether a new model improves over the current production model.
**Solution**: Run new model (challenger) alongside current model (champion) with controlled traffic split.
**Enables**: Data-driven model updates, risk management
**Constrains**: Doubled compute during testing, statistical significance requirements
**When to use**: Model updates in production; need evidence before full rollout
**Variants**: Multi-armed bandit (dynamic traffic allocation), interleaving

### Shadow Deployment Pattern
**Problem**: Need to evaluate new model on production data without affecting users.
**Solution**: Run new model in parallel, capture predictions for comparison, but serve only from production model.
**Enables**: Real-world performance data without operational risk
**Constrains**: Doubled inference compute, no user feedback signal
**When to use**: High-stakes predictions; regulatory requirements for pre-deployment validation

### Drift Detection Pattern
**Problem**: Model performance degrades silently as data distributions change over time.
**Solution**: Continuously monitor input/output distributions; alert and trigger retraining when drift exceeds thresholds.
**Enables**: Proactive model updates, early warning
**Constrains**: Monitoring infrastructure, threshold calibration effort
**When to use**: All production AI systems (essential, not optional)
**Techniques**: KS test, PSI, Wasserstein distance, ADWIN, DDM

### Explainability Wrapper Pattern
**Problem**: Complex models produce predictions without interpretable rationale.
**Solution**: Augment model outputs with interpretable explanations (feature importance, decision rationale).
**Enables**: Transparency, regulatory compliance, user trust
**Constrains**: Added latency, explanation fidelity vs. completeness trade-off
**When to use**: High-stakes decisions; regulated industries; user-facing predictions
**Techniques**: SHAP, LIME, attention maps, counterfactual explanations

### Canary Deployment Pattern
**Problem**: New model version might degrade performance in production.
**Solution**: Gradually route increasing traffic to new version while monitoring for issues.
**Enables**: Progressive validation, limited exposure to potential issues
**Constrains**: Complex routing infrastructure, extended deployment timeline
**When to use**: Production model updates; systems with strict availability requirements

### Bulkhead Pattern (Isolation)
**Problem**: Failure in one AI component cascades to others sharing resources.
**Solution**: Partition system into isolated compartments with independent resource pools.
**Enables**: Fault containment, graceful degradation, independent scaling
**Constrains**: Resource overhead (each compartment needs its own allocation)
**When to use**: Multi-model serving; shared GPU infrastructure; critical availability requirements

---

## Traditional Patterns Adapted for AI

### Service-Oriented Pattern
**AI adaptation**: Organize AI capabilities as independent services — feature services, model services, explanation services — each with well-defined interfaces, enabling independent evolution.

### Balancer Pattern
**AI adaptation**: Distribute inference load across GPU nodes with awareness of model-specific hardware requirements (GPU memory, compute intensity). Support heterogeneous hardware pools.

### Fail-and-Repeat Pattern
**AI adaptation**: Implement retry with backoff for transient failures in distributed AI systems (GPU contention, network partitions, rate-limited API calls to external models).

### Throttle Pattern
**AI adaptation**: Limit concurrent inference requests to prevent GPU memory exhaustion. Queue management for expensive operations like batch feature computation.

### Circuit Pattern
**AI adaptation**: Disable failing model endpoint and redirect to fallback when error rate exceeds threshold. Prevent cascading failure during model or pipeline outages.

### N-Party Voting Control Pattern
**AI adaptation**: Ensemble predictions from multiple models require consensus. Federated validation of data quality across distributed data sources.

---

## Pipeline Architecture Patterns

### Pipe-and-Filter
**Use**: Linear data processing → transformation → model execution flows.
**Strength**: Clear stage separation, independent stage scaling, easy debugging.
**Weakness**: Latency accumulation across stages; rigid flow.

### Distributed Store
**Use**: Shared data access across pipeline components.
**Strength**: Decoupled components, flexible access patterns.
**Weakness**: Consistency challenges, storage costs at scale.

### Blackboard
**Use**: Multiple AI components contribute to a shared solution space.
**Strength**: Flexible expert composition, emergent behavior.
**Weakness**: Complex coordination, non-deterministic behavior.

### Service Orientation
**Use**: AI capabilities exposed as independent services.
**Strength**: Independent deployment, technology diversity, team autonomy.
**Weakness**: Network overhead, distributed debugging complexity.
