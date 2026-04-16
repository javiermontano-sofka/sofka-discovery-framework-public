---
skill: metodologia-architecture-tobe
title: "Use-Case Prompts — Arquitectura TO-BE"
author: Javier Montaño
copyright: "© Comunidad MetodologIA"
updated: 2026-03-13
---

# Use-Case Prompts: TO-BE Architecture

> Ready-to-use prompts that activate the `metodologia-architecture-tobe` skill in the most frequent target architecture design scenarios.

---

## Prompt 1: Complete TO-BE Architecture Design (Technical, Pilot-Auto)

**Name:** Complete TO-BE Architecture

**Context:** The client already has an approved scenario (Conservative/Moderate/Aggressive) and needs the complete architectural design with ADRs, nightmare scenarios, and migration plan.

**Prompt:**
```
/mao:architecture-tobe {SISTEMA}

Escenario aprobado: Moderado
El sistema es {DESCRIPCIÓN_SISTEMA}. El equipo tiene experiencia intermedia en microservicios (2-3 proyectos previos).
Presupuesto dentro de rango normal. Se requiere Strangler Fig con velocidad del 40-60% en 12 meses.
Genera la arquitectura técnica completa: C4 L2, trade-off matrix, 6+ ADRs, 5+ nightmare scenarios, MVP component, y plan de migración en 4 fases.
```

**Expected output:** Document `04_Arquitectura_TO-BE_Deep.md` with all architectural components.

---

## Prompt 2: Executive TO-BE Architecture (For C-Level Presentation)

**Name:** Executive TO-BE

**Context:** The client needs a condensed version of the architectural design for presenting to the executive committee without deep technical details.

**Prompt:**
```
/mao:architecture-tobe {SISTEMA} {VARIANTE}=ejecutiva {FORMATO}=html

Genera la versión ejecutiva de la arquitectura TO-BE para {SISTEMA}.
Enfócate en: (1) el diagrama C4 L2 con las capas principales, (2) los trade-offs clave de las 3 decisiones más importantes, y (3) el plan de migración en fases con timeline por fase.
Audiencia: CTO y CFO. Evita siglas técnicas sin explicación. Máximo 4 páginas.
```

**Expected output:** HTML document `04_Arquitectura_TO-BE_Ejecutiva.html` with diagram, trade-offs, and phases.

---

## Prompt 3: ADRs Only for Specific Decision

**Name:** Specific ADR

**Context:** The team already has the architecture and needs to document a specific architectural decision that wasn't covered in the initial design.

**Prompt:**
```
/mao:architecture-tobe {SISTEMA}

Necesito un ADR específico para la siguiente decisión: {DESCRIPCIÓN_DECISIÓN}.
Alternativas que se evaluaron: {OPCIÓN_A} vs {OPCIÓN_B} vs {OPCIÓN_C}.
Contexto: {RESTRICCIONES_Y_CONTEXTO}.
Genera el ADR con el formato estándar MetodologIA: Contexto, Decisión, Alternativas con pros/cons, Trade-off, y Consecuencias.
```

**Expected output:** A complete ADR in Markdown format, numbered and ready to add to the decision repository.

---

## Prompt 4: Nightmare Scenario Analysis for Banking System

**Name:** Financial Nightmare Scenarios

**Context:** The system processes financial transactions and the client needs the most critical failure risk analyses to present to the compliance team.

**Prompt:**
```
/mao:architecture-tobe {SISTEMA_BANCARIO}

El sistema es un core bancario con {DESCRIPCIÓN_CAPACIDADES}. Procesa {VOLUMEN} transacciones/día con requisito regulatorio de auditoría inmutable.
Genera únicamente los 5 nightmare scenarios más críticos para este contexto:
- Ghost Transaction (pago confirma en un servicio, falla en otro)
- Schema Drift (cambio de schema del legado sin notificación)
- Auth Service Unavailable (OAuth2 caído, todas las peticiones rechazadas)
- Cascade Failure (un servicio cae y arrastra otros)
- Legacy System Corruption (ACL buggy envía datos malformados al legado)
Para cada uno: problema, triggers, mitigaciones en profundidad defensiva, alertas de monitoreo con umbrales específicos, y criterios de aceptación Go/No-Go.
```

**Expected output:** Nightmare Scenarios section with 5 detailed analyses including alerts and acceptance criteria.

---

## Prompt 5: MVP Component Design — First Deployable Service

**Name:** MVP Component

**Context:** The architect needs to design in detail the first component to be deployed in production to validate the architecture.

