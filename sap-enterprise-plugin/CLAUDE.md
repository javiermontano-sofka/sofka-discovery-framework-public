# SAP Enterprise Plugin v4.0.1 — Orchestration Hub

Standalone Claude Code plugin for SAP S/4HANA Cloud discovery + implementation + operations. This `CLAUDE.md` is the ops hub: it states the invariants, names the commands, and routes to the detailed ontology sub-files. Read the sub-files only for the current task — reading all of them upfront wastes context.

## Identity

- **Plugin**: `sap-enterprise-plugin` · `/sap:` prefix
- **Version**: 4.0.1 (patch: portability + description polish on top of v4.0 SAGE-Grade)
- **Default agent**: `@environment-orchestrator`
- **Default language**: Spanish (LatAm)
- **Architecture**: Standalone + ToT Committee 5/7/9 + Dynamic Expert Pool + FASE 0 Attachment Pipeline + Brand HTML Render

## Version history

| Version | Headline |
|---------|----------|
| **4.0.1** | Portability patch: `${CLAUDE_PLUGIN_ROOT}` convention, description polish, `.gitignore` |
| 4.0.0 | SAGE-Grade expansion: FASE 0 attachments, brand HTML render, 90 skills imported from SDF, 9 ontology files |
| 3.4.0 | Robustness cycle complete (12 skills at 7/7 INSIGNIA) |
| 3.2.0 | NotebookLM MCP integrated, `/sap:notebook-*` commands, [NOTEBOOKLM] provenance tag |
| 3.1.0 | Hardening: `Agent` tool removed from subagents, shared-rules frontmatter cleaned, action-oriented descriptions |
| 3.0.0 | ToT Committee 5/7/9 architecture, 58 agents, 14 Spanish commands with HITL modes |
| 2.1.0 | Standalone extraction from SDF, 6 specialists, 10 English commands |
| 2.0.0 | Initial SAP v2 integrated in SDF plugin |

Full delta → `plugin.json` `changelog` field.

## Ontology index (9 sub-files)

`CLAUDE.md` is a hub. Read sub-files on demand:

| Need | File |
|------|------|
| Evidence-tag catalog + priority | `references/ontology/protocol-zero-hallucination.md` |
| Master index (entry points per intent) | `references/ontology/master-index.md` |
| Catalog of 104 skills by domain | `references/ontology/skills-catalog.md` |
| Roster of 58 agents + committee composition | `references/ontology/agent-committee.md` |
| Reference of 29 commands | `references/ontology/commands-reference.md` |
| Pipeline phases (FASE 0/R/1-4) + gates | `references/ontology/pipeline-orchestration.md` |
| Attachment taxonomy + extractors | `references/ontology/attachment-taxonomy.md` |
| Output standards + filename convention | `references/ontology/output-standards.md` |
| Canonical CSS tokens (Sofka DS v5) | `references/ontology/canonical-tokens.md` |

## Architecture

```
@environment-orchestrator (meta-conductor, default)
│   reads: skills-catalog.md + agent-committee.md
│   decides: {TIPO_SERVICIO}, committee size, HITL mode
│
├── FASE 0: @attachment-processor          ← if --adjuntos or files in ./adjuntos/
│    produces .discovery/priming-rag-*.md
│
└── delegates to @sap-orchestrator
        │
        ├── FASE R: NotebookLM research via mcp__notebooklm__*     [Gate G1.5]
        ├── FASE 1: Branching (3+ divergent proposals, 1 per committee member)
        ├── FASE 2: Evaluate (QA + Steward score each branch)       [Gate G1]
        ├── FASE 3: Prune & Synthesize (winner needs confidence ≥0.7) [Gate G2]
        └── FASE 4: Expand + metacognitive closing                  [Gate G3]
                │
                └── Ghost menu: /sap:render-html <last.md> --style comite
```

### Committee composition (dynamic)

| Complexity | Size | Permanent (always 4) | Flex |
|------------|------|---------------------|------|
| Low | 5 | steward + functional-lead + abap-expert + qa-validator | 1 (thematic OR module) |
| Medium | 7 | same 4 | 3 (e.g. 2 thematic + 1 module) |
| High | 9 | same 4 | 5 (3 thematic + 2 module) |

