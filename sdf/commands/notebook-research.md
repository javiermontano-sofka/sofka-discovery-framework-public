---
description: "Deep research automatizado: lanza research_start en NotebookLM, espera completación, e importa sources"
user-invocable: true
argument-hint: "<notebook-id-o-titulo> <query> [--mode fast|deep]"
allowed-tools: [
  "mcp__notebooklm__notebook_list",
  "mcp__notebooklm__research_start",
  "mcp__notebooklm__research_status",
  "mcp__notebooklm__research_import",
  "Bash"
]
---

# /sdf:notebook-research — Deep Research Automatizado

> Diseñado por **Javier Montaño**. Plugin: sdf v3.2+

## ROL

Master: `@discovery-conductor`
Validador: `@research-scientist` (valida sources importados contra referencias oficiales)

## OBJETIVO

Lanzar deep research en NotebookLM para un notebook + query, esperar completación, importar sources. Diferente a `/sdf:investigar` (que usa web search directo) — este comando **construye una knowledge base persistente** en NotebookLM para consultas futuras.

## PROTOCOLO

### CP-0 · Identificar notebook
1. Si `$ARGUMENTS` contiene notebook ID (UUID) → usar directo.
2. Si es título → `mcp__notebooklm__notebook_list` + match fuzzy + elegir.

### CP-1 · Lanzar research
```
mcp__notebooklm__research_start(
  notebook_id="...",
  query="<query>",
  source="web",
  mode="fast"  # o "deep" para ~40 sources vs ~10
)
```

### CP-2 · Polling
Loop hasta `status=completed`:
```
mcp__notebooklm__research_status(notebook_id=..., task_id=...)
```
Timeout máximo: fast=2min, deep=15min.

### CP-3 · Import
```
mcp__notebooklm__research_import(notebook_id=..., task_id=...)
```

### CP-4 · Validación
`@research-scientist` valida:
- % de sources son oficiales SAP (help.sap.com, me.sap.com, rapid.sap.com)
- % son community (community.sap.com)
- % son third-party (flagged como [SUPUESTO] hasta confirmación)

### CP-F · Reporte
- Número de sources importados
- Distribución por tipo de fuente
- Notebook URL para review manual

## MCP Tools

- `research_start`, `research_status`, `research_import` (notebooklm)
- `notebook_list` para resolver título → ID

## MODOS

- `--mode fast` (default): ~10 sources, ~30-60 segundos
- `--mode deep`: ~40 sources, ~5-10 minutos

## RESTRICCIONES

- OAuth debe estar vivo (si expira mid-research, re-autenticar con `nlm login`)
- Rate limits de NotebookLM: max ~5 researches concurrentes
- Fast mode retorna sources heterogéneos; deep mode prioriza oficiales

---
*SAP Enterprise Plugin v3.2 — Diseñado por Javier Montaño.*
