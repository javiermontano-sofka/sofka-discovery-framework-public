# File layout — reference

The canonical tree of `sdf/` and what each path means. Updated as the plugin evolves.

## Top level

```
sdf/
├── CLAUDE.md                  Hub: orchestration contract
├── README.md                  Overview: for new readers
├── CONTRIBUTING.md            Contributor gate: pre-PR checks
├── SECURITY.md                Security policy + reporting
├── GLOSSARY.md                SDF-specific acronyms + terms
├── CHANGELOG.md               Keep-a-Changelog format
├── LICENSE                    All rights reserved
├── landing.html               Interactive landing page
├── prompt-library.html        Searchable prompt catalogue
├── .mcp.json                  NotebookLM MCP server declaration
├── .claude-plugin/            Plugin manifest (plugin.json)
├── agents/                    49 subagent definitions
├── commands/                  101 slash commands
├── skills/                    214 MOAT skills (each 7/7 INSIGNIA)
├── hooks/                     SessionStart / PostToolUse hooks
├── references/ontology/       Operational ontology (agent-read)
├── templates/                 jinja2 templates (brand-html-base, etc.)
├── scripts/                   Executables
│   ├── validators/            6 docs validators (B9)
│   ├── ecosystem/             Multi-plugin ops (audit, scan, reindex)
│   ├── tests/                 57 pytest tests
│   ├── nlm-install.sh         NotebookLM CLI installer
│   └── *.sh                   Other shell utilities
├── docs/                      Pedagogical layer (B2-B11)
│   ├── tutorials/             Learning-oriented (B7)
│   ├── how-to/                Task-oriented (B6)
│   ├── reference/             Info-oriented (this tree; B4)
│   ├── explanation/           Understanding-oriented (B5)
│   ├── adr/                   Architecture Decision Records (B3)
│   └── diagrams/              C4 + sequences (B8)
├── .discovery/                Runtime session artefacts (gitignored)
└── .github/workflows/         CI pipelines
```

## Path semantics (see [ADR-0021](../adr/0021-filesystem-as-architecture.md))

| Path pattern | Semantics |
|--------------|-----------|
| `agents/<name>.md` | Invocable subagent |
| `skills/<name>/SKILL.md` + assets | 7/7 MOAT skill |
| `commands/<slug>.md` | User slash command (`/sdf:<slug>`) |
| `references/ontology/<topic>.md` | Operational ontology (hot-path read) |
| `docs/<quadrant>/<slug>.md` | Pedagogical doc |
| `docs/adr/NNNN-<slug>.md` | Numbered ADR, immutable once accepted |
| `.discovery/*` | Runtime session state, gitignored |
| `scripts/validators/<name>.py` | CI-enforced quality check |

## "Where does this go?" decision table

| Intent | Path |
|--------|------|
| New decision to record | `docs/adr/NNNN-<slug>.md` |
| New how-to recipe | `docs/how-to/<slug>.md` |
| New tutorial | `docs/tutorials/NN-<slug>.md` |
| New subagent | `agents/<slug>.md` |
| New skill | `skills/<slug>/SKILL.md` + 7/7 assets |
| New slash command | `commands/<slug>.md` |
| New validator | `scripts/validators/<slug>.py` + `_manifest.yaml` entry |
| New ontology topic | `references/ontology/<slug>.md` (if orchestrator-consumed) or `docs/explanation/<slug>.md` (if human-consumed) |
| Concept explanation | `docs/explanation/why-<slug>.md` |

## References

- [ADR-0021](../adr/0021-filesystem-as-architecture.md) — the principle
- [`../README.md`](../README.md) — docs/ hub
