# ADR-0025: Skip site generator — flat markdown + GitHub navigation is sufficient

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Docs-as-code is complete when docs + build pipeline produce a browsable site (MkDocs Material, Docusaurus, etc.). Site generators enable search, theming, versioning, and polished navigation. They also add: a dependency, a build step, a deploy pipeline, and a new authoring convention for plugin authors to learn.

At SDF's current scale (~160 structural files, growing to ~500 after B11), GitHub's native rendering handles:
- Markdown display with tables, fenced code, Mermaid.
- Directory navigation via the file tree.
- Internal links (relative paths).
- Search via GitHub's own search over the repo.

The deltas a site generator would add: site-level search across the whole tree (not repo-restricted), theming (branded colours match DS v5), offline browsing. None is critical for the current audience (maintainers + occasional contributors).

## Decision

**No site generator this cycle.** Docs live as flat markdown under `sdf/docs/`; GitHub is the browsing surface.

The decision is revisitable. If a `docs.sofka.com/sage/` site becomes necessary (e.g. public contributor recruitment, client self-service), a future ADR will supersede this with a deliberate choice of tool.

## Consequences

### Positive
- Zero build tooling; no Node/Python docs deps.
- PRs reviewable end-to-end in markdown; no "preview the built site" friction.
- Authors write markdown; no secondary conventions (e.g. MkDocs navigation YAML).

### Negative
- Search is repo-scoped only (GitHub search over the repo).
- No versioned snapshots ("see the docs as they were for v13.0"); git history is the versioning.
- No branded theming on the docs layer (brand HTML renderer handles client deliverables).

### Neutral
- Nothing about this cycle's file structure precludes a future site generator. MkDocs Material could ingest `sdf/docs/` with a minimal `mkdocs.yml`.

## Alternatives considered

- **MkDocs Material** — dismissed for now: infra cost > current benefit.
- **Docusaurus** — dismissed: React-heavy, overkill.
- **GitHub Pages Jekyll default** — dismissed: minimal features, still requires a deploy step.

## References

- `docs.sofka.com` infra (out of scope)
- ADR-0017 (Diátaxis — the content org is generator-agnostic)
- ADR-0021 (filesystem as architecture — reinforces flat-markdown decision)
