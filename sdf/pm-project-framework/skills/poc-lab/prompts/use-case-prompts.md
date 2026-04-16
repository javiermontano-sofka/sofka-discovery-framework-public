# Use Case Prompts — PoC Lab

> PMO-APEX Skill: `poc-lab` · Prompts NL-HP para diseño y ejecución de PoCs
> Última actualización: 2026-03-17

---

## UC-01: PoC de Herramienta PM

```
Diseña un PoC para evaluar {herramienta_1} vs. {herramienta_2} para
gestión de proyectos en {nombre_organizacion}. Define: hipótesis,
5 criterios de evaluación con pesos, time-box de {semanas} semanas,
equipo piloto de {personas} personas, datos de prueba requeridos,
y protocolo de evaluación. Genera evaluation matrix template.
```

## UC-02: Pilot de Metodología

```
Diseña un pilot de {metodologia} para el equipo {nombre_equipo}
de {nombre_organizacion}. Define: hipótesis (qué mejora se espera),
duración ({sprints} sprints), métricas de éxito vs. baseline actual,
equipo piloto, coaching plan, y criterios de GO/NO-GO para scale-up.
```

## UC-03: PoC de Proceso

```
Diseña un PoC para probar la hipótesis: "{hipotesis}". Define el
experimento controlado: qué se cambia, qué se mantiene constante,
cómo se mide el resultado, tamaño de muestra necesario, time-box,
y criterios de éxito. Genera protocolo de experimento documentado.
```

## UC-04: Evaluation Matrix

```
Genera una evaluation matrix para comparar {num_opciones} opciones
de {categoria} para {nombre_organizacion}. Criterios: {lista_criterios}.
Para cada criterio: definición, escala de medición (1-5), rubric por
score, peso, y método de evaluación. La matrix debe ser completable
por evaluadores independientes con resultados reproducibles.
```

## UC-05: Scale-Up Risk Assessment

```
El PoC de {herramienta/metodologia} fue exitoso. Genera un scale-up
risk assessment que identifique: qué cambia al pasar de PoC a
producción (volumen, complejidad, resistencia, soporte, costo),
mitigaciones por riesgo, y esfuerzo estimado de scale-up.
Incluye comparison: PoC scope vs. production scope.
```

## UC-06: PoC Results Report

```
Genera el reporte de resultados del PoC de {nombre_poc}.
Incluye: hipótesis original, methodology, datos recolectados,
scores por criterio por opción, análisis comparativo, scale-up
risks, y recomendación GO/NO-GO/PIVOT con justificación basada
en evidencia. Usa evidence tags en toda afirmación.
```

## UC-07: PoC Budget & Timeline

```
Estima el budget y timeline para un PoC de {tipo_poc} evaluando
{num_opciones} opciones. Incluye: costo de licencias/sandbox,
horas-persona del equipo piloto, costo de facilitación, timeline
por fase (setup, execution, analysis, decision), y dependencias.
Formato: mini business case para aprobación.
```

## UC-08: Decision Protocol

```
Diseña el protocolo de decisión post-PoC para {nombre_organizacion}.
Define: quiénes son los decision-makers, qué evidencia necesitan,
formato de presentación de resultados, criterios de GO/NO-GO/PIVOT,
y qué pasa si los decision-makers no están de acuerdo con la
recomendación del PoC. Incluye template de decision memo.
```
