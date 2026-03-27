# Example: Orphan and Broken Reference Detection

## Input — CLAUDE.md lists:

```markdown
| Skill | Movement |
|-------|----------|
| fetch-data | 1 |
| transform-data | 2 |
| export-data | 3 |
```

## Filesystem:

```
skills/
  fetch-data/SKILL.md
  transform-data/SKILL.md
  legacy-import/SKILL.md     # orphan — not in CLAUDE.md
```

## Expected Output

```
| Severity | Category | Finding |
|----------|----------|---------|
| CRITICAL | CLAUDE.md -> Skill | export-data listed in CLAUDE.md but not on disk |
| WARNING | Orphan | skills/legacy-import/ exists on disk but not referenced in CLAUDE.md |

Summary: 1 CRITICAL | 1 WARNING | 0 INFO
```
