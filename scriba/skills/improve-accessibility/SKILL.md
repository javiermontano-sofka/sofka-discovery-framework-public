---
name: improve-accessibility
author: JM Labs
description: >
  Enhance content accessibility by reducing cognitive load and improving readability
  to achieve comprehensibility scores above 85%.
  Trigger on: mejorar accesibilidad, simplificar contenido, reducir carga cognitiva,
  improve readability, accessibility enhancement.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# improve-accessibility

> **If a student cannot parse the sentence, the pedagogy inside it is invisible.** Accessibility is not dumbing down -- it is removing the friction between the learner and the concept.

## Purpose

Reduce cognitive load and improve readability of editorial content so that comprehensibility scores reach or exceed 85%. Target flagged fragments from the student-simulator report. Apply sentence simplification, vocabulary substitution, and scaffolding insertion while preserving pedagogical precision and curricular alignment.

## Procedure

1. **Read report**: Load the comprehensibility report from `project/reports/`. Identify all fragments scored below 85%.
2. **Rank by severity**: Sort flagged fragments by score ascending. Process the lowest-scoring fragments first.
3. **Sentence analysis**: For each fragment, measure sentence length (words), subordinate clause depth, and technical term density.
4. **Simplify sentences**: Break sentences exceeding 25 words into 2+ shorter sentences. Eliminate unnecessary subordination. Keep one idea per sentence.
5. **Substitute vocabulary**: Replace non-essential technical terms with age-appropriate synonyms. Preserve curricular terms that students must learn -- add inline definitions for those instead.
6. **Insert scaffolding**: Add transitional phrases, advance organizers, or brief context sentences before complex passages. Use the patterns in `references/accessibility-improvement-patterns.md`.
7. **Verify coherence**: Re-read modified passages to confirm logical flow is maintained and no meaning is lost.
8. **Re-score**: Run the modified content through the student-simulator scoring logic. Confirm all fragments now score >= 85%.
9. **Produce changelog**: List every modification with before/after and the readability impact.

## Inputs

| Input | Source | Required |
|-------|--------|----------|
| Comprehensibility report | `project/reports/comprehensibility-*.md` | Yes |
| Unit editorial file | `project/units/` | Yes |
| Vocabulary substitution rules | `references/accessibility-improvement-patterns.md` | Yes |
| Student-simulator scoring logic | Agent `student-simulator` | Yes |

## Outputs

| Output | Format | Destination |
|--------|--------|-------------|
| Updated unit file | MD | `project/units/` (in-place) |
| Accessibility changelog | MD bullet list | stdout |
| Before/after score comparison | MD table | stdout |

## Acceptance Criteria

- All previously-flagged fragments score >= 85% comprehensibility.
- No sentence exceeds 30 words after modification.
- Curricular terms are preserved with inline definitions where simplified.
- No pedagogical meaning is altered (content integrity check).
- Changelog documents every change with before/after text.
- Overall unit average comprehensibility >= 85%.

## Output Format

```markdown
## Accessibility Improvement Report

### Score Comparison
| Fragment | Before | After | Delta |
|----------|--------|-------|-------|
| P3-S2    | 62%    | 88%   | +26   |
| P5-S1    | 71%    | 91%   | +20   |

### Changelog
- P3-S2: Split 42-word sentence into 2 sentences (19 + 21 words). Replaced "yuxtaposicion" with "colocacion lado a lado".
- P5-S1: Added advance organizer before technical definition. Replaced nested clause with sequential structure.

### Overall: 72% -> 89% (+17 points)
```

## Error Handling

| Error | Response |
|-------|----------|
| Comprehensibility report not found | Halt. Print expected path. Suggest running `validate-comprehensibility` first. |
| Fragment reference cannot be located in unit | Warn. Log the orphaned reference. Proceed with remaining fragments. |
| Simplification drops score (regression) | Revert change. Try alternative simplification strategy. Log the attempt. |
| Curricular term has no suitable synonym | Keep original term. Add parenthetical definition. Tag `[PEDAGOGIA]`. |

## Anti-Patterns

- **Meaning erasure**: Simplifying so aggressively that the pedagogical point is lost. Always re-read for meaning preservation.
- **Synonym roulette**: Replacing terms with near-synonyms that shift meaning. Verify semantic equivalence.
- **Scaffolding bloat**: Adding so many transitions and organizers that the text doubles in length. Keep scaffolding lean.
- **Ignoring report data**: Making ad-hoc changes instead of targeting the specific flagged fragments. Follow the report.
- **Grade-level mismatch**: Using vocabulary appropriate for a different grade. Check target grade level.

## References

- `references/accessibility-improvement-patterns.md` -- Simplification techniques, vocabulary rules, scaffolding patterns
- `references/priming-rag/rag-cognitive-load.md` -- Cognitive load theory primer
- `references/voice-manual-rules.md` -- Sinapsis voice manual for tone preservation
