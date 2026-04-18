# Information architecture — how these docs are laid out

The `sdf/docs/` tree is the **pedagogical** layer, separate from `references/ontology/` (the **operational** layer). Same facts, different audiences. This essay explains why that split, how the four Diátaxis quadrants serve different modes, and how readers should navigate.

## Two layers, one source of truth

**Operational layer** (`references/ontology/`) is what agents read mid-session. Dense, terse, authoritative. It answers: "What is the gate G1.5 composition?" in one table the orchestrator can parse quickly.

**Pedagogical layer** (`docs/`) is what humans read outside a session — during onboarding, when reviewing a decision, when auditing. It answers: "Why is G1.5 a half-gate between G1 and G2?" with context, alternatives dismissed, and the Think Tank rationale.

The same facts live in both places, with the same source of truth (frontmatter, plugin.json, `_manifest.yaml`). Validators enforce parity between them so drift fails CI.

## Why not collapse them?

Tried it. Every iteration where "one doc to rule them all" was the plan ended with either bloated orchestration prompts (agents reading narrative they didn't need) or thin human-facing docs (readers reading ontology files not written for them).

Split serves both better.

## The four Diátaxis quadrants

Adopted from Daniele Procida's Diátaxis framework (see [ADR-0017](../adr/0017-diataxis-four-quadrants.md)):

| Quadrant | Reader mode | Example question it answers |
|----------|-------------|----------------------------|
| Tutorials | "Teach me" | How do I run my first discovery? |
| How-to | "I have a goal" | How do I render a deliverable to HTML? |
| Reference | "Give me the exact contract" | What are the 8 evidence tags? |
| Explanation | "Help me understand" | Why is the 7/7 INSIGNIA structure non-negotiable? |

Collapsing these modes produces docs that fail every mode. A tutorial that tries to also be a reference reads like a manual; a reference that tries to explain reads like a blog post nobody cites. Diátaxis' claim — battle-tested across projects from Django to Gatsby — is that separating the modes makes each better.

## Cross-cutting: ADRs + diagrams

Two directories don't cleanly fit the four-quadrant model but complement it:

- **[adr/](../adr/README.md)** — numbered decision records. Immutable once accepted. Each ADR cites explanations that informed it.
- **[diagrams/](../diagrams/README.md)** — visual supplements, mostly C4 levels 1-3 in Mermaid + sequence diagrams. Referenced from essays and tutorials.

## Navigation heuristics

- **First time?** → Start at the `docs/README.md` hub; skim the 4-quadrant map; click into whichever quadrant matches your current question.
- **Coming in from a failed build / audit finding?** → [error-catalog](../reference/error-catalog.md) first; drill from there.
- **Designing a change?** → [adr/](../adr/README.md) first (has your decision space been mapped already?); then the relevant explanation essay.
- **Looking for a recipe?** → [how-to/](../how-to/README.md) — filenames are descriptive, `ls` is enough.

## Scale properties

This structure is intentionally optional and additive:

- New concern? → new essay in explanation + new ADR + (maybe) new reference spec.
- New service type? → new file in `reference/service-types/`; committee table updated.
- New validator? → new file in `reference/` if users must understand it; existing path already exists.

No refactor required. The tree grows breadth-first, not by reorganizing the existing structure.

## Related

- [ADR-0017](../adr/0017-diataxis-four-quadrants.md) — the decision
- [`filesystem-as-architecture.md`](filesystem-as-architecture.md) — why paths matter
- [`why-diataxis.md`](why-diataxis.md) — the methodological rationale in isolation
