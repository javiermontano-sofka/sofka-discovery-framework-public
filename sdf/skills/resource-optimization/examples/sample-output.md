# Resource Optimization Report — Acme Corp Platform Team

## TL;DR
Resource leveling resolved 3 overallocations across Sprint 14-17 with a 5-day schedule extension on non-critical path activities. Net utilization improved from 112% to 82% average. [METRIC]

## 1. Before Optimization

| Resource | Sprint 14 | Sprint 15 | Sprint 16 | Sprint 17 | Avg |
|----------|:---------:|:---------:|:---------:|:---------:|:---:|
| A. Chen (Lead) | 130% | 120% | 110% | 100% | **115%** |
| R. Patel (Dev) | 100% | 115% | 120% | 90% | **106%** |
| S. Kim (QA) | 80% | 90% | 130% | 100% | **100%** |
| J. Rivera (BA) | 70% | 80% | 70% | 80% | 75% |

**Overallocation periods: 7 out of 16** [METRIC]

## 2. Optimization Actions

| Action | Type | Impact |
|--------|------|--------|
| Move API documentation to Sprint 16 | Leveling | A. Chen S14: 130% → 90% [SCHEDULE] |
| Split test automation across S15-S16 | Smoothing | S. Kim S16: 130% → 90% [SCHEDULE] |
| Reassign data migration review to J. Rivera | Rebalancing | R. Patel S15: 115% → 85% [PLAN] |
| Defer non-critical refactoring to Sprint 18 | Deferral | Overall load reduced [PLAN] |

## 3. After Optimization

| Resource | Sprint 14 | Sprint 15 | Sprint 16 | Sprint 17 | Avg |
|----------|:---------:|:---------:|:---------:|:---------:|:---:|
| A. Chen (Lead) | 90% | 85% | 80% | 80% | **84%** |
| R. Patel (Dev) | 85% | 85% | 80% | 80% | **83%** |
| S. Kim (QA) | 75% | 80% | 90% | 80% | **81%** |
| J. Rivera (BA) | 80% | 85% | 80% | 80% | **81%** |

**Overallocation periods: 0 out of 16** [METRIC]

## 4. Schedule Impact

- Critical path: **No change** (all leveled activities had float)
- Non-critical path extension: **5 days** (API documentation + refactoring deferred)
- Net schedule risk: **Reduced** (overallocation was the larger risk) [SCHEDULE]

*PMO-APEX v1.0 — Sample Output · Resource Optimization*
