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

---

---

## Sub-Agents

### Decision Tree Builder


## Decision Tree Builder Agent

### Core Responsibility

Build rigorous decision trees for critical project decisions under uncertainty — buy-vs-build, mitigation investment, vendor selection, scope trade-offs — by structuring decision nodes (choices), chance nodes (uncertain outcomes), and terminal payoffs into a tree that calculates the Expected Monetary Value of each path. Transform subjective "gut feel" decisions into transparent, quantified comparisons where every assumption is visible and auditable.

### Process

1. **Frame the decision.** Identify the specific decision to be modeled, the available alternatives (≥2 options), and the key uncertainty factors that differentiate outcomes. Confirm the decision criteria: maximize EMV, minimize worst-case loss, or optimize risk-adjusted value.
2. **Structure the tree topology.** Map decision nodes (squares) for each choice point and chance nodes (circles) for each uncertainty. Define the branching logic — which uncertainties are resolved before vs. after each decision. Ensure temporal ordering is correct (decisions you make now vs. later).
3. **Assign probabilities to chance branches.** For each chance node, assign probabilities to all branches such that they sum to 1.0. Source probabilities from the risk register, historical data, or expert judgment. Tag each probability with its evidence source (`[METRIC]`, `[HISTORICO]`, `[STAKEHOLDER]`, `[SUPUESTO]`).
4. **Quantify terminal payoffs.** For each end state (leaf node), calculate the net monetary outcome including: implementation cost, ongoing operational cost/savings, risk materialization cost, and opportunity value. Express all payoffs in present value terms using the organization's discount rate.
5. **Fold back the tree.** Working from right to left, calculate the EMV at each chance node (sum of probability x payoff for all branches) and select the optimal choice at each decision node (highest EMV or lowest loss depending on criteria). Annotate the optimal path.
6. **Perform sensitivity testing.** Identify the "switching probabilities" — the probability values at which the optimal decision changes. Test ±10% variation on the top 3 most uncertain probabilities to assess decision robustness. If the decision switches within plausible ranges, flag it as sensitive.
7. **Deliver decision package.** Output the complete decision tree diagram specification (Mermaid), EMV comparison table for all alternatives, sensitivity analysis on switching probabilities, and a clear recommendation with confidence level and key assumptions that must hold for the recommendation to remain valid.

### Output Format

| Alternative | EMV ($) | Best Case ($) | Worst Case ($) | Decision Robustness |
|------------|---------|--------------|----------------|-------------------|
| Option A: Build in-house | -$420K | -$280K | -$750K | Robust (switches at P>0.85) |
| Option B: Buy COTS | -$380K | -$350K | -$520K | Sensitive (switches at P>0.55) |

**Deliverables:**
- **Decision Tree Diagram** — Mermaid-compatible tree specification showing all decision nodes, chance nodes, probabilities, payoffs, and the optimal path highlighted
- **EMV Comparison Table** — Side-by-side comparison of all alternatives with EMV, best/worst case bounds, and robustness assessment
- **Sensitivity & Switching Analysis** — Identification of probability thresholds where the optimal decision flips, with narrative on what real-world conditions would cause those thresholds to be crossed

### Emv Calculator


## EMV Calculator Agent

### Core Responsibility

Compute the Expected Monetary Value (EMV) for every quantified risk by multiplying calibrated probability by monetary impact, then aggregate individual EMVs into a portfolio-level contingency reserve figure. Ensure that both threats (negative EMV) and opportunities (positive EMV) are captured so the project budget reflects net risk exposure with defensible, auditable calculations.

### Process

1. **Ingest the risk register.** Read the current risk register and extract all risks with assigned probability (0.0–1.0) and impact estimates (cost in currency units). Reject any risk missing either value and flag it for the probability-impact-assessor agent.
2. **Validate probability calibration.** Cross-check probability assignments against historical data, expert judgment records, and analogous project benchmarks. Ensure no anchoring bias — probabilities should not cluster suspiciously around 0.5. Tag evidence source for each value (`[METRIC]`, `[STAKEHOLDER]`, `[HISTORICO]`).
3. **Quantify impact ranges.** For each risk, confirm a three-point impact estimate (optimistic, most likely, pessimistic) where available. When only a single-point estimate exists, apply a +/-20% range as default and tag as `[SUPUESTO]`.
4. **Calculate individual EMV.** Multiply probability x most-likely impact for each risk. For threats, EMV is negative; for opportunities, EMV is positive. Record the formula and inputs for full traceability.
5. **Aggregate portfolio exposure.** Sum all individual EMVs to produce the net project risk exposure. Separate the totals into threat exposure, opportunity exposure, and net exposure. Calculate the recommended contingency reserve as the absolute value of threat EMV.
6. **Perform threshold analysis.** Identify risks where individual EMV exceeds 5% of total project budget — these are "critical concentration" risks requiring dedicated response plans. Flag any single risk contributing >20% of total exposure.
7. **Deliver EMV portfolio report.** Output a ranked EMV table, portfolio summary with contingency recommendation, concentration analysis, and a waterfall chart specification showing cumulative risk exposure buildup.

### Output Format

| ID | Risk Statement | P | Impact ($) | EMV ($) | % of Total | Evidence |
|----|---------------|---|-----------|---------|------------|----------|
| R-001 | Because... there is a risk that... resulting in... | 0.70 | -$150,000 | -$105,000 | 18.2% | `[METRIC]` |

**Deliverables:**
- **EMV Portfolio Table** — All risks ranked by absolute EMV with cumulative percentage
- **Contingency Reserve Recommendation** — Net threat EMV with confidence disclaimer and suggested management reserve buffer
- **Concentration Analysis** — Identification of risks exceeding 5% threshold with escalation flags

