---
name: priming-rag-evm
description: >
  RAG priming knowledge: Earned Value Management — PV, EV, AC, variances, indices, EAC formulas, S-curves, AgileEVM
type: priming-rag
domain: project-management
---

# Earned Value Management — Core Knowledge Primer

> **Propósito RAG**: Este documento provee conocimiento de dominio para enriquecer el contexto del agente durante sesiones de gerencia de proyectos. No es un entregable — es material de referencia interno.

## Foundation Concepts

### Performance Measurement Baseline (PMB)

| Component | Definition | Source |
|-----------|-----------|--------|
| PV (Planned Value) | Authorized budget for work scheduled | Time-phased budget (S-curve) |
| EV (Earned Value) | Authorized budget for work actually completed | % complete x BAC for each work package |
| AC (Actual Cost) | Actual cost incurred for work performed | Financial/accounting records |
| BAC (Budget at Completion) | Total authorized budget | Sum of all work package budgets |

### EV Measurement Methods

| Method | When to Use | Accuracy |
|--------|------------|----------|
| 0/100 | Short tasks (<2 periods) | Honest but low granularity |
| 50/50 | Short tasks, credit at start | Moderate |
| 25/75 | Compromise for medium tasks | Moderate |
| Weighted milestones | Longer tasks with clear milestones | High |
| % complete (objective) | Physical measurement possible | High |
| % complete (subjective) | PM estimate | Risky — optimism bias |
| Level of effort (LOE) | Support activities | EV = PV by definition; not for critical path |

### The Three Questions EVM Answers
1. **Where are we?** — Variances (CV, SV)
2. **How efficiently are we performing?** — Indices (CPI, SPI)
3. **Where are we heading?** — Forecasts (EAC, ETC, VAC, TCPI)

## Variance Analysis

| Metric | Formula | Interpretation |
|--------|---------|---------------|
| Cost Variance (CV) | EV - AC | Positive = under budget, Negative = over budget |
| Schedule Variance (SV) | EV - PV | Positive = ahead of schedule, Negative = behind schedule |
| CV% | CV / EV x 100 | Cost variance as percentage |
| SV% | SV / PV x 100 | Schedule variance as percentage |

### Variance Interpretation Matrix

| SV | CV | Situation | Action |
|----|-----|-----------|--------|
| + | + | Ahead and under budget | Monitor — validate not underreporting |
| + | - | Ahead but over budget | Investigate: buying speed with money? |
| - | + | Behind but under budget | Need more resources? Replan? |
| - | - | Behind and over budget | Red flag — immediate corrective action |

### Variance Thresholds (typical)

| Threshold | Status | Action |
|-----------|--------|--------|
| Within +/-5% | Green | Continue monitoring |
| +/-5% to +/-10% | Yellow | Investigate, corrective action plan |
| Beyond +/-10% | Red | Escalate, rebaseline consideration |

## Performance Indices

| Metric | Formula | Interpretation |
|--------|---------|---------------|
| Cost Performance Index (CPI) | EV / AC | >1.0 = under budget, <1.0 = over budget |
| Schedule Performance Index (SPI) | EV / PV | >1.0 = ahead, <1.0 = behind |
| Cost-Schedule Index (CSI) | CPI x SPI | <0.8 = likely unrecoverable |

### Critical Thresholds

| Index | Green | Yellow | Red |
|-------|-------|--------|-----|
| SPI | >= 0.95 | 0.85-0.94 | < 0.85 |
| CPI | >= 0.95 | 0.85-0.94 | < 0.85 |

### CPI Stability Rule (Christensen, 1993)
- After 20% of project completion, CPI rarely changes by more than 10%
- Projects with CPI < 0.85 at 20% completion almost never recover
- CPI is the most reliable single predictor of final cost outcome
- Implication: if CPI = 0.80 at 20%, expect final CPI between 0.72-0.88

## Forecasting: Estimate at Completion (EAC)

### Four EAC Formulas

