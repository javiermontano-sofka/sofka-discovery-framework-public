# SAP Enterprise Plugin — v4.0.1

Standalone Claude Code plugin for SAP S/4HANA Cloud discovery, implementation, and post-go-live operations. Ships as a dynamic 5/7/9-member ToT committee over a 4-phase metacognitive pipeline, with FASE 0 attachment ingestion, NotebookLM MCP, and a deterministic Sofka DS v5 brand HTML renderer.

## Current state — v4.0.1

| Resource | Count |
|----------|------:|
| Agents | 58 (6 permanent + 40 thematic + 12 module specialists) |
| Skills | 104 (12 SAP-core + 90 SDF-imported + 2 v4.0 additions) |
| Commands | 29 (all `/sap:*`) |
| Ontology sub-files | 9 |
| Extractors (FASE 0) | 9 (csv/xlsx/docx/pdf/pptx/html/code/structured/generic) |
| MCP servers embedded | 1 (NotebookLM) |
| Languages | Spanish (LatAm) default |

## What the plugin does

Drives a SAP engagement from cold-repo intake to roadmap + ABAP Cloud scaffolding. Key capabilities:

- Normalizes heterogeneous attachments (contracts, readiness-check exports, scope docs) into evidence-tagged priming docs.
- Runs a dynamic 5/7/9-member ToT committee over Definición → Branching → Evaluate → Prune → Expand, with 3 HITL modes (`--auto`, `--hitos`, `--paso-a-paso`).
- Enforces Clean Core compliance (≥5/6 criteria per extension; Level D rejected).
- Emits 9 brand-compliant deliverables per full `/sap:discovery` run, plus optional HTML render via `/sap:render-html`.
- Validates SAP objects against curated NotebookLM knowledge bases (NotebookLM-first validation before fallback to general knowledge).

## What it is not

- Not a code executor — generated ABAP Cloud extensions need human review and SAP-side deployment.
- Not a general consultant — stay within SAP S/4HANA Cloud + BTP scope; hand off non-SAP work to the SDF plugin.
- Not free of cost — a full `/sap:discovery` burns substantial tokens (committee = up to 9 agents × ToT phases).

## Install

```bash
# Option 1 — copy into marketplace
cp -r sap-enterprise-plugin ~/.claude/plugins/data/

# Option 2 — symlink for development
ln -s "$PWD/sap-enterprise-plugin" ~/.claude/plugins/data/sap-enterprise-plugin

# Bootstrap Python venv (3.10+ required, 3.13 tested) for FASE 0 extractors
bash ~/.claude/plugins/data/sap-enterprise-plugin/scripts/setup-attachments.sh

# NotebookLM MCP — optional but recommended
bash sap-enterprise-plugin/scripts/nlm-install.sh 2>/dev/null || nlm --version
nlm login && nlm doctor
```

Restart Claude Code → `/sap:menu` confirms activation.

## Entry points

| Scenario | Command | Produces |
|----------|---------|----------|
| Uncertain — explore | `/sap:menu` | Interactive palette |
| Quick query (1-3 agents, no ToT) | `/sap:consulta "<question>"` | Short structured answer |
| Full committee with ToT | `/sap:comite "<question>" [--auto\|--hitos\|--paso-a-paso] [--adjuntos] [--html]` | Deliberation + verdict |
| Full SAP discovery pipeline | `/sap:discovery <client>` | 9 deliverables (landscape → handover) |
| Deep research | `/sap:investigar "<topic>"` | Research doc + NotebookLM citations |
| Adoption strategy roadmap | `/sap:adopcion <client>` | Adoption plan |
| Fit-to-Standard workshop | `/sap:ajuste-estandar <module>` | F2S scoring + gaps |
| ABAP Cloud extension | `/sap:generate-abap "<requirement>"` | CDS + BDEF + service + tests |
| Clean Core blueprint | `/sap:clean-core <client>` | Strategic blueprint |
| Markdown → branded HTML | `/sap:render-html <file.md> --style comite\|reporte\|discovery` | HTML (Sofka DS v5) |

Full list (29 commands) → `references/ontology/commands-reference.md`.

## Architecture (4-layer)

```
sap-enterprise-plugin/
├── .claude-plugin/plugin.json    # Manifest
├── CLAUDE.md                     # Orchestration hub (read this first)
├── plugin.json                   # Legacy manifest (kept for backward-compat)
├── agents/                       # 58 agents
│   ├── _defaults.md              # Shared rules (no `name:` — not invocable)
│   ├── _metacognitive-rules.md   # ToT 4-phase pipeline spec
│   ├── environment-orchestrator.md   # Default meta-conductor
│   ├── sap-orchestrator.md       # Pipeline executor
│   ├── permanent/                # 6: docs-steward, functional-lead, abap-expert,
│   │                             #    qa-validator, attachment-processor,
│   │                             #    module-specialist-legacy
│   ├── thematic/                 # 40 domain experts
│   └── modules/                  # 12 module specialists (FI/CO/SD/MM/...)
├── commands/                     # 29 /sap:* commands
├── skills/                       # 104 skills (12 SAP + 90 imported + 2 v4.0)
├── templates/                    # 20+ deliverable templates + brand HTML base
├── scripts/                      # Extractors, renderer, validators, audits
├── references/
│   ├── ontology/                 # 9 hub children (read on demand)
│   ├── body-of-knowledge/
│   └── knowledge-graphs/
└── .mcp.json                     # NotebookLM MCP stdio config
```

