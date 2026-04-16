# Evidence Classifier — Sample Output

## Context
Classifying evidence in a technical assessment document for a client's payment processing system.

## Output

### Classified Claims

| # | Claim | Tag | Source / Reasoning |
|---|-------|-----|-------------------|
| 1 | The system processes 15,000 transactions per day. | `[HECHO]` | Client-provided metrics dashboard screenshot, dated 2026-03-10. |
| 2 | PostgreSQL is the primary database, version 14.2. | `[HECHO]` | Verified via `SELECT version()` on production — `config/database.yml` confirms connection. |
| 3 | The payment service has 23% test coverage. | `[HECHO]` | Measured via `pytest --cov` on commit `a3f9d21`. |
| 4 | Response times degrade during month-end processing. | `[INFERENCIA]` | APM data shows p99 latency spikes on the last 3 days of each month (3 consecutive months). Pattern is consistent but root cause not confirmed. |
| 5 | The degradation is caused by batch reconciliation jobs competing for database connections. | `[SUPUESTO]` | Hypothesized based on timing correlation. No profiling or query analysis performed. **Risk if wrong**: optimization effort may target the wrong bottleneck. |
| 6 | Migrating to a read replica would reduce p99 latency by 40%. | `[SUPUESTO]` | Estimated based on typical read/write ratio (70/30). Actual ratio not measured. **Risk if wrong**: latency improvement may be negligible if writes dominate. |
| 7 | The team has experience with Kubernetes. | `[HECHO]` | CTO confirmed during stakeholder interview, 2026-03-08. Two engineers hold CKA certification. |
| 8 | The team can complete the migration in 3 sprints. | `[SUPUESTO]` | Based on similar projects at other clients. Team velocity not measured. **Risk if wrong**: timeline could double, impacting budget. |
| 9 | The current architecture handles 2x current load without modification. | `[INFERENCIA]` | Load test on staging reached 30K tx/day with acceptable latency. However, staging environment has different data volume. |
| 10 | No PCI DSS compliance issues exist in the current implementation. | `[SUPUESTO]` | No compliance audit has been performed. **Risk if wrong**: remediation could add 4-6 weeks to timeline. |

### Evidence Distribution

```
[HECHO]      : 4/10 (40%)
[INFERENCIA] : 2/10 (20%)
[SUPUESTO]   : 4/10 (40%)
```

**Overall Confidence: LOW** — 40% of claims are unverified assumptions.

### Warning Banner
> **WARNING**: This document contains 40% unverified assumptions ([SUPUESTO]). Critical recommendations (#5, #6, #8, #10) are based on assumptions. **Do not approve recommendations without validating the items below.**

### Validation Required (Priority Order)

| Priority | Claim # | Validation Action | Owner | Effort |
|----------|---------|-------------------|-------|--------|
| P0 | #10 | Commission PCI DSS gap assessment | Security team | 2 weeks |
| P0 | #5 | Profile database queries during month-end batch window | DBA | 2 days |
| P1 | #6 | Measure actual read/write ratio with pg_stat_statements | DBA | 1 day |
| P1 | #8 | Measure team velocity over 2 sprints before committing timeline | Scrum Master | 4 weeks |
