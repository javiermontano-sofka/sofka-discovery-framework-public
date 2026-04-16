---
name: validate-components
description: "Validates frontmatter and body structure of all skills, agents, and commands in a plugin. Triggers: validate components, check frontmatter, component audit, skill validation."
author: JM Labs (Javier Montaño)
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
---

# Validate Components

> "Frontmatter is the API contract of a skill. Without it, the runtime cannot discover, route, or constrain."

Validates that every skill, agent, and command file has correct YAML frontmatter, required fields, proper types, and a well-structured body.

---

## Procedure

### Step 1 -- Enumerate All Components

- Glob `skills/*/SKILL.md` for skills.
- Glob `agents/*.md` for agents.
- Glob `commands/*.md` for commands.
- Record total count per type. If a type directory exists but is empty, report `INFO: No <type> found`.

### Step 2 -- Validate Skill Frontmatter

For each `skills/*/SKILL.md`:

- Parse YAML frontmatter (content between `---` delimiters).
- **name** (required): Must be a non-empty string. `CRITICAL` if missing.
- **description** (required): Must be a non-empty string, ideally >20 chars. `CRITICAL` if missing, `WARNING` if <20 chars.
- **allowed-tools** (required): Must be present and must be a YAML array (not a string, not comma-separated). `CRITICAL` if missing. `CRITICAL` if not an array. Valid tool names include: `Read`, `Write`, `Edit`, `Glob`, `Grep`, `Bash`, `WebFetch`, `WebSearch`, `NotebookEdit`, `TodoWrite`.
- **author**: `INFO` if missing (recommended but not required by spec).
- Detect unknown frontmatter keys and report `INFO` for each.

### Step 3 -- Validate Skill Body

For each skill, check the markdown body (content after closing `---`):

- Must contain a heading (`#` or `##`) that serves as the skill title.
- Must contain a section with one of: `Procedure`, `Steps`, `Workflow`, `Process`. `WARNING` if no procedural section found.
- Should contain at least one numbered or bulleted list. `INFO` if no lists detected.
- Check for empty body (only whitespace after frontmatter). `CRITICAL` if body is empty.

### Step 4 -- Validate Agent Frontmatter

For each `agents/*.md`:

- **name** (required): Must be a non-empty string. `CRITICAL` if missing.
- **description** (required): Must be a non-empty string. `CRITICAL` if missing.
- **tools**: Should be a YAML list of tool names. `WARNING` if missing (agents without tool constraints may have unintended access).
- Agent body should contain a role description and at minimum one section describing responsibilities or skills assigned.

### Step 5 -- Validate Command Frontmatter

For each `commands/*.md`:

- **description** (required): Must be a non-empty string. `CRITICAL` if missing.
- **user-invocable** (required): Must be `true` (boolean). `CRITICAL` if missing or set to `false`.
- **argument**: `INFO` if missing (commands without arguments are valid).
- **alias-of**: If present, record for cross-reference validation.

### Step 6 -- Detect Duplicate Names

- Collect all `name` values from skills, agents, and commands.
- Report `WARNING` for any duplicate name appearing in multiple components.
- Report `CRITICAL` if the same name appears within the same component type (two skills named identically).

### Step 7 -- Generate Components Report

- Produce per-file findings: `| Component | Type | Severity | Finding |`.
- Summary statistics: total components scanned, pass rate per type, top issues.
- If all components pass required checks: "Component validation PASSED".

---

## Quality Criteria

- [ ] Every finding references the exact file path and the specific frontmatter field.
- [ ] Type validation is strict -- `allowed-tools: "Read, Bash"` (string) is detected as wrong.
- [ ] Body validation does not penalize for creative section naming if procedural content exists.
- [ ] Duplicate detection is case-insensitive.
- [ ] The report includes per-type pass rates (skills, agents, commands) and a total components scanned count.

## Assumptions & Limits

- Read-only. This skill never creates or modifies component files.
- Cannot validate whether a skill's `allowed-tools` list is appropriate for its procedure -- only checks format and recognized tool names.
- Does not evaluate the semantic quality of frontmatter values (e.g., whether the description is useful), only their presence, type, and format.
- Agent body scanning for "responsibilities" is heuristic -- a creatively structured agent file may pass manual review but fail the heading check.
- Command `user-invocable` field is validated as a boolean, but YAML parsers accept `yes`/`no`/`on`/`off` as boolean equivalents -- this skill treats only `true` as valid.

## Good vs Bad

**Bad finding:**
```
Missing name in skill.
```
Missing: no file path, no field name, no expected type.

**Good finding:**
```
CRITICAL | skills/validate-hooks/SKILL.md | name | Missing. Expected: non-empty string in YAML frontmatter. | (absent)
```
Includes: severity, exact file path, field name, expected type, current value.

## Anti-Patterns

1. Accepting `allowed-tools` as a comma-separated string instead of a YAML array.
2. Skipping agent/command validation because "only skills matter".
3. Not detecting frontmatter that uses tabs instead of spaces (YAML spec requires spaces).
4. Treating `user-invocable: "true"` (string) as valid when a boolean is required.

## Edge Cases

1. Skill with frontmatter but completely empty body -- CRITICAL.
2. Command with `alias-of` pointing to itself -- CRITICAL (circular alias).
3. Agent file with no frontmatter delimiters at all -- CRITICAL.
4. Frontmatter with multiline description using `|` or `>` YAML syntax -- valid, do not flag.
5. Extra files in skill directories beyond SKILL.md (templates, examples) -- INFO.
