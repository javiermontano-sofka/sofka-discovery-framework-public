# PQA Pipeline Orchestration

> 9 movements, 4 quality gates, 8 data contracts.

## Pipeline Flows

### Full Lifecycle (`/pqa:lifecycle`)

```
IDEATE -> [G1] -> PLAN -> [G2] -> DESIGN -> [G3] -> SPECIFY -> [G4] -> BUILD -> VALIDATE -> AUDIT -> REPORT -> (FIX if needed)
```

All 9 movements, all 4 agents, all 20 skills. Quality gates G1-G4 between upstream movements.

### Create Only (`/pqa:create`)

```
IDEATE -> [G1] -> PLAN -> [G2] -> DESIGN -> [G3] -> SPECIFY -> [G4] -> BUILD
```

5 upstream movements. Produces a scaffolded plugin without QA.

### QA Only (`/pqa:audit`)

```
VALIDATE -> AUDIT -> REPORT
```

3 downstream movements (VALIDATE, AUDIT, REPORT), plus FIX if needed. Runs 9 QA skills on an existing plugin.

### Quick Validate (`/pqa:validate`)

```
validate-structure -> validate-manifest -> validate-components -> validate-hooks -> validate-cross-refs
```

5 validation skills only. Fast structural check without audit depth.

### Fix Mode (`/pqa:fix`)

```
fix-common-issues -> [show changes] -> [ask confirmation] -> [apply] -> re-validate
```

Auto-remediation with user confirmation, followed by re-validation to confirm fixes.

## Data Contracts

| From | To | Artifact |
|------|----|----------|
| IDEATE | PLAN | `plugin-brief.md` -- concept, purpose, skill ideas |
| PLAN | DESIGN | `architecture-plan.md` + `moat-strategy.md` -- structure, agents, MOAT depth |
| DESIGN | SPECIFY | Component design files -- procedures, criteria, anti-patterns |
| SPECIFY | BUILD | Spec packages -- SKILL.md contents, MOAT assets, command definitions |
| BUILD | VALIDATE | Scaffolded plugin directory -- all files in place |
| VALIDATE | AUDIT | Validation findings -- structural issues list |
| AUDIT | REPORT | Audit findings -- security + quality issues |
| REPORT | FIX | QA report -- severity-classified findings for remediation |

---
*PQA v3.0 — 9 movements, zero shortcuts.*
