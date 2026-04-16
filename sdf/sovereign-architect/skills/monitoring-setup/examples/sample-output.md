# Monitoring Setup — Sample Output

## Context
Setting up SLOs and monitoring for a payment processing API handling 10K requests/minute.

## Output

### SLO Definitions

| SLI | Measurement | SLO Target | Window | Error Budget |
|-----|------------|------------|--------|-------------|
| Availability | Successful responses / Total requests | 99.95% | 30 days | 7,200 errors/day |
| Latency (p99) | 99th percentile response time | < 500ms | 30 days | 0.05% requests > 500ms |
| Latency (p50) | 50th percentile response time | < 100ms | 30 days | Informational (no alert) |
| Error Rate | 5xx responses / Total responses | < 0.05% | 30 days | 7,200 errors/day |

### Dashboard: Payment API Overview

```
Row 1: [Request Rate (rpm)] [Error Rate (%)] [P50/P95/P99 Latency] [Availability SLO %]
Row 2: [Error Budget Remaining] [Burn Rate (1h/6h/24h)] [Active Incidents] [Deploy Markers]
Row 3: [Top 5 Error Codes] [Slowest Endpoints] [DB Connection Pool] [Redis Hit Rate]
Row 4: [Pod CPU/Memory] [Horizontal Pod Count] [Network I/O] [Disk Usage]
```

### Alerting Rules

| Alert | Condition | Severity | Action | Runbook |
|-------|-----------|----------|--------|---------|
| Fast Burn | >14.4x burn rate for 5min AND >14.4x for 1h | PAGE | Wake on-call, investigate immediately | `/runbooks/payment-fast-burn.md` |
| Slow Burn | >3x burn rate for 6h | TICKET | Investigate within 4h, likely gradual degradation | `/runbooks/payment-slow-burn.md` |
| Availability Below SLO | < 99.95% in rolling 30d | PAGE | Trigger reliability review | `/runbooks/slo-breach.md` |
| P99 Latency Spike | > 500ms for 10 consecutive minutes | TICKET | Check DB queries, downstream dependencies | `/runbooks/latency-investigation.md` |
| Error Budget < 25% | Budget below 25% remaining in window | TICKET | Feature freeze evaluation | `/runbooks/error-budget-policy.md` |

### Error Budget Policy

| Budget Consumed | Action |
|----------------|--------|
| 0-50% | Normal operations. Deploy freely. |
| 50-75% | Mandatory post-deploy monitoring for 30 minutes. No Friday deploys. |
| 75-100% | Feature freeze. Only reliability improvements and critical bug fixes. |
| 100%+ (exhausted) | Full reliability sprint. Incident review mandatory. VP approval for any deploy. |

### On-Call Rotation
- **Primary**: Rotates weekly among 4 senior engineers.
- **Secondary**: Rotates weekly among all backend engineers.
- **Escalation**: Primary → Secondary → Engineering Manager → VP Engineering.
- **Response SLA**: PAGE acknowledged within 5 minutes, TICKET within 4 hours.
