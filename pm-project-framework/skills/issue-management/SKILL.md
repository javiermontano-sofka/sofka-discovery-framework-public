---
name: apex-issue-management
description: >
  Use when the user asks to "track issues", "manage project issues", "resolve blockers",
  "create issue log", "remove impediments", or mentions issue tracking, issue resolution,
  blocker management, impediment removal, issue escalation. Triggers on: creates issue
  tracking workflow, assigns issue resolution owners, enforces resolution SLAs, captures
  root cause analysis, produces issue trend analysis.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Issue Management & Resolution

**TL;DR**: Implements issue tracking and resolution workflow for project issues (risks that have materialized, blockers, impediments, and problems). Establishes classification, priority assignment, resolution workflow, escalation paths, and closure criteria. Issues are risks that happened — they demand immediate action, not analysis.

## Principio Rector
Un issue no es un riesgo — es una realidad que requiere acción inmediata. La velocidad de resolución determina el impacto: un issue resuelto en 24 horas es un inconveniente; el mismo issue sin resolver en 2 semanas es un factor de fracaso. El sistema de issue management prioriza resolución sobre documentación.

## Assumptions & Limits
- Assumes governance framework with escalation paths exists or will be created concurrently [SUPUESTO]
- Assumes team has authority to resolve operational issues without governance approval [SUPUESTO]
- Breaks if escalation matrix is undefined — issues without escalation paths accumulate indefinitely [PLAN]
- Scope limited to project-level issues; organizational or enterprise issues require PMO escalation [PLAN]
- Does not replace risk management — issues are materialized risks; prevention stays in risk register [PLAN]

## Usage
```bash
/pm:issue-management $PROJECT_NAME --setup
/pm:issue-management $PROJECT_NAME --log-issue --severity=critical --category=resource
/pm:issue-management $PROJECT_NAME --report --period=sprint
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--setup` | No | Initialize issue tracking system |
| `--log-issue` | No | Log a new issue |
| `--severity` | No | `critical` / `high` / `medium` / `low` |
| `--category` | No | `technical` / `resource` / `scope` / `external` / `process` |
| `--report` | No | Generate issue status report |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile tracks impediments in daily standups; Waterfall uses formal issue logs; SAFe uses program-level impediment boards; All types need escalation paths.

## Before Managing Issues
1. Read `governance-framework` — confirm escalation paths and authority levels exist [PLAN]
2. Glob `*risk-register*` — identify risks that may have materialized as issues [PLAN]
3. Read team communication channels — confirm issue reporting mechanisms are established [STAKEHOLDER]
4. Review resolution SLAs — confirm time-based targets are defined per severity [SCHEDULE]

## Entrada (Input Requirements)
- Project governance framework
- Escalation matrix and authority levels
- Risk register (for risk-converted issues)
- Team communication channels

## Proceso (Protocol)
1. **Issue intake** — Capture issue with standardized template (what, when, who, impact)
2. **Classification** — Categorize: Technical, Resource, Scope, External, Process
3. **Priority assignment** — Rate urgency x impact: Critical (24h), High (48h), Medium (1 week), Low (2 weeks)
4. **Owner assignment** — Designate resolver with authority to act
5. **Resolution planning** — Define actions, timeline, and resources needed
6. **Escalation routing** — If owner cannot resolve, escalate per governance framework
7. **Progress tracking** — Monitor resolution progress against SLA
8. **Resolution verification** — Confirm issue is resolved and root cause addressed
9. **Lessons capture** — Document root cause and prevention measures
10. **Register update** — Close issue in log with resolution summary

## Edge Cases
1. **Same issue recurring after declared resolution** — Reopen with root-cause-not-addressed flag; escalate to structural fix rather than symptomatic resolution.
2. **Critical issue with no available resolver** — Escalate immediately to governance; propose temporary workaround with documented risk acceptance.
3. **Issue requires budget or scope change** — Route through change control; issue remains open with "pending change approval" status.
4. **Issue backlog growing faster than resolution rate** — Trigger systemic review; likely indicates understaffing, process failure, or scope problem rather than individual issue management.
5. **External issue outside project control** — Document dependency on external resolution; define internal workaround if possible; set monitoring frequency.

## Example: Good vs Bad

**Good Issue Management:**
| Attribute | Value |
|-----------|-------|
| Issue template | Standardized: what, when, who, impact, category, severity [PLAN] |
| SLA compliance | 92% of issues resolved within SLA targets [METRIC] |
| Escalation path | 3-tier escalation with time triggers (24h, 48h, 1 week) [SCHEDULE] |
| Root cause analysis | Completed for all Critical and High issues [PLAN] |
| Trend analysis | Monthly report showing issue patterns by category [METRIC] |

**Bad Issue Management:**
"We have a list of issues somewhere." — No classification, no SLAs, no assigned owners, no escalation paths. Issues languish indefinitely; critical blockers treated same as minor inconveniences.

## Salida (Deliverables)
- Issue tracking log with status
- Resolution SLA compliance report
- Escalation history
- Root cause analysis summaries
- Issue trend analysis

## Validation Gate
- [ ] Every issue has assigned owner with authority and deadline
- [ ] Classification applied consistently — same severity criteria across all issues
- [ ] Resolution SLAs defined for every severity level and enforced
- [ ] Critical issues have resolution path within 24 hours
- [ ] Root cause analysis completed for every Critical and High issue
- [ ] Issue descriptions enable action without requiring clarification meetings
- [ ] Issues linked to originating risks or root causes where applicable
- [ ] Issue patterns analyzed monthly — systemic patterns escalated
- [ ] Critical issues visible to sponsors within 4 hours of identification
- [ ] Issue workflow integrated with project methodology (standup, phase gate, etc.)

## Escalation Triggers
- Critical issue unresolved past 24-hour SLA
- Issue backlog growing faster than resolution rate
- Same issue recurring after declared resolution
- Issue requires budget or scope change to resolve

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
