# Official Hook Specification Digest

> Source: Claude Code official documentation
> Scope: Hook events, types, compatibility matrix, matchers, exit codes, scopes, safety

---

## 1. Hook Events (22 Total)

| Event | Description | Matcher Target |
|-------|-------------|----------------|
| `SessionStart` | Session begins or resumes | `"startup"`, `"resume"`, `"clear"`, `"compact"` |
| `UserPromptSubmit` | User sends a message (before processing) | — |
| `PreToolUse` | Before a tool executes | Tool name (e.g. `"Bash"`, `"Write"`, `"Edit"`) |
| `PermissionRequest` | Permission prompt shown to user | Tool name |
| `PostToolUse` | After a tool executes successfully | Tool name |
| `PostToolUseFailure` | After a tool execution fails | Tool name |
| `Notification` | System notification fired | — |
| `SubagentStart` | Subagent begins execution | — |
| `SubagentStop` | Subagent completes execution | — |
| `Stop` | Claude decides to stop responding | — |
| `StopFailure` | Stop hook itself fails | — |
| `TeammateIdle` | A background teammate goes idle | — |
| `TaskCompleted` | A scheduled task finishes | — |
| `InstructionsLoaded` | CLAUDE.md or instructions loaded | — |
| `ConfigChange` | Settings/config changes | — |
| `WorktreeCreate` | Git worktree created | — |
| `WorktreeRemove` | Git worktree removed | — |
| `PreCompact` | Before context compaction | — |
| `PostCompact` | After context compaction | — |
| `Elicitation` | Before an elicitation prompt | — |
| `ElicitationResult` | After user responds to elicitation | — |
| `SessionEnd` | Session terminates | — |

---

## 2. Hook Types (4 Total)

| Type | Mechanism | Timeout | Notes |
|------|-----------|---------|-------|
| `command` | Shell command execution | 10 min (default) | Works on ALL events. Simplest type. |
| `http` | POST JSON to URL | 10 min (default) | Works on ALL events. External service integration. |
| `prompt` | Single-turn LLM call | 10 min (default) | Requires ToolUseContext. Limited events. |
| `agent` | Multi-turn LLM with tools | 60 sec | Requires ToolUseContext. Limited events. |

---

## 3. Type-Event Compatibility Matrix

**This is the critical constraint table.** Using an incompatible type+event combination will fail silently or error.

| Event | command | http | prompt | agent |
|-------|---------|------|--------|-------|
| SessionStart | SAFE | SAFE | UNSAFE | UNSAFE |
| UserPromptSubmit | SAFE | SAFE | UNSAFE | UNSAFE |
| **PreToolUse** | SAFE | SAFE | **SAFE** | **SAFE** |
| **PermissionRequest** | SAFE | SAFE | **SAFE** | **SAFE** |
| **PostToolUse** | SAFE | SAFE | **SAFE** | **SAFE** |
| PostToolUseFailure | SAFE | SAFE | UNSAFE | UNSAFE |
| Notification | SAFE | SAFE | UNSAFE | UNSAFE |
| SubagentStart | SAFE | SAFE | UNSAFE | UNSAFE |
| SubagentStop | SAFE | SAFE | UNSAFE | UNSAFE |
| Stop | SAFE | SAFE | UNSAFE | UNSAFE |
| StopFailure | SAFE | SAFE | UNSAFE | UNSAFE |
| TeammateIdle | SAFE | SAFE | UNSAFE | UNSAFE |
| TaskCompleted | SAFE | SAFE | UNSAFE | UNSAFE |
| InstructionsLoaded | SAFE | SAFE | UNSAFE | UNSAFE |
| ConfigChange | SAFE | SAFE | UNSAFE | UNSAFE |
| WorktreeCreate | SAFE | SAFE | UNSAFE | UNSAFE |
| WorktreeRemove | SAFE | SAFE | UNSAFE | UNSAFE |
| PreCompact | SAFE | SAFE | UNSAFE | UNSAFE |
| PostCompact | SAFE | SAFE | UNSAFE | UNSAFE |
| Elicitation | SAFE | SAFE | UNSAFE | UNSAFE |
| ElicitationResult | SAFE | SAFE | UNSAFE | UNSAFE |
| SessionEnd | SAFE | SAFE | UNSAFE | UNSAFE |

