---
name: apex-portfolio-prioritization
description: >
  Use when the user asks to "prioritize projects", "score portfolio", "rank investments",
  "build scoring model", "optimize portfolio mix", or mentions portfolio prioritization,
  scoring models, strategic alignment scoring, portfolio ranking, investment prioritization.
  Triggers on: builds weighted scoring models for project prioritization, calculates
  efficient frontier for portfolio optimization, runs sensitivity analysis on rankings,
  facilitates data-driven investment decisions, produces ranked portfolio with transparent scoring.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Portfolio Prioritization & Scoring Models

**TL;DR**: Applies weighted scoring models to prioritize projects within a portfolio based on strategic alignment, financial return, risk, resource requirements, and urgency. Produces ranked portfolio with transparent scoring rationale enabling data-driven investment decisions.

## Principio Rector
Sin priorización explícita, toda organización termina priorizando por quien grita más fuerte. Un modelo de scoring transforma debates políticos en decisiones basadas en criterios. La transparencia del modelo es tan importante como su precisión: los stakeholders deben entender y aceptar los criterios ANTES de ver los resultados.

## Assumptions & Limits
- Assumes strategic objectives are defined and can be used as alignment criteria [SUPUESTO]
- Assumes financial data (NPV, ROI) available per candidate project [SUPUESTO]
- Breaks if stakeholders reject criteria after seeing results — criteria must be agreed before scoring [STAKEHOLDER]
- Scope limited to portfolio-level prioritization; project-internal prioritization (backlog) uses methodology skills [PLAN]
- Does not make the investment decision — provides decision support with transparent scoring [PLAN]

## Usage
```bash
/pm:portfolio-prioritization $PORTFOLIO_NAME --criteria=5 --scale=1-10
/pm:portfolio-prioritization $PORTFOLIO_NAME --method=weighted-scoring --sensitivity
/pm:portfolio-prioritization $PORTFOLIO_NAME --method=efficient-frontier --constraints=budget,resources
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PORTFOLIO_NAME` | Yes | Target portfolio identifier |
| `--criteria` | No | Number of scoring criteria (default: 5) |
| `--scale` | No | Scoring scale (`1-5` / `1-10`) (default: `1-5`) |
| `--method` | No | `weighted-scoring` / `efficient-frontier` / `both` |
| `--sensitivity` | No | Include sensitivity analysis |
| `--constraints` | No | Constraint types for optimization |

## Service Type Routing
`{TIPO_PROYECTO}`: PMO uses portfolio-level scoring; Portfolio uses multi-criteria decision analysis; Strategic planning uses balanced scorecard alignment; All types benefit from objective prioritization.

## Before Prioritizing Portfolio
1. Read organizational strategy — derive strategic alignment criteria [PLAN]
2. Glob `*financial*` and `*business-case*` — collect financial data per candidate project [METRIC]
3. Read resource capacity — understand constraint boundaries for optimization [METRIC]
4. Facilitate criteria agreement with stakeholders — BEFORE scoring begins [STAKEHOLDER]

## Entrada (Input Requirements)
- Portfolio of candidate projects/initiatives
- Organizational strategy and objectives
- Financial data per project (NPV, ROI estimates)
- Resource availability constraints
- Risk assessments per project

## Proceso (Protocol)
1. **Criteria definition** — Define scoring criteria (strategic alignment, financial return, risk, capability fit)
2. **Weight assignment** — Assign weights per criterion based on organizational priorities
3. **Scoring scale** — Define consistent scoring scale (1-5 or 1-10) with rubrics
4. **Project scoring** — Score each project against each criterion
5. **Weighted calculation** — Calculate weighted total score per project
6. **Constraint analysis** — Apply resource and budget constraints to feasibility
7. **Efficient frontier** — Identify optimal portfolio mix (maximum value within constraints)
8. **Sensitivity analysis** — Test ranking stability under weight changes
9. **Stakeholder review** — Present results for alignment and validation
10. **Recommendation** — Produce ranked portfolio with investment recommendations

## Edge Cases
1. **Stakeholders reject criteria after seeing results** — Governance failure; document the rejection; recommend re-scoring only after new criteria are agreed without knowledge of scores.
2. **Multiple projects tied within decision threshold** — Use tiebreaker criteria (urgency, risk, strategic uniqueness); if still tied, recommend parallel execution or PoC to differentiate.
3. **Resource constraints eliminate top-scored projects** — Present efficient frontier showing trade-offs; recommend resource expansion or project phasing.
4. **Political pressure to override scoring** — Document the override formally; track overridden project performance vs. model prediction for future calibration.

## Example: Good vs Bad

**Good Portfolio Prioritization:**
| Attribute | Value |
|-----------|-------|
| Criteria | 5 weighted criteria agreed by portfolio board before scoring [STAKEHOLDER] |
| Scoring | 12 projects scored 1-10 with rubrics per criterion [METRIC] |
| Sensitivity | Top 3 ranking stable across weight variations up to 15% [METRIC] |
| Efficient frontier | Optimal mix: 8 projects within budget delivering 85% of total portfolio value [METRIC] |
| Transparency | Every score justified with evidence; scoring reproducible by independent reviewer [PLAN] |

