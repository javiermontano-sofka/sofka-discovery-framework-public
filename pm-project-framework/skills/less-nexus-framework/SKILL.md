---
name: apex-less-nexus-framework
description: >
  Use when the user asks to "implement LeSS", "set up Nexus", "scale Scrum for multiple teams",
  "coordinate multi-team delivery", "unify product backlog across teams", or mentions LeSS,
  Nexus, multi-team Scrum, cross-team coordination, integrated increment. Triggers on: designs
  multi-team Scrum scaling, configures shared product backlog, establishes cross-team coordination
  events, creates integration strategy for 2-8 teams, produces scaling metrics dashboard.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# LeSS / Nexus Multi-Team Scaling

**TL;DR**: Designs a multi-team Scrum scaling approach using LeSS (Large-Scale Scrum) or Nexus. Configures shared product backlog, cross-team coordination events, integration practices, and dependency management for 2-8 teams working on a single product.

## Principio Rector
Escalar Scrum no significa multiplicar la burocracia — significa extender el empirismo a múltiples equipos. LeSS mantiene la simplicidad de Scrum y agrega solo las coordinaciones mínimas necesarias. Nexus introduce un equipo de integración explícito. Ambos preservan la entrega de un incremento integrado cada sprint.

## Assumptions & Limits
- Assumes teams are already practicing Scrum at team level with reasonable maturity [SUPUESTO]
- Assumes a single product with shared backlog — multi-product setups need different coordination [SUPUESTO]
- Breaks if more than 8 teams are involved — use LeSS Huge or SAFe for larger scale [PLAN]
- Scope limited to framework design; team-level Scrum coaching is a separate engagement [PLAN]
- Does not address non-Scrum teams — Kanban teams within the same product need hybrid coordination [PLAN]

## Usage
```bash
/pm:less-nexus-framework $PROJECT_NAME --framework=less --teams=4
/pm:less-nexus-framework $PROJECT_NAME --framework=nexus --teams=6 --integration-team
/pm:less-nexus-framework $PROJECT_NAME --framework=auto --teams=3
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--framework` | No | `less` / `nexus` / `auto` (default: `auto`) |
| `--teams` | No | Number of Scrum teams (2-8) |
| `--integration-team` | No | Explicitly create Nexus Integration Team |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Core use case — LeSS or Nexus for 2-9 Scrum teams on a single product with shared backlog and integrated increment
- **SAFe**: Alternative to SAFe for organizations preferring minimal framework overhead; LeSS Huge competes with Large Solution SAFe
- **Hybrid**: LeSS/Nexus coordination for agile teams within a larger waterfall program; integration sprint aligns to phase gates
- **Transformation**: LeSS adoption as organizational simplification initiative; de-scaling from heavy frameworks to lightweight multi-team Scrum

## Before Designing Multi-Team Scaling
1. Read team-level Scrum maturity — confirm all teams are at least basic Scrum proficiency [PLAN]
2. Glob `*architecture*` and `*dependency*` — understand component dependencies between teams [PLAN]
3. Read product backlog structure — confirm single backlog feasibility [PLAN]
4. Assess Product Owner bandwidth — one PO for multiple teams is the constraint [STAKEHOLDER]

## Entrada (Input Requirements)
- Number of teams and their current state
- Product architecture and component dependencies
- Current coordination challenges
- Single vs. multiple product backlogs decision

## Proceso (Protocol)
1. **Assess scaling need** — Verify multi-team coordination is actually needed (not just team splitting)
2. **Select framework** — Choose LeSS or Nexus based on team count and integration complexity
3. **Product Backlog unification** — Establish single PB with one Product Owner
4. **Cross-team events** — Design Overall Sprint Planning, Overall Retrospective, cross-team refinement
5. **Integration strategy** — Define continuous integration practices and integration testing
6. **Dependency management** — Create dependency visualization and resolution protocol
7. **Architecture guidance** — Establish architecture practices to minimize cross-team dependencies
8. **Metrics** — Define cross-team velocity, integration quality, dependency resolution time

## Edge Cases
1. **Teams in different time zones without overlap** — Design asynchronous coordination protocols; shift cross-team events to overlap windows; accept longer integration feedback loops.
2. **Product architecture forces tight coupling** — Invest in architectural refactoring before scaling; coupled architecture + multi-team = integration nightmare.
3. **Product Owner bandwidth insufficient** — Consider Area Product Owners (LeSS Huge) or delegate refinement authority; single PO must retain backlog prioritization authority.
4. **More than 8 teams needed** — Transition to LeSS Huge (requirement areas) or evaluate SAFe; document why lightweight scaling no longer fits.

## Example: Good vs Bad

**Good Multi-Team Scaling:**
| Attribute | Value |
|-----------|-------|
| Framework selected | LeSS for 4 teams, justified by low integration complexity [PLAN] |
| Product Backlog | Single backlog, one PO, area-specific refinement sessions [PLAN] |
| Cross-team events | Overall Sprint Planning Part 1 (shared), Part 2 (per-team) [SCHEDULE] |
| Integration | Continuous integration with automated cross-team tests [PLAN] |
| Dependency resolution | Dependency board updated daily; resolution SLA 48h [METRIC] |

**Bad Multi-Team Scaling:**
"Each team has their own backlog and their own PO, and they sync monthly." — No shared backlog, no cross-team events, no integration strategy. Teams deliver incompatible increments that require costly integration phases.

## Salida (Deliverables)
- `02_scaling_framework_{proyecto}_{WIP}.md` — LeSS/Nexus implementation guide
- Cross-team coordination event calendar
- Dependency matrix and visualization
- Integration strategy document
- Scaling metrics dashboard

## Validation Gate
- [ ] Single product backlog maintained with one authoritative Product Owner
- [ ] Framework rules correctly applied per LeSS or Nexus published guidelines
- [ ] All cross-team coordination events defined with cadence, duration, and participants
- [ ] Integration strategy ensures integrated increment every sprint
- [ ] Dependency visualization updated at least daily with resolution SLAs
- [ ] Architecture practices actively minimize cross-team dependencies
- [ ] Scaling decision traces to organizational need — not framework fashion
- [ ] Cross-team velocity and integration quality metrics tracked
- [ ] Coordination roles (Nexus Integration Team / LeSS communities) unambiguous
- [ ] Teams can start coordinating within first sprint after design

## Escalation Triggers
- More than 8 teams (consider LeSS Huge or SAFe)
- Product architecture forces too many cross-team dependencies
- Product Owner bandwidth insufficient for multi-team coordination
- Teams in different time zones without overlap

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