`@attachment-processor` joins when attachments are present but does NOT count toward voting quorum. Committee size is always odd to eliminate ties during ToT prune.

Full roster + composition rules → `references/ontology/agent-committee.md`.

## Hard rules (violations block delivery)

1. **Evidence tags mandatory** — priority `[CÓDIGO] > [ADJUNTO] > [CONFIG] > [DOC] > [NOTEBOOKLM] > [STAKEHOLDER] > [INFERENCIA] > [SUPUESTO]`. Untagged claims are demoted to `[SUPUESTO]` or removed.
2. **Clean Core ≥5/6** per extension. Level D violations rejected. Validator: `scripts/validate-clean-core.sh`.
3. **No prices** — FTE-meses P50/P80/P95 + variance disclaimer. USD/COP/EUR fails review.
4. **No green** — Sofka brand rule. `#00ff00`, `#2ecc71`, bare `green` all fail the brand-render smoke test. Use `--pos` (`#FFD700`) for success.
5. **FASE 0 hard fail** — `[ADJUNTO:file:loc]` without matching `.discovery/priming-rag-*.md` blocks Gate G1.
6. **QA bloqueante** — `@qa-validator` runs before every gate (G1/G1.5/G2/G3). Its refusal halts pipeline.
7. **Comité impar** — 5/7/9 only. 6 or 8 is not a valid size.
8. **Cierre metacognitivo** obligatorio — every ToT output ends with `📊 METADATA DE RAZONAMIENTO` block.
9. **SAP-object validation** — `@sap-docs-steward` verifies tables/BAPIs/CDS/Fiori apps against NotebookLM first, then fallback knowledge. If no source validates, responds "No tengo referencia validada" rather than fabricating.
10. **Spanish (LatAm)** default output language; evidence tags stay Spanish.

## FASE 0 — Attachment pipeline

Supported formats (9 extractors + generic fallback):

| Ext | Extractor | Locator pattern |
|-----|-----------|-----------------|
| `.csv` | pandas | `col=NAME` |
| `.xlsx .xlsm .xls` | openpyxl | `sheet=NAME` |
| `.docx` | python-docx | `heading=TEXT` |
| `.pdf` | pypdf + pdfplumber | `page=N` |
| `.pptx` | python-pptx | `slide=N` |
| `.html` | beautifulsoup | `h=TEXT` |
| `.py .ts .tsx .js .sql .abap` | ast + regex | `sig=NAME` |
| `.json .yaml .xml` | stdlib + lxml | `root` |
| other | `file` + `strings` + `hexdump` | `generic` |

```bash
# One-time setup
bash scripts/setup-attachments.sh           # Python 3.10+ venv + deps

# Ingest attachments → .discovery/priming-rag-*.md
bash scripts/ingest-attachments.sh contract.pdf readiness-check.xlsx

# Pipe in via command
/sap:comite "<pregunta>" --adjuntos contract.pdf,readiness-check.xlsx --hitos
```

Evidence tag format: `[ADJUNTO:contract.pdf:page=4]`. `@qa-validator` fails the deliverable if any tag lacks its priming doc.

Detail → `references/ontology/attachment-taxonomy.md`.

## Brand HTML render

Markdown → Sofka DS v5 HTML via jinja2 (deterministic, no LLM):

```bash
bash scripts/render-brand-html.sh <input.md> \
    --out <output.html> \
    --style comite|reporte|consultas|specs|discovery \
    --meta "Confianza=0.88" --meta "Comité=7"
```

Validation is grep-based and runs in CI: `var(--o)` must appear, no green hex values, `<table>` must be wrapped in `.tw`, evidence tags wrapped in `<span class="t …">`.

Tokens reference → `references/ontology/canonical-tokens.md`.

## Quick start

```bash
# Interactive palette (start here if uncertain)
/sap:menu

# Quick query without ToT overhead
/sap:consulta "¿Cuál es el Scope Item recomendado para intercompany billing?"

# Full committee ToT with attachments + HTML output
/sap:comite "Evaluar Clean Core post-migración de AcmeCorp" \
    --adjuntos ./readiness-check.xlsx,./contract.pdf \
    --hitos --html

# Render an existing markdown deliverable to branded HTML
/sap:render-html .discovery/01_SAP_Scope_AcmeCorp_{WIP}.md --style comite
```

