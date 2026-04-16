# PQA Agent Roster

> 4 specialized agents coordinating the 9-movement lifecycle.

## Agents

| Agent | Role | Movements Owned |
|-------|------|-----------------|
| `plugin-architect` | Concept ideation, architecture planning, component design | 1 - IDEATE, 2 - PLAN, 3 - DESIGN |
| `plugin-spec-writer` | Production-ready specifications and MOAT assets | 4 - SPECIFY |
| `plugin-builder-agent` | Code generation, scaffolding, MOAT directory creation | 5 - BUILD |
| `plugin-qa-engineer` | Validation, security audit, reporting, auto-fix | 6 - VALIDATE, 7 - AUDIT, 8 - REPORT, 9 - FIX |

## Activation Triggers

- **plugin-architect**: Triggered by `/pqa:ideate`, `/pqa:plan`, `/pqa:design`, `/pqa:create`, `/pqa:lifecycle`
- **plugin-spec-writer**: Triggered by `/pqa:spec`, `/pqa:spec-agent`, `/pqa:create`, `/pqa:lifecycle`
- **plugin-builder-agent**: Triggered by `/pqa:build`, `/pqa:build-moat`, `/pqa:create`, `/pqa:lifecycle`
- **plugin-qa-engineer**: Triggered by `/pqa:audit`, `/pqa:validate`, `/pqa:report`, `/pqa:fix`, `/pqa:lifecycle`

## Subagent Constraints

Plugin agents run as subagents of Claude Code. Forbidden fields in agent frontmatter:

- `hooks` -- Subagents cannot define their own hooks
- `mcpServers` -- Subagents cannot declare MCP server connections
- `permissionMode` -- Subagents inherit the host permission model

Including these fields causes a runtime error or silent override.

---
*PQA v3.0 — 4 agents, clear ownership.*
