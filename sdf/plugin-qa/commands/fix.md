---
description: "Auto-fix common mechanical issues. Shows proposed changes and asks for confirmation before applying."
user-invocable: true
---

# /pqa:fix

Auto-fix common mechanical issues found during validation. Shows proposed changes, asks for confirmation, applies fixes, and re-validates.

## Usage

```
/pqa:fix [TARGET_DIR]
```

- `TARGET_DIR` — Path to the plugin root directory. Defaults to `$PWD`.

## Execution Flow

1. Run `fix-common-issues` skill to detect fixable problems.
2. Display proposed changes to the user in a clear diff-style format.
3. **ALWAYS ask for user confirmation before modifying any files.**
4. If confirmed, apply the fixes.
5. Re-run `/pqa:validate` to verify fixes resolved the issues.
6. Report results.

## Fixable Issues

- Missing required frontmatter fields
- Incorrect YAML formatting
- Broken internal file references (path corrections)
- Missing description fields in commands
- Whitespace and formatting normalization

## Output

- List of proposed changes (before/after)
- Confirmation prompt
- Post-fix validation results

## Notes

- This command NEVER modifies files without explicit user confirmation.
- Complex or ambiguous issues are reported but not auto-fixed.
- After fixing, always verify with `/pqa:validate`.
