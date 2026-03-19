---
name: verify-coverage
author: JM Labs
description: >
  Verify 100% curriculum destreza coverage with full traceability from MinEduc
  standards to editorial content. Trigger on: verificar cobertura, coverage check,
  destrezas huerfanas, orphan check, curriculum traceability, alineacion curricular.
  Scans all generated units for DZ-ref tags, cross-references against Matriz A&S,
  identifies orphaned destrezas, and produces a coverage dashboard with gap analysis.
  Essential quality gate for G1 Alineamiento Pedagogico compliance.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# verify-coverage

> Every destreza without a traced activity is a student left behind. Coverage is not a metric — it is a promise.

## Purpose

Guarantee that every MinEduc destreza appears in at least one editorial activity with a valid `[REF: DZ-*]` tag, producing an auditable coverage dashboard. This skill exists because partial curriculum coverage is the single highest-risk defect in K-12 textbooks — it means students miss mandated learning outcomes and the editorial product fails regulatory review.

## Procedure

1. **Load the Matriz A&S** — Read the validated scope-and-sequence matrix to extract the canonical destreza list. This is the single source of truth; without it, coverage verification has no baseline.
2. **Scan all units for DZ-ref tags** — Use Grep to find every `[REF: DZ-<asig>-<ano>-<id>]` pattern across generated units. Collect file path, line number, and surrounding context for each hit.
3. **Build the coverage map** — Create a destreza-to-activity mapping. Each destreza must map to at least one activity. Record the unit, block, and activity where each destreza appears.
4. **Identify orphaned destrezas** — Any destreza in the Matriz A&S with zero matched activities is orphaned. Flag these with severity CRITICAL because they represent curriculum gaps.
5. **Detect duplicate coverage** — Identify destrezas covered in 3+ activities across units. While not an error, excessive duplication may signal redundancy worth reviewing.
6. **Verify inserciones curriculares** — Confirm that cross-curricular insertions (educacion ambiental, interculturalidad, etc.) are present where required by MinEduc policy.
7. **Generate coverage dashboard** — Produce the structured output with per-destreza status, gap list, and summary statistics.

## Inputs

| Input | Source | Required | Description |
|-------|--------|----------|-------------|
| Matriz A&S | `project/matriz-as/` | Yes | Validated scope-and-sequence matrix with canonical destreza list |
| Generated units | `project/units/` | Yes | All editorial units with DZ-ref tags embedded |
| MinEduc destreza catalog | `references/` or Matriz | Yes | Official destreza codes for the subject and grade |

## Outputs

| Output | Format | Description |
|--------|--------|-------------|
| Coverage dashboard | Markdown table | Per-destreza status: COVERED, ORPHAN, OVER-COVERED |
| Orphan destreza list | Bullet list | Destrezas with zero activity mappings, severity CRITICAL |
| Coverage summary | Statistics block | Total destrezas, covered count, coverage percentage, orphan count |
| Duplicate report | Markdown table | Destrezas with 3+ mappings for redundancy review |

## Acceptance Criteria

- 100% destreza coverage — zero orphaned destrezas.
- Every coverage entry traces to a specific unit, block, and activity.
- Inserciones curriculares verified present where MinEduc requires them.
- Dashboard is machine-parseable (consistent Markdown table format).
- All DZ-ref tags follow the canonical format `[REF: DZ-<asig>-<ano>-<id>]`.

## Output Format

```markdown
## Coverage Dashboard — [Asignatura] [Grado]

**Summary**: [X]/[Y] destrezas covered ([Z]%) | [N] orphans | [M] over-covered

### Coverage Map

| DZ-Ref | Destreza Description | Status | Unit(s) | Activity Count |
|--------|---------------------|--------|---------|----------------|
| DZ-LENG-5-01 | [description] | COVERED | U1, U3 | 2 |
| DZ-LENG-5-02 | [description] | ORPHAN | — | 0 |
| DZ-LENG-5-03 | [description] | OVER-COVERED | U1, U2, U3, U4 | 5 |

### Orphaned Destrezas (CRITICAL)

- **DZ-LENG-5-02**: [description] — No activity found in any unit.

### Inserciones Curriculares

| Insercion | Required | Found | Status |
|-----------|----------|-------|--------|
| Educacion ambiental | Yes | U2-B3 | OK |

### Over-Coverage Report

| DZ-Ref | Activity Count | Units | Recommendation |
|--------|---------------|-------|----------------|
| DZ-LENG-5-03 | 5 | U1, U2, U3, U4 | Review for redundancy |
```

## Error Handling

- **Matriz A&S not found**: Halt and report `ERROR: Cannot verify coverage without Matriz A&S. Run /scriba:matrix first.`
- **No DZ-ref tags found in units**: Halt and report `ERROR: No DZ-ref tags detected. Units may not have been generated with traceability enabled.`
- **Malformed DZ-ref tags**: Log each malformed tag with file and line number. Continue scanning but flag as WARNING.
- **Matriz contains duplicate destreza codes**: Log WARNING and deduplicate before building coverage map.

## Anti-Patterns

- **Counting without tracing**: Reporting "100% coverage" by counting destreza mentions in prose rather than verifying explicit DZ-ref tags. Coverage requires structural traceability, not keyword matching.
- **Ignoring inserciones**: Skipping cross-curricular insertion verification because they are "optional." MinEduc mandates them.
- **Silent orphans**: Burying orphaned destrezas in a footnote instead of flagging them as CRITICAL blockers for Gate 1.
- **Partial scan**: Scanning only the first or last unit instead of all generated units.

## References

- `references/coverage-verification-patterns.md` — DZ-ref scanning patterns, orphan detection logic, coverage dashboard template.
- `references/priming-rag/rag-curriculum-coverage.md` — MinEduc curriculum structure primer.
- Scriba CLAUDE.md — Modelo de datos, formato trazabilidad, Quality Gate G1.
