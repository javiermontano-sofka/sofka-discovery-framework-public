# Hook Type-Event Compatibility Matrix

> Canonical source: plugin-level `references/official-hook-spec.md`

## The Rule

`type:prompt` and `type:agent` hooks require **ToolUseContext**, which the runtime only injects during `PreToolUse`, `PostToolUse`, and `PermissionRequest` events. Using these hook types with other events causes a runtime error because ToolUseContext is undefined. `type:command` and `type:http` work on all 22 events.

## 4 Hook Types

| Type | Mechanism | Works on |
|------|-----------|----------|
| `command` | Shell command execution | ALL 22 events |
| `http` | POST JSON to URL | ALL 22 events |
| `prompt` | Single-turn LLM call | PreToolUse, PostToolUse, PermissionRequest ONLY |
| `agent` | Multi-turn LLM with tools | PreToolUse, PostToolUse, PermissionRequest ONLY |

## 22 Events

### ToolUseContext Events (3) — prompt/agent SAFE

| Event | Description |
|-------|-------------|
| `PreToolUse` | Before a tool executes |
| `PermissionRequest` | Permission prompt shown to user |
| `PostToolUse` | After a tool executes successfully |

### Non-ToolUseContext Events (19) — prompt/agent UNSAFE

| Event | Description |
|-------|-------------|
| `SessionStart` | Session begins or resumes |
| `UserPromptSubmit` | User sends a message |
| `PostToolUseFailure` | After a tool execution fails |
| `Notification` | System notification fired |
| `SubagentStart` | Subagent begins execution |
| `SubagentStop` | Subagent completes execution |
| `Stop` | Claude decides to stop responding |
| `StopFailure` | Stop hook itself fails |
| `TeammateIdle` | Background teammate goes idle |
| `TaskCompleted` | Scheduled task finishes |
| `InstructionsLoaded` | CLAUDE.md or instructions loaded |
| `ConfigChange` | Settings/config changes |
| `WorktreeCreate` | Git worktree created |
| `WorktreeRemove` | Git worktree removed |
| `PreCompact` | Before context compaction |
| `PostCompact` | After context compaction |
| `Elicitation` | Before an elicitation prompt |
| `ElicitationResult` | After user responds to elicitation |
| `SessionEnd` | Session terminates |

## Severity Classification

| Condition | Severity |
|-----------|----------|
| `type:prompt` on non-ToolUseContext event | CRITICAL |
| `type:agent` on non-ToolUseContext event | CRITICAL |
| Empty event handler array | WARNING |
| Hook missing `type` field | CRITICAL |
| Unrecognized event name | WARNING |
| Invalid JSON in hooks.json | CRITICAL |

## Common Mistakes

1. Using `type:prompt` on `SessionStart` — fails because no ToolUseContext at session start
2. Using `type:agent` on `Stop` — fails because no tool context when stopping
3. Confusing `PostToolUse` (SAFE) with `PostToolUseFailure` (UNSAFE) for prompt/agent
4. Using `type:intercept` — this type does not exist; use `type:command` instead

## hooks.json Schema

The `hooks` key contains an **object** keyed by event name, NOT an array:

```json
{
  "hooks": {
    "PreToolUse": [
      { "type": "command", "matcher": "Bash", "command": "echo 'before bash'" }
    ]
  }
}
```
