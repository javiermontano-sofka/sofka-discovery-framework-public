# Movement Design Guide

> Reference for `plan-architecture` skill. How to decompose plugin capabilities into movements.

---

## What Is a Movement?

A movement is a logical phase of work within a plugin. It groups related skills that share a common purpose and can be executed as a unit. Movements provide structure for users and quality gates for the pipeline.

---

## Movement Decomposition Rules

### Rule 1: The "Useful Pause" Test

> Can the user stop after this movement and have something useful?

If yes, it is a valid movement boundary. If stopping here leaves the user with nothing actionable, merge with the next phase.

### Rule 2: The "Artifact Handoff" Test

> Does this movement produce an artifact that the next movement consumes?

If yes, the movements are correctly separated. The artifact defines the interface between them.

### Rule 3: The "Tool Shift" Test

> Do the skills in this group need fundamentally different tools than the next group?

If yes (e.g., read-only analysis vs. write-heavy generation), they belong in different movements.

### Rule 4: The "Independence" Test

> Can these skills run in any order within the group?

If yes, they belong in the same movement. If there is a strict sequence, consider whether sub-movements are needed.

---

## Common Movement Patterns

| Pattern | Movements | Example Plugin |
|---------|-----------|---------------|
| **Analyze-Generate** | ANALYZE, GENERATE | Code generators, template engines |
| **Validate-Fix-Report** | VALIDATE, FIX, REPORT | Linters, QA frameworks |
| **Ideate-Plan-Design-Build** | IDEATE, PLAN, DESIGN, BUILD | Creation pipelines |
| **Discover-Assess-Recommend** | DISCOVER, ASSESS, RECOMMEND | Advisory tools |
| **Ingest-Transform-Output** | INGEST, TRANSFORM, OUTPUT | Data pipelines |

---

## Movement Naming Conventions

- Use UPPERCASE for movement names in documentation.
- Use verb forms: ANALYZE, GENERATE, VALIDATE, REPORT, DESIGN.
- Avoid generic names: PHASE-1, STEP-A, PROCESS (not descriptive).
- Each name should tell the user what outcome the movement produces.

---

## Movement Boundaries and Quality Gates

Every boundary between movements should have a quality gate:

```
MOVEMENT-A
  └── Gate: {criteria}
MOVEMENT-B
  └── Gate: {criteria}
MOVEMENT-C
```

Gate criteria examples:
- "All validation skills pass with zero CRITICAL findings."
- "Architecture plan document exists and has all required sections."
- "User has reviewed and approved the design document."

---

## Anti-Patterns in Movement Design

1. **Single-skill movements** -- If a movement has only one skill, it is not a movement. Merge it.
2. **Circular dependencies** -- Movement A consumes output from Movement C. Restructure.
3. **God movement** -- One movement has 80% of the skills. Decompose it.
4. **Premature splitting** -- Three movements with two skills each. Consolidate into two movements.
