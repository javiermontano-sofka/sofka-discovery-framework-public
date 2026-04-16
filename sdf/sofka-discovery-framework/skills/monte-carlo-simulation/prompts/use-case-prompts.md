# Monte Carlo Simulation — Use Case Prompts

> PMO-APEX Skill Prompts | 4 Contextualized Use Cases | Last updated: 2026-03-17

---

## Use Case 1: Schedule Risk Analysis

```
/pm:monte-carlo-simulation $PROJECT_NAME --scope=schedule --iterations=10000

Simulación Monte Carlo de cronograma para {NOMBRE_PROYECTO}.
Actividades: {N} con estimaciones 3 puntos (O, ML, P).
Deadline contractual: {FECHA}. Ruta crítica: {N_ACTIVIDADES} actividades.

Requiero:
1. S-curve con P10, P50, P80, P90 para fecha de entrega [SCHEDULE]
2. Probabilidad de cumplir el deadline contractual [METRIC]
3. Tornado diagram top 5 drivers de varianza [METRIC]
4. Contingencia de schedule recomendada (P80 - P50) [SCHEDULE]
```

## Use Case 2: Cost Confidence Analysis

```
/pm:monte-carlo-simulation $PROJECT_NAME --scope=cost --confidence=P80

Simulación Monte Carlo de costo para {NOMBRE_PROYECTO}.
Work packages: {N} con rangos de costo (optimista, esperado, pesimista).
Budget aprobado: {MONTO}.

Requiero:
1. S-curve de costo con niveles de confianza [METRIC]
2. Probabilidad de entregar dentro del budget aprobado [METRIC]
3. Reserva de contingencia recomendada para P80 [METRIC]
4. Top 5 cost drivers por contribución a varianza [METRIC]
```

## Use Case 3: Combined Schedule-Cost with Risk Events

```
/pm:monte-carlo-simulation $PROJECT_NAME --scope=both --include-risks --sensitivity

Simulación combinada schedule + cost incluyendo riesgos discretos.
Riesgos identificados: {N} con probabilidad e impacto cuantificado.

Requiero:
1. Schedule S-curve con y sin riesgos discretos [SCHEDULE]
2. Cost S-curve con y sin riesgos discretos [METRIC]
3. Impacto incremental de cada riesgo en P80 [METRIC]
4. Recomendación de reservas (management + contingency) [METRIC]
5. Escenarios: base, optimista, pesimista con probabilidades [PLAN]
```

## Use Case 4: Agile Throughput Monte Carlo

```
/pm:monte-carlo-simulation $PROJECT_NAME --scope=schedule --iterations=10000

Monte Carlo basado en throughput para equipo ágil.
Throughput histórico: {DATOS_ÚLTIMOS_N_SPRINTS}.
Backlog restante: {N_ITEMS}.

Requiero:
1. Cuántos sprints para completar backlog (P50, P80, P90) [SCHEDULE]
2. Cuántos items se completarán en {N} sprints (P50, P80) [METRIC]
3. Probabilidad de completar scope para {FECHA} [METRIC]
4. Escenarios con scope reducido: cuánto scope para P80 en la fecha target [PLAN]
```

---

*PMO-APEX v1.0 — Use Case Prompts: Monte Carlo Simulation*
