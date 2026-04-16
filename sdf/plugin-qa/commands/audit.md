---
description: "Full QA audit of a Claude Code plugin. Runs 9 skills across 4 movements: validate, audit, report."
user-invocable: true
---

# /pqa:audit

Full QA audit of a Claude Code plugin. Runs 9 skills in sequence across 4 audit movements (5 validate + 2 audit + 2 report).

## Usage

```
/pqa:audit [TARGET_DIR]
```

- `TARGET_DIR` — Path to the plugin root directory. Defaults to `$PWD`.

## Execution Flow

Run the following skills in order:

1. **Movement 1 — Structural Validation**
   - `validate-structure` — Directory layout, required files
   - `validate-manifest` — plugin.json schema compliance
   - `validate-components` — Skills, agents, commands integrity

2. **Movement 2 — Behavioral Validation**
   - `validate-hooks` — Hook type-event compatibility (ToolUseContext check)
   - `validate-cross-refs` — Internal references between components

3. **Movement 3 — Quality & Security**
   - `audit-security` — Security findings scan
   - `audit-content-quality` — Content quality scoring

4. **Movement 4 — Reporting**
   - `generate-qa-report` — Full markdown report
   - `generate-qa-scorecard` — 7-dimension executive scorecard

## Output

- Full markdown QA report saved to `qa-report.md` in TARGET_DIR
- Executive scorecard with letter grade (A-F)
- Console summary with pass/fail counts and overall grade

## Notes

- This is the most comprehensive command. For faster checks, use `/pqa:validate`.
- All findings are classified as CRITICAL, WARNING, or INFO.
- The scorecard aggregates scores across 7 quality dimensions.
