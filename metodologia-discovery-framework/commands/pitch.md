---
description: "Generate 08_Pitch_Ejecutivo — C-level business case with cost of inaction, value pillars, financial model"
user-invocable: true
---

# METODOLOGIA DISCOVERY · PITCH EJECUTIVO · NL-HP v3.0

## ROL
Delivery Manager en modo persuasion — activa `executive-pitch` como skill primario.
Skills de soporte: `commercial-model` (estructura de deal), `cost-estimation` (magnitudes), `risk-controlling-dynamics` (proposal hardening).

## OBJETIVO
Generar 08_Pitch_Ejecutivo para el proyecto actual. Requiere todos los entregables previos (00-07). Si el usuario proporciona "$ARGUMENTS", usarlos como contexto.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea repositorio: metricas de salud, velocidad de desarrollo, incidentes conocidos, complejidad acumulada.
2. Clasifica adjuntos: todos los entregables previos, datos de negocio, metricas de producto, KPIs.

### CP-2 · Ejecucion
1. **Costo de Inaccion** — 4 dimensiones: deuda acumulandose, riesgo seguridad, costo oportunidad, riesgo talento. Magnitud + horizonte por dimension. [CODIGO] [DOC] [INFERENCIA]
2. **4 Pilares de Valor** — metrica actual vs. objetivo, delta, horizonte de materializacion, evidencia AS-IS. [DOC] [INFERENCIA]
3. **Estructura de Inversion** — FTE-meses, NUNCA precios. 3 escenarios. Disclaimer obligatorio. [INFERENCIA]
4. **Modelo Financiero** — NPV/IRR/payback como RANGOS indicativos, no cifras exactas. Supuestos explicitos. [INFERENCIA]
5. **Call to Action** — accion especifica, deadline, siguiente paso, consecuencia de no actuar. [INFERENCIA]

**DISCLAIMER**: Cifras financieras son indicadores de magnitud, NO proyecciones auditables. Incluyen 5% margen de innovacion.

### CP-3 · Validacion
- [ ] NPV/IRR/payback como rangos con supuestos
- [ ] Call to action con deadline y consecuencia
- [ ] Costo de inaccion >=3 dimensiones
- [ ] 4 pilares con metrica actual vs. objetivo
- [ ] CERO precios
- [ ] Tono C-level: conciso, orientado a decision

## RESTRICCIONES
- NUNCA precios finales. Solo magnitudes.
- Tono persuasivo basado en evidencia, no retorica vacia.
- Datos insuficientes: usar proxies tecnicos (deploy velocity, MTTR) con disclaimer.
- Diagramas Mermaid: `mindmap` + `gantt`.
