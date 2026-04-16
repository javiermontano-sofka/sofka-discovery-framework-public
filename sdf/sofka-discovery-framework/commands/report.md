---
description: "Generate QA report from previous validation results. Runs full audit if no results exist."
user-invocable: true
---

# /pqa:report

Generate a QA report from previous validation results. If no prior results exist, runs a full audit first.

## Usage

```
/pqa:report [TARGET_DIR]
```

- `TARGET_DIR` — Path to the plugin root directory. Defaults to `$PWD`.

## Execution Flow

1. Check for existing validation results in TARGET_DIR.
2. If results exist, run `generate-qa-report` using cached results.
3. If no results exist, run full `/pqa:audit` flow first, then generate report.

## Output

- Markdown report saved to `qa-report.md` in TARGET_DIR.
- Report includes:
  - Plugin metadata
  - Validation results per movement
  - Findings table (severity, component, description)
  - Recommendations
  - Timestamp

## Notes

- The report is a standalone markdown file suitable for review or archival.
- Re-running overwrites the previous report.
