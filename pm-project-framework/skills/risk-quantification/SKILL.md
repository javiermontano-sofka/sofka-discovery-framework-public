---
name: apex-risk-quantification
description: >
  Use when the user asks to "quantify risks", "run Monte Carlo", "calculate EMV",
  "perform sensitivity analysis", "estimate contingency reserves", or mentions
  risk quantification, expected monetary value, decision tree, tornado diagram,
  probabilistic analysis, confidence intervals.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Risk Quantification & Analysis

**TL;DR**: Performs quantitative risk analysis using Monte Carlo simulation, Expected Monetary Value (EMV), sensitivity analysis, and decision trees. Transforms qualitative risk assessments into numerical impacts on schedule and budget, providing data-driven confidence levels for project outcomes.

## Principio Rector
La gestión cualitativa de riesgos prioriza; la gestión cuantitativa predice. Monte Carlo no adivina el futuro — calcula el rango de futuros posibles y sus probabilidades. El valor no está en el número exacto sino en entender la distribución de resultados y tomar decisiones informadas sobre reservas y contingencias.

## Assumptions & Limits
- Assumes risk register with probability and impact ratings exists [PLAN]
- Assumes 3-point estimates (O, ML, P) are available for schedule and cost [SUPUESTO]
- Breaks when insufficient data for statistical analysis (<10 risks or no historical data)
- Does not replace qualitative analysis; builds on it with numerical precision
- Assumes organizational risk tolerance thresholds are defined [SUPUESTO]
- Limited to project-level quantification; portfolio-level aggregation requires additional modeling

## Usage

```bash
# Full Monte Carlo with EMV and sensitivity
/pm:risk-quantification $ARGUMENTS="--risk-register risks.md --schedule schedule.md --iterations 10000"

# EMV calculation only
/pm:risk-quantification --type emv --risk-register risks.md

# Sensitivity analysis (tornado diagram)
/pm:risk-quantification --type sensitivity --baseline budget-baseline.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to risk register and schedule/cost baseline |
| `--type` | No | `full` (default), `emv`, `sensitivity`, `decision-tree` |
| `--iterations` | No | Monte Carlo iterations (default 5000) |
| `--confidence` | No | Target confidence levels (default "P50,P80,P90") |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types benefit from quantification. Large/complex projects use full Monte Carlo; smaller projects use EMV and sensitivity analysis; regulatory projects require documented quantification.

## Before Quantifying
1. **Read** the risk register to identify risks with sufficient data for quantification [PLAN]
2. **Read** schedule and cost baselines to extract 3-point estimates [SCHEDULE]
3. **Glob** `**/historical_data*` or `**/lessons*` to find calibration data [METRIC]
4. **Grep** for risk correlations and dependencies in risk register [INFERENCIA]

## Entrada (Input Requirements)
- Risk register with probability and impact ratings
- Schedule baseline with duration estimates (3-point)
- Budget baseline with cost estimates (3-point)
- Risk correlations (if known)
- Organizational risk tolerance thresholds

## Proceso (Protocol)
1. **Select risks for quantification** — Choose risks with sufficient data for numerical analysis
2. **Define distributions** — Assign probability distributions to schedule and cost uncertainties
3. **Monte Carlo setup** — Configure simulation parameters (iterations, confidence levels)
4. **Run schedule simulation** — Simulate schedule outcomes (P50, P80, P90 dates)
5. **Run cost simulation** — Simulate cost outcomes (P50, P80, P90 budgets)
6. **EMV calculation** — Calculate Expected Monetary Value for each quantifiable risk
7. **Sensitivity analysis** — Identify risks with greatest impact on outcomes (tornado diagram)
8. **Decision tree analysis** — Model key decisions with probabilistic outcomes
9. **Contingency recommendation** — Calculate appropriate contingency based on confidence targets
10. **Report findings** — Present quantification results with confidence intervals

## Edge Cases
1. **Insufficient data for Monte Carlo (<10 quantifiable risks)** — Fall back to EMV and sensitivity analysis. Document the limitation. Tag contingency recommendation as [SUPUESTO] [SUPUESTO].
2. **Single risk dominates >40% of total exposure** — Flag as concentration risk. Recommend dedicated mitigation effort for this risk. Sensitivity analysis should highlight this dominance [METRIC].
3. **Correlated risks creating cascade effects** — Model correlation explicitly if data supports it. Otherwise, document correlation as [SUPUESTO] and add correlation premium to contingency [INFERENCIA].
4. **P80 outcome exceeds budget by >25%** — Escalate to sponsor with three options: increase budget to P80, reduce scope, or accept higher risk. Present trade-offs quantitatively [STAKEHOLDER].

## Example: Good vs Bad

**Good example — Data-driven risk quantification:**

| Attribute | Value |
|-----------|-------|
| Risks quantified | 15 risks with probability distributions |
| Simulation | 10,000 iterations, convergence verified |
| Schedule P80 | +18 days from baseline (confidence interval documented) |
| Cost P80 | +12% from baseline budget |
| Tornado top 3 | 3 risks contributing 65% of total variance |
| Contingency | 15% recommended at P80 confidence |

**Bad example — Pseudo-quantification:**
"High probability x High impact = Very High." This is qualitative categorization, not quantification. Without numerical distributions and simulation, there is no statistical basis for contingency reserves or confidence levels.

## Salida (Deliverables)
- `03_risk_quantification_{proyecto}_{WIP}.md` — Quantitative risk analysis report
- Monte Carlo simulation results (S-curve of outcomes)
- Tornado diagram (sensitivity analysis)
- EMV summary table
- Contingency reserve recommendation with confidence level

## Validation Gate
- [ ] ≥10 risks quantified with probability distributions (or documented justification for fewer) [METRIC]
- [ ] Monte Carlo convergence verified (results stable across runs) [METRIC]
- [ ] Schedule and cost P50, P80, P90 outcomes documented [SCHEDULE]
- [ ] Tornado diagram identifies top 5 risk drivers [METRIC]
- [ ] EMV calculated for each quantifiable risk [METRIC]
- [ ] Contingency recommendation linked to specific confidence level [PLAN]
- [ ] Simulation assumptions documented (distribution types, correlation) [SUPUESTO]
- [ ] Evidence ratio: ≥75% [METRIC]/[SCHEDULE], <25% [SUPUESTO]
- [ ] Results interpretable by non-statisticians (plain language summary) [PLAN]
- [ ] Model limitations explicitly documented [INFERENCIA]

## Escalation Triggers
- P80 outcome exceeds budget/schedule by > 25%
- Single risk dominates > 40% of total risk exposure
- Insufficient data for meaningful Monte Carlo
- Risk correlation effects significantly change outcomes

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
