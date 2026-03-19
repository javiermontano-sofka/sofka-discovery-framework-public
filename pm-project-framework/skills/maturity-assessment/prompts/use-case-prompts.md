# Maturity Assessment — Use Case Prompts

> PMO-APEX Skill Prompts | 4 Contextualized Use Cases | Last updated: 2026-03-17

---

## Use Case 1: Baseline PM Maturity Assessment

```
/pm:maturity-assessment $ORG_NAME --framework=apex --domains=all

Evaluar madurez de gestión de proyectos de {NOMBRE_ORG}.
Contexto: {N} proyectos activos, PMO en formación.
Información disponible: procesos documentados {SI/NO}, templates {N}, herramientas {LISTA}.

Requiero:
1. Scorecard de madurez por dominio (proyecto, programa, portfolio, enablers) [METRIC]
2. Heat map de capacidades con escala 1-5 [METRIC]
3. Top 5 brechas críticas con impacto en entrega [PLAN]
4. Roadmap de mejora 12 meses con quick-wins [SCHEDULE]
```

## Use Case 2: Pre-Transformation Maturity Baseline

```
/pm:maturity-assessment $ORG_NAME --framework=apex --benchmark=industry

Baseline de madurez pre-transformación ágil. Industria: {INDUSTRIA}.

Requiero:
1. Assessment completo con scoring evidence-based [METRIC]
2. Comparación contra benchmark de la industria [METRIC]
3. Áreas que soportan transformación vs requieren capability building previo [PLAN]
4. Business case cuantificado para inversión en madurez [METRIC]
```

## Use Case 3: Post-Improvement Re-Assessment

```
/pm:maturity-assessment $ORG_NAME --framework=p3m3 --domains=all

Re-evaluación de madurez 12 meses después. Baseline anterior: nivel {N}.
Inversión realizada: {FTE_MESES} FTE-meses.

Requiero:
1. Comparativa antes vs ahora con delta por dominio [METRIC]
2. ROI del programa de mejora [METRIC]
3. Brechas cerradas vs persistentes [PLAN]
4. Próximos pasos para siguiente ciclo [SCHEDULE]
```

## Use Case 4: Executive Maturity Briefing

```
/pm:maturity-assessment $ORG_NAME --framework=apex --benchmark=sector

Presentación ejecutiva para board. Audiencia: CEO, CFO, CIO.
Tiempo: 20 minutos.

Requiero:
1. One-page dashboard con indicadores semáforo [METRIC]
2. Traducción de niveles a capacidad de entrega de valor [PLAN]
3. Benchmarking contra sector [METRIC]
4. Tres opciones de inversión con FTE-meses [SCHEDULE]
```

---

*PMO-APEX v1.0 — Use Case Prompts: Maturity Assessment*
