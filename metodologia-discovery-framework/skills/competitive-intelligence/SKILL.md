---
name: metodologia-competitive-intelligence
description: >
  Competitive technical landscape analysis, technology differentiation assessment, build-vs-buy
  analysis, and market positioning evaluation. Use when the user asks to "analyze competition",
  "compare technology options", "build vs buy analysis", or mentions competitive matrix,
  differentiation map, or market positioning.
author: Javier Montaño · Comunidad MetodologIA
version: 1.0.0
tags:
  - competitive-analysis
  - build-vs-buy
  - market-positioning
  - differentiation
  - strategy
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

# Inteligencia Competitiva Tecnologica

Analisis de landscape competitivo tecnico, evaluacion de diferenciacion tecnologica,
analisis build-vs-buy y posicionamiento de mercado.

## TL;DR

- Mapea landscape competitivo tecnico con jugadores, soluciones y posicionamiento
- Evalua diferenciacion tecnologica real vs percibida de cada opcion
- Ejecuta analisis build-vs-buy estructurado con TCO a 3-5 anos
- Identifica oportunidades de posicionamiento y ventaja competitiva
- Genera matriz competitiva y recomendaciones estrategicas accionables

## Inputs

Parse `$1` como **nombre del proyecto/producto**, `$2` como **mercado o categoria a analizar**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)

## Entregables

1. **Competitive Matrix** — Comparacion multi-dimensional de competidores/opciones
2. **Differentiation Map** — Mapa de diferenciacion tecnologica real por dimension
3. **Build vs Buy Analysis** — Analisis estructurado con TCO, time-to-market, riesgo
4. **Strategic Recommendations** — Recomendaciones accionables con justificacion
5. **Market Landscape Report** — Vision panoramica del mercado con tendencias

## Proceso

1. **Mapeo de Landscape** — Identificar jugadores relevantes por categoria:
   | Categoria | Jugadores | Posicionamiento |
   |---|---|---|
   | Lideres | Incumbents con market share | Premium, enterprise |
   | Challengers | Disruptores con traccion | Value, innovacion |
   | Nicho | Especialistas en segmento | Deep expertise |
   | Open Source | Alternativas abiertas | Flexibilidad, costo |
2. **Analisis de Diferenciacion** — Para cada opcion evaluar:
   - Capacidades tecnicas (features, performance, scalability)
   - Madurez (production readiness, ecosystem, community)
   - Modelo de negocio (pricing, lock-in, portabilidad)
   - Roadmap y vision (inversion en R&D, tendencia)
3. **Build vs Buy Framework** — Evaluar con criterios estructurados:
   | Factor | Build | Buy | Peso |
   |---|---|---|---|
   | Time to market | Lento (6-18 meses) | Rapido (1-3 meses) | Alto |
   | TCO 3 anos | Dev + maintenance | Licencia + integracion | Alto |
   | Diferenciacion | Maxima si es core | Limitada | Medio |
   | Riesgo tecnico | Alto (ejecucion) | Medio (vendor) | Alto |
   | Flexibilidad | Total | Limitada por vendor | Medio |
4. **Scoring Competitivo** — Puntuar cada opcion en dimensiones clave con pesos
5. **Analisis de Tendencias** — Identificar hacia donde se mueve el mercado
6. **Recomendaciones Estrategicas** — Decision justificada con plan de accion

## Criterios de Calidad

- [ ] Landscape completo con al menos 5 opciones evaluadas
- [ ] Diferenciacion evaluada con evidencia tecnica, no marketing
- [ ] Build vs buy con TCO estimado a 3+ anos
- [ ] Scoring con criterios y pesos explicitos y justificados
- [ ] Tendencias de mercado identificadas con fuentes
- [ ] Recomendacion clara con justificacion multi-dimensional
- [ ] Diagrama Mermaid de positioning map

## Output Artifact

**Primary:** `Competitive_Intelligence_{project}.md` — Matriz competitiva, analisis BvB, recomendaciones.

### Diagramas (Mermaid)
- Quadrant chart: positioning map (capacidad vs madurez)
- Table: competitive matrix multi-dimensional
- Flowchart: decision tree build vs buy

---
**Autor:** Javier Montaño · Comunidad MetodologIA | **Version:** 1.0.0
