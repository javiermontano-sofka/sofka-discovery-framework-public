# Use Case Prompts — PMO Maturity

> PMO-APEX Skill: `pmo-maturity` · Prompts NL-HP para evaluación de madurez
> Última actualización: 2026-03-17

---

## UC-01: Assessment de Madurez Completo

```
Ejecuta un assessment de madurez PM completo para {nombre_organizacion}
usando framework {opm3/p3m3/combined}. Evalúa las 5 dimensiones
(procesos, personas, herramientas, governance, cultura) en escala 1-5.
Genera radar chart, gap analysis contra target level {nivel_target},
y roadmap de mejora con estimación de inversión en FTE-meses.
```

## UC-02: Maturity Quick Scan

```
Ejecuta un quick scan de madurez PM para {nombre_organizacion}.
Versión reducida: 3 preguntas por dimensión, scoring simplificado.
Objetivo: producir un baseline en 1 sesión. Genera radar chart
indicativo y top 3 áreas de mejora prioritarias.
```

## UC-03: Gap Analysis por Dimensión

```
Para la dimensión {nombre_dimension} del assessment de madurez de
{nombre_organizacion}, ejecuta un gap analysis detallado:
- Score actual con evidencia específica
- Target score con justificación
- Acciones de mejora para cerrar el gap
- Dependencias con otras dimensiones
- Estimación de esfuerzo (FTE-meses) y timeline
```

## UC-04: Benchmark Sectorial

```
Compara la madurez PM de {nombre_organizacion} contra benchmarks
del sector {nombre_sector}. Para cada dimensión: score de la organización
vs. mediana del sector vs. top quartile. Identifica dimensiones donde
la organización está por debajo de la mediana sectorial y prioriza
mejoras por impacto competitivo.
```

## UC-05: Maturity Roadmap Design

```
Basándose en los resultados del assessment de madurez de
{nombre_organizacion} (actual: {nivel_actual}, target: {nivel_target}),
diseña un roadmap de mejora en fases:
- Quick wins (0-3 meses): acciones de alto impacto y bajo esfuerzo
- Foundation (3-12 meses): cambios estructurales
- Measurement (12-24 meses): implementación de métricas
- Optimization (24+ meses): mejora continua
Incluye inversión estimada por fase.
```

## UC-06: Assessment de Madurez Ágil

```
Evalúa la madurez ágil de {nombre_organizacion} complementando
el assessment PM tradicional. Dimensiones ágiles: adaptabilidad,
entrega iterativa, empowerment de equipos, feedback loops, técnicas
de estimación, y retrospectivas. Usa el Agile Fluency Model como
referencia. Genera recomendaciones para mejorar agilidad organizacional.
```

## UC-07: Executive Presentation de Maturity

```
Genera una presentación ejecutiva del assessment de madurez de
{nombre_organizacion} para el C-level. Formato: 5 slides conceptuales
(1. Estado actual, 2. Benchmarks, 3. Gaps críticos, 4. Roadmap,
5. Inversión requerida). Lenguaje de negocio, no técnico PM.
Incluye el argumento de ROI para la inversión en madurez.
```

## UC-08: Maturity Re-Assessment

```
{nombre_organizacion} fue evaluada hace {meses} meses con score
promedio {score_anterior}. Ejecuta re-assessment para medir progreso.
Compara scores por dimensión vs. assessment anterior. Identifica
dimensiones que mejoraron, estancadas, y que declinaron. Evalúa
efectividad del roadmap de mejora implementado.
```
