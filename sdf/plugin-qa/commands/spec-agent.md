---
description: "Generate production-ready agent and command specifications from an agent design."
user-invocable: true
argument-hint: "<agent-design-path>"
---

# Spec Agent

## Usage

```
/pqa:spec-agent <agent-design-path>
```

## Execution Flow

1. Read the agent design file at `<agent-design-path>`.
2. Invoke `spec-agent-command` via the `plugin-spec-writer` agent.
3. Generate agent .md file content with frontmatter, role, skills table, execution flows, and operating principles.
4. Generate command .md file contents (canonical + aliases) for all commands defined in the design.
5. Validate cross-references and naming conventions.

## Output

A spec package containing:
- Agent .md file content ready for disk write.
- Command .md file contents (canonical + alias pairs) ready for disk write.
- Cross-reference validation results.
- Naming convention compliance report.
