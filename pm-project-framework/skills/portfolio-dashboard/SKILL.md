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
