---
name: auto-calibrate
author: JM Labs
description: >
  Auto-calibrate Scriba session by detecting available documents, calculating priming level (COLD/WARM/HOT/DEEP), and restoring session state. Trigger on: calibrar, calibration, session state, detectar documentos, priming level, entorno, environment check.
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash
---

# Auto-Calibracion del Entorno Scriba

> Before creating content, understand what knowledge is available. Calibration transforms blind generation into informed generation.

## Purpose

Detect all accessible documents in the working directory, calculate the priming level of the session, restore previous session state if available, and recommend next actions based on the current calibration level.

## Procedure

1. Scan working directory recursively for documents by type:
   - PDFs (curriculum, textbooks, guides, inserts)
   - HTMLs (deliverables, specifications, reports)
   - Markdown (notes, transcriptions, prior outputs)
   - Images (taxonomy diagrams, illustrations)
   - Word/Excel (templates, drafts)
   Report count by type and classify by domain.

2. Check for existing session state:
   - Read `session-state.json` if exists -> restore phase, gates, active skills
   - Read `calibration-digest.md` if exists -> restore priming level
   - Read `session-changelog.md` if exists -> restore action history

3. Calculate calibration level:
   - COLD (0 priming files active): No domain knowledge loaded. Suggest /scriba:init or auto-prime.
   - WARM (1-2 priming files): Express mode viable, no deep discovery.
   - HOT (3-5 priming files): Full pipeline viable.
   - DEEP (6+ priming files + client docs processed): Optimal for all modes.

4. Write/update `calibration-digest.md` with:
   - Timestamp, calibration level, documents detected, priming files active
   - Coverage by domain (curriculo, editorial, pedagogia, neurociencia)
   - Gaps identified (domains without priming)
   - Recommendations for next steps

5. Present calibration report to user.

## Inputs

| Name | Source | Required |
|------|--------|----------|
| Working directory | Current directory | Yes |
| session-state.json | Previous session | No |
| calibration-digest.md | Previous calibration | No |

## Outputs

| Artifact | Format | Destination |
|----------|--------|-------------|
| Calibration report | Console output | User |
| calibration-digest.md | Markdown | Working directory |
| session-state.json | JSON | Working directory |

## Acceptance Criteria

- All files in working directory scanned and classified
- Calibration level correctly calculated
- Previous session state restored if available
- Recommendations actionable and specific

## Output Format

```markdown
# Calibracion Scriba — {TIMESTAMP}

## Nivel: {COLD|WARM|HOT|DEEP}

## Documentos Detectados
| Tipo | Cantidad | Dominios |
|------|----------|----------|
| PDF | N | curriculo, textbook, inserts |
| HTML | N | deliverables, specs |
| MD | N | notes, outputs |

## Priming Activo
- rag-curriculo-ecuatoriano.md [LOADED]
- rag-estructura-editorial.md [LOADED]
- (etc.)

## Gaps
- {domain sin cobertura}

## Recomendacion
{Siguiente paso sugerido}
```

## Error Handling

- If no documents found: Report COLD level, suggest uploading/copying client materials.
- If session-state.json is corrupted: Create fresh session, warn user.
- If working directory is read-only: Report error, suggest alternative location.

## Anti-Patterns

- Don't skip calibration on session resume — state may have changed since last session.
- Don't report DEEP level if priming files exist but are empty or outdated.
- Don't scan directories outside the working directory without explicit user permission.
- Don't overwrite session-state.json without backing up the previous version.

## References

- `references/calibration-patterns.md` — State machine definition (COLD->WARM->HOT->DEEP)
