# Body of Knowledge — Budget Tracking

## 1. Foundations

Budget tracking is the ongoing process of monitoring actual expenditures against the budget baseline, analyzing variances, forecasting completion costs, and recommending corrective actions. [DOC]

### 1.1 Key Metrics

| Metric | Formula | Interpretation |
|--------|---------|---------------|
| Budget Variance (BV) | Baseline - Actual | Positive = under budget [METRIC] |
| Burn Rate | Actual Cost / Time Elapsed | Spending velocity [METRIC] |
| Estimate at Completion (EAC) | BAC / CPI | Forecasted total cost [METRIC] |
| Variance at Completion (VAC) | BAC - EAC | Expected surplus/deficit [PLAN] |
| To-Complete Performance Index (TCPI) | (BAC - EV) / (BAC - AC) | Required efficiency [METRIC] |

### 1.2 Tracking Frequency

| Project Type | Frequency | Reporting Level |
|-------------|-----------|----------------|
| Agile (sprint-based) | Per sprint | Sprint cost report [SCHEDULE] |
| Waterfall | Monthly | Period cost report [SCHEDULE] |
| Hybrid | Bi-weekly | Integrated report [SCHEDULE] |
| Emergency/crisis | Daily | Burn rate dashboard [METRIC] |

## 2. Earned Value Metrics for Budget Tracking

| Metric | Formula | Purpose |
|--------|---------|---------|
| Planned Value (PV) | Planned % complete x BAC | What should we have spent [PLAN] |
| Earned Value (EV) | Actual % complete x BAC | Value of work done [METRIC] |
| Actual Cost (AC) | Sum of actual expenditures | What we actually spent [METRIC] |
| Cost Variance (CV) | EV - AC | Cost efficiency indicator [METRIC] |
| Cost Performance Index (CPI) | EV / AC | Cost efficiency ratio [METRIC] |

## 3. Variance Analysis Techniques

1. **Threshold-based alerts** — Trigger at 5%, 10%, 15% variance levels [METRIC]
2. **Trend analysis** — CPI trending over time reveals systematic issues [INFERENCIA]
3. **Root cause analysis** — For variances >10%, investigate underlying causes [PLAN]
4. **Forecasting models** — EAC calculations using different assumptions [METRIC]

## 4. Corrective Actions

| Variance Level | Response | Authority |
|---------------|----------|-----------|
| 0-5% | Monitor, document | Project Manager [PLAN] |
| 5-10% | Corrective action plan | PM + Sponsor [STAKEHOLDER] |
| 10-15% | Re-forecast, scope review | Change Control Board [STAKEHOLDER] |
| >15% | Re-baseline or terminate | Governance Board [STAKEHOLDER] |

## 5. Standards & References

| Source | Document | Relevance |
|--------|----------|-----------|
| PMI | PMBOK 7th Edition | Cost performance domain |
| PMI | EVM Practice Standard | Earned value tracking |
| AACE | Total Cost Management Framework | Cost control best practices |
| ISO | ISO 21508:2018 | EVM in project management |

> *Principio Rector: "Rastrear el presupuesto sin accionar es contabilidad; accionar sin datos es esperanza."*

*PMO-APEX v1.0 — Body of Knowledge · Budget Tracking*
