# ADR-0018: arc42-lite — use arc42 section headings but split across files

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

arc42 (Hruschka & Starke) offers a 12-section template for software architecture documentation: goals, constraints, context, solution strategy, building blocks, runtime, deployment, concepts, decisions, quality, risks, glossary. The sections are solid — they cover the real territory of architectural thinking. But arc42-as-single-doc is a 80-page monolith nobody reads end to end.

## Decision

Adopt arc42's **section headings** but split across separate files under `sdf/docs/explanation/` and `sdf/docs/adr/`:

- **architecture-overview.md** — the single-file arc42-lite: goals, constraints, context (with C4 L1 + L2 diagrams inline). Sections 1-4.
- **why-*.md essays** — building-block-level and concept-level narrative. Sections 5, 8 from arc42, one concept per file.
- **adr/NNNN-*.md** — decisions (Section 9). Immutable, numbered.
- **reference/metrics.md + quality-guardian rubric** — quality scenarios (Section 10).
- **reference/error-catalog.md** — risk register excerpt (Section 11), with links to runbooks.
- **GLOSSARY.md** — glossary (Section 12).

The `architecture-overview.md` document is ≤300 lines, points out to its supporting pieces. A new reader gets the whole picture in 10 minutes or drills deeper as needed.

## Consequences

### Positive
- Each section gets proper attention; no arc42 section is a token paragraph because "we should have it".
- Readers can skim the overview and dive into the relevant deep-link.
- Diffs are tractable; a PR that changes deployment strategy doesn't touch the concepts file.

### Negative
- Single-file arc42 has a discoverability win (one URL). Mitigated: `architecture-overview.md` is the single URL; it's just a hub now.

### Neutral
- Not a rejection of arc42 — an adoption of its content ontology with better file boundaries.

## Alternatives considered

- **Single architecture.md, 2000 lines** — dismissed: unread.
- **C4-only, no arc42** — dismissed: C4 is diagrams, arc42 is prose structure; complementary.
- **Custom template** — dismissed: don't reinvent a proven section ontology.

## References

- Starke, Gernot; Hruschka, Peter. *arc42 Template*. https://arc42.org
- `sdf/docs/explanation/architecture-overview.md` (B5)
- ADR-0017 (Diátaxis; arc42 content maps into Diátaxis explanation quadrant)
- ADR-0019 (C4 for diagrams)
