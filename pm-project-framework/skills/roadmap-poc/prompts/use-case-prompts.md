# Use Case Prompts — Roadmap & PoC Execution Planning

> **Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
> **© Comunidad MetodologIA** — Todos los derechos reservados

---

## Propósito

Prompts específicos para escenarios de uso frecuentes del skill `metodologia-roadmap-poc`. Cada prompt incluye contexto, variables esperadas, y criterios de calidad del output.

---

## UC-01: Planificación Completa de PoC

### Escenario

El equipo de pre-sales necesita un roadmap completo para un PoC con un cliente enterprise. Se conoce el alcance, la duración, y el modelo de equipo.

### Prompt

```
Genera un roadmap completo de ejecución para un PoC de {ALCANCE} con duración de {DURACIÓN} semanas
y equipo {MODELO_EQUIPO}.

Contexto del cliente:
- Industria: {INDUSTRIA}
- Tamaño del equipo disponible: {TAMAÑO_EQUIPO}
- Madurez DevOps: {NIVEL_MADUREZ} (1-4)
- Restricciones conocidas: {RESTRICCIONES}

Incluir las 7 secciones completas: kickoff, prerequisites, sprint breakdown, team/budget,
timeline, gate criteria, y risk register.

{MODO}=piloto-auto
{FORMATO}=markdown
{VARIANTE}=técnica
```

### Variables

| Variable | Ejemplo |
|---|---|
| `{ALCANCE}` | "Modernización del sistema de originación de crédito" |
| `{DURACIÓN}` | 6 |
| `{MODELO_EQUIPO}` | "Provider+Client hybrid, 4 seniors MetodologIA + 2 SMEs cliente" |
| `{INDUSTRIA}` | "Banca" |
| `{TAMAÑO_EQUIPO}` | "6 FTEs" |
| `{NIVEL_MADUREZ}` | "2 (CI manual, sin IDP)" |
| `{RESTRICCIONES}` | "No cloud público, data on-premise, ventana de cambios viernes" |

### Criterios de Calidad

- [ ] 9+ prerequisites con status, deadline y blocker flag
- [ ] Sprint breakdown con daily task allocation
- [ ] Budget range ±20% con burn rate mensual
- [ ] Risk register con 5-6 riesgos cuantificados
- [ ] Mermaid Gantt del timeline

---

## UC-02: Evaluación Go/No-Go en Gate

### Escenario

El equipo ha completado Sprint 1 y necesita evaluar si es viable avanzar a Sprint 2. Se requiere una evaluación formal de gate criteria con recomendación.

### Prompt

```
Evalúa el Gate 1→2 para el proyecto {PROYECTO}.

Resultados del Sprint 1:
- Entregables completados: {ENTREGABLES_COMPLETADOS}
- Entregables pendientes: {ENTREGABLES_PENDIENTES}
- Blockers activos: {BLOCKERS}
- Feedback del UAT: {FEEDBACK_UAT}
- Riesgos materializados: {RIESGOS_MATERIALIZADOS}

Genera evaluación PASS/FAIL/CONDITIONAL para cada criterio del gate,
recomendación go/no-go, y plan de remediación si aplica.

{MODO_OPERACIONAL}=validacion-gates
```

### Variables

| Variable | Ejemplo |
|---|---|
| `{PROYECTO}` | "PoC Loan Origination - Banco Nacional" |
| `{ENTREGABLES_COMPLETADOS}` | "API core, modelo de datos, tests unitarios (85% coverage)" |
| `{ENTREGABLES_PENDIENTES}` | "Integración con sistema legacy de scoring" |
| `{BLOCKERS}` | "API de scoring legacy no documentada" |
| `{FEEDBACK_UAT}` | "Flujo principal validado, UX de rechazo no probada" |
| `{RIESGOS_MATERIALIZADOS}` | "R2: Latencia de API legacy >2s (threshold era 500ms)" |

### Criterios de Calidad

- [ ] Cada criterio evaluado como PASS, FAIL o CONDITIONAL con evidencia
- [ ] Criterios CONDITIONAL tienen mitigación, owner y ETA
- [ ] Recomendación GO/REMEDIATION/ESCALATE con justificación
- [ ] Plan de remediación si hay >=1 FAIL
- [ ] Impacto en timeline y budget documentado

---

## UC-03: Diseño de Technology Spike

### Escenario

