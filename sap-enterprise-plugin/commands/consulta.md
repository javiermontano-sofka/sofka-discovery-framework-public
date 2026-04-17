---
description: "Consulta simple SAP — 1-3 agentes, respuesta directa sin ToT completo. Acepta --adjuntos (csv/xlsx/docx/pdf/pptx/html/py/tsx/sql) y --html para brand render."
user-invocable: true
argument-hint: "<pregunta> [--adjuntos path1,path2,...] [--html]"
---

# /sap:consulta — Query Simple

> Diseñado por **Javier Montaño**. Plugin: sap-enterprise-plugin v3.0

## ROL

Master: `@environment-orchestrator` (modo light)
Delegación mínima: `@sap-docs-steward` + 1 experto contextual (thematic o module)

## OBJETIVO

Responder consultas factuales simples sin activar pipeline ToT completo. Típico: "¿qué es la tabla X?", "¿cuál es el scope item Y?", "¿qué significa Z?"

## PROTOCOLO

### CP-0 · Detección
`@environment-orchestrator` analiza query:
- Si requiere análisis/decisión → reroute a `/sap:comite`
- Si es factual simple → continuar

### CP-1 · Answer
`@sap-docs-steward` valida objetos SAP citados.
1 experto contextual aporta respuesta enriquecida.

### CP-F · Cierre
Respuesta con evidence tags ([DOC], [CONOCIMIENTO]) + cierre metacognitivo abreviado.

## MODO

- `--auto` (default): respuesta directa sin pausas

## RESTRICCIONES

- Si query involucra >= 2 módulos o decisión → **reroute automático** a `/sap:comite`
- Si query requiere web search → reroute a `/sap:investigar`
- Si `@sap-docs-steward` no tiene referencia → respuesta: "No tengo referencia validada"

---
*SAP Enterprise Plugin v3.0 — Diseñado por Javier Montaño.*
