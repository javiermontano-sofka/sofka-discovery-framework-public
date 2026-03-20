# Financial Business Case — Acme Corp ERP Migration Phase 2

**Proyecto**: Acme Corp — ERP Migration Phase 2
**Horizon**: 5 years
**Discount Rate**: 10% (costo de capital organizacional)
**Fecha**: 2026-03-17

> **Disclaimer**: Las magnitudes presentadas son estimaciones para evaluacion comparativa. Los valores finales requieren validacion con el area financiera de la organizacion. NUNCA se incluyen precios unitarios.

## Options Analysis

| Option | Investment | Annual Benefit | NPV (5yr) | IRR | Risk |
|--------|-----------|---------------|-----------|-----|------|
| Do Nothing | 0 | 0 | Negative (tech debt) | N/A | High [INFERENCIA] |
| Minimal Migration | 60% base | 40% base | +5% | 11% | Medium [PLAN] |
| **Full Migration** | **100% base** | **100% base** | **+15%** | **14%** | **Medium** [PLAN] |
| Full + AI Features | 140% base | 130% base | +18% | 13% | High [SUPUESTO] |

## Cash Flow Projection (Full Migration)

| Concepto | Y0 | Y1 | Y2 | Y3 | Y4 | Y5 |
|----------|:--:|:--:|:--:|:--:|:--:|:--:|
| Investment | -100% | -20% | 0 | 0 | 0 | 0 |
| Operating Cost | 0 | -8% | -8% | -8% | -8% | -8% |
| Benefits | 0 | 15% | 45% | 50% | 50% | 50% |
| **Net CF** | **-100%** | **-13%** | **37%** | **42%** | **42%** | **42%** |
| Cumulative PV | -100% | -112% | -81% | -50% | -21% | +5% |

*Valores como % de inversion total. Magnitudes absolutas bajo NDA.* [PLAN]

## Financial Summary

| Metrica | Valor | Threshold | Resultado |
|---------|-------|-----------|-----------|
| NPV (5 anios) | +15% de inversion | >0 | Positivo [METRIC] |
| IRR | 14% | >10% (hurdle rate) | Excede hurdle [METRIC] |
| Payback | 4.2 anios | <5 anios | Dentro de threshold [METRIC] |
| BCR | 1.15 | >1.0 | Favorable [METRIC] |

## Sensitivity Analysis

| Variable | -20% | Base | +20% | NPV Swing |
|----------|------|------|------|-----------|
| Benefits realization | NPV = -5% | +15% | +32% | 37% [METRIC] |
| Discount rate (8%-12%) | NPV = +25% | +15% | +7% | 18% [METRIC] |
| Implementation cost | NPV = +23% | +15% | +5% | 18% [METRIC] |

**Break-even**: Benefits realization must be mayor a 85% for NPV > 0. [METRIC]

## Scenario Comparison

| Escenario | Prob | NPV | IRR | Payback |
|-----------|:----:|:---:|:---:|:-------:|
| Best Case | 20% | +35% | 20% | 3.0 anios [SUPUESTO] |
| Most Likely | 60% | +15% | 14% | 4.2 anios [PLAN] |
| Worst Case | 20% | -25% | 5% | >5 anios [SUPUESTO] |
| **Expected Value** | | **+12%** | **13%** | | [METRIC] |

## Recommendation

**GO** con monitoreo trimestral del business case. Expected Value NPV positivo (+12%), IRR (13%) excede hurdle rate (10%). Monitorear benefits realization trimestralmente; re-evaluar si actuals <70% de proyectado en Y2. [PLAN]

---
*PMO-APEX v1.0 — Financial Business Case Analysis*
*Sofka, your technology partner.*
