# Example: Valid Hook Configuration

## Input

```json
{
  "hooks": {
    "SessionStart": [
      {
        "type": "command",
        "command": "echo 'Session started'"
      }
    ],
    "PreToolUse": [
      {
        "type": "prompt",
        "matcher": "Bash",
        "prompt": "Review this tool call for safety."
      }
    ]
  }
}
```

## Expected Output

```
Hooks validation PASSED

| Severity | Event | Hook Type | Finding |
|----------|-------|-----------|---------|
| OK | SessionStart | command | command is compatible with all events |
| OK | PreToolUse | prompt | prompt has ToolUseContext on PreToolUse |

Summary: 2 hooks | 0 CRITICAL | 0 WARNING | 0 INFO
```
