# SAP Enterprise Plugin v4.0 — SAGE-Grade Expansion

> **Diseñado y desarrollado por Javier Montaño**
> 104 skills · 58 agentes · 29 comandos · Sofka DS v5 brand HTML · FASE 0 attachments

## Identity

- **Plugin**: `sap-enterprise-plugin`
- **Versión**: 4.0.0
- **Prefijo comandos**: `/sap:`
- **Agente por defecto**: `@environment-orchestrator`
- **Arquitectura**: Standalone + ToT Committee + Dynamic Expert Pool + Attachment Pipeline + Brand HTML Render

---

## What's New in v4.0

| Cambio | Detalle |
|--------|---------|
| 📎 FASE 0 attachment handling | `@attachment-processor` + 8 extractors (csv, xlsx, docx, pdf, pptx, html, code, structured) |
| 🎨 HTML brand-ready render | `brand-html-render` skill + `/sap:render-html` + Sofka DS v5 tokens |
| 📚 104 skills | +90 importadas desde SDF (finance, architecture, AI, data, PM, agile, risk, methodology) |
| 🗂️ Ontología replicada | `references/ontology/` con 9 archivos (skills-catalog, agent-committee, commands-reference, pipeline, attachments, output-standards, canonical-tokens, protocol, master-index) |
| 🏷️ Tag `[ADJUNTO]` formal | Prioridad evidencia: CÓDIGO > ADJUNTO > CONFIG > DOC > NOTEBOOKLM > STAKEHOLDER > INFERENCIA > SUPUESTO |
| 🚦 Gate G1 estricto | `@qa-validator` verifica priming-rag por cada `[ADJUNTO]` |

---

## Índice de Ontología

Read on demand — NEVER load all at once:

| Necesidad | Leer |
|-----------|------|
| Protocolo zero-hallucination | `references/ontology/protocol-zero-hallucination.md` |
| Catálogo de 104 skills | `references/ontology/skills-catalog.md` |
| Roster de 58 agentes + comité 5/7/9 | `references/ontology/agent-committee.md` |
| Referencia de comandos | `references/ontology/commands-reference.md` |
| Fases ToT + HITL + gates | `references/ontology/pipeline-orchestration.md` |
| Adjuntos + extractores | `references/ontology/attachment-taxonomy.md` |
| Estándares de output | `references/ontology/output-standards.md` |
| Tokens CSS Sofka DS v5 | `references/ontology/canonical-tokens.md` |
| Master index | `references/ontology/master-index.md` |

---

## Arquitectura v4.0

```
@environment-orchestrator (meta-conductor, default)
    │
    ├── Lee references/ontology/skills-catalog.md + agent-committee.md
    ├── Si adjuntos → delega a @attachment-processor (FASE 0)
    ├── Selecciona comité 5/7/9 via select-committee.sh
    ├── Aplica pipeline ToT según _metacognitive-rules.md
    └── Delega a @sap-orchestrator
            │
            ├── FASE 0: Ingesta adjuntos + Definición (Gate G1)
            ├── FASE R: Research NotebookLM/Web (Gate G1.5)
            ├── FASE 1: Branching
            ├── FASE 2: Evaluate (Gate G2)
            ├── FASE 3: Prune & Synthesize
            └── FASE 4: Expand + Cierre metacognitivo (Gate G3)
                    │
                    └── Ghost menu: /sap:render-html <last.md> --style ...
```

---

## Attachment Pipeline (FASE 0)

Formatos soportados nativamente:

| Ext | Extractor | Locator |
|-----|-----------|---------|
| `.csv` | pandas | `col=NAME` |
| `.xlsx .xlsm .xls` | openpyxl | `sheet=NAME` |
| `.docx` | python-docx | `heading=TEXT` |
| `.pdf` | pypdf + pdfplumber | `page=N` |
| `.pptx` | python-pptx | `slide=N` |
| `.html` | beautifulsoup | `h=TEXT` |
| `.py .ts .tsx .js .sql .abap` | ast + regex | `sig=NAME` |
| `.json .yaml .xml` | stdlib + lxml | `root` |
| otros | file + strings + hexdump | `generic` |

Uso:

```bash
# Bootstrap once (venv + deps)
bash scripts/setup-attachments.sh

# Ingesta manual o vía --adjuntos
bash scripts/ingest-attachments.sh file1.xlsx file2.pdf file3.sql
# → genera .discovery/priming-rag-*.md para cada uno
```

Evidence tag: `[ADJUNTO:filename.ext:locator]`. `@qa-validator` falla si un tag no tiene priming doc.

---

## Brand HTML Render

Entregables markdown → HTML Sofka Design System v5 (tokens `--o #FF7E08`, `--bk #000`, `--bg #EFEAE4`, `--pos #FFD700`, Inter).