| # | Formula | Use When |
|---|---------|----------|
| 1 | EAC = BAC / CPI | Past performance will continue (most common, most reliable) |
| 2 | EAC = AC + (BAC - EV) | Past variances are atypical; future work at original rate |
| 3 | EAC = AC + Bottom-Up ETC | Original estimate fundamentally flawed; re-estimate remaining |
| 4 | EAC = AC + (BAC - EV) / (CPI x SPI) | Both cost and schedule pressures influence remaining work |

### Formula Selection Decision Tree
```
Is past performance expected to continue?
├── YES → EAC = BAC / CPI (Formula 1)
└── NO
    ├── Was the variance a one-time event?
    │   └── YES → EAC = AC + (BAC - EV) (Formula 2)
    ├── Is the original estimate fundamentally wrong?
    │   └── YES → EAC = AC + Bottom-Up ETC (Formula 3)
    └── Are both schedule and cost pressures affecting remaining work?
        └── YES → EAC = AC + (BAC - EV) / (CPI x SPI) (Formula 4)
```

### Other Forecasting Metrics

| Metric | Formula | Meaning |
|--------|---------|---------|
| ETC (Estimate to Complete) | EAC - AC | How much more will it cost to finish? |
| VAC (Variance at Completion) | BAC - EAC | Expected final budget variance |
| VAC% | VAC / BAC x 100 | Variance at completion as percentage |

## To-Complete Performance Index (TCPI)

| Target | Formula | Meaning |
|--------|---------|---------|
| TCPI (to BAC) | (BAC - EV) / (BAC - AC) | Efficiency needed to finish within original budget |
| TCPI (to EAC) | (BAC - EV) / (EAC - AC) | Efficiency needed to finish within revised budget |

### TCPI Interpretation

| TCPI Value | Meaning |
|-----------|---------|
| < 1.0 | Can finish under budget at reduced efficiency |
| = 1.0 | Must maintain current efficiency exactly |
| 1.0 - 1.10 | Achievable with focused management attention |
| > 1.10 | Very difficult; consider rebaselining |
| > 1.20 | Practically impossible; rebaseline required |

## S-Curve Analysis

### Reading the S-Curve
```
Cost/Value
    ^
    |          ___--- BAC .............. PV (planned)
    |       _/
    |     _/    ___--- EV (earned value)
    |    /   _/
    |   /  _/      ___--- AC (actual cost)
    |  / _/     _/
    | /_/    _/
    |/___ _/
    +---------------------------------> Time
```

### S-Curve Patterns

| Pattern | CV | SV | Meaning |
|---------|----|----|---------|
| AC below EV, EV above PV | + | + | Under budget, ahead of schedule (ideal) |
| AC above EV, EV below PV | - | - | Over budget, behind schedule (trouble) |
| AC below EV, EV below PV | + | - | Under budget but behind schedule |
| AC above EV, EV above PV | - | + | Over budget but ahead of schedule |

### S-Curve Health Indicators
- **Diverging AC and EV**: cost control issue — investigate burn rate
- **Flat EV with rising AC**: spending without producing value — critical concern
- **EV approaching PV with AC well below**: high efficiency — validate measurement method
- **Late crossover (AC crosses EV)**: pinpoint when cost overrun began

## Earned Schedule (ES)

Traditional SV and SPI become unreliable near project end (SV always trends to 0 at completion).

### Earned Schedule Metrics

| Metric | Formula | Interpretation |
|--------|---------|---------------|
| ES (Earned Schedule) | Time at which current EV was planned to be earned | Schedule position in time units |
| SV(t) | ES - AT (Actual Time) | Schedule variance in time units |
| SPI(t) | ES / AT | Schedule performance in time units |

- SV(t) and SPI(t) remain meaningful throughout project life
- Use ES when traditional SV/SPI are misleading in late stages
- ES-based forecasting: IEAC(t) = AT + (PD - ES) / SPI(t)

## AgileEVM Adaptations

### Mapping EVM to Agile

| Traditional EVM | Agile Equivalent |
|----------------|-----------------|
| BAC | Total story points x cost per point |
| PV | Planned velocity x cost per point x sprints elapsed |
| EV | Completed story points x cost per point |
| AC | Actual spend to date |
| % Complete | Completed points / Total points |
| Work Package | User story or feature |

