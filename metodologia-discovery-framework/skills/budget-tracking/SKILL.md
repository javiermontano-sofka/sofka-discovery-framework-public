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

---

---

## Sub-Agents

### Actual Cost Collector


# Actual Cost Collector

## Core Responsibility

The Actual Cost Collector agent is responsible for systematically gathering, validating, and categorizing all actual expenditures incurred on a project. It ingests data from timesheets (labor hours × loaded rates), vendor invoices, purchase orders, expense reports, and internal charge-backs, then maps each cost item to the appropriate WBS element and cost account within the project's Cost Breakdown Structure (CBS). This ensures that Actual Cost (AC) figures used in Earned Value calculations are accurate, complete, and traceable to source documents.

## Process

1. **Ingest** raw cost data from all designated sources: timesheets, accounts payable records, purchase orders, travel and expense reports, and internal allocation journals for the reporting period.
2. **Validate** each cost entry against approval records and contracts — confirm that amounts match authorized commitments, rates align with contract terms, and dates fall within the reporting window.
3. **Classify** every validated cost item by cost type (labor, materials, equipment, subcontractor, travel, overhead) and map it to the correct WBS element and cost account in the CBS.
4. **Reconcile** the collected actuals against the organization's financial system (ERP/GL) to identify discrepancies such as unposted invoices, duplicate entries, or timing differences between accrual and cash basis.
5. **Normalize** cost data to the project's base currency and reporting period, applying the correct exchange rates for international expenditures and prorating multi-period commitments.
6. **Aggregate** costs at each level of the WBS hierarchy — work package, control account, and total project — producing period actuals, cumulative actuals, and committed-but-not-yet-paid obligations.
7. **Report** the final Actual Cost (AC) figures with a traceability matrix linking each aggregated amount back to its source documents, flagging any unresolved discrepancies for finance team review.

## Output Format

```markdown
## Actual Cost Report — [Project Name] — Period [MM/YYYY]

### Summary
| Metric | Value |
|--------|-------|
| Period Actual Cost | $X |
| Cumulative Actual Cost (AC) | $X |
| Outstanding Commitments | $X |
| Unresolved Discrepancies | N items |

### Cost Breakdown by WBS
| WBS Element | Labor | Materials | Subcontractor | Other | Period Total | Cumulative |
|-------------|-------|-----------|---------------|-------|-------------|------------|
| 1.1 ... | $X | $X | $X | $X | $X | $X |

### Discrepancy Log
| # | Source | Amount | Issue | Status |
|---|--------|--------|-------|--------|
| 1 | Invoice #... | $X | ... | Pending |

### Source Traceability
- Timesheets: [count] entries, [hours] hours
- Invoices: [count] processed, [count] pending
- Purchase Orders: [count] active
- Expense Reports: [count] processed
```

### Forecast Updater


# Forecast Updater

## Core Responsibility

The Forecast Updater agent maintains an accurate, defensible Estimate at Completion (EAC) by computing forecasts using multiple standard methods and selecting the most appropriate one based on current project conditions. It evaluates four primary EAC formulas — (1) EAC = BAC / CPI for stable trend extrapolation, (2) EAC = AC + bottom-up ETC for re-estimated remaining work, (3) EAC = AC + (BAC - EV) / CPI for continued-trend scenarios, and (4) EAC = AC + (BAC - EV) / (CPI x SPI) when both cost and schedule performance affect remaining work. The agent assesses which method best fits the project's current state, documents the rationale, and produces a forecast range with confidence intervals to support management decision-making.

## Process

1. **Gather** the latest cumulative EVM data (BAC, EV, AC, PV), current CPI and SPI values, approved change orders, known remaining risks, and any bottom-up re-estimates from work package managers for incomplete activities.
2. **Compute** EAC using all four standard methods simultaneously: (a) EAC-Trend = BAC / CPI, (b) EAC-Bottom-Up = AC + manager-provided ETC, (c) EAC-CPI = AC + (BAC - EV) / CPI, and (d) EAC-Combined = AC + (BAC - EV) / (CPI x SPI), producing a forecast range.
3. **Assess** current project conditions to determine which method is most reliable: evaluate CPI stability over the last 3-5 periods, check whether the nature of remaining work differs from completed work, determine if schedule pressure will drive cost overruns, and identify any scope changes not yet reflected in BAC.
4. **Select** the primary EAC method with documented rationale — use trend-based when CPI is stable (±0.05 over 3 periods), bottom-up after major scope changes or rebaseline, and combined CPI×SPI when schedule recovery efforts will incur additional cost.
5. **Calculate** the Variance at Completion (VAC = BAC - EAC), To-Complete Performance Index (TCPI = (BAC - EV) / (BAC - AC) or (BAC - EV) / (EAC - AC)), and assess whether the required TCPI is achievable given historical performance.
6. **Construct** a three-point forecast (optimistic, most likely, pessimistic) using the range of EAC methods plus risk-adjusted estimates, and compute the confidence interval using the project's historical CPI volatility as the basis for the standard deviation.
7. **Deliver** the updated forecast package with a comparison to the previous period's EAC, an explanation of any significant movement, the selected method and rationale, the three-point range, and specific recommendations for whether a formal rebaseline or management reserve draw is warranted.

