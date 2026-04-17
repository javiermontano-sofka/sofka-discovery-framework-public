# Organizational Change Management — Use Case Prompts

> PMO-APEX Skill Prompts | 5 Contextualized Use Cases | Last updated: 2026-03-17

---

## Use Case 1: Change Impact Assessment

```
/pm:organizational-change $PROJECT_NAME --phase=assessment

Evaluar el impacto del cambio para {NOMBRE_PROYECTO}.
Proyecto: {DESCRIPCION}. Población impactada: {N} personas en {M} departamentos.
Cambios principales: {LISTA_CAMBIOS}.

Requiero:
1. Mapa de impacto por dimensión (proceso, tecnología, organización, rol, cultura) [PLAN]
2. Severidad de impacto por grupo de audiencia (1-4 escala) [METRIC]
3. ADKAR diagnostic por audiencia: gap más crítico por grupo [METRIC]
4. Mapa de stakeholders clave para el cambio (sponsors, champions, resistors) [STAKEHOLDER]
5. Recomendación de intensidad de OCM por grupo [PLAN]
```

## Use Case 2: ADKAR-Based OCM Plan

```
/pm:organizational-change $PROJECT_NAME --model=adkar --phase=plan --audiences=3

Diseñar plan OCM basado en ADKAR para {NOMBRE_PROYECTO}.
Audiencias: {LISTA_AUDIENCIAS_CON_TAMAÑO}.
ADKAR gaps identificados: {GAPS_POR_AUDIENCIA}.
Timeline del proyecto: {FECHA_GO_LIVE} en {SEMANAS} semanas.

Requiero:
1. Plan de intervenciones por elemento ADKAR por audiencia [PLAN]
2. Campaña de comunicación con calendario de 12 semanas [SCHEDULE]
3. Plan de training con contenido, formato y fechas por audiencia [PLAN]
4. Red de champions: perfiles, reclutamiento y enablement [STAKEHOLDER]
5. Dashboard de adopción con KPIs y targets [METRIC]
```

## Use Case 3: Resistance Diagnostic and Intervention

```
/pm:organizational-change $PROJECT_NAME --track=resistance

Diagnosticar y gestionar resistencia al cambio en {NOMBRE_PROYECTO}.
Adopción actual: {PORCENTAJE}%. Target: {TARGET}%. Go-live: hace {SEMANAS} semanas.
Señales de resistencia: {LISTA_SEÑALES}. Grupos más resistentes: {LISTA_GRUPOS}.

Requiero:
1. Diagnóstico de causa raíz de resistencia por grupo (SCARF model) [STAKEHOLDER]
2. Identificación del elemento ADKAR con mayor gap por grupo resistente [METRIC]
3. Plan de intervención específica por grupo y causa raíz [PLAN]
4. Scripts de conversación para managers con resistors [PLAN]
5. Métricas de seguimiento para verificar reducción de resistencia [METRIC]
```

## Use Case 4: Adoption Tracking Dashboard

```
/pm:organizational-change $PROJECT_NAME --track=adoption --report

Generar reporte de adopción para {NOMBRE_PROYECTO}.
Go-live: {FECHA}. Semanas post go-live: {N}.
Audiencias: {LISTA_AUDIENCIAS}. Herramientas/procesos cambiados: {LISTA}.

Requiero:
1. Dashboard de adopción por audiencia y por herramienta/proceso [METRIC]
2. Trend de adopción semanal (mejorando / estancado / decayendo) [METRIC]
3. Grupos con adopción por debajo del target con diagnóstico ADKAR [METRIC]
4. Acciones de reinforcement recomendadas por grupo [PLAN]
5. Proyección de adopción a 30/60/90 días [METRIC]
```

## Use Case 5: Change Saturation Analysis

```
/pm:organizational-change $PORTFOLIO --saturation-analysis

Analizar saturación de cambio en la organización.
Iniciativas activas: {N} proyectos. Grupos impactados: {LISTA_CON_OVERLAP}.

Requiero:
1. Heat map de carga de cambio por grupo organizacional [METRIC]
2. Grupos en riesgo de change fatigue (3+ cambios simultáneos) [STAKEHOLDER]
3. Recomendación de sequencing o bundling de cambios [PLAN]
4. Priorización de cambios por impacto estratégico vs carga organizacional [PLAN]
5. Comunicación consolidada recomendada para reducir ruido [PLAN]
```

---

*PMO-APEX v1.0 — Use Case Prompts: Organizational Change Management*