**Rule**: `prompt` and `agent` types require **ToolUseContext** and are ONLY safe on `PreToolUse`, `PostToolUse`, and `PermissionRequest`.

---

## 4. Matchers

Matchers filter which specific instances of an event trigger the hook.

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "type": "command",
        "command": "echo 'Bash is about to run'"
      }
    ]
  }
}
```

| Event | Matcher matches against |
|-------|------------------------|
| `PreToolUse` | Tool name (`"Bash"`, `"Write"`, `"Edit"`, etc.) |
| `PostToolUse` | Tool name |
| `PermissionRequest` | Tool name |
| `PostToolUseFailure` | Tool name |
| `SessionStart` | `"startup"`, `"resume"`, `"clear"`, `"compact"` |

Omitting `matcher` means the hook fires for ALL instances of that event.

---

## 5. Exit Codes (command type)

| Exit Code | Behavior |
|-----------|----------|
| `0` | **Proceed**. stdout is added to context (for `UserPromptSubmit` and `SessionStart`). |
| `2` | **Block**. stderr content is shown to Claude as the reason for blocking. |
| Other (1, 3, etc.) | **Proceed** with warning. stderr is logged but does not block. |

---

## 6. JSON Output Decisions

For `command` and `http` hooks, structured JSON output enables fine-grained control:

### PreToolUse / PermissionRequest

```json
{
  "permissionDecision": "allow"
}
```

Values: `"allow"`, `"deny"`, `"ask"` (show normal permission prompt)

### PostToolUse

```json
{
  "decision": "block",
  "reason": "Output contained sensitive data"
}
```

### Stop

```json
{
  "decision": "block",
  "reason": "Task is not yet complete"
}
```

---

## 7. Hook Scopes

Hooks can be defined at multiple levels:

| Scope | Location | Applies to |
|-------|----------|------------|
| **Global settings** | `settings.json` → `hooks` | All sessions |
| **Plugin** | `hooks.json` in plugin root | All skills/agents in that plugin |
| **Skill frontmatter** | `hooks:` in SKILL.md | That skill only |
| **Agent frontmatter** | `hooks:` in agent .md | That agent only |

More specific scopes add to (do not replace) broader scopes. All matching hooks fire.

---

## 8. Hook Configuration Schema

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Write",
        "type": "command",
        "command": "python3 ${CLAUDE_PLUGIN_ROOT}/scripts/validate.py",
        "timeout": 30000
      }
    ],
    "PostToolUse": [
      {
        "type": "http",
        "url": "https://my-service.com/webhook",
        "timeout": 5000
      }
    ]
  }
}
```

### Fields per hook entry

| Field | Required | Type | Notes |
|-------|----------|------|-------|
| `type` | YES | string | `"command"`, `"http"`, `"prompt"`, `"agent"` |
| `command` | for command | string | Shell command to execute |
| `url` | for http | string | POST endpoint URL |
| `matcher` | no | string | Filter for specific event instances |
| `timeout` | no | integer (ms) | Default: 600000 (10 min). Agent type: 60000 (60 sec). |

---

## 9. Safety Rules

- **Default timeout**: 10 minutes (600,000 ms) for command/http/prompt types
- **Agent timeout**: 60 seconds — agents are expensive and must be fast
- **PostToolUse cannot undo**: The tool has already executed; hooks can only observe or add context
- **Stop hooks must check `stop_hook_active`**: Prevents infinite recursion where a Stop hook triggers another Stop
- **Hooks run synchronously**: They block the pipeline until complete (or timeout)
- **Plugin hooks cannot define `permissionMode`**: Security restriction on plugin-scoped hooks

---

## 10. Common Patterns

### Linting on file write
```json
{
  "PostToolUse": [{
    "matcher": "Write",
    "type": "command",
    "command": "eslint ${toolInput.file_path} --fix"
  }]
}
```

### Blocking dangerous bash commands
```json
{
  "PreToolUse": [{
    "matcher": "Bash",
    "type": "command",
    "command": "echo '${toolInput.command}' | grep -qE 'rm -rf|DROP TABLE' && exit 2 || exit 0"
  }]
}
```

### Session telemetry
```json
{
  "SessionStart": [{
    "type": "http",
    "url": "https://telemetry.internal/session-start"
  }]
}
```
