# PQA Output Standards

> Report format, scorecard format, grading scale.

## Report Format

Reports are saved as `{plugin-name}_qa-report_{YYYY-MM-DD}.md`:

```markdown
# QA Report: {plugin-name}
**Date**: {timestamp}
**Plugin**: {path}
**Overall Grade**: {letter}

## Summary
{pass}/{total} checks passed | {critical} critical | {warning} warnings | {info} info

## Findings
| # | Severity | Component | Description | Recommendation |
|---|----------|-----------|-------------|----------------|
...

## Recommendations
1. ...
```

## Scorecard Format

```markdown
# QA Scorecard: {plugin-name}

| Dimension        | Score | Grade | Notes          |
|------------------|-------|-------|----------------|
| Structure        | 95    | A     |                |
| Manifest         | 88    | B     | Missing fields |
| Components       | 92    | A     |                |
| Hooks            | 100   | A     |                |
| Cross-References | 85    | B     | 2 broken refs  |
| Security         | 90    | A     |                |
| Content Quality  | 78    | C     | Thin docs      |
|------------------|-------|-------|----------------|
| **Overall**      | **89**| **B** |                |
```

## Grading Scale

| Grade | Score Range | Meaning |
|-------|------------|---------|
| A | 90-100 | Production ready |
| B | 80-89 | Minor issues |
| C | 70-79 | Needs improvement |
| D | 60-69 | Significant issues |
| F | 0-59 | Not ready for use |

## 7 Scorecard Dimensions

1. **Structure** -- Directory layout, required files, naming conventions
2. **Manifest** -- plugin.json schema, required/recommended fields
3. **Components** -- Skills, agents, commands frontmatter integrity
4. **Hooks** -- Type-event compatibility, schema validity
5. **Cross-References** -- Internal references between components
6. **Security** -- Path traversal, secrets, unsafe patterns
7. **Content Quality** -- Prose, procedures, anti-patterns, edge cases

---
*PQA v3.0 — Measure what matters.*
