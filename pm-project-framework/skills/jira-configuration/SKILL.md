---
name: apex-jira-configuration
description: >
  Use when the user asks to "configure Jira", "set up Azure DevOps",
  "design PM tool workflows", "create board configuration", "map tool to methodology",
  or mentions Jira configuration, Azure DevOps setup, PM tool setup, workflow design,
  board configuration. Triggers on: designs PM tool project structure, creates workflow
  state machines, configures board columns and swimlanes, maps methodology ceremonies
  to tool features, produces tool user guides.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Jira / Azure DevOps Configuration

**TL;DR**: Designs PM tool configuration (Jira, Azure DevOps, or equivalent) including project structure, workflow design, field configuration, board setup, automation rules, and reporting dashboards. Ensures the tool supports the selected methodology rather than constraining it.

## Principio Rector
La herramienta debe servir al proceso, no al revés. Configurar Jira antes de diseñar el proceso garantiza que el proceso se adapte a las limitaciones de Jira — no a las necesidades del proyecto. Primero el proceso, luego la herramienta. La configuración correcta hace que el trabajo correcto sea el camino más fácil.

## Assumptions & Limits
- Assumes methodology selection and ceremony design are completed before tool configuration [SUPUESTO]
- Assumes tool licensing and admin access are available or confirmed [SUPUESTO]
- Breaks if methodology is not defined — configuring a tool without a process creates arbitrary workflows [PLAN]
- Scope limited to configuration design; actual tool administration requires platform admin access [PLAN]
- Does not evaluate tool selection — assumes tool is already chosen; use `poc-lab` for tool evaluation [PLAN]

## Usage
```bash
/pm:jira-configuration $PROJECT_NAME --tool=jira --methodology=scrum
/pm:jira-configuration $PROJECT_NAME --tool=azure-devops --methodology=kanban
/pm:jira-configuration $PROJECT_NAME --tool=jira --methodology=safe --include=dashboards
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--tool` | No | `jira` / `azure-devops` / `monday` (default: `jira`) |
| `--methodology` | No | `scrum` / `kanban` / `safe` / `waterfall` / `hybrid` |
| `--include` | No | `workflows` / `dashboards` / `automation` / `all` (default: `all`) |

## Service Type Routing
`{TIPO_PROYECTO}`: Scrum uses Scrum board with sprint management; Kanban uses Kanban board with WIP limits; SAFe uses SAFe template; Waterfall uses project plan with phases; Hybrid uses combined configuration.

## Before Configuring Tools
1. Read `methodology-playbook` — confirm ceremonies and workflows to be supported [PLAN]
2. Glob `*ceremony*` and `*definition-of-done*` — tool must enforce these agreements [PLAN]
3. Read team structure — configure permissions and board views per role [STAKEHOLDER]
4. Check reporting requirements — dashboard design must satisfy governance reporting needs [PLAN]

## Entrada (Input Requirements)
- Selected methodology and ceremony design
- Work item types and workflows
- Team structure and permissions
- Reporting requirements
- Integration needs (CI/CD, Slack, etc.)

## Proceso (Protocol)
1. **Project structure** — Design project hierarchy (project, board, backlog)
2. **Work item types** — Define issue types (epic, feature, story, task, bug)
3. **Workflow design** — Create status workflows per issue type
4. **Field configuration** — Define custom fields per work item type
5. **Board setup** — Configure board columns, swimlanes, and filters
6. **Automation rules** — Design automation for transitions, notifications, SLA tracking
7. **Dashboard design** — Create reporting dashboards with key metrics
8. **Permission scheme** — Configure role-based access controls
9. **Integration setup** — Plan integrations with other tools
10. **User guide** — Create team guide for tool usage

## Edge Cases
1. **Tool limitations prevent methodology implementation** — Document limitation; design workaround configuration; if critical, recommend tool change via `poc-lab` evaluation.
2. **Multiple methodologies on same tool instance** — Create separate project configurations per methodology; use shared fields for cross-methodology reporting.
3. **Team resistance to new tool configuration** — Phase rollout; start with minimal changes; add features incrementally based on team feedback.
4. **Legacy data migration needed** — Design migration mapping; validate field compatibility; plan data cleanup sprint before go-live.

## Example: Good vs Bad

**Good Tool Configuration:**
| Attribute | Value |
|-----------|-------|
| Workflow states | Match methodology ceremonies exactly — no extra states [PLAN] |
| WIP limits | Enforced in board configuration, not just documented [METRIC] |
| Dashboards | 3 views: team daily, PM weekly, steering monthly [STAKEHOLDER] |
| Automation | Sprint closure, SLA alerts, blocked item notifications [PLAN] |
| User guide | Role-specific quick-start with screenshots [PLAN] |

**Bad Tool Configuration:**
Default Jira Scrum template with no customization. Workflows do not match team ceremonies, no WIP limits, no dashboards, no automation. Team uses tool as ticket dump rather than methodology engine.

## Salida (Deliverables)
- Tool configuration specification document
- Workflow diagrams (Mermaid)
- Field configuration matrix
- Dashboard design mockups
- Team user guide

## Validation Gate
- [ ] Workflows match designed methodology processes exactly — no orphan states
- [ ] Every work item type has defined fields, workflow, and board representation
- [ ] Board columns reflect actual workflow stages, not tool defaults
- [ ] WIP limits configured and enforced where methodology requires them
- [ ] Dashboards satisfy reporting requirements for all governance levels
- [ ] Permission scheme implements role-based access without over-restricting
- [ ] Automation rules tested and functional before team rollout
- [ ] Configuration documented in specification — reproducible by admin
- [ ] User guide covers daily team workflows with tool-specific instructions
- [ ] Tool configuration supports, not constrains, the selected methodology

## Escalation Triggers
- Tool limitations preventing methodology implementation
- License constraints limiting functionality
- Integration failures with other tools
- Team resistance to tool adoption

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
