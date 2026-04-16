---
description: "Design a plugin agent in detail. Runs design-agent skill directly. Enforces plugin subagent constraints."
user-invocable: true
---

# /pqa:design-agent

Design a plugin agent in full detail. Runs the `design-agent` skill directly, skipping the routing logic of `/pqa:design`.

## Usage

```
/pqa:design-agent <agent-name> [plugin-path]
```

- `agent-name` -- kebab-case name for the agent to design.
- `plugin-path` -- Optional path to an existing plugin for context.

## Examples

```
/pqa:design-agent devops-engineer ./plugins/devops-toolkit
/pqa:design-agent plugin-qa-engineer ./plugins/plugin-qa
```

## Output

- Complete agent .md specification with frontmatter, role, skills, execution flows, operating principles.
- Validates against plugin subagent constraints (no hooks/mcpServers/permissionMode).
- File is written only after user confirmation.

## Key Constraint

Plugin subagent frontmatter CANNOT include `hooks`, `mcpServers`, or `permissionMode`. This command validates compliance automatically.
