# Portfolio Risk Management — Use Case Prompts

> PMO-APEX Skill Prompts | 4 Contextualized Use Cases | Last updated: 2026-03-17

---

## Use Case 1: Portfolio Risk Aggregation Report

```
/pm:portfolio-risk $PORTFOLIO --report=aggregated

Generar reporte de riesgos agregados del portfolio {NOMBRE_PORTFOLIO}.
Proyectos activos: {N}. Budget total: {MONTO} FTE-meses.
Risk registers individuales: disponibles para {N} proyectos.

Requiero:
1. Top 10 riesgos por EMV agregado cross-portfolio [METRIC]
2. Concentration analysis: riesgos que afectan 2+ proyectos [PLAN]
3. Dependency risks: inter-project risk chains [PLAN]
4. Aggregate exposure (total EMV) vs portfolio risk appetite [METRIC]
5. Risk heat map por categoría (técnico, recurso, vendor, regulatorio) [METRIC]
```

## Use Case 2: Portfolio Stress Test

```
/pm:portfolio-risk $PORTFOLIO --stress-test --scenarios=3

Ejecutar stress test del portfolio {NOMBRE_PORTFOLIO}.
Proyectos: {LISTA_CON_BUDGET_Y_STATUS}. Interdependencias: {LISTA}.

Requiero:
1. Diseño de 3 escenarios black swan (económico, tecnológico, operacional) [PLAN]
2. Impacto en cascada por escenario cross-project [METRIC]
3. Exposición financiera agregada por escenario [METRIC]
4. Circuit-breaker triggers: umbrales de activación [DECISION]
5. Mitigaciones preventivas para los 2 escenarios más probables [PLAN]
```

## Use Case 3: Risk-Adjusted Portfolio Balancing

```
/pm:portfolio-risk $PORTFOLIO --optimize --risk-appetite={LEVEL}

Optimizar balance riesgo-valor del portfolio {NOMBRE_PORTFOLIO}.
Risk appetite: {CONSERVADOR/MODERADO/AGRESIVO}.
Proyectos candidatos: {LISTA_CON_VALOR_Y_RIESGO}.

Requiero:
1. Risk-adjusted value por proyecto (valor x probabilidad de éxito) [METRIC]
2. Risk contribution de cada proyecto al portfolio total [METRIC]
3. Efficient frontier: combinaciones óptimas de proyectos [METRIC]
4. Proyectos que exceden risk appetite individual con alternativas [PLAN]
5. Recomendación de portfolio óptimo con justificación [DECISION]
```

## Use Case 4: Inter-Project Dependency Risk Map

```
/pm:portfolio-risk $PORTFOLIO --dependencies --visualization

Mapear riesgos de dependencias inter-proyecto en {NOMBRE_PORTFOLIO}.
Proyectos: {LISTA}. Dependencies conocidas: {LISTA_DEPENDENCIES}.

Requiero:
1. Dependency graph con risk overlay (Mermaid) [PLAN]
2. Critical dependency chains: secuencias con 0 buffer [SCHEDULE]
3. Single-point-of-failure analysis (recursos, vendors, tecnología) [METRIC]
4. Impacto de retraso por proyecto en downstream dependencies [SCHEDULE]
5. Buffer recommendations para dependency chains críticas [PLAN]
```

---

*PMO-APEX v1.0 — Use Case Prompts: Portfolio Risk Management*
