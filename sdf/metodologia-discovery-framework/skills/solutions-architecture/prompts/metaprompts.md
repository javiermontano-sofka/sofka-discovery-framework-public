---
skill: solutions-architecture
title: Metaprompts — Solutions Architecture
version: 1.0.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
---

# Metaprompts: Solutions Architecture

Meta-prompts for generating customized prompts for the `solutions-architecture` skill. Each metaprompt has a specific purpose, a template with placeholders, and a usage guide.

---

## Metaprompt 1: Prompt Generator for End-to-End Solution Design

**Purpose:** Generate a complete prompt for designing the end-to-end solution architecture, calibrated to the solution type, integration complexity, and security requirements.

**Template:**

```
Genera un prompt para el skill solutions-architecture que produzca el diseno de solucion end-to-end para:

SOLUCION: {{NOMBRE_SOLUCION}}

TIPO DE SOLUCION: {{TIPO}}
Opciones: greenfield-producto-nuevo | brownfield-modernizacion | integracion-sistemas | migracion-plataforma | extension-de-plataforma-existente

COMPLEJIDAD DE INTEGRACION: {{COMPLEJIDAD}}
Opciones: baja (2-3 sistemas, APIs REST) | media (5-8 sistemas, mix sync/async) | alta (>8 sistemas, legacy, mainframe, event-driven) | critica (multi-vendor, multi-cloud, regulaciones cruzadas)

CANALES: {{CANALES}}
Seleccionar: web | mobile | api-publica | api-b2b | omnichannel | legacy-channels
Para cada canal: volumen estimado de usuarios y tipo de interaccion

REQUISITOS DE SEGURIDAD: {{SEGURIDAD}}
Opciones: estandar (AuthN/AuthZ basico, TLS) | elevado (MFA, RBAC granular, audit trail) | critico (Zero Trust, compliance regulatorio, threat modeling, PII protection)

QUALITY ATTRIBUTES PRIORITARIOS: {{QA_PRIORIDAD}}
Ordenar por prioridad (el orden importa):
- Performance (latencia, throughput)
- Availability (uptime, recovery)
- Security (proteccion, compliance)
- Scalability (crecimiento, picos)
- Modifiability (evolucion, extensibilidad)

SECCIONES REQUERIDAS: {{SECCIONES}}
Seleccionar: solution-view | integration | channels-bff | identity-security | observability | cross-cutting | transition | todas

El prompt generado debe incluir: contexto de la solucion, criterios de validacion por seccion, trade-offs explicitos a documentar, y formato de output adaptado al tipo de solucion.
```

**Usage guide:**
1. `TIPO_SOLUCION` calibrates the emphasis: `greenfield-producto-nuevo` generates a prompt focused on foundational architecture decisions; `integracion-sistemas` focuses on integration patterns and data consistency
2. `COMPLEJIDAD_INTEGRACION = critica` generates a prompt that includes risk analysis per integration point, fallback strategies, and mandatory circuit breaker design
3. The order of `QA_PRIORIDAD` determines how trade-off conflicts are resolved: if Performance is first over Security, the prompt allows latency optimizations that increase attack surface (with explicit trade-off documentation)
4. `SECCIONES = todas` generates all 7 complete sections; for quick evaluations, selecting only `solution-view + integration + identity-security` produces a focused deliverable with 60% less effort

---

## Metaprompt 2: Prompt Generator for Integration Architecture

**Purpose:** Generate a specialized prompt for designing the integration architecture between multiple systems, calibrated to the integration type, available patterns, and legacy system constraints.

**Template:**

