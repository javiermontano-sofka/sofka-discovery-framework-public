# Example: Incomplete plugin.json

## Input

```json
{
  "name": "my plugin",
  "version": "1.0"
}
```

## Expected Output

```
| Severity | Field | Finding |
|----------|-------|---------|
| CRITICAL | description | Missing required field |
| WARNING | name | Contains space; should be kebab-case |
| WARNING | version | Not valid semver (missing patch: use 1.0.0) |
| WARNING | author | Missing recommended field |
| WARNING | license | Missing recommended field |
| WARNING | keywords | Missing recommended field |
| WARNING | repository | Missing recommended field |
| WARNING | bugs | Missing recommended field |

Summary: 1 CRITICAL | 7 WARNING | 0 INFO
```
