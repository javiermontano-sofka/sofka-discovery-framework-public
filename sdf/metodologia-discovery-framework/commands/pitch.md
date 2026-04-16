---
description: "Generate 08_Pitch_Ejecutivo — C-level business case with cost of inaction, value pillars, financial model"
user-invocable: true
---

# METODOLOGIA DISCOVERY · PITCH EJECUTIVO · NL-HP v3.0

## ROL
Delivery Manager en modo persuasión — activa `executive-pitch` como skill primario.
Skills de soporte: `commercial-model` (estructura de deal), `cost-estimation` (magnitudes), `risk-controlling-dynamics` (proposal hardening).

## OBJETIVO
Generar 08_Pitch_Ejecutivo para el proyecto actual. Requiere todos los entregables previos (00-07). Si el usuario proporciona "$ARGUMENTS", usarlos como contexto.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea repositorio: métricas de salud, velocidad de desarrollo, incidentes conocidos, complejidad acumulada.
2. Clasifica adjuntos: todos los entregables previos, datos de negocio, métricas de producto, KPIs.

### CP-2 · Ejecución
1. **Costo de Inacción** — 4 dimensiones: deuda acumulándose, riesgo seguridad, costo oportunidad, riesgo talento. Magnitud + horizonte por dimensión. [CÓDIGO] [DOC] [INFERENCIA]
2. **4 Pilares de Valor** — métrica actual vs. objetivo, delta, horizonte de materialización, evidencia AS-IS. [DOC] [INFERENCIA]
3. **Estructura de Inversión** — FTE-meses, NUNCA precios. 3 escenarios. Disclaimer obligatorio. [INFERENCIA]
4. **Modelo Financiero** — NPV/IRR/payback como RANGOS indicativos, no cifras exactas. Supuestos explícitos. [INFERENCIA]
5. **Call to Action** — acción específica, deadline, siguiente paso, consecuencia de no actuar. [INFERENCIA]

⚠️ Cifras financieras son indicadores de magnitud, NO proyecciones auditables. Incluyen 5% margen de innovación.

### CP-3 · Validación
- [ ] NPV/IRR/payback como rangos con supuestos
- [ ] Call to action con deadline y consecuencia
- [ ] Costo de inacción ≥3 dimensiones
- [ ] 4 pilares con métrica actual vs. objetivo
- [ ] CERO precios
- [ ] Tono C-level: conciso, orientado a decisión

## RESTRICCIONES
- NUNCA precios finales. Solo magnitudes.
- Tono persuasivo basado en evidencia, no retórica vacía.
- Datos insuficientes: usar proxies técnicos (deploy velocity, MTTR) con disclaimer.
- Diagramas Mermaid: `mindmap` + `gantt`.
