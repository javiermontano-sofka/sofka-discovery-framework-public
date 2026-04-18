# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

Monorepo containing two Claude Code plugins that ship together. Both target the **Sofka SAGE agentic PreSales** discipline but are deployed independently:

| Plugin | Path | Prefix | Domain |
|--------|------|--------|--------|
| `sap-enterprise-plugin` | `./sap-enterprise-plugin/` | `/sap:` | SAP S/4HANA Cloud discovery, ToT committee 5/7/9 |
| `sdf` (Sofka SAGE) | `./sdf/` | `/sdf:` | Universal agentic PreSales framework |

The `sdf/` tree is also a marketplace (see `sdf/.claude-plugin/marketplace.json`) hosting four sibling plugins (`metodologia-discovery-framework`, `pm-project-framework`, `sovereign-architect`, `plugin-qa`) — treat those as independent releases with their own licenses; do not cross-sync their files when working on `sdf` core.

## Architecture you need to know before touching code

Both plugins follow the same 4-layer shape — understanding one means understanding both.

1. **Agents (`agents/*.md`)** are invocable Claude subagents. Frontmatter `name` MUST match filename stem. `tools:` must NOT include `Agent` in subagents (only in orchestrators) — a CI audit enforces this.
2. **Skills (`skills/<name>/SKILL.md`)** are Claude Code auto-activating skills. Every skill directory is expected to be **7/7 INSIGNIA**: `SKILL.md + agents/grader.md + evals/evals.json + references/ + examples/ + scripts/ + prompts/`. The `scripts/ecosystem/stamp-7of7.py` helper can (re)scaffold missing dirs idempotently.
3. **Commands (`commands/*.md`)** are user-invoked slash commands. They MUST use only their own prefix (`/sap:` or `/sdf:`) — `scripts/audit-command-prefixes.sh` fails CI if a command references a foreign prefix.
4. **Orchestration (`references/ontology/*.md` + `CLAUDE.md`)** is a progressive-disclosure hub. The plugin's `CLAUDE.md` is intentionally short (≤150 lines) and points to 15+ specialised ontology sub-files. Read the hub first, then only the sub-files relevant to the task.

**Scripts live at the plugin root** (`<plugin>/scripts/`), not inside skill dirs, to avoid 1,000+ copies. Key scripts: `setup-attachments.sh` (venv bootstrap), `ingest-attachments.sh` (FASE 0 dispatcher), `render-brand-html.sh` (jinja2 renderer), `audit-*.sh` (compliance), `scripts/ecosystem/*.py` (batch tools).

**Cross-plugin evidence contract**: every factual claim in generated output must carry an evidence tag. Priority (v13.3+):

```
[CÓDIGO] > [ADJUNTO] > [CONFIG] > [DOC] > [NOTEBOOKLM] > [STAKEHOLDER] > [INFERENCIA] > [SUPUESTO]
```

`@qa-validator` / `@sofka-quality-guardian` refuse to ship deliverables that violate this contract.

## Common development tasks

```bash
# Bootstrap Python venv (Python 3.10+ required, 3.13 tested)
bash sdf/scripts/setup-attachments.sh                  # or sap-enterprise-plugin/scripts/setup-attachments.sh

# Run the pytest suite (57 tests in sdf)
source sdf/scripts/.venv/bin/activate
pip install pytest pyyaml tabulate                     # first time only
cd sdf/scripts/tests && pytest                         # all tests
pytest test_extractors.py::TestCSV::test_csv_has_required_sections  # single test

# Validate every SKILL.md + agent frontmatter parses
python sdf/scripts/tests/validate_yaml.py              # 1,783 files; exits non-zero on first failure

# Structural audits (same checks CI runs)
bash sdf/scripts/audit-sdk-compliance.sh               # subagent Agent-tool misuse, shared-rules frontmatter
bash sdf/scripts/audit-command-prefixes.sh             # foreign /xyz: references in own commands
python sdf/scripts/ecosystem/audit-compliance.py       # placeholder vs ai-generated vs real grader/eval counts

# End-to-end skill execution harness (mock mode, no tokens spent)
python sdf/scripts/ecosystem/run-skill-evals.py --sample 20 --mock

# Render markdown → Sofka DS v5 HTML (brand-compliant output)
bash sdf/scripts/render-brand-html.sh path/to/in.md --out path/to/out.html --style discovery

# Ingest attachments → priming-rag-*.md (FASE 0)
bash sdf/scripts/ingest-attachments.sh file.xlsx file.pdf file.sql

# NotebookLM MCP: install + auth (unified CLI + MCP package)
bash sdf/scripts/nlm-install.sh
nlm login && nlm doctor
```

