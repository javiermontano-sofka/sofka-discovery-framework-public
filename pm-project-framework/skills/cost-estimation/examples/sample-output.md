# Cost Estimation — Acme Corp, Payment Module Development

**Scope**: Payment processing module | **Method**: Bottom-up with PERT | **Class**: 3

## TL;DR
Total estimated effort: 18.5 FTE-months (P50) to 22.8 FTE-months (P80). Confidence: Medium. Key assumption: existing payment gateway SDK compatible.

## Work Package Estimates

| WP | Description | Optimistic | Most Likely | Pessimistic | PERT | Std Dev |
|----|-------------|-----------|-------------|-------------|------|---------|
| WP-1 | API Design | 1.0 | 1.5 | 3.0 | 1.7 | 0.3 [METRIC] |
| WP-2 | Core Processing | 4.0 | 6.0 | 10.0 | 6.3 | 1.0 [METRIC] |
| WP-3 | Integration | 2.0 | 3.0 | 6.0 | 3.3 | 0.7 [METRIC] |
| WP-4 | Testing | 1.5 | 2.5 | 4.0 | 2.6 | 0.4 [METRIC] |
| WP-5 | Documentation | 0.5 | 1.0 | 1.5 | 1.0 | 0.2 [PLAN] |
| WP-6 | Deployment | 0.5 | 1.0 | 2.0 | 1.1 | 0.3 [SCHEDULE] |
| **Subtotal** | | **9.5** | **15.0** | **26.5** | **16.0** | **1.5** |

## Confidence Levels

| Percentile | FTE-Months | Use Case |
|-----------|-----------|----------|
| P50 (Most Likely) | 18.5 | Planning baseline [PLAN] |
| P80 (Budget) | 22.8 | Budget authorization [METRIC] |
| P90 (Worst Case) | 25.3 | Risk assessment [INFERENCIA] |

## Assumptions

| ID | Assumption | Impact if False | Probability True |
|----|-----------|----------------|-----------------|
| A-01 | Payment SDK compatible | +3-5 FTE-mo if false | 70% [SUPUESTO] |
| A-02 | Team has payment domain expertise | +2 FTE-mo if false | 85% [STAKEHOLDER] |
| A-03 | PCI-DSS compliance scope limited | +4 FTE-mo if expanded | 60% [SUPUESTO] |

## Estimation Method Rationale
Bottom-up selected due to Class 3 definition maturity (30-40% scope defined). PERT applied to each work package for uncertainty modeling. Reference class: 3 similar payment modules delivered in last 18 months averaged 17 FTE-months (range 14-22). [METRIC]

*PMO-APEX v1.0 — Sample Output · Cost Estimation*
