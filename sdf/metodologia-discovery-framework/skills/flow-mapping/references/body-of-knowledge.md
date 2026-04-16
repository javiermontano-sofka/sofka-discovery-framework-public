---
skill: flow-mapping
title: Body of Knowledge — Flow Mapping
version: 1.0.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
---

# Body of Knowledge: Flow Mapping

## 1. Fundamentos Teóricos

El mapeo de flujos de negocio es la disciplina que traduce el comportamiento observable de un sistema en recorridos trazables desde el trigger de inicio hasta la completación del objetivo de negocio. Su raíz epistemológica descansa en tres tradiciones convergentes: la teoría de sistemas (von Bertalanffy, 1968), la notación de procesos de negocio (BPMN, OMG 2004–2024), y la modelación de dominios semánticos (Evans, 2003).

**Principios fundacionales:**
- **Observabilidad causal:** Un flujo no existe si no puede ser observado desde el código o desde la infraestructura. Todo lo que no puede medirse debe marcarse como supuesto.
- **Trazabilidad E2E:** Cada flujo tiene un inicio (trigger) y un fin (outcome de negocio). Las flechas sin etiqueta son deuda de documentación.
- **Pareto de flujos:** El 80% del valor de negocio se concentra en 8-12 flujos primarios. La cobertura más allá de este umbral tiene retornos decrecientes.

## 2. Domain-Driven Design (DDD)

**Eric Evans** — *Domain-Driven Design: Tackling Complexity in the Heart of Software* (2003) — establece el marco conceptual central del skill: los bounded contexts como unidades de coherencia semántica, la ubiquitous language como contrato de comunicación entre equipos y código, y los aggregates como invariantes transaccionales.

**Vaughn Vernon** — *Implementing Domain-Driven Design* (2013) e *Idiomatic Domain-Driven Design* (2021) — operacionaliza los conceptos de Evans con patrones concretos de context mapping y diseño de aggregates.

**Context Mapping Patterns clave:**
| Patrón | Descripción | Cuándo usarlo |
|--------|-------------|---------------|
| Shared Kernel | Código compartido entre dos contextos | Dominios con alta cohesión semántica temporal |
| Customer-Supplier | Un contexto depende del otro con SLA formal | Integración upstream/downstream clara |
| Conformist | El downstream acepta el modelo del upstream sin transformación | Integración con sistemas legados o SaaS |
| Anti-Corruption Layer | Capa de traducción que protege el modelo de dominio | Integración con sistemas legacy con modelo incompatible |

## 3. Modelación de Procesos de Negocio

**BPMN 2.0 (Business Process Model and Notation)** — OMG Standard, 2011, revisado 2024 — provee la notación estandarizada para swimlane diagrams, eventos, gateways, y tareas. Es la base sobre la cual se construyen las especificaciones de trama del skill.

**UML Sequence Diagrams** — OMG UML 2.5.1 (2017) — define la notación para diagramas de secuencia: participantes, mensajes síncronos/asíncronos, fragmentos combinados (alt, opt, loop, par). El skill adapta esta notación en formato ASCII para máxima portabilidad y compatibilidad con herramientas de documentación como-código.

**Event Storming** (Alberto Brandolini, 2013) — técnica de descubrimiento colaborativo de flujos de dominio mediante post-its naranjas (domain events), comandos (azules), y agregados (amarillos). Complementa el análisis de código con perspectiva de negocio.

## 4. Teoría de Integración y Mensajería

**Gregor Hohpe & Bobby Woolf** — *Enterprise Integration Patterns* (2003, actualizado 2023) — catalogo canónico de 65 patrones de integración: message channel, message router, message translator, message endpoint, pipes and filters. Todo flujo asíncrono puede describirse con estos patrones.

**Especificación de trama** — formato estructurado para documentar cada mensaje en un flujo:
- `Msg ID`: identificador único del mensaje dentro del flujo
- `Source / Destination`: sistemas participantes
- `Protocol`: REST, gRPC, AMQP, Kafka, JDBC, SFTP
- `Content`: estructura del payload (schema reference o descripción)
- `Sync/Async`: modalidad de comunicación
- `SLA`: latencia esperada + timeout + política de retry

