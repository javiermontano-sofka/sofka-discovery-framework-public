# Example: Clean Plugin Structure

## Input

Plugin directory: `my-plugin/`

```
my-plugin/
  .claude-plugin/
    plugin.json
  skills/
    fetch-data/
      SKILL.md
    transform-data/
      SKILL.md
  commands/
    run.md
    status.md
  agents/
    orchestrator.md
  hooks/
    hooks.json
  CLAUDE.md
  README.md
  settings.json
  LICENSE
```

## Expected Output

```
Structure validation PASSED

| Severity | File/Path | Finding | Spec Reference |
|----------|-----------|---------|----------------|
| (no findings) |

Summary: 0 CRITICAL | 0 WARNING | 0 INFO
```
