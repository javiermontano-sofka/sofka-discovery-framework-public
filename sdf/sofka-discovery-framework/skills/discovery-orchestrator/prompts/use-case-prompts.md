---
skill: metodologia-discovery-orchestrator
type: use-case-prompts
version: 1.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Prompts de Caso de Uso — Discovery Orchestrator

Prompts listos para usar que activan el discovery orchestrator en escenarios específicos. Cada prompt incluye contexto de cuándo usarlo, el texto completo del prompt, y el formato de output esperado.

---

## Prompt 1: Inicio de Discovery Completo

**Nombre:** Arranque de Pipeline Completo

**Cuándo usar:** Al iniciar un engagement de discovery con un cliente nuevo. Tienes acceso al repositorio y un contexto básico del sistema.

**Prompt:**
```
/mao:discovery

Proyecto: [NOMBRE_CLIENTE] — [NOMBRE_SISTEMA]
Industria: [SECTOR]
Codebase: [RUTA_O_URL]
Stakeholders disponibles: [SÍ/NO/LIMITADOS]
Presupuesto de tiempo: [SEMANAS]
Objetivo: Discovery completo para propuesta de transformación tecnológica.

Modo: piloto-auto
Formato: markdown
Variante: técnica
```

**Output esperado:** `00_Discovery_Plan.md` con comité declarado, cronograma completo de fases, registro de inputs, pipeline status inicial, y activación del SME para el sector.

---

## Prompt 2: Quick Reference — Decisión Go/No-Go

**Nombre:** Evaluación Rápida para Decisión de Inversión

**Cuándo usar:** El cliente necesita una decisión go/no-go en menos de 2 semanas. No hay tiempo para pipeline completo. El objetivo es solo validar si el sistema es viable para transformación.

**Prompt:**
```
/mao:express

Proyecto: [NOMBRE_CLIENTE] — [NOMBRE_SISTEMA]
Industria: [SECTOR]
Codebase: [RUTA]
Pregunta clave: ¿Es viable modernizar este sistema en [PLAZO]?

El cliente necesita una decisión de inversión en 5 días hábiles.
Formato: markdown
Modo: desatendido
```

**Output esperado:** 3 entregables: Brief Técnico (AS-IS express), Escenarios simplificados con scoring, y Executive Pitch con recomendación go/no-go fundamentada. Sin gates formales pero con supuestos explícitamente documentados.

---

## Prompt 3: Rescate de Discovery Estancado

**Nombre:** Retomar Discovery en Estado Crítico

**Cuándo usar:** Un discovery comenzado previamente quedó incompleto o con entregables desactualizados. Necesitas evaluar el estado actual y completar lo faltante.

**Prompt:**
```
/mao:rescue

Proyecto: [NOMBRE_CLIENTE] — [NOMBRE_SISTEMA]
Estado actual: El discovery llegó hasta [FASE] pero quedó paralizado hace [TIEMPO].
Entregables existentes: [LISTAR ARCHIVOS DISPONIBLES]
Razón de la parálisis: [DESCRIBIR]
Objetivo: Completar el discovery para generar propuesta comercial en [PLAZO].

Formato: markdown
Modo: supervisado
```

**Output esperado:** Diagnóstico de estado (qué está completo, qué falta, qué está desactualizado), plan de rescate con fases a ejecutar, identificación de datos que deben re-relevarse, y ejecución del plan de completitud.

---

## Prompt 4: Orchestration con Equipo Extendido

**Nombre:** Discovery con Especialistas Adicionales de Dominio

**Cuándo usar:** El sistema tiene componentes complejos de IA/ML, mobile nativo, o infraestructura cloud que requieren expertos adicionales al panel base de 7.

