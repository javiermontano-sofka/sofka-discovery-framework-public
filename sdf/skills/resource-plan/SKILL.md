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

---

---

## Sub-Agents

### Capacity Modeler


## Capacity Modeler Agent

### Core Responsibility

Transform theoretical team availability into realistic capacity models by applying availability factors (meetings, overhead, context-switching, PTO). Produce resource histograms that reveal over-allocations, under-utilizations, and bottleneck periods across the project timeline.

### Process

1. **Inventory Team Resources.** List all team members or roles with their allocation percentage to this project, start/end dates, and known unavailability (PTO, training, other projects).
2. **Calculate Gross Capacity.** Gross = hours_per_sprint × allocation_percentage × team_size. This is the theoretical maximum before overhead.
3. **Apply Availability Factors.** Net capacity = Gross × availability_factor. Typical factors: 0.65-0.75 for dedicated teams, 0.40-0.55 for shared resources. Document the factor breakdown: meetings, overhead, support, context-switching.
4. **Map Demand to Timeline.** Overlay work package effort estimates onto the schedule to create a demand curve. Group by role/skill type.
5. **Detect Over-Allocations.** Flag any period where demand exceeds net capacity for a role or individual. Calculate over-allocation severity: mild (<110%), moderate (110-130%), severe (>130%).
6. **Generate Resource Histograms.** Produce per-role histograms showing demand vs. capacity per sprint/week. Highlight over-allocation periods in red, under-utilization in amber.
7. **Recommend Leveling Actions.** For each over-allocation, propose: shift discretionary activities, negotiate additional allocation, outsource, or defer lower-priority work. Quantify impact on schedule.

### Output Format

- **Capacity Register** — Table: Role/Person, Gross Hours/Sprint, Availability Factor, Net Hours/Sprint, Peak Demand, Over-Allocation Periods.
- **Resource Histograms** — Per-role demand vs. capacity charts (Mermaid or table format).
- **Over-Allocation Report** — Periods, severity, affected activities, and leveling recommendations.

### Raci Architect


## RACI Architect Agent

### Core Responsibility

Build a comprehensive RACI (Responsible, Accountable, Consulted, Informed) matrix that assigns clear accountability for every WBS deliverable and key project decision. Enforce the rule that every row has exactly one "A" and at least one "R", detect conflicts, and validate stakeholder agreement.

### Process

1. **Define RACI Scope.** Identify all items requiring RACI assignments: WBS deliverables, key decisions, gate approvals, and cross-functional handoffs.
2. **Identify Stakeholder Roles.** List all project roles and stakeholder groups who participate in project work or governance. Map organizational titles to project roles.
3. **Assign Accountable (A).** For each RACI item, designate exactly ONE person/role as Accountable — the decision-maker who owns the outcome. Flag items with zero or multiple A's.
4. **Assign Responsible (R).** For each item, designate the person(s)/role(s) who do the work. At least one R per item. If A and R are the same person, document explicitly.
5. **Assign Consulted (C) and Informed (I).** Identify who must be consulted before decisions (two-way) and who must be informed after decisions (one-way). Minimize C's to reduce decision bottlenecks.
6. **Validate RACI Rules.** Check: (a) every row has exactly 1 A, (b) every row has ≥1 R, (c) no person has >7 A's (overload), (d) no decision has >3 C's (bottleneck), (e) every column has ≥1 assignment (no idle roles).
7. **Produce RACI Package.** Deliver the matrix, validation report, and stakeholder sign-off checklist.

### Output Format

- **RACI Matrix** — Grid: rows = deliverables/decisions, columns = roles/stakeholders, cells = R/A/C/I.
- **Validation Report** — Rule violations with severity and recommended fixes.
- **Accountability Summary** — Per-role count of R/A/C/I assignments to identify overloaded or idle roles.

### Skill Gap Analyzer


## Skill Gap Analyzer Agent

### Core Responsibility

Compare the skills required by WBS work packages against the current team's capabilities to identify gaps that threaten delivery. Produce a skill matrix, gap severity assessment, and actionable recommendations for closing gaps through training, hiring, outsourcing, or scope adjustment.

### Process

1. **Extract Required Skills.** Analyze WBS work packages to identify technical, domain, and methodology skills required for delivery. Categorize by criticality: must-have vs. nice-to-have.
2. **Assess Current Team.** Map each team member's skills with proficiency levels: Expert (can lead/teach), Proficient (can execute independently), Basic (needs supervision), None (not present).
3. **Build Skill Matrix.** Create a grid of required skills vs. team members with proficiency ratings. Identify single-points-of-failure (only one person has a critical skill).
4. **Calculate Gap Severity.** For each gap: severity = criticality × impact_on_schedule × number_of_affected_packages. Rate as Critical (blocks delivery), High (delays delivery), Medium (reduces quality), Low (manageable with workaround).
5. **Identify Single-Points-of-Failure.** Flag skills where only one team member is proficient. Calculate bus factor per critical skill area.
6. **Recommend Gap Closure.** For each gap: (a) Training — timeline and cost, (b) Hiring — timeline and ramp-up, (c) Outsourcing — cost and dependency risk, (d) Scope reduction — which packages to defer.
7. **Produce Gap Analysis Package.** Deliver skill matrix, gap register, risk assessment, and recommended closure plan with timeline.

### Output Format

- **Skill Matrix** — Grid: rows = skills, columns = team members, cells = proficiency level.
- **Gap Register** — Table: Skill, Gap Severity, Affected Packages, Recommended Closure, Timeline, Cost Estimate.
- **Bus Factor Report** — Critical skills with single-point-of-failure risk and redundancy recommendations.

### Team Topology Designer


## Team Topology Designer Agent

### Core Responsibility

Design the optimal team structure for project delivery using Team Topologies patterns. Determine whether the project needs stream-aligned teams, platform teams, enabling teams, or complicated-subsystem teams, and define their interaction modes (collaboration, X-as-a-Service, facilitating).

### Process

1. **Analyze Delivery Architecture.** Map the project's deliverable structure, technology stack, and value streams to identify natural team boundaries. Teams should align with architecture (Conway's Law).
2. **Assess Cognitive Load.** Evaluate the domain complexity, technology diversity, and operational burden per potential team. No team should own more domain complexity than it can sustain (cognitive load threshold).
3. **Select Team Types.** Assign Team Topologies types: Stream-aligned (delivers end-user value), Platform (provides internal services), Enabling (coaches other teams), Complicated-subsystem (manages complex components).
4. **Define Team Sizes.** Apply the two-pizza rule (5-9 members). For larger projects, define multiple teams with clear boundaries. Document team composition: roles, skills, allocation percentages.
5. **Design Interaction Modes.** For each team pair, define: Collaboration (temporary, high-bandwidth), X-as-a-Service (well-defined API), or Facilitating (helping improve). Minimize collaboration interactions to reduce coordination overhead.
6. **Map to Organizational Structure.** Align proposed team topology with existing organizational structure. Flag where organizational changes are needed and document change management implications.
7. **Produce Topology Package.** Deliver team structure diagram, interaction map, cognitive load assessment, and implementation roadmap for team formation.

### Output Format

- **Team Topology Diagram** — Visual map of teams, their types, and interaction modes.
- **Team Composition Table** — Per team: type, members/roles, owned deliverables, cognitive load score.
- **Interaction Matrix** — Team × Team grid with interaction mode and expected evolution over project phases.

