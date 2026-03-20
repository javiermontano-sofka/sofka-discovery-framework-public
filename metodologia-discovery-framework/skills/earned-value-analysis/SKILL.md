---
name: apex-earned-value-analysis
description: >
  Earned Value Management analysis — CPI, SPI, EAC forecasting, trend analysis, S-curve visualization.
  Use when the user asks to "run EVM analysis", "calculate CPI/SPI", "forecast EAC",
  "track earned value", "measure project performance", or mentions earned value management,
  CPI, SPI, EAC, ETC, TCPI, BAC, cost performance, schedule performance, variance analysis.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Earned Value Management (EVM) Analysis

Performs Earned Value Management analysis calculating PV, EV, AC, CV, SV, CPI, SPI, EAC, ETC, TCPI, and VAC. Produces performance indices, forecasts, and trend analysis to provide objective, data-driven project performance assessment. EVM is the only technique that integrates scope, schedule, and cost in a single measurement framework.

## Principio Rector

EVM no miente — los números cuentan la historia que el status report a veces oculta. CPI < 1.0 significa que estás gastando más por unidad de trabajo de lo planeado. SPI < 1.0 significa que estás produciendo menos de lo planeado. La tendencia del CPI después del 20% de avance es el mejor predictor del costo final.

## Assumptions & Limits

- Assumes a baselined budget (BAC) exists with time-phased Planned Value. Without a baseline, EVM is meaningless.
- Assumes work completion can be objectively measured (% complete or deliverables accepted). Subjective "90% done" invalidates EV calculation.
- CPI stability rule: CPI trend after 20% project completion rarely improves by more than 10%. Use this for early warning, not false hope.
- EVM works best for Waterfall/predictive projects. For Agile, use AgileEVM adaptation (story points as value units). For pure Kanban, EVM is inappropriate — use throughput metrics instead.
- Does not account for scope changes unless baseline is re-baselined. Uncontrolled scope changes make all EVM metrics unreliable.
- TCPI > 1.2 is considered unachievable by most practitioners — flag for recovery or re-baselining.

## Usage

Parse `$ARGUMENTS` as the **project name** used throughout all output artifacts.

```
/pm:report-evm ProjectAlpha
# Full EVM analysis with all metrics, trends, and S-curve

/pm:report-evm "ERP Migration" --period=March-2026
# Period-specific EVM snapshot with trend comparison

/pm:report-evm "Squad Payments" --type=Agile --metric=velocity
# AgileEVM using velocity and story points as value units
```

**Parameters:**
- `$1`: Project name (required)
- `--period`: Reporting period (default: current)
- `--type`: Overrides `{TIPO_PROYECTO}` for EVM variant (Waterfall|Agile|SAFe)
- `--metric`: Value measurement unit (FTE-hours|story-points|deliverables)
- `--forecast`: EAC formula variant (CPI|CPI-SPI|bottom-up|management)

## Service Type Routing

`{TIPO_PROYECTO}` variants:
- **Waterfall**: Traditional EVM with work package measurement; full ANSI/EIA-748 compliance; S-curve visualization
- **Agile**: AgileEVM — story points as EV unit; sprint-level measurement; velocity-based forecasting
- **SAFe**: PI-level EVM aggregating team-level metrics; feature-based value measurement; ART-level CPI/SPI
- **Hybrid**: Dual measurement — EVM for predictive phases, AgileEVM for iterative phases; blended indices
- **Recovery**: Forensic EVM — reconstruct historical EV data from actuals; identify when divergence started; re-baseline analysis

## Before Analyzing

1. Read `references/body-of-knowledge.md` for formula reference and EAC decision tree
2. Glob for existing budget baseline and schedule baseline documents
3. Read previous EVM reports (if any) to establish trend baseline
4. If Agile, read `references/state-of-the-art.md` for AgileEVM adaptation guidance

## Entrada (Input Requirements)

- Budget baseline (BAC) with time-phased PV
- Actual costs (AC) to date
- Work completion data (% complete or deliverables accepted)
- Schedule baseline with milestones
- Previous EVM reports (for trend analysis)

## Proceso (Protocol)

