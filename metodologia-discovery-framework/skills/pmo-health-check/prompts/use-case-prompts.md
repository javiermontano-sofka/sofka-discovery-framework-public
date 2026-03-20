# Use Case Prompts — PMO Health Check

> PMO-APEX Skill: `pmo-health-check` · Prompts NL-HP para diagnóstico operativo
> Última actualización: 2026-03-17

---

## UC-01: Health Check Trimestral Completo

```
Ejecuta el health check trimestral completo del PMO {nombre_pmo}
para el periodo {periodo}. Evalúa las 8 dimensiones operativas con
KPIs específicos. Genera dashboard RAG con tendencia vs. trimestre
anterior. Lista acciones correctivas para dimensiones amber/red
con owners y deadlines.
```

## UC-02: Deep Dive en Dimensión Específica

```
La dimensión {nombre_dimension} del PMO {nombre_pmo} está en amber
por segundo trimestre consecutivo. Ejecuta un deep dive:
- Desagregación de KPIs por sub-componente
- Root cause analysis de la tendencia negativa
- Benchmarking contra estándares de industria
- Plan de acción específico con 3 acciones prioritarias
```

## UC-03: Trend Analysis Multi-Trimestre

```
Genera un análisis de tendencias del PMO {nombre_pmo} para los
últimos {numero} trimestres. Para cada dimensión muestra: evolución
del score, patrón identificado (mejorando/estable/declinando),
correlaciones entre dimensiones, y predicción para el próximo
trimestre basada en la tendencia.
```

## UC-04: Health Check Express (Lightweight)

```
Ejecuta un health check express del PMO {nombre_pmo} para el
periodo {periodo}. Versión reducida: 3 KPIs por dimensión,
sin deep dive. Genera dashboard RAG de 1 página. Identifica las
2 dimensiones que requieren atención inmediata. Tiempo objetivo:
producir resultados en 2 horas, no 2 días.
```

## UC-05: Corrective Action Tracking

```
Revisa el estado de las acciones correctivas del último health check
del PMO {nombre_pmo}. Para cada acción: status (completada/en progreso/
sin iniciar), % avance, adherencia a deadline, y evidencia de
implementación. Genera reporte de seguimiento y flag acciones vencidas.
```

## UC-06: Stakeholder Satisfaction Pulse

```
Diseña y ejecuta una encuesta pulse de satisfacción para el PMO
{nombre_pmo}. 7 preguntas, escala 1-5, 3 audiencias (PMs, sponsors,
equipos). Compara resultados con el health check anterior.
Identifica las 3 áreas de mayor insatisfacción con acciones concretas.
```

## UC-07: Health Check Comparison Multi-PMO

```
La organización tiene {numero} PMOs. Genera un health check comparativo
usando los mismos 8 dimensiones y KPIs. Identifica: PMO con mejor
score por dimensión, patterns comunes, y oportunidades de cross-
pollination (transferencia de best practices entre PMOs).
```

## UC-08: Health Check Dashboard Design

```
Diseña el template de dashboard para el health check del PMO {nombre_pmo}.
El dashboard debe ser legible en bajo 5 minutos por el PMO Director.
Incluye: RAG por dimensión, trend arrows, top 3 acciones, y
métricas clave. Formato: Markdown + Mermaid para diagramas.
Usa colores APEX (#2563EB, #F59E0B, #0F172A).
```
