# Closure Report — Use Case Prompts

## Caso de Uso 1: Reporte de Cierre Completo

**Contexto**: Entregables del proyecto aceptados, listo para cierre formal.

**Prompt Template**:
```
Genera un reporte de cierre completo para el proyecto {PROJECT_NAME}.

Datos del proyecto: {PROJECT_DATA}
Entregables: {DELIVERABLES_STATUS}
Retrospectivas: {RETRO_SUMMARIES}
Metricas EVM finales: {EVM_DATA}

Incluye: resumen ejecutivo, verificacion de alcance, performance de cronograma
(Gantt planificado vs real), performance presupuestal (EVM final), resumen de
calidad, disposicion de riesgos, satisfaccion de stakeholders, lecciones
aprendidas (categorizadas), estado de beneficios, y checklist de cierre administrativo.
```

**Output esperado**: Reporte de cierre de 3-5 paginas con tablas de varianza, Mermaid charts, y checklist de cierre administrativo. [PLAN]

## Caso de Uso 2: Sintesis de Lecciones Aprendidas

**Contexto**: Compilar aprendizaje organizacional del proyecto completado.

**Prompt Template**:
```
Sintetiza lecciones aprendidas del proyecto {PROJECT_NAME}.

Fuentes: {RETRO_NOTES}, {INCIDENT_REPORTS}, {TEAM_FEEDBACK}

Categoriza como: Proceso, Tecnico, Personas, Herramientas, Gobernanza, Estimacion.
Para cada leccion: que paso, causa raiz, recomendacion, aplicabilidad.
Aplica test de especificidad: "Un PM que inicia proyecto similar manana puede usar esto?"
Transforma lecciones genericas en recomendaciones especificas y accionables.
```

**Output esperado**: 10-15 lecciones categorizadas, cada una con contexto, accion, y resultado esperado. [DOC]

## Caso de Uso 3: Cierre de Fase

**Contexto**: Fase del proyecto completa, transicion a siguiente fase.

**Prompt Template**:
```
Genera resumen de cierre de fase para {PHASE_NAME} del proyecto {PROJECT_NAME}.

Entregables de fase: {PHASE_DELIVERABLES}
Siguiente fase: {NEXT_PHASE}
Items pendientes: {OPEN_ITEMS}

Incluye: aceptacion de entregables, metricas de performance, items abiertos
que transicionan, lecciones de la fase, y recomendaciones para planning
de la siguiente fase.
```

**Output esperado**: Resumen de 1-2 paginas con tabla de transicion de items y recomendaciones. [PLAN]

## Caso de Uso 4: Reporte de Terminacion (Proyecto Cancelado)

**Contexto**: Proyecto cancelado antes de completarse, necesita cierre formal.

**Prompt Template**:
```
Genera reporte de terminacion para el proyecto {PROJECT_NAME} cancelado
en fase {CANCELLATION_PHASE}.

Razon de cancelacion: {REASON}
Costos incurridos: {SUNK_COSTS}
Entregables parciales: {PARTIAL_DELIVERABLES}

Documenta: costos hundidos, entregables salvables, lecciones de la decision
de cancelacion, recomendaciones para evitar repeticion, y cierre administrativo.
```

**Output esperado**: Reporte de terminacion con analisis de costos hundidos, entregables recuperables, y lecciones. [METRIC]

*PMO-APEX v1.0 — Use Case Prompts - Closure Report*
