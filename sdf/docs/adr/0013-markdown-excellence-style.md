# ADR-0013: Markdown-Excellence style — TL;DR + dense bullets + Mermaid + ghost menu

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Pre-sales readers skim. CTOs open a 40-page deliverable on a phone, read the first screen, and decide whether to schedule a deeper call. Wall-of-text prose fails this test; so does pure bullets without a thesis. The deliverable has 30 seconds to earn the next 30 minutes.

## Decision

Every SDF deliverable follows **Markdown-Excellence**:

1. **TL;DR at the top** — 3-5 bullets, the headline answer, evidence-tagged.
2. **Dense structured body** — bullets and tables beat paragraphs; prose used only where a decision needs narrative.
3. **Mermaid diagrams inline** — C4, sequence, or flow; only when they add clarity, not as decoration.
4. **Ghost menu at the bottom** — `## Siguientes pasos` block with 3-5 actionable items + named contacts.
5. **Evidence tags on every factual claim** — ADR-0002 discipline.
6. **No lorem-ipsum filler** — if a section has nothing specific to say, delete the section.

## Consequences

### Positive
- Executives get signal in ≤30 seconds.
- Technical readers can drill into dense bullets without wading through prose.
- Ghost menu keeps the sales motion flowing (the deliverable itself triggers next-step behaviour).

### Negative
- Some topics genuinely want prose (philosophical discussions, complex trade-offs). Mitigated by `docs/explanation/` — prose lives there, not in client deliverables.

### Neutral
- This style converges with how LLMs naturally write when prompted for bullets. Aligning intent with grain reduces agent friction.

## Alternatives considered

- **McKinsey-style pyramid** (conclusion + three supporting points) — partially adopted (TL;DR is the apex); kept but not enforced for every paragraph.
- **Academic long-form** — dismissed: wrong audience.
- **Slide-deck-first** — dismissed: decks are produced *from* markdown, not instead of.

## References

- `references/ontology/output-standards.md`
- ADR-0016 (ghost menu invariant)
