# Use Case Prompts — Event Architecture

> Prompts listos para usar en los casos de uso mas frecuentes de esta skill.
> Cada prompt incluye contexto de cuando usarlo y parametros variables.

---

## 1. Event Catalog Design

**Cuando:** El cliente necesita crear o reestructurar su catalogo de eventos para dar visibilidad, gobernanza y descubrimiento a todos los eventos del sistema.

```
Disenar catalogo de eventos para {SISTEMA} de {ORGANIZACION}.

Contexto:
- Numero de servicios productores: {NUM_PRODUCTORES}
- Numero de eventos estimados: {NUM_EVENTOS}
- Broker actual: {BROKER} (Kafka / RabbitMQ / Pulsar / SNS+SQS / ninguno)
- Naming convention actual: {NAMING} (consistente / inconsistente / inexistente)
- Schema registry: {REGISTRY} (Confluent / Glue / Apicurio / ninguno)
- CloudEvents adoption: {CLOUDEVENTS} (si / no / parcial)

Disenar:
- Taxonomia de eventos: domain events, integration events, system events
- Naming convention: {Domain}.{Entity}.{Action} con guia de ejemplos
- Envelope standard: CloudEvents 1.0 con protocol bindings para {BROKER}
- Metadata obligatorio: id, source, type, time, correlationId, causationId
- Event granularity: decision matrix (thin/notification vs fat/state-transfer vs delta)
- Schema format: Avro (Kafka) / Protobuf (multi-lenguaje) / JSON Schema (legibilidad)
- Catalog governance: registro obligatorio antes de publicar (producer registration flow)
- Catalog tooling: EventCatalog (open-source) o custom en Backstage

Entregar:
1. Event catalog template con 5 eventos de ejemplo completos
2. Naming convention guide con do/don't
3. CloudEvents envelope spec adaptado al broker
4. Producer registration workflow
5. Event granularity decision tree

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Entregar S1 (Event Catalog & Taxonomy) completo con S3 (Schema Registry) como complemento.
```

---

## 2. CQRS Implementation Design

**Cuando:** El cliente necesita separar modelos de lectura y escritura para optimizar performance, escala, o complejidad de dominio.

```
Disenar implementacion CQRS para {DOMINIO} de {ORGANIZACION}.

Contexto:
- Dominio de negocio: {DOMINIO} (ej: ordenes, inventario, facturacion)
- Ratio lectura/escritura: {RATIO} (ej: 10:1, 100:1, 1:1)
- Complejidad del dominio: {COMPLEJIDAD} (baja / media / alta / muy alta)
- Base de datos actual: {DB} (PostgreSQL / MySQL / MongoDB / DynamoDB)
- Broker actual: {BROKER} (Kafka / RabbitMQ / ninguno)
- Event sourcing requerido: {ES} (si / no / a evaluar)
- Requisitos de audit trail: {AUDIT} (regulatorio / operacional / no requerido)
- Temporal queries necesarias: {TEMPORAL} (si / no)

Disenar:
- Command side: aggregate design, validation rules, domain event emission
- Query side: projection design, denormalized views, materialized tables
- Sync mechanism: domain events → projection updater (async vs sync)
- Eventual consistency: lag aceptable entre write y read ({SEGUNDOS} segundos)
- Event sourcing decision:
  - Si audit trail regulatorio + temporal queries: event sourcing recomendado
  - Si solo read/write optimization: CQRS sin ES (mas simple)
- Event store: EventStoreDB vs Kafka (log compaction) vs PostgreSQL (append-only table)
- Snapshot strategy: cada {N} eventos para aggregates de alto volumen
- Upcasting: estrategia para evolucionar formato de eventos historicos
- Error handling: projection rebuild, dead letter para eventos no procesables

Entregar:
1. CQRS architecture diagram (Mermaid)
2. Command side: aggregate, command handlers, domain events
3. Query side: projections, query handlers, materialized views
4. Event sourcing decision con ADR (si aplica)
5. Operational runbook: projection rebuild, event replay, monitoring

Parametros:
- {MODO}: supervisado (confirmar ES decision antes de disenar)
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Entregar S5 (CQRS & Event Sourcing) completo con S4 (Consistency Patterns) como contexto.
```

