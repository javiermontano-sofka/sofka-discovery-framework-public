---
title: Body of Knowledge — Event Architecture
skill: metodologia-event-architecture
author: Javier Montaño
organization: Comunidad MetodologIA
version: 1.0.0
updated: 2026-03-13
---

# Body of Knowledge: Event Architecture

> Mapa de conocimiento estructurado para el dominio de arquitectura event-driven. Cubre fundamentos teoricos, patrones de consistencia, obras seminales, metodologias de trabajo, herramientas de implementacion y referencias cruzadas con otras disciplinas.

---

## 1. Fundamentos Teoricos

### 1.1 Event-Driven Architecture (EDA)

La arquitectura event-driven desacopla productores de consumidores mediante mensajeria asincrona. Los componentes se comunican a traves de eventos — hechos inmutables que representan algo que ocurrio en el sistema. Los tres patrones fundamentales de EDA son:

| Patron | Descripcion | Ejemplo |
|---|---|---|
| **Event Notification** | Senala que algo ocurrio; consumidor decide si actuar | `Order.Placed` notifica a inventario |
| **Event-Carried State Transfer** | Evento contiene datos completos para que el consumidor no necesite callback | `Order.Placed` con items[], total, address |
| **Event Sourcing** | Estado almacenado como secuencia de eventos inmutables; estado actual = replay de eventos | Aggregate `Order` reconstruido desde historial |

### 1.2 Consistencia Eventual (Eventual Consistency)

Derivada del teorema CAP (Brewer, 2000) y formalizada por Werner Vogels (Amazon, 2009), la consistencia eventual es la realidad de los sistemas distribuidos: las replicas convergen al mismo estado dado tiempo suficiente sin nuevas escrituras.

- **Strong Consistency:** Todas las lecturas ven la escritura mas reciente. Requiere coordinacion sincrona (caro en latencia y disponibilidad).
- **Eventual Consistency:** Las lecturas pueden ver datos stale temporalmente. Gana disponibilidad y tolerancia a particiones.
- **Causal Consistency:** Punto medio — respeta el orden causal de operaciones. Implementable con vector clocks o timestamps logicos.

Implicacion practica: los sistemas event-driven son eventualmente consistentes por naturaleza. Disenar consistencia eventual explicitamente (sagas, outbox, idempotencia) transforma un "problema" en una ventaja arquitectonica.

### 1.3 Domain-Driven Design y Eventos

Los eventos de dominio (Domain Events) fueron formalizados por Eric Evans en *Domain-Driven Design* (2003) y expandidos por Vaughn Vernon en *Implementing Domain-Driven Design* (2013):

- **Domain Event:** Algo que los expertos del dominio reconocen como significativo. No es un log tecnico — es lenguaje ubicuo.
- **Aggregate:** Cluster de entidades con un root que garantiza invariantes. Los eventos se publican desde aggregates.
- **Bounded Context:** Limite explicito donde un modelo de dominio tiene significado. Los eventos cruzan boundaries como Integration Events.
- **Event Storming:** Tecnica de modelado colaborativo (Alberto Brandolini, 2013) donde domain experts y desarrolladores descubren eventos, comandos y aggregates usando post-its.

### 1.4 CQRS (Command Query Responsibility Segregation)

Formalizado por Greg Young (2010), CQRS separa el modelo de escritura (commands) del modelo de lectura (queries):

- **Command Model:** Valida invariantes, aplica reglas de negocio, emite domain events.
- **Query Model:** Proyecciones denormalizadas optimizadas para lectura. Actualizadas asincronamente por events.
- **Sin Event Sourcing:** CQRS es valioso por si solo para optimizar read/write con diferentes modelos de datos.
- **Con Event Sourcing:** El command model persiste como secuencia de eventos. Las projections se reconstruyen desde el event log.

---

## 2. Frameworks y Estandares

### 2.1 CloudEvents (CNCF)

Especificacion vendor-neutral para describir eventos de manera interoperable. Mantenido por la Cloud Native Computing Foundation.

