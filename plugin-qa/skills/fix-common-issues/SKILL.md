---
name: fix-common-issues
author: JM Labs (Javier Montaño)
description: >
  Automatically fixes mechanical issues found during plugin validation, including JSON
  formatting, missing shebangs, file permissions, hook types, frontmatter gaps, and
  settings.json defaults. ALWAYS asks for confirmation before modifying any files.
  Trigger: fix issues, auto-fix, fix common problems, repair plugin.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Fix Common Issues

> "Automate the mechanical so humans can focus on the meaningful."

Auto-remediates mechanical issues found during plugin validation: JSON syntax, missing shebangs, script permissions, incompatible hook types, missing frontmatter fields, and settings.json defaults. Presents all proposed changes for user approval before modifying any file.

---

## Procedure

1. **Inventory fixable issues** -- review findings from previous validation results. If no validation has been run yet, inform the user and suggest running validations first. Categorize issues into fixable (mechanical) vs. non-fixable (requires human judgment). List only mechanical issues for auto-fix.

2. **Detect and plan JSON trailing comma fixes** -- scan all `.json` files for trailing commas (comma before `]` or `}`). Plan: parse the JSON, reformat with standard 2-space indentation, write clean JSON back.

3. **Detect and plan missing shebang fixes** -- scan all `.sh` files for missing `#!/bin/bash` (or `#!/usr/bin/env bash`) on line 1. Plan: prepend `#!/bin/bash` followed by a newline.

4. **Detect and plan non-executable script fixes** -- check all `.sh` files in `scripts/` and `hooks/` for missing execute permission. Plan: mark for `chmod +x`.

5. **Detect and plan prompt-to-command hook conversion** -- scan `hooks/hooks.json` for entries using `type: "prompt"` or `type: "agent"` on non-ToolUseContext events (any event other than PreToolUse, PostToolUse, PermissionRequest). Plan: convert to `type: "command"` using `echo` as the command, preserve the original prompt text as a comment in the command string.

6. **Detect and plan missing frontmatter field fixes** -- scan all `SKILL.md` files for missing required frontmatter fields (`name`, `description`, `allowed-tools`). Plan:
   - Missing `name`: derive from parent directory name in kebab-case
   - Missing `description`: add placeholder `"TODO: Add description with trigger phrases"`
   - Missing `allowed-tools`: add default `[Read]`

7. **Detect and plan settings.json agent key fix** -- check if `settings.json` exists but lacks an `"agent"` key. Plan: find the first agent directory under `agents/`, set `"agent"` to that path.

8. **Present all proposed changes for confirmation** -- display a numbered list of every planned modification:
   - Change number
   - File to be modified
   - What will change (before/after summary)
   - Category (JSON fix, shebang, permissions, hook type, frontmatter, settings)

   **STOP HERE AND WAIT FOR USER APPROVAL.** Do not modify any files until the user explicitly confirms. The user may approve all, approve selectively by number, or reject.

9. **Apply approved fixes** -- execute only the changes the user approved. For each fix:
   - Read the file before modification
   - Apply the change
   - Verify the result (e.g., JSON parses cleanly, shebang is on line 1)

10. **Re-validate after fixes** -- run the relevant validation checks on modified files to confirm the issues are resolved. Report any fixes that did not resolve their target issue.

11. **Generate fix report** -- produce a summary listing:
    - Total issues found vs. fixed vs. skipped
    - Per-file change log: file path, change type, before snippet, after snippet
    - Any issues that could not be auto-fixed (require manual intervention)
    - Re-validation results

## Quality Criteria

- [ ] No file is modified without explicit user confirmation -- the approval gate is mandatory.
- [ ] Every fix is verified after application; a fix that breaks the file is detected and reported.
- [ ] The before/after display is clear enough for the user to make an informed approval decision.
- [ ] JSON fixes produce valid, parseable JSON -- verified by attempting to parse after writing.
- [ ] Original file content is preserved except for the specific fix applied -- no unrelated reformatting.

## Assumptions & Limits

- Destructive by design (with consent). This is the only PQA skill that modifies files, and it does so only after explicit user approval.
- Cannot fix semantic issues -- only mechanical ones. A vague description, a poorly ordered procedure, or a wrong anti-pattern requires human judgment.
- Hook type conversion (prompt→command) is lossy -- the original prompt logic cannot be replicated in a shell command. The fix preserves the text as a comment but the behavior changes.
- Re-validation after fixes runs only the checks relevant to the modified files, not the full audit pipeline.
- Cannot undo applied fixes. If a fix causes a regression, the user must revert manually (e.g., via git).

## Good vs Bad

**Bad fix proposal:**
```
Fix 1: Fix hooks.json
```
Missing: no file path, no before/after, no change type.

**Good fix proposal:**
```
Fix 1 [Hook Type] hooks/hooks.json
  Before: { "type": "prompt", "prompt": "Review safety" } on SessionStart
  After:  { "type": "command", "command": "echo 'Review safety'" } on SessionStart
  Reason: type:prompt requires ToolUseContext; SessionStart does not provide it.
```
Includes: fix number, category, file path, before/after with context, reason for the change.

## Anti-Patterns

1. **Silent modification** -- applying fixes without showing the user what will change. Every fix must be previewed.
2. **Fix-and-forget** -- applying a fix without re-validating. The shebang fix means nothing if the file still has syntax errors.
3. **Destructive formatting** -- reformatting an entire JSON file when only a trailing comma needed removal, destroying intentional formatting.
4. **Blind chmod** -- making every file executable without checking if it is actually a script. Only `.sh` files in `scripts/` and `hooks/` should be modified.
5. **Overwriting custom frontmatter** -- replacing existing valid frontmatter fields while adding missing ones. Only add what is missing; never overwrite existing values.

## Edge Cases

1. **No fixable issues found** -- report "No mechanical issues detected" and skip the approval gate. Do not create an empty fix report.
2. **User rejects all fixes** -- acknowledge the rejection, do not apply any changes, and suggest manual fixes with specific guidance for each issue.
3. **File is read-only** -- detect permission errors before batching fixes. Exclude read-only files from the proposal and note them as requiring manual permission changes.
4. **Conflicting fixes** -- if two fixes target the same file and region (e.g., frontmatter field addition and frontmatter reformatting), merge them into a single coherent change rather than applying sequentially with potential conflicts.
