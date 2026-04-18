# ADR-0017: Adopt Diátaxis four-quadrant docs structure under sdf/docs/

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Pre-v13.4.1, SDF's documentation was a mix of ontology (operational, read at runtime), elevated CLAUDE/README hubs, and scattered prose. There was no clear place for "how do I do X?" or "why is it this way?" — so content either accumulated in README (bloating it) or got lost in scripts comments. Contributors asked "where does this go?" and got inconsistent answers.

Diátaxis (Procida 2017) proposes a four-quadrant split by user mode:

- **Tutorials** — learning-oriented.
- **How-to guides** — task-oriented.
- **Reference** — information-oriented.
- **Explanation** — understanding-oriented.

The claim is that conflating these produces bad docs for every mode.

## Decision

Adopt Diátaxis as the top-level layout of `sdf/docs/`:

```
docs/
├── tutorials/    — learning mode
├── how-to/       — task mode
├── reference/    — info mode
└── explanation/  — understanding mode
```

Plus two cross-cutting folders that don't fit the four-quadrant metaphor but serve the same discipline:

- `adr/` — Architecture Decision Records (decision mode).
- `diagrams/` — visual supplements, cross-referenced from other quadrants.

Each quadrant has a `README.md` index. A validator (`diataxis-purity.py`, advisory) flags content leaking between quadrants.

## Consequences

### Positive
- Contributors have a clear answer to "where does this go?".
- Readers navigate by mode, not by table-of-contents guessing.
- Scales: new topics slot into existing quadrants without structural refactor.

### Negative
- Purity enforcement can be fussy. Accepted: `diataxis-purity.py` is advisory, not blocking. Pragmatic pedagogy wins over methodology fundamentalism.

### Neutral
- The four-quadrant split is a convention, not a law. If a topic genuinely spans modes, ADR-supersede to a revised layout.

## Alternatives considered

- **Monolithic docs/ with topic folders** — dismissed: topic folders grow unbounded and reintroduce the "where do I put it" ambiguity.
- **arc42 single-doc** — dismissed (see ADR-0018).
- **MkDocs with nav.yml** — dismissed: we're not using a site generator (ADR-0025).

## References

- Procida, Daniele (2017). "Diátaxis". https://diataxis.fr
- `sdf/docs/README.md`
- ADR-0025 (no site generator)