---

## 3. Saga Orchestration Design

**Cuando:** El cliente necesita coordinar transacciones distribuidas entre multiples servicios con compensaciones.

```
Disenar patron saga para {PROCESO} de {ORGANIZACION}.

Contexto:
- Proceso de negocio: {PROCESO} (ej: fulfillment de orden, onboarding de cliente)
- Servicios involucrados: {SERVICIOS} (listar cada servicio y su responsabilidad)
- Num de pasos: {NUM_PASOS}
- Criticidad: {CRITICIDAD} (financiera / operacional / informacional)
- Patron actual: {PATRON_ACTUAL} (sin patron / 2PC / compensacion manual / outbox)
- Broker: {BROKER} (Kafka / RabbitMQ / cloud-native)
- Tolerancia a inconsistencia temporal: {TOLERANCIA} (segundos / minutos / inaceptable)

Evaluar:
- Orchestration vs Choreography:
  - Si >3 servicios o logica compleja: Orchestration (flujo visible, compensation centralizada)
  - Si 2-3 servicios simples: Choreography (acoplamiento bajo)
  - Si requiere visibilidad total para compliance: Orchestration obligatorio
- Orchestrator design: state machine, persistent state, retry policies
- Compensation logic: para CADA paso, definir accion compensatoria
- Idempotency: CADA consumidor debe procesar el mismo evento 2x sin side effects
- Timeout strategy: cuanto espera cada paso antes de compensar?
- Outbox pattern: write atomico de estado + evento (DB transaction + relay)
- Inbox pattern: deduplication en consumidor con idempotency key

Saga flow:
| Paso | Servicio | Accion | Compensacion | Timeout |
|------|----------|--------|--------------|---------|
| 1    | {svc}    | {accion} | {compensacion} | {timeout} |
| ...  | ...      | ...    | ...          | ...     |

Entregar:
1. Saga flow diagram (Mermaid sequence/state diagram)
2. Orchestrator state machine specification
3. Compensation logic per step
4. Outbox table schema + relay configuration
5. Idempotency implementation guide
6. Failure scenario analysis (que pasa si el paso N falla?)
7. Monitoring: metricas de saga completion rate, compensation rate, timeout rate

Parametros:
- {MODO}: paso-a-paso (cada paso del saga requiere validacion)
- {FORMATO}: markdown

Entregar S4 (Consistency Patterns) completo.
```

---

## 4. Event Sourcing Evaluation

**Cuando:** El cliente considera event sourcing y necesita un assessment riguroso de si los beneficios justifican la complejidad.

```
Evaluar event sourcing para {DOMINIO} de {ORGANIZACION}.

Contexto:
- Dominio de negocio: {DOMINIO}
- Requisito de audit trail: {AUDIT} (regulatorio obligatorio / deseable / no requerido)
- Necesidad de temporal queries: {TEMPORAL} ("que estado tenia X en fecha Y?")
- Necesidad de event replay: {REPLAY} (recalcular proyecciones, corregir datos historicos)
- Volumen de eventos: {VOLUMEN} (eventos/dia estimados)
- Equipo: experiencia en event sourcing: {EXPERIENCIA} (ninguna / basica / avanzada)
- Stack actual: {STACK} (lenguaje, framework, DB)

Evaluar beneficios:
- Audit trail completo e inmutable (compliance, forense)
- Temporal queries nativos (estado en cualquier punto del tiempo)
- Event replay para reconstruir proyecciones o corregir errores
- Debugging: secuencia exacta de lo que paso y por que
- Desacoplamiento: nuevos consumers procesan eventos historicos

Evaluar costos:
- Complejidad de implementacion: aggregate design, event store, snapshots, upcasting
- Curva de aprendizaje del equipo: {MESES_ESTIMADOS} para productividad
- Storage growth: eventos inmutables crecen indefinidamente (retention policy?)
- Schema evolution: upcasting de eventos historicos a formatos nuevos
- Eventual consistency: consumers siempre atras del write model
- Tooling: EventStoreDB, Axon Framework, o custom sobre Kafka/PostgreSQL

Decision framework:
| Criterio | Peso | Score (1-5) | Ponderado |
|----------|------|-------------|-----------|
| Audit trail regulatorio | 25% | ? | ? |
| Temporal queries | 20% | ? | ? |
| Event replay value | 15% | ? | ? |
| Team readiness | 20% | ? | ? |
| Domain complexity fit | 20% | ? | ? |
| TOTAL | 100% | — | ?/5.0 |

- Score >= 3.5: Event sourcing recomendado
- Score 2.5-3.4: CQRS sin ES puede ser suficiente
- Score < 2.5: Event sourcing no justificado (sobre-ingenieria)

Entregar:
1. Go/No-Go recommendation con justificacion
2. Si Go: implementation roadmap (pilot aggregate → rollout)
3. Si No-Go: alternativa recomendada (CQRS sin ES, audit log, CDC)
4. Risk register con mitigaciones

Parametros:
- {MODO}: supervisado
- {FORMATO}: markdown

Entregar S5 (CQRS & Event Sourcing) como evaluacion, no como diseno completo.
```