- **Version actual:** 1.0.3 (estable)
- **Atributos requeridos:** `id`, `source`, `specversion`, `type`
- **Atributos recomendados:** `time`, `datacontenttype`, `dataschema`, `subject`
- **Protocol bindings:** HTTP (headers), Kafka (headers de mensaje), AMQP, MQTT, NATS, WebSocket
- **Adoption:** AWS EventBridge, Azure Event Grid, GCP Eventarc, Knative, Solace
- **Beneficio central:** Elimina la "torre de Babel" de formatos de eventos propietarios entre equipos

### 2.2 AsyncAPI 3.0

Estandar para describir APIs event-driven, analogo a OpenAPI para REST.

- **Define:** Channels (topics/queues), messages, payloads, protocol bindings
- **Bindings soportados:** Kafka, AMQP, MQTT, WebSocket, Pulsar, SNS, SQS
- **Tooling:** AsyncAPI Generator (codigo, docs), AsyncAPI Studio (editor visual), Modelina (model generation)
- **Complementa OpenAPI** para superficies asincronas del mismo sistema

### 2.3 Schema Registry

Plataformas de gobernanza de schemas que previenen breaking changes entre productores y consumidores:

| Registry | Ecosystem | Fortaleza |
|---|---|---|
| **Confluent Schema Registry** | Kafka-centric | Integracion nativa Kafka, compatibilidad modes |
| **AWS Glue Schema Registry** | AWS | Managed, integracion con Kinesis/MSK |
| **Apicurio** | Open-source | Multi-formato, API-based, Kubernetes-native |

**Formatos de schema:**

| Formato | Compactness | Typing | Kafka integration | Legibilidad |
|---|---|---|---|---|
| **Avro** | Alta (binario) | Bueno | Nativa (Confluent) | Baja |
| **Protobuf** | Alta (binario) | Excelente | Buena | Media |
| **JSON Schema** | Baja (texto) | Bueno | Buena | Alta |

### 2.4 Saga Pattern Frameworks

| Framework | Lenguaje | Tipo | Descripcion |
|---|---|---|---|
| **Axon Framework** | Java | Orchestration + ES | CQRS/ES completo con saga support |
| **Eventuate Tram** | Java | Orchestration | Sagas con outbox pattern integrado |
| **MassTransit** | .NET | Orchestration | State machine sagas, consumer framework |
| **Temporal** | Polyglot | Orchestration | Workflow engine con durabilidad, retries nativos |

---

## 3. Obras Seminales

| Obra | Autor(es) | Ano | Aportacion Clave |
|---|---|---|---|
| *Implementing Domain-Driven Design* | Vaughn Vernon | 2013 | Formalizacion de domain events, aggregates, bounded contexts como patrones implementables |
| *Designing Data-Intensive Applications* | Martin Kleppmann | 2017 | Fundamentos de sistemas distribuidos, replicacion, particionamiento, stream processing |
| *Microservices Patterns* | Chris Richardson | 2018 | Patrones saga, CQRS, event sourcing, outbox en contexto de microservicios |
| *CQRS Documents* + talks | Greg Young | 2010-2020 | Formalizacion de CQRS y event sourcing como patrones arquitectonicos |
| *Apache Kafka Documentation* | Apache / Confluent | 2011-presente | Referencia tecnica canonica para log-based messaging, consumer groups, partitioning |
| *Enterprise Integration Patterns* | Gregor Hohpe, Bobby Woolf | 2003 | Patrones fundamentales de messaging: channel, router, transformer, endpoint |
| *Building Event-Driven Microservices* | Adam Bellemare | 2020 | Guia practica de event-driven microservices, event catalog, schema governance |
| *Versioning in an Event Sourced System* | Greg Young | 2016 | Estrategias de versionamiento y upcasting para sistemas event sourced |
| *Event Storming* (libro y workshops) | Alberto Brandolini | 2013-presente | Tecnica de modelado colaborativo para descubrir eventos, comandos y aggregates |

