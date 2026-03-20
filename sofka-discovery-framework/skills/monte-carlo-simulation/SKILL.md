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

---

---

## Sub-Agents

### Input Distribution Modeler


## Input Distribution Modeler Agent

### Core Responsibility

Transform raw estimates and expert judgment into well-defined probability distributions for every uncertain variable in the simulation model. Select the appropriate distribution type (triangular, PERT-beta, uniform, lognormal) based on data availability and variable characteristics, ensuring that optimistic/most-likely/pessimistic estimates are calibrated against historical data and cognitive bias is actively countered.

### Process

1. **Inventory uncertain variables.** Scan the schedule baseline, cost baseline, and risk register to compile a complete list of variables requiring probabilistic modeling. Tag each variable with its domain (duration, cost, resource availability, risk event probability).
2. **Collect three-point estimates.** For each variable, gather optimistic (P10), most likely (mode), and pessimistic (P90) values from subject matter experts. Cross-reference against historical data where available. Flag estimates where pessimistic/optimistic ratio < 1.5 as potentially anchored.
3. **Select distribution type.** Apply distribution selection criteria: use PERT-beta when SME confidence is high and the mode is well-understood; triangular when data is sparse but bounds are defensible; uniform when true uncertainty exists with no basis for a mode; lognormal for cost variables with known right-skew behavior.
4. **Calibrate against historical baselines.** Compare proposed distributions against actual performance data from analogous projects. Widen distributions where historical actuals exceeded pessimistic estimates >20% of the time. Document calibration rationale with `[HISTORICO]` evidence tags.
5. **Define correlation structures.** Identify variables that are not independent — e.g., if one development task overruns, related tasks likely will too. Define correlation coefficients (0.0–1.0) for linked variables and document the rationale for each dependency.
6. **Validate distribution fitness.** Run a quick sensitivity check: sample 100 values from each distribution and verify the shape matches expert intent. Flag distributions where the mean deviates >15% from the most likely estimate for SME review.
7. **Deliver distribution catalog.** Output a complete parameter table with distribution type, parameters, correlation links, data source, and confidence level for every modeled variable.

### Output Format

| Variable ID | Variable Name | Distribution | Optimistic | Most Likely | Pessimistic | Correlation Group | Data Source | Confidence |
|-------------|--------------|-------------|-----------|------------|------------|-------------------|-------------|------------|
| V-001 | Task 1.2 Duration | PERT-beta | 5d | 8d | 18d | DEV-cluster | `[HISTORICO]` | High |
| V-002 | Server procurement cost | Lognormal | $12K | $15K | $28K | COST-infra | `[STAKEHOLDER]` | Medium |

### Result Interpreter


## Result Interpreter Agent

### Core Responsibility

Transform raw simulation output into actionable intelligence for project decision-makers. Translate statistical distributions into business-meaningful statements ("there is an 80% probability the project will complete by March 15"), identify the top variance drivers through tornado and sensitivity analysis, and provide clear recommendations on contingency reserves and schedule buffers grounded in quantitative evidence.

### Process

1. **Generate probability statements.** Convert CDF data into natural-language probability statements for key project questions: "What is the probability of finishing by the target date?" "What budget gives us 80% confidence?" Express every finding with explicit confidence levels and `[METRIC]` evidence tags.
2. **Build cumulative probability curves.** Create S-curve visualizations for total duration and total cost showing P10 through P95 bands. Overlay the deterministic baseline and contractual targets to visually highlight the gap between planned and probabilistic outcomes.
3. **Perform sensitivity analysis.** Calculate Spearman rank correlation coefficients between each input variable and total project duration/cost. Rank variables by absolute correlation to identify the top 10 variance drivers. Present results as a tornado diagram showing which inputs matter most.
4. **Quantify contingency reserves.** Calculate the contingency needed to achieve target confidence levels: schedule buffer = P80 duration minus deterministic duration; cost contingency = P80 cost minus deterministic cost. Provide reserves at P50, P80, and P95 levels with clear tradeoff framing.
5. **Identify critical risk concentrations.** Cross-reference sensitivity analysis with the risk register to identify where high-variance inputs overlap with high-severity risks. Flag these as "double jeopardy" items requiring immediate management attention.
6. **Assess distribution shape characteristics.** Analyze skewness and kurtosis of outcome distributions. Right-skewed distributions indicate asymmetric downside risk; high kurtosis indicates tail risk. Translate these statistical properties into plain-language risk characterizations.
7. **Deliver interpretation report.** Compile a structured report with executive summary, probability tables, sensitivity rankings, contingency recommendations, and visualization specifications — all with evidence tags and zero unsupported claims.

### Output Format

**Executive Summary:**
> There is a **62% probability** of exceeding the 180-day target schedule `[METRIC]`. The P80 completion date is **Day 185** (March 22), requiring a **17-day schedule buffer** beyond the deterministic plan. The top 3 variance drivers account for **68% of total schedule uncertainty** `[METRIC]`.

**Sensitivity Ranking (Tornado):**

| Rank | Variable | Correlation to Duration | Variance Contribution | Action Priority |
|------|----------|------------------------|----------------------|-----------------|
| 1 | A-014 Backend Integration | 0.82 | 34% | Immediate |
| 2 | A-008 Data Migration | 0.61 | 19% | High |
| 3 | R-007 Vendor Delay Risk | 0.54 | 15% | High |

**Contingency Table:**

| Confidence Level | Schedule Buffer | Cost Contingency |
|-----------------|----------------|-----------------|
| P50 (coin flip) | +0 days | +$0K |
| P80 (recommended) | +17 days | +$180K |
| P95 (conservative) | +40 days | +$480K |

### Scenario Comparator


## Scenario Comparator Agent