## Committee composition (dynamic)

`@environment-orchestrator` picks the committee at FASE 0 based on query complexity:

| Complexity | Size | Composition |
|------------|------|-------------|
| Low | 5 | 4 permanent + 1 flex (thematic or module) |
| Medium | 7 | 4 permanent + 3 flex (typically 2 thematic + 1 module) |
| High | 9 | 4 permanent + 5 flex (3 thematic + 2 module) |

Permanent 4: `@sap-docs-steward`, `@functional-lead`, `@abap-expert`, `@qa-validator`. `@attachment-processor` joins when attachments are present.

Committee size is always odd so majority voting resolves ties during ToT prune.

Full roster → `references/ontology/agent-committee.md`.

## Hard rules

1. **Evidence tags mandatory**. Priority: `[CÓDIGO] > [ADJUNTO] > [CONFIG] > [DOC] > [NOTEBOOKLM] > [STAKEHOLDER] > [INFERENCIA] > [SUPUESTO]`.
2. **Clean Core ≥5/6** per extension. Level D violations rejected by `@qa-validator`.
3. **No prices** — FTE-meses P50/P80/P95 with disclaimer.
4. **No green** — Sofka brand rule. Use `--pos` (`#FFD700`) for success.
5. **QA gate blocking** — `@qa-validator` runs `scripts/validate-*.sh`; failing scripts halt delivery.
6. **Templates load before generation** — agents pull from `templates/` instead of inventing structure.
7. **SAP-object validation** — `@sap-docs-steward` verifies tables, BAPIs, CDS views, Fiori apps, Scope Items against NotebookLM first, then fallback knowledge. If no validated reference exists, responds "No tengo referencia validada" rather than fabricating.
8. **Spanish (LatAm) default** — evidence tags and section headings stay in Spanish.

## Sample deliverable set (full `/sap:discovery`)

```
00_SAP_Landscape_AcmeCorp_{WIP}.md
01_SAP_Scope_AcmeCorp_{WIP}.md
02_FitToStandard_AcmeCorp_{WIP}.md
03_Gap_Registry_AcmeCorp_{WIP}.md
04_Solution_Architecture_AcmeCorp_{WIP}.md
05_Migration_Plan_AcmeCorp_{WIP}.md
06_SAP_Roadmap_AcmeCorp_{WIP}.md
07_SAP_Pitch_AcmeCorp.html            # rendered via /sap:render-html
08_SAP_Handover_AcmeCorp.md
```

Filename convention `{phase}_{deliverable}_{client}_{WIP|Aprobado}.{ext}` drives session hooks and auto-rendering — renaming breaks tracking.

### ABAP Cloud generation output

`/sap:generate-abap "<requirement>"` writes `.abap-cloud-extension/` with:
- CDS entities (root + projection)
- Behavior definition with draft handling
- Service definition + OData V4 binding
- Fiori Elements metadata annotations
- ABAP Unit tests
- Communication Arrangement documentation

All validated against `scripts/validate-clean-core.sh` before delivery.

## Known limits

- Clean Core validation is static (regex + ATC patterns); runtime ATC still needs SAP-side verification.
- `@sap-docs-steward` NotebookLM lookup requires `nlm login` to have succeeded and a SAP-relevant notebook to exist for the client; otherwise it falls back to general knowledge (flagged `[SUPUESTO]`).
- `/sap:generate-abap` produces scaffolding, not tested in a real SAP system — always dry-run ATC locally before committing.
- Committee size is capped at 9; queries requiring broader expertise should decompose into multiple invocations rather than forcing size 11+.

## Decisions and trade-offs

- **90 skills imported from SDF vs writing SAP-specific ones from scratch** — cross-cutting skills (cost-estimation, risk-monitoring, compliance-tracking, etc.) are identical between contexts; duplicating creates drift. Trade-off: breaks if SDF renames a skill — mitigated by `audit-command-prefixes.sh`.
- **Odd committee sizes (5/7/9)** — eliminate tie-break ambiguity during ToT prune voting. Cost: no 6-member "default" fits cleanly.
- **NotebookLM-first validation** — curated project knowledge beats general-knowledge fabrication. Cost: requires upstream NotebookLM auth + client-specific notebooks.
- **Spanish default** — audience is LatAm enterprise (Sofka's market). Evidence tags stay Spanish for UI consistency.
- **Zero-API mode for validators** — `scripts/validate-*.sh` use local grep/awk only; no SAP API calls required. This keeps the pipeline usable in air-gapped demos but prevents live SAP system introspection.

## Support

- Documentation hub: [`CLAUDE.md`](./CLAUDE.md)
- Command palette: `/sap:menu`
- Ontology: `references/ontology/`

## License + attribution

All Rights Reserved © 2026 Sofka Technologies.

- **Author**: Javier Montaño
- **Contributors**: Jean Ruiz Granda (ad-hoc feedback & review) · Catherine Rodrigo
- **Co-authored with**: Claude Code
- Contact: javier.montano@sofka.com.co
