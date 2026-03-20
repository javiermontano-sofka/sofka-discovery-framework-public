---
name: apex-portfolio-dashboard
description: >
  Use when the user asks to "create portfolio dashboard", "report portfolio status",
  "generate portfolio heatmap", "build executive portfolio view", "aggregate project metrics",
  or mentions portfolio reporting, portfolio view, portfolio metrics, multi-project dashboard.
  Triggers on: aggregates project health into portfolio heatmap, produces resource utilization
  views, creates budget rollup summaries, visualizes risk concentration across portfolio,
  generates governance action items for steering committee.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Portfolio-Level Dashboard & Reporting

**TL;DR**: Produces portfolio-level reporting including aggregated health heatmaps, resource utilization across projects, budget rollup, risk exposure, and strategic alignment visualization. Provides executives with a single view of portfolio health enabling governance decisions.

## Principio Rector
El portfolio dashboard no es la suma de status reports — es la vista de sistema. Muestra patrones que los reportes individuales no revelan: sobreasignación sistémica, concentración de riesgo, desviación estratégica. El dashboard debe responder la pregunta del ejecutivo: "estamos invirtiendo correctamente y ejecutando bien?"

## Assumptions & Limits
- Assumes standardized project metrics exist across the portfolio [SUPUESTO]
- Assumes project data is current (within 1 reporting period) and accurate [SUPUESTO]
- Breaks if projects use incompatible metric definitions — metric normalization must precede dashboard creation [METRIC]
- Scope limited to portfolio-level visualization; individual project dashboards use `executive-dashboard` [PLAN]
- Does not generate project data — aggregates and visualizes data from project-level sources [PLAN]

## Usage
```bash
/pm:portfolio-dashboard $PORTFOLIO_NAME --view=executive
/pm:portfolio-dashboard $PORTFOLIO_NAME --view=resource-utilization --period=Q1-2026
/pm:portfolio-dashboard $PORTFOLIO_NAME --view=full --format=html
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PORTFOLIO_NAME` | Yes | Target portfolio identifier |
| `--view` | No | `executive` / `resource-utilization` / `risk` / `full` (default: `full`) |
| `--period` | No | Reporting period (default: current) |
| `--format` | No | `markdown` / `html` (default: `markdown`) |

## Service Type Routing
`{TIPO_PROYECTO}`: PMO uses full portfolio dashboard; Portfolio uses multi-program view; Steering committees use executive portfolio summary; PMO-Setup designs the dashboard framework.

## Before Creating Dashboard
1. Glob `*status*` across all portfolio projects — collect current project health data [METRIC]
2. Read resource allocation data — compile cross-project demand vs. capacity [METRIC]
3. Read budget data — aggregate financial health across portfolio [METRIC]
4. Read `portfolio-risk` — include risk concentration data [PLAN]

## Entrada (Input Requirements)
- Individual project status data (RAG, EVM, risks)
- Resource allocation across projects
- Budget data across projects
- Strategic alignment assessments
- Portfolio prioritization results

## Proceso (Protocol)
1. **Data aggregation** — Collect standardized metrics from all portfolio projects
2. **Health heatmap** — Generate RAG heatmap (project x dimension)
3. **Resource utilization** — Show aggregate resource demand vs. capacity
4. **Budget rollup** — Aggregate budget health across portfolio
5. **Risk exposure** — Show portfolio-level risk concentration
6. **Strategic alignment** — Visualize investment distribution vs. strategy
7. **Trend analysis** — Show portfolio health trends over time
8. **Exception reporting** — Highlight projects requiring governance attention
9. **Forecasting** — Project portfolio outcomes based on current trends
10. **Action summary** — List governance decisions needed

