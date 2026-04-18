# `[STAKEHOLDER]`

- **Priority**: 6 / 8
- **Class (CSS)**: `t td`

## When to use

A claim quoted from a named stakeholder with a timestamp. Interview notes, meeting minutes, email threads where the person is on the thread.

## Locator format

```
[STAKEHOLDER:<name>:<date>]
[STAKEHOLDER:Juan Pérez:2026-04-12]
[STAKEHOLDER:María López (CTO):2026-04-10-workshop]
```

Name includes role when ambiguous. Date in ISO format or event slug.

## Examples

- `El equipo de riesgo exige retención por 7 años [STAKEHOLDER:Juan Pérez:2026-04-12]`
- `El go-live objetivo es Q3 2026 [STAKEHOLDER:María López (CTO):2026-04-10]`

## NOT to use for

- Paraphrases from memory — if the quote can't be sourced to notes or a recording, downgrade to `[INFERENCIA]` with an explanation.
- Aggregated "the team said" — name a specific stakeholder or split into multiple claims.
- Public statements in press releases — that's `[DOC]`.

## Reviewer check

Notes or recording exists for the cited date/person. Claim matches the quote, not a summarizer's interpretation.