**Prompt:**
```
/mao:discovery

Proyecto: [NOMBRE_CLIENTE] — [NOMBRE_SISTEMA]
Industria: [SECTOR]
Codebase: [RUTA]

Componentes especiales detectados:
- [ ] Modelos ML/IA en producción → activar ai-architect
- [ ] App mobile (iOS/Android) → activar mobile-architect
- [ ] Infraestructura cloud compleja (AWS/GCP/Azure) → activar cloud-architect
- [ ] Pipeline de datos (Spark/Kafka) → activar analytics-architect

Activar expertos adicionales para las fases correspondientes.
Modo: piloto-auto
Formato: dual
```

**Output esperado:** Plan de discovery con comité extendido declarado, matrix de activación de expertos adicionales por fase, y ejecución con perspectivas especializadas integradas en cada análisis.

---

## Prompt 5: Pipeline Minimal para Dirección Arquitectónica

**Nombre:** Discovery Enfocado en Arquitectura Técnica

**Cuándo usar:** El cliente ya tiene claridad sobre el negocio pero necesita definir la dirección técnica. No hay necesidad de Phase 0 (stakeholders) ni Phase 2 detallada (flujos).

**Prompt:**
```
/mao:intermediate

Proyecto: [NOMBRE_CLIENTE] — [NOMBRE_SISTEMA]
Industria: [SECTOR]
Codebase: [RUTA]

Contexto: El cliente conoce bien su negocio. Necesita:
1. Diagnóstico técnico exhaustivo del estado actual
2. Evaluación de escenarios de modernización
3. Roadmap técnico con estimaciones de esfuerzo
4. Business case para el sponsor

No ejecutar Phase 0 (stakeholders ya mapeados) ni Phase 2 detallada.
Iniciar en Phase 1.
Modo: piloto-auto
Formato: html
Variante: técnica
```

**Output esperado:** 7 entregables del pipeline minimal (02-08) con gates G1 y G2. HTML branded para presentación ejecutiva.

---

## Prompt 6: Status Check y Replanificación

**Nombre:** Revisión de Estado y Actualización del Plan

**Cuándo usar:** El engagement lleva en ejecución más de una semana y necesitas una foto del estado actual, identificar desviaciones del plan, y replanificar si hay cambios.

**Prompt:**
```
/mao:discovery-review

Proyecto: [NOMBRE_CLIENTE] — [NOMBRE_SISTEMA]
Estado del pipeline: Completadas [FASES]. En progreso: [FASE ACTUAL].
Entregables a revisar: [ARCHIVOS]
Cambios desde el último check: [DESCRIBIR CAMBIOS DE ALCANCE/EQUIPO/TIMELINE]

Ejecutar:
1. Auditoría de entregables completados contra acceptance criteria
2. Verificación de contratos de datos inter-fase
3. Actualización del Risk Register con nuevos hallazgos
4. Replanificación del timeline si hay desviaciones

Formato: markdown
Modo: supervisado
```

**Output esperado:** Scorecard de auditoría con pass/fail por criterio, estado actualizado de contratos de datos, Risk Register actualizado, y plan revisado con nuevo timeline si corresponde.

---

## Prompt 7: Handover Post-Gate 3

**Nombre:** Cierre Formal del Engagement y Transición

**Cuándo usar:** Gate 3 fue aprobado. La propuesta está lista. Es momento de transferir el paquete completo a los equipos de operaciones y comercial.

**Prompt:**
```
/mao:handover

Proyecto: [NOMBRE_CLIENTE] — [NOMBRE_SISTEMA]
Gate 3 aprobado: SÍ
Receptor del handover: [operaciones / comercial / ambos]
Deliverables completados: [LISTAR ARCHIVOS 01-08]
Fecha objetivo de kickoff: [FECHA]

Generar paquete completo de transición con:
- Resumen ejecutivo de transición
- Paquete de activación comercial
- Checklist de readiness operacional
- Plan de kickoff — primeros 90 días
- Protocolo de transición de gobernanza
- Tracker de supuestos y riesgos
- Matriz de transición de stakeholders

Formato: html
```

**Output esperado:** `09_Handover_Operaciones.html` con 8 secciones completas, plan de 90 días en Gantt, matriz de transición de roles, y checklist de activación comercial.

---

