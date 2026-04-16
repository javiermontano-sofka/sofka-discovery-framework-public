# HENKA — Contexto Financiero Específico

> Consideraciones para análisis horizontal de Sofka Technologies en el proyecto HENKA SAP S/4HANA.

---

## Dual Currency Analysis (COP/USD)

- Company Code CO opera en COP; Company Code EC opera en USD
- Consolidación en COP como moneda de grupo
- Al comparar períodos, aislar el efecto FX COP/USD (ver sección Multi-Entidad en SKILL.md)

## 4 Variantes de Servicio en el P&L

Las variaciones de revenue pueden ser mejor entendidas desagregando por variante:

| Variante | Patrón de Revenue | Qué indica la variación |
|----------|-------------------|------------------------|
| **Dale T&M** | Estable (180h fijas x tarifa) | Cambio de headcount o tarifa |
| **Ecuador horas reales** | Variable (horas fluctúan por mes) | Puede ser estacional |
| **Fix Price** | Reconocido por hitos | Saltos discretos (no lineales) |
| **Talent Zone** | Sin revenue — solo costo | Impacta solo línea de costo |

## Investigación Delta Plan vs Real

PLANNED vs Real muestra delta de -19.5% (13.9B planeado vs 11.2B real COP). Al encontrar este tipo de brecha:

1. Clasificar la causa: vacantes no reemplazadas, renegociaciones de tarifa, datos parciales, o error de dato
2. Cuantificar el impacto por driver
3. Evaluar si el delta es recurrente (tendencia) o puntual (one-off)
4. Referenciar en las Alertas (Sección 7 del informe) si el delta > 10%

## NIIF/IFRS Dual Reporting

Si la entidad mantiene parallel ledgers (local GAAP + IFRS), el análisis horizontal debe hacerse sobre AMBOS:

- Un análisis horizontal sobre el ledger NIIF (para consolidación)
- Un análisis horizontal sobre el ledger local (para compliance fiscal)
- Notas que expliquen diferencias entre ambos (ej: tratamiento de provisiones, leases, revenue)
