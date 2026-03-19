---
name: fix-terminology
author: JM Labs
description: >
  Resolve terminological contradictions and inconsistencies across editorial units
  by unifying terms and updating the editorial glossary.
  Trigger on: fix terminology, corregir terminologia, inconsistencia terminologica,
  glossary conflict, unificar terminos, contradicciones.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# fix-terminology

> **A term that means two things means nothing.** Terminological consistency is the contract between text and reader. Break it, and comprehension collapses.

## Purpose

Resolve terminological contradictions, inconsistencies, and synonymic drift across editorial units. Unify terms to a single canonical form per concept. Update the editorial glossary to reflect resolved terms. Ensure every instance of a concept uses the same term throughout the editorial product.

## Procedure

1. **Load terminology report**: Read the consistency audit or terminology report from `project/reports/`. Extract all flagged contradictions (term A vs. term B for same concept, with locations).
2. **Load glossary**: Read the current editorial glossary from `project/glossary/` or `references/`.
3. **Select preferred term**: For each contradiction, determine the canonical term using this priority:
   - (a) MinEduc official curriculum term (highest priority).
   - (b) Glossary-established term.
   - (c) Most frequent usage in existing content.
   - (d) Clearest term for the target grade level.
4. **Build substitution map**: Create a find-replace map: `{deprecated_term -> canonical_term}` for each resolved contradiction.
5. **Apply substitutions**: Execute replacements across all affected unit files. Use exact-match replacement to avoid partial-word substitutions.
6. **Context verification**: For each substitution, verify the sentence still reads correctly. Some terms may need article/preposition adjustments (e.g., "el ecosistema" vs. "la biodiversidad").
7. **Update glossary**: Add or update entries in the editorial glossary for every resolved term. Include the canonical term, definition, deprecated synonyms, and source.
8. **Re-audit**: Scan all units for remaining contradictions. Confirm zero unresolved terminological conflicts.
9. **Produce unification report**: Document every resolution with deprecated term, canonical term, source, and affected locations.

## Inputs

| Input | Source | Required |
|-------|--------|----------|
| Terminology/consistency report | `project/reports/terminology-*.md` or `audit-*.md` | Yes |
| Editorial glossary | `project/glossary/` | Yes |
| Unit editorial files | `project/units/` | Yes |
| MinEduc curriculum terms | `project/curriculo/` or `references/` | No |

## Outputs

| Output | Format | Destination |
|--------|--------|-------------|
| Updated unit files | MD | `project/units/` (in-place) |
| Updated glossary | MD/JSON | `project/glossary/` (in-place) |
| Terminology unification report | MD table | stdout |

## Acceptance Criteria

- Zero unresolved terminological contradictions after repair.
- Every deprecated term is replaced with the canonical term in all units.
- Glossary is updated with canonical terms, definitions, and deprecated synonyms.
- No partial-word substitutions (e.g., "celula" must not affect "unicelular").
- Grammatical correctness is maintained after every substitution.
- Unification report documents every resolution with rationale.

## Output Format

```markdown
## Terminology Unification Report

| # | Deprecated Term | Canonical Term | Source | Occurrences Fixed | Units Affected |
|---|----------------|----------------|--------|-------------------|----------------|
| 1 | "ser vivo" / "organismo" | "ser vivo" | MinEduc DZ-CCNN-5-03 | 14 | U1, U3, U5 |
| 2 | "suma" / "adicion" | "adicion" | Glossary v2.1 | 8 | U2, U4 |
| 3 | "grafico" / "diagrama" | "diagrama" | Frequency (23 vs 7) | 7 | U1, U2 |

### Glossary Updates: 3 entries added/modified
### Remaining Contradictions: 0
```

## Error Handling

| Error | Response |
|-------|----------|
| Terminology report not found | Halt. Suggest running `audit-consistency` first. |
| No glossary file exists | Create a new glossary file. Log as `[SUPUESTO]` pending editorial review. |
| MinEduc term conflicts with glossary term | MinEduc term takes priority. Log the override. Update glossary. |
| Substitution creates grammatical error | Apply manual article/preposition adjustment. Log the special case. |
| Term appears in a proper noun or title | Skip substitution for proper nouns. Log as exception. |

## Anti-Patterns

- **Partial-word replacement**: Replacing "celula" inside "unicelular" or "intracelular". Always use whole-word matching.
- **Frequency bias**: Choosing the most common term when MinEduc mandates a different one. Official terms override frequency.
- **Silent replacement**: Replacing terms without documenting the change. Every substitution must appear in the report.
- **Glossary neglect**: Fixing terms in content but not updating the glossary. Both must be synchronized.
- **Over-unification**: Merging terms that are actually distinct concepts (e.g., "clima" vs. "tiempo atmosferico"). Verify semantic equivalence before unifying.

## References

- `references/terminology-fix-patterns.md` -- Unification workflow, glossary format, contradiction patterns
- `references/voice-manual-rules.md` -- Terminology rules from the Manual de Voz Sinapsis
- `references/priming-rag/rag-voice-manual.md` -- Voice manual RAG primer
