---
name: apex-resource-plan
description: >
  Use when the user asks to "plan resources", "allocate team", "create RACI",
  "define team structure", "capacity planning", "staff the project",
  or mentions resource allocation, team roles, staffing, organizational chart,
  responsibility matrix, resource histogram, capacity management.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Resource Allocation & Capacity Planning

**TL;DR**: Produces a resource management plan including team structure, role definitions, RACI matrix, capacity allocation, and resource calendar. Identifies resource conflicts, over-allocations, and skill gaps. Ensures every work package has an assigned responsible party with verified availability.

## Principio Rector
Los recursos no son fungibles. Cada persona tiene habilidades, disponibilidad y carga cognitiva únicas. Un plan de recursos que trata a las personas como "recursos genéricos" producirá cronogramas ficticios. La capacidad real — no la teórica — determina lo que un equipo puede entregar.

## Assumptions & Limits
- Assumes WBS and schedule baseline exist to define resource demand [PLAN]
- Assumes organizational resource pool information is available [SUPUESTO]
- Breaks when resource availability data is fictional (100% allocation assumed for everyone)
- Does not negotiate resource availability; plans against stated availability
- Assumes max allocation per person is 80% unless explicitly justified [SUPUESTO]
- Limited to project resource planning; for organizational capacity use portfolio-level tools

## Usage

```bash
# Full resource plan from WBS
/pm:resource-plan $ARGUMENTS="--wbs wbs.md --schedule schedule.md"

# Capacity analysis only
/pm:resource-plan --type capacity --team team-roster.md --period Q3-2026

# Skills gap analysis integration
/pm:resource-plan --type gap-analysis --skills-required requirements.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to WBS and schedule baseline |
| `--type` | No | `full` (default), `capacity`, `gap-analysis` |
| `--team` | No | Path to current team roster |
| `--period` | No | Planning period for capacity analysis |
| `--max-allocation` | No | Max allocation % per person (default 80%) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Cross-functional teams with stable membership; Scrum Masters and Product Owners as dedicated roles; capacity measured in velocity
- **Waterfall**: Role-based resource assignments per work package; resource histograms and leveling; formal RACI per phase
- **SAFe**: ART-level capacity planning; shared services across teams; System Architects, RTE, and PI-level resource allocation
- **Kanban**: Team capacity managed through WIP limits; specialists and generalists balanced by service class demand
- **PMO**: Resource pool governance; cross-project allocation policies; demand vs. capacity portfolio dashboards
- **Portfolio**: Multi-project resource balancing; strategic resource allocation aligned to portfolio priorities and funding cycles

## Before Planning Resources
1. **Read** the WBS to understand work package decomposition and effort requirements [PLAN]
2. **Read** the schedule baseline to map time-phased resource demand [SCHEDULE]
3. **Glob** `**/team_roster*` or `**/org_chart*` to identify available resources [PLAN]
4. **Grep** for skill requirements across work packages to identify needed competencies [PLAN]

## Entrada (Input Requirements)
- Approved WBS and schedule baseline
- Organizational resource pool and availability
- Skill requirements per work package
- Budget constraints for staffing
- Organizational policies on allocation limits

## Proceso (Protocol)
1. **Identify roles** — Define roles needed based on WBS work packages and methodology
2. **Define responsibilities** — Create RACI matrix (Responsible, Accountable, Consulted, Informed)
3. **Assess availability** — Map actual availability per resource (accounting for other commitments)
4. **Allocate resources** — Assign roles to work packages respecting capacity limits (max 80% allocation)
5. **Detect conflicts** — Identify over-allocations and resource contention points
6. **Level resources** — Apply resource leveling or smoothing to resolve conflicts
7. **Build resource calendar** — Create time-phased resource plan with on/off-boarding dates
8. **Gap analysis** — Identify skills gaps requiring training or external hiring
9. **Contingency staffing** — Define backup resources for critical path activities
10. **Compile plan** — Assemble resource management plan with org chart and RACI

## Edge Cases
1. **Critical path activity has no available resource** — Escalate immediately. Present three options: delay activity, reassign from lower-priority work, or hire/augment. Quantify schedule impact per option [SCHEDULE].
2. **Key-person dependency with no backup** — Flag as project risk. Recommend cross-training plan with timeline. If key person leaves, trigger contingency staffing [PLAN].
3. **Resource available but in different timezone** — Document timezone overlap hours. Adjust ceremony schedules. Ensure ≥4 hours overlap for synchronous collaboration [SUPUESTO].
4. **Budget insufficient for required staffing** — Present scope-resource-timeline trade-off. Something must give: reduce scope, extend timeline, or increase budget [STAKEHOLDER].

## Example: Good vs Bad

**Good example — Data-driven resource plan:**

| Attribute | Value |
|-----------|-------|
| Roles defined | 8 roles with clear responsibilities |
| RACI | 25 deliverables x 8 roles, 1 A per row |
| Capacity | Actual availability verified, max 80% allocation |
| Resource histogram | Time-phased demand vs capacity chart |
| Skills gaps | 2 gaps identified with closure plan (training + hire) |
| Contingency | Backup identified for 3 critical-path roles |

**Bad example — Fictional resource plan:**
"We need 5 developers, 2 QA, 1 PM" with no availability verification, no RACI, no skills assessment, and 100% allocation assumed. Plans built on fictional availability produce fictional schedules. Without backup plans, a single departure derails the project.

## Salida (Deliverables)
- `01_resource_plan_{proyecto}_{WIP}.md` — Resource management plan
- RACI matrix (roles x deliverables)
- Resource histogram (demand vs. capacity over time)
- Skills gap analysis with mitigation actions
- Organization chart (Mermaid)

## Validation Gate
- [ ] Every work package has ≥1 assigned resource with verified availability [PLAN]
- [ ] No resource allocated >80% without documented justification [METRIC]
- [ ] RACI has exactly 1 A per row across all deliverables [PLAN]
- [ ] Resource histogram shows demand vs capacity with no unresolved over-allocations [SCHEDULE]
- [ ] Skills gaps identified with closure strategy and timeline [PLAN]
- [ ] Critical path activities have backup resource identified [PLAN]
- [ ] On-boarding and off-boarding dates defined per resource [SCHEDULE]
- [ ] Evidence ratio: ≥80% [PLAN]/[SCHEDULE], <20% [SUPUESTO]
- [ ] Resource plan aligned with budget baseline [METRIC]
- [ ] Org chart reflects actual reporting structure [PLAN]

## Escalation Triggers
- Critical path activity with no available resource
- Resource allocation exceeds 100% for any individual
- Skills gap requiring > 4 weeks of training
- Key-person dependency with no backup identified

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
