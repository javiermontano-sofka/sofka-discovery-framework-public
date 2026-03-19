---
name: review-style
author: JM Labs
description: >
  Review and correct text against Manual de Voz Sinapsis editorial style rules
  and ortotipographic conventions. Trigger on: revision estilo, style review,
  voice manual, tono editorial, correccion ortotipografica, consistencia editorial.
  Produces a changelog with rule citation per correction, enforces grade-appropriate
  vocabulary, and ensures tonal consistency across all units. Gate G2 prerequisite.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# review-style

> A textbook that speaks with an inconsistent voice teaches students to distrust the text. Style is not decoration — it is pedagogical clarity.

## Purpose

Review and correct editorial text against the Manual de Voz Sinapsis rules and ortotipographic conventions, producing a traceable changelog where every correction cites the specific rule violated. This skill exists because style inconsistencies — wrong register, grade-inappropriate vocabulary, broken ortotipographic conventions — erode student comprehension and undermine the editorial brand. Gate G2 (Calidad Editorial) cannot pass without a clean style review.

## Procedure

1. **Load the Manual de Voz rules** — Read `references/voice-manual-rules.md` to prime all active style rules. Never rely on memory of rules from prior sessions; the manual may have been updated.
2. **Identify the target grade level** — Extract the grade from the unit metadata. Vocabulary appropriateness depends entirely on the target age group, so this step gates all subsequent vocabulary checks.
3. **Scan for tonal violations** — Check that the text maintains the Sinapsis voice: warm, encouraging, inclusive, age-appropriate. Flag any condescending, overly academic, or informal-slang passages. Cite the specific Manual de Voz rule for each finding.
4. **Check vocabulary appropriateness** — Verify that technical terms are introduced with definitions, that word complexity matches the grade level, and that no unexplained jargon appears. Flag violations because students cannot learn from text they cannot read.
5. **Verify ortotipographic conventions** — Check punctuation, capitalization, number formatting, use of bold/italic, heading hierarchy, list formatting, and all typographic rules from the manual. These conventions exist for visual consistency and cognitive load reduction.
6. **Detect gendered or exclusionary language** — Scan for non-inclusive language patterns. The Sinapsis voice is explicitly inclusive; violations are CRITICAL.
7. **Generate changelog** — Produce a structured changelog where every correction entry includes: location, original text, corrected text, and the rule ID that mandates the correction.

## Inputs

| Input | Source | Required | Description |
|-------|--------|----------|-------------|
| Editorial text | `project/units/` or provided content | Yes | The text to review |
| Manual de Voz Sinapsis | `references/voice-manual-rules.md` | Yes | Complete editorial style rules |
| Grade level | Unit metadata | Yes | Target grade for vocabulary calibration |

## Outputs

| Output | Format | Description |
|--------|--------|-------------|
| Style changelog | Markdown table | Every correction with rule citation |
| Violation summary | Statistics block | Counts by category and severity |
| Corrected text | Markdown | Clean text with all corrections applied (if requested) |

## Acceptance Criteria

- Zero residual CRITICAL style violations (tonal, inclusivity).
- Every correction in the changelog cites a specific Manual de Voz rule ID.
- Vocabulary verified appropriate for declared grade level.
- Ortotipographic conventions 100% compliant.
- Changelog is complete — no silent corrections.

## Output Format

```markdown
## Style Review — [Unit/Section Name]

**Summary**: [X] corrections | [C] CRITICAL | [W] WARNING | [I] INFO
**Grade Level**: [N]o grado | **Voice Target**: Sinapsis — [warm/encouraging/inclusive]

### Changelog

| # | Location | Category | Original | Corrected | Rule | Severity |
|---|----------|----------|----------|-----------|------|----------|
| 1 | U1-B2-P3 | Tono | "Debes memorizar esto" | "Te invitamos a recordar" | VOZ-04 | CRITICAL |
| 2 | U1-B1-P1 | Ortotipografia | "pagina 5" | "pagina 5" | ORT-12 | INFO |
| 3 | U1-B3-P2 | Vocabulario | "epistemologia" | "forma de conocer" | VOC-07 | WARNING |

### Violation Summary by Category

| Category | CRITICAL | WARNING | INFO | Total |
|----------|----------|---------|------|-------|
| Tono | 1 | 0 | 0 | 1 |
| Ortotipografia | 0 | 0 | 1 | 1 |
| Vocabulario | 0 | 1 | 0 | 1 |
| Inclusividad | 0 | 0 | 0 | 0 |

### Rules Most Frequently Violated

1. **VOZ-04** (Tono imperativo): 3 occurrences — Consider reviewing author guidelines for imperative avoidance.
```

## Error Handling

- **Manual de Voz not found**: Halt and report `ERROR: Cannot review style without references/voice-manual-rules.md.`
- **Grade level not specified**: Halt and report `ERROR: Grade level required for vocabulary calibration. Specify grade in unit metadata or as input.`
- **Ambiguous rule application**: When a text passage could violate multiple rules, cite the most specific rule and note the secondary rule as INFO.
- **Empty input text**: Report `ERROR: No text provided for style review.`

## Anti-Patterns

- **Correction without citation**: Making style changes without citing the specific Manual de Voz rule. Every correction must be traceable to a rule; otherwise it is subjective opinion, not editorial review.
- **Over-correction of author voice**: Stripping all personality from the text in pursuit of "consistency." The Manual de Voz defines a warm, encouraging tone — not a robotic one.
- **Ignoring grade context**: Applying the same vocabulary standards to 5th grade and 7th grade. Vocabulary appropriateness is grade-relative.
- **Silent fixes**: Correcting text without logging the change in the changelog. This destroys auditability and prevents the author from learning the rules.
- **Ortotipographic tunnel vision**: Focusing only on punctuation while ignoring tonal or inclusivity violations that carry higher pedagogical impact.

## References

- `references/style-review-patterns.md` — Changelog format, common violation categories, correction rule citation format.
- `references/voice-manual-rules.md` — Complete Manual de Voz Sinapsis rules.
- Scriba CLAUDE.md — Quality Gate G2 criteria.
