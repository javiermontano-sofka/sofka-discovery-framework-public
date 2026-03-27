# Prompt: Hook Compatibility Validation

```
Validate hooks.json at {PLUGIN_PATH}/hooks/hooks.json.

The hooks key must be an object keyed by event name (NOT an array).

For each hook entry, check type-event compatibility using these 4 types:
- type:command — compatible with ALL 22 events
- type:http — compatible with ALL 22 events
- type:prompt — ONLY compatible with PreToolUse, PostToolUse, PermissionRequest (requires ToolUseContext)
- type:agent — ONLY compatible with PreToolUse, PostToolUse, PermissionRequest (requires ToolUseContext)

Any other type value (e.g., "intercept") is CRITICAL — it does not exist.

Incompatible combinations (prompt/agent on non-ToolUseContext events) cause runtime errors.

Also check:
- Valid JSON structure (no comments, no trailing commas)
- Root object has a "hooks" key containing an object (not array)
- Each hook entry has a "type" field with a valid value
- No empty event handler arrays (WARNING: dead config)

Report: | Severity | Event | Hook Type | Finding |
```
