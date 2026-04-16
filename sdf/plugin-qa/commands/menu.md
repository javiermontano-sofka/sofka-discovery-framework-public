---
description: "Interactive command palette. Lists all available PQA commands with descriptions."
user-invocable: true
---

# /pqa:menu

Interactive command palette. Lists all 31 available Plugin QA commands organized by movement.

## Usage

```
/pqa:menu
```

## Output

Display the following table:

| Command | Alias | Movement | Description |
|---------|-------|----------|-------------|
| `/pqa:lifecycle` | `/pqa:l` | Full Pipeline | Full 9-movement lifecycle: ideate through report with quality gates |
| `/pqa:create` | `/pqa:c` | Upstream (1-5) | Full upstream pipeline: ideate, plan, design, specify, and build |
| `/pqa:ideate` | `/pqa:i` | 1 - IDEATE | Brainstorm a new plugin concept or component |
| `/pqa:ideate-component` | | 1 - IDEATE | Brainstorm an individual plugin component (skill, agent, command, hook) |
| `/pqa:plan` | `/pqa:p` | 2 - PLAN | Generate architecture plan and MOAT strategy |
| `/pqa:plan-moat` | | 2 - PLAN | Plan MOAT asset allocation per skill |
| `/pqa:design` | `/pqa:d` | 3 - DESIGN | Design a plugin skill or agent in detail |
| `/pqa:design-agent` | | 3 - DESIGN | Design a plugin agent directly |
| `/pqa:spec` | `/pqa:s` | 4 - SPECIFY | Generate production-ready specifications from designs |
| `/pqa:spec-agent` | | 4 - SPECIFY | Generate agent and command specifications from an agent design |
| `/pqa:build` | `/pqa:b` | 5 - BUILD | Scaffold a complete plugin directory from plans and specs |
| `/pqa:build-moat` | | 5 - BUILD | Create MOAT directory structures and populate asset files |
| `/pqa:audit` | `/pqa:a` | 6 - VALIDATE + 7 - AUDIT | Full QA audit. Runs all 10 QA skills, outputs report + scorecard |
| `/pqa:validate` | `/pqa:v` | 6 - VALIDATE | Quick structural validation. 5 validate-* skills only |
| `/pqa:hooks-check` | | 6 - VALIDATE | Hook type-event compatibility check |
| `/pqa:security` | | 7 - AUDIT | Security-only scan |
| `/pqa:report` | `/pqa:r` | 8 - REPORT | Generate QA report from results (or run audit first) |
| `/pqa:scorecard` | | 8 - REPORT | Executive scorecard with 7-dimension grades |
| `/pqa:fix` | `/pqa:f` | 9 - FIX | Auto-fix common issues. Asks before modifying files |
| `/pqa:menu` | | Utility | This command palette |

**Total: 31 commands** (20 canonical + 11 aliases)

### Aliases Quick Reference

| Alias | Resolves To |
|-------|-------------|
| `/pqa:a` | `/pqa:audit` |
| `/pqa:b` | `/pqa:build` |
| `/pqa:c` | `/pqa:create` |
| `/pqa:d` | `/pqa:design` |
| `/pqa:f` | `/pqa:fix` |
| `/pqa:i` | `/pqa:ideate` |
| `/pqa:l` | `/pqa:lifecycle` |
| `/pqa:p` | `/pqa:plan` |
| `/pqa:r` | `/pqa:report` |
| `/pqa:s` | `/pqa:spec` |
| `/pqa:v` | `/pqa:validate` |

After displaying the table, ask the user which command they want to run.
