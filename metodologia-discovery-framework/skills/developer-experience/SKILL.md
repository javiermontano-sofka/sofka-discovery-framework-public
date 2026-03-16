---
name: metodologia-developer-experience
description: >
  Developer experience (DX) platform assessment, inner loop optimization, toolchain evaluation,
  and onboarding friction analysis. Use when the user asks to "assess developer experience",
  "optimize inner loop", "evaluate toolchain", or mentions DX scorecard, developer productivity,
  or cognitive load reduction.
author: Javier Montaño · Comunidad MetodologIA
version: 1.0.0
tags:
  - developer-experience
  - dx
  - productivity
  - toolchain
  - inner-loop
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

# Evaluacion de Developer Experience

Assessment integral de la experiencia del desarrollador, optimizacion del inner loop,
evaluacion de toolchain y analisis de friccion en onboarding.

## TL;DR

- Evalua DX actual con metricas de inner loop (code-build-test-debug cycle time)
- Identifica puntos de friccion en toolchain, procesos y cognitive load
- Benchmarca contra estandares de industria (DORA, SPACE framework)
- Prioriza mejoras por impacto en productividad y satisfaccion
- Genera scorecard DX con improvement backlog accionable

## Inputs

Parse `$1` como **nombre del proyecto/organizacion**, `$2` como **equipo o plataforma a evaluar**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)

## Entregables

1. **DX Scorecard** — Evaluacion cuantitativa por dimension (inner loop, toolchain, docs, onboarding, CI/CD)
2. **Improvement Backlog** — Lista priorizada de mejoras con impacto estimado
3. **Toolchain Map** — Mapa visual de herramientas actuales con gaps y redundancias
4. **Friction Analysis** — Puntos de friccion identificados con root cause y solucion propuesta
5. **Benchmark Report** — Comparacion contra estandares DORA/SPACE

## Proceso

1. **Medicion de Inner Loop** — Evaluar tiempos de ciclo:
   | Metrica | Excelente | Aceptable | Problema |
   |---|---|---|---|
   | Build time (local) | <30s | 30s-3min | >3min |
   | Test suite (unit) | <1min | 1-5min | >5min |
   | Hot reload | <2s | 2-10s | >10s o inexistente |
   | PR to merge | <4h | 4-24h | >24h |
   | Deploy to staging | <15min | 15-60min | >60min |
2. **Evaluacion de Toolchain** — Inventariar herramientas por categoria (IDE, VCS, CI/CD, observability, collaboration), detectar gaps y redundancias
3. **Analisis de Cognitive Load** — Evaluar complejidad de setup local, numero de herramientas, context switching, documentacion disponible
4. **Assessment de Onboarding** — Medir tiempo de primer commit productivo, gaps en documentacion, dependencia de conocimiento tribal
5. **Benchmarking DORA/SPACE** — Comparar metricas clave contra percentiles de industria
6. **Priorizacion de Mejoras** — Scoring por impacto en productividad x esfuerzo de implementacion

## Criterios de Calidad

- [ ] Metricas de inner loop medidas o estimadas con evidencia
- [ ] Toolchain completo mapeado con gaps identificados
- [ ] Puntos de friccion documentados con root cause analysis
- [ ] Mejoras priorizadas con impacto estimado en tiempo de desarrollador
- [ ] Benchmark DORA/SPACE con posicionamiento del equipo
- [ ] Scorecard con scoring reproducible por dimension
- [ ] Diagrama Mermaid del toolchain y flujo de desarrollo

## Output Artifact

**Primary:** `DX_Assessment_{project}.md` — Scorecard, friction analysis, improvement backlog.

### Diagramas (Mermaid)
- Flowchart: inner loop actual vs optimizado
- Radar chart (tabla): scorecard DX por dimension
- Graph: toolchain map con integraciones

---
**Autor:** Javier Montaño · Comunidad MetodologIA | **Version:** 1.0.0