---

## 4. Metodologias de Trabajo

### 4.1 Event Storming (Big Picture → Design Level)

Metodologia de modelado colaborativo para descubrir la arquitectura event-driven desde el dominio:

1. **Big Picture:** Domain experts + devs colocan domain events en timeline usando post-its naranjas. Identifican comandos (azul), aggregates (amarillo), y bounded contexts.
2. **Process Modeling:** Refinar el flujo con politicas (lilac), read models (verde), y external systems.
3. **Design Level:** Traducir a aggregates, command handlers, domain events, y projections implementables.
4. **Output:** Event catalog draft, bounded context map, saga candidates identificados.

### 4.2 Event-First Development

1. **Define eventos:** Catalogo de eventos ANTES de codigo. Naming convention, schemas, ownership.
2. **Design schemas:** Schema registry con compatibilidad BACKWARD desde day 1.
3. **Implement producers:** Outbox pattern para reliable publishing.
4. **Implement consumers:** Idempotentes, con retry policy y DLQ.
5. **Validate:** Contract tests entre producer schemas y consumer expectations.
6. **Monitor:** Consumer lag, DLQ depth, processing duration como metricas core.

### 4.3 Saga Design Method

1. **Identificar el happy path:** Secuencia de pasos exitosos del flujo de negocio.
2. **Definir compensaciones:** Para CADA paso, que operacion lo revierte?
3. **Modelar failure scenarios:** Que pasa si el paso N falla? Cascada de compensaciones.
4. **Disenar idempotency:** Cada step handler debe ser safe para replay (dedup keys).
5. **Definir timeouts:** Cuanto esperar por cada paso antes de compensar.
6. **Implementar monitoring:** Completion rate, compensation rate, timeout rate como metricas.

---

## 5. Herramientas y Plataformas

### 5.1 Message Brokers

| Broker | Tipo | Throughput | Replay | Ops Complexity |
|---|---|---|---|---|
| **Apache Kafka** | Log-based | Millones msg/seg | Nativo | Alto |
| **Apache Pulsar** | Log-based | Millones msg/seg | Nativo (tiered) | Medio-alto |
| **RabbitMQ** | Queue-based | Decenas de miles | No nativo | Bajo-medio |
| **AWS SNS+SQS** | Cloud-native | Managed scaling | Limitado | Bajo (managed) |
| **Azure Event Grid** | Cloud-native | Managed scaling | Limitado | Bajo (managed) |
| **GCP Pub/Sub** | Cloud-native | Managed scaling | 31 dias | Bajo (managed) |

### 5.2 Event Sourcing & CQRS

| Herramienta | Tipo | Descripcion |
|---|---|---|
| **EventStoreDB** | Event store | Purpose-built para event sourcing, projections nativas |
| **Axon Server** | Event store + orchestration | Companion de Axon Framework, managed option |
| **Marten** | .NET library | Event sourcing sobre PostgreSQL, projections integradas |
| **Kafka + compaction** | Log-based store | Event log con log compaction para latest-state |

### 5.3 CDC y Outbox

| Herramienta | Tipo | Descripcion |
|---|---|---|
| **Debezium** | CDC platform | Lee WAL/binlog, publica a Kafka. Outbox event router SMT |
| **AWS DMS** | Managed CDC | Database Migration Service con CDC mode |
| **Kafka Connect** | Integration | Conectores source/sink para multiples sistemas |

### 5.4 Observabilidad

| Herramienta | Tipo | Descripcion |
|---|---|---|
| **Burrow** | Kafka monitoring | Consumer lag monitoring especializado |
| **Kafka Lag Exporter** | Prometheus exporter | Metricas de lag para Grafana dashboards |
| **OpenTelemetry** | Distributed tracing | Propagacion de correlationId a traves de event chains |
| **AKHQ** | Kafka UI | Visualizacion de topics, consumer groups, messages |

### 5.5 Catalogos de Eventos