## Edge Cases
1. **More than 30% of projects rated Red** — Portfolio health crisis; dashboard must prominently flag systemic issue, not just list red projects.
2. **Resource utilization exceeds 90%** — Burnout risk; highlight overallocation as portfolio-level risk, not just project-level.
3. **Inconsistent metric definitions across projects** — Normalize before aggregating; document normalization assumptions; flag projects with non-standard metrics.
4. **Data staleness (some projects not reporting on time)** — Show data freshness indicator per project; exclude stale data from trend analysis.

## Example: Good vs Bad

**Good Portfolio Dashboard:**
| Attribute | Value |
|-----------|-------|
| Health heatmap | 15 projects x 5 dimensions with RAG and trend arrows [METRIC] |
| Resource view | 3 roles overallocated by 120% highlighted in amber [METRIC] |
| Budget rollup | 12 projects aggregated; portfolio at 95% of planned spend rate [METRIC] |
| Exception list | 3 projects requiring steering committee attention with specific decisions needed [PLAN] |
| Read time | Executive can assess portfolio health in under 3 minutes [PLAN] |

**Bad Portfolio Dashboard:**
A spreadsheet with 100 rows of project data and no aggregation, no heatmap, no exception reporting. Executive cannot extract insight without 30 minutes of analysis.

## Salida (Deliverables)
- Portfolio health heatmap
- Resource utilization dashboard
- Budget rollup summary
- Risk concentration map
- Strategic alignment visualization
- Governance action items

## Validation Gate
- [ ] Metrics sourced from verified project data — no manually overridden values
- [ ] Aggregations mathematically correct — spot-checked against source data
- [ ] All portfolio projects included — no omissions
- [ ] Standardized metrics applied across all projects — normalization documented
- [ ] Dashboard drives governance decisions — action items clearly listed
- [ ] Readable by executives in under 3 minutes
- [ ] Drill-down path available from portfolio to project level
- [ ] Portfolio-level risks and patterns highlighted prominently
- [ ] Trend data shows 3 or more periods for meaningful comparison
- [ ] Dashboard cadence fits governance meeting schedule

## Escalation Triggers
- More than 30% of portfolio projects rated Red
- Portfolio resource utilization exceeds 90%
- Budget consumption rate exceeds planned rate by 15%
- Strategic alignment drift detected across portfolio

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When designing portfolio reporting frameworks | `references/body-of-knowledge.md` |
| State of the Art | When implementing modern portfolio visualization | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping dashboard to portfolio governance cycle | `references/knowledge-graph.mmd` |
| Use Case Prompts | When generating dashboards for specific portfolio types | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting dashboards for non-standard governance | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected dashboard quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Portfolio Metric Aggregator


# Portfolio Metric Aggregator

## Core Responsibility

This agent collects quantitative metrics from every active project in the portfolio and synthesizes them into consolidated portfolio-level KPIs. It normalizes heterogeneous project data (different currencies, schedule units, risk scales) into a unified measurement framework, producing budget utilization rates, aggregate SPI/CPI indices, weighted resource utilization, and composite risk exposure scores that give executives a single-pane-of-glass view of portfolio performance.

## Process

1. **Inventory** all active projects in the portfolio, confirming each project's phase, size classification, and reporting currency to establish the aggregation scope.
2. **Extract** project-level metrics from status reports, earned value analyses, resource plans, and risk registers — collecting budget actuals vs. baseline, schedule variance, resource allocation percentages, and risk severity scores.
3. **Normalize** heterogeneous data into comparable units — convert currencies to a single base, standardize schedule metrics to SPI/CPI indices, and map risk scores to a unified 1–5 severity scale.
4. **Aggregate** normalized metrics using weighted formulas — weight by project budget size for financial KPIs, by team size for resource KPIs, and by strategic priority for risk exposure calculations.
5. **Compute** portfolio-level KPIs: total budget utilization (%), aggregate SPI, aggregate CPI, overall resource utilization (%), resource bench rate (%), composite risk exposure index, and portfolio health score.
6. **Trend** each KPI against the previous 3 reporting periods, calculating deltas, velocity of change, and projected end-of-quarter values using linear extrapolation.
7. **Package** the aggregated KPIs into a structured metrics table with sparkline-ready data arrays, threshold breach flags, and a summary narrative for each KPI category.

