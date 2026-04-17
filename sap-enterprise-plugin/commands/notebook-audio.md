---
description: "Generar audio overview (podcast deep-dive) del notebook NotebookLM"
user-invocable: true
argument-hint: "<notebook-id-o-titulo> [--format deep_dive|brief|critique|debate] [--language es|en]"
allowed-tools: [
  "mcp__notebooklm__notebook_list",
  "mcp__notebooklm__audio_overview_create",
  "mcp__notebooklm__studio_status",
  "Bash"
]
---

# /sap:notebook-audio — Generate Audio Overview

> Diseñado por **Javier Montaño**. Plugin: sap-enterprise-plugin v3.2+

## ROL

Master: `@sap-orchestrator`

## OBJETIVO

Generar podcast tipo "deep dive" desde el notebook para consumo asincrónico (viajes, revisión pasiva). Excelente para difundir findings de discovery al equipo.

## PROTOCOLO

### CP-0 · Resolver notebook
`mcp__notebooklm__notebook_list` + match.

### CP-1 · Lanzar generación
```
mcp__notebooklm__audio_overview_create(
  notebook_id="...",
  format="deep_dive",   # o brief|critique|debate
  language="es",          # o en
  length="default",
  focus_prompt="<opcional: ángulo específico del podcast>",
  confirm=true
)
```

### CP-2 · Polling
```
mcp__notebooklm__studio_status(notebook_id=...)
```
Espera hasta `status=completed` (5-10 minutos típico).

### CP-F · Reporte
- Duration del audio
- Artifact ID
- URL para descarga/reproducción

## MCP Tools

- `audio_overview_create`, `studio_status`, `notebook_list`

## FORMATOS

| Format | Descripción |
|--------|-------------|
| `deep_dive` (default) | 15-25 min, 2 hosts, profundo |
| `brief` | 5-8 min, resumen ejecutivo |
| `critique` | 10-15 min, análisis crítico |
| `debate` | 15-20 min, 2 perspectivas contrarias |

## RESTRICCIONES

- Notebook debe tener >= 5 sources (si no, audio será trivial)
- Rate limits: ~3-5 audios concurrentes en generación
- Languages soportados: es, en, pt, fr, de, ja, zh, ar

---
*SAP Enterprise Plugin v3.2 — Diseñado por Javier Montaño.*