## Output Format

```markdown
## Budget Forecast Update — [Project Name] — Period [MM/YYYY]

### Forecast Summary
| Metric | Value |
|--------|-------|
| Budget at Completion (BAC) | $X |
| Selected EAC | $X |
| Variance at Completion (VAC) | $X |
| TCPI (against BAC) | X.XX |
| TCPI (against EAC) | X.XX |
| Confidence Level | X% |

### EAC Method Comparison
| Method | Formula | EAC | Applicability |
|--------|---------|-----|---------------|
| Trend | BAC / CPI | $X | [Applicable/Not] — [reason] |
| Bottom-Up | AC + ETC | $X | [Applicable/Not] — [reason] |
| CPI-Based | AC + (BAC-EV)/CPI | $X | [Applicable/Not] — [reason] |
| Combined | AC + (BAC-EV)/(CPI×SPI) | $X | [Applicable/Not] — [reason] |

### Selected Method Rationale
- **Method**: [selected]
- **Rationale**: [why this method fits current conditions]
- **CPI Stability**: [X.XX over last N periods, std dev = X.XX]

### Three-Point Forecast
| Scenario | EAC | Probability | Key Assumptions |
|----------|-----|-------------|-----------------|
| Optimistic | $X | X% | ... |
| Most Likely | $X | X% | ... |
| Pessimistic | $X | X% | ... |

### Period-over-Period Movement
| Period | EAC | Delta | Driver |
|--------|-----|-------|--------|
| Current | $X | +/-$X | ... |
| Previous | $X | — | — |

### Recommendations
- [ ] [Rebaseline / Reserve draw / Corrective action / No action needed]
- [ ] ...
```

### Reserve Burn Tracker


# Reserve Burn Tracker

## Core Responsibility

The Reserve Burn Tracker agent monitors the consumption of both contingency reserves (allocated to identified risks within the cost baseline) and management reserves (held outside the cost baseline for unknown-unknowns). It tracks the burn rate of each reserve pool against the project's progress and remaining risk exposure, computes the Reserve Coverage Ratio (remaining reserve / remaining risk-adjusted exposure), and triggers graduated alerts when reserves are being consumed faster than planned or when remaining reserves are insufficient to cover the outstanding risk register's expected monetary value. This enables proactive reserve replenishment decisions before a budget crisis materializes.

## Process

1. **Inventory** all reserve pools: itemize the original contingency reserve allocation by risk category (technical, external, organizational, project management), the original management reserve amount, and all authorized draws to date with their approval references.
2. **Calculate** the current state of each reserve: remaining contingency = original allocation - cumulative draws; remaining management reserve = original allocation - cumulative draws; and compute the period burn rate (draws this period / period duration) and cumulative burn rate.
3. **Assess** remaining risk exposure by cross-referencing the active risk register: sum the Expected Monetary Value (EMV = probability x impact) of all open risks that have contingency allocated, and separately estimate the residual unknown-unknown exposure based on project complexity and phase.
4. **Compute** the Reserve Coverage Ratio (RCR = remaining reserve / remaining risk EMV) for contingency, and the Management Reserve Adequacy Index (MRAI = remaining MR / estimated remaining unknown exposure) — healthy projects maintain RCR > 1.2 and MRAI > 1.0.
5. **Analyze** burn rate trends: project the reserve depletion date at current burn rate, compare the reserve consumption curve against the project's planned S-curve, and identify whether consumption is front-loaded (early risk materialization) or accelerating (systemic issues).
6. **Trigger** graduated alerts based on thresholds: Green (RCR > 1.5, burn rate on plan), Amber (1.0 < RCR ≤ 1.5, or burn rate 20%+ above plan), Red (RCR ≤ 1.0, reserves insufficient to cover remaining exposure), and Critical (reserves exhausted or projected to exhaust before project completion).
7. **Recommend** specific actions for each alert level: Green = continue monitoring; Amber = review upcoming risk responses and defer discretionary draws; Red = escalate to sponsor for reserve replenishment or scope reduction; Critical = mandatory steering committee review with options analysis (additional funding, scope cut, risk acceptance, or project termination).

## Output Format

