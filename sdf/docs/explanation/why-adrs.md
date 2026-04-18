# Why ADRs

Architecture Decision Records, introduced by Michael Nygard in 2011 ([*Documenting Architecture Decisions*](https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions)), are short markdown files — one per decision — that capture **context, decision, consequences, alternatives, and references**.

## The problem ADRs solve

Architectural decisions outlive the people who made them. Three years later a maintainer asks: "why is authentication split between two services?". Without an ADR, the answer is archaeology (git blame, Slack search, old meeting notes) or worse, reinvention (the original reason is forgotten; the decision is revisited as if fresh). Both are wasteful; both lead to bad second decisions.

An ADR captures the decision **and its reasoning** at the moment of decision, immutably. Future readers either honor the decision on purpose or revise it on purpose — not by accident.

## Why immutable

Many ADR styles allow in-place editing. We disallow it ([ADR-0020](../adr/0020-antifragile-corrections-loop.md) aside — lessons-learned is editable). When a decision changes, we write a new ADR that **supersedes** the old. The old stays visible with a `Superseded-by: NNNN` pointer.

Why: history is a feature. A reader should be able to follow the evolution of thinking ("we once decided X; in 0026 we superseded it because ..."). Editing in place destroys that evolution.

Validator `adr-integrity.py` checks accepted ADRs against git history and fails if they've been mutated.

## Why 5 sections (not 12, not 3)

Nygard's original template has 5: Title, Status, Context, Decision, Consequences. We added **Alternatives** explicitly because naming the dismissed options is where the real value lies — a decision without alternatives isn't a decision, it's an observation.

Longer templates (design docs, RFCs) serve different purposes; ADRs specifically optimise for the post-hoc reader who wants "why" in 5 minutes.

## How ADRs relate to explanation essays

- **ADR** — captures a decision. Immutable. Numbered. 5 sections.
- **Explanation essay** — captures understanding. Revisable. Named. Prose.

An ADR may cite explanation essays that informed it. An essay may cite ADRs that operationalise its ideas. They are complementary: essays can ramble, ADRs cannot.

## Costs

- **Authoring friction.** Every non-trivial decision becomes a file. Mitigated by TEMPLATE.md and the norm that "this is how we work here".
- **Numbering races.** In PRs that land close in time, ADR numbers can collide. Resolved in PR review (last-in renumbers).
- **Supersede chains.** When a decision is superseded multiple times, reading the chain takes effort. Accepted cost; the alternative (lossy edit-in-place) is worse.

## When ADRs don't help

- Reversible, trivial decisions (tool choice for a one-off script). Don't ADR; git log suffices.
- Decisions still being debated. ADRs for the output of decisions, not the deliberation.

## Related

- Nygard, M. (2011). *Documenting Architecture Decisions*.
- [ADR-0017](../adr/0017-diataxis-four-quadrants.md) — an ADR-about-ADRs, since this essay is meta.
- `adhawkinson/adr-tools` — optional CLI for ADR authoring (we don't use it; our TEMPLATE is enough).
