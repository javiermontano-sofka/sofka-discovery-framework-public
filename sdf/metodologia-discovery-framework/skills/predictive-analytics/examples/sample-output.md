# Predictive Analytics Report — Acme Corp ERP Migration

> **Proyecto**: ERP Migration Phase 2
> **BAC**: $1,200,000
> **Fecha corte**: 2026-03-17 (Month 6 of 12)
> **Status**: {WIP}

---

## TL;DR

Proyecto al 50% de ejecucion con CPI=0.92 y SPI=0.87. EAC proyectado: $1,304K (metodo CPI) a $1,412K (metodo compuesto). Monte Carlo indica 78% probabilidad de overrun >5%. Fecha de completacion: P50=2026-10-15, P80=2026-11-22 (vs. baseline 2026-09-30). Alerta temprana: tendencia de deterioro en ultimos 2 meses requiere intervencion [METRIC].

## Earned Value Snapshot

| Metrica | Valor | Status |
|---------|-------|--------|
| BAC | $1,200,000 | Baseline [METRIC] |
| PV (BCWS) | $600,000 | Planned [METRIC] |
| EV (BCWP) | $522,000 | SPI < 1.0 [METRIC] |
| AC (ACWP) | $567,391 | CPI < 1.0 [METRIC] |
| **CPI** | **0.92** | Alerta [METRIC] |
| **SPI** | **0.87** | Alerta [METRIC] |
| CV | -$45,391 | Over budget [METRIC] |
| SV | -$78,000 | Behind schedule [METRIC] |

## EAC Forecast (4 Methods)

| Metodo | EAC | Varianza vs BAC | Confianza |
|--------|-----|-----------------|-----------|
| CPI-based | $1,304,348 | +$104K (+8.7%) | Alta [METRIC] |
| CPI x SPI composite | $1,412,429 | +$212K (+17.7%) | Media [METRIC] |
| Managerial (bottom-up) | $1,280,000 | +$80K (+6.7%) | Media [SUPUESTO] |
| Regression (6-point trend) | $1,340,000 | +$140K (+11.7%) | Media [INFERENCIA] |
| **Ensemble (weighted)** | **$1,328,000** | **+$128K (+10.7%)** | **Alta** [METRIC] |

## TCPI Analysis

| Escenario | TCPI | Interpretacion |
|-----------|------|---------------|
| To meet BAC | 1.07 | Dificil pero alcanzable [METRIC] |
| To meet EAC (ensemble) | 0.98 | Alcanzable con mejoras [METRIC] |
| To meet original deadline | 1.15 | Improbable sin scope reduction [INFERENCIA] |

## Monte Carlo Simulation (10,000 iterations)

### Cost at Completion
| Percentil | Costo | Overrun |
|-----------|-------|---------|
| P10 (optimista) | $1,215,000 | +$15K [METRIC] |
| P50 (esperado) | $1,328,000 | +$128K [METRIC] |
| P80 (probable) | $1,395,000 | +$195K [METRIC] |
| P95 (pesimista) | $1,480,000 | +$280K [METRIC] |

### Schedule Completion
| Percentil | Fecha | Delay |
|-----------|-------|-------|
| P10 | 2026-09-22 | -8 dias [METRIC] |
| P50 | 2026-10-15 | +15 dias [METRIC] |
| P80 | 2026-11-22 | +53 dias [METRIC] |
| P95 | 2026-12-18 | +79 dias [METRIC] |

### Key Finding
- Probabilidad de completar dentro de BAC: 12% [METRIC]
- Probabilidad de completar dentro de BAC +10%: 45% [METRIC]
- Probabilidad de completar en fecha baseline: 8% [METRIC]

## CPI/SPI Trend Analysis

| Mes | CPI | SPI | Trend |
|-----|-----|-----|-------|
| M1 | 1.02 | 0.98 | Estable [HISTORICO] |
| M2 | 0.99 | 0.95 | Leve deterioro [HISTORICO] |
| M3 | 0.97 | 0.93 | Deterioro [HISTORICO] |
| M4 | 0.95 | 0.90 | Deterioro [HISTORICO] |
| M5 | 0.93 | 0.88 | Deterioro acelerado [HISTORICO] |
| M6 | 0.92 | 0.87 | **Alerta** [METRIC] |

**Anomaly detected**: CPI declining at -0.02/mes durante 5 meses consecutivos. Sin intervencion, CPI proyectado a M12: 0.80 [INFERENCIA].

## Recommendations

| # | Accion | Impacto Esperado | Prioridad | Evidence |
|---|--------|-----------------|-----------|----------|
| 1 | Resource augmentation (2 senior devs) | CPI recovery +0.05 | P1 | [PLAN] |
| 2 | Scope negotiation (defer 3 non-critical modules) | SPI recovery +0.08 | P1 | [DECISION] |
| 3 | Weekly EVM tracking (currently monthly) | Earlier anomaly detection | P2 | [PLAN] |
| 4 | Vendor performance review (integration partner) | Address #1 cost driver | P2 | [STAKEHOLDER] |
| 5 | Contingency release ($80K of $120K reserve) | Cover projected overrun | P1 | [DECISION] |

---

*Generado por PMO-APEX Predictive Analytics · Acme Corp · {WIP}*
