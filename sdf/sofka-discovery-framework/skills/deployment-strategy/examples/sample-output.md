# Deployment Strategy — Sample Output

## Context
A fintech API platform serving 500 B2B clients needs a deployment strategy. Currently deploying monthly with 30-minute maintenance windows. Target: daily deployments with zero downtime.

## Output

### Deployment Strategy: Canary with Progressive Delivery

**Pattern**: Canary deployment with automated metric analysis, managed by Flagger on Kubernetes.

### Progressive Delivery Pipeline

```
┌─────────┐   ┌──────────┐   ┌───────────┐   ┌──────────┐   ┌──────────┐
│  Merge   │──>│  Build   │──>│  Staging  │──>│  Canary  │──>│   Full   │
│  to main │   │  + Test  │   │  Deploy   │   │  (5%)    │   │  Rollout │
└─────────┘   └──────────┘   └───────────┘   └──────────┘   └──────────┘
                                   │              │               │
                              Smoke tests    Metric analysis   Monitor
                              pass/fail      10 min window     24 hours
                                                  │
                                             Auto-promote
                                             or rollback
```

### Canary Promotion Criteria

| Metric | Threshold | Comparison |
|--------|-----------|-----------|
| HTTP 5xx rate | < 0.1% | Must not exceed baseline + 0.05% |
| p95 latency | < 200ms | Must not exceed baseline + 20% |
| p99 latency | < 500ms | Must not exceed baseline + 30% |
| Business metric: API calls/min | Stable | Must not drop > 5% vs. baseline |
| Pod restart count | 0 | Zero restarts during canary window |

**Analysis window**: 10 minutes at each stage.
**Stages**: 5% → 25% → 50% → 100%.
**Total rollout time**: ~40 minutes if all gates pass.

### Flagger Configuration (excerpt)

```yaml
apiVersion: flagger.app/v1beta1
kind: Canary
metadata:
  name: api-gateway
  namespace: production
spec:
  targetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: api-gateway
  service:
    port: 8080
  analysis:
    interval: 2m
    threshold: 3          # max failed checks before rollback
    maxWeight: 50         # max canary traffic weight
    stepWeight: 10        # traffic increment per step
    metrics:
      - name: request-success-rate
        thresholdRange:
          min: 99.9
        interval: 1m
      - name: request-duration
        thresholdRange:
          max: 200
        interval: 1m
    webhooks:
      - name: smoke-test
        type: pre-rollout
        url: http://smoke-tests.default/run
```

### Database Migration Strategy (Expand-Contract)

| Phase | Action | Rollback Safe? |
|-------|--------|:---:|
| **Expand** (deploy v2 schema) | Add new columns/tables, keep old ones | Yes — v1 code ignores new columns |
| **Migrate** (background job) | Backfill new columns from old data | Yes — old columns still authoritative |
| **Switch** (deploy v2 code) | v2 code reads/writes new columns | Yes — v1 code still works with old columns |
| **Contract** (deploy v3 schema) | Remove old columns after 7-day bake | No — point of no return |

**Rule**: The contract phase must be a separate deployment at least 7 days after the switch phase.

### Feature Flag Integration

| Flag Type | Lifecycle | Example | Cleanup Policy |
|-----------|-----------|---------|---------------|
| Release flag | Temporary (2 sprints max) | `enable_new_invoice_format` | Auto-ticket created at sprint +2 |
| Ops flag | Permanent | `circuit_breaker_payments` | Reviewed quarterly |
| Experiment flag | Time-boxed (2 weeks) | `experiment_checkout_v2` | Auto-disabled after experiment end date |

### Rollback Procedures

| Scenario | Action | RTO |
|----------|--------|:---:|
| Canary metric failure | Automatic: Flagger reverts to baseline | < 2 min |
| Post-rollout metric degradation | Manual: `kubectl rollout undo deployment/api-gateway` | < 5 min |
| Database migration issue (expand phase) | Drop new columns, redeploy previous version | < 15 min |
| Database migration issue (contract phase) | Restore from backup + point-in-time recovery | < 1 hour |
| Feature flag causing issues | Kill switch: disable flag in LaunchDarkly | < 30 sec |

### DORA Metrics Targets

| Metric | Current | Target (6 months) |
|--------|---------|-------------------|
| Deployment Frequency | Monthly | Daily |
| Lead Time for Changes | 30 days | < 1 day |
| Change Failure Rate | 15% | < 5% |
| Mean Time to Recovery | 2 hours | < 15 minutes |
