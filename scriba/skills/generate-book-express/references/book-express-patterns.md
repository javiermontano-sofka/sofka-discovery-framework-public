# Book Express Patterns — Pipeline Orchestration

## Pipeline Phases and Gates

```
Phase 1: INGESTA ──[G0: Matrix valid]──>
Phase 2: GENERACION ──[G1: Units generated]──>
Phase 3: VALIDACION ──[G1.5: All thresholds pass]──>
Phase 4: REPARACION (if needed) ──[G1.5 retry]──>
Phase 5: AUDITORIA ──[G2: Consistency verified]──>
Phase 6: EXPORTACION ──[G3: Files generated]──>
Phase 7: REPORTE
```

## Gate Definitions

| Gate | Name | Pass Criteria | Fail Action |
|------|------|--------------|-------------|
| G0 | Matrix Valid | 100% destreza coverage, correct grade mapping | Halt, report missing destrezas |
| G1 | Units Generated | All N units have complete Sinapsis structure | Retry failed units (max 3) |
| G1.5 | Validation Pass | Comprensibilidad >85%, 0 style violations, DZ coverage 100% | Trigger repair skills |
| G2 | Consistency Verified | No cross-unit contradictions, progression logical | Flag issues for manual review |
| G3 | Export Complete | DOCX and HTML files generated and valid | Provide markdown fallback |

## Express vs Complete Mode

| Aspect | Express | Complete |
|--------|---------|----------|
| Themes per unit | 1 (representative) | All (full curriculum) |
| Validation depth | 1 student profile | 3 student profiles |
| DUA adaptations | 1 per activity | 2+ per activity |
| Export formats | DOCX only | DOCX + HTML |
| Estimated time | 15-30 min | 60-120 min |
| Recommended level | WARM+ | HOT+ |

## Parallel Execution Strategy

Within Phase 2, units are independent and can be generated in parallel:
```
Unit 1 ──> generate-unit + generate-guide + generate-rubric
Unit 2 ──> generate-unit + generate-guide + generate-rubric
Unit N ──> generate-unit + generate-guide + generate-rubric
```

Phase 3 validation runs per unit but can also parallelize:
```
Unit 1 ──> validate + verify-coverage + review-style
Unit 2 ──> validate + verify-coverage + review-style
```

Phase 5 audit is sequential (needs all units for cross-unit analysis).

## Failure Recovery

| Failure Type | Recovery Strategy |
|-------------|-------------------|
| Matrix incomplete | Re-run generate-matrix with broader curriculum source |
| Unit generation fails | Retry with simplified parameters, fallback to express depth |
| Validation <85% | Trigger repair-style, repair-alignment, retry validation |
| Consistency issues | Generate cross-unit changelog, flag for human review |
| Export fails | Provide raw markdown as fallback, diagnose python-docx/HTML issue |
| Session interrupted | Load session-state.json, resume from last completed phase |

## Session State for Pipeline

```json
{
  "pipeline": "book-express",
  "asignatura": "Ciencias Naturales",
  "grado": "5to EGB",
  "mode": "express",
  "num_units": 6,
  "current_phase": 2,
  "units_status": {
    "unit_1": "generated",
    "unit_2": "generating",
    "unit_3": "pending"
  },
  "gates": {
    "G0": "passed",
    "G1": "in_progress",
    "G1.5": "pending",
    "G2": "pending",
    "G3": "pending"
  }
}
```
