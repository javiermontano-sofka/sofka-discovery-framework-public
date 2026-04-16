# Body of Knowledge — Executive Dashboard (C-Level)

## Marco Teórico

El dashboard ejecutivo es una vista consolidada de salud del proyecto/portfolio diseñada para consumo de alta dirección. Se fundamenta en el principio de "information radiator": la información crítica debe ser visible sin esfuerzo, permitiendo al ejecutivo identificar problemas y oportunidades en segundos.

## Las Tres Preguntas del C-Suite

Todo dashboard ejecutivo debe responder:
1. **Value**: "Estan mis inversiones generando retorno?" → Benefits realization, ROI tracking
2. **Health**: "Estamos ejecutando bien?" → RAG status, KPIs, trends
3. **Action**: "Que decisiones necesitan de mi?" → Decision queue, pending approvals

## Anatomía del Dashboard Ejecutivo

| Zona | Contenido | Espacio | Prioridad |
|------|-----------|---------|-----------|
| Header | Overall RAG + headline status | 10% | Máxima |
| KPI Strip | 5-7 KPI cards con trend | 25% | Alta |
| Risk Zone | Top 3 risks con impacto | 15% | Alta |
| Decision Queue | Pending decisions con deadline | 15% | Alta |
| Trend Section | 3-6 period charts for key metrics | 20% | Media |
| Value Tracker | Benefits realization progress | 10% | Media |
| Footer | Data freshness, drill-down links | 5% | Baja |

## KPI Selection Framework

| Criterio | Peso | Descripción |
|----------|------|-------------|
| Executive relevance | 30% | ¿Le importa al C-suite? |
| Actionability | 25% | ¿Puede el ejecutivo actuar basándose en esto? |
| Data availability | 20% | ¿Se puede actualizar automáticamente? |
| Trend capability | 15% | ¿Muestra dirección, no solo punto? |
| Simplicity | 10% | ¿Se entiende en 3 segundos? |

## Dashboard Types

| Tipo | Audiencia | KPIs | Refresh | Formato |
|------|-----------|------|---------|---------|
| Project Dashboard | Sponsor/PM | 5-7 project KPIs | Sprint/weekly | Single page |
| Portfolio Dashboard | PMO/VP | Aggregate per project | Monthly | Multi-section |
| Program Dashboard | Program Manager | Cross-project + dependencies | Bi-weekly | Multi-page |
| Board Dashboard | Board of Directors | Strategic + financial | Quarterly | 1-page summary |

## RAG Thresholds (Default)

| Dimensión | Blue (Healthy) | Amber (At Risk) | Red (Critical) |
|-----------|---------------|-----------------|----------------|
| Schedule (SPI) | ≥0.95 | 0.85-0.94 | <0.85 |
| Cost (CPI) | ≥0.95 | 0.85-0.94 | <0.85 |
| Scope | ≥90% on track | 75-89% | <75% |
| Quality | ≤target defects | ≤1.5x target | >1.5x target |
| Risk | No high risks unmitigated | ≤2 high risks | >2 high risks or 1 critical |

## Design Principles para Dashboards Ejecutivos

1. **Scan in 3 minutes** — Si requiere más, es demasiado complejo [PLAN]
2. **Lead with Red** — Los problemas van primero [PLAN]
3. **Trends over snapshots** — Un número solo no dice nada; la dirección sí [METRIC]
4. **Actions, not just information** — Incluir decision queue [PLAN]
5. **Drill-down available** — Detalles accesibles pero no forzados [PLAN]
6. **Consistent format** — Mismo layout cada periodo para familiaridad [PLAN]
7. **NUNCA verde** — Blue para healthy [PLAN]

## Estándares Relevantes

- **IBCS (International Business Communication Standards)**: Dashboard notation
- **Stephen Few**: "Information Dashboard Design" — perceptual principles
- **PMBOK 7th**: Measurement Performance Domain
- **Balanced Scorecard** (Kaplan & Norton): Multi-perspective performance measurement
