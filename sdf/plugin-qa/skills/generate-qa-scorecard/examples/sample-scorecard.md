# Example: QA Scorecard Output

## Expected Format

```markdown
# QA Scorecard: my-plugin

| Dimension | Score | Grade | Notes |
|-----------|-------|-------|-------|
| Structure | 95 | A | |
| Manifest | 88 | B | Missing repository field |
| Components | 92 | A | |
| Hooks | 100 | A | No hooks defined (valid) |
| Cross-References | 85 | B | 1 orphan skill |
| Security | 90 | A | |
| Content Quality | 78 | C | 3 skills below 80% |
|-----------|-------|-------|-------|
| **Overall** | **89** | **B** | 0 critical, 2 warnings |
```

## Grading Logic

- Start each dimension at 100
- Deduct per finding: CRITICAL = -20, WARNING = -5, INFO = -1
- Floor at 0
- Overall = weighted average of all 7 dimensions
