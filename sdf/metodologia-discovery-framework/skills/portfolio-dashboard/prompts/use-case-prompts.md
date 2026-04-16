# Use Case Prompts — Portfolio Dashboard

> PMO-APEX Skill: `portfolio-dashboard` · Prompts NL-HP para reporting de portafolio
> Última actualización: 2026-03-17

---

## UC-01: Dashboard Ejecutivo Completo

```
Genera el portfolio dashboard completo para {nombre_portfolio} periodo
{periodo}. Incluye: executive KPI summary (5 indicadores con trend),
health heatmap (proyecto x dimensión), resource utilization, budget
rollup, risk concentration, y exception list. El dashboard debe ser
legible por un ejecutivo en bajo 3 minutos.
```

## UC-02: Resource Utilization Dashboard

```
Genera el dashboard de resource utilization para {nombre_portfolio}.
Muestra: demanda vs. capacidad por skill area, roles sobre-asignados
(>90%), conflictos cross-project, y proyección de demanda para los
próximos 3 meses. Highlight cuellos de botella sistémicos.
```

## UC-03: Budget Rollup Summary

```
Genera el budget rollup para {nombre_portfolio} periodo {periodo}.
Muestra: planned vs. actual vs. forecast por proyecto, varianza
agregada del portafolio, burn rate vs. planned, y proyección de
cost-at-completion. Flag proyectos con varianza > 10%.
```

## UC-04: Risk Concentration Map

```
Genera el mapa de risk concentration para {nombre_portfolio}.
Identifica: riesgos correlacionados, concentración por vendor/
tecnología/recurso, riesgos sistémicos que impactan 3+ proyectos,
y exposure total del portafolio. Heatmap proyecto x categoría de riesgo.
```

## UC-05: Strategic Alignment Visualization

```
Genera la visualización de strategic alignment para {nombre_portfolio}.
Muestra: distribución de inversión por tema estratégico vs. peso
estratégico, proyectos sin linkage estratégico, y alignment gap
analysis. Formato: bubble chart conceptual con investment vs. priority.
```

## UC-06: Exception Report

```
Genera el exception report para {nombre_portfolio}. Lista proyectos
que requieren atención del steering committee: proyectos en red,
budget overruns > 10%, schedule delays > 2 semanas, resource conflicts
sin resolución, y risks materialized. Para cada exception: descripción,
impacto, acción requerida, y owner propuesto.
```

## UC-07: Trend Dashboard (3 Periodos)

```
Genera el trend dashboard para {nombre_portfolio} mostrando los
últimos 3 periodos. Para cada KPI principal: valor actual, tendencia,
predicción del próximo periodo. Identifica patterns: mejorando,
estable, declinando. Flag dimensiones con tendencia negativa por
2+ periodos consecutivos.
```

## UC-08: Dashboard HTML Branded

```
Genera el portfolio dashboard de {nombre_portfolio} en formato HTML
con branding APEX (#2563EB, #F59E0B, #0F172A). Incluye tablas
interactivas, iconos de tendencia, y color coding RAG. El HTML
debe ser self-contained y presentable sin herramientas adicionales.
```
