# Example: Components with Issues

## Agent with Forbidden Field

```yaml
---
name: my-agent
description: "Does things."
hooks:
  - PreToolUse
permissionMode: full
---
```

## Alias Command Missing alias-of

```yaml
---
description: "Shortcut."
user-invocable: true
---
# File: commands/r.md (single-line body referencing "run")
```

## Expected Output

```
| Severity | File | Finding |
|----------|------|---------|
| CRITICAL | agents/my-agent.md | Forbidden field: hooks (subagent constraint) |
| CRITICAL | agents/my-agent.md | Forbidden field: permissionMode (subagent constraint) |
| WARNING | commands/r.md | Alias command missing alias-of field |

Summary: 2 CRITICAL | 1 WARNING | 0 INFO
```
