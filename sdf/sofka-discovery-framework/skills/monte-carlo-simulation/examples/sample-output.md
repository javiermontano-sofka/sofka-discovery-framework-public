# Simulación Monte Carlo — Acme Corp ERP Modernization

> **Proyecto**: Acme Corp ERP | **Fecha**: 2026-03-17 | **Estado**: {WIP}
> **Iteraciones**: 10,000 | **Distribución**: PERT | **Scope**: Schedule + Cost

---

## TL;DR
La simulación Monte Carlo de 10,000 iteraciones indica P50 de entrega el 15 de octubre 2026 y P80 el 3 de noviembre 2026. El deadline contractual (30 de noviembre) tiene 89% de probabilidad de cumplimiento. Contingencia recomendada: 19 días calendario y 280K USD. Los principales drivers de varianza son integración SAP (28%) y migración de datos (19%). [METRIC]

---

## Resultados de Schedule

| Nivel de Confianza | Fecha | Delta vs Baseline |
|:---:|:---:|:---:|
| P10 (optimista) | 2026-09-22 | -23 días [SCHEDULE] |
| P50 (mediana) | 2026-10-15 | Baseline [SCHEDULE] |
| P80 (compromiso) | 2026-11-03 | +19 días [SCHEDULE] |
| P90 (conservador) | 2026-11-18 | +34 días [SCHEDULE] |
| Deadline contractual | 2026-11-30 | Prob: 89% [METRIC] |

---

## Resultados de Costo

| Nivel de Confianza | Costo Total | Delta vs Budget |
|:---:|:---:|:---:|
| P10 | 2.1M USD | -400K [METRIC] |
| P50 | 2.4M USD | -100K [METRIC] |
| P80 | 2.68M USD | +180K [METRIC] |
| P90 | 2.95M USD | +450K [METRIC] |
| Budget aprobado | 2.5M USD | Prob: 62% [METRIC] |

---

## Sensitivity Analysis (Top 5 Drivers)

| # | Actividad | Contribución a Varianza | Rango (O-P) |
|---|-----------|:---:|:---:|
| 1 | Integración SAP S/4HANA | 28% | 30-90 días [METRIC] |
| 2 | Migración de datos legacy | 19% | 25-60 días [METRIC] |
| 3 | UAT con usuarios finales | 14% | 15-35 días [METRIC] |
| 4 | Desarrollo interfaces custom | 12% | 20-45 días [METRIC] |
| 5 | Configuración de reportería | 8% | 10-25 días [METRIC] |

> **Hallazgo**: Los top 2 drivers representan 47% de la varianza total. Mitigar la incertidumbre en integración SAP (PoC temprano) reduciría P80 en ~8 días. [INFERENCIA]

---

## Contingencia Recomendada

| Tipo | Cálculo | Valor |
|------|---------|:---:|
| Schedule contingency | P80 - P50 | 19 días [SCHEDULE] |
| Cost contingency | P80 - P50 | 280K USD [METRIC] |
| Management reserve | P90 - P80 | 15 días / 270K USD [METRIC] |

---

*PMO-APEX v1.0 — Sample Output: Monte Carlo Simulation*
*Sofka, your technology partner.*