---

## 5. Event-Driven Migration Strategy

**Cuando:** El cliente quiere migrar de comunicacion sincrona (REST, RPC) a event-driven para desacoplar servicios.

```
Disenar estrategia de migracion a event-driven para {SISTEMA} de {ORGANIZACION}.

Contexto:
- Arquitectura actual: {ARQUITECTURA} (monolito / microservicios sincronos / mixta)
- Num de integraciones sincronas: {NUM_INTEGRACIONES}
- Pain points: {PAIN_POINTS} (ej: cascading failures, tight coupling, temporal coupling)
- Broker target: {BROKER} (Kafka / RabbitMQ / Pulsar / cloud-native / a evaluar)
- Equipo: experiencia con messaging: {EXPERIENCIA}
- Timeline deseado: {TIMELINE}
- Budget magnitude: {BUDGET} (bajo / medio / alto)

Disenar:
- Strangler fig approach: identificar boundaries de mayor valor para migrar primero
- Criteria de priorizacion:
  - Fan-out notifications (1 productor → N consumidores): alto valor async
  - Long-running processes (>5s): candidatos naturales
  - Fire-and-forget operations: quick win
  - Request-response con baja latencia: mantener sincrono (no forzar async)
- Dual-running: periodo de coexistencia sincrono + async con reconciliation
- Broker selection: comparar opciones contra volumen, latencia, ops capability
- Schema registry setup: desde day 1, no after the fact
- Event catalog foundation: catalogar eventos antes de publicar
- Outbox pattern: reliable publishing desde servicios existentes
- Consumer patterns: idempotency, ordering guarantees, DLQ handling
- Observability: distributed tracing con correlationId a traves de la cadena de eventos

Migration waves:
| Wave | Servicios | Integraciones | Patron | Timeline |
|------|-----------|---------------|--------|----------|
| 0 (foundation) | — | — | Broker setup, schema registry, catalog | {semanas} |
| 1 (pilot) | {svc} | {integracion} | Outbox + event | {semanas} |
| 2 (expansion) | {svcs} | {integraciones} | Strangler fig | {semanas} |
| 3 (maturity) | {svcs} | {integraciones} | Full event-driven | {semanas} |

Entregar:
1. Migration assessment: que migrar, que NO migrar
2. Broker selection matrix con decision
3. Wave plan con dependencias y milestones
4. Risk register: rollback strategy por wave
5. Team enablement plan: training, pairing, reference implementation

Parametros:
- {MODO}: supervisado (confirmar wave plan antes de detallar)
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Entregar todas las secciones con enfasis en S2 (Broker) + S1 (Catalog) + S6 (Operational readiness).
```

---

## 6. Schema Registry & Evolution Design

**Cuando:** El cliente necesita implementar gobernanza de schemas para prevenir breaking changes entre productores y consumidores de eventos.

