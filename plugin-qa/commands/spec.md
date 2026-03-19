---
description: "Generate production-ready specifications from designs. Runs spec-skill-moat for skill designs, spec-agent-command for agent designs."
user-invocable: true
argument-hint: "<design-path> [--type skill|agent]"
---

# Spec

## Usage

```
/pqa:spec <design-path>
/pqa:spec <design-path> --type skill
/pqa:spec <design-path> --type agent
```

## Execution Flow

1. Read the design file at `<design-path>`.
2. Detect design type:
   - If `--type` is specified, use that.
   - If the design contains skill procedure steps or MOAT references, route to `spec-skill-moat`.
   - If the design contains agent roles, skills tables, or command definitions, route to `spec-agent-command`.
   - If ambiguous, ask the user.
3. Invoke the appropriate skill via the `plugin-spec-writer` agent.
4. Output the complete spec package (file contents + summary table).

## Output

A spec package containing:
- For skills: SKILL.md content + MOAT asset file contents (references/, examples/, prompts/) + MOAT dimension scores.
- For agents: Agent .md content + command .md contents (canonical + aliases) + cross-reference validation results.
