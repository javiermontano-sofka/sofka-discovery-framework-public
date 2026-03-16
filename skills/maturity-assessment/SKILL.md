---
name: sofka-maturity-assessment
description: >
  Capability maturity evaluation using CMMI and custom models, current vs target state scoring,
  and improvement roadmap generation. Use when the user asks to "assess maturity", "evaluate capability",
  "create maturity model", or mentions maturity heatmap, gap analysis, capability assessment,
  or evolution plan.
author: Equipo PreSales Sofka
version: 1.0.0
tags:
  - maturity
  - cmmi
  - capability
  - assessment
  - gap-analysis
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

# Evaluacion de Madurez

Evaluacion de madurez de capacidades usando modelos CMMI y custom, scoring de estado
actual vs target, y generacion de roadmap de evolucion.

## TL;DR

- Evalua madurez actual de capacidades clave contra modelo de referencia (CMMI o custom)
- Genera heatmap visual de madurez por dominio y capacidad
- Identifica gaps criticos entre estado actual y target con root cause
- Disena plan de evolucion priorizado por impacto en negocio
- Produce assessment reproducible con criterios explicitos por nivel

## Inputs

Parse `$1` como **nombre de la organizacion/equipo**, `$2` como **dominios a evaluar**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)
- `{MODELO}`: `cmmi` (default) | `custom` | `devops` | `data` | `agile`

## Entregables

1. **Maturity Heatmap** — Mapa visual de madurez por dominio (nivel 1-5)
2. **Gap Analysis** — Comparacion current vs target con gaps priorizados
3. **Plan de Evolucion** — Roadmap de mejora por trimestre con milestones
4. **Assessment Report** — Documento detallado con evidencia por cada scoring
5. **Quick Wins Catalog** — Mejoras de bajo esfuerzo y alto impacto inmediato

## Proceso

1. **Definicion de Modelo** — Seleccionar o adaptar modelo de madurez:
   | Nivel | Nombre | Caracteristicas |
   |---|---|---|
   | 1 | Inicial | Ad-hoc, reactivo, dependiente de heroes |
   | 2 | Gestionado | Procesos basicos, repetible en proyectos similares |
   | 3 | Definido | Estandarizado, documentado, proactivo |
   | 4 | Cuantitativamente Gestionado | Medido, predecible, basado en datos |
   | 5 | Optimizado | Mejora continua, innovacion sistematica |
2. **Identificacion de Capacidades** — Definir capacidades a evaluar por dominio:
   - Desarrollo: CI/CD, testing, code review, architecture
   - Operaciones: monitoring, incident response, capacity planning
   - Datos: data quality, governance, analytics, ML ops
   - Personas: skills, cultura, onboarding, retention
   - Procesos: agile practices, delivery, estimation
3. **Evaluacion por Capacidad** — Scoring 1-5 con evidencia explicita y justificacion
4. **Gap Analysis** — Calcular delta current vs target, identificar root causes de gaps
5. **Priorizacion** — Ordenar gaps por impacto en negocio x viabilidad de cierre
6. **Plan de Evolucion** — Disenar roadmap con milestones trimestrales, metricas de progreso, y criterios de exito

## Criterios de Calidad

- [ ] Modelo de madurez definido con criterios explicitos por nivel
- [ ] Todas las capacidades evaluadas con evidencia trazable
- [ ] Heatmap generado con visualizacion clara de estado
- [ ] Gap analysis con root cause por cada gap significativo
- [ ] Plan de evolucion con milestones realistas y medibles
- [ ] Quick wins identificados con impacto estimado
- [ ] Assessment reproducible por evaluador independiente

## Output Artifact

**Primary:** `Maturity_Assessment_{org}.md` — Heatmap, gap analysis, plan de evolucion.

### Diagramas (Mermaid)
- Heatmap (tabla con colores): madurez por dominio y capacidad
- Radar chart (tabla): perfil de madurez actual vs target
- Gantt: plan de evolucion por trimestre

---
**Autor:** Equipo PreSales Sofka | **Version:** 1.0.0
