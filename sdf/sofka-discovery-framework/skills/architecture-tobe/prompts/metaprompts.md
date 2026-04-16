---
skill: metodologia-architecture-tobe
title: "Metaprompts — Arquitectura TO-BE"
author: Javier Montaño
copyright: "© Comunidad MetodologIA"
updated: 2026-03-13
---

# Metaprompts: TO-BE Architecture

> Meta-prompts for generating customized prompts for the `metodologia-architecture-tobe` skill, adapted to industries, team contexts, and specific constraints.

---

## Metaprompt 1: Industry-Specific Prompt Generator

**Purpose:** Create a customized TO-BE prompt for a specific industry (banking, healthcare, retail, logistics, etc.) with relevant regulatory requirements and integration patterns for that sector.

**Template:**
```
Eres un arquitecto senior de Comunidad MetodologIA especializado en [INDUSTRIA].
Necesito que crees un prompt para el skill `metodologia-architecture-tobe` que sea específico para un cliente de [INDUSTRIA] con las siguientes características:

CONTEXTO DEL CLIENTE:
- Industria: [INDUSTRIA] (ejemplo: banca, retail, salud, logística, gobierno)
- Regulaciones aplicables: [LISTA_REGULACIONES] (ejemplo: PCI-DSS, HIPAA, GDPR, SOX, LGPD)
- Sistema legado: [TIPO_SISTEMA_LEGADO] (ejemplo: core bancario COBOL, ERP SAP, CRM Salesforce)
- Integrations críticas: [LISTA_INTEGRACIONES] (ejemplo: SWIFT, HL7 FHIR, EDI)
- Restricciones especiales: [RESTRICCIONES] (ejemplo: data residency, air-gap, no cloud)

PARÁMETROS DEL DISEÑO:
- Escenario: [Conservative / Moderate / Aggressive]
- Experiencia del equipo: [Beginner / Intermediate / Expert]
- Timeline: [MESES] meses
- Budget: [RANGO]

Con esta información, genera un prompt completo y específico para activar el skill `metodologia-architecture-tobe` que:
1. Incluya el contexto regulatorio como restricciones en los ADRs
2. Mencione los nightmare scenarios específicos de esa industria
3. Adapte los patrones de integración al ecosistema del sector
4. Incluya los criterios de validación regulatoria como parte del Validation Gate
```

**Usage guide:**
- Replace all UPPERCASE placeholders with client information
- Execute the metaprompt in a separate session to get the customized prompt
- Review the generated prompt before using it with the actual skill
- Add any additional constraints the metaprompt didn't capture

---

## Metaprompt 2: ADR Generator by Technical Decision

**Purpose:** Create a prompt that generates a complete, well-reasoned ADR for any specific technical decision, following the MetodologIA standard format with explicit trade-offs.

**Template:**
```
Eres un arquitecto senior de Comunidad MetodologIA especializado en [DOMINIO_TÉCNICO].
Necesito generar un ADR de alta calidad para el skill `metodologia-architecture-tobe`.

DECISIÓN A DOCUMENTAR:
- Número de ADR: ADR-[NNN]
- Área de decisión: [ÁREA] (ejemplo: seguridad, datos, comunicación entre servicios, despliegue)
- Decisión tomada: [DESCRIPCIÓN_DECISIÓN]
- Alternativas que se evaluaron: [OPCIÓN_A], [OPCIÓN_B], [OPCIÓN_C]
- Restricciones que orientaron la decisión: [LISTA_RESTRICCIONES]

CONTEXTO DEL SISTEMA:
- Sistema: [NOMBRE_SISTEMA]
- Stage de la transformación: [FASE_ACTUAL]
- Equipo que ejecutará: [DESCRIPCIÓN_EQUIPO]
- Impacto estimado: [ALCANCE_DEL_CAMBIO]

Genera el prompt para crear un ADR que:
1. Documente el contexto de manera que sea comprensible para un arquitecto que se une al proyecto 2 años después
2. Evalúe cada alternativa con pros reales (no genéricos) y contras específicos al contexto
3. Cuantifique el trade-off cuando sea posible (ejemplo: "+20% latencia vs. +99.9% consistencia")
4. Defina consecuencias concretas: qué cambia en el sistema, en el equipo, en la operación
5. Incluya referencias a patrones conocidos (CQRS, Saga, Circuit Breaker, etc.) cuando aplique
```

