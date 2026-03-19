---
name: apex-client-browser-audit
description: >
  Use when the user asks to "audit PM tools visually", "inspect Jira configuration",
  "review Azure DevOps setup", "check Monday.com boards", or "evaluate tool configuration".
  Activates when a stakeholder needs to perform a visual audit of PM tool configurations,
  capture screenshot evidence of misconfigurations, compare tool setup against methodology
  best practices, identify workflow anti-patterns in PM tools, or produce a remediation
  roadmap for tool optimization.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Client Browser Audit (MCP Playwright)

**TL;DR**: Uses MCP Playwright to perform visual audits of client PM tools (Jira, Azure DevOps, Monday.com, Asana, ClickUp). Captures screenshots, evaluates configuration against best practices, identifies misconfigurations, and produces an actionable remediation report with annotated evidence.

## Principio Rector
Las herramientas de PM no fallan porque sean malas — fallan porque se configuran mal. Un tablero Jira con 47 columnas no es un board Kanban; es un laberinto. La auditoría visual revela problemas que ningún export de datos puede mostrar: flujos rotos, estados huérfanos, permisos mal asignados y ceremonias sin soporte tooling.

## Assumptions & Limits
- Assumes read-only access to the PM tool is available for the audit session [SUPUESTO]
- Assumes MCP Playwright is configured and accessible in the environment [PLAN]
- Breaks when tool requires VPN or SSO that cannot be automated through Playwright
- Does not modify tool configurations — produces recommendations only
- Screenshot evidence is point-in-time; tool state may change between audit and remediation
- Audit criteria are methodology-specific; wrong methodology context produces wrong findings [SUPUESTO]

## Usage

```bash
# Audit Jira board configuration
/pm:client-browser-audit $PROJECT --tool="jira" --url="https://org.atlassian.net"

# Audit Azure DevOps project setup
/pm:client-browser-audit $PROJECT --tool="ado" --scope="boards,pipelines"

# Generate remediation report from audit findings
/pm:client-browser-audit $PROJECT --type=remediation --severity="critical,high"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--tool` | Yes | `jira`, `ado`, `monday`, `asana`, `clickup` |
| `--url` | Yes | Tool URL for browser access |
| `--scope` | No | Areas to audit (boards, workflows, dashboards, permissions) |
| `--type` | No | `audit`, `remediation`, `best-practice-comparison` |
| `--severity` | No | Filter findings by severity |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Audit Scrum/Kanban boards, sprint configuration, backlog hygiene, velocity tracking
- **Waterfall**: Audit Gantt charts, milestone tracking, dependency visualization, baseline configuration
- **SAFe**: Audit PI planning boards, ART configuration, program Kanban, portfolio views
- **Kanban**: Audit WIP limits, flow metrics, board columns, swimlane configuration
- **Hybrid**: Audit mixed board configurations, phase-gate integration with iterative boards
- **PMO**: Audit portfolio dashboards, cross-project views, resource allocation tools
- **Portfolio**: Audit portfolio prioritization views, strategic alignment dashboards

## Before Auditing

1. **Read** the project methodology context to select appropriate best-practice evaluation criteria
2. **Read** known pain points reported by the team to focus audit on high-impact areas
3. **Glob** `skills/client-browser-audit/references/*.md` for tool-specific best practice checklists
4. **Grep** for existing tool configuration documentation or previous audit findings

## Entrada (Input Requirements)
- Tool URL and access credentials (read-only preferred)
- Tool type (Jira, Azure DevOps, Monday.com, Asana, ClickUp)
- Specific areas to audit (boards, workflows, dashboards, permissions)
- Project methodology context for evaluation criteria
- Known pain points reported by users

## Proceso (Protocol)
1. **Tool identification** — Confirm tool type, version, and access method
2. **Audit scope definition** — Define boards, projects, and configurations to inspect
3. **Browser session setup** — Initialize MCP Playwright session with appropriate viewport
4. **Navigation and capture** — Systematically navigate tool sections and capture screenshots
5. **Configuration extraction** — Document workflow states, field configurations, permissions
6. **Best practice comparison** — Compare configuration against methodology-specific best practices
7. **Issue identification** — Flag misconfigurations, anti-patterns, and inefficiencies
8. **Severity classification** — Rate issues as Critical, High, Medium, Low
9. **Remediation design** — Create step-by-step remediation instructions per issue
10. **Report compilation** — Assemble audit report with annotated screenshots and recommendations

## Edge Cases

1. **Tool access denied mid-audit**: Document findings captured so far. Escalate access issue to tool administrator. Produce partial report with "access-blocked" sections clearly marked. [STAKEHOLDER]
2. **Tool has >50 boards/projects**: Sample audit approach — audit representative sample (3-5 boards) per project type. Extrapolate findings with [INFERENCIA] tags. [METRIC]
3. **Critical security misconfiguration found**: Stop audit. Immediately notify project sponsor and IT security. Document finding separately with Critical severity. Do not continue until acknowledged. [PLAN]
4. **Tool so misconfigured that remediation exceeds migration cost**: Document total remediation effort. Present cost comparison: remediation vs. migration to clean instance. Let stakeholder decide. [STAKEHOLDER]

## Example: Good vs Bad

**Good Browser Audit:**

| Attribute | Value |
|-----------|-------|
| Screenshots captured | 25+ with annotations |
| Issues identified | 18 across 4 severity levels |
| Best practice comparison | Per-section scorecard |
| Remediation steps | Step-by-step per issue |
| Tool optimization roadmap | 3 phases prioritized by severity |
| Evidence | Every finding backed by screenshot |

**Bad Browser Audit:**
A report saying "Jira needs cleanup" without screenshots, specific issues, severity ratings, or remediation steps. Fails because it provides no actionable information — tool administrators cannot fix problems that are not specifically identified and documented.

## Validation Gate
- [ ] Every finding backed by ≥1 screenshot or configuration capture
- [ ] Issues classified by severity (Critical, High, Medium, Low) with consistent criteria
- [ ] ≥80% of findings include step-by-step remediation instructions
- [ ] Best practice alignment scorecard produced per audited section
- [ ] No finding without linkage to specific methodology best practice violated
- [ ] Critical and High issues have remediation priority and estimated effort
- [ ] Tool optimization roadmap phases ordered by severity and dependency
- [ ] Report actionable by both PM leads and tool administrators [STAKEHOLDER]
- [ ] Audit criteria match declared project methodology [PLAN]
- [ ] Impact of misconfigurations on project delivery quantified where possible [METRIC]

## Escalation Triggers
- Tool access denied or insufficient permissions
- Critical security misconfiguration discovered (exposed data, wrong permissions)
- Tool fundamentally unsuitable for declared methodology
- Configuration so degraded that remediation exceeds cost of migration

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before auditing to understand tool best practices | `references/body-of-knowledge.md` |
| State of the Art | When evaluating latest PM tool features | `references/state-of-the-art.md` |
| Knowledge Graph | To link audit findings to methodology skills | `references/knowledge-graph.mmd` |
| Use Case Prompts | When scoping audit with stakeholders | `prompts/use-case-prompts.md` |
| Metaprompts | To generate tool-specific audit checklists | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected audit report format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
