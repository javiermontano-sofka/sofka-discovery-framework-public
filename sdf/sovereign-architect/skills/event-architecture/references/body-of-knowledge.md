# Event Architecture — Body of Knowledge

## Core Concepts
- **Domain Events**: Immutable facts about something that happened in the domain, named in past tense
- **Event Sourcing**: Persisting state as a sequence of events rather than current state snapshots
- **CQRS (Command Query Responsibility Segregation)**: Separate models for write (command) and read (query) operations
- **Eventual Consistency**: State across services converges to consistency over time, not immediately
- **Schema Registry**: Centralized service managing event schemas with compatibility enforcement
- **Saga Pattern**: Managing distributed transactions as a sequence of local transactions with compensation
- **Outbox Pattern**: Guaranteeing event publication alongside database writes using transactional outbox table

## Patterns
- **Choreography**: Services react to events independently without a central coordinator
- **Orchestration**: Central saga coordinator directs the sequence of steps and handles compensation
- **Event-Carried State Transfer**: Events carry enough data for consumers to avoid callbacks to the producer
- **Inbox Pattern**: Consumer-side deduplication table ensuring idempotent event processing
- **Dead Letter Queue (DLQ)**: Capturing failed events for investigation and manual replay

## Tools & Frameworks
- **Apache Kafka**: Distributed event streaming platform with partitioned, replicated log
- **Confluent Schema Registry**: Avro/JSON/Protobuf schema management with compatibility checks
- **AWS EventBridge / Google Pub/Sub**: Managed event bus services
- **Debezium**: CDC-based outbox pattern implementation for reliable event publishing
- **Axon Framework / Eventuate**: CQRS and event sourcing frameworks for Java/JVM

## References
- Martin Kleppmann — *Designing Data-Intensive Applications* (2017) — Chapters on stream processing
- Chris Richardson — *Microservices Patterns* (2018) — Saga and event-driven chapters
- Vaughn Vernon — *Implementing Domain-Driven Design* (2013) — Domain events and CQRS
- Adam Bellemare — *Building Event-Driven Microservices* (2020)
