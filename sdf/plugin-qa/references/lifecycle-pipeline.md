# Lifecycle Pipeline Reference

> Source: Claude Code official documentation + PQA internal methodology
> Scope: 9-movement pipeline, quality gates, data contracts, agent delegation, command routing

---

## 1. The 9-Movement Pipeline

| # | Movement | Max Turns | Purpose | Key Output |
|---|----------|-----------|---------|------------|
| 1 | **IDEATE** | 2 | Explore problem space, gather requirements | Problem statement, success criteria |
| 2 | **PLAN** | 2 | Define scope, structure, and approach | Architecture doc, skill inventory |
| 3 | **DESIGN** | 2 | Detail interfaces, contracts, data flow | Interface specs, dependency map |
| 4 | **SPECIFY** | 2 | Write precise SKILL.md frontmatter + body | Complete SKILL.md drafts |
| 5 | **BUILD** | 2 | Create files, references, examples, scripts | All plugin artifacts on disk |
| 6 | **VALIDATE** | 5 | Test, lint, score against MOAT dimensions | Validation report, MOAT scores |
| 7 | **AUDIT** | 2 | Cross-check against spec, find gaps | Audit findings, severity ratings |
| 8 | **REPORT** | 2 | Generate final quality report | Summary report with pass/fail |
| 9 | **FIX** | 1 | Apply targeted fixes for audit findings | Patched artifacts |

---

## 2. Quality Gates

Four gates separate movements and enforce minimum quality before progression.

| Gate | Between | Type | Pass Criteria |
|------|---------|------|---------------|
| **G1** | IDEATE -> PLAN | User approval | User approves concept brief: purpose, target users, differentiation clear |
| **G2** | PLAN -> DESIGN | User approval | User approves architecture plan and MOAT strategy |
| **G3** | DESIGN -> SPECIFY | User approval | User approves component designs: procedures, quality criteria, anti-patterns |
| **G4** | SPECIFY -> BUILD | User approval | User approves spec packages: MOAT assets, command definitions, cross-refs |

### Gate Failure Behavior

| Gate | On failure |
|------|-----------|
| G1 | Return to IDEATE; refine concept brief with user feedback |
| G2 | Return to PLAN; revise architecture based on feedback |
| G3 | Return to DESIGN; improve component designs |
| G4 | Return to SPECIFY; fix spec issues before building |

---

## 3. Data Contracts Between Movements

Each movement consumes artifacts from its predecessor and produces artifacts for its successor.

```
IDEATE                          PLAN
  plugin-brief.md         ->      architecture-plan.md
                                  moat-strategy.md

PLAN                            DESIGN
  architecture-plan.md    ->      Component design files
  moat-strategy.md        ->      (procedures, criteria, anti-patterns)

DESIGN                          SPECIFY
  Component designs       ->      Spec packages (SKILL.md contents,
                                  MOAT assets, command definitions)

SPECIFY                         BUILD
  Spec packages           ->      Scaffolded plugin directory
                          ->      All files in place

BUILD                           VALIDATE
  All plugin files        ->      Validation findings
                          ->      Structural issues list

VALIDATE                        AUDIT
  Validation findings     ->      Audit findings
                          ->      Security + quality issues

AUDIT                           REPORT
  Audit findings          ->      QA report
                          ->      Severity-classified findings

REPORT                          FIX
  QA report               ->      Remediation list (CRITICAL items)
```

---

## 4. Agent Delegation

Each movement is handled by a specialized agent role.

| Agent | Movements | Strengths |
|-------|-----------|-----------|
| **plugin-architect** | IDEATE, PLAN, DESIGN | Big-picture thinking, structure, trade-offs |
| **plugin-spec-writer** | SPECIFY | Precise frontmatter, MOAT-compliant SKILL.md authoring |
| **plugin-builder-agent** | BUILD | File creation, directory structure, code generation |
| **plugin-qa-engineer** | VALIDATE, AUDIT, REPORT, FIX | Testing, scoring, gap analysis, targeted patches |

### Agent Handoff Protocol

1. Completing agent produces its output artifacts
2. Pipeline controller checks the quality gate
3. If gate passes, next agent receives artifacts + movement instructions
4. If gate fails, current agent receives feedback and retries (max 2 retries)

---

## 5. Command Routing Table

All PQA commands mapped to their pipeline movements.

