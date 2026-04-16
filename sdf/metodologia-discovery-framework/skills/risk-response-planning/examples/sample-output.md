# Risk Response Plan — Acme Corp Cloud Migration

## TL;DR
Response strategies defined for top 5 risks. Total response investment: 4.5 FTE-months. Expected risk exposure reduction: 62% (from 14.2 to 5.4 FTE-months). [METRIC]

## Risk Response Matrix

| Risk | Strategy | Actions | Owner | Trigger | Residual |
|------|----------|---------|-------|---------|----------|
| R-001: Data loss during migration | **Mitigate** | 1. Parallel-run old/new systems for 30 days 2. Automated validation scripts 3. Rollback plan tested | Data Lead | Migration start | Low [PLAN] |
| R-002: Vendor contract dispute | **Transfer** | 1. SLA penalties in contract 2. Escrow clause for IP 3. Legal review of T&Cs | Legal + PM | Contract signing | Low [PLAN] |
| R-003: Team skill gap in cloud | **Mitigate** | 1. AWS certification training (2 FTE-weeks) 2. Pair with cloud SME 3. Architecture review board | Tech Lead | Sprint 2 start | Medium [PLAN] |
| R-004: Budget overrun > 20% | **Avoid** | 1. Fixed-scope Phase 1 with MVP definition 2. Weekly burn rate monitoring 3. Change control board | PM | Budget at 80% | Low [METRIC] |
| R-005: Regulatory non-compliance | **Avoid** | 1. Compliance review in Sprint 1 2. Data residency architecture validated 3. Legal sign-off before go-live | Compliance Officer | Architecture phase | Negligible [PLAN] |

## Contingency Plans

### R-001 Contingency (if data validation fails)
1. Halt migration and revert to source system (< 4 hours)
2. Root cause analysis on failed records
3. Targeted fix-and-retry for affected data segments
4. Extended parallel-run period (additional 15 days)
**Reserve allocated: 0.5 FTE-months** [PLAN]

## Response Investment Summary

| Response | Investment | Exposure Reduced | ROI |
|----------|:---------:|:---------------:|:---:|
| R-001 Mitigation | 1.5 FTE-months | 4.0 FTE-months | 2.7x [METRIC] |
| R-002 Transfer | 0.5 FTE-months | 2.5 FTE-months | 5.0x |
| R-003 Mitigation | 1.0 FTE-months | 2.0 FTE-months | 2.0x |
| R-004 Avoidance | 1.0 FTE-months | 3.0 FTE-months | 3.0x |
| R-005 Avoidance | 0.5 FTE-months | 2.7 FTE-months | 5.4x |
| **Total** | **4.5 FTE-months** | **14.2 → 5.4** | **62% reduction** |

*PMO-APEX v1.0 — Sample Output · Risk Response Planning*
