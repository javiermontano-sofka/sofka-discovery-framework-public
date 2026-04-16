---
name: validate-hooks
description: "THE CRITICAL SKILL -- validates hooks.json structure, event names, and type-event compatibility. Detects prompt/agent hooks on events lacking ToolUseContext. Triggers: validate hooks, check hooks.json, hooks audit, hook safety check."
author: JM Labs (Javier Montaño)
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
---

# Validate Hooks

> "A prompt hook on SessionStart is a silent bomb -- it fires without context and the plugin fails with no error message."

This is the most critical validation skill in the PQA framework. An incorrectly configured hooks.json can cause silent failures, runtime errors, or security vulnerabilities. The type-event compatibility matrix below is the single most important reference in this plugin.

> Canonical source of truth: plugin-level `references/official-hook-spec.md` and skill-local `references/hook-compatibility-matrix.md`

---

## Type-Event Compatibility Matrix

### 4 Hook Types

| Type | Works on | Mechanism |
|------|----------|-----------|
| `command` | ALL 22 events | Shell command execution |
| `http` | ALL 22 events | POST JSON to URL |
| `prompt` | PreToolUse, PostToolUse, PermissionRequest ONLY | Single-turn LLM call (requires ToolUseContext) |
| `agent` | PreToolUse, PostToolUse, PermissionRequest ONLY | Multi-turn LLM with tools (requires ToolUseContext) |

### 22 Events — ToolUseContext Classification

**ToolUseContext events (3)** — `prompt`/`agent` SAFE:

`PreToolUse`, `PermissionRequest`, `PostToolUse`

**Non-ToolUseContext events (19)** — `prompt`/`agent` UNSAFE (CRITICAL if used):

`SessionStart`, `UserPromptSubmit`, `PostToolUseFailure`, `Notification`, `SubagentStart`, `SubagentStop`, `Stop`, `StopFailure`, `TeammateIdle`, `TaskCompleted`, `InstructionsLoaded`, `ConfigChange`, `WorktreeCreate`, `WorktreeRemove`, `PreCompact`, `PostCompact`, `Elicitation`, `ElicitationResult`, `SessionEnd`

---

## Procedure

### Step 0 -- Verify Plugin Root

- Verify the provided path exists and is a directory.
- If not, report `CRITICAL: Plugin root not found at <path>` and STOP.

### Step 1 -- Locate and Parse hooks.json

- Look for `hooks/hooks.json` in the plugin root.
- If `hooks/` directory exists but `hooks.json` is missing, report `WARNING: hooks/ directory exists but hooks.json is absent -- hooks will not function.`
- If neither `hooks/` nor `hooks.json` exists, report `INFO: No hooks configuration -- plugin uses no hooks` and STOP (valid state).
- Check for common JSON errors before parsing: `//` comments, `/* */` block comments, trailing commas, single quotes. If found, report `CRITICAL: hooks.json contains invalid JSON syntax` with specific guidance (e.g., "JSON does not support comments -- remove line N").
- Parse as strict JSON. Report `CRITICAL` for any remaining parse error with line number.

### Step 2 -- Validate Top-Level Structure

- The root object MUST have a `"hooks"` key containing an **object** keyed by event name (NOT an array, NOT a string).
- Report `CRITICAL` if `"hooks"` key is missing or is not an object.
- If `"hooks"` is an empty object `{}`, report `INFO: Empty hooks configuration` and STOP (valid state).
- Report `WARNING` for any top-level keys besides `"hooks"` (unknown configuration).

### Step 3 -- Validate Event Names

- Each key inside `"hooks"` must be one of the 22 recognized events (case-sensitive):
  `SessionStart`, `UserPromptSubmit`, `PreToolUse`, `PermissionRequest`, `PostToolUse`, `PostToolUseFailure`, `Notification`, `SubagentStart`, `SubagentStop`, `Stop`, `StopFailure`, `TeammateIdle`, `TaskCompleted`, `InstructionsLoaded`, `ConfigChange`, `WorktreeCreate`, `WorktreeRemove`, `PreCompact`, `PostCompact`, `Elicitation`, `ElicitationResult`, `SessionEnd`.
- Report `WARNING` for any unrecognized event name.
- Check for common misspellings: `sessionStart` (wrong case), `PreTool` (truncated), `PostToolFailure` (missing "Use"), `SubagentToolUse` (not a real event). Suggest the correct name.

### Step 4 -- Validate Hook Entries

- Each event value must be an array of hook entry objects.
- Each array element must be an object with at minimum a `"type"` field.
- Valid type values: `"command"`, `"http"`, `"prompt"`, `"agent"`.
- Report `CRITICAL` for missing `type` field or unrecognized type value (e.g., `"intercept"` is NOT a valid type).
- For type `"command"`: must have a `"command"` string field.
- For type `"http"`: must have a `"url"` string field.
- For type `"prompt"`: must have a `"prompt"` string field.
- For type `"agent"`: must have an `"agent"` string field.
- Report `WARNING` for empty event arrays `[]` (dead configuration).

