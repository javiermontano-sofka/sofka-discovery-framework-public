---
name: adapt-dua
author: JM Labs
description: >
  Add or improve DUA (Diseno Universal de Aprendizaje) adaptations in educational content
  to meet the 2+ adaptations per activity requirement across 3 principles.
  Trigger on: adaptaciones DUA, universal design, mejorar accesibilidad, inclusion educativa,
  necesidades especiales, add adaptations.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# adapt-dua

> **Every learner deserves multiple paths to understanding.** DUA is not a checkbox -- it is the architectural guarantee that no student is locked out of learning by a single modality.

## Purpose

Add, enhance, or restructure DUA adaptations so every activity in an editorial unit offers at least 2 adaptations spanning at least 2 of the 3 DUA principles (Representation, Engagement, Action/Expression). Eliminate single-modality bottlenecks and ensure NEE (Necesidades Educativas Especiales) profiles are explicitly addressed.

## Procedure

1. **Inventory**: Read the target unit file. Build a table of every activity with its current DUA adaptations and which principle each covers.
2. **Gap analysis**: Flag activities with fewer than 2 adaptations or covering only 1 principle. Mark activities with zero NEE consideration as critical.
3. **Principle mapping**: For each flagged activity, determine which DUA principle(s) are missing. Consult `references/dua-adaptation-patterns.md` for pattern options.
4. **Generate adaptations**: Write 2-3 concrete adaptations per gap. Each adaptation must name the principle, the modality, and the target NEE profile (visual, auditory, motor, cognitive, TEA, TDAH).
5. **Embed in content**: Insert adaptations directly into the activity block using the Sinapsis section markers. Preserve existing pedagogical content verbatim.
6. **Cross-check coverage**: Verify every activity now has >= 2 adaptations covering >= 2 principles. Produce a summary coverage table.
7. **Validate NEE spread**: Confirm at least 3 distinct NEE profiles are addressed across the unit.

## Inputs

| Input | Source | Required |
|-------|--------|----------|
| Unit editorial file (MD/JSON) | `project/units/` | Yes |
| DUA audit report (if exists) | `project/reports/` | No |
| NEE profile list | `references/dua-adaptation-patterns.md` | Yes |
| Existing adaptation inventory | Extracted from unit file | Yes |

## Outputs

| Output | Format | Destination |
|--------|--------|-------------|
| Updated unit file with DUA adaptations | MD | `project/units/` (in-place) |
| DUA coverage summary table | MD table | Appended to unit or printed to stdout |
| Changelog of adaptations added | Bullet list | stdout |

## Acceptance Criteria

- Every activity has >= 2 DUA adaptations.
- Every activity covers >= 2 of the 3 DUA principles.
- At least 3 distinct NEE profiles are addressed per unit.
- No existing pedagogical content is altered or deleted.
- Each adaptation specifies: principle, modality, and target NEE profile.
- Coverage summary table is produced with zero flags remaining.

## Output Format

```markdown
## DUA Coverage Summary

| Activity | Adaptations | Principles Covered | NEE Profiles | Status |
|----------|-------------|--------------------|--------------|--------|
| Act 1.1  | 3           | R, E               | Visual, TDAH | PASS   |
| Act 1.2  | 2           | R, A/E             | Motor, TEA   | PASS   |

### Changelog
- Act 1.1: Added auditory representation (audio description of diagram) [Principle: Representation, NEE: Visual]
- Act 1.2: Added motor-friendly expression option (voice-to-text) [Principle: Action/Expression, NEE: Motor]
```

## Error Handling

| Error | Response |
|-------|----------|
| Unit file not found | Halt. Print path checked and ask user to verify. |
| Activity has no identifiable structure | Warn. List unparseable sections. Proceed with parseable ones. |
| NEE profile not in reference list | Use closest match. Tag with `[SUPUESTO]` and flag for human review. |
| All 3 principles already covered | Skip activity. Log as already compliant. |

## Anti-Patterns

- **Decorative adaptations**: Adding "use colors" without specifying how it serves a NEE profile. Every adaptation must be functional.
- **Principle stuffing**: Adding 3 weak adaptations just to hit the number. Quality over quantity.
- **Copy-paste adaptations**: Reusing identical adaptations across all activities. Each must be contextually relevant.
- **Ignoring existing content**: Overwriting author content to "improve" DUA. Preserve original, augment alongside.
- **NEE tunnel vision**: Only addressing visual impairment. Spread across cognitive, motor, auditory, TEA, TDAH.

## References

- `references/dua-adaptation-patterns.md` -- DUA principles, adaptation examples, NEE profiles
- `references/priming-rag/rag-dua-inclusion.md` -- RAG primer for DUA and inclusion
- `references/taxonomy-mapping.md` -- Bloom/Marzano levels for activity complexity
