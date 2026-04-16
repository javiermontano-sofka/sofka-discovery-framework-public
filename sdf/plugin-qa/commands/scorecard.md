---
description: "Generate executive scorecard with 7-dimension quality table and letter grade."
user-invocable: true
---

# /pqa:scorecard

Generate an executive scorecard summarizing plugin quality across 7 dimensions with a letter grade.

## Usage

```
/pqa:scorecard [TARGET_DIR]
```

- `TARGET_DIR` — Path to the plugin root directory. Defaults to `$PWD`.

## Execution Flow

1. Check for existing validation results in TARGET_DIR.
2. If results exist, run `generate-qa-scorecard` using cached results.
3. If no results exist, run full `/pqa:audit` flow first, then generate scorecard.

## Scorecard Dimensions

| # | Dimension            | Weight | What It Measures                          |
|---|----------------------|--------|-------------------------------------------|
| 1 | Structure            | 15%    | Directory layout, required files          |
| 2 | Manifest             | 15%    | plugin.json correctness                 |
| 3 | Components           | 15%    | Skills, agents, commands integrity        |
| 4 | Hooks                | 15%    | Hook type-event compatibility             |
| 5 | Cross-References     | 10%    | Internal link consistency                 |
| 6 | Security             | 15%    | Security best practices                   |
| 7 | Content Quality      | 15%    | Documentation, descriptions, completeness |

## Grading Scale

| Grade | Score Range | Meaning                    |
|-------|------------|----------------------------|
| A     | 90-100     | Production ready           |
| B     | 80-89      | Minor issues               |
| C     | 70-79      | Needs improvement          |
| D     | 60-69      | Significant issues         |
| F     | 0-59       | Not ready for use          |

## Output

- Formatted scorecard table with per-dimension scores
- Overall weighted score and letter grade
- Top 3 recommendations for improvement
