---
name: validate-structure
description: "Validates plugin directory layout against the official Claude Code plugin spec. Triggers: validate structure, check layout, directory audit, plugin skeleton check."
author: JM Labs (Javier Montaño)
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
---

# Validate Structure

> "A plugin that does not follow the spec is not a plugin -- it is a folder with aspirations."

Validates that a Claude Code plugin's directory tree conforms to the official specification. Detects missing directories, misplaced files, naming violations, path traversal risks, and script permission issues.

---

## Procedure

### Step 1 -- Locate Plugin Root

- Search for `plugin.json` at the provided path (official spec location).
- If not found at root, check `.claude-plugin/plugin.json` (legacy location). Report `INFO: plugin.json found at legacy .claude-plugin/ path` if found there.
- If not found at either location, report `CRITICAL: No plugin.json found -- not a valid plugin root`.
- Record the plugin root path for all subsequent steps.

### Step 2 -- Validate Plugin Root Contents

- If `.claude-plugin/` directory exists, list all files inside it.
- If `plugin.json` is inside `.claude-plugin/`, only `plugin.json` should be there. Any other file is a `WARNING: Unexpected file in .claude-plugin/`.
- If `plugin.json` is at root (preferred), this check is N/A.

### Step 3 -- Check Required Directories

- Verify existence of: `skills/`, `commands/`, `agents/`, `hooks/`.
- Per the official spec, all directories are optional. A plugin needs only `plugin.json`.
- Missing `skills/` = `WARNING` if the plugin description implies skill-based functionality.
- Missing `commands/` = `INFO` (commands are optional).
- Missing `agents/` = `INFO` (plugin can use the host agent).
- Missing `hooks/` = `INFO` (hooks are optional).

### Step 4 -- Validate Component Layout

- Skills MUST be directories containing a `SKILL.md` file: `skills/<name>/SKILL.md`.
- Commands MUST be `.md` files directly under `commands/`: `commands/<name>.md`.
- Agents MUST be `.md` files directly under `agents/`: `agents/<name>.md`.
- Report `CRITICAL` for any skill directory missing `SKILL.md`.
- Report `WARNING` for unexpected file types (`.txt`, `.json`) in commands/ or agents/.

### Step 5 -- Validate Naming Conventions

- All directory and file names (excluding extensions) MUST be kebab-case: `^[a-z][a-z0-9]*(-[a-z0-9]+)*$`.
- Report `WARNING` for each violation with the offending name and suggested kebab-case alternative.

### Step 6 -- Scan for Path Traversal and Absolute Paths

- Grep all `.md`, `.json`, `.sh` files for `../` sequences.
- Grep for absolute paths matching `^/` in script files and hook configurations.
- Report `CRITICAL` for any `../` usage in hooks.json or script references.
- Report `WARNING` for `../` in documentation files (may be intentional examples).

### Step 7 -- Check Script Files

- Locate all `.sh`, `.py`, `.js` files in the plugin tree.
- Verify each has an appropriate shebang line (`#!/bin/bash`, `#!/usr/bin/env node`, etc.).
- Verify executable permission is set (`chmod +x`). Use `ls -la` to check.
- Report `WARNING` for missing shebang. Report `WARNING` for missing execute permission.

### Step 8 -- Generate Structure Report

- Produce a findings table: `| Severity | File/Path | Finding | Spec Reference |`.
- Include summary counts: total CRITICAL, WARNING, INFO.
- If zero CRITICAL findings, state: "Structure validation PASSED".

---

## Quality Criteria

- [ ] Every finding references the exact path relative to plugin root.
- [ ] Severity is never inflated -- follow the classification matrix from the agent.
- [ ] Naming suggestions are provided for every kebab-case violation.
- [ ] The report is machine-parseable (table format, consistent severity labels).
- [ ] plugin.json is searched at root first, then .claude-plugin/ (official spec order).

## Assumptions & Limits

- Read-only. This skill never creates directories or modifies files.
- Cannot determine whether a missing directory is intentional (minimal plugin) or accidental (incomplete scaffold). Reports severity based on functionality implications, not intent.
- Symlinks are detected but not followed -- the skill cannot validate the symlink target.
- Does not validate file contents (that is validate-manifest's and validate-components' job). Only checks existence, location, and naming.
- Path traversal detection uses pattern matching, not symlink resolution -- a `../` that resolves safely is still flagged because it indicates a portability risk.

## Good vs Bad

**Bad finding:**
```
Missing skills directory.
```
Missing: no severity, no path, no spec reference.

**Good finding:**
```
WARNING | skills/ | Directory absent. Plugin description implies skill-based functionality but no skills/ directory exists. | Official spec: optional
```
Includes: severity, path, context explaining why it matters, spec reference.

## Anti-Patterns

1. Reporting a missing optional directory as CRITICAL.
2. Failing to check inside skill subdirectories for SKILL.md.
3. Ignoring dotfiles (`.gitkeep`, `.DS_Store`) -- these should be INFO, not errors.
4. Checking naming conventions on files outside the plugin tree.

## Edge Cases

1. Plugin with zero skills but valid structure (commands-only plugin) -- valid, INFO note.
2. Nested skill directories (skills/group/skill-name/) -- not spec-compliant, CRITICAL.
3. Symlinks in the plugin tree -- report as WARNING, do not follow.
4. Empty directories (created but no content) -- WARNING for skills/, INFO for others.
5. Mixed case in `.claude-plugin` directory name -- CRITICAL on case-sensitive filesystems.