```
Genera un prompt para el skill solutions-architecture enfocado en integration architecture para:

SOLUCION: {{NOMBRE_SOLUCION}}

PATRON DE INTEGRACION DOMINANTE: {{PATRON}}
Opciones: api-gateway-centralizado | event-driven-distributed | hibrido-sync-async | point-to-point-legacy | esb-middleware | desconocido-recomendar

NUMERO DE SISTEMAS A INTEGRAR: {{N_SISTEMAS}}
Para calibrar la complejidad del diagrama y la gestion de contratos

SISTEMAS LEGACY INVOLUCRADOS: {{LEGACY}}
Por cada uno:
- Nombre: {{NOMBRE}}
- Tecnologia: {{TECH}} (mainframe COBOL, monolito Java, ERP SAP, etc.)
- Protocolo expuesto: {{PROTOCOLO}} (SOAP, file transfer, DB link, batch, REST, ninguno)
- Capacidad de modificacion: {{MODIFICABLE}} (nula / interfaz-solo / moderada / completa)

CONSISTENCIA DE DATOS REQUERIDA: {{CONSISTENCIA}}
Opciones: strong-consistency (transaccional) | eventual-consistency (aceptable con SLA) | mixed (strong para criticos, eventual para otros)

VOLUMENES: {{VOLUMENES}}
- Transacciones por segundo en pico: {{TPS}}
- Latencia maxima aceptable end-to-end: {{LATENCIA_MS}}ms
- Volumen de datos diario en movimiento: {{VOLUMEN_DATOS}}

CONTRATOS API: {{CONTRATOS}}
Opciones: openapi-spec (REST, documentados) | protobuf (gRPC, tipados) | schema-registry (eventos, Avro/Protobuf) | sin-contratos-formales | mixto

El prompt generado debe incluir: diagrama de integracion con protocolos y patrones por conexion, estrategia de versionado de contratos, mecanismo de monitoring de health de cada punto de integracion, y plan de fallback cuando un sistema legacy no responde.
```

**Usage guide:**
1. `PATRON = desconocido-recomendar` generates a prompt where the skill evaluates systems, volumes, and constraints before proposing the most appropriate integration pattern
2. `LEGACY` with `capacidad_modificacion = nula` forces the use of Anti-Corruption Layer and adapters; the generated prompt explicitly states that the legacy system is treated as a black box
3. `CONSISTENCIA = mixed` is the most common and complex case: the generated prompt will include a table of "which data requires strong consistency and why" to avoid over-engineering distributed transactions
4. `CONTRATOS = sin-contratos-formales` generates a prompt that starts with contract discovery: the skill analyzes existing interfaces and proposes formal contracts as the first step before designing the integration

---

## Metaprompt 3: Prompt Generator for Security Architecture and Compliance

**Purpose:** Generate a prompt for designing the security architecture of any solution, calibrated to the regulation level, data type, and threat model.

**Template:**

```
Genera un prompt para el skill solutions-architecture enfocado en identity, security, y compliance para:

SOLUCION: {{NOMBRE_SOLUCION}}

REGULACIONES APLICABLES: {{REGULACIONES}}
Seleccionar todas las aplicables:
- [ ] GDPR (datos personales de ciudadanos EU)
- [ ] PCI-DSS (datos de tarjetas de pago)
- [ ] HIPAA (datos de salud)
- [ ] SOX (controles financieros)
- [ ] ISO 27001 (seguridad de la informacion)
- [ ] SOC 2 (controles de servicio)
- [ ] Regulacion local: {{NOMBRE_REGULACION}}
- [ ] Ninguna especifica (best practices generales)

TIPOS DE DATOS SENSIBLES: {{DATOS}}
Seleccionar:
- [ ] PII (nombres, emails, direcciones, telefonos)
- [ ] Datos financieros (cuentas, transacciones, balances)
- [ ] Datos de salud (diagnosticos, tratamientos, historias clinicas)
- [ ] Credenciales y secretos (passwords, API keys, tokens)
- [ ] Datos de menores de edad
- [ ] Datos biometricos

TIPOS DE USUARIO: {{USUARIOS}}
Opciones: solo-internos | solo-externos | internos-y-externos | b2b-partners | todos-los-anteriores

IDENTITY PROVIDER EXISTENTE: {{IDP}}
Opciones: okta | auth0 | azure-ad | keycloak | cognito | custom | ninguno-disenar

MODELO DE AUTORIZACION PREFERIDO: {{AUTHZ}}
Opciones: rbac (roles simples) | abac (atributos contextuales) | policy-as-code (OPA/Cedar) | hibrido | desconocido-recomendar

NIVEL DE THREAT MODELING: {{THREAT}}
Opciones: basico (top-5 amenazas) | completo (STRIDE por componente) | critico (STRIDE + attack trees + pen-test plan)

El prompt generado debe incluir: modelo de autenticacion por tipo de usuario, modelo de autorizacion con ejemplos del dominio, proteccion de datos por clasificacion, threat model con controles, y checklist de compliance por regulacion.
```