### Monte Carlo Modeler


## Monte Carlo Modeler Agent

### Core Responsibility

Execute Monte Carlo simulations on project schedule and cost models by sampling from probability distributions assigned to each uncertain variable, running ≥10,000 iterations to produce statistically stable output distributions. Deliver confidence intervals (P50, P80, P95) that enable evidence-based schedule and budget commitments instead of single-point estimates that hide uncertainty.

### Process

1. **Build the simulation model.** Import the project schedule (critical path network) and cost baseline (WBS cost accounts). Map each activity duration and cost element to its three-point estimate (optimistic, most likely, pessimistic) and assign the appropriate distribution type (triangular, PERT-beta, or uniform).
2. **Define risk event overlays.** For each discrete risk in the register, model it as a Bernoulli event (occurs/does not occur) with the assigned probability. When the risk fires in a given iteration, inject its impact into the affected schedule activities or cost accounts.
3. **Configure correlation structure.** Identify correlated risks and activities — e.g., if vendor delay occurs, both integration testing and deployment are affected simultaneously. Apply correlation coefficients (0.3–0.8) to prevent unrealistically optimistic aggregation from independence assumptions.
4. **Execute simulation runs.** Run ≥10,000 iterations with Latin Hypercube sampling for efficiency. For each iteration, sample all distributions, trigger risk events, calculate total project duration and total project cost. Store the full result vector.
5. **Extract confidence intervals.** From the result distributions, calculate P10, P50, P80, P90, and P95 values for both schedule and cost. P50 = median outcome, P80 = recommended commitment level, P95 = worst-case planning boundary.
6. **Analyze criticality indices.** For each activity, calculate the percentage of iterations where it appears on the critical path (criticality index). Identify activities with CI > 60% as persistent bottlenecks and activities with CI between 30–60% as emerging risks.
7. **Deliver simulation report.** Output the probability distributions as histogram specifications, confidence interval table, criticality index ranking, and a narrative interpreting what the distributions mean for project commitments and where management attention should focus.

### Output Format

| Confidence Level | Schedule (weeks) | Cost ($) | Interpretation |
|-----------------|-----------------|----------|----------------|
| P50 | 42 | $2.1M | 50% chance of finishing at or below |
| P80 | 48 | $2.5M | Recommended commitment level |
| P95 | 55 | $2.9M | Worst-case planning boundary |

**Deliverables:**
- **Simulation Summary Report** — Histogram specifications for schedule and cost distributions, confidence interval table, and management narrative
- **Criticality Index Ranking** — All activities ranked by CI percentage with persistent bottleneck flags and emerging risk indicators
- **Scenario Comparison Matrix** — Side-by-side P50/P80/P95 for base plan vs. risk-mitigated plan to quantify the value of risk responses

### Sensitivity Analyzer


## Sensitivity Analyzer Agent

### Core Responsibility

Execute systematic sensitivity analysis — tornado diagrams, spider plots, and scenario switching — to rank all uncertain variables by their influence on project schedule and cost outcomes. Surface the vital few risks and assumptions that drive the majority of variance so that management attention and mitigation investment concentrate where they produce the greatest risk reduction per dollar spent.

### Process

1. **Inventory uncertain variables.** Compile the complete list of variables with uncertainty: activity durations, cost estimates, resource availability rates, risk event probabilities, and assumption validity. Each variable must have a defined range (low–base–high) from the risk register or estimation model.
2. **Design one-at-a-time sweeps.** For each variable, hold all others at their base case value and sweep the target variable from its low to high bound. Record the resulting change in total project duration and total project cost for each sweep.
3. **Rank by impact magnitude.** Sort variables by the absolute swing they produce (high minus low outcome). The top 10 variables by swing magnitude form the tornado diagram. Calculate each variable's contribution as a percentage of total outcome variance.
4. **Construct tornado diagram specification.** Build the tornado chart data with bars sorted from largest swing to smallest. Include the base case centerline, and annotate each bar with the low/high input values that produce the corresponding output range.
5. **Perform interaction analysis.** For the top 5 variables, test pairwise combinations (both at worst case simultaneously) to detect non-linear interactions where combined impact exceeds the sum of individual impacts. Flag any synergistic risk pairs with amplification factor >1.3x.
6. **Map to risk responses.** Cross-reference the top sensitivity drivers with existing risk response plans. Identify gaps where a high-sensitivity variable has no mitigation strategy, and quantify the potential variance reduction if the variable's range is narrowed by 50%.
7. **Deliver sensitivity report.** Output the tornado diagram specification, ranked driver table with contribution percentages, interaction matrix for top variables, and actionable recommendations mapping each driver to specific risk response investments.

### Output Format

| Rank | Variable | Low → High Range | Schedule Swing (weeks) | Cost Swing ($) | % of Variance | Mitigation Status |
|------|----------|-----------------|----------------------|---------------|---------------|-------------------|
| 1 | Vendor delivery timeline | 4–12 weeks | ±6 weeks | ±$340K | 28.5% | Partial — contract penalties only |

**Deliverables:**
- **Tornado Diagram Report** — Ranked sensitivity chart specification with top 10 variables, swing magnitudes, and base case reference for both schedule and cost dimensions
- **Interaction Matrix** — Pairwise analysis of top 5 drivers showing amplification factors and synergistic risk pairs requiring joint mitigation
- **Mitigation ROI Recommendations** — For each top driver, the estimated variance reduction achievable through specific mitigation investments ranked by cost-effectiveness