**Patrones de resiliencia** (Michael Nygard, *Release It!*, 2007; revisado 2018): circuit breaker, bulkhead, timeout, retry con backoff exponencial. Cada punto de integración en un flujo debe documentar su patrón de resiliencia aplicado o ausente.

## 5. Análisis de Fallos y Riesgo

**FMEA (Failure Mode and Effects Analysis)** — método de origen aeronáutico (MIL-STD-1629, 1949) adoptado por la industria de software para análisis de puntos de falla. Cada failure point tiene: modo de fallo, causa raíz, efecto, probabilidad, severidad, y mitigación actual.

**Teoría de cascada de fallos** — sistemas acoplados pueden amplificar fallos locales hasta colapso sistémico (Charles Perrow, *Normal Accidents*, 1984). En flujos de negocio esto se manifiesta como: alta dependencia fan-in sin circuit breaker, ausencia de timeouts explícitos, y circular dependencies entre servicios.

**Métricas SRE** (Google SRE Book, 2016): SLI (Service Level Indicator), SLO (Service Level Objective), SLA (Service Level Agreement). Los flujos críticos deben tener SLOs definidos en p95 y p99.

## 6. Herramientas y Tecnologías

**Extracción estática de flujos:**
- OpenAPI/Swagger: especificación de contratos HTTP (API First)
- AsyncAPI 2.x / 3.0: especificación de contratos asíncronos (event-driven)
- Protocol Buffers (.proto): contratos gRPC
- JCL / JES: flujos mainframe/COBOL
- Diagrama de clases UML: identificación de aggregates y relaciones

**Observabilidad y tracing distribuido:**
- OpenTelemetry: estándar de instrumentación (trazas, métricas, logs)
- Jaeger / Zipkin: distributed tracing para reconstruir flujos desde producción
- Kibana / Grafana: visualización de flujos bajo carga real
- APM (Datadog, New Relic, Dynatrace): monitoreo de performance por flujo

**Modelado y diagramación:**
- Mermaid.js: diagramas como código (sequence, flowchart, state)
- PlantUML: diagramas UML desde texto
- Lucidchart / draw.io: diagramas colaborativos visuales
- Event Storming: Miro / FigJam para sesiones facilitadas

## 7. Metodologías Relacionadas

**Lean Process Mapping** (Womack & Jones, *Lean Thinking*, 1996): value stream mapping para identificar waste (muda) en flujos de negocio. Aplicable en análisis de latencias y cuellos de botella.

**Six Sigma DMAIC** (Motorola, 1986; GE, 1990s): Define-Measure-Analyze-Improve-Control. El análisis de flujos corresponde a la fase "Analyze" — identificar causas raíz de defectos en el proceso.

**TOGAF Architecture Views** (The Open Group, 2022): la vista de proceso de negocio y la vista de información son directamente alimentadas por el output de flow mapping.

**C4 Model** (Simon Brown, 2018): los diagramas de contexto y contenedor proveen el marco de sistemas dentro del cual los flujos se documentan. Flow mapping opera en el nivel de "componentes" y "código" del C4.

## 8. Referencias Cruzadas a Otros Skills

| Skill | Relación |
|-------|----------|
| **asis-analysis** | Input primario: arquitectura AS-IS documentada. Especialmente secciones S1 (stack), S2 (estructura), S3 (arquitectura), S9 (riesgos). |
| **software-architecture** | Los flujos revelan acoplamiento entre módulos. Los bounded contexts de flow-mapping informan la modularización en software-architecture. |
| **solutions-architecture** | Los flujos E2E y la matriz de integración son input directo para el diseño de soluciones cross-system. |
| **functional-spec** | Los flujos documentados se detallan como casos de uso funcionales en la especificación. |
| **scenarios** | Los puntos de falla críticos y los flujos de integración alimentan el análisis de escenarios Tree-of-Thought. |
| **event-architecture** | Los flujos asíncronos con eventos se detallan como arquitectura de eventos en este skill complementario. |
| **api-architecture** | Los contratos de integración síncronos (REST/gRPC) documentados en trama se formalizan como especificación de API. |

---
**Autor:** Javier Montaño | **© Comunidad MetodologIA** | **Versión:** 1.0.0 | **Fecha:** Marzo 2026