**Bad Portfolio Prioritization:**
"The CEO wants these 5 projects." — No criteria, no scoring, no alternatives analysis, no constraint consideration. Portfolio reflects authority, not strategic value optimization.

## Salida (Deliverables)
- Portfolio scoring matrix
- Ranked project list with scores
- Efficient frontier analysis
- Sensitivity analysis results
- Investment recommendation summary

## Validation Gate
- [ ] Scores based on project data, not stakeholder lobbying
- [ ] Scoring rubrics defined and consistently applied across all projects
- [ ] All candidate projects evaluated — no exclusions without documented rationale
- [ ] Criteria weights agreed by governance BEFORE scoring began
- [ ] Ranking directly supports funding decisions with actionable recommendations
- [ ] Scoring transparent and reproducible by independent reviewer
- [ ] Sensitivity analysis shows ranking stability under reasonable weight variations
- [ ] Risk-adjusted prioritization available alongside nominal scoring
- [ ] Decision-makers trust the process — criteria agreement documented
- [ ] Efficient frontier analysis shows optimal portfolio mix within constraints

## Escalation Triggers
- Stakeholders reject scoring criteria after seeing results
- Multiple projects tied within decision threshold
- Resource constraints eliminate top-scored projects
- Political pressure to override scoring results

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When applying multi-criteria decision analysis methods | `references/body-of-knowledge.md` |
| State of the Art | When implementing modern portfolio optimization | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping prioritization to portfolio governance | `references/knowledge-graph.mmd` |
| Use Case Prompts | When generating prioritization for specific portfolio types | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting scoring models for non-standard contexts | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected prioritization quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Dependency Mapper


# Dependency Mapper

## Core Responsibility

Discovers, documents, and visualizes the dependency network across all projects in the portfolio so that sequencing decisions, risk propagation, and critical-path bottlenecks are visible to governance. Ensures that no project is scheduled, funded, or cancelled without understanding its upstream and downstream impact on the rest of the portfolio.

## Process

1. **Inventory** all active and candidate projects, extracting declared dependencies from project charters, architecture documents, and resource plans.
2. **Interview** project managers and technical leads to surface hidden dependencies: shared platforms, common data sources, API contracts, specialist personnel, and regulatory sequencing requirements.
3. **Classify** each dependency by type (finish-to-start, shared resource, technology enablement, data dependency, regulatory gate) and strength (hard blocker vs. soft preference).
4. **Model** the dependency graph using a directed acyclic graph (DAG), identifying critical paths, longest chains, and circular dependency risks that require resolution.
5. **Analyze** impact scenarios: for each enabling project, calculate the cascade delay and value-at-risk if it slips by 2, 4, or 8 weeks.
6. **Flag** high-fan-out nodes (projects that block 3+ downstream projects) and recommend mitigation strategies: fast-tracking, decoupling interfaces, or parallel workstreams.
7. **Publish** the dependency map as an interactive Mermaid diagram with a companion table listing each dependency, its type, strength, owning projects, and mitigation status.

## Output Format

- **Dependency Graph**: Mermaid DAG showing all inter-project dependencies with edge labels for dependency type
- **Dependency Register**: Table with columns: ID, Source Project, Target Project, Type, Strength, Risk Rating, Mitigation
- **Critical Path Analysis**: Identification of the longest dependency chain and its total duration impact
- **Impact Scenarios**: Cascade delay tables for each enabling project under 2/4/8-week slip scenarios
- **Decoupling Recommendations**: Actionable proposals to reduce dependency density and single-point-of-failure risk

### Portfolio Balancer


# Portfolio Balancer

## Core Responsibility

Assesses whether the current portfolio composition reflects the organization's strategic intent across multiple balance dimensions: strategic themes, risk appetite, time horizon (short/medium/long-term), innovation versus maintenance, and business unit coverage. Detects imbalances, quantifies their strategic cost, and recommends concrete rebalancing actions — project additions, deferrals, or cancellations — to restore alignment.

## Process

1. **Define** the target portfolio balance profile with governance: desired allocation percentages across strategic themes (e.g., 40% growth, 30% efficiency, 20% compliance, 10% innovation) and acceptable tolerance bands.
2. **Classify** every active and candidate project against each balance dimension using consistent taxonomy: strategic theme, risk tier (low/medium/high), time horizon (0-6mo / 6-18mo / 18mo+), and type (innovation / enhancement / maintenance / mandatory).
3. **Visualize** the current portfolio composition using bubble charts, treemaps, and radar diagrams that overlay actual allocation against target allocation per dimension.
4. **Measure** imbalance severity for each dimension: percentage deviation from target, trend direction (worsening or improving), and strategic cost of the gap (e.g., underinvestment in innovation eroding future competitiveness).
5. **Simulate** rebalancing scenarios: identify candidate projects to accelerate, defer, scale down, or cancel to move each dimension within its tolerance band, calculating the net portfolio value impact of each move.
6. **Recommend** a rebalancing action plan with prioritized moves, expected balance improvement per move, implementation risks, and stakeholder communication points for projects affected.
7. **Establish** a quarterly portfolio balance review cadence with pre-built dashboards, threshold alerts, and a lightweight re-classification process for new project intake.