```
Disenar schema registry y estrategia de evolucion para {SISTEMA} de {ORGANIZACION}.

Contexto:
- Broker: {BROKER} (Kafka / RabbitMQ / Pulsar)
- Num de topics/eventos: {NUM_EVENTOS}
- Equipos productores: {NUM_EQUIPOS}
- Schema format actual: {FORMAT} (JSON sin schema / Avro / Protobuf / JSON Schema)
- Breaking changes recientes: {BREAKING} (si, detalle / no)
- CI/CD maturity: {CI_MATURITY} (basico / intermedio / avanzado)

Disenar:
- Registry platform: Confluent Schema Registry vs AWS Glue vs Apicurio
- Schema format selection:
  - Avro: mejor integracion Kafka, compact, evolution nativa
  - Protobuf: strong typing, multi-lenguaje, gRPC bridge
  - JSON Schema: legible, flexible, tooling HTTP nativo
- Compatibility mode por subject:
  - BACKWARD (default): consumers upgrade first
  - FORWARD: producers upgrade first
  - FULL: maximum safety, most restrictive
- CI/CD integration: schema validation en PRs que modifican event definitions
- Schema evolution rules:
  - Safe: agregar campo opcional con default
  - Unsafe: eliminar campo, cambiar tipo, renombrar campo
  - Procedure: PR review + compatibility check + consumer impact analysis
- Subject naming strategy: {topic}-value, {topic}-key, TopicNameStrategy vs RecordNameStrategy
- Schema lifecycle: draft → published → deprecated → removed

Entregar:
1. Schema registry architecture diagram
2. Compatibility mode configuration por categoria de evento
3. CI/CD pipeline spec para schema validation
4. Schema evolution runbook (safe/unsafe change procedures)
5. Migration plan desde formato actual a formato target

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown

Entregar S3 (Event Schema Registry) completo.
```

---

## 7. Operational Excellence Assessment

**Cuando:** El cliente tiene un sistema event-driven en produccion y necesita mejorar confiabilidad, observabilidad y procedimientos operacionales.

```
Evaluar excelencia operacional del sistema event-driven de {ORGANIZACION}.

Contexto:
- Broker: {BROKER} y version
- Num de topics: {NUM_TOPICS}
- Num de consumer groups: {NUM_GROUPS}
- Incidentes recientes relacionados con eventos: {INCIDENTES}
- DLQ handling actual: {DLQ} (existe / no existe / manual)
- Monitoring actual: {MONITORING} (basico / intermedio / avanzado)
- Replay capability: {REPLAY} (si / no / parcial)

Evaluar:
- Dead Letter Topic management:
  - [ ] DLT configurado para cada consumer group
  - [ ] Retry policy: 3-5 intentos con exponential backoff
  - [ ] DLT schema incluye error metadata
  - [ ] Alertas en DLT depth >0
  - [ ] Proceso de clasificacion de fallos (schema / logica / transiente)
  - [ ] Replay workflow documentado y probado
- Consumer lag monitoring:
  - [ ] Warning threshold: 1000 messages
  - [ ] Critical threshold: 10000 messages
  - [ ] Auto-scaling trigger configurado
  - [ ] Dashboard visible para ops
- Poison pill detection:
  - [ ] Circuit breaker en consumer
  - [ ] Quarantine topic para analisis manual
- Event replay:
  - [ ] Replay selectivo por aggregate ID, time range, event type
  - [ ] Replay en projections aisladas antes de switch
  - [ ] Idempotent handlers previenen side effects en replay
- Observability:
  - [ ] Distributed tracing con correlationId end-to-end
  - [ ] Producer rate, consumer rate, lag como metricas
  - [ ] Processing duration histograms per consumer
  - [ ] Alertas en anomalias de throughput

Entregar:
1. Operational maturity scorecard (1-5 por dimension)
2. Top 5 gaps criticos con remediacion
3. Runbook templates: DLQ handling, event replay, consumer scaling
4. Monitoring dashboard specification
5. Improvement roadmap (quick wins + strategic)

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown

Entregar S6 (Operational Excellence) completo.
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
