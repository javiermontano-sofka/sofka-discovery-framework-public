# ADR-0019: C4 levels 1-3 in Mermaid; no L4 code diagrams

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Architectural diagrams accumulate without a discipline. PowerPoint stack-of-boxes diagrams rot faster than the code. C4 (Simon Brown) proposes a four-level hierarchy: L1 System Context, L2 Containers, L3 Components, L4 Code. Each level is opinionated about what belongs; drift between levels becomes visible.

Mermaid renders in GitHub natively; the source is diff-friendly markdown. PlantUML + Structurizr are alternatives with stronger C4 semantics but require rendering infra.

## Decision

Adopt C4 for SDF architectural diagrams:

- **L1 — System Context** — SAGE as a box; external systems (Claude Code, MCP servers, Git, NotebookLM, filesystem) around it.
- **L2 — Containers** — the plugin's parts: agents runtime, skills repo, hooks, validators, generators, MCP glue.
- **L3 — Components** — one zoom per L2 container where useful. E.g. "inside the discovery-conductor".

**L4 — Code — explicitly omitted.** Code-level diagrams rot fastest; the code is small and readable; a diagram adds noise. If ever needed, it's a per-PR drawing, not a committed doc.

All diagrams rendered in **Mermaid**, source committed as markdown fenced blocks under `docs/diagrams/c4/L{1,2,3}-*.md`.

## Consequences

### Positive
- Readers can pick the right zoom level; no "one impossible diagram trying to show everything".
- GitHub renders Mermaid natively; no build step.
- Changes are reviewable in PRs (diffs on Mermaid text).

### Negative
- Mermaid's C4 support is weaker than PlantUML's — we express C4 shapes via Mermaid's flowchart primitives + styling. Adequate, not exact.

### Neutral
- Adding L4 later is a supersede-this-ADR action if the project grows enough to need it.

## Alternatives considered

- **PlantUML** — dismissed: render infra (need a PlantUML JAR or service); PRs harder to review without rendering.
- **Drawio / Lucidchart** — dismissed: binary artefacts; no diff review; proprietary.
- **ASCII art** — dismissed: doesn't scale; hard to maintain.

## References

- Brown, Simon. *The C4 model for software architecture*. https://c4model.com
- `sdf/docs/diagrams/c4/` (B8)
- ADR-0018 (architecture-overview includes L1+L2 inline)