```markdown
## Reserve Tracking Report — [Project Name] — Period [MM/YYYY]

### Reserve Status Summary
| Reserve Type | Original | Draws to Date | Remaining | Coverage Ratio | Status |
|-------------|----------|---------------|-----------|---------------|--------|
| Contingency | $X | $X | $X | X.XX | [R/A/G] |
| Management | $X | $X | $X | X.XX | [R/A/G] |
| **Total** | **$X** | **$X** | **$X** | — | — |

### Alert Status: [GREEN / AMBER / RED / CRITICAL]
[1-sentence alert summary with trigger reason]

### Contingency Reserve by Risk Category
| Risk Category | Allocated | Drawn | Remaining | Open Risk EMV | Coverage |
|--------------|-----------|-------|-----------|---------------|----------|
| Technical | $X | $X | $X | $X | X.XX |
| External | $X | $X | $X | $X | X.XX |
| Organizational | $X | $X | $X | $X | X.XX |
| PM | $X | $X | $X | $X | X.XX |

### Reserve Draw Log
| # | Date | Amount | Reserve Type | Risk/Reason | Approved By |
|---|------|--------|-------------|-------------|-------------|
| 1 | [date] | $X | Contingency | Risk-XXX | [name] |

### Burn Rate Analysis
| Metric | Value |
|--------|-------|
| Period Burn Rate | $X/month |
| Cumulative Burn Rate | $X/month avg |
| Planned Burn Rate | $X/month |
| Projected Depletion Date | [date] |
| Project Completion Date | [date] |
| Depletion Gap | [+/- N months] |

### Recommendations
| Priority | Action | Trigger | Owner |
|----------|--------|---------|-------|
| 1 | ... | [threshold breached] | ... |
```

### Variance Reporter


# Variance Reporter

## Core Responsibility

The Variance Reporter agent performs rigorous cost performance analysis by computing Cost Variance (CV = EV - AC), Cost Performance Index (CPI = EV / AC), Schedule Variance in cost terms (SV = EV - PV), and comparing Budget at Completion (BAC) against Estimate at Completion (EAC). When variances exceed defined thresholds (typically CV < -5% or CPI < 0.95), the agent conducts structured root cause analysis using the 5-Whys technique and categorizes causes into controllable vs. uncontrollable factors, providing actionable corrective action recommendations to the project manager and steering committee.

## Process

1. **Retrieve** the current period's Planned Value (PV), Earned Value (EV), and Actual Cost (AC) at each control account level, along with the cumulative figures and the approved Budget at Completion (BAC).
2. **Calculate** all standard EVM metrics: CV, CV%, SV, SV%, CPI, SPI, TCPI (To-Complete Performance Index), and the variance between BAC and EAC, presenting both period and cumulative values.
3. **Evaluate** each variance against the project's defined thresholds (from the project management plan) to classify them as within tolerance (green), warning (amber), or critical (red) using the project's stoplight criteria.
4. **Diagnose** every amber and red variance through structured root cause analysis — decomposing the variance by WBS element, cost type, and time period to isolate where and why the deviation originated.
5. **Categorize** identified root causes as scope-related, rate-related, efficiency-related, timing-related, or external, and assess whether each is a one-time event, a recurring trend, or a systemic issue.
6. **Recommend** specific corrective actions for each significant variance, including responsible owner, expected cost impact, implementation timeline, and the projected effect on CPI and EAC if the action is taken.
7. **Compile** the complete variance analysis into a structured report with executive summary, detailed variance tables, trend charts (CPI/SPI over time), root cause findings, and a corrective action register with tracking IDs.

## Output Format

```markdown
## Cost Variance Report — [Project Name] — Period [MM/YYYY]

### Executive Summary
- **Overall CPI**: X.XX ([status])
- **Cost Variance**: $X ([X%])
- **EAC vs BAC**: $X over/under budget
- **Key Finding**: [1-sentence summary]

### EVM Metrics Dashboard
| Metric | Period | Cumulative | Threshold | Status |
|--------|--------|-----------|-----------|--------|
| PV | $X | $X | — | — |
| EV | $X | $X | — | — |
| AC | $X | $X | — | — |
| CV | $X | $X | ±5% | [R/A/G] |
| CPI | X.XX | X.XX | 0.95–1.05 | [R/A/G] |
| SV | $X | $X | ±5% | [R/A/G] |
| SPI | X.XX | X.XX | 0.95–1.05 | [R/A/G] |
| TCPI | — | X.XX | ≤1.10 | [R/A/G] |

### Variance Breakdown by Control Account
| Control Account | BAC | EV | AC | CV | CPI | Status |
|----------------|-----|----|----|----|----|--------|
| CA-001 ... | $X | $X | $X | $X | X.XX | [R/A/G] |

### Root Cause Analysis
| # | Control Account | Variance | Root Cause | Category | Type |
|---|----------------|----------|-----------|----------|------|
| 1 | CA-001 | -$X | ... | Rate-related | Recurring |

### Corrective Action Register
| ID | Action | Owner | Impact | Deadline | Status |
|----|--------|-------|--------|----------|--------|
| CA-001 | ... | ... | +$X to CPI | [date] | Open |

### CPI/SPI Trend
[Period-over-period trend data for chart generation]
```

