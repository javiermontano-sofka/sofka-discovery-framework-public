---
name: repair-style
author: JM Labs
description: >
  Fix editorial style violations identified in style review changelog while preserving
  pedagogical content integrity.
  Trigger on: reparar estilo, fix style, corregir voz, repair tone,
  resolve style issues, aplicar correcciones.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# repair-style

> **Style is pedagogy made audible.** A mismatched tone breaks trust with the student. Every correction must fix the voice without silencing the message.

## Purpose

Apply corrections to editorial style violations documented in the style review changelog. Resolve tone inconsistencies, voice deviations, register mismatches, and formatting violations per the Manual de Voz Sinapsis. Preserve pedagogical content and curricular alignment throughout all corrections.

## Procedure

1. **Load changelog**: Read the style review changelog from `project/reports/style-review-*.md`. Parse each violation entry (location, violation type, severity, suggested fix).
2. **Load voice manual**: Read `references/voice-manual-rules.md` for authoritative style rules.
3. **Prioritize**: Sort violations by severity (critical > major > minor). Process critical violations first.
4. **Apply corrections**: For each violation:
   - Read the original passage in the unit file.
   - Apply the correction per the suggested fix or voice manual rule.
   - Verify the pedagogical meaning is unchanged by comparing before/after.
5. **Residual scan**: After all corrections, scan the full unit for residual violations that may have been missed in the original review or introduced by corrections.
6. **Meaning integrity check**: Re-read every modified passage. Confirm no curricular term, destreza reference, or pedagogical instruction was altered.
7. **Produce repair report**: List every correction with before/after text, rule applied, and integrity status.

## Inputs

| Input | Source | Required |
|-------|--------|----------|
| Style review changelog | `project/reports/style-review-*.md` | Yes |
| Unit editorial file | `project/units/` | Yes |
| Manual de Voz Sinapsis | `references/voice-manual-rules.md` | Yes |
| Destreza reference tags | Embedded in unit file | Yes |

## Outputs

| Output | Format | Destination |
|--------|--------|-------------|
| Updated unit file | MD | `project/units/` (in-place) |
| Style repair report | MD table + bullet list | stdout |
| Residual violation list (if any) | MD bullet list | stdout |

## Acceptance Criteria

- All violations from the changelog are addressed (fixed or justified as false positive).
- Zero residual critical or major violations after repair.
- No pedagogical content is altered (meaning preservation verified).
- No traceability tags `[REF: DZ-...]` are modified or removed.
- Repair report includes before/after for every correction.
- Voice and tone are consistent across the entire unit post-repair.

## Output Format

```markdown
## Style Repair Report

### Corrections Applied
| # | Location | Violation | Rule | Before | After | Integrity |
|---|----------|-----------|------|--------|-------|-----------|
| 1 | P2-S3 | Informal register | VM-04 | "ojo que esto es clave" | "es importante considerar" | OK |
| 2 | P5-S1 | Passive voice | VM-12 | "fue observado por los estudiantes" | "los estudiantes observaron" | OK |

### Residual Violations: 0
### Corrections: 12 applied / 1 false positive (justified)
```

## Error Handling

| Error | Response |
|-------|----------|
| Style changelog not found | Halt. Suggest running `review-style` first. |
| Violation location does not match unit content | Warn. Log as stale reference. Skip and continue. |
| Correction would alter a curricular term | Do not apply. Log as "requires manual review". Tag `[SUPUESTO]`. |
| Voice manual rule is ambiguous for this case | Apply best interpretation. Tag `[INFERENCIA]`. Flag for style-corrector review. |

## Anti-Patterns

- **Meaning drift**: Changing a sentence's style and accidentally changing its pedagogical meaning. Always compare before/after semantically.
- **Over-correction**: Rewriting entire paragraphs when only one phrase violates. Minimize the edit surface.
- **Rule stacking**: Applying multiple contradictory rules to the same passage. Use rule priority from the voice manual.
- **Ignoring context**: Applying formal register rules to a section intentionally written in student-friendly informal tone (e.g., "Ponte pilas").
- **Blind automation**: Applying suggested fixes without reading the surrounding context. Each fix needs contextual judgment.

## References

- `references/style-repair-patterns.md` -- Correction workflow, meaning preservation rules
- `references/voice-manual-rules.md` -- Manual de Voz Sinapsis (authoritative rules)
- `references/priming-rag/rag-voice-manual.md` -- Voice manual RAG primer
