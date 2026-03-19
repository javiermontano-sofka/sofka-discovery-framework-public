---
name: apex-pmo-maturity
description: >
  Use when the user asks to "assess PMO maturity", "evaluate PM maturity",
  "run OPM3 assessment", "P3M3 assessment", "benchmark PMO capability",
  or mentions PMO maturity model, organizational PM maturity, capability maturity,
  OPM3, P3M3. Triggers on: scores PMO maturity against OPM3 or P3M3 frameworks,
  produces maturity radar charts, identifies improvement priorities by strategic impact,
  designs multi-year maturity roadmap, estimates improvement investment in FTE-months.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# PMO Maturity Assessment (OPM3 / P3M3)

**TL;DR**: Assesses organizational project management maturity using OPM3 (Organizational Project Management Maturity Model) and P3M3 (Portfolio, Programme, and Project Management Maturity Model) frameworks. Evaluates maturity across project, program, and portfolio levels, identifies improvement priorities, and produces a maturity roadmap.

## Principio Rector
La madurez no es un destino — es un viaje deliberado. No todas las organizaciones necesitan nivel 5 en todas las dimensiones. La clave es alinear la madurez objetivo con la estrategia organizacional: invertir en las capacidades que generan mayor retorno estratégico, no en las que "suenan bien" en un reporte.

## Assumptions & Limits
- Assumes access to PM practitioners and executives for evidence gathering [STAKEHOLDER]
- Assumes organizational PM policies and processes exist in some documented form [SUPUESTO]
- Breaks if organization has no PM standardization at all — Level 0 baseline requires foundational work before assessment [PLAN]
- Scope limited to PM maturity via OPM3/P3M3; broader organizational maturity (CMMI, digital) is separate [PLAN]
- Does not set target maturity — target depends on organizational strategy and investment capacity [PLAN]

## Usage
```bash
/pm:pmo-maturity $ORG_NAME --framework=opm3
/pm:pmo-maturity $ORG_NAME --framework=p3m3 --levels=project,program,portfolio
/pm:pmo-maturity $ORG_NAME --framework=combined --benchmark=industry
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ORG_NAME` | Yes | Target organization identifier |
| `--framework` | No | `opm3` / `p3m3` / `combined` (default: `p3m3`) |
| `--levels` | No | `project` / `program` / `portfolio` / `all` (default: `all`) |
| `--benchmark` | No | `industry` / `sector` / `internal` |

## Service Type Routing
`{TIPO_PROYECTO}`: PMO-Setup uses this as foundational assessment; Agile-Transformation focuses on agile maturity dimensions; Portfolio projects assess portfolio management maturity; All organizational improvement initiatives use maturity as baseline.

## Before Assessing PMO Maturity
1. Read organizational PM policies and process documentation — primary evidence source [PLAN]
2. Glob `*standard*`, `*template*`, `*process*` — inventory PM artifacts for maturity scoring [PLAN]
3. Read historical project performance data — quantitative maturity evidence [METRIC]
4. Schedule stakeholder interviews — multi-perspective evidence required [STAKEHOLDER]

## Entrada (Input Requirements)
- Organizational PM policies and processes
- PMO charter and operating model (if exists)
- Historical project performance data
- Stakeholder interviews (PM practitioners, sponsors, executives)
- Industry benchmarks

## Proceso (Protocol)
1. **Framework selection** — Choose OPM3, P3M3, or combined based on organizational context
2. **Dimension mapping** — Identify assessment dimensions (processes, people, tools, governance)
3. **Data collection** — Conduct interviews, surveys, and document reviews
4. **Current state scoring** — Rate maturity per dimension (1-5 scale)
5. **Gap analysis** — Compare current vs. target maturity per dimension
6. **Benchmark comparison** — Compare against industry peers (if data available)
7. **Priority setting** — Prioritize improvement areas by strategic impact and feasibility
8. **Roadmap design** — Create phased improvement roadmap (quick wins, medium, long-term)
9. **Investment estimation** — Estimate effort for maturity improvements (FTE-months)
10. **Report generation** — Compile maturity assessment report with recommendations

## Edge Cases
1. **Level 1 across multiple critical dimensions** — Focus on Level 2 fundamentals (basic standardization); multi-level jumps are unrealistic and wasteful.
2. **Leadership unwilling to invest in improvement** — Present cost of current maturity gaps in project failure rates and rework; maturity improvement must have visible ROI.
3. **Assessment reveals fundamental governance gaps** — Governance is prerequisite to maturity; roadmap must address governance before process improvement.
4. **Different maturity levels across business units** — Report per-unit and aggregate; roadmap must accommodate different starting points.

## Example: Good vs Bad

**Good PMO Maturity Assessment:**
| Attribute | Value |
|-----------|-------|
| Framework | P3M3 with 5 perspectives across 3 management levels [PLAN] |
| Scoring | 15 dimensions rated 1-5 with evidence per score [METRIC] |
| Radar chart | Current vs. target maturity visualization [METRIC] |
| Gap analysis | 6 priority gaps ranked by strategic impact x feasibility [PLAN] |
| Roadmap | 24-month plan: Phase 1 quick wins (3 mo), Phase 2 foundation (12 mo), Phase 3 optimization (24 mo) [SCHEDULE] |
| Investment | Total estimated effort: 18 FTE-months across 3 phases [METRIC] |

**Bad PMO Maturity Assessment:**
"We are at Level 2." — Single number, no dimension detail, no gap analysis, no roadmap, no investment estimate. Cannot drive improvement investment or track progress.

## Salida (Deliverables)
- `05_pmo_maturity_{proyecto}_{WIP}.md` — Maturity assessment report
- Maturity radar chart (current vs. target per dimension)
- Gap analysis matrix
- Improvement roadmap with phases
- Investment estimation for improvements

## Validation Gate
- [ ] Scores based on interview and document evidence — not PMO self-assessment alone
- [ ] Maturity levels correctly calibrated against published framework definitions
- [ ] All relevant dimensions assessed — no cherry-picking favorable dimensions
- [ ] Scoring criteria applied uniformly across all business units
- [ ] Improvement roadmap implementable with realistic effort estimates (FTE-months)
- [ ] Maturity levels explained in business capability language, not framework jargon
- [ ] Each score justified with 2 or more evidence artifacts
- [ ] Improvement risks identified — maturity building is a change management challenge
- [ ] Leadership sees clear improvement path with investment-to-capability mapping
- [ ] Assessment follows recognized framework methodology — not custom interpretation

## Escalation Triggers
- Maturity level 1 across multiple critical dimensions
- Leadership unwilling to invest in maturity improvement
- Assessment reveals fundamental governance gaps
- No PM standardization across organization

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When applying OPM3 or P3M3 framework rules | `references/body-of-knowledge.md` |
| State of the Art | When referencing current maturity model benchmarks | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping maturity dimensions to organizational structure | `references/knowledge-graph.mmd` |
| Use Case Prompts | When generating maturity assessments for specific sectors | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting maturity models for non-standard organizations | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected maturity assessment quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