1. **Data collection** — Gather PV, EV, and AC for current reporting period
2. **Variance calculation** — CV = EV - AC, SV = EV - PV, SV(t) for schedule in time units
3. **Performance indices** — CPI = EV/AC, SPI = EV/PV
4. **Forecast EAC** — Calculate using appropriate formula (select via decision tree in BoK)
5. **Calculate ETC** — ETC = EAC - AC (remaining cost to complete)
6. **Calculate TCPI** — To-Complete Performance Index = (BAC - EV) / (BAC - AC)
7. **Variance at completion** — VAC = BAC - EAC
8. **Trend analysis** — Plot CPI and SPI trends over ≥3 periods
9. **Traffic light assessment** — RAG per metric (>0.95 Blue, 0.9-0.95 Amber, <0.9 Red)
10. **Narrative interpretation** — Translate numbers into management actions with evidence tags

## Edge Cases

1. **No historical EVM data (first report)** — Cannot show trends. Present single-point metrics with caveat that trend data requires ≥3 periods. Tag forecast as `[SUPUESTO]` until trend is established.
2. **CPI and SPI diverge significantly** — CPI > 1.0 but SPI < 0.8 means under-budget but behind schedule (common when teams cut corners). Use EAC = AC + (BAC-EV)/(CPI×SPI) to capture both effects.
3. **Scope change mid-project without re-baseline** — EVM metrics become unreliable. Flag in report: "Metrics invalid due to un-baselined scope change." Recommend re-baselining before next EVM report.
4. **Agile team with no story point estimation** — Cannot calculate AgileEVM. Fall back to throughput-based measurement (features completed / features planned). Tag as `[INFERENCIA]`.
5. **TCPI > 1.2** — Recovery is statistically improbable. Recommend: re-baseline, reduce scope, or request additional funding. Present all three options with impact analysis.

## Example: Good vs Bad

### Good EVM Report

> **Period:** March 2026 | **BAC:** 480 FTE-hours | **% Complete:** 45%

| Metric | Value | Status | Evidence |
|--------|-------|--------|----------|
| PV | 240 FTE-h | — | `[PLAN]` baseline |
| EV | 216 FTE-h | — | `[METRIC]` deliverables accepted |
| AC | 250 FTE-h | — | `[METRIC]` timesheet data |
| CV | -34 FTE-h | Over budget | `[METRIC]` |
| SV | -24 FTE-h | Behind schedule | `[METRIC]` |
| CPI | 0.86 | Red (<0.9) | `[METRIC]` |
| SPI | 0.90 | Amber | `[METRIC]` |
| EAC | 558 FTE-h | +16% over BAC | `[METRIC]` CPI-based |
| TCPI | 1.15 | Challenging but achievable | `[INFERENCIA]` |

*Interpretation:* Project is spending 14% more per unit of work than planned. At current rate, will overrun by 78 FTE-hours. CPI has declined from 0.92→0.89→0.86 over 3 periods — downward trend confirms structural cost issue, not anomaly. **Recommend:** scope review to reduce remaining work by ≥15%.

### Bad EVM Report

> "Project is 45% complete and on track. Budget: $500K spent of $1M."

*Why it fails:* No EV calculated — just % complete and spend. No CPI/SPI. No trend. No forecast. "On track" is opinion, not data. This is a status update, not EVM analysis.

## Salida (Deliverables)

- `04_evm_analysis_{proyecto}_{WIP}.md` — EVM analysis report
- EVM metrics table (all 11 metrics with evidence tags)
- CPI/SPI trend chart (Mermaid line chart)
- S-curve (PV vs. EV vs. AC over time)
- Management action recommendations based on indices

## Validation Gate

- [ ] All 11 EVM metrics calculated (PV, EV, AC, CV, SV, CPI, SPI, EAC, ETC, VAC, TCPI)
- [ ] Every metric has an evidence tag ([METRIC] for actuals, [PLAN] for baseline)
- [ ] EAC formula selection justified (decision tree applied, not arbitrary)
- [ ] CPI/SPI trend shown over ≥3 periods (or caveat if first report)
- [ ] Traffic light (RAG) status applied to each performance index
- [ ] S-curve visualization generated with PV, EV, AC lines
- [ ] Narrative interpretation translates every Red/Amber metric to specific action
- [ ] TCPI feasibility assessed (>1.2 flagged as improbable)
- [ ] No metric presented without source data reference
- [ ] AgileEVM adaptation applied when {TIPO_PROYECTO} is Agile or SAFe

