---
name: validate-manifest
description: "Validates plugin.json completeness, field correctness, and consistency with actual plugin contents. Triggers: validate manifest, check plugin.json, manifest audit."
author: JM Labs (Javier Montaño)
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
---

# Validate Manifest

> "The manifest is the contract between the plugin and the runtime. A broken contract breaks trust."

Validates that `plugin.json` is well-formed JSON, contains all required and recommended fields, and that its declared counts and references match the actual plugin contents.

---

## Procedure

### Step 1 -- Parse JSON

- Look for `plugin.json` at plugin root first (official spec location), then fall back to `.claude-plugin/plugin.json` (legacy location). Report `INFO` if found at legacy path.
- Attempt strict JSON parse. If it fails:
  - Check for trailing commas after last array/object element -- report `CRITICAL: Trailing comma at line N`.
  - Check for JavaScript-style comments (`//`, `/* */`) -- report `CRITICAL: Comments not allowed in JSON`.
  - Check for single quotes instead of double quotes -- report `CRITICAL: JSON requires double quotes`.
- If JSON is unparseable after diagnostics, STOP and report. Subsequent steps require valid JSON.

### Step 2 -- Validate Required Fields

- **name**: Must exist, must be a string, must match kebab-case pattern `^[a-z][a-z0-9]*(-[a-z0-9]+)*$`. `CRITICAL` if missing or invalid.

### Step 2b -- Validate Strongly Recommended Fields

Per the official plugin spec, only `name` is strictly required. The following are strongly recommended:

- **version**: Should match semver `^\\d+\\.\\d+\\.\\d+$` (e.g., `1.0.0`). No `v` prefix. `WARNING` if missing or invalid format.
- **description**: Should be a string with length > 20 characters. `WARNING` if missing, `INFO` if too short.

### Step 3 -- Validate Recommended Fields

- **author**: Should exist as a string (e.g., `"Jane"`) or an object with at minimum a `name` string (e.g., `{"name": "Jane"}`). Both formats are valid per the official spec. `WARNING` if missing.
- **license**: Should exist as a string (e.g., `MIT`, `GPL-3.0`, `All Rights Reserved`). `WARNING` if missing.
- **keywords**: Should exist as an array with 3+ string entries. `WARNING` if missing or fewer than 3.
- **repository**: `INFO` if missing (helpful for discoverability but not required).

### Step 4 -- Consistency Checks

- **name vs. directory**: The `name` field should match the plugin's root directory name. `WARNING` if mismatch.
- **Skill count**: If manifest declares a skill count or lists skills, verify against actual `skills/*/SKILL.md` count. `WARNING` on mismatch.
- **Command count**: Same check for commands vs. actual `commands/*.md` files. `WARNING` on mismatch.
- **Agent count**: Same check for agents vs. actual `agents/*.md` files. `WARNING` on mismatch.
- **Version reasonability**: If version is `0.0.0`, report `INFO: Placeholder version detected`.

### Step 5 -- Forbidden Fields

- plugin.json MUST NOT contain: `scripts`, `hooks`, `settings`, `dependencies`, `devDependencies`.
- These belong in other files (hooks.json, settings.json, package.json).
- Report `CRITICAL` for `hooks` or `scripts` keys (indicates confusion with package.json).
- Report `WARNING` for `settings` key (belongs in settings.json).

### Step 6 -- Generate Manifest Report

- Produce findings table: `| Severity | Field | Finding | Current Value |`.
- Include a manifest completeness score: (present required + present recommended) / total expected fields as percentage.
- If all required fields valid and no CRITICAL findings: "Manifest validation PASSED".

---

## Quality Criteria

- [ ] JSON parse errors include the exact line number and character position when possible.
- [ ] Every field check states the expected format alongside the actual value found.
- [ ] Consistency checks compare declared vs. actual counts with specific numbers.
- [ ] The completeness percentage gives an at-a-glance quality indicator.
- [ ] Required vs recommended vs optional field severity levels match the official plugin spec.

## Assumptions & Limits

- Read-only. This skill never modifies plugin.json.
- Per the official spec, only `name` is strictly required. Marking version/description as CRITICAL would over-enforce beyond the spec.
- Cannot validate that author URLs or repository URLs are reachable -- only checks format.
- Does not validate the content quality of fields (e.g., whether the description is useful), only their presence and format.
- Consistency checks depend on the plugin's actual directory contents -- if skills/ is empty, the count check passes trivially.

## Good vs Bad

**Bad finding:**
```
WARNING: version field is missing.
```
Missing: no expected format, no guidance.

**Good finding:**
```
WARNING | version | Missing. Expected: semver string (e.g., "1.0.0"). | (absent)
```
Includes: severity, field name, expected format with example, current value.

## Anti-Patterns

1. Accepting `version: "1.0"` as valid semver (must be three components).
2. Not detecting the `v` prefix in version strings (`v1.0.0` is invalid).
3. Rejecting `author: "Jane"` (string) — the official spec accepts both string and object formats for `author`.
4. Ignoring extra unknown fields without at least an INFO note.

## Edge Cases

1. plugin.json with BOM (byte order mark) -- strip before parsing, report INFO.
2. Very large description (>500 chars) -- INFO suggesting it may be too verbose for tooling.
3. Unicode characters in name field -- CRITICAL, names must be ASCII kebab-case.
4. Duplicate keys in JSON (technically valid but undefined behavior) -- WARNING.
5. Empty keywords array `[]` -- WARNING, same as missing.
