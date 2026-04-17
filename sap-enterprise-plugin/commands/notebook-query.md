---
description: "Consultar knowledge base NotebookLM — pregunta a las fuentes importadas del notebook"
user-invocable: true
argument-hint: "<notebook-id-o-titulo> <pregunta>"
allowed-tools: [
  "mcp__notebooklm__notebook_list",
  "mcp__notebooklm__notebook_query",
  "Bash"
]
---

# /sap:notebook-query — Query NotebookLM Knowledge Base

> Diseñado por **Javier Montaño**. Plugin: sap-enterprise-plugin v3.2+

## ROL

Master: `@sap-docs-steward` (dominante — valida contra sources del notebook)
Soporte: `@sap-orchestrator` para consolidar

## OBJETIVO

Consultar un notebook con fuentes ya importadas. A diferencia de `/sap:consulta` (knowledge del modelo), esto usa **las fuentes curadas del notebook** como ground truth.

## PROTOCOLO

### CP-0 · Resolver notebook
`mcp__notebooklm__notebook_list` + match título/ID.

### CP-1 · Query
```
mcp__notebooklm__notebook_query(
  notebook_id="...",
  query="<pregunta>"
)
```

### CP-2 · Citar fuentes
- Respuesta incluye citations por source
- `@sap-docs-steward` etiqueta cada afirmación con `[NOTEBOOKLM]` + source ID
- Si pregunta no puede responderse con las sources → reportar explícitamente

### CP-F · Cierre metacognitivo
- Confianza basada en # de sources que sustentan la respuesta
- Recomendación: si hay gaps → `/sap:notebook-research` para expandir

## MCP Tools

- `notebook_query` (principal)
- `notebook_list` (resolver ID)

## MODOS

Solo `--auto` (query síncrona, respuesta inmediata).

## RESTRICCIONES

- Notebook debe tener sources importados (si está vacío → mensaje guía a `/sap:notebook-research`)
- Respuestas sin citations NO se aceptan — reject si NotebookLM no retorna sources

---
*SAP Enterprise Plugin v3.2 — Diseñado por Javier Montaño.*