## Escalation Triggers

- CPI < 0.9 sustained over 2+ periods (cost overrun trend)
- SPI < 0.9 sustained over 2+ periods (schedule delay trend)
- TCPI > 1.2 (recovery nearly impossible)
- EAC > BAC + management reserve

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before first EVM calculation for formula reference | `references/body-of-knowledge.md` |
| State of the Art | When applying AgileEVM or Earned Schedule | `references/state-of-the-art.md` |
| Knowledge Graph | To understand EVM data dependencies | `references/knowledge-graph.mmd` |
| Use Case Prompts | For specific EVM scenarios (recovery, agile, portfolio) | `prompts/use-case-prompts.md` |
| Metaprompts | To enhance EVM interpretation quality | `prompts/metaprompts.md` |
| Sample Output | Reference for deliverable format | `examples/sample-output.md` |

## Output Configuration

- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Evm Data Collector


## EVM Data Collector Agent

### Core Responsibility

Ensure EVM calculations are built on reliable data. Collect Planned Value from the schedule baseline, Earned Value from accepted deliverables, and Actual Cost from timesheet/financial records. Reject subjective % complete — only accept objective measurement.

### Process

1. **Retrieve PV from baseline.** Read the time-phased budget baseline. Extract cumulative PV for the reporting period. Tag as `[PLAN]` — this is baseline data.
2. **Calculate EV from acceptance.** Determine earned value using one of: (a) 0/100 — nothing earned until 100% complete, (b) weighted milestones — EV earned at predefined checkpoints, (c) % complete — ONLY if based on objective deliverable counts, not subjective estimates.
3. **Gather AC from actuals.** Collect actual costs from timesheets, invoices, and resource allocation records. Tag as `[METRIC]` — this is measured data.
4. **Validate data completeness.** Check for: missing timesheet entries, unrecorded expenses, deliverables completed but not formally accepted. Flag gaps that could skew metrics.
5. **Reconcile discrepancies.** If AC from different sources (timesheets vs. invoices) don't match, investigate and document the delta. Never average conflicting sources.
6. **Apply AgileEVM if needed.** For Agile projects, convert: PV = planned story points × value per point, EV = completed story points × value per point, AC = actual sprint effort.
7. **Produce data package.** Output a clean PV/EV/AC dataset with sources, evidence tags, and data quality flags for each value.

### Output Format

| Period | PV (FTE-h) | EV (FTE-h) | AC (FTE-h) | Source | Quality Flag |
|--------|-----------|-----------|-----------|--------|-------------|
| Mar-2026 | 240 | 216 | 250 | Baseline / Acceptance log / Timesheets | `[METRIC]` Clean |

### Narrative Interpreter


## Narrative Interpreter Agent

### Core Responsibility

Bridge the gap between EVM data and management action. Executives don't need to know CPI formulas — they need to know "we're 14% over budget, here's why, here's what to do." Every Red/Amber metric must map to a specific recommended action.

### Process

1. **Interpret each metric in plain language.** CPI = 0.86 → "For every hour of work planned, we're spending 1.16 hours. The project is 14% less efficient than planned." SPI = 0.90 → "We've completed 90% of the work we should have by now."
2. **Connect to root causes.** Don't just report the number — explain WHY. "CPI declined because the new integration required 3x more testing than estimated" not "CPI is 0.86."
3. **Map Red/Amber metrics to actions.** Every unfavorable metric gets a specific recommendation: scope review, resource adjustment, re-baselining, stakeholder escalation. No metric should be reported without a "so what."
4. **Quantify the forecast impact.** "At current rate, the project will overrun by 78 FTE-hours (16% over BAC). This means either the deadline extends by 3 weeks or we reduce scope by 15%."
5. **Present decision options.** For each critical finding, present 2-3 options with trade-offs: (a) Continue as-is → impact, (b) Reduce scope → what gets cut, (c) Add resources → cost increase.
6. **Calibrate audience.** Executive summary: 3 bullet points max. Technical team: full metrics with drill-down. Sponsor: focus on budget and timeline impact.
7. **Produce narrative report.** Output a structured interpretation with TL;DR, detailed analysis per metric, recommendations, and decision options.

