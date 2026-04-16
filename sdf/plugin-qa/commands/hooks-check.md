---
description: "Hook-specific validation. Checks hook type-event compatibility for ToolUseContext issues."
user-invocable: true
---

# /pqa:hooks-check

Hook-specific validation. Runs only the `validate-hooks` skill. Useful for quick hook debugging, especially after the ToolUseContext bug.

## Usage

```
/pqa:hooks-check [TARGET_DIR]
```

- `TARGET_DIR` — Path to the plugin root directory. Defaults to `$PWD`.

## Execution Flow

1. Run `validate-hooks` skill against TARGET_DIR.
2. Check each hook file for type-event compatibility.
3. Report results with the compatibility matrix.

## Hook Type-Event Compatibility Matrix

| Hook Type      | PreToolUse | PostToolUse | Stop | PreCompact | PostCompact | Notification |
|----------------|:----------:|:-----------:|:----:|:----------:|:-----------:|:------------:|
| `type:command` | OK         | OK          | OK   | OK         | OK          | OK           |
| `type:prompt`  | OK         | OK          | --   | --         | --          | --           |
| `type:agent`   | OK         | OK          | --   | --         | --          | --           |

- `type:prompt` and `type:agent` hooks require `ToolUseContext` which is only available in `PreToolUse` and `PostToolUse` events.
- Using these hook types with other events will cause runtime errors.

## Output

- Per-hook compatibility check results (pass/fail)
- Flagged incompatible type-event combinations as CRITICAL findings
- Summary table

## Notes

- This is the fastest way to check hook compatibility after changes.
- CRITICAL findings here mean the plugin will fail at runtime.
