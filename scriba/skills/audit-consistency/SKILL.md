---
name: audit-consistency
author: JM Labs
description: >
  Audit cross-unit consistency for progressive complexity, terminological coherence,
  and sequential logic across multiple editorial units. Trigger on: auditoria
  consistencia, cross-unit audit, contradicciones terminologicas, progresion
  complejidad, coherencia editorial. Detects terminology contradictions, validates
  Bloom/Marzano progression curves, and classifies inconsistencies by severity.
  Essential for multi-unit textbook coherence and Gate G3 compliance.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# audit-consistency

> A textbook is not a collection of units — it is a learning journey. Every contradiction, every broken progression, every redefined term is a pothole that derails the student.

## Purpose

Detect and classify cross-unit inconsistencies in terminology, progressive complexity, and sequential logic across the full set of editorial units. This skill exists because individual units can each pass pedagogical review yet collectively contradict each other — a term defined differently in Unit 2 than Unit 5, a complexity curve that regresses, or a concept referenced before it is introduced. These defects are invisible at unit level and catastrophic at textbook level.

## Procedure

1. **Load all generated units** — Read every unit in `project/units/` in sequence order. Build a mental model of the textbook as a continuous learning path, not isolated modules.
2. **Extract terminology inventory** — For each unit, collect every defined term with its definition, first-use location, and context. This inventory is the basis for contradiction detection.
3. **Detect terminological contradictions** — Compare term definitions across units. Flag any term that is defined differently in two or more units (CRITICAL), used before its first definition (WARNING), or silently redefined without acknowledgment (CRITICAL). Terminology contradictions confuse students because they undermine trust in the text as a reliable reference.
4. **Validate progressive complexity curve** — Map the Bloom/Marzano taxonomy levels of activities across units in sequence. The curve should generally ascend (Recordar -> Comprender -> Aplicar -> Analizar -> Evaluar -> Crear). Flag regressions where a later unit operates at a lower level than an earlier unit for the same destreza, because regressions break cognitive scaffolding.
5. **Check sequential logic and prerequisites** — Verify that concepts referenced in Unit N were introduced in Unit N-k (where k >= 1). Flag forward references (using a concept before teaching it) as CRITICAL because students cannot apply what they have not learned.
6. **Detect cross-reference integrity** — Verify that any explicit cross-references between units ("como vimos en la Unidad 2") point to real content that exists and matches the claim.
7. **Classify all findings by severity** — CRITICAL: contradictions, forward references, broken cross-refs. WARNING: complexity regressions, minor redefinitions. INFO: style variations, optional improvements.
8. **Generate consistency audit report** — Produce the structured output with all findings, evidence, and remediation guidance.

## Inputs

| Input | Source | Required | Description |
|-------|--------|----------|-------------|
| All generated units | `project/units/` | Yes | Complete set of editorial units in sequence order |
| Matriz A&S | `project/matriz-as/` | Yes | Expected unit sequence and destreza progression |
| Taxonomy mapping | `references/taxonomy-mapping.md` | No | Bloom/Marzano levels for progression validation |

## Outputs

| Output | Format | Description |
|--------|--------|-------------|
| Terminology contradiction report | Markdown table | Term, conflicting definitions, locations, severity |
| Progression curve analysis | Markdown table + narrative | Per-destreza complexity progression across units |
| Sequential logic report | Markdown table | Forward references, missing prerequisites |
| Cross-reference integrity | Markdown table | Broken or inaccurate inter-unit references |
| Summary dashboard | Statistics block | Findings by type and severity |

## Acceptance Criteria

- Zero CRITICAL findings (contradictions, forward references, broken cross-refs).
- Progressive complexity curve ascends or plateaus — no unjustified regressions.
- Every defined term is consistent across all units where it appears.
- All explicit cross-references verified accurate.
- Audit covers 100% of generated units — no partial scans.

## Output Format

```markdown
## Consistency Audit — [Asignatura] [Grado]

**Summary**: [X] findings | [C] CRITICAL | [W] WARNING | [I] INFO
**Units Audited**: [N] units | **Terms Inventoried**: [M]

### Terminological Contradictions

| # | Term | Unit A Definition | Unit B Definition | Severity | Remediation |
|---|------|-------------------|-------------------|----------|-------------|
| 1 | "ecosistema" | U2: "conjunto de seres vivos y su entorno" | U5: "sistema biologico cerrado" | CRITICAL | Unify to U2 definition; update U5-B1-P3 |

### Progressive Complexity Curve

| Destreza | U1 Level | U2 Level | U3 Level | U4 Level | Trend | Verdict |
|----------|----------|----------|----------|----------|-------|---------|
| DZ-CCNN-5-01 | Recordar | Comprender | Aplicar | Analizar | Ascending | OK |
| DZ-CCNN-5-03 | Aplicar | Comprender | — | Evaluar | Regression U2 | WARNING |

### Sequential Logic — Forward References

| # | Concept | Referenced In | First Taught In | Severity |
|---|---------|--------------|----------------|----------|
| 1 | "fotosintesis" | U1-B3-Act2 | U3-B1-Act1 | CRITICAL: Used 2 units before introduction |

### Cross-Reference Integrity

| # | Source | Claim | Target | Status |
|---|--------|-------|--------|--------|
| 1 | U4-B2-P1 | "como vimos en la Unidad 2" | U2-B3 | OK |
| 2 | U5-B1-P2 | "recuerda la Unidad 3" | U3 — content not found | CRITICAL: Broken reference |

### Remediation Priority

1. **CRITICAL** — Fix all terminological contradictions before Gate G3.
2. **CRITICAL** — Resolve forward references by reordering content or adding prerequisite introductions.
3. **WARNING** — Review complexity regressions; add justification or restructure.
```

## Error Handling

- **Fewer than 2 units found**: Report `ERROR: Cross-unit audit requires at least 2 units. Found [N].`
- **Units not in sequence order**: Attempt to infer order from unit numbering. If ambiguous, halt and request explicit sequence.
- **Matriz A&S not available**: Continue audit without progression validation but log `WARNING: Progression curve cannot be verified without Matriz A&S.`
- **Extremely large unit set (10+)**: Process in batches of 5 with overlap to catch cross-batch issues. Report batch boundaries.

## Anti-Patterns

- **Unit-by-unit review masquerading as cross-unit audit**: Reviewing each unit in isolation and declaring "consistent." Consistency is a relational property — it only exists between units.
- **Terminology spot-checking**: Checking only "obvious" terms instead of building a complete inventory. Contradictions hide in domain-specific vocabulary that seems stable.
- **Ignoring progression regressions**: Accepting a complexity drop between units because "the teacher can adjust." The textbook must provide a coherent scaffolded path regardless of teacher intervention.
- **Skipping cross-reference verification**: Assuming that "como vimos en la Unidad 2" is accurate without verifying. Broken cross-references actively mislead students.

## References

- `references/consistency-audit-patterns.md` — Progression verification rules, terminology contradiction detection, severity classification matrix.
- `references/taxonomy-mapping.md` — Bloom/Marzano levels for progression validation.
- Scriba CLAUDE.md — Quality Gate G3, modelo de datos.
