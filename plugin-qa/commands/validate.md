---
description: "Quick structural validation. Runs only the 5 validate-* skills for fast feedback."
user-invocable: true
---

# /pqa:validate

Quick structural validation of a Claude Code plugin. Runs only the 5 validate-* skills for fast feedback without content quality scoring.

## Usage

```
/pqa:validate [TARGET_DIR]
```

- `TARGET_DIR` — Path to the plugin root directory. Defaults to `$PWD`.

## Execution Flow

Run the following skills in order:

1. `validate-structure` — Directory layout, required files
2. `validate-manifest` — plugin.json schema compliance
3. `validate-components` — Skills, agents, commands integrity
4. `validate-hooks` — Hook type-event compatibility
5. `validate-cross-refs` — Internal references between components

## Output

- Pass/fail summary per skill
- Console table with results
- No report file generated (use `/pqa:report` for that)

## Notes

- Faster than `/pqa:audit` — skips content quality and security scans.
- Use this for iterative development cycles.
- If you need a full report, use `/pqa:audit` instead.
