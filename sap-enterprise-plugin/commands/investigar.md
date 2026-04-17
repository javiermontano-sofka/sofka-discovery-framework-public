---
description: "Deep research SAP — comité + búsqueda web + NotebookLM research si disponible"
user-invocable: true
argument-hint: "<tema> [--auto|--hitos|--paso-a-paso]"
---

# /sap:investigar — Deep Research Committee

> Diseñado por **Javier Montaño**. Plugin: sap-enterprise-plugin v3.0

## ROL

Master: `@environment-orchestrator`
Comité: 7-9 miembros + web search tools

## OBJETIVO

Investigación profunda sobre tema SAP combinando:
- Comité ToT (perspectivas múltiples)
- Web search oficial (help.sap.com, me.sap.com, community.sap.com)
- NotebookLM deep research si disponible
- SAP Notes / Simplification Items

## PROTOCOLO

### FASE 0 · Scoping
- Definir alcance de investigación
- Detectar si hay notebook previo de NotebookLM

### FASE 1 · Branching — múltiples ángulos de investigación
Cada miembro propone una dimensión:
- Histórica/evolución
- State of the art
- Best practices
- Competitive alternatives (SAP vs Oracle vs Workday)
- Reference customers
- Roadmap futuro
- Riesgos/limitaciones

### FASE 2 · Evaluate — confianza por fuente
- `[WEB]` para web search
- `[DOC]` para help.sap.com oficial
- `[CONOCIMIENTO]` para base del modelo
- Priorizar oficial > community > model knowledge

### FASE 3 · Synthesize
- Consolidar hallazgos
- Resolver contradicciones con prioridad DOC > WEB > CONOCIMIENTO

### FASE 4 · Expand — Research Report
- Cargar `templates/research-report.md`
- Estructura: TL;DR + hallazgos + referencias + gaps + recomendaciones

## MODOS

- `--auto`: deep research completo sin pausas
- `--hitos` (default): pausa tras branching + tras synthesis
- `--paso-a-paso`: aprobación por dimensión de research

## RESTRICCIONES

- Cada afirmación con source tag
- URLs oficiales citadas textualmente
- Si info contradictoria → mostrar ambas con evidencia

---
*SAP Enterprise Plugin v3.0 — Diseñado por Javier Montaño.*