| Herramienta | Tipo | Descripcion |
|---|---|---|
| **EventCatalog** | Open-source catalog | Catalogo de eventos con docs, schemas, ownership |
| **Backstage** | IDP + catalog | Catalogo de servicios extendible a eventos |
| **AsyncAPI Studio** | Spec editor | Editor visual para specs AsyncAPI |

---

## 6. Tendencias Emergentes

Ver `state-of-the-art.md` para analisis detallado de tendencias 2024-2028.

### Senales en Radar

- **Event Mesh:** Red de brokers interconectados para routing de eventos cross-cloud y cross-region.
- **CloudEvents Adoption Wave:** Estandarizacion acelerada por cloud providers nativos (EventBridge, Event Grid, Eventarc).
- **Serverless Event Processing:** Funciones efimeras procesando eventos sin servidores persistentes (Lambda + EventBridge).
- **Event-Driven AI:** LLMs consumiendo event streams para decisiones en tiempo real y generacion de insights.

---

## 7. Glosario

| Termino | Definicion |
|---|---|
| **Domain Event** | Hecho de negocio significativo que ocurrio en el sistema. Inmutable. |
| **Integration Event** | Evento que cruza bounded contexts para comunicar cambios entre dominios. |
| **System Event** | Senal operacional (health check, deployment, config change). |
| **Aggregate** | Cluster de entidades con root que garantiza invariantes de negocio. |
| **Saga** | Patron de consistencia distribuida con pasos y compensaciones. |
| **Outbox Pattern** | Escribir evento + cambio de estado en una transaccion de DB; relay publica al broker. |
| **Inbox Pattern** | Consumidor guarda evento en tabla inbox, deduplica por ID, procesa idempotentemente. |
| **Consumer Group** | Conjunto de consumidores que comparten la carga de un topic/queue. |
| **Consumer Lag** | Diferencia entre el offset mas reciente del topic y el offset del consumer group. |
| **Dead Letter Topic (DLT)** | Topic donde se enrutan eventos que fallaron despues de max retries. |
| **Schema Registry** | Servicio que almacena y valida schemas de eventos contra reglas de compatibilidad. |
| **Idempotency** | Propiedad de una operacion que produce el mismo resultado al ejecutarse multiples veces. |
| **Event Sourcing** | Persistir estado como secuencia de eventos inmutables en lugar de estado actual. |
| **CQRS** | Separacion de modelos de lectura y escritura para optimizacion independiente. |
| **Snapshot** | Captura del estado de un aggregate en un punto para evitar replay completo. |
| **Upcasting** | Transformar eventos historicos a formato nuevo durante replay. |
| **Backpressure** | Mecanismo donde el consumidor senala al productor que reduzca la tasa de envio. |
| **Event Replay** | Reprocesar eventos historicos para reconstruir projections o corregir datos. |

---

## 8. Referencias Cruzadas con Otras Disciplinas

| Disciplina | Interseccion | Skill Relacionada |
|---|---|---|
| **API Architecture** | AsyncAPI, webhooks, event-driven API surfaces | `metodologia-api-architecture` |
| **Software Architecture** | DDD bounded contexts, aggregate design, module boundaries | `metodologia-software-architecture` |
| **Data Engineering** | CDC pipelines, stream processing, data lake ingestion | `metodologia-data-engineering` |
| **Infrastructure Architecture** | Broker provisioning, cluster sizing, networking | `metodologia-infrastructure-architecture` |
| **Security Architecture** | Event encryption, ACLs, audit trail compliance | `metodologia-security-architecture` |
| **DevSecOps Architecture** | Schema validation en CI/CD, contract tests, deployment gates | `metodologia-devsecops-architecture` |
| **Performance Engineering** | Consumer lag optimization, throughput tuning, latency budgets | `metodologia-performance-engineering` |
| **Observability** | Distributed tracing, consumer metrics, DLQ dashboards | `metodologia-observability` |

---

*© Comunidad MetodologIA — Todos los derechos reservados.*
*Autor: Javier Montano | Actualizado: 13 de marzo de 2026*
