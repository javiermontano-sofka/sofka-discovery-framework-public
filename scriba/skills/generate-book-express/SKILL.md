---
name: generate-book-express
author: JM Labs
description: >
  Generate a complete educational book in express mode — full pipeline from curriculum matrix through validated units to exportable outputs. Orchestrates matrix, unit, guide, validation, and export skills in sequence. Trigger on: libro express, crear libro, book express, libro completo, generar libro, full book, editorial pipeline.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
---

# Generar Libro Express

> A complete book is not a collection of chapters — it's a coherent learning journey. Express mode compresses the pipeline without skipping quality.

## Purpose

Orchestrate the complete SOAP pipeline to generate a full educational book: matrix -> units -> guides -> validation -> consistency audit -> export. Express mode generates 1 theme per unit for rapid prototyping; complete mode generates all themes.

## Procedure

1. Collect parameters: asignatura, grado, number of units, depth (express/complete).

2. **Phase 1 — Ingesta**: Activate `generate-matrix` for the selected subject/grade.
   Verify 100% destreza coverage. Distribute destrezas across units.

3. **Phase 2 — Generacion** (parallel per unit):
   For each unit, launch in parallel:
   - `generate-unit` with assigned destrezas
   - `generate-teacher-guide` with unit content
   - `generate-rubric` for each unit's indicators

4. **Phase 3 — Validacion** (per unit):
   - `validate-comprehensibility` with 3 student profiles (>85%)
   - `verify-coverage` to confirm destreza traceability
   - `review-style` against Manual de Voz

5. **Phase 4 — Reparacion** (if needed):
   For any validation failure, activate the corresponding REPAIR skill.
   Re-validate until all thresholds pass.

6. **Phase 5 — Auditoria**:
   `audit-consistency` across all units (progression, terminology, logic).

7. **Phase 6 — Exportacion**:
   - `export-docx` -> texto alumno + guia docente
   - `export-html-ebook` -> interactive ebook

8. **Phase 7 — Reporte**:
   Generate final dashboard with all metrics.

## Inputs

| Name | Source | Required |
|------|--------|----------|
| Asignatura | User input | Yes |
| Grado | User input | Yes |
| Num. unidades | User input (default: 6) | Yes |
| Nivel profundidad | User input (express/complete) | Yes |
| Priming RAG files | references/priming-rag/ | Recommended |

## Outputs

| Artifact | Format | Destination |
|----------|--------|-------------|
| Matriz A&S | Markdown/JSON | matrices/ |
| Unidades editoriales | Markdown | units/ |
| Guias docentes | Markdown | guides/ |
| Texto alumno | DOCX | exports/ |
| Guia docente | DOCX | exports/ |
| Ebook | HTML | exports/ |
| Reporte de validacion | Markdown | reports/ |

## Acceptance Criteria

- 100% destreza coverage across all units
- Comprensibilidad >85% per unit (3 profiles)
- 0 style violations residual
- Cross-unit consistency verified
- DOCX and HTML exports generated
- Evidence tags in all content

## Output Format

```markdown
# Libro Express — {Asignatura} {Grado}

## Dashboard Final
| Metrica | Valor |
|---------|-------|
| Unidades | N/N generadas |
| Comprensibilidad promedio | N% |
| Cobertura curricular | 100% |
| Gates pasados | G0, G1, G1.5, G2, G3 |
| Archivos exportados | texto.docx, guia.docx, ebook.html |

## Archivos Generados
- exports/{asig}_{grado}_texto_alumno.docx
- exports/{asig}_{grado}_guia_docente.docx
- exports/{asig}_{grado}_ebook.html
- reports/validation_report.md
```

## Error Handling

- Matrix generation fails: Halt pipeline, report missing curriculum data, suggest /scriba:prime
- Unit generation partial failure: Continue with successful units, mark failed units for retry
- Validation below threshold: Trigger repair cycle (max 3 iterations per unit)
- Export fails: Provide markdown fallback, report export error with diagnostics
- Session interrupted mid-pipeline: Save state to session-state.json for resume

## Anti-Patterns

- Don't skip validation in express mode — express reduces CONTENT scope, not QUALITY gates
- Don't generate all units sequentially when parallel is possible
- Don't proceed to export without passing all gates
- Don't overwrite existing exports without user confirmation
- Don't attempt complete mode without HOT or DEEP calibration level

## References

- `references/book-express-patterns.md` — Pipeline orchestration patterns and gate definitions
