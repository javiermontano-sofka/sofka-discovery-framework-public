# Body of Knowledge — Project Data Storytelling & Visualization

## Marco Teórico

Data storytelling combina tres disciplinas: ciencia de datos (extracción de insight), diseño de información (visualización) y narrativa (estructura persuasiva). En gestión de proyectos, transforma métricas crudas en comunicaciones que impulsan decisiones.

## Estructura Narrativa: CIAR Framework

| Fase | Propósito | Ejemplo PM |
|------|-----------|-----------|
| **Context** | Establecer situación actual | "El proyecto lleva 6 sprints de 12 planificados" |
| **Insight** | Revelar el dato clave | "La velocidad ha caído 30% en los últimos 2 sprints" |
| **Implication** | Explicar consecuencias | "Al ritmo actual, el proyecto se extenderá 3 sprints adicionales" |
| **Action** | Recomendar decisión | "Reducir scope del Sprint 7 o agregar 2 desarrolladores" |

## Taxonomía de Visualizaciones PM

| Tipo de Insight | Visualización Recomendada | Cuándo Usar |
|----------------|--------------------------|-------------|
| Tendencia temporal | Línea / Área | Velocity, burndown, budget burn |
| Comparación | Barras horizontales | Equipos, sprints, proyectos |
| Proporción | Donut / Treemap | Distribución de esfuerzo, scope |
| Correlación | Scatter plot | Complejidad vs. duración |
| Distribución | Histograma / Box plot | Tiempos de ciclo, estimaciones |
| Jerarquía | Treemap / Sunburst | WBS, portfolio por programa |
| Flujo | Sankey / Mermaid flowchart | Pipeline, dependency chains |
| Estado | RAG cards / Heatmap | Portfolio health, risk matrix |

## Principios de Visualización Efectiva

1. **Data-ink ratio** — Maximizar tinta dedicada a datos, minimizar decoración (Tufte) [PLAN]
2. **Pre-attentive processing** — Usar color, tamaño y posición para highlight automático [PLAN]
3. **Cognitive load** — Máximo 7±2 elementos por visualización [METRIC]
4. **Annotation** — Cada chart necesita al menos un callout que diga "mira aquí" [PLAN]
5. **Honesty** — No truncar ejes, no usar 3D engañoso, no cherry-pick datos [PLAN]

## Errores Comunes en Visualización PM

| Error | Impacto | Corrección |
|-------|---------|-----------|
| Eje Y truncado | Exagera variaciones | Comenzar eje en 0 o documentar |
| Gráfico 3D | Distorsiona proporciones | Usar 2D siempre |
| Demasiados colores | Confusión visual | Máximo 5 colores por chart |
| Sin contexto | Datos sin significado | Agregar benchmarks y targets |
| Cherry-picking | Narrativa engañosa | Mostrar rango completo |
| Escala temporal inconsistente | Comparación inválida | Normalizar periodos |

## Fórmula de Efectividad Narrativa

```
Narrative Effectiveness = (Clarity × Accuracy × Actionability) / Complexity
Donde:
  Clarity = ¿El insight es entendible en <30 segundos? (1-5)
  Accuracy = ¿Los datos son correctos y verificables? (1-5)
  Actionability = ¿La audiencia sabe qué hacer? (1-5)
  Complexity = Número de conceptos presentados simultáneamente
Objetivo: Score ≥ 3.0
```

## Adaptación por Audiencia

| Audiencia | Nivel de Detalle | Formato Preferido | Tiempo Disponible |
|-----------|-----------------|-------------------|-------------------|
| C-Suite | Mínimo | Dashboard 1-pager | 3 minutos |
| Sponsor | Resumen con drill-down | Briefing + anexos | 10 minutos |
| Steering Committee | Estratégico | Presentación 10 slides | 30 minutos |
| PM Peers | Detallado | Reporte técnico | 20 minutos |
| Team | Operativo | Board metrics | Continuo |

## Herramientas de Visualización en APEX

| Herramienta | Fortaleza | Limitación |
|-------------|-----------|-----------|
| Mermaid | Diagramas de flujo, Gantt, pie | Sin interactividad |
| Tablas Markdown | Datos tabulares | Sin gráficos |
| HTML + CSS APEX | Dashboards branded | Requiere rendering |
| ASCII Charts | Compatible con Markdown | Resolución limitada |

## Estándares Relevantes

- **Cole Nussbaumer Knaflic**: "Storytelling with Data" — framework SWD
- **Edward Tufte**: "Visual Display of Quantitative Information" — principios de diseño
- **Alberto Cairo**: "How Charts Lie" — ética de visualización
- **IBCS (International Business Communication Standards)**: Notación estandarizada