Antes de comprometer un sprint completo, el equipo necesita validar una tecnología específica mediante un spike acotado. Se requiere un mini-roadmap de 3-5 días.

### Prompt

```
Diseña un technology spike de {DURACIÓN_SPIKE} días para validar {TECNOLOGÍA}
en el contexto de {PROYECTO}.

Hipótesis a validar:
1. {HIPÓTESIS_1}
2. {HIPÓTESIS_2}
3. {HIPÓTESIS_3}

Kill criteria (condiciones para abandonar la tecnología):
- {KILL_1}
- {KILL_2}

Equipo asignado: {EQUIPO_SPIKE}
Entregable esperado: {ENTREGABLE}

Genera un mini-roadmap con daily breakdown, criterios de éxito medibles,
y decisión go/no-go al final del spike.
```

### Variables

| Variable | Ejemplo |
|---|---|
| `{DURACIÓN_SPIKE}` | 3 |
| `{TECNOLOGÍA}` | "Apache Kafka para event sourcing del core bancario" |
| `{PROYECTO}` | "Modernización sistema de pagos" |
| `{HIPÓTESIS_1}` | "Kafka soporta 50K eventos/segundo con el esquema propuesto" |
| `{HIPÓTESIS_2}` | "La integración con el sistema legacy es viable sin middleware adicional" |
| `{HIPÓTESIS_3}` | "El equipo puede operar Kafka en producción con training de 2 semanas" |
| `{KILL_1}` | "Throughput <20K eventos/segundo" |
| `{KILL_2}` | "Requiere más de 3 componentes de middleware adicional" |
| `{EQUIPO_SPIKE}` | "1 senior backend + 1 DevOps" |
| `{ENTREGABLE}` | "Benchmark report + go/no-go recommendation" |

### Criterios de Calidad

- [ ] Daily breakdown con tareas, owner y horas
- [ ] Cada hipótesis tiene test definido y criterio medible
- [ ] Kill criteria son binarios (pasa/no pasa)
- [ ] Entregable del spike es un artefacto concreto
- [ ] Decisión go/no-go documentada con evidencia

---

## UC-04: Scoping de MVP Post-PoC

### Escenario

El PoC fue exitoso y el cliente quiere proceder al MVP. Se necesita definir el scope del MVP basado en los aprendizajes del PoC, con feature prioritization y timeline estimado.

### Prompt

```
A partir de los resultados del PoC de {PROYECTO}, define el scope del MVP.

Resultados del PoC:
- Hipótesis validadas: {HIPÓTESIS_VALIDADAS}
- Hipótesis refutadas: {HIPÓTESIS_REFUTADAS}
- Hallazgos inesperados: {HALLAZGOS}
- Deuda técnica acumulada: {DEUDA}
- Feedback de stakeholders: {FEEDBACK}

Genera:
1. Feature prioritization (MoSCoW) basada en evidencia del PoC
2. MVP scope con acceptance criteria por feature
3. Roadmap de transición PoC→MVP (4-12 semanas)
4. Team scaling plan (de equipo PoC a equipo MVP)
5. Risk register actualizado con riesgos de escalamiento

{VARIANTE}=técnica
```

### Variables

| Variable | Ejemplo |
|---|---|
| `{PROYECTO}` | "Digital Onboarding - Aseguradora XYZ" |
| `{HIPÓTESIS_VALIDADAS}` | "OCR procesa documentos con 95% accuracy, flujo digital reduce tiempo 60%" |
| `{HIPÓTESIS_REFUTADAS}` | "Integración con sistema AML no es viable sin middleware" |
| `{HALLAZGOS}` | "El 30% de usuarios abandonan en paso de selfie — UX debe rediseñarse" |
| `{DEUDA}` | "Hardcoded config, no hay tests de integración, logging básico" |
| `{FEEDBACK}` | "Core flow aprobado, piden soporte multi-idioma y accesibilidad" |

### Criterios de Calidad

- [ ] Features priorizadas con evidencia del PoC, no con opinión
- [ ] Scope MVP diferenciado claramente del PoC scope
- [ ] Timeline considera ramp-up del equipo expandido
- [ ] Deuda técnica del PoC tiene plan de resolución
- [ ] Risk register incluye riesgos de escalamiento

---

## UC-05: Transición PoC a Producción

### Escenario

El PoC alcanzó Gate 2 y necesita transicionar a producción. Se requiere un plan detallado de hardening, deployment, y soporte.

### Prompt

