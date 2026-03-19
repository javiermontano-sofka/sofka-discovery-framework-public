---
name: apex-kanban-system
description: >
  Use when the user asks to "design a Kanban board", "set WIP limits", "improve flow",
  "measure lead time", "optimize throughput", or mentions Kanban, flow metrics, cumulative
  flow diagram, pull system, WIP limits, cycle time. Triggers on: designs Kanban board layout,
  calculates initial WIP limits, defines pull policies, establishes flow measurement framework,
  produces Kanban system design document.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Kanban System Design

**TL;DR**: Designs a Kanban system including board layout, WIP limits, flow policies, cadences, and metrics (lead time, cycle time, throughput, CFD). Optimizes for flow efficiency and predictability without imposing iteration boundaries.

## Principio Rector
Kanban no prescribe roles ni time-boxes — optimiza el flujo de trabajo existente. El principio fundamental es "stop starting, start finishing". Los límites WIP son la herramienta principal: al limitar el trabajo en progreso, se exponen los cuellos de botella y se fuerza la finalización antes de iniciar nuevo trabajo.

## Assumptions & Limits
- Assumes current workflow is observable and can be mapped to board columns [SUPUESTO]
- Assumes team willingness to respect WIP limits — Kanban without WIP discipline is just a task board [SUPUESTO]
- Breaks if work items are not decomposable to roughly similar sizes — extreme size variance undermines flow metrics [PLAN]
- Scope limited to Kanban system design; ongoing flow coaching is a separate engagement [PLAN]
- Does not impose time-boxes — if sprints are needed, use `scrum-framework` or Scrumban hybrid [PLAN]

## Usage
```bash
/pm:kanban-system $PROJECT_NAME --team-size=7
/pm:kanban-system $PROJECT_NAME --from-workflow=current --optimize=throughput
/pm:kanban-system $PROJECT_NAME --service-classes=4 --cadences=full
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--team-size` | No | Team size for initial WIP limit calculation |
| `--from-workflow` | No | `current` / `clean-slate` (default: `current`) |
| `--optimize` | No | `throughput` / `lead-time` / `predictability` |
| `--service-classes` | No | Number of service classes to define |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Kanban**: Full Kanban Method implementation; WIP limits, flow metrics, cadences, and explicit policies as primary governance
- **Agile**: Scrumban hybrid — Kanban board layered over sprint cadence for teams transitioning or needing flow visibility
- **SAFe**: Portfolio Kanban for investment funding; team Kanban for continuous-flow teams within an ART
- **PMO**: Portfolio Kanban with intake, prioritization, active, and done columns; WIP limits enforce strategic focus
- **Hybrid**: Kanban boards for operational/support workstreams running alongside sprint-based delivery teams

## Before Designing Kanban System
1. Read current workflow documentation — map existing process stages before designing board [PLAN]
2. Glob `*capacity*` and `*resource*` — team capacity data determines initial WIP limits [METRIC]
3. Read historical lead time data if available — baseline for improvement targets [METRIC]
4. Review work item types — classify by service class before board design [PLAN]

## Entrada (Input Requirements)
- Current workflow description
- Work item types and their characteristics
- Team composition and capacity
- Existing process policies (if any)
- Historical data on lead/cycle times (if available)

## Proceso (Protocol)
1. **Map current workflow** — Document existing process stages from request to delivery
2. **Design board columns** — Create column structure reflecting actual workflow stages
3. **Set WIP limits** — Calculate initial WIP limits based on team capacity (start with team size)
4. **Define work item types** — Categorize work items with service classes (expedite, fixed-date, standard, intangible)
5. **Establish pull policies** — Define criteria for pulling work from upstream to downstream columns
6. **Define cadences** — Set replenishment, standup, delivery planning, service delivery review
7. **Metrics framework** — Configure lead time, cycle time, throughput, and CFD tracking
8. **Blocker management** — Define blocker visualization and escalation policies
9. **Explicit policies** — Document policies for each column (entry/exit criteria)
10. **Continuous improvement** — Establish feedback loops to adjust WIP limits and policies

## Edge Cases
1. **No historical flow data available** — Set initial WIP limits at team size minus 1; collect baseline data for 4 weeks before optimizing.
2. **Team insists on no WIP limits** — Implement "soft" limits with visual alerts first; use data from 2-week period to demonstrate impact of unlimited WIP on lead time.
3. **Work items vary enormously in size** — Introduce service classes with different SLAs; consider right-sizing guidance or decomposition standards.
4. **Multiple teams sharing same board** — Use swimlanes per team with independent WIP limits; shared columns need explicit handoff policies.

## Example: Good vs Bad

**Good Kanban System:**
| Attribute | Value |
|-----------|-------|
| Board columns | 6 columns reflecting actual workflow with sub-columns for "doing/done" [PLAN] |
| WIP limits | Set per column based on team capacity; total WIP = team size [METRIC] |
| Service classes | 4 defined: expedite (5%), fixed-date (15%), standard (70%), intangible (10%) [PLAN] |
| Cadences | Daily standup, weekly replenishment, bi-weekly delivery review [SCHEDULE] |
| Metrics | Lead time P50 and P85 tracked; CFD updated daily; throughput weekly [METRIC] |

**Bad Kanban System:**
A Trello board with columns "To Do, Doing, Done" and no WIP limits, no service classes, no metrics, no cadences. This is a task list, not a Kanban system.

## Salida (Deliverables)
- `02_kanban_design_{proyecto}_{WIP}.md` — Kanban system design document
- Board layout with columns, WIP limits, and swim lanes
- Flow metrics baseline and targets
- Cadence calendar
- Policy documentation per column

## Validation Gate
- [ ] WIP limits based on capacity data, not arbitrary numbers [METRIC]
- [ ] Workflow columns accurately reflect actual work stages — not tool defaults
- [ ] All work item types have assigned service classes
- [ ] Pull policies defined for every column transition
- [ ] Cadences scheduled with defined frequency, participants, and purpose
- [ ] Board and policies understandable at a glance without training
- [ ] Metrics framework tracks lead time, cycle time, throughput, and CFD at minimum
- [ ] Blocker visualization and escalation policy defined
- [ ] Explicit policies documented for every column (entry and exit criteria)
- [ ] Feedback loop scheduled to review and adjust WIP limits after initial period

## Escalation Triggers
- WIP limits consistently violated without resolution
- Average lead time increasing over 3 measurement periods
- Blocked items exceeding 20% of WIP
- No improvement in throughput after 4 weeks

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
