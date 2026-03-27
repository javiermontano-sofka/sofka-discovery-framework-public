# Example: QA Report Output

## Expected Format

```markdown
# QA Report: my-plugin

**Date**: 2026-03-15
**Plugin**: /path/to/my-plugin
**Overall Grade**: B

---

## Summary

48/52 checks passed | 1 critical | 2 warnings | 1 info

---

## Findings

| # | Severity | Component | Description | Recommendation |
|---|----------|-----------|-------------|----------------|
| 1 | CRITICAL | skills/broken-skill/ | Missing SKILL.md | Create SKILL.md with required frontmatter |
| 2 | WARNING | .claude-plugin/plugin.json | Missing repository field | Add repository object |
| 3 | WARNING | agents/helper.md | Missing description field | Add meaningful description |
| 4 | INFO | commands/x.md | Single-letter alias could be clearer | Consider more descriptive name |

---

## Recommendations

1. **Fix CRITICAL**: Create skills/broken-skill/SKILL.md immediately
2. **Improve manifest**: Add repository and bugs fields
3. **Agent quality**: Add descriptions to all agents
```