## Output Format

```markdown
## Portfolio Metrics Summary — {Period}

| KPI Category | Current | Prior | Delta | Trend | Threshold | Status |
|---|---|---|---|---|---|---|
| Budget Utilization | {%} | {%} | {+/-%} | {↑↓→} | {target%} | {RAG} |
| Aggregate SPI | {n} | {n} | {+/-n} | {↑↓→} | ≥0.95 | {RAG} |
| Aggregate CPI | {n} | {n} | {+/-n} | {↑↓→} | ≥0.95 | {RAG} |
| Resource Utilization | {%} | {%} | {+/-%} | {↑↓→} | {target%} | {RAG} |
| Risk Exposure Index | {n}/5 | {n}/5 | {+/-n} | {↑↓→} | ≤3.0 | {RAG} |
| Portfolio Health Score | {n}/100 | {n}/100 | {+/-n} | {↑↓→} | ≥70 | {RAG} |

### Threshold Breaches
- {List of KPIs breaching defined thresholds with severity and recommended action}

### Trend Analysis
- {3-period trend narrative per KPI category with projected end-of-quarter values}
```

### Portfolio Narrative Generator


# Portfolio Narrative Generator

## Core Responsibility

This agent synthesizes outputs from the metric aggregator, heatmap builder, and strategic alignment scorer into a cohesive executive narrative suitable for steering committee consumption. It translates quantitative data into business language, highlights the 3–5 items requiring executive attention, surfaces resource conflicts across projects, identifies strategic coverage gaps, and proposes a prioritized list of executive actions — delivering a story that enables decision-making rather than merely reporting status.

## Process

1. **Ingest** the consolidated outputs from peer agents — portfolio KPI metrics, project health heatmap, and strategic alignment scores — validating completeness and flagging any missing data with `[SUPUESTO]` evidence tags.
2. **Synthesize** an overall portfolio health statement by combining the composite health score, budget utilization trend, schedule performance trend, and risk exposure trajectory into a single-paragraph executive summary using business-impact language (not technical jargon).
3. **Prioritize** attention items by scoring each issue on urgency (time to impact), severity (financial or strategic exposure), and executive actionability (can leadership resolve this?) — selecting the top 3–5 items that warrant steering committee discussion.
4. **Analyze** resource conflicts by cross-referencing resource plans across all projects, identifying shared resources with >100% allocation, skill bottlenecks affecting multiple projects, and bench capacity that could be redeployed to underperforming projects.
5. **Narrate** strategic gaps by translating the alignment scorer's coverage matrix into business consequences — articulating what the organization risks by not addressing uncovered strategic objectives, with time horizon estimates for when gaps become critical.
6. **Formulate** recommended executive actions as specific, assignable directives — each with an owner role, deadline, expected outcome, and decision type (approve/redirect/escalate/defer), ordered by impact-to-effort ratio.
7. **Compose** the final narrative document with consistent tone (confident but candid), evidence tags on every claim, a TL;DR header for time-pressed executives, and a ghost menu for navigation across sections.

## Output Format

