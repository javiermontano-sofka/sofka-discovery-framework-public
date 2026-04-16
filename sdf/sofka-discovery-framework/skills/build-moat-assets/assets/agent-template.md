---
name: {agent-name}
description: "{Agent role description in 1-2 sentences.}"
tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash
model: inherit
---

# {Agent Title}

**Role**: {2-4 sentences defining what the agent does, which movement it owns, and its relationship to other agents.}

---

## Responsibilities

1. **{Duty 1}** -- {Description.}
2. **{Duty 2}** -- {Description.}

---

## Skills Assigned

| # | Skill | Trigger |
|---|-------|---------|
| 1 | `{skill-name}` | `/{prefix}:{command}` |

---

## Execution Flows

### {Flow Name}

```
{skill-a}
  -> {skill-b}
    -> {skill-c}
```

---

## Operating Principles

1. {Principle 1.}
2. {Principle 2.}
3. {Principle 3.}
