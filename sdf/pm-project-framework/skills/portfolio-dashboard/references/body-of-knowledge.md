# Body of Knowledge — Portfolio Dashboard

> PMO-APEX Skill: `portfolio-dashboard` · Dominio: Portfolio Reporting & Visualization
> Última actualización: 2026-03-17

---

## 1. Fundamentos Teóricos

### 1.1 Dashboard vs. Report
Un dashboard es una visualización de estado actual para decisiones rápidas. Un report es un análisis detallado para comprensión profunda. El portfolio dashboard sirve al ejecutivo que tiene 3 minutos; el report sirve al analista que tiene 30 minutos [DOC].

### 1.2 Componentes del Portfolio Dashboard
| Componente | Propósito | Audiencia |
|-----------|---------|-----------|
| Health Heatmap | Vista de estado por proyecto x dimensión | Portfolio Board |
| Resource Utilization | Demanda vs. capacidad agregada | Resource Managers |
| Budget Rollup | Salud financiera del portafolio | CFO, Sponsors |
| Risk Concentration | Riesgos agregados y correlacionados | Risk Committee |
| Strategic Alignment | Distribución de inversión vs. estrategia | C-Level |
| Exception List | Proyectos que requieren atención | Steering Committee |
| Trend Analysis | Evolución del portafolio en el tiempo | PMO Director |

### 1.3 Principios de Visualización
- **5-second rule**: El mensaje clave debe captarse en 5 segundos
- **Progressive disclosure**: Resumen → detalle on drill-down
- **Actionability**: Cada elemento informa una decisión
- **Truthfulness**: RAG thresholds calibrados para reflejar realidad
- **Consistency**: Mismas métricas, mismas definiciones, cada periodo

## 2. Métricas de Portfolio

### 2.1 Health Metrics
| Métrica | Cálculo | Umbral Blue | Umbral Amber | Umbral Red |
|---------|---------|-------------|-------------|-----------|
| Schedule Health | % proyectos on-track | > 80% | 60-80% | < 60% |
| Budget Health | Portfolio variance | < 5% | 5-15% | > 15% |
| Risk Exposure | Risks high/critical | < 10% | 10-20% | > 20% |
| Resource Utilization | Avg utilization | 70-85% | 85-95% | > 95% |
| Strategic Alignment | % with strategic linkage | > 90% | 70-90% | < 70% |

### 2.2 Aggregation Rules
- RAG status: Worst-case aggregation (si un sub-indicador es Red, el agregado es Red)
- Budget: Sum aggregation (total portfolio = sum of project budgets)
- Resources: Peak aggregation (maximum concurrent demand)
- Risk: Correlation-aware (correlated risks counted once, not multiplied)

## 3. Dashboard Design Patterns

### 3.1 Executive View (30 seconds)
5 KPIs grandes con trend arrows y RAG colors. No tablas, no detalle. Responde: "Estamos bien o mal?"

### 3.2 PMO Director View (5 minutes)
Heatmap + exception list + trends. Permite identificar qué proyectos necesitan atención y qué patterns emergen.

### 3.3 Analyst View (30 minutes)
Full drill-down por proyecto, dimensión, periodo. Para investigar anomalías y preparar governance reports.

## 4. Data Quality

### 4.1 Freshness Indicators
Cada dato muestra su fecha de última actualización. Datos con más de 1 periodo de retraso se marcan como stale y se excluyen de trend analysis [PLAN].

### 4.2 Source Validation
Dashboard data sourced from project-level systems, not manually entered. Cross-validation entre fuentes para detectar inconsistencias [METRIC].

## 5. Anti-patrones

| Anti-patrón | Consecuencia | Corrección |
|-------------|-------------|------------|
| Watermelon projects | Green outside, red inside | Multi-dimension RAG |
| Data dump dashboard | Overwhelming, not actionable | 5-second rule |
| Vanity metrics | Looks good, means nothing | Tie to decisions |
| Manual data entry | Stale, biased | Automated collection |
| Single RAG per project | Hides dimensional problems | Heatmap approach |

## 6. Referencias Bibliográficas

- Few, S. (2013). *Information Dashboard Design* — 2nd Edition.
- Tufte, E. (2001). *The Visual Display of Quantitative Information*.
- PMI (2017). *The Standard for Portfolio Management* — Portfolio reporting.
- Gartner (2023). *Portfolio Dashboard Best Practices*.
