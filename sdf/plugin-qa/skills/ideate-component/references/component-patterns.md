# Component Type Decision Matrix

> Reference for `ideate-component` skill. Use this to determine the correct component type.

---

## When to Use Each Type

| Component | Use When... | Do NOT Use When... |
|-----------|-------------|-------------------|
| **Skill** | There is a multi-step procedure to execute, with quality criteria and edge cases | The task is a one-liner or just routes to another skill |
| **Agent** | Multiple skills need coordinated execution with shared context and decision logic | Only one skill exists in the group (embed logic in the skill itself) |
| **Command** | Users need a memorable entry point (`/prefix:verb`) for a skill or agent | The functionality is internal-only and never user-invoked |
| **Hook** | Automated behavior must trigger on lifecycle events (tool use, stop, compact) | The behavior should only run when explicitly requested by the user |

---

## Decision Flowchart

```
Is this user-invoked?
├── YES: Does it do multi-step work?
│   ├── YES → SKILL (+ COMMAND as entry point)
│   └── NO: Is it just routing to a skill/agent?
│       ├── YES → COMMAND only
│       └── NO → Reconsider: maybe it IS multi-step
└── NO: Does it trigger on lifecycle events?
    ├── YES → HOOK
    └── NO: Does it coordinate multiple skills?
        ├── YES → AGENT
        └── NO → Probably does not need to be a component
```

---

## Component Sizing Guidelines

| Component | Typical Size | Frontmatter Fields |
|-----------|-------------|-------------------|
| Skill SKILL.md | 60-150 lines | name, description, argument-hint, allowed-tools |
| Agent .md | 50-120 lines | name, description, tools, model, maxTurns |
| Command .md | 15-40 lines | description, user-invocable |
| Hook entry | 5-15 lines (in hooks.json) | type, event, command/agent |

---

## Alias vs Canonical Commands

| Type | Purpose | Example |
|------|---------|---------|
| **Canonical** | Full name, self-documenting | `/pqa:validate` |
| **Alias** | Short form for frequent use | `/pqa:v` |

Rules:
- Every canonical command MAY have one single-letter alias.
- Aliases MUST reference the canonical command (not duplicate its content).
- Never create an alias without a canonical command.

---

## Hook Type Compatibility Reminder

| Hook Type | Compatible Events |
|-----------|------------------|
| `type:command` | PreToolUse, PostToolUse, Stop, PreCompact, PostCompact, Notification |
| `type:prompt` | PreToolUse, PostToolUse only |
| `type:agent` | PreToolUse, PostToolUse only |

Using `type:prompt` or `type:agent` with Stop, PreCompact, PostCompact, or Notification causes runtime errors because `ToolUseContext` is undefined for those events.
