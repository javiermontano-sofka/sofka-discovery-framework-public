---
name: apex-safe-framework
description: >
  Use when the user asks to "implement SAFe", "plan a PI", "set up an ART",
  "design value streams", "configure portfolio Kanban", or mentions SAFe,
  PI Planning, Agile Release Train, portfolio Kanban, value stream mapping,
  program increment, scaled agile implementation.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# SAFe Framework Implementation

**TL;DR**: Designs SAFe (Scaled Agile Framework) implementation including ART configuration, PI Planning structure, value stream identification, portfolio Kanban, and essential SAFe roles. Tailors SAFe to organizational scale (Essential, Large Solution, Portfolio, Full) based on complexity and team count.

## Principio Rector
SAFe escala la agilidad al nivel empresarial alineando equipos, programas y portfolios alrededor de flujos de valor. Su éxito depende de PI Planning como el latido del corazón del ART — sin PI Planning efectivo, SAFe se convierte en burocracia ágil. La clave es alinear estrategia con ejecución a través de cadencias sincronizadas.

## Assumptions & Limits
- Assumes ≥3 agile teams exist or will be formed (SAFe is unnecessary for fewer) [PLAN]
- Assumes executive sponsorship for SAFe transformation is secured [STAKEHOLDER]
- Breaks when organization lacks basic agile maturity at team level — establish team-level agile first
- Does not assess SAFe maturity; implements it. Use `safe-assessment` for assessment
- Assumes value streams are identifiable from business architecture [SUPUESTO]
- Limited to SAFe 6.0 patterns; earlier versions require adaptation notes

## Usage

```bash
# Full SAFe implementation design
/pm:safe-framework $ARGUMENTS="--teams 8 --level Essential"

# PI Planning event design
/pm:safe-framework --type pi-planning --art "ART-Commerce" --pi-length 10

# Portfolio Kanban setup
/pm:safe-framework --type portfolio-kanban --epics "epic-backlog.md"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Team count and SAFe configuration level |
| `--type` | No | `full` (default), `pi-planning`, `portfolio-kanban`, `art-config` |
| `--level` | No | `Essential`, `Large-Solution`, `Portfolio`, `Full` |
| `--teams` | No | Number of teams for ART configuration |
| `--pi-length` | No | PI length in weeks (default 10) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **SAFe**: Full SAFe implementation -- Essential, Large Solution, Portfolio, or Full configuration based on scale and complexity
- **Agile**: Essential SAFe for coordinating 2-5 agile teams; lightweight ART without portfolio layer
- **Portfolio**: Portfolio SAFe with Lean Portfolio Management; strategic themes, portfolio Kanban, and Lean budgeting
- **Transformation**: Full SAFe as enterprise transformation vehicle; organizational change woven into PI cadence and inspect-and-adapt
- **Hybrid**: SAFe ART coordination layer over mixed agile-waterfall teams; PI Planning as the integration heartbeat

## Before Implementing
1. **Read** organizational structure to understand team count and reporting lines [PLAN]
2. **Glob** `**/value_stream*` or `**/capability_map*` to identify existing value stream analysis [PLAN]
3. **Read** current delivery metrics to understand baseline performance [METRIC]
4. **Grep** for agile maturity indicators across team documentation [INFERENCIA]

## Entrada (Input Requirements)
- Number of teams and their current methodologies
- Value stream analysis or business capability map
- Portfolio strategy and investment themes
- Organizational structure and reporting lines
- Current delivery metrics and pain points

## Proceso (Protocol)
1. **Assess scale** — Determine SAFe configuration needed (Essential/Large Solution/Portfolio/Full)
2. **Identify value streams** — Map operational and development value streams
3. **Configure ARTs** — Design Agile Release Trains (5-12 teams per ART)
4. **Define PI cadence** — Set PI length (8-12 weeks) with innovation and planning sprint
5. **Design PI Planning** — Structure 2-day PI Planning event with agendas and preparation
6. **Establish roles** — RTE, Product Management, System Architect, Business Owners
7. **Portfolio Kanban** — Design portfolio flow with epic analysis, lean business case
8. **Metrics & inspect-adapt** — Define ART metrics (predictability, velocity, quality) and I&A ceremony
9. **Implementation roadmap** — Plan SAFe rollout in waves with training milestones
10. **Continuous improvement** — Establish Inspect & Adapt cycle and relentless improvement

## Edge Cases
1. **Fewer than 3 teams** — SAFe is unnecessary. Recommend Scrum or Kanban with lightweight coordination. Document the recommendation [INFERENCIA].
2. **Teams in radically different timezones** — Design distributed PI Planning with satellite events. Ensure ≥4 hours timezone overlap per ART. Consider ART boundaries aligned with timezone clusters [PLAN].
3. **Organization wants SAFe but leadership resists transparency** — Flag as critical risk. SAFe requires radical transparency; without it, SAFe ceremonies become theater. Recommend leadership coaching first [STAKEHOLDER].
4. **Existing waterfall governance mandated by contract** — Design SAFe within waterfall constraints: PI boundaries align with phase gates, PI objectives map to contractual milestones [PLAN].

## Example: Good vs Bad

**Good example — Thoughtful SAFe implementation:**

| Attribute | Value |
|-----------|-------|
| Configuration | Essential SAFe for 8 teams in 1 ART |
| Value streams | 2 development value streams identified |
| PI cadence | 10-week PI with 1-week IP sprint |
| Roles | RTE, 2 Product Managers, System Architect assigned |
| Rollout | 3-wave rollout with training preceding each wave |
| Metrics | Predictability, velocity, quality defined with targets |

**Bad example — SAFe cargo cult:**
All SAFe ceremonies scheduled but no value streams identified, no architectural runway, PI Planning runs as a status meeting, and teams have no autonomy. SAFe without value stream alignment is just synchronized waterfall with stand-ups.

## Salida (Deliverables)
- `02_safe_implementation_{proyecto}_{WIP}.md` — SAFe implementation plan
- ART configuration with team assignments
- PI Planning event guide (agenda, preparation checklist)
- Value stream map (Mermaid)
- Portfolio Kanban design
- SAFe rollout roadmap

## Validation Gate
- [ ] SAFe configuration level justified with team count and complexity [PLAN]
- [ ] ≥1 value stream identified and mapped [PLAN]
- [ ] ART sized between 5-12 teams per ART [METRIC]
- [ ] PI cadence defined (8-12 weeks) with IP sprint included [SCHEDULE]
- [ ] All essential roles assigned (RTE, PM, System Architect, Business Owners) [PLAN]
- [ ] PI Planning event designed with 2-day agenda and preparation checklist [PLAN]
- [ ] Rollout roadmap includes training milestones per wave [SCHEDULE]
- [ ] ART-level metrics defined (predictability, velocity, quality) [METRIC]
- [ ] Evidence ratio: ≥75% [PLAN]/[SCHEDULE], <25% [SUPUESTO]
- [ ] Implementation aligned with SAFe 6.0 principles [PLAN]

## Escalation Triggers
- Fewer than 3 teams (SAFe unnecessary, use Scrum/Kanban)
- No executive sponsorship for SAFe transformation
- Teams geographically distributed without collaboration tools
- Organizational culture hostile to transparency

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | SAFe 6.0 framework reference | `references/body-of-knowledge.md` |
| State of the Art | SAFe implementation patterns | `references/state-of-the-art.md` |
| Knowledge Graph | SAFe in methodology selection | `references/knowledge-graph.mmd` |
| Use Case Prompts | SAFe implementation scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom SAFe configuration | `prompts/metaprompts.md` |
| Sample Output | Reference SAFe implementation plan | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