**Usage guide:**
1. `REGULACIONES` determines mandatory controls: PCI-DSS requires PAN tokenization and network segmentation; GDPR requires consent management and right to deletion. The generated prompt includes regulation-specific controls, not generic ones
2. `IDP = ninguno-disenar` generates a prompt that includes identity provider selection as an architectural decision, with build vs. buy evaluation
3. `AUTHZ = desconocido-recomendar` generates a prompt where the skill evaluates domain permission complexity: if there are <10 roles with fixed permissions, RBAC is sufficient; if there are context-dependent permissions (time, location, resource owner), ABAC is necessary
4. For `THREAT = critico`, the prompt includes attack trees for the 3 highest-impact scenarios and a pen-test plan as security architecture validation

---

## Metaprompt 4: Prompt Generator for Transition Plan and Migration

**Purpose:** Generate a prompt for designing the transition plan from current to target state, calibrated to migration risk, service availability, and team capacity.

**Template:**

```
Genera un prompt para el skill solutions-architecture enfocado en transition plan para:

SOLUCION: {{NOMBRE_SOLUCION}}

TIPO DE TRANSICION: {{TIPO}}
Opciones:
- greenfield-rollout (sistema nuevo, sin migracion de datos)
- strangler-fig (reemplazo gradual de legacy)
- parallel-running (ambos sistemas operando, migracion gradual)
- big-bang-cutover (cambio total en fecha especifica)
- data-migration-only (misma aplicacion, nueva base de datos/infraestructura)

RIESGO DE LA TRANSICION: {{RIESGO}}
Opciones: bajo (sistema no-critico, rollback facil) | medio (sistema importante, downtime aceptable con aviso) | alto (sistema critico, cero downtime, datos financieros/salud) | critico (regulado, auditado, disponibilidad 24/7)

DATOS A MIGRAR: {{DATOS_MIGRACION}}
- Volumen: {{VOLUMEN_DATOS}}
- Complejidad de schema: {{SIMPLE / MEDIA / COMPLEJA_CON_TRANSFORMACION}}
- Ventana de migracion disponible: {{HORAS_VENTANA}}
- Dual-write requerido: {{SI / NO}}

DISPONIBILIDAD REQUERIDA DURANTE TRANSICION: {{DISPONIBILIDAD}}
Opciones: downtime-aceptable (ventana programada) | near-zero-downtime (segundos) | zero-downtime-absoluto

EQUIPO DISPONIBLE: {{EQUIPO}}
- Ingenieros: {{N_INGENIEROS}}
- Experiencia con migraciones: {{BAJA / MEDIA / ALTA}}
- Equipo de QA dedicado: {{SI / NO}}

TIMELINE: {{TIMELINE}}
Opciones: urgente (<1 mes) | normal (1-3 meses) | extendido (3-6 meses) | flexible

El prompt generado debe incluir: plan por fases con go/no-go criteria, estrategia de rollback por fase, plan de verificacion de datos (checksums, counts, sampling), comunicacion a stakeholders, y runbooks operacionales.
```

