---
name: apex-monte-carlo-simulation
description: >
  Use when the user asks to "run Monte Carlo", "simulate schedule risk",
  "probabilistic cost analysis", "confidence intervals", "forecast completion probability",
  or mentions Monte Carlo simulation, probabilistic analysis, schedule confidence,
  cost confidence. Triggers on: executes probabilistic schedule simulation, generates
  cost confidence curves, calculates contingency reserves from P-values, identifies
  sensitivity drivers via tornado diagram, produces S-curves with confidence levels.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Monte Carlo Simulation (Schedule & Cost)

**TL;DR**: Executes Monte Carlo simulation for schedule and cost uncertainty analysis. Uses 3-point estimates and probability distributions to generate thousands of possible outcomes, producing confidence-level curves (P10, P50, P80, P90) for project completion date and total cost. Provides the statistical basis for contingency reserve calculations.

## Principio Rector
Un cronograma determinístico es una promesa que la probabilidad no respeta. Monte Carlo transforma estimaciones puntuales en distribuciones de probabilidad, revelando el rango real de posibles resultados. La pregunta correcta no es "cuándo terminaremos" sino "con qué confianza terminaremos para la fecha X".

## Assumptions & Limits
- Assumes 3-point estimates (O, ML, P) exist for activities or work packages [SUPUESTO]
- Assumes activity dependencies are modeled — Monte Carlo without network logic produces misleading results [PLAN]
- Breaks if estimates are not genuine 3-point ranges — optimistic = most likely = pessimistic defeats the purpose [METRIC]
- Scope limited to schedule and cost simulation; technical risk simulation requires specialized tools [PLAN]
- Does not produce deterministic answers — output is always probabilistic with confidence levels [PLAN]
- Correlation between activities is assumed low unless explicitly modeled [SUPUESTO]

## Usage
```bash
/pm:monte-carlo-simulation $PROJECT_NAME --scope=schedule --iterations=10000
/pm:monte-carlo-simulation $PROJECT_NAME --scope=cost --confidence=P80
/pm:monte-carlo-simulation $PROJECT_NAME --scope=both --include-risks --sensitivity
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--scope` | No | `schedule` / `cost` / `both` (default: `both`) |
| `--iterations` | No | Number of simulation iterations (default: 10000) |
| `--confidence` | No | Target confidence level for reporting (default: `P80`) |
| `--include-risks` | No | Include discrete risk events in simulation |
| `--sensitivity` | No | Generate sensitivity analysis (tornado diagram) |

## Service Type Routing
`{TIPO_PROYECTO}`: Large/complex projects use full Monte Carlo; Agile uses velocity-based Monte Carlo; Waterfall uses critical path Monte Carlo; Portfolio uses aggregated Monte Carlo across projects.

## Before Running Simulation
1. Read `schedule-baseline` — confirm 3-point estimates exist for all activities [SCHEDULE]
2. Read `cost-estimation` — confirm cost ranges per work package [METRIC]
3. Glob `*risk-register*` — include discrete risk events with probability and impact [PLAN]
4. Review dependency network — Monte Carlo requires activity dependencies to be meaningful [SCHEDULE]

## Entrada (Input Requirements)
- Schedule with 3-point estimates (O, ML, P) per activity
- Cost estimates with 3-point ranges per work package
- Risk register with probability and impact distributions
- Dependency network (for schedule simulation)
- Correlation data between activities (if available)

## Proceso (Protocol)
1. **Model setup** — Define simulation scope (schedule, cost, or both)
2. **Distribution assignment** — Assign probability distributions (triangular, PERT, normal) per input
3. **Correlation modeling** — Define correlations between related activities/costs
4. **Risk event modeling** — Include discrete risk events with probability and impact
5. **Simulation execution** — Run 10,000+ iterations sampling from distributions
6. **Result analysis** — Generate cumulative probability curves (S-curves)
7. **Confidence levels** — Extract P10, P50, P80, P90 values for date and cost
8. **Sensitivity analysis** — Identify activities/costs with greatest influence on outcomes
9. **Contingency calculation** — Calculate contingency as P80 - P50 (or per organizational policy)
10. **Report generation** — Present results with probability curves and sensitivity ranking

## Edge Cases
1. **Insufficient 3-point estimate quality** — If O=ML=P for most activities, simulation is meaningless; return to estimation with calibration workshops before running Monte Carlo.
2. **Single activity drives more than 40% of total variance** — Flag as critical risk; recommend decomposition or risk mitigation before accepting simulation results.
3. **P80 date exceeds hard deadline** — Present probability of meeting deadline; recommend scope reduction, resource addition, or deadline renegotiation with quantified trade-offs.
4. **No dependency network available** — Run independent activity simulation with explicit caveat that results assume no path dependencies; recommend parallel effort to build network.

## Example: Good vs Bad

**Good Monte Carlo Simulation:**
| Attribute | Value |
|-----------|-------|
| Iterations | 10,000 with PERT distributions [METRIC] |
| Schedule result | P50: June 15, P80: July 3, P90: July 18 [SCHEDULE] |
| Cost result | P50: 2.4M, P80: 2.7M, P90: 3.0M [METRIC] |
| Sensitivity | Top 3 drivers: API integration (28%), data migration (19%), UAT (14%) [METRIC] |
| Contingency | P80-P50 = 300K recommended contingency reserve [METRIC] |

**Bad Monte Carlo Simulation:**
"We ran a Monte Carlo and the project will cost $2.5M." — Single number output, no confidence intervals, no S-curves, no sensitivity analysis. Defeats the entire purpose of probabilistic analysis.

## Salida (Deliverables)
- `03_monte_carlo_{proyecto}_{WIP}.md` — Monte Carlo analysis report
- Schedule probability curve (S-curve with confidence levels)
- Cost probability curve (S-curve with confidence levels)
- Sensitivity ranking (tornado diagram)
- Contingency recommendation based on confidence targets

## Validation Gate
- [ ] Input distributions based on genuine 3-point estimates — not copied from templates
- [ ] Minimum 10,000 iterations for statistical significance
- [ ] All significant uncertainties modeled — no major cost or schedule items excluded
- [ ] Distributions aligned with risk register — risks reflected in simulation
- [ ] Confidence levels (P10, P50, P80, P90) clearly presented with dates and costs
- [ ] Sensitivity analysis identifies top 5 variance drivers
- [ ] Results interpretable by management — visual S-curves, not just tables
- [ ] Model limitations disclosed — assumptions about correlations, distribution types
- [ ] Contingency recommendation tied to organizational risk appetite
- [ ] Simulation approach appropriate for project type and data quality

## Escalation Triggers
- P80 date exceeds hard deadline
- P80 cost exceeds total approved budget
- Single activity drives > 40% of total variance
- Insufficient data quality for meaningful simulation

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