### Core Responsibility

Enable evidence-based decision making by running parallel Monte Carlo simulations across multiple project scenarios and presenting side-by-side comparisons with quantified tradeoffs. Transform subjective "what if" discussions into rigorous probabilistic comparisons that make the cost-benefit of each option transparent to stakeholders.

### Process

1. **Define scenario portfolio.** Collaborate with stakeholders to articulate 2–5 discrete scenarios for comparison. Each scenario must have a clear label, a concise description of what changes versus the baseline, and the specific input distribution modifications (e.g., "Scenario B: Add 2 senior developers — reduce A-014 distribution from PERT(15,24,40) to PERT(10,16,28), add $180K fixed cost").
2. **Build scenario delta models.** For each scenario, create a modified copy of the baseline distribution catalog with only the changed variables. Document every modification with rationale and evidence tags. Preserve unchanged variables to ensure apples-to-apples comparison.
3. **Execute parallel simulations.** Run the full Monte Carlo simulation (same iteration count, same random seed sequence) for each scenario. Using the same seed sequence ensures that differences in outcomes are attributable to scenario changes, not random variation.
4. **Generate comparative statistics.** For each scenario, extract P50, P80, and P95 values for duration and cost. Calculate deltas versus baseline: schedule improvement in days, cost delta in absolute and percentage terms, and shift in probability of meeting original targets.
5. **Perform dominance analysis.** Identify scenarios that are strictly dominated (worse on both schedule and cost at same confidence level) and remove them from final recommendations. For remaining Pareto-optimal scenarios, construct an efficient frontier showing the schedule-cost tradeoff curve.
6. **Quantify decision value.** For each non-dominated scenario, calculate the expected value of the decision: (probability improvement of meeting target) x (value of meeting target) minus (incremental cost of the scenario). Frame results as ROI on the mitigation investment where possible.
7. **Deliver comparison dashboard.** Output a structured comparison matrix with scenario descriptions, side-by-side probability distributions, delta analysis, dominance results, and a clear recommendation with supporting evidence.

### Output Format

**Scenario Comparison Matrix:**

| Metric | Baseline | Scenario A: Add Resources | Scenario B: Reduce Scope | Scenario C: Mitigate Top Risks |
|--------|----------|--------------------------|-------------------------|-------------------------------|
| P50 Duration | 168d | 152d (-16d) | 141d (-27d) | 160d (-8d) |
| P80 Duration | 185d | 168d (-17d) | 155d (-30d) | 172d (-13d) |
| P(meet 180d target) | 38% | 72% (+34pp) | 91% (+53pp) | 58% (+20pp) |
| P80 Cost | $2,260K | $2,440K (+$180K) | $1,890K (-$370K) | $2,340K (+$80K) |
| Dominance | — | Pareto-optimal | Pareto-optimal | Dominated by A |

**Recommendation:**
> Scenario B (Reduce Scope) provides the highest probability of meeting the 180-day target (91%) at the lowest cost `[METRIC]`. If scope reduction is not acceptable, Scenario A (Add Resources) achieves 72% on-time probability for an incremental investment of $180K `[METRIC]`. Scenario C is dominated and not recommended.

### Simulation Executor


## Simulation Executor Agent

### Core Responsibility

Execute the Monte Carlo simulation engine by repeatedly sampling from the defined input distributions, respecting correlation structures and schedule logic (dependencies, constraints, resource limits), to produce empirical distributions of project-level outcomes. Ensure statistical validity through sufficient iteration count and proper random sampling techniques.

### Process

1. **Load simulation model.** Ingest the distribution catalog from the Input Distribution Modeler, the schedule network diagram (activity dependencies), and the cost aggregation structure. Validate completeness — every path through the network must have distributions assigned to all uncertain activities.
2. **Configure simulation parameters.** Set iteration count (default 10,000; increase to 50,000 for high-stakes decisions), random seed for reproducibility, convergence threshold (mean stabilization within 0.5%), and correlation matrix from the distribution catalog.
3. **Execute sampling loop.** For each iteration: (a) generate correlated random samples from all input distributions using Cholesky decomposition for correlation; (b) perform forward pass through the schedule network using CPM logic with sampled durations; (c) aggregate costs along the WBS using sampled cost values; (d) record project total duration, total cost, critical path identity, and milestone completion dates.
4. **Validate convergence.** After every 1,000 iterations, check that the running mean and P80 values have stabilized within the convergence threshold. If not converged after N iterations, extend by 50% increments until stable. Report final convergence metrics.
5. **Capture path criticality.** For each activity, record the percentage of iterations in which it appeared on the critical path (criticality index). Activities with criticality index >70% are flagged as persistent bottlenecks; those between 30–70% are conditional bottlenecks.
6. **Build empirical distributions.** Construct frequency histograms and cumulative distribution functions (CDFs) for total duration and total cost. Calculate percentile values: P10, P25, P50, P75, P80, P90, P95, and P99.
7. **Deliver raw simulation results.** Output iteration-level data, summary statistics, convergence report, and criticality indices as structured data for downstream interpretation.

### Output Format

| Metric | P10 | P25 | P50 | P80 | P90 | P95 | Mean | Std Dev |
|--------|-----|-----|-----|-----|-----|-----|------|---------|
| Total Duration (days) | 142 | 156 | 168 | 185 | 194 | 208 | 170 | 22 |
| Total Cost ($K) | 1,820 | 1,940 | 2,080 | 2,260 | 2,380 | 2,560 | 2,100 | 195 |

**Criticality Index (Top 5):**

| Activity | Criticality Index | Avg Duration on CP |
|----------|------------------|--------------------|
| A-014 Backend Integration | 92% | 24.3d |
| A-008 Data Migration | 78% | 18.7d |

