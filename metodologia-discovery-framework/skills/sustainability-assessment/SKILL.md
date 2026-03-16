---
name: metodologia-sustainability-assessment
description: >
  Green IT evaluation, carbon footprint estimation, energy efficiency analysis, and sustainable
  architecture pattern recommendations. Use when the user asks to "assess sustainability",
  "estimate carbon footprint", "evaluate green IT", or mentions energy efficiency, sustainable
  architecture, or environmental impact of technology.
author: Javier Montaño · Comunidad MetodologIA
version: 1.0.0
tags:
  - sustainability
  - green-it
  - carbon-footprint
  - energy-efficiency
  - esg
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

# Evaluacion de Sostenibilidad

Evaluacion de Green IT, estimacion de huella de carbono, analisis de eficiencia energetica
y recomendaciones de patrones de arquitectura sostenible.

## TL;DR

- Evalua impacto ambiental de infraestructura y arquitectura de software actual
- Estima huella de carbono de compute, storage, networking y desarrollo
- Identifica oportunidades de optimizacion energetica con impacto cuantificado
- Recomienda patrones de arquitectura sostenible (right-sizing, serverless, edge computing)
- Genera scorecard de sostenibilidad alineado con reportes ESG

## Inputs

Parse `$1` como **nombre del proyecto/organizacion**, `$2` como **scope de infraestructura**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)

## Entregables

1. **Sustainability Scorecard** — Evaluacion por dimension (compute, storage, networking, development)
2. **Carbon Estimate** — Estimacion de huella de carbono con metodologia transparente
3. **Green Architecture Recommendations** — Patrones sostenibles aplicables al contexto
4. **Optimization Roadmap** — Plan de reduccion de impacto ambiental priorizado
5. **ESG Alignment Report** — Mapeo de iniciativas contra requisitos ESG

## Proceso

1. **Inventario de Infraestructura** — Mapear recursos de compute, storage, networking con utilizacion actual
2. **Estimacion de Carbon Footprint** — Calcular emisiones por categoria:
   | Categoria | Factores | Fuente de Datos |
   |---|---|---|
   | Compute | CPU/GPU hours x PUE x carbon intensity | Cloud provider reports, billing |
   | Storage | TB x replication factor x energy per TB | Storage inventory |
   | Networking | Data transfer x energy per GB | Traffic analysis |
   | Development | CI/CD pipeline runs, build compute | Pipeline metrics |
   | End user | Client-side compute, data transfer | Analytics data |
3. **Analisis de Eficiencia** — Identificar desperdicio:
   - Over-provisioned resources (utilization <20%)
   - Idle resources (dev/staging environments 24/7)
   - Redundant data copies y backups sin politica de retencion
   - Pipelines ineficientes (builds largos, tests redundantes)
4. **Patrones Sostenibles** — Recomendar segun contexto:
   - Right-sizing y auto-scaling
   - Serverless para workloads intermitentes
   - Edge computing para reducir data transfer
   - Region selection por carbon intensity del grid
   - Efficient algorithms y data structures
5. **Plan de Optimizacion** — Priorizar por reduccion de carbon x esfuerzo
6. **Alineacion ESG** — Mapear iniciativas contra frameworks de reporte (GRI, SASB)

## Criterios de Calidad

- [ ] Inventario de infraestructura completo con metricas de utilizacion
- [ ] Estimacion de carbon footprint con metodologia documentada y fuentes citadas
- [ ] Oportunidades de optimizacion cuantificadas (% reduccion estimado)
- [ ] Recomendaciones de arquitectura sostenible con trade-offs documentados
- [ ] Roadmap de optimizacion con quick wins y mejoras estructurales
- [ ] Alineacion con requisitos ESG si aplica
- [ ] Disclaimer sobre precision de estimaciones (orden de magnitud)

## Output Artifact

**Primary:** `Sustainability_Assessment_{project}.md` — Scorecard, carbon estimate, recomendaciones.

### Diagramas (Mermaid)
- Pie chart: distribucion de carbon footprint por categoria
- Flowchart: decision tree para patrones sostenibles
- Gantt: roadmap de optimizacion

---
**Autor:** Javier Montaño · Comunidad MetodologIA | **Version:** 1.0.0
