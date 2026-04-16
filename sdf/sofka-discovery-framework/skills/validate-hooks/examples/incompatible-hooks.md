# Example: Incompatible Hook Configuration

## Input

```json
{
  "hooks": {
    "SessionStart": [
      {
        "type": "prompt",
        "prompt": "Greet the user."
      }
    ],
    "Stop": [
      {
        "type": "agent",
        "agent": "cleanup-agent"
      }
    ]
  }
}
```

## Expected Output

```
| Severity | Event | Hook Type | Finding |
|----------|-------|-----------|---------|
| CRITICAL | SessionStart | prompt | type:prompt requires ToolUseContext — SessionStart does not provide it. Change type to "command" or move to PreToolUse/PostToolUse/PermissionRequest. |
| CRITICAL | Stop | agent | type:agent requires ToolUseContext — Stop does not provide it. Change type to "command" or move to PreToolUse/PostToolUse/PermissionRequest. |

Summary: 2 hooks | 2 CRITICAL | 0 WARNING | 0 INFO
Hooks validation FAILED.
```
