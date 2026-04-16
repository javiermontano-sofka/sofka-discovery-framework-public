---
description: "Design a plugin skill or agent in detail. Routes to design-skill or design-agent based on arguments."
user-invocable: true
---

# /pqa:design

Design a plugin component (skill or agent) in full detail. This is the entry point for the DESIGN movement.

## Usage

```
/pqa:design skill <skill-name> [plugin-path]   # Design a skill
/pqa:design agent <agent-name> [plugin-path]    # Design an agent
```

## Routing

- If the first argument is `skill`: run `design-skill`.
- If the first argument is `agent`: run `design-agent`.
- If no type is specified: ask the user whether they want to design a skill or agent.

## Examples

```
/pqa:design skill validate-hooks ./plugins/plugin-qa
/pqa:design agent devops-engineer ./plugins/devops-toolkit
/pqa:design skill lint-dockerfile
```

## Output

- Complete SKILL.md or agent .md specification with:
  - Full frontmatter (all applicable official fields)
  - Guiding principle quote
  - Numbered procedure
  - Quality criteria
  - Anti-patterns
  - Edge cases
- Design metadata (line count, tool selection, quality score)
- File is written only after user confirmation.