## Repository shape

```
sap-enterprise-plugin/
├── .claude-plugin/plugin.json     # Manifest with structured author/contributors/copyright
├── plugin.json                    # Legacy manifest (kept for backward-compat)
├── CLAUDE.md                      # This hub
├── requirements.txt               # pandas, openpyxl, python-docx, pypdf, pdfplumber,
│                                  # python-pptx, beautifulsoup4, lxml, jinja2, markdown
├── .mcp.json                      # NotebookLM MCP stdio config
├── agents/
│   ├── _defaults.md               # Shared rules — no `name:` (not invocable)
│   ├── _metacognitive-rules.md    # ToT 4-phase pipeline spec
│   ├── environment-orchestrator.md  # Default meta-conductor
│   ├── sap-orchestrator.md        # Pipeline executor
│   ├── permanent/                 # 6 (docs-steward, functional-lead, abap-expert,
│   │                              #    qa-validator, attachment-processor, module-specialist-legacy)
│   ├── thematic/                  # 40 domain experts
│   └── modules/                   # 12 module specialists (FI/CO/SD/MM/...)
├── commands/                      # 29 /sap:* commands
├── skills/                        # 104 skills (12 sap-* + 90 imported + 2 v4.0)
├── templates/                     # brand-html-base.html + 20 deliverable templates
├── scripts/
│   ├── setup-attachments.sh       # venv bootstrap
│   ├── ingest-attachments.sh      # FASE 0 dispatcher
│   ├── extract-{csv,xlsx,docx,pdf,pptx,html,code,structured}.py
│   ├── extract-generic.sh         # Fallback for unknown types
│   ├── render-brand-html.sh       # Jinja2 wrapper
│   ├── render_brand_html.py
│   ├── notebook-auth-check.sh     # Verify nlm auth
│   ├── notebook-bootstrap.sh      # Create canonical SAP notebooks
│   └── validate-*.sh              # Clean Core, gap registry, F2S scoring (zero-API)
└── references/
    ├── ontology/                  # 9 hub children (listed above)
    ├── body-of-knowledge/
    └── knowledge-graphs/
```

## Known limits

- `validate-clean-core.sh` is static (regex + ATC pattern matching); runtime ATC verification requires a real SAP system.
- `@sap-docs-steward` NotebookLM lookup requires `nlm login` success + a SAP-relevant client notebook; without these it falls back to general knowledge (flagged `[SUPUESTO]`).
- Committee size capped at 9 — queries needing >9 distinct expertises should decompose into multiple `/sap:comite` invocations.
- `/sap:generate-abap` produces scaffolding validated statically; always dry-run ATC locally before committing to an SAP system.
- `scripts/validate-*.sh` are zero-API (grep/awk only) by design, keeping the pipeline usable in air-gapped demos but preventing live system introspection.

## Decisions and trade-offs

- **`${CLAUDE_PLUGIN_ROOT}` over `$PLUGIN_DIR`** — official Anthropic convention. Migration was v4.0.1. Scripts include a fallback so they work standalone.
- **Odd committee sizes** — eliminate tie-break ambiguity. No 6/8-member option fits cleanly.
- **90 skills imported from SDF, not duplicated** — cross-cutting skills (cost-estimation, risk-monitoring, etc.) are identical; duplicating creates drift. Risk: SDF rename breaks imports — mitigated by `audit-command-prefixes.sh`.
- **NotebookLM-first validation** — curated client knowledge beats general-knowledge fabrication. Cost: requires upstream auth + client-specific notebooks.
- **Spanish default** — audience is LatAm SAP customers. Tags stay Spanish for UI consistency.
- **Zero-API validators** — keeps demos air-gap-safe but prevents live SAP introspection. Use SAP-side tooling (ATC, Inspector, …) for runtime checks.

## Author + attribution

- **Author**: Javier Montaño
- **Contributors**: Jean Ruiz Granda (ad-hoc feedback & review) · Catherine Rodrigo
- **Co-authored with**: Claude Code
- **Copyright**: © 2026 Sofka Technologies. All Rights Reserved.
