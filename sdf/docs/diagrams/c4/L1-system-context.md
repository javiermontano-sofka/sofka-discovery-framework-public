# C4 Level 1 — System Context

SAGE (SDF plugin) as a black box, with the external systems it touches.

## Diagram

```mermaid
graph LR
    User[Pre-sales consultant<br/><em>human</em>]
    CC[Claude Code<br/><em>runtime</em>]
    SAGE[SAGE v13.4<br/><strong>SDF plugin</strong>]
    NLM[NotebookLM<br/><em>via MCP</em>]
    FS[(Repo filesystem)]
    Git[(Git + GitHub)]
    CI[GitHub Actions<br/><em>CI/validators</em>]
    HTML[Branded HTML<br/><em>deliverable</em>]

    User -->|"/sdf:* commands"| CC
    CC -->|loads plugin| SAGE
    SAGE -->|"read/write .discovery/"| FS
    SAGE -->|"mcp__notebooklm__*"| NLM
    SAGE -->|"render_brand_html.py"| HTML
    User -->|commits| Git
    Git -->|webhook| CI
    CI -->|"validators, tests"| Git

    classDef sage fill:#FF7E08,stroke:#000,color:#000
    classDef external fill:#EFEAE4,stroke:#000,color:#000
    class SAGE sage
    class User,CC,NLM,FS,Git,CI,HTML external
```

## Narrative

The user is a pre-sales consultant. They interact through Claude Code by invoking `/sdf:*` slash commands. Claude Code loads the SDF plugin, which becomes the primary actor.

SDF touches four external systems:

1. **NotebookLM** via MCP — for grounded synthesis over 10-50 source documents.
2. **Repo filesystem** — where all session artefacts live (`.discovery/`, `sdf/skills/`, `sdf/docs/`, etc.).
3. **Git + GitHub** — version control, collaboration, PR review.
4. **GitHub Actions** — runs 6 docs validators + the pytest suite on every push.

Output delivered to the user: branded HTML files (via the deterministic renderer, see [ADR-0010](../../adr/0010-brand-html-deterministic.md)) + markdown source.

## What's NOT on this diagram

- Client companies (they consume deliverables but don't integrate).
- Sofka's commercial team (downstream of pre-sales).
- Individual agents/skills (that's [L2](L2-containers.md)).

## Related

- [L2 — Containers](L2-containers.md)
- [ADR-0019](../../adr/0019-c4-levels-1-2-3-mermaid.md) — why C4, why no L4
- [`../../explanation/architecture-overview.md`](../../explanation/architecture-overview.md)