### AgileEVM Formulas
```
Release Points (RP) = total story points in release backlog
Planned Percent Complete (PPC) = planned velocity x sprints elapsed / RP
Actual Percent Complete (APC) = completed points / RP

PV = PPC x BAC
EV = APC x BAC
AC = actual costs from time tracking / financial system

CPI, SPI, EAC, etc. = standard formulas apply
```

### Sprint-Level EVM

| Sprint Metric | Calculation |
|--------------|-------------|
| Sprint PV | Planned story points x cost per point |
| Sprint EV | Completed story points x cost per point |
| Sprint AC | Actual team cost for sprint duration |
| Sprint CPI | Sprint EV / Sprint AC |
| Sprint SPI | Sprint EV / Sprint PV |

### AgileEVM Considerations
- Story point re-estimation between sprints distorts EV trending
- Use fixed BAC based on original backlog sizing; track scope changes separately
- Cost per point = team cost per sprint / average velocity
- Works best with stable teams and consistent velocity

## ANSI/EIA-748 Standard

### 32 Guidelines (5 Categories)

| Category | # Guidelines | Focus |
|----------|-------------|-------|
| Organization | 5 | WBS, OBS, responsibility assignment, integration |
| Planning, Scheduling, Budgeting | 10 | Schedule network, resource planning, budget distribution |
| Accounting Considerations | 6 | Cost accumulation, material accounting, unit costs |
| Analysis and Management Reports | 6 | Variance analysis, EAC, management reports |
| Revisions and Data Maintenance | 5 | Baseline changes, retroactive changes, data accuracy |

### Key Compliance Requirements
- WBS mapped to organizational breakdown structure (OBS)
- Control accounts at WBS/OBS intersection
- Performance measurement at work package level
- Undistributed budget tracked separately
- Management reserve tracked and controlled
- Formal baseline change control process

## Trend Analysis Techniques

### Three-Point Forecasting
```
EAC_optimistic  = AC + (BAC - EV) / CPI_best
EAC_most_likely = AC + (BAC - EV) / CPI_current
EAC_pessimistic = AC + (BAC - EV) / CPI_worst
```

### CPI/SPI Trending
- Plot CPI and SPI over time per reporting period
- Stable trend: reliable forecasting basis
- Deteriorating trend: early warning — investigate root causes
- Improving trend: validate improvement is real, not measurement artifact

## Common EVM Pitfalls

| Pitfall | Consequence | Mitigation |
|---------|------------|-----------|
| Subjective % complete | EV distorted, false signals | Use objective methods (milestones, 0/100, 50/50) |
| 90% syndrome | Work stuck at 90% for weeks | Use 0/100 or milestone-based EV |
| Missing actual costs | CPI meaningless | Integrate with financial systems |
| No baseline | No PV to compare against | Establish PMB before measuring |
| Scope changes without rebaseline | Trends unreliable | Formal change control, rebaseline when warranted |
| LOE inflating EV | Artificial progress | Separate LOE from discrete work |
| Ignoring SV near end | SV converges to 0 | Use Earned Schedule SV(t) |

## Quick Reference — Formula Cheat Sheet

| Metric | Formula | Memory Aid |
|--------|---------|-----------|
| CV | EV - AC | Earned minus spent |
| SV | EV - PV | Earned minus planned |
| CPI | EV / AC | Earned over spent |
| SPI | EV / PV | Earned over planned |
| EAC1 | BAC / CPI | Budget adjusted for efficiency |
| EAC2 | AC + (BAC - EV) | Spent + remaining at plan |
| EAC3 | AC + new ETC | Spent + re-estimate |
| EAC4 | AC + (BAC - EV) / (CPI x SPI) | Spent + remaining adjusted for both |
| ETC | EAC - AC | Forecast minus spent |
| VAC | BAC - EAC | Budget minus forecast |
| TCPI | (BAC - EV) / (BAC - AC) | Remaining work / remaining budget |
| ES | Time when EV was planned | Schedule in time units |
| SV(t) | ES - AT | Schedule variance in time |
| SPI(t) | ES / AT | Schedule index in time |

---
*PMO-APEX v1.0 — Agentic Project Excellence*