## Prompt 8: Activación de SME para Industria Específica

**Nombre:** Enriquecer Discovery con Inteligencia Sectorial

**Cuándo usar:** El engagement requiere análisis profundo de la industria del cliente. Necesitas benchmarks, regulaciones específicas, y landscape competitivo antes de que los análisis de fases posteriores.

**Prompt:**
```
/mao:asis

Proyecto: [NOMBRE_CLIENTE] — [NOMBRE_SISTEMA]
Industria: [SECTOR — ej: banca retail, salud pública, retail omnicanal]
Subsector: [SUBSECTOR ESPECÍFICO]

Antes de ejecutar el análisis AS-IS, activar el Domain Analyst (SME) con el lens de [INDUSTRIA]:
1. Regulatory landscape relevante para [PAÍS/REGIÓN]
2. Benchmarks tecnológicos del sector (top 3 players)
3. Tendencias de modernización en la industria (2024-2026)
4. Anti-patrones tecnológicos conocidos en [SECTOR]

Integrar la inteligencia sectorial como overlay en todas las secciones del AS-IS.
Formato: markdown
Variante: técnica
```

**Output esperado:** AS-IS con perspectiva sectorial integrada — cada hallazgo técnico benchmarkeado contra el sector, riesgos regulatorios identificados, y recomendaciones alineadas a mejores prácticas de la industria.

---

## Prompt 9: Manejo de Scopecreep durante el Pipeline

**Nombre:** Evaluar Impacto de Cambio de Alcance

**Cuándo usar:** Durante el engagement, aparece nuevo contexto (un sistema adicional, un requerimiento no declarado, un cambio organizacional) que amenaza el alcance del discovery.

**Prompt:**
```
/mao:discovery

Proyecto: [NOMBRE_CLIENTE] — [NOMBRE_SISTEMA]
ALERTA DE CAMBIO DE ALCANCE:

Descripción del cambio: [DESCRIBIR]
Fase actual: [FASE EN PROGRESO]
Fases impactadas downstream: [LISTAR]

Ejecutar:
1. Impacto en el contrato de datos de la fase actual
2. Fases downstream afectadas y cómo
3. Estimación de días adicionales (si aplica)
4. Opciones: (a) absorber cambio, (b) deferirlo a Fase 6 handover, (c) crear sub-discovery separado
5. Recomendación del Conductor con rationale

Modo: piloto-auto — pausar para aprobación de usuario en el punto 5.
Formato: markdown
```

**Output esperado:** Análisis de impacto estructurado, tres opciones de respuesta con trade-offs, y recomendación del conductor con justificación. El usuario aprueba la opción antes de continuar.

---

## Prompt 10: Evolución de Entregable Específico

**Nombre:** Mejorar un Deliverable Post-Feedback del Cliente

**Cuándo usar:** Un deliverable fue entregado pero el cliente o stakeholder interno dio feedback específico que requiere revisión.

**Prompt:**
```
/mao:discovery-improve

Proyecto: [NOMBRE_CLIENTE] — [NOMBRE_SISTEMA]
Entregable a mejorar: [NOMBRE_ARCHIVO]
Fase origen: [FASE]

Feedback recibido:
- [FEEDBACK 1]
- [FEEDBACK 2]
- [FEEDBACK 3]

Ejecutar:
1. Diagnóstico: ¿el feedback apunta a un gap de contenido, estructura, o argumentación?
2. Identificar qué sections/criterios del skill origen no se cumplieron
3. Propuesta de mejoras específicas (no reescribir todo)
4. Ejecutar mejoras
5. Validar delta: el entregable mejorado vs el original en los puntos de feedback

Formato: [MISMO QUE EL ORIGINAL]
Modo: supervisado
```

**Output esperado:** Diagnóstico del gap, listado de mejoras específicas, entregable mejorado, y tabla de delta mostrando qué cambió y por qué atiende el feedback.

---
**Autor:** Javier Montaño | **© Comunidad MetodologIA** | **Actualización:** 13 de marzo de 2026
