# QA Scorecard — 7 Quality Dimensions

> Scoring methodology for the executive scorecard.

## Dimensions

| # | Dimension | Weight | What It Measures |
|---|-----------|--------|-----------------|
| 1 | Structure | 15% | Directory layout, naming conventions, file placement |
| 2 | Manifest | 10% | plugin.json completeness and correctness |
| 3 | Components | 20% | Skill, agent, command frontmatter integrity |
| 4 | Hooks | 10% | Hook configuration validity and type-event compatibility |
| 5 | Cross-References | 15% | Reference integrity, orphan detection |
| 6 | Security | 15% | Path traversal, secrets, injection risks |
| 7 | Content Quality | 15% | Prose quality, procedure clarity, anti-pattern coverage |

## Scoring Per Dimension (0-100)

| Score | Calculation |
|-------|-------------|
| 100 | Zero findings of any severity |
| 90-99 | INFO findings only |
| 80-89 | WARNING findings but no CRITICAL |
| 60-79 | 1 CRITICAL finding |
| 0-59 | 2+ CRITICAL findings |

## Overall Grade

Weighted average of all 7 dimensions, mapped to letter grade:

| Grade | Range | Meaning |
|-------|-------|---------|
| A | 90-100 | Production ready |
| B | 80-89 | Minor issues |
| C | 70-79 | Needs improvement |
| D | 60-69 | Significant issues |
| F | 0-59 | Not ready for use |

## Scorecard Table Format

```markdown
| Dimension | Score | Grade | Notes |
|-----------|-------|-------|-------|
```

Notes column: brief explanation of deductions (e.g., "2 missing fields", "1 orphan skill").
