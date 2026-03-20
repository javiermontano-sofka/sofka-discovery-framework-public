# Body of Knowledge — Discovery Retrospective

## Marco Teórico

La retrospectiva de discovery aplica los principios de mejora continua (Kaizen) al ciclo de presales/discovery. A diferencia de la retrospectiva de sprint que evalúa ejecución, la retrospectiva de discovery evalúa la calidad del análisis, la precisión de las estimaciones, y la efectividad del pipeline de discovery.

## Dimensiones de Evaluación

| Dimensión | Qué Mide | Métricas Clave |
|-----------|----------|---------------|
| Completeness | ¿Se produjeron todos los entregables esperados? | % deliverables completados, quality score promedio |
| Accuracy | ¿Las estimaciones fueron correctas? | Variance % en effort, cost, timeline |
| Timeliness | ¿Se cumplió el timeline de discovery? | Planned vs actual days per phase |
| Stakeholder Satisfaction | ¿Los stakeholders están conformes? | NPS o satisfaction score (1-5) |
| Assumption Validation | ¿Los supuestos se confirmaron? | % validated, % invalidated, % pending |
| Methodology Fit | ¿La metodología seleccionada fue apropiada? | Delivery friction score, team feedback |
| Pipeline Efficiency | ¿El pipeline de APEX funcionó bien? | Rework rate, blocked phases, cycle time |

## Scoring Framework

```
Quality Score por Deliverable (0-100):
  Completeness (0-30): ¿Tiene todas las secciones requeridas?
  Accuracy (0-25): ¿Los datos y análisis son correctos?
  Actionability (0-25): ¿Los stakeholders pueden tomar decisiones con esto?
  Evidence (0-20): ¿Las afirmaciones están etiquetadas con evidencia?

Discovery Quality Score = Promedio(Quality Scores de todos los deliverables)
Target: ≥75/100
```

## Fórmulas de Accuracy

```
Estimation Variance = (Actual - Estimated) / Estimated × 100
  Effort: ¿FTE-meses estimados vs. reales?
  Timeline: ¿Duración estimada vs. real?
  Cost: ¿Presupuesto estimado vs. real?

Accuracy Rating:
  ≤10% variance: Excellent
  11-25% variance: Good
  26-50% variance: Acceptable
  >50% variance: Poor — requires calibration
```

## Assumption Lifecycle

| Estado | Significado | Acción |
|--------|------------|--------|
| Open | Supuesto no validado | Requiere plan de validación |
| Validating | En proceso de validación | Monitorear |
| Validated | Confirmado como correcto | Convertir a [PLAN] |
| Invalidated | Demostrado incorrecto | Evaluar impacto, ajustar plan |
| Expired | Ya no es relevante | Cerrar |

## Pipeline Friction Analysis

| Tipo de Fricción | Indicador | Root Cause Típico |
|-----------------|-----------|-------------------|
| Rework | Deliverable reescrito >1 vez | Requerimientos ambiguos |
| Blocked | Fase esperando >2 días por input | Stakeholder unavailable |
| Skipped | Fase omitida sin justificación | Time pressure |
| Scope creep | Deliverables no planificados producidos | Poor scoping |
| Tool friction | Tiempo perdido en herramientas | Training gap |

## Retrospective Formats

| Formato | Duración | Para Quién | Foco |
|---------|----------|-----------|------|
| Lightning Retro | 30 min | Team interno | Top 3 insights + actions |
| Standard Retro | 60 min | Team + stakeholders clave | Full analysis all dimensions |
| Deep Retro | 2 horas | PMO + team + stakeholders | Cross-discovery trends, organizational learning |

## Estándares Relevantes

- **Scrum Guide**: Sprint Retrospective principles adapted to discovery
- **Lean Startup**: Build-Measure-Learn applied to discovery cycles
- **PMBOK 7th**: Lessons learned y organizational process assets
- **SAFe**: Inspect & Adapt ceremony at PI level
- **Toyota Kata**: Improvement kata pattern for systematic improvement
