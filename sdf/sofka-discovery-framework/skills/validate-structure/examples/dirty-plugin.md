# Example: Plugin with Structure Issues

## Input

Plugin directory: `bad-plugin/`

```
bad-plugin/
  .claude-plugin/
    plugin.json
    config.yaml          # unexpected file
  skills/
    FetchData/           # non-kebab-case
      SKILL.md
    empty-skill/         # missing SKILL.md
  commands/
    run.md
  CLAUDE.md
```

## Expected Output

```
| Severity | File/Path | Finding | Spec Reference |
|----------|-----------|---------|----------------|
| WARNING | .claude-plugin/config.yaml | Unexpected file in .claude-plugin/ | Only plugin.json allowed |
| WARNING | skills/FetchData/ | Non-kebab-case directory name | Suggest: fetch-data |
| CRITICAL | skills/empty-skill/ | Skill directory missing SKILL.md | Every skill dir needs SKILL.md |
| WARNING | (root) | Missing agents/ directory | Recommended for orchestration |
| INFO | (root) | Missing hooks/ directory | Optional |

Summary: 1 CRITICAL | 3 WARNING | 1 INFO
```
