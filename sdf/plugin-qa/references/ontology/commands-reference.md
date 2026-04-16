# PQA Commands Reference

> 31 commands: 20 canonical + 11 single-letter aliases.

## Command Table

| Command | Alias | Movement | Description |
|---------|-------|----------|-------------|
| `/pqa:lifecycle` | `/pqa:l` | Full Pipeline | Full 9-movement lifecycle: ideate through report |
| `/pqa:create` | `/pqa:c` | Upstream (1-5) | Full upstream pipeline: ideate, plan, design, specify, build |
| `/pqa:ideate` | `/pqa:i` | 1 - IDEATE | Brainstorm a new plugin concept or component |
| `/pqa:ideate-component` | | 1 - IDEATE | Brainstorm an individual component |
| `/pqa:plan` | `/pqa:p` | 2 - PLAN | Architecture plan + MOAT strategy |
| `/pqa:plan-moat` | | 2 - PLAN | MOAT asset allocation per skill |
| `/pqa:design` | `/pqa:d` | 3 - DESIGN | Design a skill or agent in detail |
| `/pqa:design-agent` | | 3 - DESIGN | Design an agent directly |
| `/pqa:spec` | `/pqa:s` | 4 - SPECIFY | Generate specs from designs |
| `/pqa:spec-agent` | | 4 - SPECIFY | Generate agent + command specs |
| `/pqa:build` | `/pqa:b` | 5 - BUILD | Scaffold plugin directory from specs |
| `/pqa:build-moat` | | 5 - BUILD | Create MOAT directories and assets |
| `/pqa:audit` | `/pqa:a` | 6+7 - VALIDATE+AUDIT | Full QA audit, report + scorecard |
| `/pqa:validate` | `/pqa:v` | 6 - VALIDATE | Quick structural validation (5 skills) |
| `/pqa:hooks-check` | | 6 - VALIDATE | Hook type-event compatibility check |
| `/pqa:security` | | 7 - AUDIT | Security-only scan |
| `/pqa:report` | `/pqa:r` | 8 - REPORT | Generate QA report |
| `/pqa:scorecard` | | 8 - REPORT | Executive scorecard with grades |
| `/pqa:fix` | `/pqa:f` | 9 - FIX | Auto-fix common issues |
| `/pqa:menu` | | Utility | Interactive command palette |

## Aliases

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

---
*PQA v3.0 — 31 commands, zero ambiguity.*
