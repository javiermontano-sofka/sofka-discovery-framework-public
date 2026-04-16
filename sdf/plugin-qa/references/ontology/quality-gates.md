# PQA Quality Gates

> 4 hard stops between upstream movements. No shortcuts.

## Gates

| Gate | Position | Criteria |
|------|----------|----------|
| G1 | IDEATE -> PLAN | User approves concept brief: purpose, target users, differentiation clear |
| G2 | PLAN -> DESIGN | User approves architecture plan and MOAT strategy: agents, skills, movements defined |
| G3 | DESIGN -> SPECIFY | User approves component designs: procedures, quality criteria, anti-patterns complete |
| G4 | SPECIFY -> BUILD | User approves spec packages: MOAT assets, command definitions, cross-refs validated |

## Rules

1. Each gate is a **hard stop**. The pipeline pauses for explicit user approval.
2. No movement may begin until the preceding gate passes.
3. Gate approval is binary: PASS or REVISE. No partial passes.
4. If a gate fails, return to the previous movement for revision.
5. Downstream movements (VALIDATE through FIX) have no gates -- they execute sequentially.

## Gate Evidence Requirements

| Gate | Minimum Evidence |
|------|-----------------|
| G1 | Problem statement, 3+ use cases, overlap analysis |
| G2 | Agent roster, skill list with MOAT depth, movement boundaries |
| G3 | Procedure steps, quality criteria (5+), anti-patterns (3+), edge cases (3+) |
| G4 | Complete SKILL.md content, MOAT asset manifests, command frontmatter |

---
*PQA v3.0 — Gates are non-negotiable.*