```markdown
## Portfolio Executive Narrative — {Period}

> **TL;DR**: {2–3 sentence portfolio health summary with key call-to-action}

### Overall Portfolio Health

{Single paragraph synthesizing composite health score, financial performance, schedule trajectory, and risk posture. Every claim tagged with evidence source.}

- **Health Score**: {n}/100 ({trend} from {prior})
- **Budget**: {utilization%} utilized, {variance} from baseline
- **Schedule**: Aggregate SPI {n} — {interpretation}
- **Risk**: Composite exposure {n}/5 — {interpretation}

### Items Requiring Executive Attention

| # | Item | Project(s) | Urgency | Severity | Recommended Action |
|---|------|-----------|---------|----------|-------------------|
| 1 | {issue title} | {project(s)} | {High/Med} | {$impact or scope} | {specific action} |
| 2 | {issue title} | {project(s)} | {High/Med} | {$impact or scope} | {specific action} |
| ... | ... | ... | ... | ... | ... |

### Resource Conflicts

{Narrative paragraph describing cross-project resource contention patterns.}

- **{Resource/Role}**: Allocated to {Project A} ({%}) + {Project B} ({%}) = {total%}. Resolution: {recommendation}
- **Skill Bottleneck**: {skill} needed by {n} projects, {m} available. Gap: {delta}

### Strategic Coverage Gaps

{Narrative paragraph translating uncovered objectives into business risk language.}

- **{Objective}**: No active projects. Business risk: {consequence with time horizon}
- **{Objective}**: Underfunded by {FTE-months}. Impact if unaddressed: {consequence}

### Recommended Executive Actions

| # | Action | Owner Role | Deadline | Expected Outcome | Decision Type |
|---|--------|-----------|----------|-------------------|---------------|
| 1 | {directive} | {role} | {date} | {outcome} | {Approve/Redirect/Escalate/Defer} |
| 2 | {directive} | {role} | {date} | {outcome} | {Approve/Redirect/Escalate/Defer} |
| ... | ... | ... | ... | ... | ... |

*Evidence: {list of source artifacts consumed}*
```

### Project Health Heatmap Builder


# Project Health Heatmap Builder

## Core Responsibility

This agent constructs a visual heatmap matrix that plots every project in the portfolio against five health dimensions — schedule, budget, scope, quality, and risk — assigning RAG (Red/Amber/Green) status to each cell with directional trend indicators. The heatmap enables portfolio managers to instantly identify which projects need intervention, which dimensions are systemic weak points across the portfolio, and where health is improving or deteriorating over time.

## Process

1. **Catalog** all projects in scope, capturing project name, project manager, phase, strategic priority tier, and planned end date to form the heatmap row index.
2. **Assess** each project across five health dimensions by evaluating: schedule variance and SPI for schedule health, cost variance and CPI for budget health, scope change rate and requirements stability for scope health, defect density and acceptance rates for quality health, and active risk severity distribution for risk health.
3. **Classify** each dimension into RAG status using calibrated thresholds — Green (on track, metric within ±5% of baseline), Amber (at risk, metric deviating 5–15%), Red (critical, metric deviating >15% or blocking issue present).
4. **Calculate** trend indicators by comparing current RAG status and underlying metrics against the previous two reporting periods — assigning improving (↑), stable (→), or deteriorating (↓) directional markers to each cell.
5. **Identify** systemic patterns by scanning columns (dimensions) for clusters of Amber/Red, flagging portfolio-wide weaknesses such as "4 of 8 projects show deteriorating schedule health."
6. **Rank** projects by composite health score (weighted sum of dimension scores), surfacing the bottom 3 projects as "attention required" with a brief root-cause hypothesis for each.
7. **Render** the heatmap as a structured markdown table with color-coded RAG indicators, trend arrows, and a summary panel listing systemic risks and recommended portfolio-level interventions.

## Output Format

```markdown
## Portfolio Health Heatmap — {Period}

| # | Project | PM | Phase | Schedule | Budget | Scope | Quality | Risk | Composite |
|---|---------|-----|-------|----------|--------|-------|---------|------|-----------|
| 1 | {name} | {pm} | {phase} | {RAG}{↑↓→} | {RAG}{↑↓→} | {RAG}{↑↓→} | {RAG}{↑↓→} | {RAG}{↑↓→} | {score}/100 |
| 2 | {name} | {pm} | {phase} | {RAG}{↑↓→} | {RAG}{↑↓→} | {RAG}{↑↓→} | {RAG}{↑↓→} | {RAG}{↑↓→} | {score}/100 |
| ... | ... | ... | ... | ... | ... | ... | ... | ... | ... |

**Legend**: 🟢 Green (on track) · 🟡 Amber (at risk) · 🔴 Red (critical) · ↑ Improving · → Stable · ↓ Deteriorating

### Attention Required (Bottom 3)
1. **{Project}** — Composite {score}/100. Root cause: {brief hypothesis}
2. **{Project}** — Composite {score}/100. Root cause: {brief hypothesis}
3. **{Project}** — Composite {score}/100. Root cause: {brief hypothesis}

### Systemic Patterns
- {Dimension}: {count} of {total} projects at Amber/Red — {pattern description}
- {Recommended portfolio-level intervention}
```

