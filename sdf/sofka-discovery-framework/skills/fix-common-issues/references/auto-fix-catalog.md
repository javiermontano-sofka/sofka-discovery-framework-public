# Auto-Fix Catalog

> Issues that `fix-common-issues` can automatically remediate, with fix strategies.

## Fixable Issues

| # | Issue | Detection | Fix Strategy | Risk |
|---|-------|-----------|-------------|------|
| 1 | Missing `alias-of` in alias commands | Command file with single-line body pointing to another command | Add `alias-of: <canonical>` to frontmatter | Low |
| 2 | Non-kebab-case naming | Regex `^[a-z][a-z0-9]*(-[a-z0-9]+)*$` fails | Rename file/directory to kebab-case equivalent | Medium (may break refs) |
| 3 | Missing frontmatter field | Required field absent in YAML | Add field with TODO placeholder value | Low |
| 4 | Empty hook event arrays | `"EventName": []` in hooks.json | Remove the empty event entry | Low |
| 5 | Missing SKILL.md in skill directory | Directory exists but no SKILL.md | Generate minimal SKILL.md scaffold | Low |
| 6 | Invalid JSON in plugin.json | JSON parse error | Attempt to fix common syntax errors (trailing comma, missing quote) | Medium |
| 7 | Missing execute permission on scripts | `.sh` file without `+x` | Run `chmod +x` | Low |
| 8 | Missing shebang in scripts | `.sh` file without `#!/bin/bash` | Prepend standard shebang | Low |

## Non-Fixable Issues (Manual Required)

| Issue | Why manual |
|-------|-----------|
| Type-event incompatibility in hooks | Requires understanding intent |
| Orphaned skills | May be intentional or in-progress |
| Security vulnerabilities | Requires design decision |
| Content quality gaps | Requires domain knowledge |
| Cross-reference mismatches in CLAUDE.md | Documentation requires human judgment |

## Fix Protocol

1. Detect issue and classify
2. Propose fix with before/after preview
3. **Ask user for confirmation** before applying
4. Apply fix
5. Re-run relevant validation skill to confirm fix
6. Report results
