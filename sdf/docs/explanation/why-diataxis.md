# Why Diátaxis

Daniele Procida's Diátaxis framework (introduced ~2017, [diataxis.fr](https://diataxis.fr)) partitions documentation into four quadrants by **reader mode**: tutorials (learning), how-to guides (task), reference (information), explanation (understanding).

## The claim

Docs that conflate modes fail every mode. A tutorial that tries to also be reference feels like a manual; a reference that tries to explain reads like a blog post; an explanation that tries to teach fumbles every hand-off.

Procida's insight is that users arrive in one of those four modes. The mode shapes what they need and what reads well. A "unified doc" ignores the mode and serves none of them.

## Why we adopted it over alternatives

- **Alternative 1: Topic folders** (`docs/auth/`, `docs/deploy/`). Dismissed: topics don't bound growth; the "where does this go?" question comes back ("is this explanation or reference within auth?").
- **Alternative 2: arc42 single-doc.** Dismissed: works for architecture spec; doesn't scale to the recipe + tutorial content this plugin needs. See [ADR-0018](../adr/0018-arc42-lite-split-files.md) for the hybrid we use.
- **Alternative 3: MkDocs-driven nav.** Dismissed: navigation as metadata drifts; navigation as filesystem paths is always current.

## What we take, what we relax

**Take**:
- Four-quadrant split as top-level directory structure.
- Reader-mode language in each quadrant's README ("what question does this answer?").
- Separation of explanation (why) from reference (what).

**Relax**:
- Strict quadrant-purity. `diataxis-purity.py` is advisory, not blocking. A how-to occasionally needs a background block for a non-obvious decision; a reference sometimes includes a tiny example. Dogma over pragma costs more than it buys.

## Costs we accept

- **Content duplication.** A concept like "evidence tags" has an ADR (decision), an explanation essay (why), reference specs (what), and a how-to (how to use). Readers find the right one from the right quadrant; we accept the redundancy as the price of mode-specificity.
- **Authoring discipline.** Contributors must know which quadrant a new doc belongs to. We invest in CONTRIBUTING to make that cheap.

## Evidence it works

Projects that adopted Diátaxis and saw improved contributor engagement and reduced doc-related support burden:
- Django (~2019 adoption)
- Gatsby
- Materialize
- Internal adoption in Sofka's previous plugin (validated in Q1 2026 via contributor survey; captured in lessons).

## Related

- [ADR-0017](../adr/0017-diataxis-four-quadrants.md)
- [`information-architecture.md`](information-architecture.md)
- Procida, D. (n.d.). *Diátaxis*. https://diataxis.fr
