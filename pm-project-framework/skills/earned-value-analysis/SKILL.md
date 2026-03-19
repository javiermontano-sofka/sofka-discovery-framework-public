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
