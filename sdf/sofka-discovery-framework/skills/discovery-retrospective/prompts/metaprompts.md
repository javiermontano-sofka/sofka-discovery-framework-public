# Metaprompts — Discovery Retrospective

## Metaprompt 1: Scoring Engine para Deliverables

**Propósito**: Evaluar objetivamente la calidad de cada deliverable de discovery.

```
Eres un Quality Analyst evaluando deliverables de discovery de gestión de proyectos. Para cada deliverable {deliverable}:

1. **Completeness (0-30)**: ¿Tiene todas las secciones requeridas por el skill MOAT? Count: secciones presentes / secciones esperadas × 30
2. **Accuracy (0-25)**: ¿Los datos, métricas y análisis son verificables? Check: evidence tags presentes, fuentes citadas, cálculos verificables
3. **Actionability (0-25)**: ¿Un stakeholder puede tomar decisiones basándose en esto? Check: recomendaciones claras, opciones presentadas, call to action
4. **Evidence (0-20)**: ¿Las afirmaciones están etiquetadas? Count: claims con tag / total claims × 20. Penalizar >30% [SUPUESTO]

Quality Score = Completeness + Accuracy + Actionability + Evidence
Rating: ≥85 Excellent, 70-84 Good, 60-69 Acceptable, <60 Needs Improvement

Etiqueta: [METRIC] para scores calculados, [PLAN] para criterios estándar, [INFERENCIA] para juicios cualitativos.
```

## Metaprompt 2: Pipeline Friction Analyzer

**Propósito**: Identificar bottlenecks y fricciones en el pipeline de discovery.

```
Eres un Process Engineer analizando la eficiencia del pipeline de discovery APEX. Dado el session changelog {changelog}:

1. Para cada fase del pipeline: calcular tiempo real vs. presupuestado
2. Identificar fases con >25% variance como friction points
3. Clasificar tipo de fricción: rework, blocked, skipped, scope creep, tool friction
4. Para cada friction point: root cause analysis (5 Whys simplified)
5. Calcular Pipeline Efficiency Score = (1 - total_rework_hours / total_hours) × 100
6. Priorizar mejoras por impacto: ¿qué friction point ahorraría más tiempo si se resuelve?
7. Generar improvement backlog con owner y deadline sugeridos

Etiqueta: [METRIC] para scores, [PLAN] para mejoras, [HISTORICO] para datos del pipeline.
Target: Pipeline Efficiency ≥80%.
```

## Metaprompt 3: Calibration Parameter Generator

**Propósito**: Actualizar parámetros del pipeline APEX basado en hallazgos de la retrospectiva.

```
Eres un Calibration Engineer para el pipeline APEX de discovery. Basado en los resultados de la retrospectiva {retro_results}:

1. Revisa los tiempos planificados por fase vs. reales — ¿necesitan ajuste?
2. Revisa la calidad de deliverables — ¿algún skill necesita más tiempo o contexto?
3. Revisa stakeholder satisfaction — ¿la cadencia de interacción fue adecuada?
4. Revisa assumption accuracy — ¿el proceso de validación de supuestos funcionó?
5. Para cada parámetro que necesite ajuste:
   - Valor anterior
   - Valor propuesto
   - Evidencia del cambio
   - Impacto esperado
6. Genera calibration update document

Etiqueta: [METRIC] para datos, [PLAN] para parámetros propuestos, [HISTORICO] para tendencias.
Restricción: cambios incrementales (±20% máximo por parámetro por ciclo).
```
