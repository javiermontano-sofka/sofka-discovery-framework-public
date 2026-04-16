# AWS AI Deployment Patterns

## Pattern 1: Blue/Green Deployment for SageMaker

### Architecture
```
Production Traffic → ALB/API GW → Blue Endpoint (current model v1)
                                → Green Endpoint (new model v2, validation traffic)

Promotion: Green passes gates → shift traffic → Blue becomes previous → Green becomes Blue
Rollback: Green fails → remove Green → Blue continues unchanged
```

### Implementation Steps
1. Deploy new model version to Green endpoint
2. Run automated validation (accuracy, fairness, latency, regression)
3. Route canary traffic (5-10%) to Green
4. Monitor metrics for anomalies (15-60 minutes)
5. Gradually increase Green traffic (25% → 50% → 100%)
6. Decommission Blue (keep for 24h as rollback target)

### Validation Gates
```yaml
Gates:
  - accuracy >= threshold (from model registry metadata)
  - fairness >= 90% demographic parity
  - latency_p95 < 500ms
  - error_rate < 1%
  - no_accuracy_regression > 2% vs Blue
```

---

## Pattern 2: Canary Deployment with CloudWatch

### Architecture
```
API Gateway → Lambda@Edge (routing) → 95% Blue Endpoint
                                    → 5% Canary Endpoint

CloudWatch Alarm (error_rate > threshold) → Auto-rollback (100% to Blue)
```

### Canary Metrics
- Error rate comparison (canary vs. blue)
- Latency comparison (canary vs. blue)
- Model quality comparison (accuracy sample)
- Cost per invocation comparison

### Auto-Rollback Triggers
- Error rate > 5% (absolute)
- Error rate > 2x blue rate (relative)
- Latency P99 > 2x blue P99
- CloudWatch composite alarm

---

## Pattern 3: A/B Testing for Model Evaluation

### Architecture
```
API Gateway → SageMaker Endpoint (Production Variant A: 50%, Variant B: 50%)
                                  → CloudWatch (per-variant metrics)
                                  → Kinesis → Analytics (statistical significance)
```

### Implementation
1. Create SageMaker endpoint with 2 production variants
2. Configure traffic distribution (50/50 or custom split)
3. Log predictions with variant ID to Kinesis
4. Analyze results for statistical significance
5. Promote winning variant to 100%

### Statistical Significance
- Minimum sample size per variant (calculate beforehand)
- Duration: typically 1-2 weeks for sufficient data
- Metrics: primary (accuracy, task completion) + guardrail (latency, cost)
- Decision: promote if statistically significant improvement AND no guardrail violation

---

## Pattern 4: Shadow Deployment

### Architecture
```
Production Traffic → Blue Endpoint → Production Response (returned to user)
                  → Shadow Endpoint → Shadow Response (logged, NOT returned)
                  → Comparison Engine (Lambda) → Metrics Dashboard
```

### Implementation
1. Deploy shadow model to separate endpoint
2. Fork incoming traffic (async, non-blocking)
3. Run shadow inference in parallel
4. Compare shadow vs production results
5. Evaluate shadow performance without user impact
6. Promote shadow to production if superior

### Comparison Metrics
- Response similarity (for generation: BLEU, ROUGE, semantic similarity)
- Accuracy comparison (if ground truth available)
- Latency comparison
- Cost comparison
- Edge case behavior analysis

---

## Pattern 5: Feature Flag Deployment

### Architecture
```
API Gateway → Lambda → Feature Flag Check (AppConfig) → Model A (flag off)
                                                       → Model B (flag on)
```

### Implementation with AppConfig
1. Create AppConfig application and environment
2. Create feature flag configuration profile
3. Implement flag check in Lambda (cached, with fallback)
4. Deploy new model
5. Gradually enable flag (by user %, by region, by tenant)
6. Monitor metrics per flag state
7. Remove flag and legacy code after full rollout

### Flag Strategies
- Percentage rollout (0% → 5% → 25% → 50% → 100%)
- User-based (internal users first, then beta, then GA)
- Region-based (low-traffic region first)
- Tenant-based (non-critical tenants first)

---

## Rollback Procedures

### SageMaker Endpoint Rollback
```
1. Identify previous model version in Model Registry
2. Update endpoint to previous model
3. Or: shift traffic back to Blue endpoint (if Blue/Green)
4. Verify rollback successful (metrics return to baseline)
5. Post-mortem: analyze why new version failed
```

### Bedrock Knowledge Base Rollback
```
1. Revert S3 data source to previous version
2. Re-sync knowledge base
3. Verify retrieval quality returns to baseline
4. Or: point to backup OpenSearch collection
```

### Prompt Template Rollback
```
1. Revert to previous prompt version in S3/parameter store
2. Lambda picks up new version (or redeploy)
3. Verify response quality returns to baseline
```

### Emergency Procedures
```
Circuit Breaker Activation:
  1. Model endpoint returns errors > threshold
  2. Circuit breaker opens (Lambda/API GW)
  3. Serve cached responses OR
  4. Return graceful degradation message
  5. Alert on-call team
  6. Investigate and fix
  7. Close circuit breaker when healthy
```
