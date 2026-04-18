# ADR-0021: Filesystem paths encode information architecture

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Plugins accumulate files. Without path discipline, readers resort to `grep -r` to find anything. The opposite extreme — elaborate navigation metadata (sitemaps, TOCs) — ages faster than the content it describes. A middle path exists: make the path itself informative, so `ls` answers "what's here?" and a glance at the tree tells you the shape of the system.

## Decision

Paths in SDF encode meaning:

- **Quadrant first, topic second** — `docs/<quadrant>/<slug>.md`. `docs/how-to/render-html.md` is discoverable by listing the how-to directory.
- **Immutable IDs where relevant** — ADRs use `NNNN-slug.md`. IDs never re-used; number is monotonic.
- **Kind-keyed directories in skills/agents/commands** — each skill is a directory, so its assets (grader, evals, scripts) live together. Navigation via `ls skills/<skill-name>/`.
- **Ontology parallel to docs** — `references/ontology/<topic>.md` mirrors `docs/explanation/why-<topic>.md` pairs.
- **Gitignored runtime** — `.discovery/` is explicitly the scratch directory; anything there is disposable.
- **Validator manifest is the source of truth** — `scripts/validators/_manifest.yaml` names the counts that docs must match. Changing the fact is a manifest change.

A reader can answer "what decisions govern SAGE?" by running `ls sdf/docs/adr/`. They can answer "what recipe exists for rendering?" by running `ls sdf/docs/how-to/` and scanning slugs.

## Consequences

### Positive
- Tree navigation is enough. Claude Code's file-tree widget IS the docs index.
- Rename costs visible in git diffs; accidental restructures get caught in review.
- New file class slots in without refactor: add `docs/runbooks/`, done.

### Negative
- Slug discipline required. A "misc.md" bucket would violate. Countered by reviewer habit; validators flag orphaned docs.

### Neutral
- This is a philosophy as much as a policy. See `docs/explanation/filesystem-as-architecture.md` for the manifesto.

## Alternatives considered

- **Flat docs/ with tags in frontmatter** — dismissed: requires a query tool; not diff-visible.
- **TOC-driven navigation** — dismissed: TOCs rot.

## References

- `docs/explanation/filesystem-as-architecture.md` (B5 — manifesto)
- `sdf/docs/README.md` (hub)
- ADR-0017 (Diátaxis — the quadrant part of path semantics)
