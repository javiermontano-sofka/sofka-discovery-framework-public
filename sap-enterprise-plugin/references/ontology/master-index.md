# Master Index — SAP Enterprise Plugin v4.0

> Hub of hubs. Read on demand — NEVER load all at once.
> Author: Javier Montaño

| Necesidad | Leer |
|-----------|------|
| Protocolo de evidencia zero-hallucination | `protocol-zero-hallucination.md` |
| Catálogo completo de skills (102+) | `skills-catalog.md` |
| Roster de agentes + comité 5/7/9 | `agent-committee.md` |
| Referencia de comandos | `commands-reference.md` |
| Fases del pipeline ToT + HITL | `pipeline-orchestration.md` |
| Taxonomía de adjuntos + extractores | `attachment-taxonomy.md` |
| Estándares de output + HTML brand | `output-standards.md` |
| Tokens CSS Sofka DS v5 | `canonical-tokens.md` |

## Quick routing matrix

| Intent del usuario | Entry point |
|--------------------|-------------|
| Discovery nuevo cliente | `/sap:discovery` → `@sap-orchestrator` |
| Consulta experta rápida | `/sap:consulta` (1-3 agentes) |
| Comité dinámico ToT | `/sap:comite` (5/7/9 agentes) |
| Research + NotebookLM | `/sap:investigar` |
| Plan de adopción | `/sap:adopcion` |
| Fit-to-Standard | `/sap:ajuste-estandar` |
| Render a HTML brand | `/sap:render-html` |
| Ingesta de adjuntos | automático vía `@attachment-processor` (FASE 0) |

## Rules hardcoded into the plugin

1. **Evidence tags mandatory**: `[CÓDIGO] [CONFIG] [DOC] [ADJUNTO] [NOTEBOOKLM] [INFERENCIA] [SUPUESTO] [STAKEHOLDER]`
2. **FASE 0**: si hay adjuntos, pasa por `@attachment-processor` antes de FASE R (research)
3. **Jamás precios**: FTE-meses + disclaimers
4. **Jamás verde**: brand rule Sofka
5. **HTML brand-ready**: usar tokens en `canonical-tokens.md`, nunca hex hardcoded fuera de `:root`
