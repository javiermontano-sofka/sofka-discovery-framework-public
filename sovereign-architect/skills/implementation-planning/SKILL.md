---
name: implementation-planning
author: JM Labs (Javier Montaño)
description: >
  Phased execution plans with dependencies, checkpoints, rollback strategies, and file change plans.
  Trigger: plan implementation, create phases, design rollback, file change plan.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
---

# Implementation Planning

Translates architecture decisions into actionable, phased execution plans.

## Guiding Principle

> *A plan without rollback is a hope. A plan without checkpoints is a gamble.*

## Procedure

### Step 1 — Phase Decomposition

Break work into phases where each phase:
- Has a clear, testable outcome
- Can be rolled back independently
- Delivers incremental value (where possible)
- Has explicit entry and exit criteria

### Step 2 — Dependency Mapping

```
Phase 1: {Foundation}
  └─→ Phase 2: {Core Implementation}
       ├─→ Phase 3a: {Feature A} (parallel)
       └─→ Phase 3b: {Feature B} (parallel)
            └─→ Phase 4: {Integration + Polish}
```

Identify:
- Sequential dependencies (must happen in order)
- Parallel opportunities (can happen simultaneously)
- Critical path (longest sequential chain)
- Blocking risks (what could stall the entire plan)

### Step 3 — File Change Plan

For each phase, list specific changes:

```markdown
### Phase N: {Name}

**Create:**
- `src/auth/middleware.ts` — JWT validation middleware
- `src/auth/__tests__/middleware.test.ts` — Unit tests

**Modify:**
- `src/app.ts` — Add auth middleware to routes (line ~45)
- `src/config/index.ts` — Add JWT_SECRET config key

**Delete:**
- `src/auth/legacy-auth.ts` — Replaced by new middleware
```

### Step 4 — Checkpoint Design

For each phase boundary:

| Checkpoint | Validation |
|------------|-----------|
| Tests pass | `npm test` exits 0 |
| Build succeeds | `npm run build` exits 0 |
| Behavior preserved | Existing API responses unchanged |
| New behavior works | New endpoints return expected responses |
| No regression | Performance benchmarks within 10% |

### Step 5 — Rollback Strategy

For each phase:
- **How to detect failure**: What signals indicate rollback is needed
- **How to rollback**: Specific git, deploy, or data commands
- **Blast radius**: What's affected if this phase fails
- **Recovery time**: Estimated time to roll back

### Step 6 — Acceptance Criteria

Define "done" for the entire plan:
- Functional criteria (what works)
- Non-functional criteria (how well it works)
- Documentation criteria (what's documented)
- Test criteria (what's tested)

## Quality Criteria

- Every phase has entry/exit criteria
- Every phase has a rollback strategy
- File changes are specific (file paths, not "update the auth module")
- Dependencies are explicit and justified
- Acceptance criteria are testable

## Anti-Patterns

- Big-bang plans with no intermediate checkpoints
- Phases without rollback ("we'll figure it out")
- Vague file changes ("update relevant files")
- Ignoring the critical path
- Planning without knowing the current state
