# Error catalog — reference

Catalogued errors SDF surfaces to users + recovery actions. Organised by subsystem.

## Session / Pipeline

| Code | Condition | Recovery |
|------|-----------|----------|
| `E-SESS-001` | `.discovery/session-state.json` corrupt | `/sdf:reset-session`; loses session continuity |
| `E-SESS-002` | `.discovery/` missing after hook fire | Re-run `/sdf:prime-repo`; likely gitignore misconfig |
| `E-SESS-003` | Session started without `{TIPO_SERVICIO}` set | Orchestrator prompts; cannot proceed otherwise |
| `E-PIPE-001` | Gate G1 fail: evidence density < 60 % | Upgrade tags in P3/P4; re-request gate |
| `E-PIPE-002` | Gate G1.5: any Sabio BLOCK | Revise scope per Sabio rationale |

## FASE 0 / Attachments

| Code | Condition | Recovery |
|------|-----------|----------|
| `E-ATT-001` | Format not detected (no magic bytes match + unknown extension) | Rename with correct extension; or manual extractor invocation |
| `E-ATT-002` | Extractor crashed | Report via antifragile loop; chunk the file as workaround |
| `E-ATT-003` | Priming-rag exceeds 50 KB per file | Extractor pre-filters; inspect & re-ingest selectively |
| `E-ATT-004` | Secret pattern detected in extracted content | Redaction triggered; review redaction before use |

## NotebookLM

| Code | Condition | Recovery |
|------|-----------|----------|
| `E-NLM-001` | `nlm doctor` fails auth check | Run `nlm login`; restart Claude Code for MCP to refresh |
| `E-NLM-002` | Notebook not found | `notebook_list` to inspect; check account (`nlm login switch`) |
| `E-NLM-003` | Research deadline exceeded | Re-run `/sdf:notebook-research`; longer deadline |

## Render / Brand HTML

| Code | Condition | Recovery |
|------|-----------|----------|
| `E-RENDER-001` | Output contains green color | Template broken; re-install `render-brand-html.sh` |
| `E-RENDER-002` | `<table>` without `.tw` wrapper | Post-processor regression; check `render_brand_html.py` |
| `E-RENDER-003` | Evidence tag not highlighted | Tag pattern changed; update regex in renderer |

## Validators

| Code | Condition | Recovery |
|------|-----------|----------|
| `E-VAL-001` | `count-parity.py` ERROR: docs claim differs from filesystem | Update docs OR update filesystem; reconcile |
| `E-VAL-002` | `cross-refs.py` ERROR: referenced path missing | Fix the path OR add to ALLOW_MISSING with justification |
| `E-VAL-003` | `acronym-gate.py` ERROR: undefined acronym | Add to `GLOSSARY.md` OR add to whitelist |
| `E-VAL-004` | `adr-integrity.py` ERROR: accepted ADR mutated | Revert edit OR write superseding ADR |

## Antifragile loop

Every new error class → add a row here + write a validator (where possible) + ADR if it reveals a missing concept.