**Usage guide:**
- Useful when the team identifies a new decision during delivery, outside the initial TO-BE
- The generated ADR should be reviewed with the Architecture Review Board before marking as "Accepted"
- Number ADRs sequentially in the project's decision repository

---

## Metaprompt 3: Nightmare Scenario Generator by Technology Stack

**Purpose:** Create prompts that generate nightmare scenarios specific to the chosen technology stack, with alerts and acceptance criteria adapted to the client's actual monitoring tools.

**Template:**
```
Eres un SRE senior de Comunidad MetodologIA con experiencia en [STACK_TECNOLÓGICO].
Necesito generar nightmare scenarios específicos para el stack del cliente dentro del skill `metodologia-architecture-tobe`.

STACK TECNOLÓGICO:
- Service Mesh: [Istio / Linkerd / Consul Connect / ninguno]
- Message Broker: [Kafka / RabbitMQ / AWS SQS / Azure Service Bus]
- Observability Stack: [Datadog / Prometheus+Grafana / New Relic / AWS CloudWatch]
- Auth Provider: [Keycloak / Auth0 / Okta / Azure AD]
- Database: [PostgreSQL / Oracle / MySQL / MongoDB / Aurora]
- Container Orchestration: [Kubernetes / ECS / OpenShift]

CONTEXTO DE NEGOCIO:
- Dominio: [DOMINIO] (ejemplo: pagos, órdenes, inventario, identidad)
- SLA de negocio: [SLA] (ejemplo: 99.95% uptime, <100ms P99, zero data loss)
- Impacto de outage: [DESCRIPCIÓN_IMPACTO] (ejemplo: pérdida de $X por minuto, incidente regulatorio)

Genera un prompt para crear nightmare scenarios que:
1. Nombren las herramientas reales del stack (no genérico "el message broker" sino "Kafka con lag >10K mensajes")
2. Definan alertas con umbrales específicos usando las herramientas de observabilidad del cliente
3. Incluyan los runbooks de respuesta en términos de comandos o acciones concretas
4. Conecten cada nightmare con su ADR de mitigación correspondiente
5. Establezcan criterios Go/No-Go que el equipo de QA pueda ejecutar en un chaos engineering exercise
```

**Usage guide:**
- Execute before designing the final nightmare scenarios of the TO-BE
- Generated alert thresholds should be reviewed with the client's SRE/Ops team
- Use the runbooks as a basis for the Operational section of the Validation Gate

---

## Metaprompt 4: Trade-off Matrix Generator for Architecture Decisions

**Purpose:** Create prompts that generate an exhaustive trade-off matrix for comparing architectural options across dimensions relevant to the specific client.