**Usage guide:**
1. `TIPO = strangler-fig` is the safest option for most migrations: the generated prompt includes the definition of "seams" where to cut, the migration order (least critical features first), and criteria for declaring the legacy retired
2. `RIESGO = critico` generates a prompt with rehearsal requirements (migration rehearsal in pre-production environment), regulator communication plan if applicable, and two rollback levels (fast and complete)
3. `DISPONIBILIDAD = zero-downtime-absoluto` forces specific patterns: blue-green deployment, database migration without lock (Flyway/Liquibase with backward-compatible changes), and feature flags for the cutover
4. `TIMELINE = urgente` generates explicit risk alerts and recommends reducing migration scope to the minimum viable, with a plan to complete in later phases

---

## Metaprompt 5: Prompt Generator for Existing Solution Evaluation

**Purpose:** Generate a prompt for evaluating an already-implemented solution against solutions architecture best practices, identifying weaknesses and improvement opportunities.

**Template:**

```
Genera un prompt para el skill solutions-architecture que evalúe una solucion existente:

SOLUCION: {{NOMBRE_SOLUCION}}

MOTIVACION DE LA EVALUACION: {{MOTIVACION}}
Opciones:
- pre-escalamiento (la solucion funciona pero necesita escalar 10x)
- post-incidente (hubo un incidente y se necesita evaluar la arquitectura)
- audit-de-seguridad (evaluar postura de seguridad antes de certificacion)
- preparacion-para-regulacion (nueva regulacion requiere compliance)
- deuda-acumulada (la solucion se volvio fragil y lenta de evolucionar)
- due-diligence (evaluacion para inversion o adquisicion)

AREAS A EVALUAR: {{AREAS}}
Seleccionar:
- [ ] Integration architecture (patrones, contratos, consistencia)
- [ ] Security posture (AuthN, AuthZ, proteccion de datos, compliance)
- [ ] Observability maturity (logging, metrics, tracing, alerting)
- [ ] Resiliencia (circuit breakers, retry, timeouts, fallbacks)
- [ ] Channel architecture (BFF, mobile, offline, omnichannel)
- [ ] Data flow (consistencia, latencia, gobernanza)
- [ ] Operability (deployment, rollback, on-call, runbooks)
- [ ] Todas

EVIDENCIA DISPONIBLE: {{EVIDENCIA}}
Opciones:
- acceso-a-codebase (puede inspeccionar codigo y configuracion)
- documentacion-existente (diagramas, ADRs, specs)
- metricas-de-produccion (dashboards, SLIs, incidentes historicos)
- entrevistas-equipo (acceso a arquitectos y desarrolladores)
- todo-lo-anterior
- solo-documentacion (sin acceso a codigo ni metricas)

FORMATO DE EVALUACION: {{FORMATO_EVAL}}
Opciones: scorecard (evaluacion por area con semaforo) | gap-analysis (estado actual vs. best practice) | recomendaciones-priorizadas (top-10 mejoras con esfuerzo) | informe-completo (scorecard + gap + recomendaciones + roadmap)

El prompt generado debe incluir: criterios de evaluacion objetivos por area, mecanismo de scoring consistente, recomendaciones accionables con esfuerzo estimado, y priorizacion por impacto/esfuerzo.
```

**Usage guide:**
1. `MOTIVACION` calibrates the evaluation emphasis: `post-incidente` generates a prompt that starts by analyzing the incident and then evaluates the architecture areas that failed; `pre-escalamiento` focuses on bottlenecks and scale limits
2. `EVIDENCIA = solo-documentacion` generates a prompt that explicitly states the evaluation has limitations and marks conclusions as "inference" vs. "direct evidence"
3. `FORMATO = scorecard` is the fastest and most useful for comparing multiple solutions; `informe-completo` is the most valuable for a single solution that needs deep improvement
4. For `MOTIVACION = due-diligence`, the generated prompt includes evaluation of technical risks that impact valuation: technical debt as liability, vendor lock-in as risk, and scalability as a growth enabler

---
**Author:** Javier Montano | **© Comunidad MetodologIA** | **Version:** 1.0.0 | **Date:** March 13, 2026
