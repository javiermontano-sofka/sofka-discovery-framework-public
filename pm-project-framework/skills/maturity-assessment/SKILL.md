---
name: apex-maturity-assessment
description: >
  Use when the user asks to "assess PM maturity", "evaluate project management capability",
  "run OPM3 assessment", "check P3M3 level", "benchmark organizational PM capability",
  or mentions PM maturity, organizational PM maturity, OPM3, P3M3, project management
  maturity model, PM capability assessment. Triggers on: scores PM maturity against
  established frameworks, produces capability heat maps, identifies improvement priorities,
  creates strategic maturity roadmap, benchmarks against industry standards.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Overall PM Maturity Assessment

**TL;DR**: Assesses organizational project management maturity using established frameworks (OPM3, P3M3, or custom APEX model). Evaluates capability across project, program, and portfolio management domains, covering process standardization, measurement, control, and continuous improvement. Produces a maturity level determination, capability heat map, and a strategic improvement roadmap.

## Principio Rector
La madurez en gestión de proyectos no es un destino — es un indicador de capacidad organizacional para entregar valor de forma predecible. Un nivel 5 de madurez no significa perfección; significa que la organización mide, controla y mejora sus procesos de forma sistémica. La evaluación debe revelar dónde invertir para maximizar la capacidad de entrega.

## Assumptions & Limits
- Assumes access to PM practitioners, sponsors, and executives for interview-based evidence [STAKEHOLDER]
- Assumes historical project performance data exists (on-time, on-budget, on-scope rates) [SUPUESTO]
- Breaks if organization has fewer than 5 projects in history — insufficient data for meaningful maturity assessment [METRIC]
- Scope limited to PM maturity; IT maturity, organizational maturity, and digital maturity are separate assessments [PLAN]
- Does not prescribe target maturity level — target depends on organizational strategy and investment appetite [PLAN]

## Usage
```bash
/pm:maturity-assessment $ORG_NAME --framework=opm3
/pm:maturity-assessment $ORG_NAME --framework=p3m3 --domains=project,program,portfolio
/pm:maturity-assessment $ORG_NAME --framework=apex --benchmark=industry
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ORG_NAME` | Yes | Target organization identifier |
| `--framework` | No | `opm3` / `p3m3` / `apex` (default: `apex`) |
| `--domains` | No | `project` / `program` / `portfolio` / `all` (default: `all`) |
| `--benchmark` | No | `industry` / `sector` / `internal` |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Assess PM maturity with Agile-specific capability dimensions added
- **Waterfall**: Classic PM maturity assessment aligned with PMBOK knowledge areas
- **SAFe**: Extend assessment to include Lean-Agile maturity at portfolio level
- **Kanban**: Include flow-based PM maturity dimensions alongside traditional domains
- **Hybrid**: Assess maturity across both iterative and sequential PM capabilities
- **PMO**: Primary use — full organizational PM maturity across all domains
- **Portfolio**: Emphasize portfolio management maturity (strategic alignment, resource optimization)
- **Transformation**: Baseline PM maturity to design capability building program

## Before Assessing Maturity
1. Read organizational PM governance model — understand existing structures before scoring [PLAN]
2. Glob `*process*`, `*template*`, `*standard*` — inventory existing PM artifacts [PLAN]
3. Read historical project performance data — quantitative evidence for maturity scoring [METRIC]
4. Schedule stakeholder interviews — maturity assessment requires multi-perspective evidence [STAKEHOLDER]

## Entrada (Input Requirements)
- Organizational structure and PM governance model
- Existing PM processes, templates, and standards
- PM tool landscape and utilization levels
- PM competency profiles and training programs
- Historical project performance data (on-time, on-budget, on-scope rates)

## Proceso (Protocol)
1. **Framework selection** — Choose maturity model (OPM3, P3M3, or APEX custom) based on org context
2. **Domain scoping** — Define assessment domains (project, program, portfolio, organizational enablers)
3. **Data collection** — Gather evidence through interviews, process review, and artifact analysis
4. **Process maturity scoring** — Rate each domain on standardization, measurement, control, improvement (1-5)
5. **Capability heat mapping** — Visualize maturity across domains as heat map
6. **Strengths identification** — Document areas of high maturity and contributing factors
7. **Gap analysis** — Identify critical gaps between current and target maturity
8. **Benchmark comparison** — Compare against industry and sector benchmarks
9. **Investment prioritization** — Rank improvements by impact on delivery capability
10. **Strategic roadmap** — Design multi-year maturity improvement roadmap

## Edge Cases
1. **Level 1 maturity across all critical domains** — Do not attempt Level 5 roadmap; design Level 2 quick-wins (basic standardization) as immediate priority.
2. **Assessment reveals regulatory or compliance exposure** — Escalate immediately to governance; compliance gaps take priority over maturity improvement.
3. **Organization lacks basic PM competency framework** — Competency development becomes prerequisite to process maturity; roadmap must address people before process.
4. **Stakeholders disagree on maturity scores** — Use evidence-based scoring with artifact review; document dissenting views but let evidence prevail.

## Example: Good vs Bad

**Good Maturity Assessment:**
| Attribute | Value |
|-----------|-------|
| Framework | P3M3 with APEX extensions for agile dimensions [PLAN] |
| Scoring | 12 domains rated 1-5 with specific evidence per score [METRIC] |
| Heat map | Visual showing strengths (Level 4 in risk) and gaps (Level 1 in portfolio) [METRIC] |
| Benchmark | Compared against financial services sector P3M3 data [METRIC] |
| Roadmap | 18-month plan with quarterly milestones and FTE-month estimates [SCHEDULE] |

**Bad Maturity Assessment:**
"The organization is at Level 2 overall." — No domain breakdown, no evidence per score, no heat map, no benchmark, no roadmap. Single number provides no basis for improvement investment.

## Salida (Deliverables)
- `05_pm_maturity_assessment_{proyecto}_{WIP}.md` — Full maturity assessment report
- Capability heat map across PM domains
- Gap analysis with prioritized improvement areas
- Benchmark comparison scorecard
- Strategic maturity improvement roadmap (12-24 months)

## Validation Gate
- [ ] Maturity levels supported by process artifacts and performance data — not self-reported
- [ ] Framework levels applied per published model definitions exactly
- [ ] All PM domains and organizational enablers assessed — no dimension skipped
- [ ] Scoring calibrated across departments and business units consistently
- [ ] Improvement roadmap includes effort estimates (FTE-months) and expected maturity gain
- [ ] Maturity levels translated to business capability language for executive audience
- [ ] Each score links to 2 or more specific evidence artifacts
- [ ] Risks of current maturity gaps on project portfolio quantified
- [ ] C-level presentation shows maturity as investment in delivery predictability
- [ ] Assessment model appropriate for organizational context and methodology portfolio

## Escalation Triggers
- Level 1 maturity across all critical PM domains
- No PM processes standardized despite running 50+ projects
- PM maturity assessment reveals compliance or regulatory exposure
- Organization lacks basic PM competency framework

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
