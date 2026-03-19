---
name: repair-alignment
author: JM Labs
description: >
  Fix curriculum alignment gaps and orphaned destrezas found by coverage verification
  to achieve 100% MinEduc standard coverage.
  Trigger on: reparar alineacion, fix coverage, destrezas huerfanas, llenar gaps,
  orphaned destrezas, curriculum gaps.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# repair-alignment

> **An orphaned destreza is a broken promise to the student.** Every curricular standard must trace to content -- 100% coverage is the only acceptable target.

## Purpose

Remediate curriculum alignment gaps identified by `verify-coverage`. Insert, modify, or restructure content so that every MinEduc destreza maps to at least one activity with explicit traceability. Eliminate orphaned destrezas and redundant mappings. Achieve and verify 100% curricular coverage.

## Procedure

1. **Load coverage report**: Read the coverage verification report from `project/reports/`. Extract the list of orphaned destrezas (covered by zero activities) and under-mapped destrezas (covered but below threshold).
2. **Load Matriz A&S**: Read the Alcance y Secuencia matrix to understand intended destreza-to-unit mapping.
3. **Classify gaps**: For each orphaned destreza, determine if the fix requires:
   - **(a) Content insertion**: New activity or section in an existing unit.
   - **(b) Mapping correction**: Activity exists but traceability tag is missing.
   - **(c) Unit restructure**: Destreza belongs in a different unit per the matrix.
4. **Generate content**: For type (a) gaps, draft activities that develop the destreza. Follow Sinapsis structure (Experiencia > Conceptualizacion > Reflexion > Aplicacion). Include traceability tag `[REF: DZ-<asig>-<ano>-<id>]`.
5. **Fix mappings**: For type (b) gaps, insert the correct `[REF: ...]` tag in the existing activity.
6. **Restructure**: For type (c) gaps, move or duplicate content to the correct unit per the matrix.
7. **Consistency check**: Verify inserted content is consistent with surrounding content in tone, complexity, and style.
8. **Re-verify coverage**: Run coverage verification logic on the modified content. Confirm 0 orphaned destrezas remain.
9. **Produce repair log**: Document every change with destreza code, repair type, and location.

## Inputs

| Input | Source | Required |
|-------|--------|----------|
| Coverage verification report | `project/reports/coverage-*.md` | Yes |
| Matriz de Alcance y Secuencia | `project/matrix/` | Yes |
| Unit editorial files | `project/units/` | Yes |
| MinEduc destreza catalog | `references/` or `project/curriculo/` | Yes |

## Outputs

| Output | Format | Destination |
|--------|--------|-------------|
| Updated unit file(s) | MD | `project/units/` (in-place) |
| Alignment repair log | MD table | stdout |
| Updated coverage status | MD summary | stdout |

## Acceptance Criteria

- Zero orphaned destrezas after repair.
- Every inserted activity includes a `[REF: DZ-...]` traceability tag.
- Inserted content follows Sinapsis 4-phase structure.
- No existing content is deleted (only augmented or re-tagged).
- Repair log documents every change with destreza code and repair type.
- Re-verification confirms 100% coverage.

## Output Format

```markdown
## Alignment Repair Log

| Destreza | Repair Type | Unit | Action Taken |
|----------|-------------|------|--------------|
| DZ-MAT-5-14 | Content insertion | U3 | Added activity 3.4: "Fracciones en la vida diaria" |
| DZ-LENG-5-08 | Mapping correction | U2 | Added [REF: DZ-LENG-5-08] to existing activity 2.2 |
| DZ-CCNN-5-22 | Unit restructure | U4->U5 | Moved section 4.6 to U5 per matrix alignment |

### Coverage Status
- Before: 47/52 destrezas covered (90.4%)
- After: 52/52 destrezas covered (100%)
- Orphaned: 0
```

## Error Handling

| Error | Response |
|-------|----------|
| Coverage report not found | Halt. Suggest running `verify-coverage` first. |
| Destreza code not in catalog | Warn. Tag `[SUPUESTO]` on generated content. Flag for curricular-analyst review. |
| Matrix and report contradict | Use matrix as source of truth. Log discrepancy. |
| Unit file is read-only or locked | Halt for that unit. Proceed with others. Report blocked units. |

## Anti-Patterns

- **Phantom coverage**: Adding a traceability tag without actual content that develops the destreza. Tags must map to real activities.
- **Content duplication**: Copying an activity verbatim into a second unit. Adapt to the new unit context.
- **Orphan whack-a-mole**: Fixing one gap while breaking another mapping. Always re-verify after changes.
- **Ignoring the matrix**: Inserting content based on intuition rather than the Alcance y Secuencia matrix.
- **Style mismatch**: Inserting content that does not match the tone and complexity of the surrounding unit.

## References

- `references/alignment-repair-patterns.md` -- Orphan remediation strategies, insertion techniques
- `references/taxonomy-mapping.md` -- Bloom/Marzano levels for activity generation
- `references/priming-rag/rag-curriculum-coverage.md` -- Curricular coverage RAG primer
