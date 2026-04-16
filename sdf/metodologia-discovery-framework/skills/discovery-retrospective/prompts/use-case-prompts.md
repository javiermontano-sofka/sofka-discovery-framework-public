# Use Case Prompts — Discovery Retrospective

## Caso de Uso 1: Retrospectiva Cuantitativa Completa

**Contexto**: Discovery de 4 semanas completado. PMO quiere evaluar calidad del pipeline y calibrar para el próximo ciclo.

**Prompt Template**:
```
Ejecuta retrospectiva cuantitativa completa del discovery del proyecto {proyecto}:
- Deliverables producidos: {lista_deliverables}
- Timeline planificado vs. real por fase
- Session changelog disponible en: {path_changelog}
- Evaluar las 7 dimensiones: completeness, accuracy, timeliness, stakeholder satisfaction, assumption validation, methodology fit, pipeline efficiency
- Scoring: 0-100 por deliverable y por dimensión
- Output: Reporte retro cuantitativo + metrics dashboard + improvement actions
```

**Output Esperado**: Reporte con scores por deliverable, análisis por dimensión, top 5 improvement actions con owners.

## Caso de Uso 2: Validation de Supuestos Post-Discovery

**Contexto**: 6 meses después del discovery, el PM quiere verificar cuántos supuestos se validaron para calibrar la calidad del análisis original.

**Prompt Template**:
```
Valida los supuestos del discovery original del proyecto {proyecto}:
- Assumptions registrados: {lista_supuestos} con tag [SUPUESTO]
- Para cada supuesto: buscar evidencia de validación o invalidación
- Clasificar: Validated, Invalidated, Pending, Expired
- Calcular: Assumption Validation Rate
- Analizar: impacto de supuestos invalidados en el proyecto
- Output: Assumption tracker actualizado + impacto assessment + calibración
```

**Output Esperado**: Tracker de supuestos con estado actualizado, análisis de impacto de invalidaciones, lecciones para futuros discoveries.

## Caso de Uso 3: Comparación Cross-Discovery

**Contexto**: PMO ha ejecutado 5 discoveries en el último año y quiere identificar tendencias de mejora organizacional.

**Prompt Template**:
```
Compara métricas de discovery across los últimos {n} ciclos de discovery:
- Discoveries: {lista_proyectos_con_discovery}
- Métricas a comparar: quality score, timeline variance, stakeholder satisfaction, assumption accuracy
- Trend analysis: ¿está mejorando la organización en cada dimensión?
- Benchmark: establecer targets para los próximos discoveries
- Output: Trend report + benchmarks + organizational improvement plan
```

**Output Esperado**: Tabla comparativa con trends, gráficos de evolución, benchmarks propuestos.

## Caso de Uso 4: Quick Quality Score

**Contexto**: Discovery acaba de terminar y se necesita un score rápido de calidad antes del handoff a ejecución.

**Prompt Template**:
```
Calcula quality score rápido del discovery del proyecto {proyecto}:
- Deliverables: evaluar cada uno contra checklist de calidad
- Scoring: Completeness (0-30), Accuracy (0-25), Actionability (0-25), Evidence (0-20)
- Overall: promedio ponderado
- Flag: deliverables con score <60 (requieren mejora antes de handoff)
- Output: Scorecard en tabla + flags + recomendación go/no-go para handoff
```

**Output Esperado**: Scorecard con score por deliverable, overall score, y recomendación de handoff.