### Output Format

- **TL;DR** — 3-bullet executive summary with overall RAG status
- **Metric Interpretations** — One paragraph per Red/Amber metric with root cause and action
- **Forecast Impact** — Quantified projection of where the project is heading
- **Decision Options** — Table with option, trade-off, and recommendation

### Trend Analyst


## Trend Analyst Agent

### Core Responsibility

Transform point-in-time EVM metrics into trend intelligence. A single CPI of 0.92 means nothing without context — is it improving from 0.85 or declining from 0.98? Trends predict the future; snapshots describe the past.

### Process

1. **Gather historical data.** Collect CPI and SPI values for ≥3 consecutive reporting periods. If first report, document this limitation and present single-point data with caveat.
2. **Plot trend lines.** Calculate moving averages and direction: improving (↑), stable (→), declining (↓). A trend of CPI 0.92→0.89→0.86 is a clear decline.
3. **Apply CPI stability rule.** After 20% project completion, CPI rarely improves by more than 10%. If current CPI is 0.86 at 45% complete, the final CPI will likely be 0.86-0.95. Use this for realistic forecasting, not false hope.
4. **Detect anomalies.** Flag any single-period swing of >15% as anomalous. Investigate cause: scope change, team change, data error, or legitimate performance shift.
5. **Generate Mermaid charts.** Create CPI/SPI trend line charts using Mermaid xychart-beta. Use APEX colors: #2563EB for CPI, #F59E0B for SPI, #DC2626 for threshold lines.
6. **Correlate CPI/SPI divergence.** If CPI > 1.0 but SPI < 0.8, teams may be cutting corners to stay under budget at the expense of schedule. If SPI > 1.0 but CPI < 0.8, teams are going fast but expensively. Document the pattern.
7. **Produce trend report.** Output trend analysis with direction arrows, stability assessment, anomaly flags, and forecast implications.

### Output Format

- **CPI/SPI Trend Chart** — Mermaid line chart over ≥3 periods
- **Trend Direction** — ↑ Improving, → Stable, ↓ Declining for each index
- **CPI Stability Assessment** — Forecast range based on 20% completion rule
- **Anomaly Log** — Any single-period swings >15% with investigation notes

### Variance Calculator


## Variance Calculator Agent

### Core Responsibility

Execute the complete EVM calculation chain with zero formula errors. Select the correct EAC formula using the decision tree, not arbitrary choice. Every metric must trace to its input data.

### Process

1. **Calculate variances.** CV = EV - AC (cost variance). SV = EV - PV (schedule variance). Positive = favorable, negative = unfavorable.
2. **Calculate performance indices.** CPI = EV / AC (cost efficiency). SPI = EV / PV (schedule efficiency). Values > 1.0 = ahead, < 1.0 = behind.
3. **Select EAC formula.** Apply the decision tree:
   - If CPI is expected to continue → EAC = BAC / CPI (most common)
   - If both CPI and SPI affect remaining work → EAC = AC + (BAC - EV) / (CPI × SPI)
   - If original estimate is invalid → EAC = AC + bottom-up ETC
   - If management override exists → EAC = AC + management ETC
   Document WHY the selected formula was chosen. Tag as `[DECISION]`.
4. **Calculate remaining metrics.** ETC = EAC - AC. VAC = BAC - EAC. TCPI = (BAC - EV) / (BAC - AC).
5. **Assess TCPI feasibility.** If TCPI > 1.2, flag as "recovery nearly impossible." If TCPI > 1.0 but ≤ 1.2, flag as "challenging but achievable."
6. **Apply RAG thresholds.** Blue: index > 0.95. Amber: 0.85-0.95. Red: < 0.85. Never use green.
7. **Produce metrics table.** Output all 11 metrics with values, RAG status, evidence tags, and formula justification.

### Output Format

| Metric | Value | Status | Formula | Evidence |
|--------|-------|--------|---------|----------|
| CPI | 0.86 | 🔴 Red | EV/AC = 216/250 | `[METRIC]` |
| EAC | 558 FTE-h | Over budget | BAC/CPI (CPI-based, trend stable) | `[METRIC]` + `[DECISION]` |

