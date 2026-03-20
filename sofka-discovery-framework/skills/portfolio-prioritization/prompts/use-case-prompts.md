# Use Case Prompts — Portfolio Prioritization

> PMO-APEX Skill: `portfolio-prioritization` · Prompts NL-HP para priorización
> Última actualización: 2026-03-17

---

## UC-01: Weighted Scoring Model

```
Diseña y ejecuta un weighted scoring model para priorizar {numero}
proyectos del portafolio de {nombre_organizacion}. Define 5 criterios
con pesos alineados a la estrategia, escala 1-10 con rubrics,
y score cada proyecto. Genera ranking con sensitivity analysis.
```

## UC-02: Efficient Frontier Analysis

```
Calcula la efficient frontier para el portafolio de {nombre_organizacion}
con constraints de budget ({budget}) y recursos ({recursos}).
Identifica la combinación óptima de proyectos que maximiza valor total.
Muestra trade-offs entre proyectos near the frontier.
```

## UC-03: Criteria and Weight Workshop

```
Facilita un workshop de definición de criterios y pesos para el
portafolio de {nombre_organizacion}. Propón 5-7 criterios basados
en la estrategia organizacional. Para cada criterio: definición,
rubric 1-10, y peso propuesto. Genera material para workshop de
alignment con stakeholders ANTES de scoring.
```

## UC-04: Sensitivity Analysis

```
Ejecuta sensitivity analysis sobre el ranking del portafolio de
{nombre_organizacion}. Varía pesos de criterios en +/- 15% y scores
en +/- 1 punto. Identifica: top projects que son estables, projects
en zona de decisión, y criterios que más afectan el ranking. Genera
tornado chart conceptual de sensitivity.
```

## UC-05: Portfolio Rebalancing

```
El portafolio de {nombre_organizacion} necesita rebalanceo.
{descripcion_cambio} ha alterado las prioridades. Re-score el
portafolio con criterios actualizados. Compara ranking anterior
vs. nuevo. Identifica proyectos que suben, bajan, o deberían
cancelarse. Genera rebalancing recommendation.
```

## UC-06: New Project Intake Scoring

```
Un nuevo proyecto candidato "{nombre_proyecto}" solicita entrada
al portafolio de {nombre_organizacion}. Score contra los criterios
existentes del portafolio. Compara score vs. proyectos actuales.
Identifica qué proyecto(s) desplazaría si hay resource constraints.
Genera intake recommendation.
```

## UC-07: Prioritization for Steering Committee

```
Genera la presentación de priorización del portafolio de
{nombre_organizacion} para el steering committee. Incluye:
scoring matrix, ranking, sensitivity analysis, efficient frontier,
y recomendación de inversión. Formato: decision-ready con 3 opciones
(aggressive/balanced/conservative) y trade-offs explícitos.
```

## UC-08: WSJF Prioritization (Agile)

```
Aplica Weighted Shortest Job First (WSJF) para priorizar el backlog
de portfolio de {nombre_organizacion}. Para cada epic/initiative:
calcular Cost of Delay (Business Value + Time Criticality +
Risk Reduction) / Job Duration. Rankear por WSJF score.
```
