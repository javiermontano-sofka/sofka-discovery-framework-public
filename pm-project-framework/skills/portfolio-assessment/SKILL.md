---
name: apex-portfolio-assessment
description: >
  Use when the user asks to "assess portfolio management maturity", "evaluate portfolio governance",
  "review portfolio practices", "benchmark portfolio capability", "score portfolio management",
  or mentions portfolio assessment, portfolio maturity, portfolio management capability,
  portfolio governance evaluation. Triggers on: assesses portfolio management maturity across
  6 dimensions, evaluates strategic alignment effectiveness, reviews prioritization model
  quality, quantifies portfolio governance gaps, produces portfolio improvement roadmap.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Portfolio Management Maturity Assessment

**TL;DR**: Assesses organizational portfolio management maturity across strategic alignment, portfolio governance, resource optimization, risk aggregation, value realization, and portfolio reporting. Evaluates whether the organization selects the right projects (not just executes projects right). Produces a maturity scorecard, capability gap analysis, and a portfolio management improvement roadmap.

## Principio Rector
La gestión de portafolio no es gestión de proyectos en plural — es gestión estratégica de inversiones. La madurez de portafolio se mide por la capacidad de decir "no" a proyectos que no alinean con la estrategia, por la habilidad de reasignar recursos entre proyectos, y por la transparencia del impacto acumulado de decisiones de inversión.

## Assumptions & Limits
- Assumes portfolio governance structure exists in some form (formal or informal) [SUPUESTO]
- Assumes access to portfolio performance data and governance decision-makers [STAKEHOLDER]
- Breaks if organization has fewer than 10 concurrent projects — portfolio management adds overhead without sufficient scale [PLAN]
- Scope limited to portfolio management maturity; individual project maturity uses `maturity-assessment` [PLAN]
- Does not prescribe portfolio management tools — assesses capability regardless of tooling [PLAN]

## Usage
```bash
/pm:portfolio-assessment $ORG_NAME --dimensions=all
/pm:portfolio-assessment $ORG_NAME --dimensions=strategy,governance,prioritization --benchmark=industry
/pm:portfolio-assessment $ORG_NAME --quick --focus=strategic-alignment
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ORG_NAME` | Yes | Target organization identifier |
| `--dimensions` | No | `all` / comma-separated (default: `all`) |
| `--benchmark` | No | `industry` / `sector` / `internal` |
| `--quick` | No | Abbreviated assessment (top 3 dimensions) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Assess Lean portfolio management practices, epic-level investment decisions
- **Waterfall**: Assess traditional portfolio selection, prioritization, and governance
- **SAFe**: Assess Lean Portfolio Management (LPM) maturity and portfolio Kanban
- **Kanban**: Assess portfolio-level flow, strategic WIP limits, and portfolio Kanban board maturity
- **Hybrid**: Assess ability to manage mixed-methodology portfolio coherently
- **PMO**: Assess PMO's portfolio management service maturity
- **Portfolio**: Primary use — full portfolio management capability assessment
- **Transformation**: Baseline portfolio capability before transformation program

## Before Assessing Portfolio
1. Read portfolio governance documentation — understand current decision-making structure [PLAN]
2. Glob `*prioritization*` and `*scoring*` — identify existing selection criteria [PLAN]
3. Read portfolio performance data — project success rates, strategic alignment scores [METRIC]
4. Schedule governance board interviews — multi-perspective evidence required [STAKEHOLDER]

## Entrada (Input Requirements)
- Portfolio governance structure and decision-making process
- Project selection and prioritization criteria
- Resource allocation model across portfolio
- Portfolio reporting and dashboard configuration
- Historical portfolio performance (project success rates, strategic alignment scores)

## Proceso (Protocol)
1. **Dimension definition** — Establish portfolio assessment dimensions (strategy, governance, resources, risk, value, reporting)
2. **Strategic alignment assessment** — Evaluate how projects connect to organizational strategy
3. **Governance evaluation** — Assess portfolio decision-making bodies, frequency, and effectiveness
4. **Prioritization review** — Evaluate scoring models, ranking methods, and trade-off protocols
5. **Resource optimization** — Assess cross-project resource allocation and capacity management
6. **Risk aggregation** — Evaluate portfolio-level risk identification and interdependency analysis
7. **Value tracking** — Assess benefits realization tracking and value measurement
8. **Reporting quality** — Evaluate portfolio dashboards, KPIs, and decision-support quality
9. **Benchmark comparison** — Compare against portfolio management maturity benchmarks
10. **Improvement roadmap** — Design phased portfolio management capability improvement plan

## Edge Cases
1. **No portfolio governance body exists despite 20+ projects** — Flag as critical gap; recommend immediate establishment of minimal portfolio board before detailed assessment.
2. **Project selection based solely on executive preference** — Score prioritization at Level 1; document the risk of politically-driven selection; propose transparent scoring model pilot.
3. **Resource allocation creates systemic conflicts** — Portfolio-level resource management is the gap; recommend resource pooling or at minimum cross-project visibility.
4. **Portfolio success metrics not defined** — Establish baseline metrics as first roadmap item; cannot measure improvement without defined success criteria.

## Example: Good vs Bad

**Good Portfolio Assessment:**
| Attribute | Value |
|-----------|-------|
| Dimensions | 6 dimensions scored 1-5 with evidence per score [METRIC] |
| Strategic alignment | 72% of projects mapped to strategic objectives; 28% without linkage [METRIC] |
| Prioritization model | Weighted scoring model used but criteria not validated in 18 months [PLAN] |
| Resource optimization | Cross-project visibility exists but no rebalancing mechanism [PLAN] |
| Roadmap | 12-month plan: governance board (Q1), scoring refresh (Q2), resource pooling (Q3-Q4) [SCHEDULE] |

**Bad Portfolio Assessment:**
"We have a list of projects." — No governance assessment, no prioritization evaluation, no strategic alignment check, no resource optimization review. Portfolio management is project list management.

## Salida (Deliverables)
- `05_portfolio_assessment_{proyecto}_{WIP}.md` — Portfolio maturity report
- Portfolio capability heat map across dimensions
- Strategic alignment gap analysis
- Prioritization model effectiveness review
- Portfolio management improvement roadmap

## Validation Gate
- [ ] Maturity levels based on actual portfolio decisions and outcomes, not aspirational statements
- [ ] Assessment dimensions aligned with standard portfolio management frameworks
- [ ] All portfolio management functions assessed — no gaps in coverage
- [ ] Scoring calibrated against established maturity models (P3M3 portfolio level)
- [ ] Improvement roadmap includes governance changes and tool requirements with effort estimates
- [ ] Results understandable by portfolio board and executive sponsors
- [ ] Each finding links to specific portfolio data or decision examples
- [ ] Impact of portfolio management gaps on strategic execution quantified
- [ ] Executive sponsors see portfolio management as strategic capability investment
- [ ] Assessment respects organization's existing portfolio governance model

## Escalation Triggers
- No portfolio governance body exists despite 20+ concurrent projects
- Project selection based solely on executive preference with no scoring model
- Resource allocation creates systemic conflicts across portfolio with no resolution protocol
- Portfolio lacks visibility into aggregate risk exposure

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When applying portfolio management maturity frameworks | `references/body-of-knowledge.md` |
| State of the Art | When referencing modern portfolio governance patterns | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping portfolio assessment to pipeline phases | `references/knowledge-graph.mmd` |
| Use Case Prompts | When generating assessments for specific portfolio types | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting assessment for non-standard portfolio structures | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected portfolio assessment quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