## Output Format

- **Portfolio Balance Scorecard**: Current vs. target allocation per dimension with deviation percentages and RAG status
- **Balance Visualization Suite**: Bubble charts, treemaps, and radar diagrams showing multi-dimensional portfolio composition
- **Imbalance Risk Assessment**: Narrative analysis of strategic cost for each dimension outside tolerance
- **Rebalancing Action Plan**: Prioritized list of project-level moves (accelerate, defer, cancel, add) with value impact estimates
- **Governance Cadence Proposal**: Quarterly review schedule, dashboard specifications, and threshold-based alert rules

### Resource Portfolio Optimizer


# Resource Portfolio Optimizer

## Core Responsibility

Resolves the resource-constrained scheduling problem across the entire portfolio by matching finite capacity (people, budget, infrastructure) against prioritized demand. Identifies bottleneck skills, quantifies the cost of resource contention, and produces sequencing recommendations that maximize total portfolio value delivered per planning period.

## Process

1. **Aggregate** resource demand from all active and approved projects: role types, FTE-months, specialized skills, capital expenditure, and shared infrastructure needs.
2. **Map** available capacity by role, team, and time period, accounting for existing commitments, planned absences, onboarding ramp-up, and attrition risk.
3. **Identify** bottleneck resources — roles or individuals demanded by multiple high-priority projects simultaneously — and quantify the contention gap (demand minus supply in FTE-months).
4. **Model** alternative sequencing scenarios using constraint-based optimization: stagger conflicting projects, phase deliverables, or substitute equivalent resources where skill profiles allow.
5. **Calculate** the portfolio value curve for each scenario: total weighted score delivered per quarter, time-to-value for strategic projects, and idle capacity waste.
6. **Recommend** the optimal sequencing plan that maximizes portfolio value while respecting hard constraints (regulatory deadlines, dependency chains, contractual commitments).
7. **Produce** a resource allocation roadmap with quarterly assignments, a watch list of fragile allocations (single-person dependencies), and triggers for re-optimization if actuals deviate by more than 15% from plan.

## Output Format

- **Resource Demand-Supply Matrix**: Heatmap by role and quarter showing surplus (green) and deficit (red) zones
- **Bottleneck Analysis**: Ranked list of constrained roles/skills with contention severity and affected projects
- **Sequencing Scenarios**: 3 alternative schedules with portfolio value curves and trade-off summaries
- **Recommended Roadmap**: Quarterly resource allocation plan with project assignments and milestone targets
- **Re-optimization Triggers**: Defined thresholds and decision rules for when to re-run the optimization

### Scoring Model Designer


# Scoring Model Designer

## Core Responsibility

Designs and calibrates multi-criteria weighted scoring models that transform subjective project prioritization into transparent, defensible rankings. Works with stakeholders to define criteria, agree on weights, normalize scales, and produce a repeatable scoring framework that the portfolio governance board can trust and maintain across planning cycles.

## Process

1. **Identify** the prioritization criteria relevant to the organization's strategy: strategic alignment, financial value (NPV/ROI), risk exposure, resource availability, urgency, regulatory mandate, and customer impact.
2. **Facilitate** stakeholder workshops to elicit pairwise comparisons and agree on relative weights for each criterion, using techniques such as AHP (Analytic Hierarchy Process) or swing weighting.
3. **Define** a normalized scoring scale (1-5 or 1-10) for each criterion with clear anchor descriptions so that different evaluators produce consistent scores.
4. **Calibrate** the model by scoring 3-5 known projects and validating that the output ranking matches stakeholder intuition; adjust weights or scales where misalignment appears.
5. **Document** the final scoring model in a reusable template: criteria definitions, weight rationale, scoring rubrics, and sensitivity analysis showing how rank order changes if weights shift by +/-10%.
6. **Score** all candidate projects using the agreed model, flagging any project where evaluator scores diverge by more than 2 points for reconciliation discussion.
7. **Deliver** the prioritized ranking with a confidence band per project, a sensitivity heatmap, and recommendations for which projects fall above, below, or near the funding cut-line.

## Output Format

- **Scoring Model Specification**: Criteria table with weights, scales, and anchor definitions
- **Project Ranking Matrix**: All projects scored, ranked, with weighted totals and confidence bands
- **Sensitivity Analysis**: Heatmap showing rank stability under weight perturbation
- **Calibration Log**: Record of calibration projects, initial vs. adjusted scores, and rationale for model tuning
- **Stakeholder Agreement Record**: Summary of weight-setting workshop outcomes and participant sign-off

