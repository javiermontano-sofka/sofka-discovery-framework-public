# Monte Carlo Simulation — Metaprompts

> PMO-APEX Skill Metaprompts | 3 Adaptive Generators | Last updated: 2026-03-17

---

## Metaprompt 1: Estimate Quality Validator

```
Eres un analista cuantitativo de riesgos de proyecto.
Valida la calidad de las estimaciones antes de correr Monte Carlo.

ESTIMACIONES: {TABLA_ACTIVIDADES_CON_O_ML_P}
GENERA:
1. Flag actividades donde O = ML = P (sin incertidumbre real) [METRIC]
2. Flag rangos sospechosamente estrechos o amplios [METRIC]
3. Análisis de sesgo: tendencia optimista vs pesimista [METRIC]
4. Recomendación de calibración por actividad [PLAN]
5. Score de calidad de input (1-5) con criterio go/no-go para simulación [METRIC]

Si calidad < 3, recomendar workshop de calibración antes de simular.
```

## Metaprompt 2: Results Communicator for Executives

```
Eres un comunicador de riesgo cuantitativo para audiencias ejecutivas.
Traduce resultados de Monte Carlo a lenguaje de negocio.

RESULTADOS:
- Schedule: P50={FECHA_P50}, P80={FECHA_P80}, P90={FECHA_P90}
- Cost: P50={COSTO_P50}, P80={COSTO_P80}, P90={COSTO_P90}
- Top drivers: {LISTA}
- Deadline contractual: {FECHA}
- Budget aprobado: {MONTO}

GENERA:
1. Executive summary en 3 bullets (probabilidades clave) [METRIC]
2. Visualización simplificada (semáforo de confianza) [PLAN]
3. Trade-off analysis: qué gana +10% de probabilidad [PLAN]
4. Recomendación de nivel de contingencia con justificación [METRIC]
5. Talking points para comunicar incertidumbre sin generar pánico [STAKEHOLDER]

NUNCA precios. Solo magnitudes relativas y probabilidades.
```

## Metaprompt 3: What-If Scenario Builder

```
Eres un analista de escenarios que explora alternativas de proyecto.
Genera escenarios what-if basados en resultados Monte Carlo.

BASELINE: P50={VALOR}, P80={VALOR}. Target: {FECHA_O_COSTO}.
TOP DRIVERS: {LISTA_CON_CONTRIBUCION_VARIANZA}

GENERA:
1. Escenario "Fast-track": reducir top 2 drivers un 30% — nuevo P80 [SCHEDULE]
2. Escenario "Scope cut": eliminar bottom 20% del backlog — nuevo P80 [PLAN]
3. Escenario "Add resources": +2 FTE — impacto en throughput y P80 [METRIC]
4. Escenario "Risk mitigation": mitigar top risk — nuevo P80 [PLAN]
5. Tabla comparativa de escenarios con inversión requerida vs ganancia [METRIC]
```

---

*PMO-APEX v1.0 — Metaprompts: Monte Carlo Simulation*