### Step 5 -- THE CRITICAL CHECK: Type-Event Compatibility

- For every hook entry, cross-reference its `type` against the event it is registered on.
- **SAFE**: `command` or `http` type on ANY event. `prompt` or `agent` on `PreToolUse`, `PostToolUse`, or `PermissionRequest`.
- **CRITICAL**: `prompt` or `agent` type on ANY of the 19 non-ToolUseContext events. This WILL cause a runtime error.
- For each CRITICAL finding, explain: "Hook type '<type>' on event '<event>' will fail because <event> does not provide ToolUseContext. Change type to 'command' or move to a ToolUseContext event (PreToolUse, PostToolUse, PermissionRequest)."

### Step 6 -- Validate Script References

- For `command` type hooks, extract the command string.
- If it references a script file (e.g., `./scripts/my-hook.sh`), verify the file exists.
- Verify the script is executable (`chmod +x`).
- Report `CRITICAL` for missing script files. Report `WARNING` for non-executable scripts.

### Step 7 -- Validate Matchers

- If a hook entry has a `"matcher"` field, validate that the value is a string.
- Matchers match against tool names (for PreToolUse/PostToolUse/PermissionRequest/PostToolUseFailure) or session start types (for SessionStart: `"startup"`, `"resume"`, `"clear"`, `"compact"`).
- Report `INFO: Broad matcher` if matcher is omitted (fires for all instances of the event).
- Report `WARNING` if matcher value looks like a regex pattern but the context expects a plain string.

### Step 8 -- Generate Hooks Report

- Produce findings table: `| Severity | Event | Hook Type | Finding |`.
- Include a hooks safety summary: total hooks, safe count, warning count, critical count.
- Prominently display any CRITICAL type-event incompatibilities at the top of the report.
- If no CRITICAL findings: "Hooks validation PASSED".

---

## Quality Criteria

- [ ] The compatibility matrix is the single source of truth -- every type-event combination is checked against all 22 events and 4 types.
- [ ] CRITICAL findings for type-event incompatibility include the explanation of WHY it fails (missing ToolUseContext).
- [ ] Misspelled event names include a "Did you mean?" suggestion.
- [ ] Script existence checks use the plugin root as base path, not CWD.
- [ ] The report includes a hooks safety summary with total hooks, safe count, warning count, and critical count.

## Assumptions & Limits

- Read-only. This skill never modifies hooks.json or any other file.
- Assumes hooks.json is valid JSON after Step 1 parsing succeeds. Steps 2-8 operate on the parsed object, not raw text.
- Cannot validate runtime behavior -- a hook command may be syntactically correct but fail at execution time (e.g., referencing a missing binary).
- Does not evaluate matcher regex semantics -- only checks that the value is a string, not whether the pattern is correct or efficient.
- Scope is limited to hooks.json structure. Hook behavior defined in settings.json or CLAUDE.md is outside this skill's responsibility.

## Good vs Bad

**Bad validation report:**
```
Hook on SessionStart is invalid.
```
Missing: no type mentioned, no explanation of WHY, no remediation suggestion.

**Good validation report:**
```
CRITICAL | SessionStart | prompt | type:prompt requires ToolUseContext --
SessionStart does not provide it. Change type to "command" or move to a
ToolUseContext event (PreToolUse, PostToolUse, PermissionRequest).
```
Includes: severity, event, type, explanation of the failure mechanism, two specific remediation paths.

## Anti-Patterns

1. Treating all hook types as interchangeable across events.
2. Accepting `type:intercept` as valid -- this type does not exist.
3. Not checking that command-type hooks reference actual executable files.
4. Reporting prompt-on-PreToolUse as a problem (it is explicitly SAFE).
5. Confusing `PostToolUse` (ToolUseContext, SAFE for prompt/agent) with `PostToolUseFailure` (no ToolUseContext, UNSAFE).

## Edge Cases

1. hooks.json exists but is an empty object `{}` -- valid, INFO.
2. Hook with both `"command"` and `"prompt"` fields -- CRITICAL (ambiguous type).
3. Event with empty hooks array `[]` -- valid but useless, WARNING (dead config).
4. `hooks/` directory exists but no hooks.json inside -- WARNING (incomplete setup).
5. Command referencing a script outside the plugin tree -- CRITICAL (portability violation).
6. hooks.json contains JSON with `//` comments -- CRITICAL with specific guidance.
7. Event name with wrong case (e.g., `sessionstart`) -- WARNING with suggested correction.
