# ADR-0028: Workflow taxonomy — internal (orchestration) vs functional (business process)

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

"Workflow" collapses two very different things:

- **Internal workflow** — how the plugin orchestrates itself. E.g. discovery-conductor → committee composer → gate enforcer. Audience: contributors, maintainers.
- **Functional workflow** — how the client's business runs. E.g. AR→AP in SAP, strangler-fig modernization, QA factory onboarding. Audience: clients.

Both deserve BPMN treatment per ADR-0026, but their purposes, review audiences, and update cadences differ. Without a taxonomy, they blur — an internal diagram leaks into a client deliverable, or a functional diagram accidentally reveals implementation detail.

## Decision

Every workflow artefact is labelled **internal** or **functional** in frontmatter and lives in a type-scoped directory:

```
docs/workflows/
├── internal/                # Agent/plugin orchestration
│   ├── <slug>.bpmn          # source-of-truth XML
│   ├── <slug>.md            # explanation essay
│   └── <slug>.mmd           # Mermaid projection (generated, optional)
└── functional/              # Client-facing business processes
    ├── <slug>.bpmn
    ├── <slug>.md
    └── <slug>.mmd
```

Same structure at every plugin (`sdf/docs/workflows/`, `sap-enterprise-plugin/docs/workflows/`).

Scope discipline:

- **Internal workflows** are never included in client deliverables. They can reference plugin internals, Claude Code specifics, orchestration mechanics.
- **Functional workflows** never leak implementation detail. They describe what the client's business does, not how our agents orchestrate. Can be shared with clients directly.

Cross-references allowed: an internal workflow can point at a functional workflow (agents produce functional output), and vice versa (client process triggers an SDF engagement).

## Consequences

### Positive
- Clear audience targeting per workflow.
- Authors know which vocabulary to use (technical vs business).
- Leakage becomes a reviewable event — moving a diagram between directories is a conscious PR.
- Client artefact render can automatically exclude `internal/` sub-trees.

### Negative
- Occasional judgment calls on the boundary (e.g. the "antifragile correction loop" is internal, but a generalised "continuous improvement loop" could be functional). Resolved case-by-case in reviews.
- Two copies of some concepts (rare; intentional — same concept framed for different audiences).

### Neutral
- Adding a third category (say "vendor-facing") is a future supersede. For now, two tiers cover the observed space.

## Alternatives considered

- **Single workflows/ directory with frontmatter tag.** Dismissed: path-as-architecture (ADR-0021) implies directory-level separation.
- **No separation; rely on reviewer diligence.** Dismissed: leakage risk too high when speed matters.
- **Separate repo for functional (client-shareable).** Dismissed: over-engineering; tightening the boundary inside the same repo suffices.

## References

- ADR-0021 (filesystem as architecture)
- ADR-0026 (BPMN first-class)
- `docs/workflows/` — directory skeleton