## Conventions that are not obvious

- **`${CLAUDE_PLUGIN_ROOT}`** is the required portable path reference inside `hooks.json`, commands, and scripts. Never use `$PLUGIN_DIR`, `${PLUGIN_ROOT}`, or hardcoded paths — the audit will reject them.
- **Scripts use an env-var fallback**: `ROOT="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"` so they also work when invoked standalone outside Claude Code.
- **Brand rule — NEVER green**. `#00ff00`, `#2ecc71`, or the bare CSS keyword `green` fails the brand-render smoke test. Use `--pos` (`#FFD700` gold) for "success" signals.
- **Brand rule — NEVER prices**. Any output containing USD/COP/EUR amounts fails review. Estimates go in FTE-meses P50/P80/P95 with a disclaimer.
- **Attribution model** (v13.4+, consistent across 1,617 files): `author: Javier Montaño` · `contributors: "Jean Ruiz Granda (ad-hoc feedback & review), Catherine Rodrigo"` · `copyright` varies per plugin (Sofka / MetodologIA GPL-3.0 / JM Labs) · `co-authored-with: Claude Code`.
- **Skill descriptions are the primary trigger** for Claude's skill-selection. Use action-oriented phrasing ("Use this skill when the user asks to …"). A deterministic heuristic lifter (`scripts/ecosystem/heuristic-evals.py`) generates skill-specific graders+evals from the SKILL.md itself — prefer it over manual placeholder scaffolds.

## Release artefacts

Versioned `*.zip` files at the repo root (`sdf-v*.zip`, `sap-enterprise-plugin-v*.zip`) are historical release bundles. They are **excluded from git** via `.gitignore` and published as GitHub Releases. To build a fresh zip:

```bash
cd $(dirname sdf)
zip -rq sdf-v<new>.zip sdf \
  -x 'sdf/scripts/.venv/*' 'sdf/**/__pycache__/*' 'sdf/**/*.pyc' \
     'sdf/**/.discovery/*' 'sdf/evals-workspace/*' \
     'sdf/scripts/ecosystem/logs/*' \
     'sdf/sofka-discovery-framework/*' 'sdf/metodologia-discovery-framework/*' \
     'sdf/pm-project-framework/*' 'sdf/sovereign-architect/*' 'sdf/plugin-qa/*'
```

The exclude list is load-bearing: venv adds ~200 MB, sibling plugin trees are shipped separately, and `evals-workspace/` grows per harness run.

## Where to look when you're stuck

| Symptom | First file to read |
|---------|-------------------|
| "How do I invoke X skill/agent?" | `sdf/references/ontology/skills-catalog.md` or `agent-committee.md` |
| "What are the evidence tag rules?" | `sdf/references/ontology/protocol-zero-hallucination.md` |
| "Why did CI fail on brand rules?" | `sdf/references/ontology/canonical-tokens.md` + `scripts/tests/test_brand_render.py` |
| "How does the ToT pipeline work?" | `sdf/references/ontology/pipeline-orchestration.md` |
| "What can NotebookLM do?" | `sdf/references/ontology/notebooklm-capabilities.md` |
| "Which service type triggers which agent?" | `sdf/references/ontology/service-routing.md` |
| "Prior mistakes/corrections" | `sdf/references/ontology/lessons-learned.md` (append session corrections here) |

For SAP-specific work, the equivalent files live at `sap-enterprise-plugin/references/ontology/*.md` (9 files).

## PR workflow

Feature branches follow `feat/<scope>-<topic>`. The repo uses a structured PR body at `.github/PULL_REQUEST.md` that doubles as the commit summary. Before opening a PR, run the three-line gate:

```bash
python sdf/scripts/tests/validate_yaml.py && \
bash sdf/scripts/audit-sdk-compliance.sh && \
bash sdf/scripts/audit-command-prefixes.sh && \
(cd sdf/scripts/tests && pytest -q)
```

All four must exit 0. GitHub Actions (`sdf/.github/workflows/test.yml`) enforces the same gate on push.
