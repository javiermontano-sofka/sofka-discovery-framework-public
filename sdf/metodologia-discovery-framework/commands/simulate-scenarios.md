---
description: "Simulación Monte Carlo what-if — proyecciones probabilísticas de esfuerzo, costo y timeline"
user-invocable: true
---

# METODOLOGIA DISCOVERY · MONTE CARLO SCENARIO SIMULATION · NL-HP v3.0

## ROLE

Probabilistic simulation specialist — performs Monte Carlo what-if analysis on effort, cost, and timeline projections. Produces probability distributions, confidence intervals, and risk-adjusted estimates.

Primary technique: Monte Carlo simulation with triangular/PERT distributions.
Support skills: `metodologia-cost-estimation` (base estimates and calibration), `metodologia-multidimensional-feasibility` (cross-dimensional risk inputs), `metodologia-technical-feasibility` (technical uncertainty quantification).

## OBJECTIVE

Transform deterministic estimates into probabilistic projections using Monte Carlo simulation. Provide decision-makers with confidence intervals, probability distributions, and risk-adjusted estimates that account for uncertainty. **Replaces single-point estimates with ranges that reflect real-world variability.**

Requires prior deliverables (05_Escenarios, 06_Roadmap) as context when available. If the user provides "$ARGUMENTS", use them as additional context (scenario parameters, specific variables to simulate, number of iterations).

## AUTO-DETECTION PROTOCOL

When invoked without arguments or with minimal context:

1. **Project root**: Use current working directory as source code root.
2. **Prior deliverables**: Scan for existing discovery deliverables (00-14 pattern). Load relevant prior deliverables as context (dependencies per phase order).
3. **Companion files**: Check `discovery/` for repo-index and companion files (insights-*, transcript-*, rag-priming-*). Load relevant ones.
4. **Attachments**: Scan for PDFs, XLSX, DOCX in cwd. Auto-classify as inputs.
5. **If no context available**: Run mini-ingestion (scan + index) before generating.

If `$ARGUMENTS` is provided, use as scenario name, simulation parameters, and/or additional context.

## PROTOCOL

### CP-0 · Ingestion

1. Scan repository and deliverables: focus on effort estimates, timeline projections, cost drivers, risk factors.
2. Classify attachments: roadmap, scenarios, estimation worksheets, historical data, risk registers.
3. Identify simulation variables: effort (FTE-months), timeline (sprints/months), team size, scope items.

### CP-1 · Variable Definition and Distribution Fitting

For each simulation variable, define:

1. **Variable identification** — list all uncertain variables from estimates (effort per epic, team ramp-up time, integration complexity, learning curve)
2. **Distribution selection** — assign probability distribution:
   - **Triangular**: when optimistic, most likely, and pessimistic values are available
   - **PERT (Beta)**: when most likely value should be weighted more heavily
   - **Uniform**: when only min/max are known, no best estimate
   - **Log-normal**: for variables with positive skew (common in software estimation)
3. **Parameter calibration** — set distribution parameters using:
   - Historical data when available [BENCHMARK]
   - Expert judgment with optimism bias correction (+15-30%) [INFERENCIA]
   - Industry benchmarks (ISBSG, DORA, CHAOS) [ACADEMIC]
4. **Correlation mapping** — identify correlated variables (e.g., if integration is late, testing is also late)

### CP-2 · Simulation Execution

Perform Monte Carlo simulation:

1. **Iteration count**: minimum 10,000 iterations for statistical significance
2. **For each iteration**:
   - Sample each variable from its distribution
   - Apply correlations between dependent variables
   - Calculate aggregate outcomes (total effort, total timeline, critical path)
3. **Aggregate results**:
   - Mean, median, standard deviation
   - P10, P25, P50, P75, P90 percentiles
   - Probability of meeting specific targets (e.g., "probability of completing in < 12 months")

### CP-3 · What-If Scenarios

Define and simulate alternative scenarios:

| Scenario | Description | Modified Variables |
|----------|-------------|-------------------|
| Base Case | Current estimates as-is | None (calibrated distributions) |
| Optimistic | Best-case assumptions | -20% effort, -15% timeline, full team availability |
| Pessimistic | Worst-case assumptions | +40% effort, +30% timeline, 70% team availability |
| Risk Materialized | Key risks occur | Specific risk impacts added as additional effort/time |
| Scope Reduced | MVP scope only | Remove Phase 3+ items, reduce feature set |
| Team Scaled | Additional resources | +2 FTE, with ramp-up learning curve |

