# Use Case Prompts — Pipeline Governance

> PMO-APEX Skill: `pipeline-governance` · Prompts NL-HP para governance de gates
> Última actualización: 2026-03-17

---

## UC-01: Gate Review G1 (Discovery)

```
Ejecuta el gate review G1 para el proyecto {nombre_proyecto}.
Verifica los criterios de discovery completeness:
- Stakeholder register con al menos 80% de stakeholders identificados
- Riesgos iniciales documentados con evidence tags
- Scope preliminar definido
- Evidence audit: calcula porcentaje de [SUPUESTO] vs. total
Genera reporte GO/CONDITIONAL GO/NO-GO con justificación por criterio.
```

## UC-02: Data Contract Validation

```
Valida los data contracts entre la fase {fase_origen} y la fase {fase_destino}
del proyecto {nombre_proyecto}. Para cada artefacto requerido por la fase
destino, verifica: existencia, completitud, quality score, y evidence tags.
Reporta artefactos faltantes o que no cumplen el umbral de calidad.
```

## UC-03: Evidence Audit Pre-Gate

```
Ejecuta un evidence audit completo sobre los entregables del proyecto
{nombre_proyecto} en preparación para el gate {gate_id}.
Contabiliza evidence tags por tipo, calcula porcentaje de [SUPUESTO],
y verifica umbral según gate (G1: 40%, G1.5: 30%, G2: 20%, G3: 10%).
Genera reporte con afirmaciones sin evidence tag listadas individualmente.
```

## UC-04: Conditional GO Follow-up

```
El proyecto {nombre_proyecto} recibió CONDITIONAL GO en el gate {gate_id}
con {numero} condiciones pendientes. Verifica el estado de cada condición:
- Condición cumplida: evidencia de cumplimiento
- Condición en progreso: % de avance y fecha estimada de cierre
- Condición sin avance: escalation trigger
Genera reporte de follow-up para el próximo gate review.
```

## UC-05: Gate Criteria Calibration

```
El proyecto {nombre_proyecto} usa metodología {metodologia}.
Calibra los criterios del gate {gate_id} para esta metodología:
- Agile: gates lightweight pero frecuentes
- Waterfall: gates comprehensivos
- Hybrid: rigor proporcional por workstream
Genera checklist calibrado con criterios mandatorios y opcionales.
```

## UC-06: Gate Bypass Waiver

```
El proyecto {nombre_proyecto} solicita bypass del gate {gate_id}
por razón: {razon_bypass}. Documenta:
1. Criterios que no se cumplen y su justificación
2. Riesgos de proceder sin gate compliance
3. Condiciones compensatorias propuestas
4. Autoridad que aprueba el waiver
Genera documento de waiver formal para aprobación.
```

## UC-07: Portfolio Gate Dashboard

```
Genera un dashboard consolidado de gate status para todos los proyectos
activos en el portfolio. Para cada proyecto muestra: fase actual, último
gate result, próximo gate scheduled, condiciones pendientes, y risk flags.
Agrupa por status: en gate, post-gate, pre-gate.
```

## UC-08: Retrospectiva de Gate

```
Ejecuta una retrospectiva del gate {gate_id} del proyecto {nombre_proyecto}.
Analiza: tiempo de preparación, calidad de evidencia presentada, eficiencia
de la revisión, y calidad de la decisión tomada. Identifica mejoras para
futuros gates. Actualiza lessons-learned.md con hallazgos.
```