| Command | Alias | Movement(s) | Description |
|---------|-------|-------------|-------------|
| `/pqa:lifecycle` | `/pqa:l` | Full Pipeline | Full 9-movement lifecycle |
| `/pqa:create` | `/pqa:c` | IDEATE -> BUILD | Upstream pipeline (no QA) |
| `/pqa:ideate` | `/pqa:i` | IDEATE | Brainstorm plugin concept |
| `/pqa:ideate-component` | | IDEATE | Brainstorm individual component |
| `/pqa:plan` | `/pqa:p` | PLAN | Architecture plan + MOAT strategy |
| `/pqa:plan-moat` | | PLAN | MOAT asset allocation |
| `/pqa:design` | `/pqa:d` | DESIGN | Design skill or agent in detail |
| `/pqa:design-agent` | | DESIGN | Design agent directly |
| `/pqa:spec` | `/pqa:s` | SPECIFY | Generate specs from designs |
| `/pqa:spec-agent` | | SPECIFY | Generate agent + command specs |
| `/pqa:build` | `/pqa:b` | BUILD | Scaffold plugin from specs |
| `/pqa:build-moat` | | BUILD | Create MOAT directories and assets |
| `/pqa:audit` | `/pqa:a` | VALIDATE+AUDIT+REPORT | Full QA audit with report |
| `/pqa:validate` | `/pqa:v` | VALIDATE | Quick structural validation (5 skills) |
| `/pqa:hooks-check` | | VALIDATE | Hook type-event compatibility check |
| `/pqa:security` | | AUDIT | Security-only scan |
| `/pqa:report` | `/pqa:r` | REPORT | Generate QA report |
| `/pqa:scorecard` | | REPORT | Executive scorecard with grades |
| `/pqa:fix` | `/pqa:f` | FIX | Auto-fix common issues |
| `/pqa:menu` | | Utility | Interactive command palette |

---

## 6. Pipeline Shortcuts

### `/pqa:create` — Upstream Only

Runs movements 1-5 (IDEATE through BUILD) without validation. Use when:
- Rapid prototyping
- Creating a first draft that will be manually reviewed
- Building plugin structure before quality checks

### `/pqa:lifecycle` — Full Pipeline

Runs all 9 movements with all 4 quality gates. Use when:
- Preparing for marketplace submission
- Building production-quality plugins
- Need formal quality assurance

---

## 7. Movement Execution Rules

| Rule | Detail |
|------|--------|
| **Sequential only** | Movements execute in order 1-9; no skipping |
| **Gate before advance** | Must pass the gate before entering the next movement |
| **Max turns enforced** | Each movement has a turn budget; forced stop if exceeded |
| **Artifacts persist** | All outputs written to disk; pipeline can resume after interruption |
| **Single agent per movement** | Only the designated agent works during a movement |
| **Retry limit** | Max 2 retries per gate failure before escalating to user |

---

## 8. Pipeline State Management

The pipeline maintains state across sessions:

```
.pqa/
  state.json            # Current movement, gate status, retry counts
  artifacts/            # Movement outputs organized by movement name
    ideate/
    plan/
    design/
    specify/
    build/
    validate/
    audit/
    report/
    fix/
```

State enables:
- Resume after interruption
- Progress tracking
- Artifact traceability (which movement produced what)

---

## 9. Severity Ratings (VALIDATE/AUDIT)

| Severity | Definition | Impact |
|----------|-----------|--------|
| **CRITICAL** | Blocks plugin usage. Must fix before deployment. | Scorecard dimension = FAIL |
| **WARNING** | Degrades quality. Should fix. | Scorecard dimension = WARN |
| **INFO** | Improvement opportunity. Nice to fix. | No scorecard impact |

---

## 10. MOAT Integration Points

| Pipeline stage | MOAT interaction |
|----------------|------------------|
| SPECIFY | Apply MOAT body rules (imperative, <=500 lines, tables>bullets) |
| SPECIFY | Apply MOAT frontmatter rules (description triggers, allowed-tools) |
| BUILD | Apply MOAT depth level (Minimal/Standard/Full/Deep) |
| VALIDATE | Score all 6 MOAT dimensions (1-10 each) |
| AUDIT | Run 12-item meta-validation gate checklist |
| FIX | Target items that failed MOAT scoring (dimension < 7) |