```bash
bash scripts/render-brand-html.sh entregable.md \
    --out entregable.html \
    --style comite|reporte|consultas|specs|discovery \
    --meta "Confianza=0.88"
```

Validado por `@qa-validator`: `var(--o)` presente, colores verdes prohibidos.

---

## Comandos (29)

Principales v3.0+:
- `/sap:menu` — paleta interactiva
- `/sap:consulta <pregunta>` — 1-3 agentes sin ToT `[--adjuntos] [--html]`
- `/sap:comite <pregunta>` — comité 5/7/9 ToT `[--adjuntos] [--html] [--auto|--hitos|--paso-a-paso]`
- `/sap:investigar <tema>` — deep research + NotebookLM `[--adjuntos] [--html]`
- `/sap:adopcion <cliente>` — plan estratégico
- `/sap:ajuste-estandar <scope>` — F2S
- `/sap:plan-{implementacion,mantenimiento,evolucion,personalizacion}`
- `/sap:diagrama-{funcional,tecnico}`, `/sap:mapa-integracion`, `/sap:clean-core`
- `/sap:notebook-{create,research,query,audio}` — NotebookLM MCP
- **NUEVO v4.0**: `/sap:render-html <file.md> [--style ...]` — brand HTML

Ver `references/ontology/commands-reference.md` para lista completa.

---

## Hard Rules (Inviolables)

1. **Autoría Javier Montaño** en cada archivo generado
2. **Evidence tags** obligatorios: `[CÓDIGO] [ADJUNTO] [CONFIG] [DOC] [NOTEBOOKLM] [STAKEHOLDER] [INFERENCIA] [SUPUESTO]`
3. **Clean Core compliance** >= 5/6
4. **NUNCA precios** — solo FTE-meses P50/P80/P95
5. **NUNCA verde** — brand rule Sofka; usar `--pos` dorado para success
6. **FASE 0 obligatoria** si hay adjuntos — hard fail en G1 si falta priming doc
7. **QA bloqueante** — `@qa-validator` antes de G1/G1.5/G2/G3
8. **Comité impar** 5, 7 o 9
9. **Spanish (LatAm)** default
10. **Cierre metacognitivo** obligatorio en outputs ToT

---

## Quick Start

```bash
# Paleta
/sap:menu

# Con adjuntos + brand HTML
/sap:comite "Evaluar Clean Core post-migración" \
    --adjuntos ./readiness-check.xlsx,./contract.pdf \
    --hitos --html

# Render de markdown existente
/sap:render-html .discovery/comite-acme-{WIP}.md --style comite
```

---

## Directory Structure

```
sap-enterprise-plugin/
├── .claude-plugin/plugin.json
├── plugin.json
├── requirements.txt                          # v4.0: deps extractors + jinja2
├── CLAUDE.md                                 # Este documento
├── agents/
│   ├── _defaults.md, _metacognitive-rules.md
│   ├── environment-orchestrator.md           # default
│   ├── sap-orchestrator.md                   # pipeline exec
│   ├── permanent/
│   │   ├── sap-docs-steward.md
│   │   ├── functional-lead.md
│   │   ├── abap-expert.md
│   │   ├── qa-validator.md
│   │   ├── attachment-processor.md           # NUEVO v4.0
│   │   └── module-specialist-legacy.md
│   ├── thematic/ (40 agentes)
│   └── modules/ (12 agentes)
├── commands/ (29 comandos)
├── skills/ (104 skills)
│   ├── sap-*/ (12 core SAP)
│   ├── sap-attachment-handling/              # NUEVO v4.0
│   ├── brand-html-render/                    # NUEVO v4.0
│   └── {90 importadas SDF}
├── templates/
│   ├── brand-html-base.html                  # NUEVO v4.0 jinja2
│   └── {20+ md templates}
├── scripts/
│   ├── setup-attachments.sh                  # NUEVO
│   ├── ingest-attachments.sh                 # NUEVO
│   ├── extract-{csv,xlsx,docx,pdf,pptx,html,code,structured}.py  # NUEVO
│   ├── extract-generic.sh                    # NUEVO
│   ├── render-brand-html.sh                  # NUEVO
│   ├── render_brand_html.py                  # NUEVO
│   └── {7 validators v3.x}
└── references/
    ├── ontology/                             # NUEVO v4.0 (9 archivos)
    ├── body-of-knowledge/
    └── knowledge-graphs/
```

---

*SAP Enterprise Plugin v4.0 — SAGE-Grade Expansion. Diseñado y desarrollado por Javier Montaño.*
*© 2026 — All Rights Reserved.*

---

## Authorship & Attribution

- **Author**: Javier Montaño
- **Contributors**: Jean Ruiz Granda (ad-hoc feedback & review) · Catherine Rodrigo
- **Co-authored with**: Claude Code
- **Copyright**: © 2026 Sofka Technologies. All Rights Reserved.