```
Genera el plan de transición a producción para {PROYECTO} tras aprobar Gate 2.

Estado actual:
- Ambiente: {AMBIENTE_ACTUAL}
- Coverage de tests: {COVERAGE}
- Performance baseline: {PERFORMANCE}
- Security assessment: {SECURITY_STATUS}
- Documentation: {DOC_STATUS}

Requisitos de producción:
- SLA objetivo: {SLA}
- Usuarios esperados: {USUARIOS}
- Ventana de deployment: {VENTANA}
- Rollback plan requerido: {ROLLBACK}

Genera:
1. Hardening checklist con owner y deadline
2. Deployment runbook paso a paso
3. Support team training plan
4. Monitoring y alerting setup
5. Post-launch validation criteria (primeras 48h)
```

### Variables

| Variable | Ejemplo |
|---|---|
| `{PROYECTO}` | "API de Pagos - Fintech ABC" |
| `{AMBIENTE_ACTUAL}` | "Staging con datos sintéticos" |
| `{COVERAGE}` | "78% unit, 45% integration" |
| `{PERFORMANCE}` | "P95 latency 320ms, throughput 1200 rps" |
| `{SECURITY_STATUS}` | "SAST clean, DAST pendiente, pen test scheduled" |
| `{SLA}` | "99.95% uptime, P95 <500ms" |
| `{USUARIOS}` | "500 concurrent, 50K daily" |
| `{VENTANA}` | "Viernes 22:00-02:00" |
| `{ROLLBACK}` | "Sí, blue-green deployment" |

### Criterios de Calidad

- [ ] Hardening checklist cubre security, performance, observability, docs
- [ ] Runbook es ejecutable paso a paso sin ambigüedad
- [ ] Training plan tiene duración, temario y evaluation
- [ ] Monitoring cubre métricas de negocio, no solo infra
- [ ] Criterios de validación post-launch son medibles

---

## UC-06: Planificación de Sprint con Capacity Detallada

### Escenario

El Tech Lead necesita un sprint breakdown detallado con capacity calculation, task allocation por día, y dependency mapping.

### Prompt

```
Genera el sprint plan detallado para Sprint {N} del proyecto {PROYECTO}.

Equipo disponible:
{EQUIPO_DETALLE}

Backlog priorizado para este sprint:
{BACKLOG}

Constraints:
- {CONSTRAINT_1}
- {CONSTRAINT_2}
- {CONSTRAINT_3}

Genera sprint plan con:
1. Capacity calculation (horas disponibles vs comprometidas)
2. Daily task allocation con owner específico
3. Dependency map (qué bloquea qué)
4. Deliverables con acceptance criteria testeable
5. Risk buffer allocation

{MODO_OPERACIONAL}=planificacion-sprints
```

### Criterios de Calidad

- [ ] Capacity calculation explícita con focus factor
- [ ] No hay tareas huérfanas (sin owner ni deadline)
- [ ] Dependencies identificadas con critical path marcado
- [ ] Cada deliverable tiene done criteria verificable
- [ ] Buffer de riesgo es explícito, no oculto en estimaciones

---

## UC-07: Roadmap para Equipo Distribuido Multi-Timezone

### Escenario

El equipo está distribuido en múltiples zonas horarias (>4h de diferencia). El roadmap debe adaptar ceremonias, collaboration windows, y communication overhead.

### Prompt

```
Adapta el roadmap de {PROYECTO} para equipo distribuido.

Distribución del equipo:
- {UBICACIÓN_1}: {N} personas, timezone {TZ_1}
- {UBICACIÓN_2}: {M} personas, timezone {TZ_2}
- {UBICACIÓN_3}: {K} personas, timezone {TZ_3}

Overlap de trabajo: {HORAS_OVERLAP}h diarias
Herramientas de colaboración: {HERRAMIENTAS}

Ajusta:
1. Ceremonias de sprint (horarios UTC, duración, formato)
2. Communication overhead (+15% mínimo)
3. Async collaboration protocols
4. Daily handoff procedures
5. Sprint review formato híbrido
```

### Criterios de Calidad

- [ ] Ceremonias en horario UTC que funcione para todos
- [ ] Communication overhead cuantificado y reflejado en capacity
- [ ] Protocolos async definidos (herramienta, SLA de respuesta, formato)
- [ ] Handoff procedure entre zonas horarias documentado
- [ ] No asume disponibilidad 24h — respeta work-life balance
