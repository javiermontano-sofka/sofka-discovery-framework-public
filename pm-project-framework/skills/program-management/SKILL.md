---
name: apex-program-management
description: >
  Use when the user asks to "manage a program", "coordinate multiple projects",
  "track program benefits", "align program governance", "consolidate program risks",
  or mentions program management, multi-project coordination, program benefits,
  program governance, cross-project dependencies, benefits realization tracking.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Program Management & Coordination

**TL;DR**: Coordinates multiple related projects as a unified program to achieve benefits beyond what individual projects deliver alone. Manages program-level dependencies, resource sharing, governance, and benefits realization across constituent projects.

## Principio Rector
Un programa no es una colección de proyectos — es un vehículo para entregar beneficios que ningún proyecto individual puede lograr. La gestión de programa agrega valor al coordinar interdependencias, optimizar recursos compartidos, y asegurar que los beneficios del programa completo excedan la suma de los beneficios de cada proyecto.

## Assumptions & Limits
- Assumes a formal program charter exists with constituent projects identified [PLAN]
- Assumes each constituent project has its own PM and project plan [SUPUESTO]
- Breaks when constituent projects have no shared dependencies or benefits — use portfolio management instead
- Does not replace project-level management; focuses on cross-project coordination only
- Assumes organizational governance supports program-level decision authority [SUPUESTO]
- Limited to programs with 2-15 constituent projects; larger programs need sub-program decomposition

## Usage

```bash
# Full program coordination setup
/pm:program-management $ARGUMENTS="--charter program-charter.md --projects 5"

# Benefits tracking only
/pm:program-management --type benefits-tracking --period Q2-2026

# Cross-project dependency analysis
/pm:program-management --type dependency-analysis --projects "proj-alpha,proj-beta,proj-gamma"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to program charter or brief |
| `--type` | No | `full` (default), `benefits-tracking`, `dependency-analysis`, `resource-optimization` |
| `--projects` | No | Number or comma-separated list of constituent projects |
| `--period` | No | Reporting period for benefits tracking |

## Service Type Routing
`{TIPO_PROYECTO}`: Multi-Program uses full program management; Digital-Transformation manages transformation as a program; ERP manages multi-module deployment as a program; SAFe manages solution trains as programs.

## Before Coordinating
1. **Read** the program charter and each constituent project's charter to understand scope boundaries [PLAN]
2. **Glob** `**/schedule_baseline*` across all constituent projects to map timeline overlaps [SCHEDULE]
3. **Read** the resource plan from each project to identify shared resource conflicts [PLAN]
4. **Grep** for cross-project dependencies in all project risk registers and dependency logs [INFERENCIA]

## Entrada (Input Requirements)
- Program charter with constituent projects
- Individual project plans and schedules
- Program-level benefits definition
- Shared resource pool
- Program governance framework

## Proceso (Protocol)
1. **Program structure** — Define program components and their relationships
2. **Benefits alignment** — Map how each project contributes to program benefits
3. **Dependency management** — Coordinate cross-project dependencies at program level
4. **Resource optimization** — Manage shared resources across projects
5. **Program governance** — Operate program board and escalation processes
6. **Integrated planning** — Maintain master program schedule with milestones
7. **Risk aggregation** — Assess and manage program-level risks
8. **Benefits tracking** — Monitor program benefits realization progress
9. **Change coordination** — Manage changes that impact multiple projects
10. **Program reporting** — Produce program status reports for governance

## Edge Cases
1. **Single project dominates program resources (>60%)** — Rebalance resource allocation or reclassify as project with supporting initiatives. Flag to program board for structural decision [STAKEHOLDER].
2. **Constituent project cancelled mid-program** — Reassess program benefits model; recalculate whether remaining projects still justify the program. Document impact on inter-project dependencies [PLAN].
3. **Benefits realization timeline extends beyond program closure** — Transfer benefits tracking to operational owner with defined KPIs and monitoring cadence. Do not close the program without a benefits handoff agreement [METRIC].
4. **Cross-project dependency deadlock** — Escalate immediately to program board with impact analysis on all affected projects. Propose three resolution options ranked by total program impact [SCHEDULE].
5. **New project requests inclusion in program** — Evaluate strategic fit, dependency alignment, and resource impact before approval. Require updated benefits case showing program-level value-add [INFERENCIA].

## Example: Good vs Bad

**Good example — Program dependency map:**

| Attribute | Value |
|-----------|-------|
| Constituent projects | 5 clearly defined with individual PMs |
| Benefits model | 3 program-level benefits mapped to project contributions |
| Dependency matrix | 12 cross-project dependencies with owners and dates |
| Resource sharing | 3 shared resources with allocation % per project per month |
| Governance | Monthly program board with escalation thresholds defined |
| Evidence tags | 85% [PLAN] or [SCHEDULE], 15% [INFERENCIA] |

**Bad example — "Program" that is actually a portfolio:**
Five unrelated projects grouped under one label with no shared benefits, no cross-project dependencies, and no resource sharing. This is portfolio management, not program management. The absence of inter-project value creation means program overhead adds cost without benefit.

## Salida (Deliverables)
- Program management plan
- Program-level schedule with cross-project milestones
- Benefits realization tracking dashboard
- Program risk register
- Program status report

## Validation Gate
- [ ] Every constituent project has ≥1 mapped dependency to another project in the program [PLAN]
- [ ] Benefits realization model shows ≥1 benefit achievable only through program coordination [METRIC]
- [ ] No shared resource allocated >80% across combined program demand [SCHEDULE]
- [ ] Program risk register contains ≥5 program-level (not project-level) risks [PLAN]
- [ ] Cross-project milestone alignment verified with ≤5 days variance tolerance [SCHEDULE]
- [ ] Evidence ratio: ≥70% tagged [PLAN]/[SCHEDULE]/[METRIC], <30% [SUPUESTO]
- [ ] Every program-level decision traces to a business benefit [STAKEHOLDER]
- [ ] Program governance cadence defined with ≥monthly program board sessions [PLAN]
- [ ] All constituent project PMs acknowledged program dependencies [STAKEHOLDER]
- [ ] Benefits tracking dashboard updated within current reporting period [METRIC]

## Escalation Triggers
- Constituent project failure threatening program benefits
- Cross-project resource conflict unresolvable at project level
- Program benefits realization tracking below target
- Program scope creep through project additions

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
