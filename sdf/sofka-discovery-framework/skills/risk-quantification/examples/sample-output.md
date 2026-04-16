# Risk Quantification Report — Acme Corp Migration Project

## TL;DR
Monte Carlo analysis (10,000 iterations) shows P50 completion at Month 7.2, P80 at Month 8.5, P90 at Month 9.3. Recommended contingency: 1.3 months (P80 target). Top risk driver: data migration complexity (38% of variance). [METRIC]

## 1. Schedule Confidence Levels

| Confidence | Completion Month | Buffer vs. Baseline |
|:----------:|:----------------:|:-------------------:|
| P50 | 7.2 | +0.2 months |
| P80 | 8.5 | +1.5 months |
| P90 | 9.3 | +2.3 months |
| Baseline | 7.0 | — |

**Recommended target: P80 (Month 8.5)** — 80% confidence within appetite [PLAN]

## 2. Tornado Diagram — Top Schedule Risk Drivers

| Risk Driver | Low Impact | High Impact | Contribution |
|-------------|:---------:|:----------:|:------------:|
| Data migration complexity | -0.5 months | +2.8 months | 38% [METRIC] |
| Vendor API readiness | -0.2 months | +1.5 months | 22% |
| Team ramp-up time | -0.3 months | +1.0 months | 15% |
| Integration testing | -0.2 months | +0.8 months | 12% |
| UAT duration | -0.1 months | +0.6 months | 8% |
| Other | | | 5% |

## 3. Risk Exposure Summary

| Risk | Probability | Impact (FTE-months) | EMV |
|------|:----------:|:-------------------:|:---:|
| R-001: Data migration failure | 35% | 8 | 2.8 [METRIC] |
| R-002: Vendor delay | 25% | 6 | 1.5 |
| R-003: Key person departure | 15% | 10 | 1.5 |
| R-004: Scope creep | 30% | 4 | 1.2 |
| **Total Risk Exposure** | | | **7.0 FTE-months** |

## 4. Contingency Recommendation

| Reserve Type | Amount | Confidence |
|-------------|--------|:----------:|
| Contingency (P80 - P50) | 1.3 months schedule + 4.2 FTE-months effort | P80 |
| Management reserve (P90 - P80) | 0.8 months schedule + 2.8 FTE-months effort | P90 |
| **Total reserves** | **2.1 months + 7.0 FTE-months** | P90 |

[PLAN] — Reserves align with organizational risk appetite (Moderate).

*PMO-APEX v1.0 — Sample Output · Risk Quantification*