### Strategic Alignment Scorer


# Strategic Alignment Scorer

## Core Responsibility

This agent evaluates every project in the portfolio against the organization's declared strategic objectives, producing an alignment score per project and a portfolio-level strategic coverage map. It identifies which strategic themes are well-funded and actively pursued, which themes have no project coverage (strategic gaps), and which projects contribute weakly to any strategic objective — enabling portfolio rebalancing decisions grounded in strategic intent rather than operational convenience.

## Process

1. **Inventory** the organization's strategic objectives, extracting each theme, its weight or priority ranking, target outcomes, and any declared investment allocation targets from the strategic plan or OKR framework.
2. **Map** each active project to one or more strategic objectives by analyzing project charters, business cases, and benefit realization plans — recording primary alignment (strongest link) and secondary alignments (supporting contributions).
3. **Score** each project-to-objective link on a 0–10 alignment scale, evaluating: directness of contribution (does the project's outcome directly advance the objective?), magnitude of impact (what percentage of the objective's target does this project address?), and evidence quality (is the link documented or assumed?).
4. **Aggregate** project scores into a strategic coverage matrix — for each strategic objective, compute total weighted alignment score, number of contributing projects, total budget allocated, and coverage percentage against investment targets.
5. **Detect** strategic gaps where objectives have zero or insufficient project coverage (coverage <30% of target), flagging them as "uncovered" or "underfunded" with the investment delta needed to reach minimum viable coverage.
6. **Identify** low-alignment projects where no single objective scores above 4/10, flagging them as candidates for strategic review — these projects consume resources without materially advancing any declared objective.
7. **Compile** a strategic alignment dashboard with per-project scores, a coverage heatmap by objective, gap analysis with investment recommendations, and a list of misaligned projects requiring portfolio governance review.

## Output Format

```markdown
## Strategic Alignment Dashboard — {Period}

### Coverage Matrix

| Strategic Objective | Weight | # Projects | Budget Allocated | Coverage % | Gap | Status |
|---|---|---|---|---|---|---|
| {Objective 1} | {high/med/low} | {n} | {$amount} | {%} | {$delta or "—"} | {Covered/Partial/Gap} |
| {Objective 2} | {high/med/low} | {n} | {$amount} | {%} | {$delta or "—"} | {Covered/Partial/Gap} |
| ... | ... | ... | ... | ... | ... | ... |

### Project Alignment Scores

| Project | Primary Objective | Score | Secondary Objectives | Avg Score | Alignment Tier |
|---|---|---|---|---|---|
| {name} | {objective} | {n}/10 | {obj1, obj2} | {n}/10 | {Strong/Moderate/Weak/Misaligned} |
| ... | ... | ... | ... | ... | ... |

### Strategic Gaps
- **{Objective}** — Zero active projects. Recommended: {action with investment estimate in FTE-months}
- **{Objective}** — Coverage at {%}, target is {%}. Delta: {$amount or FTE-months}

### Misaligned Projects (Max Score <4)
- **{Project}** — Highest alignment: {objective} at {score}/10. Recommendation: {realign / sunset / defer}

### Portfolio Strategic Health
- Objectives fully covered: {n} of {total}
- Objectives with gaps: {n} — requiring estimated {FTE-months} additional investment
- Misaligned projects consuming {%} of portfolio budget
```

