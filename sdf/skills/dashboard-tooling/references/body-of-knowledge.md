# Body of Knowledge — Dashboard Tooling & Data Feeds

## Marco Teórico

El dashboard tooling se fundamenta en la disciplina de Business Intelligence (BI) aplicada a la gestión de proyectos. La automatización de data feeds transforma dashboards estáticos en instrumentos de monitoreo continuo que eliminan el sesgo de reporte manual.

## Arquitectura de Data Feeds

| Componente | Función | Ejemplos |
|------------|---------|----------|
| Data Source | Sistema origen de métricas | Jira, Azure DevOps, Monday, Sheets |
| Extractor | Módulo que obtiene datos del origen | API REST, Webhooks, CSV export |
| Transformer | Reglas de cálculo y normalización | Fórmulas EVM, agregaciones, filtros |
| Loader | Carga datos en el dashboard | Push API, database insert, file sync |
| Visualizer | Renderiza datos como widgets | Charts, KPI cards, heatmaps, tables |
| Alerter | Dispara notificaciones por umbral | Email, Slack, Teams webhook |

## Taxonomía de Widgets PM

| Widget | Métrica Asociada | Metodología |
|--------|-----------------|-------------|
| Burndown Chart | Story points restantes | Agile/Scrum |
| Burnup Chart | Scope vs. completado | Agile/Scrum |
| Velocity Chart | Puntos por sprint | Agile/Scrum |
| CPI/SPI Gauge | Earned Value indices | Waterfall/Predictive |
| Cumulative Flow | WIP por estado | Kanban |
| Milestone Tracker | Hitos completados vs. plan | Todos |
| Risk Heatmap | Probabilidad x Impacto | Todos |
| RAG Status Card | Estado por dimensión | Todos |
| Resource Utilization | % asignación vs. capacidad | Todos |
| Budget Burn | Gasto acumulado vs. presupuesto | Todos |

## Patrones de Refresh

| Patrón | Frecuencia | Caso de Uso | Costo |
|--------|-----------|-------------|-------|
| Real-time | Segundos | Dashboards operativos de deploy | Alto |
| Near real-time | 5-15 minutos | Dashboards de sprint en curso | Medio |
| Hourly | Cada hora | Dashboards de proyecto activo | Bajo |
| Daily | Cada 24h | Dashboards ejecutivos | Mínimo |
| On-demand | Manual trigger | Dashboards de auditoría | Ninguno |

## Fórmula de Efectividad del Dashboard

```
Dashboard Effectiveness = (Automated_Metrics / Total_Metrics) × (1 - Staleness_Rate)
Staleness_Rate = Metrics_Stale / Total_Metrics
Objetivo: Effectiveness ≥ 80%
```

## Plataformas de Dashboard

| Plataforma | Tipo | Fortaleza PM | Limitación |
|------------|------|-------------|------------|
| Power BI | Enterprise BI | Integración Microsoft ecosystem | Licenciamiento |
| Tableau | Enterprise BI | Visualización avanzada | Costo |
| Grafana | Open Source | Métricas técnicas + PM | Curva de aprendizaje |
| Google Looker | Cloud BI | Integración Google Workspace | Dependencia cloud |
| Jira Dashboard | Nativo PM | Sin integración adicional | Solo datos Jira |
| Mermaid + HTML | Code-based | Integrado en APEX deliverables | Sin refresh automático |

## Anti-Patrones de Dashboard Tooling

| Anti-Patrón | Consecuencia | Mitigación |
|-------------|-------------|------------|
| Dashboard manual | Datos siempre desactualizados | Automatizar feeds |
| Demasiados widgets | Información abrumadora | Máximo 7±2 widgets por vista |
| Sin alertas | Problemas detectados tarde | Configurar umbrales tier-1/2/3 |
| Acceso sin control | Datos sensibles expuestos | RBAC por rol de stakeholder |
| Sin plan de mantenimiento | Dashboard abandonado en semanas | Ownership + cadencia de revisión |

## Estándares Relevantes

- **PMBOK 7th**: Performance domains — Measurement performance domain
- **DORA Metrics**: Deployment frequency, lead time, MTTR, change failure rate
- **EVM Standard**: CPI, SPI, EAC, ETC, VAC, TCPI
- **ISO 21502**: Project performance monitoring guidelines
