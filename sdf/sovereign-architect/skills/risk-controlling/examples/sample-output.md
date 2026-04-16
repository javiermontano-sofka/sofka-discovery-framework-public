# Risk Controlling — Sample Output

## Context

A banking institution is replacing its core transaction processing engine.
The legacy system handles 500K transactions/day. Downtime tolerance: zero.

## Output

### Risk Heat Map

```
Impact →     1-Minor  2-Low  3-Moderate  4-Major  5-Critical
Probability ↓
5-Certain
4-Likely                        R-003      R-001
3-Possible              R-006   R-004      R-002
2-Unlikely                      R-005      R-007
1-Rare                                     R-008
```

### Risk Register

| ID | Risk | Dimension | Prob | Impact | Exposure | Strategy | Owner |
|----|------|-----------|------|--------|----------|----------|-------|
| R-001 | Data inconsistency during parallel-run period | Technical | 4 | 5 | 20 | Mitigate | Data Architect |
| R-002 | Performance regression under peak load | Technical | 3 | 5 | 15 | Mitigate | Performance Lead |
| R-003 | Team skill gap on new platform technology | Organizational | 4 | 3 | 12 | Mitigate | Engineering Manager |
| R-004 | Regulatory approval delay for new system | External | 3 | 3 | 9 | Transfer | Compliance Officer |
| R-005 | Integration failures with downstream systems | Technical | 2 | 3 | 6 | Mitigate | Integration Lead |
| R-006 | Vendor support responsiveness during go-live | Commercial | 3 | 2 | 6 | Transfer | Vendor Manager |
| R-007 | Rollback procedure fails under load | Technical | 2 | 5 | 10 | Mitigate | SRE Lead |
| R-008 | Catastrophic data loss | Technical | 1 | 5 | 5 | Avoid | Data Architect |

### Mitigation Plans (Top 3)

**R-001 — Data Inconsistency**
- Mitigation: Implement reconciliation engine running every 15 minutes during parallel-run.
- Early Warning: Reconciliation delta >0.01% of daily transactions.
- Contingency: Halt new system writes and replay from legacy audit log.
- Trigger: 3 consecutive reconciliation failures or delta >0.1%.

**R-002 — Performance Regression**
- Mitigation: Load test at 2x peak volume before go-live. Establish baseline metrics.
- Early Warning: p99 latency >150ms (baseline: 80ms) during staged rollout.
- Contingency: Traffic shift back to legacy via load balancer toggle.
- Trigger: p99 >200ms for >5 minutes or error rate >0.5%.

**R-007 — Rollback Failure**
- Mitigation: Rehearse rollback procedure monthly. Automate rollback to single command.
- Early Warning: Rollback rehearsal time >15 minutes (target: <5 minutes).
- Contingency: Manual failover to read-only legacy mode + war room escalation.
- Trigger: Automated rollback does not complete within 10 minutes.

### Cascading Failure Scenario

R-002 (Performance) -> R-001 (Data Inconsistency) -> R-007 (Rollback Failure)

If the new system degrades under load, the reconciliation engine may fall behind,
creating data inconsistency. If rollback is then triggered but fails, the system
enters a state with inconsistent data and no clear recovery path. This cascade
requires the rollback procedure to be tested under degraded conditions, not just
clean-state conditions.