### CP-4 · Deliverable Generation

Produce `XX_Monte_Carlo_Simulation_{project}.md` with:

**S1: Executive Summary**
- Key finding: "There is a {X}% probability of delivering within the proposed timeline"
- Recommended commitment level (P50 vs P75 vs P90)
- Top 3 variables with highest impact on outcomes

**S2: Variable Definitions**
| Variable | Distribution | Optimistic | Most Likely | Pessimistic | Source |
|---|---|---|---|---|---|
| {variable} | PERT/Triangular | {min} | {mode} | {max} | {evidence tag} |

**S3: Simulation Results**

| Metric | P10 | P25 | P50 (Median) | P75 | P90 | Mean | Std Dev |
|---|---|---|---|---|---|---|---|
| Total Effort (FTE-months) | {v} | {v} | {v} | {v} | {v} | {v} | {v} |
| Timeline (months) | {v} | {v} | {v} | {v} | {v} | {v} | {v} |
| Team Size (avg FTE) | {v} | {v} | {v} | {v} | {v} | {v} | {v} |

**S4: Probability Distribution Visualization**

```mermaid
xychart-beta
    title "Effort Distribution (FTE-months)"
    x-axis "FTE-months" [low, "", "", P25, "", P50, "", P75, "", "", high]
    y-axis "Frequency" 0 --> 100
    bar [5, 10, 20, 35, 55, 70, 55, 35, 20, 10, 5]
```

**S5: What-If Scenario Comparison**
| Scenario | P50 Effort | P50 Timeline | P(on-time) | P(on-budget) | Recommendation |
|---|---|---|---|---|---|
| {scenario} | {effort} | {timeline} | {%} | {%} | {recommendation} |

**S6: Sensitivity Analysis (Tornado Diagram)**
Rank variables by impact on total outcome. Identify which variables, if reduced in uncertainty, would most improve confidence.

**S7: Risk-Adjusted Recommendation**
```
MONTE CARLO SIMULATION RESULTS
═════════════════════════════════════════
Proyecto: {nombre}
Iteraciones: {N}
Variables simuladas: {count}

Esfuerzo (FTE-meses):
  P50 (mediana):     {value} FTE-meses
  P75 (recomendado): {value} FTE-meses
  P90 (conservador): {value} FTE-meses

Timeline:
  P50 (mediana):     {value} meses
  P75 (recomendado): {value} meses
  P90 (conservador): {value} meses

Probabilidad de cumplir estimate original: {X}%

Variables de mayor impacto:
  1. {variable} — contribuye {X}% de la varianza total
  2. {variable} — contribuye {X}% de la varianza total
  3. {variable} — contribuye {X}% de la varianza total

Recomendación:
  Comprometer al nivel P{X} ({value} FTE-meses, {value} meses)
  Incluir buffer de contingencia: {X}% sobre P50
```

### CP-5 · Validation

- [ ] All uncertain variables identified and distributions assigned
- [ ] Distribution parameters calibrated with evidence tags
- [ ] Minimum 10,000 iterations simulated
- [ ] Percentile table complete (P10 through P90)
- [ ] What-if scenarios defined and compared
- [ ] Sensitivity analysis identifies top 3 impact variables
- [ ] Mermaid diagrams: distribution chart + scenario comparison
- [ ] Risk-adjusted recommendation with commitment level
- [ ] FTE-months ONLY, NEVER prices

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct. No academic jargon without explanation.
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: Every deliverable footer includes: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*
- **Format**: Markdown-excellence standard (TL;DR, dense prose, tables with 🟢/🟡/🔴, Mermaid diagrams, callouts, evidence tags, cross-references)
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER], [ACADEMIC], [BENCHMARK], [VENDOR-DOC]
- **Diagrams**: Mermaid — 1-4 per deliverable, max 20 nodes, descriptive IDs, labeled edges

## CONSTRAINTS

- This simulation quantifies uncertainty — it does NOT eliminate it. Communicate ranges, not false precision.
- Costs: FTE-months and magnitudes ONLY. NEVER prices.
- Evidence: every distribution parameter tagged. [SUPUESTO] = mandatory validation plan.
- Industry benchmarks must cite source (ISBSG, DORA, CHAOS Report, SEI).
- Monte Carlo is a reasoning framework here — describe the methodology and produce the statistical outputs. If computational tools are available, use them; otherwise, apply analytical approximations.
- Single-point estimates are explicitly discouraged — always present ranges with confidence levels.