**Prompt:**
```
/mao:architecture-tobe {SISTEMA}

Diseña el MVP Component para este sistema. El primer servicio desplegable debe ser el {SERVICIO_MVP} (ejemplo: Auth Service).
Incluye: (1) diagrama de arquitectura del MVP (Client → Gateway → {Servicio} → Legacy IdP), (2) contratos API en formato OpenAPI para las operaciones principales, (3) modelo de datos PostgreSQL, (4) patrones de resiliencia aplicados (idempotency, circuit breaker, saga, caching), y (5) criterios de validación del MVP antes de escalar la arquitectura.
El MVP debe probar la arquitectura bajo carga de {CARGA_ESPERADA} usuarios concurrentes.
```

**Expected output:** MVP Component section with diagram, API contracts, data model, and validation criteria.

---

## Prompt 6: Detailed Strangler Fig Migration Plan

**Name:** Strangler Fig Migration Plan

**Context:** The client needs the gradual legacy migration plan with velocities, per-phase risks, and success criteria, to present to the operations team.

**Prompt:**
```
/mao:architecture-tobe {SISTEMA}

Genera el plan de migración Strangler Fig detallado para {SISTEMA}.
El legado actual es {DESCRIPCIÓN_LEGADO}. Los sistemas a reemplazar son: {LISTA_SISTEMAS}.
Velocidad de migración objetivo: {PORCENTAJE}% en {MESES} meses.
Para cada fase (Assessment & Wrapping / Modern Service Introduction / Capability Migration / Legacy Sunset), incluye: duración, entregables, dependencias, riesgos principales con mitigaciones, y criterios de éxito medibles.
También genera la tabla de riesgos por fase con el riesgo, la mitigación y el responsable.
```

**Expected output:** 4-phase migration plan with risk table and success criteria per phase.

---

## Prompt 7: Architectural Review of Existing TO-BE

**Name:** Architecture Review

**Context:** The team has a draft TO-BE design and needs it validated against the Validation Gate criteria of the skill.

**Prompt:**
```
/mao:architecture-tobe {SISTEMA}

Tengo un diseño TO-BE existente que necesita revisión. El documento está en: {RUTA_DOCUMENTO}.
Evalúa el diseño contra los criterios del Validation Gate:
- Funcional: ¿Los SLAs de performance están definidos y son alcanzables?
- Resiliencia: ¿Los circuit breakers y bulkheads están diseñados?
- Seguridad: ¿mTLS y Zero Trust están implementados end-to-end?
- Operacional: ¿GitOps y observabilidad están cubiertos?
Identifica las brechas críticas (Rejection Criteria) y genera recomendaciones priorizadas para cerrarlas.
```

**Expected output:** Validation Gate scorecard with status of each criterion, identified gaps, and remediation plan.

---

## Prompt 8: TO-BE for Conservative Scenario with Team Lacking Microservices Experience

**Name:** Conservative TO-BE

**Context:** The client has a team that has never worked with microservices and needs a conservative architecture that reduces adoption risk.

**Prompt:**
```
/mao:architecture-tobe {SISTEMA}

Escenario aprobado: Conservador.
El equipo de desarrollo ({TAMAÑO} personas) no tiene experiencia previa en microservicios ni en Kubernetes.
El presupuesto es limitado. El timeline es de 18 meses máximo.
Genera una arquitectura TO-BE conservadora:
- Monolito modular con boundaries DDD bien definidos (no microservicios desde el día 1)
- 2-3 servicios máximo extraídos del monolito en el primer año
- Strangler Fig a velocidad del 10-20%
- ADRs que justifiquen la decisión de monolito modular sobre microservicios
- Plan de entrenamiento del equipo integrado a las fases de migración
Incluye el riesgo de escalación prematura a microservicios con criterios para saber cuándo hacer el salto.
```

**Expected output:** Conservative TO-BE architecture with ADR justification, training plan, and escalation criteria.

---

## Prompt 9: RACI Matrix and Architectural Project Governance

**Name:** RACI and Governance

**Context:** The client needs to define who is responsible for what in the architecture execution, to resolve ambiguities in the delivery contract.

**Prompt:**
```
/mao:architecture-tobe {SISTEMA}

Genera el RACI Matrix y la estructura de gobernanza para la ejecución de la arquitectura TO-BE de {SISTEMA}.
Los roles del cliente son: {ROLES_CLIENTE}. Los roles del equipo de delivery son: {ROLES_DELIVERY}.
Incluye RACI para: diseño y ADRs, documentación del legado, desarrollo de microservicios, testing y QA, despliegue e infraestructura, revisión de seguridad, planificación y ejecución de migración, entrenamiento y transferencia de conocimiento, soporte a producción (primeros 6 meses).
También define: proceso de escalación, frecuencia de architecture review, y criterios para invocar el Rejection Criteria Gate.
```

**Expected output:** Complete RACI Matrix with governance notes and escalation process.

---

*© Comunidad MetodologIA — Autor: Javier Montaño — Actualizado: 13 de marzo de 2026*
