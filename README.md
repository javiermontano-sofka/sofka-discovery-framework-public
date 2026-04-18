# SAP Discovery Plugin — Monorepo

> Two Claude Code plugins developed in parallel as part of the **Sofka SAGE agentic PreSales** ecosystem. Ships SAP Enterprise coverage and the general-purpose Sofka Discovery Framework.

## What's in this repo

```
sap-discovery-plugin-WIP/
├── sap-enterprise-plugin/            # SAP S/4HANA Cloud discovery plugin
├── sdf/                              # Sofka SAGE discovery framework
├── RETROSPECTIVA-SAP-v2-a-v4.md      # Journey retrospective (v2.0 → v4.0)
├── RETROSPECTIVA-SAP-v2-a-v4.html    # Brand-rendered version (Sofka DS v5)
└── README.md                         # You are here
```

Historical zips (`sap-enterprise-plugin-v*.zip`, `sdf-v*.zip`) live at the root as release artifacts. They're excluded from git via `.gitignore` and shipped through GitHub Releases instead.

---

## Plugin 1 — `sap-enterprise-plugin/` · v4.0.1

SAP S/4HANA Cloud discovery framework with:

- **58 agents** (6 permanent + 40 thematic + 12 module specialists) in a ToT committee 5/7/9
- **104 skills** (12 core SAP + 90 imported from SDF + attachment + brand-html-render)
- **29 commands** in Spanish, all `/sap:*` prefixed
- **9 ontology files** (skills-catalog, agent-committee, commands-reference, pipeline-orchestration, attachment-taxonomy, output-standards, canonical-tokens, protocol-zero-hallucination, master-index)
- **FASE 0 attachment pipeline** — 8 extractors for .csv/.xlsx/.docx/.pdf/.pptx/.html/.py/.tsx/.sql/.json/.yaml/.xml
- **NotebookLM MCP embedded** via `.mcp.json`
- **Brand HTML render** with Sofka Design System v5 tokens

See `sap-enterprise-plugin/README.md` for installation and usage.

## Plugin 2 — `sdf/` · v13.3.0 (Sofka SAGE)

Universal agentic PreSales framework:

- **49 agents** + **215 skills** MOAT + **101 commands** + **14 ontology files**
- **100% INSIGNIA structural compliance** (every skill has SKILL.md + grader + evals + references + examples + scripts + prompts)
- **100% non-placeholder graders + evals** (AI-generated skill-specific content in v13.3.0)
- **57 pytest tests** covering extractors, brand HTML render, ecosystem batch tools
- **End-to-end skill execution harness** (mock + real `claude` CLI modes)
- **GitHub Actions CI** with 5 jobs (structural audits + YAML validity + pytest + render smoke + compliance audit)
- **4 sibling plugins** under `sdf/`: MetodologIA (MAO, GPL-3.0), PM APEX, Sovereign Architect, Plugin QA

See `sdf/README.md`, `sdf/CLAUDE.md`, and `sdf/CHANGELOG.md` for details. Branded assets: `sdf/landing.html`, `sdf/prompt-library.html`.

---

## Shared principles (both plugins)

- **Zero-hallucination protocol** — every claim carries an evidence tag
- **Evidence priority** — `[CÓDIGO] > [ADJUNTO] > [CONFIG] > [DOC] > [NOTEBOOKLM] > [STAKEHOLDER] > [INFERENCIA] > [SUPUESTO]`
- **Never prices** — only FTE-meses (P50/P80/P95)
- **Never green** — brand rule (use `--pos` #FFD700 gold for success)
- **Attachment handling as FASE 0** — no hallucinations on user-supplied files
- **Brand HTML render** — deterministic jinja2 + Sofka DS v5 tokens
- **Best-practice portability** — all hooks/commands use `${CLAUDE_PLUGIN_ROOT}`

---

## Installation (local)

### SDF plugin
```bash
cp -r sdf ~/.claude/plugins/marketplaces/local-desktop-app-uploads/
# Or: use this directory as a plugin source in Claude Code settings
```

### SAP plugin
```bash
cp -r sap-enterprise-plugin ~/.claude/plugins/data/
# Then enable in Claude Code via /plugins
```

Both plugins bundle a Python venv bootstrap for the attachment extractors — run once per plugin:

```bash
bash <plugin>/scripts/setup-attachments.sh
```

Python 3.10+ required (3.13 tested). See each plugin's `requirements.txt`.

---

## Tests

```bash
# SDF pytest suite (57 tests)
cd sdf
source scripts/.venv/bin/activate
pytest scripts/tests/ -v

# SDF end-to-end skill harness (mock or real)
python scripts/ecosystem/run-skill-evals.py --sample 20 --mock

# SDF compliance audit
python scripts/ecosystem/audit-compliance.py
```

CI runs automatically on push via `.github/workflows/test.yml` (inside `sdf/`).

---

## Retrospective

Full journey v2.0 → v4.0 captured in:
- `RETROSPECTIVA-SAP-v2-a-v4.md` — markdown source
- `RETROSPECTIVA-SAP-v2-a-v4.html` — Sofka brand-rendered version

Includes KEEP / STOP / START lessons, architectural decisions, metrics (0→104 skills, 0→58 agents), and recommendations for sibling plugins.

---

## License

- `sap-enterprise-plugin/` — All Rights Reserved (Javier Montaño · Sofka Technologies)
- `sdf/` — See `sdf/LICENSE` (per-plugin: SAGE proprietary, MAO GPL-3.0, etc.)

## Author

**Javier Montaño** · Sofka Technologies · javier.montano@sofka.com.co
