# SAP Discovery Plugin — Monorepo

Two Claude Code plugins for the **Sofka SAGE agentic PreSales** discipline: one SAP-specific, one general-purpose. Shipped together because they share infrastructure (attachment pipeline, brand HTML render, evidence protocol) and diverge cleanly at the `/sap:` vs `/sdf:` prefix.

## The short version

| Plugin | Version | Agents | Skills | Commands | Prefix | License |
|--------|--------:|-------:|-------:|---------:|--------|---------|
| `sap-enterprise-plugin/` | 4.0.1 | 58 specialists + 2 orchestrators + 2 shared rules = 62 total .md files (invocable count: 60) | 104 | 29 | `/sap:` | All Rights Reserved |
| `sdf/` (Sofka SAGE) | 13.4.0 | 49 | 214 | 101 | `/sdf:` | Mixed (see `sdf/LICENSE`) |

Numbers count only primary plugins. `sdf/` also hosts four sibling plugins under its tree (`metodologia-discovery-framework` GPL-3.0, `pm-project-framework`, `sovereign-architect`, `plugin-qa`) that ship via the bundled `.claude-plugin/marketplace.json` — those aren't part of the totals above and follow their own release cycles.

## Why this repo exists (and what it is not)

- **Is**: the authoritative source for both plugins plus the retrospective of how SAP went from v2.0 → v4.0. Commits land here; GitHub Releases ship the zipped artefacts.
- **Is not**: a runtime. Installing the plugins means copying the relevant subdirectory into `~/.claude/plugins/...` and letting Claude Code auto-discover.
- **Is not**: a general-purpose CLI or library. The Python scripts are plugin internals; they expect `${CLAUDE_PLUGIN_ROOT}` to be set (or fall back to `dirname`-based resolution when run standalone).

## Install (plugin-agnostic)

```bash
# Bootstrap Python venv (3.10+ required, 3.13 tested) — FASE 0 extractors depend on it
bash <plugin>/scripts/setup-attachments.sh

# Install into the local Claude Code marketplace
cp -r sdf ~/.claude/plugins/marketplaces/local-desktop-app-uploads/
cp -r sap-enterprise-plugin ~/.claude/plugins/data/

# NotebookLM MCP (ships with both plugins — single unified package)
bash sdf/scripts/nlm-install.sh && nlm login && nlm doctor
```

Enable via `/plugins` inside Claude Code.

## Engineering contract (shared by both plugins)

These aren't preferences; violations fail CI and block delivery. They're listed here because they shape every file you'll touch.

- **Evidence tagging is mandatory**. Priority (v13.3+): `[CÓDIGO] > [ADJUNTO] > [CONFIG] > [DOC] > [NOTEBOOKLM] > [STAKEHOLDER] > [INFERENCIA] > [SUPUESTO]`. Deliverables with >30% `[SUPUESTO]` require a warning banner; `@qa-validator` refuses output that quotes `[ADJUNTO:file:loc]` without a matching priming-rag doc.
- **Portability**: paths use `${CLAUDE_PLUGIN_ROOT}` (with `${CLAUDE_PLUGIN_ROOT:-$(cd … && pwd)}` fallback). `$PLUGIN_DIR` / `${PLUGIN_ROOT}` are legacy and rejected by `audit-command-prefixes.sh`.
- **Brand contract**: orange `#FF7E08` primary, gold `#FFD700` for success, black `#000` structure. Green is forbidden — `grep -qE "#(00[fF]{2}00|2ecc71)|:\s*green\b"` fails CI.
- **No prices, ever**. Estimates are FTE-meses with P50/P80/P95 and a variance disclaimer.
- **FASE 0 attachment handling** runs before the committee branches. If the user drops `.csv/.xlsx/.docx/.pdf/.pptx/.html/.py/.tsx/.sql/.json/.yaml/.xml`, `@attachment-processor` normalises them to `.discovery/priming-rag-*.md` and the committee cites via `[ADJUNTO:file:locator]`. No ingest = hallucination risk.

## Testing gate (4 commands — CI runs the same)

```bash
python sdf/scripts/tests/validate_yaml.py         # 1,783 frontmatters parse
bash   sdf/scripts/audit-sdk-compliance.sh        # no Agent tool in subagents, etc.
bash   sdf/scripts/audit-command-prefixes.sh      # /sdf: only, no foreign prefixes
cd     sdf/scripts/tests && pytest -q             # 57 functional tests
```

All four must exit 0 before pushing. `.github/workflows/test.yml` re-runs them on every push.

