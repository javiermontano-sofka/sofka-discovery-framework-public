# Phases vs stages — disambiguation

SDF uses "phase" in two independent senses. This reference fixes the vocabulary. Rationale: [ADR-0006](../adr/0006-tot-meta-phases.md).

## Pipeline stages (P0 – P9) — linear delivery sequence

11 deliverable stages, strictly sequential, spanning a discovery engagement end-to-end.

| Stage | Name | Gate after |
|-------|------|------------|
| P0 | Discovery Plan | — |
| P1 | Stakeholder Map | — |
| P2 | Brief Técnico | — |
| P3 | Análisis AS-IS | — |
| P4 | Mapeo de Flujos | **G1** |
| P5 | Escenarios (ToT) | **G1.5** |
| P5b | Feasibility Think Tank | (integrated in G1.5) |
| P6 | Solution Roadmap + Cost | **G2** |
| P7 | Spec Funcional | — |
| P8 | Executive Pitch | — |
| P9 | Handover Operativo | **G3** |

Vocabulary rule: use **stage** for P-level, not "phase".

## ToT meta-phases — scenario exploration pattern

4 phases, applied *inside* stage P5 (scenarios). From the Tree-of-Thought literature (Yao et al. 2023).

| # | ToT meta-phase | Action |
|---|----------------|--------|
| 1 | Branching | Generate multiple candidate scenarios |
| 2 | Evaluate | Score each on feasibility, cost, risk |
| 3 | Prune | Drop clearly dominated options |
| 4 | Expand | Deepen the surviving 2-3 scenarios |

Vocabulary rule: use **ToT meta-phase** for this, not "phase".

## Why two vocabularies

Pipeline stages are about *what deliverables to produce, in what order, with what gates*. ToT meta-phases are about *how to think through a single creative stage (P5)* where multiple futures need parallel exploration before a single choice can be defended.

Conflating them causes readers to imagine ToT running across P0-P9 (it doesn't) or pipeline stages happening inside P5 (they don't).

## Validator

`acronym-gate.py` doesn't flag "phase" (common word), but prose review catches ambiguous uses. Prefer the disambiguated terms.

## References

- Yao et al. 2023 — *Tree of Thoughts: Deliberate Problem Solving with Large Language Models*
- [`references/ontology/pipeline-orchestration.md`](../../references/ontology/pipeline-orchestration.md)
- ADR-0006