**Template:**
```
Eres un arquitecto enterprise de Comunidad MetodologIA especializado en decisiones de arquitectura de sistemas distribuidos.
Necesito generar una trade-off matrix de alta calidad para el skill `metodologia-architecture-tobe`.

DECISIÓN ARQUITECTÓNICA:
- Tipo de decisión: [TIPO] (ejemplo: comunicación entre servicios, estrategia de datos, modelo de seguridad)
- Opciones a comparar: [OPCIÓN_A] vs [OPCIÓN_B] vs [OPCIÓN_C]

DIMENSIONES DE EVALUACIÓN (selecciona las 5-7 más relevantes):
- Complejidad operativa: [Alta / Media / Baja importancia para el cliente]
- Latencia y performance: [Alta / Media / Baja importancia]
- Consistencia de datos: [Alta / Media / Baja importancia]
- Costo de implementación: [Alta / Media / Baja importancia]
- Experiencia del equipo requerida: [Alta / Media / Baja importancia]
- Vendor lock-in: [Alta / Media / Baja importancia]
- Escalabilidad futura: [Alta / Media / Baja importancia]

RESTRICCIONES DEL CLIENTE:
- Prioridad #1: [PRIORIDAD_1] (ejemplo: reducir time-to-market)
- Prioridad #2: [PRIORIDAD_2] (ejemplo: minimizar complejidad operativa)
- Constraints duros: [LISTA_CONSTRAINTS]

Genera el prompt para crear una trade-off matrix que:
1. Evalúe cada opción en cada dimensión con puntuación justificada (no opinión, evidencia)
2. Pese las dimensiones según las prioridades del cliente declaradas arriba
3. Produzca una recomendación justificada con el score ponderado
4. Documente explícitamente qué se gana y qué se sacrifica con la opción recomendada
5. Incluya la condición bajo la cual cambiaría la recomendación (sensitiviy analysis)
```

**Usage guide:**
- Use when the team has more than 2 viable architectural options and needs an objective decision
- Dimension weights should be validated with the client before calculating the final score
- The result directly feeds the ADR for the decision

---

## Metaprompt 5: Validation Criteria Generator for Architecture Review

**Purpose:** Create prompts that generate specific, measurable validation criteria for the TO-BE Validation Gate, adapted to the client's regulatory context, SLAs, and team.

**Template:**
```
Eres un Quality Architect de Comunidad MetodologIA especializado en validación de arquitecturas enterprise.
Necesito generar criterios de validación específicos para el Validation Gate del skill `metodologia-architecture-tobe`.

CONTEXTO DEL SISTEMA:
- Sistema: [NOMBRE_SISTEMA]
- Industria y regulación: [INDUSTRIA_Y_REGULACIÓN]
- SLAs de negocio críticos: [LISTA_SLAS] (ejemplo: 99.95% uptime, <100ms P99, zero data loss financiero)
- Volumen esperado: [USUARIOS_CONCURRENTES] usuarios, [TRANSACCIONES_DÍA] transacciones/día
- Herramientas de testing disponibles: [HERRAMIENTAS] (ejemplo: k6, JMeter, Chaos Monkey, OWASP ZAP)

CRITERIOS ESPECIALES:
- Requisitos regulatorios de testing: [LISTA_REQUISITOS] (ejemplo: PCI-DSS penetration test anual, SOX audit trail)
- Restricciones de testing en producción: [RESTRICCIONES] (ejemplo: no chaos en horario bancario)
- Equipo de QA disponible: [DESCRIPCIÓN_QA]

Genera el prompt para crear un Validation Gate que:
1. Defina criterios funcionales con umbrales numéricos específicos (no "buen performance" sino "<100ms P99 bajo carga de 5K usuarios concurrentes")
2. Incluya criterios de resiliencia con escenarios de chaos engineering ejecutables
3. Defina criterios de seguridad con herramientas concretas y thresholds (CVSS score <7.0, zero critical findings)
4. Establezca criterios operacionales que el equipo de SRE pueda verificar en el primer mes post-deploy
5. Liste los Rejection Criteria (blockers absolutos) con descripción exacta de qué los activaría
6. Proporcione el procedimiento de testing para cada criterio (quién lo ejecuta, cuándo, con qué herramienta)
```

**Usage guide:**
- Execute at the start of the TO-BE design to define criteria before building (not after)
- Generated criteria should be reviewed with the client's QA and SRE team
- Rejection Criteria must be approved by the steering committee before Phase Gate 1

---

*© Comunidad MetodologIA — Autor: Javier Montaño — Actualizado: 13 de marzo de 2026*
