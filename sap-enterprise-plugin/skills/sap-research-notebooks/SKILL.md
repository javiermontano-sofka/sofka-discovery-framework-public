---
name: sap-research-notebooks
description: "Use this skill when you need to build, query, or leverage NotebookLM-based knowledge bases for SAP research augmentation. Covers notebook bootstrap (6 canonical notebooks per project), deep research orchestration, source validation, audio briefing generation, and NotebookLM-first validation patterns integrated with the ToT committee."
author: JM Labs (Javier Montano)
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
  - mcp__notebooklm__notebook_list
  - mcp__notebooklm__notebook_create
  - mcp__notebooklm__notebook_query
  - mcp__notebooklm__research_start
  - mcp__notebooklm__research_status
  - mcp__notebooklm__research_import
  - mcp__notebooklm__audio_overview_create
  - mcp__notebooklm__studio_status
---

# SAP Research Notebooks — NotebookLM Integration

> Diseñado por **Javier Montaño**. Plugin: sap-enterprise-plugin v3.2+

## Purpose

Integrar NotebookLM (Google) como knowledge base auxiliar del plugin SAP. Permite:
- Construir una **memoria persistente por proyecto** de sources validadas
- Deep research automatizado (~40 sources en 5-10 min)
- Validación NotebookLM-first por `@sap-docs-steward`
- Audio briefings para stakeholders
- Citations con trazabilidad por source ID

---

## Prerequisites

1. `notebooklm-mcp` binary instalado:
   ```bash
   uv tool install notebooklm-mcp-server
   ```
2. OAuth authenticated:
   ```bash
   nlm login
   ```
3. Verificar setup:
   ```bash
   bash scripts/notebook-auth-check.sh
   ```

---

## 6 Canonical Project Notebooks (bootstrap)

Al iniciar un proyecto SAP, crear los 6 notebooks canónicos:

```bash
bash scripts/notebook-bootstrap.sh <client-name>
```

Crea:
1. **SAP Clean Core & S/4HANA Cloud — {client}** — Extension strategy + A-D levels
2. **SAP Activate Methodology — {client}** — Fases, deliverables, gates
3. **SAP BTP Architecture — {client}** — Subaccounts, CPI, CAP, RAP
4. **SAP Data Migration & Cockpit — {client}** — Strangler Fig, Migration Cockpit
5. **SAP Module Configuration — {client}** — CO, SD, PS, FI specifics
6. **SAP Integration Suite & Event Mesh — {client}** — iFlows, patterns, Event Mesh

Cada notebook es un knowledge base focused por dominio.

---

## Usage Patterns

### Pattern 1 — Populate con Deep Research
```
/sap:notebook-research "SAP Activate Methodology — Acme" "SAP Activate phases quality gates 2025 best practices" --mode deep
```
Lanza deep research (~40 sources, 5-10 min) + importa.

### Pattern 2 — Query durante análisis (steward-first)
```
/sap:notebook-query "SAP Clean Core — Acme" "¿Cuáles son los Level A extensibility constraints en ABAP Cloud?"
```
Steward usa esto en lugar de knowledge general cuando existe notebook canónico.

### Pattern 3 — Audio briefing post-discovery
```
/sap:notebook-audio "SAP Activate Methodology — Acme" --format deep_dive --language es
```
Genera podcast 15-25 min para steering committee.

### Pattern 4 — Cross-validation en comité ToT
Durante FASE 2 (Evaluate), `@sap-docs-steward` automáticamente:
1. Detecta claims `[INFERENCIA]` o `[CONOCIMIENTO]` del comité
2. Pregunta al notebook relevante vía `notebook_query`
3. Si notebook confirma → upgrade a `[NOTEBOOKLM]` + `[DOC]`
4. Si no confirma → mantener marca original

---

## MCP Tools Usage

| Tool | Use case |
|------|----------|
| `notebook_list` | Listar notebooks disponibles |
| `notebook_create` | Crear nuevo notebook |
| `notebook_query` | Preguntar a sources (steward-first validation) |
| `research_start` | Lanzar deep research automatizado |
| `research_status` | Polling hasta completación |
| `research_import` | Importar sources encontradas |
| `audio_overview_create` | Generar podcast deep-dive |
| `studio_status` | Polling audio generation |

---

## Evidence Tag Integration

El tag `[NOTEBOOKLM]` se integra al sistema de 14+ tags del plugin:

- **Confianza**: alta (0.85-1.0) cuando source oficial citada
- **Formato**: `[NOTEBOOKLM source_id=xxx notebook="SAP Activate — Acme"]`
- **Combinable**: típicamente combinado con `[DOC]` (URL oficial extraída de source)
- **Superior a**: `[CONOCIMIENTO]` y `[INFERENCIA]` para SAP objects

---

## Source Quality Heuristic

Al importar resultados de deep research, `@sap-docs-steward` clasifica sources:

| Tipo de source | Confianza default | Tag asignado |
|----------------|-------------------|--------------|
| help.sap.com | 0.95 | `[NOTEBOOKLM][DOC]` oficial |
| rapid.sap.com | 0.95 | `[NOTEBOOKLM][DOC]` oficial |
| me.sap.com | 0.90 | `[NOTEBOOKLM][DOC]` requiere login |
| community.sap.com | 0.75 | `[NOTEBOOKLM][DOC]` non-official caveat |
| blog vendor (Accenture, Deloitte) | 0.65 | `[NOTEBOOKLM][SUPUESTO]` third-party |
| blog personal | 0.50 | `[NOTEBOOKLM][SUPUESTO]` non-validated |

**Regla de oro**: Siempre citar source_id + URL para auditabilidad.

---

## Anti-Patterns

1. **Crear notebook sin deep research** — notebook vacío no aporta
2. **Query sin notebook populated** — error: no hay sources para consultar
3. **Confiar 100% en sources community** — siempre validar con oficial si disponible
4. **No invalidar caché cuando SAP publica updates** — refresh cada 3-6 meses
5. **Usar notebook-query en lugar de `/sap:consulta` para todo** — notebook-query es para claims específicos SAP, no conversación general

---

## Quality Criteria

1. Bootstrap ejecutado al inicio de cada proyecto SAP
2. Al menos 3/6 notebooks poblados con deep research antes de FASE 2 de cualquier comando
3. `@sap-docs-steward` usa notebook_query como default cuando notebook existe
4. Citations `[NOTEBOOKLM source_id=xxx]` en todos los deliverables
5. Audio briefing generado para deliverables estratégicos (adopción, solution design)

---

## Integration Points

- **Agents**: `@sap-docs-steward` (primary), `@environment-orchestrator` (availability check), `@sap-orchestrator` (FASE R augmentation)
- **Commands**: `/sap:notebook-create`, `/sap:notebook-research`, `/sap:notebook-query`, `/sap:notebook-audio`
- **Scripts**: `scripts/notebook-auth-check.sh`, `scripts/notebook-bootstrap.sh`
- **Metacognitive**: `[NOTEBOOKLM]` tag in `_metacognitive-rules.md`

---
*SAP Enterprise Plugin v3.2 — Diseñado por Javier Montaño.*
