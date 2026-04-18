# Filesystem as architecture — a manifesto

> "La arquitectura es qué puedes encontrar con `ls`."

This essay makes the claim that in a plugin of this size, the filesystem structure *is* the architecture — not a surface decoration, not a secondary concern, but the primary instrument through which the system is readable, maintainable, and extensible.

## The claim

For systems composed of many small, cohesive files (agents, skills, commands, docs, ADRs, validators), the tree structure communicates more than any architectural diagram could. A reader who runs `ls sdf/docs/adr/` can enumerate the 25 decisions that govern SAGE. A reader who runs `ls sdf/agents/` can see the 49 specialists available. Navigation is reading.

This breaks down in codebases where behaviour lives inside large files; there, the tree is lies — 12 files might house 12,000 concerns. But SDF's design choice is deliberately granular: one agent per file, one skill per directory, one ADR per decision, one validator per check. At that granularity, `ls` is a table of contents.

## Paths encode meaning

| Path | What the path tells you |
|------|-------------------------|
| `sdf/docs/adr/0017-diataxis-four-quadrants.md` | ADR number 17, slug says what was decided |
| `sdf/skills/brand-html-render/SKILL.md` | A skill in MOAT structure |
| `sdf/scripts/validators/count-parity.py` | A CI-enforced quality check |
| `sdf/.discovery/ghost-menu.md` | Runtime artefact, gitignored |
| `sdf/references/ontology/agent-committee.md` | Agent-read operational spec |

No navigation tree, no sitemap, no TOC.yml. The tree **is** the navigation.

## Why this works

1. **Diffs preserve meaning.** A rename or move is a visible, reviewable git event, not a hidden metadata change.
2. **Tools compose.** `grep`, `find`, `ls`, `fd`, `git log --stat`, and a file-tree widget all treat the tree as first-class.
3. **New readers succeed.** A contributor who has never seen the project can `ls` through the tree and learn the shape in minutes.
4. **Scale is graceful.** Adding 300 auto-generated reference pages doesn't require restructuring. The path `docs/reference/agents/<name>.md` was meaningful from day one.

## What it requires

- **Slug discipline.** No `misc.md`. No `utils/`. No `helpers/`. Each file's name should tell the next reader what it is.
- **Atomic files.** One concern per file. When a file grows multi-topic, it splits.
- **No hidden state.** State visible in the filesystem is state anyone can audit. State in a database or a runtime cache is state only the runtime can see.
- **Tooling that respects it.** Validators operate on paths. The Claude Code file-tree is the docs' front page.

## What it rejects

- **Tag-based systems** (tags in frontmatter, queried via a tool). Tags are invisible in `ls`; they rot; they require a querying layer.
- **Navigation metadata files** (TOC.yml, mkdocs.yml). These duplicate structure already present in the tree and drift.
- **Mega-modules.** A 5000-line README is architecture hidden as a document. A 5-line hub pointing to 20 paths is architecture visible as a tree.

## Connection to antifragility

A system where structure is data is easier to grow. A new ADR is a file. A new validator is a file. A new service type is a file. No refactor, no shape change. Optionality is free.

This is not neutral. A traditional "apps + libs + utils" structure forces a refactor when new concerns arrive (where does this go?). Path-as-architecture admits that "new concern" = "new path prefix" and adapts.

## Trade-off: the tree can sprawl

The cost is visible tree sprawl. `sdf/docs/` will, after B11, hold ~500 files. Without discipline, it becomes a dumping ground.

Mitigations:

- **Quadrant structure** (`tutorials/how-to/reference/explanation`) bounds growth within modes.
- **Validators** flag orphaned docs, broken links, undefined acronyms.
- **Reviewer habit** — the "where does this go?" question is a first-class review question, not an afterthought.

## Related

- [ADR-0021](../adr/0021-filesystem-as-architecture.md) — the formal decision
- [`information-architecture.md`](information-architecture.md) — the Diátaxis layer on top
- [`antifragile-docs.md`](antifragile-docs.md) — how stressors strengthen the tree