## Architecture cheat sheet

Both plugins share a 4-layer shape. Knowing one gives you the other:

1. **`agents/*.md`** — Claude subagents. Frontmatter `name` matches filename stem; `tools:` never includes `Agent` except in orchestrators.
2. **`skills/<name>/SKILL.md`** — auto-activating skills. Full INSIGNIA structure is `SKILL.md + agents/grader.md + evals/evals.json + references/ + examples/ + scripts/ + prompts/`. Lift placeholders to AI-generated content with `scripts/ecosystem/heuristic-evals.py` (deterministic, no LLM required).
3. **`commands/*.md`** — slash commands, all prefixed with the plugin's own namespace.
4. **`references/ontology/*.md`** — progressive-disclosure hub. `CLAUDE.md` is intentionally short (~120 lines) and points to 9 (SAP) or 15 (SDF) specialised sub-files.

## Release artefacts

Historical `*.zip` bundles at the repo root are the point-in-time install payloads. They're excluded from git via `.gitignore` and ship through GitHub Releases. Regenerate with:

```bash
zip -rq sdf-v<new>.zip sdf \
  -x 'sdf/scripts/.venv/*' 'sdf/**/__pycache__/*' 'sdf/**/*.pyc' \
     'sdf/**/.discovery/*' 'sdf/evals-workspace/*' \
     'sdf/scripts/ecosystem/logs/*' \
     'sdf/sofka-discovery-framework/*' 'sdf/metodologia-discovery-framework/*' \
     'sdf/pm-project-framework/*' 'sdf/sovereign-architect/*' 'sdf/plugin-qa/*'
```

The exclude list is load-bearing: venv is ~200 MB; sibling plugin trees ship separately; `evals-workspace/` grows with every harness run.

## Retrospective

`RETROSPECTIVA-SAP-v2-a-v4.md` (and its `.html` brand-rendered sibling) traces the SAP plugin from 0 skills → 104 skills across 8 versions. Read it when proposing a major bump: it encodes the KEEP/STOP/START decisions that shaped the architecture (e.g. why subagents can't carry the `Agent` tool; why `${CLAUDE_PLUGIN_ROOT}` replaced `$PLUGIN_DIR`; why MAO stays GPL).

## Decisions and trade-offs (the why)

- **Monorepo, not two repos**: the plugins share a brand, an evidence protocol, and ~90 cross-imported skills. Splitting adds sync ceremony for little isolation benefit. Cost: larger clone; `.gitignore` must exclude venv/pycache/zips carefully.
- **Sibling plugins inside `sdf/` vs peers**: they shipped as a bundle from the start, the marketplace lives at `sdf/.claude-plugin/marketplace.json`, and each tree has its own license. Moving them to peers would break the marketplace contract. Cost: the zip build must explicitly exclude them.
- **Deterministic heuristic over LLM for grader/eval generation**: LLM calls don't scale to 1,100 skills without heavy cost and reviewer fatigue. The heuristic reads SKILL.md and produces skill-specific assertions that are the floor, not the ceiling. Trade-off: assertions are templated; a v13.5+ LLM-polish pass will raise the ceiling per-skill.
- **MCP stdio for NotebookLM (not HTTP)**: lower latency, no daemon management, works in CI. Cost: requires `notebooklm-mcp` binary on PATH (hence `scripts/nlm-install.sh`).

## Known limits

- YAML linter (`validate_yaml.py`) flags 0 failures on the 1,783 tracked files but doesn't validate schemas (only parseability).
- `audit-compliance.py` classifies graders/evals by frontmatter markers; it can't tell whether AI-generated content is semantically correct — only that it's not a placeholder. Quality is human-reviewed during the robustness cycle.
- The end-to-end skill harness runs real `claude -p` only when the CLI is on PATH. CI uses `--mock` mode; the mocked output intentionally fails most assertions, which is expected signal, not a regression.

## License

- `sap-enterprise-plugin/` — All Rights Reserved.
- `sdf/` — per-tree: SAGE proprietary, MAO GPL-3.0, others proprietary. See `sdf/LICENSE`.

## Authorship

- **Author**: Javier Montaño
- **Contributors**: Jean Ruiz Granda (ad-hoc feedback & review) · Catherine Rodrigo
- **Co-authored with**: Claude Code
- **Copyright**: © 2026 Sofka Technologies (SAP, SDF core), Comunidad MetodologIA (MAO), JM Labs (personal skills).

Contact: javier.montano@sofka.com.co
