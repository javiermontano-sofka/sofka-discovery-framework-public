---
name: apex-budget-tracking
description: >
  Use when the user asks to "track budget", "monitor costs", "review budget variance",
  "check contingency burn", or "forecast remaining project costs".
  Activates when a stakeholder needs to analyze cost variances against baseline, monitor
  contingency reserve consumption, update budget forecasts, generate burn rate analysis,
  or produce corrective action recommendations for cost overruns.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Budget Tracking & Cost Variance

**TL;DR**: Monitors budget execution against baseline including cost variance analysis, contingency burn rate, forecast updates, and budget health indicators. Provides early warning of cost overruns through trend analysis and recommends corrective actions when variances exceed thresholds.

## Principio Rector
El seguimiento de presupuesto no es contabilidad — es gestión predictiva del valor. El objetivo no es reportar cuánto se gastó, sino predecir cuánto se gastará y si alcanza. La tasa de consumo de contingencia es el indicador más importante: si la contingencia se consume antes de que los riesgos se materialicen, el proyecto está en problemas.

## Assumptions & Limits
- Assumes a budget baseline exists with defined contingency and management reserves [SUPUESTO]
- Assumes actual expenditure data is available and accurate from financial systems [SUPUESTO]
- Breaks when actuals are reported with >2-week lag — tracking becomes reactive, not predictive
- Does not replace formal EVM analysis — complements it with budget-specific focus
- Forecast accuracy degrades when change orders are not reflected in updated baseline [PLAN]
- Corrective actions are recommendations only — implementation requires PM authority

## Usage

```bash
# Generate budget tracking report for current period
/pm:budget-tracking $PROJECT --type=report --period="2026-03"

# Analyze contingency burn rate
/pm:budget-tracking $PROJECT --type=contingency-burn

# Forecast budget at completion
/pm:budget-tracking $PROJECT --type=forecast --method="trend"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `report`, `contingency-burn`, `forecast`, `variance` |
| `--period` | No | Reporting period (YYYY-MM) |
| `--method` | No | Forecasting method (trend, evm, hybrid) |

## Service Type Routing
`{TIPO_PROYECTO}`: Fixed-price projects track against contract value; Agile tracks burn rate per sprint; Waterfall tracks per phase; All types monitor contingency consumption.

## Before Tracking

1. **Read** the budget baseline to confirm planned values and reserve allocations
2. **Read** actual expenditure data from the financial system or cost report
3. **Read** the EVM analysis for CPI integration into budget forecasting
4. **Grep** for approved change orders that may have updated the budget baseline

## Entrada (Input Requirements)
- Budget baseline with contingency and management reserve
- Actual expenditure data
- Committed but unpaid amounts
- EVM data (CPI, EAC)
- Approved change orders affecting budget

## Proceso (Protocol)
1. **Actuals collection** — Gather actual costs by cost category and period
2. **Variance calculation** — Budget variance = Baseline - Actual per category
3. **Contingency tracking** — Monitor contingency reserve consumption rate
4. **Forecast update** — Update EAC based on actual performance trends
5. **Burn rate analysis** — Calculate spending rate vs. planned rate
6. **Category analysis** — Identify which cost categories are driving variances
7. **Corrective actions** — Recommend actions for categories exceeding thresholds
8. **Report generation** — Produce budget tracking report with visualizations
9. **Trend projection** — Project when budget will be exhausted at current rate
10. **Stakeholder communication** — Prepare budget summary for appropriate audiences

## Edge Cases

1. **Actuals delayed by >2 weeks**: Use committed amounts as proxy. Flag report as [INFERENCIA] and note actuals lag. Schedule data refresh when actuals arrive. [METRIC]
2. **Contingency consumed >50% at project midpoint**: Trigger escalation. Analyze whether consumption is from planned risk responses or unplanned events. If unplanned, request management reserve release. [PLAN]
3. **Change orders not reflected in baseline**: Track against both original and updated baseline. Highlight the gap. Recommend formal baseline update through CCB. [SCHEDULE]
4. **Multi-vendor budget with different reporting cycles**: Normalize to common reporting period. Document assumptions about vendor cost timing. [SUPUESTO]

## Example: Good vs Bad

**Good Budget Tracking:**

| Attribute | Value |
|-----------|-------|
| Variance analysis | Per cost category with root cause |
| Contingency burn | Burn-down chart with consumption rate |
| Forecast | EAC updated using CPI trend |
| Corrective actions | 3 specific actions with owners and deadlines |
| Trend projection | Budget exhaustion date at current rate |
| Evidence tags | 90% [METRIC], 10% [INFERENCIA] |

**Bad Budget Tracking:**
A report that says "we are on budget" without variance analysis, no contingency tracking, no forecast update, and no trend projection. Fails because it provides no early warning capability — by the time the PM realizes the budget is overrun, corrective actions are too late to be effective.

## Validation Gate
- [ ] Variance calculated for every cost category, not just total project level
- [ ] Contingency burn rate tracked with visual burn-down chart updated each period
- [ ] EAC forecast updated using ≥1 method (CPI trend, bottom-up re-estimate, or hybrid)
- [ ] Corrective actions specified for every category exceeding variance threshold
- [ ] No variance reported without root cause analysis identifying the cost driver
- [ ] Trend projection shows budget exhaustion date at current spending rate
- [ ] Actuals verified against financial system data, not self-reported estimates
- [ ] Contingency depletion risk prominently flagged when >50% consumed
- [ ] Sponsors see clear financial health summary with action items [STAKEHOLDER]
- [ ] Tracking cadence aligned with methodology and governance schedule [PLAN]

## Escalation Triggers
- Budget variance > 10% of baseline
- Contingency consumed > 50% before midpoint
- EAC exceeds BAC + management reserve
- Unauthorized expenditures detected

## Salida (Deliverables)

- Primary deliverable: budget variance report with forecast
- All outputs tagged with evidence markers
- Mermaid diagrams where applicable
- Executive summary for stakeholder consumption

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before starting to understand standards and frameworks | `references/body-of-knowledge.md` |
| State of the Art | When benchmarking against industry trends | `references/state-of-the-art.md` |
| Knowledge Graph | To understand skill dependencies and data flow | `references/knowledge-graph.mmd` |
| Use Case Prompts | For specific scenarios and prompt templates | `prompts/use-case-prompts.md` |
| Metaprompts | To enhance output quality and reduce bias | `prompts/metaprompts.md` |
| Sample Output | Reference for deliverable format and structure | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
