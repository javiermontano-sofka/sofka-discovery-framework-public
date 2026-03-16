---
name: metodologia-tech-debt-assessment
description: >
  Technical debt quantification, debt quadrant classification (reckless/prudent x deliberate/inadvertent),
  remediation prioritization, and paydown roadmap generation. Use when the user asks to "assess technical debt",
  "quantify debt", "classify tech debt", "prioritize remediation", or mentions debt inventory, impact scoring,
  or paydown planning.
author: Javier Montaño · Comunidad MetodologIA
version: 1.0.0
tags:
  - tech-debt
  - code-quality
  - remediation
  - architecture
  - moat
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - WebFetch
---

# Evaluacion de Deuda Tecnica

Cuantificacion, clasificacion y priorizacion de deuda tecnica en sistemas de software,
con generacion de roadmap de remediacion basado en impacto de negocio.

## TL;DR

- Inventaria y clasifica deuda tecnica usando el cuadrante de Martin Fowler (reckless/prudent x deliberate/inadvertent)
- Cuantifica impacto en velocidad de desarrollo, riesgo operacional y costo de oportunidad
- Prioriza remediation usando scoring de impacto vs esfuerzo
- Genera roadmap de paydown alineado con ciclos de delivery
- Produce inventario completo con evidencia trazable por cada item de deuda

## Inputs

Parse `$1` como **nombre del proyecto**, `$2` como **repositorio o sistema a evaluar**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)
- `{PROFUNDIDAD}`: `ejecutivo` | `tecnico` (default) | `exhaustivo`

## Entregables

1. **Inventario de Deuda Tecnica** — Catalogo completo con clasificacion por cuadrante
2. **Scoring de Impacto** — Matriz de impacto en velocidad, riesgo y costo
3. **Roadmap de Paydown** — Plan de remediacion priorizado por sprints/trimestres
4. **Mapa de Dependencias de Deuda** — Diagrama Mermaid de relaciones entre items de deuda
5. **Reporte Ejecutivo** — Resumen para stakeholders no tecnicos

## Proceso

1. **Inventario y Extraccion** — Escanear codebase, configuraciones, pipelines e infraestructura para identificar deuda tecnica existente
2. **Clasificacion por Cuadrante** — Categorizar cada item en el cuadrante Fowler:
   - Deliberada/Prudente: "Sabemos que esto es un shortcut, lo pagaremos despues"
   - Deliberada/Reckless: "No tenemos tiempo para disenar bien"
   - Inadvertida/Prudente: "Ahora sabemos como debimos haberlo hecho"
   - Inadvertida/Reckless: "Que es arquitectura en capas?"
3. **Cuantificacion de Impacto** — Evaluar cada item contra:
   - Impacto en velocidad de desarrollo (drag coefficient)
   - Riesgo operacional (probabilidad x severidad de incidente)
   - Costo de oportunidad (features no construidas por friction)
4. **Priorizacion** — Aplicar scoring de impacto vs esfuerzo, identificar quick wins y deuda critica
5. **Roadmap de Paydown** — Disenar plan de remediacion con:
   - Quick wins (alto impacto, bajo esfuerzo) para primeros sprints
   - Remediacion estrategica para trimestres siguientes
   - Guardrails para prevenir acumulacion de nueva deuda
6. **Validacion** — Verificar completitud del inventario y viabilidad del roadmap

## Criterios de Calidad

- [ ] Todo item de deuda tiene evidencia trazable [CODIGO], [CONFIG], [DOC], [INFERENCIA]
- [ ] Clasificacion por cuadrante justificada para cada item
- [ ] Scoring de impacto con criterios explicitos y reproducibles
- [ ] Roadmap alineado con capacidad real del equipo
- [ ] Quick wins identificados con ROI estimado
- [ ] Metricas de exito definidas para medir progreso de paydown
- [ ] Guardrails de prevencion documentados

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| Inventario exhaustivo | Visibilidad completa | 3-5 dias | Sistemas legacy criticos |
| Scan automatizado | Velocidad | Pierde deuda arquitectonica | Evaluacion rapida |
| Focus en quick wins | Impacto inmediato | Ignora deuda estructural | Equipos con poca capacidad |
| Paydown incremental | No detiene delivery | Mas lento | Equipos en produccion activa |

## Output Artifact

**Primary:** `Tech_Debt_Assessment_{project}.md` — Inventario, scoring, roadmap de paydown.

### Diagramas (Mermaid)
- Quadrant chart: distribucion de deuda por cuadrante Fowler
- Gantt: roadmap de paydown por trimestre
- Pie chart: distribucion de deuda por categoria

---
**Autor:** Javier Montaño · Comunidad MetodologIA | **Version:** 1.0.0
