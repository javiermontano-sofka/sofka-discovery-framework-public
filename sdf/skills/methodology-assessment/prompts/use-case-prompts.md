# Methodology Assessment — Use Case Prompts

> PMO-APEX Skill Prompts | 4 Contextualized Use Cases | Last updated: 2026-03-17

---

## Use Case 1: New Project Methodology Selection

```
/pm:methodology-assessment $PROJECT_NAME --dimensions=8 --full

Seleccionar metodología para {NOMBRE_PROYECTO}.
Scope certainty: {ALTA/MEDIA/BAJA}. Team size: {N}. Duration: {MESES} meses.
Regulatory: {ALTA/MEDIA/BAJA}. Stakeholder availability: {ALTA/MEDIA/BAJA}.

Requiero:
1. Scoring matrix 8 dimensiones x 5 metodologías [METRIC]
2. Recomendación top 2 con nivel de confianza [PLAN]
3. Sensitivity analysis: qué cambiaría la recomendación [METRIC]
4. Tailoring guidance para la metodología seleccionada [PLAN]
```

## Use Case 2: Agile vs Waterfall Decision

```
/pm:methodology-assessment $PROJECT_NAME --quick --compare=scrum,waterfall,hybrid

Decisión rápida Agile vs Waterfall para {NOMBRE_PROYECTO}.
Context: {DESCRIPCION_BREVE}. Deadline fijo: {SI/NO}. Requisitos claros: {SI/NO}.

Requiero:
1. Scoring comparativo en 3 dimensiones principales [METRIC]
2. Pros/cons de cada opción para este contexto [PLAN]
3. Recomendación con justificación en 1 párrafo [PLAN]
4. Riesgos de la opción NO seleccionada [PLAN]
```

## Use Case 3: Methodology Assessment for Regulated Industry

```
/pm:methodology-assessment $PROJECT_NAME --dimensions=8 --include-tailoring

Assessment para proyecto en industria regulada ({INDUSTRIA}).
Regulaciones: {LISTA_REGULACIONES}. Auditoría: {FRECUENCIA}.

Requiero:
1. Assessment con peso elevado en dimensión regulatoria [METRIC]
2. Opciones que cumplan requisitos de trazabilidad y documentación [PLAN]
3. Tailoring de metodología ágil para compliance (si aplica) [PLAN]
4. Mapa de artefactos regulatorios por fase [DOC]
```

## Use Case 4: Portfolio Methodology Standardization

```
/pm:methodology-assessment $ORG_NAME --dimensions=8 --full

Assessment de metodología estándar para portfolio de {N} proyectos.
Tipos: {DISTRIBUCIÓN_TIPOS}. Madurez organizacional: Nivel {N}.

Requiero:
1. Assessment consolidado considerando diversidad del portfolio [METRIC]
2. Metodología base con variantes por tipo de proyecto [PLAN]
3. Governance framework para consistencia cross-proyecto [PLAN]
4. Training roadmap para adopción organizacional [SCHEDULE]
```

---

*PMO-APEX v1.0 — Use Case Prompts: Methodology Assessment*
