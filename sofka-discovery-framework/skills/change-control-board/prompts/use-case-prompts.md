# Change Control Board — Use Case Prompts

## Caso de Uso 1: Analisis de Impacto de Solicitud de Cambio

**Contexto**: Nueva solicitud de cambio que requiere revision del CCB con analisis de impacto multidimensional.

**Prompt Template**:
```
Analiza el impacto de la solicitud de cambio {CR_ID}: "{CR_DESCRIPTION}"
contra los baselines del proyecto {PROJECT_NAME}.

Baselines actuales:
- Alcance: {SCOPE_BASELINE}
- Cronograma: {SCHEDULE_BASELINE}
- Presupuesto: {BUDGET_BASELINE}

Analiza impacto en 6 dimensiones: alcance, cronograma, presupuesto,
calidad, riesgo, y dependencias.
Identifica alternativas incluyendo "no hacer nada".
Proporciona recomendacion del PM con evidencia.
Formato: documento de briefing para CCB.
```

**Output esperado**: Documento de impacto con tabla multidimensional, alternativas evaluadas, y recomendacion con evidence tags. [PLAN]

## Caso de Uso 2: Preparacion de Agenda CCB

**Contexto**: Reunion CCB programada con multiples solicitudes pendientes.

**Prompt Template**:
```
Prepara la agenda de la reunion CCB-{MEETING_NUMBER} con {PENDING_COUNT}
solicitudes pendientes para el proyecto {PROJECT_NAME}.

CRs pendientes: {CR_LIST}
Miembros CCB: {CCB_MEMBERS}

Para cada CR: resumen, analisis de impacto, recomendacion del PM,
y tiempo estimado de discusion.
Prioriza por urgencia e impacto.
Incluye template de decision para cada CR.
Agrega seccion de impacto acumulativo vs baseline original.
```

**Output esperado**: Agenda estructurada con tiempo total estimado, prioridad por CR, y dashboard de impacto acumulativo. [PLAN]

## Caso de Uso 3: Analisis de Tendencias de Cambio

**Contexto**: Revision trimestral de gobernanza o evaluacion de salud del proyecto.

**Prompt Template**:
```
Analiza el historial de solicitudes de cambio del proyecto {PROJECT_NAME}
para el periodo {PERIOD}.

Datos: {CR_HISTORY}
Fase actual: {PROJECT_PHASE}

Calcula: tasa de cambio por sprint, tasa de aprobacion, impacto promedio,
causas raiz comunes.
Identifica si el volumen de cambios indica problemas de proceso upstream.
Recomienda mejoras de proceso para reducir cambios innecesarios.
```

**Output esperado**: Reporte de tendencias con graficos, patrones identificados, y recomendaciones accionables. [METRIC]

## Caso de Uso 4: Configuracion Inicial del Proceso de Control de Cambios

**Contexto**: Proyecto nuevo que necesita establecer su proceso de control de cambios.

**Prompt Template**:
```
Establece el proceso de control de cambios para el proyecto {PROJECT_NAME}.
Metodologia: {METHODOLOGY}. Tipo de contrato: {CONTRACT_TYPE}.

Necesito:
1. Composicion del CCB con roles y autoridades
2. Categorias de cambio con umbrales de impacto
3. Flujo de proceso con SLAs por categoria
4. Template de solicitud de cambio
5. Protocolo de emergencia
6. Metricas de seguimiento del proceso
```

**Output esperado**: Documento de proceso completo listo para aprobacion del sponsor. [PLAN]

*PMO-APEX v1.0 — Use Case Prompts - Change Control Board*
