# ADR-0006: Four ToT meta-phases (Branching, Evaluate, Prune, Expand) are orthogonal to the 11 pipeline stages (P0–P9)

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Adversarial review of v13.3 docs found "phase" used with two incompatible meanings: (a) pipeline stages P0–P9, a linear delivery sequence, and (b) Tree-of-Thought meta-phases, a scenario-exploration pattern applied at P5. Collapsing them causes readers to miss that ToT runs inside P5 specifically, not across the pipeline.

Prior art: Yao et al. 2023 (ToT paper). SDF's contribution is applying ToT at the scenario-design stage, where multiple candidate architectures need parallel evaluation before a cost model can be justified.

## Decision

Treat the two vocabularies as orthogonal and name them distinctly:

- **Pipeline stages** — P0 (Discovery Plan) → P9 (Handover). 11 deliverable stages, strictly sequential.
- **ToT meta-phases** — Branching → Evaluate → Prune → Expand. 4 phases of *scenario exploration*, applied only inside P5.

Docs (`references/ontology/pipeline-orchestration.md`, `docs/reference/phases-vs-stages.md`) use the words consistently. "Phase" alone is ambiguous; prefer "stage" for P-level or "ToT meta-phase" for the scenario pattern.

## Consequences

### Positive
- Readers stop conflating two independent vocabularies.
- Agents can reference P5-ToT specifically without the reader inferring a global ToT pipeline.
- Future scenarios (e.g. ToT applied at P3 AS-IS gap-analysis) become a conscious extension.

### Negative
- Requires existing prose in elevated docs to be reviewed for ambiguity. Tracked in B10 cross-link pass.

### Neutral
- Glossary (`GLOSSARY.md`) carries both terms with cross-link.

## Alternatives considered

- **Rename ToT meta-phases to "steps"** — dismissed: ToT literature uses "phases"; we don't want to diverge.
- **Rename pipeline stages to "milestones"** — dismissed: HITL mode already uses `--hitos`; overloading would re-introduce ambiguity.

## References

- Yao et al. 2023 — "Tree of Thoughts: Deliberate Problem Solving with Large Language Models"
- `references/ontology/pipeline-orchestration.md`
- `docs/reference/phases-vs-stages.md` (B4)
