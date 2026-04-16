# Event-Driven Design — Body of Knowledge

## Core Concepts
- **Domain Event**: An immutable record of something that happened in the business domain, expressed in past tense.
- **Event Sourcing**: Persisting the state of an entity as a sequence of state-changing events rather than storing current state.
- **CQRS (Command Query Responsibility Segregation)**: Separating the write model (commands) from read models (queries) to optimize each independently.
- **Event Stream**: An ordered, append-only log of events for a specific aggregate or topic.
- **Projection (Read Model)**: A denormalized view of data derived by replaying events, optimized for a specific query pattern.
- **Idempotent Consumer**: A consumer that can safely process the same event multiple times without changing the outcome.
- **Correlation ID**: A unique identifier propagated through all events in a business process, enabling end-to-end tracing.
- **Eventual Consistency**: The guarantee that, given enough time without new updates, all read models will converge to the same state.

## Patterns & Practices
- **Outbox Pattern**: Write events to an outbox table in the same transaction as the state change, then relay to the broker asynchronously. Guarantees at-least-once delivery.
- **Inbox Pattern**: Store received events in an inbox table before processing, enabling idempotent consumption via deduplication.
- **Choreography vs. Orchestration**: Choreography lets services react independently to events; orchestration uses a central coordinator (saga orchestrator).
- **Event Schema Registry**: Centralized registry (Confluent Schema Registry, AWS Glue) for managing event schema versions and compatibility.
- **Snapshot Strategy**: Periodically save aggregate state to avoid replaying the entire event history on every load.
- **Competing Consumers**: Multiple instances of a consumer share the workload by partitioning the event stream.

## Tools & Technologies
- **Apache Kafka**: Distributed streaming platform with durable, partitioned, replicated logs.
- **RabbitMQ**: Message broker supporting AMQP, MQTT, STOMP with flexible routing via exchanges.
- **EventStoreDB**: Purpose-built database for event sourcing with built-in projections and subscriptions.
- **AWS EventBridge**: Serverless event bus for routing events between AWS services and SaaS applications.
- **Debezium**: CDC connector that captures database changes and publishes them as events to Kafka.
- **Confluent Schema Registry**: Schema management for Kafka events with Avro, JSON Schema, and Protobuf support.

## References
- Young, G., "Versioning in an Event Sourced System" (Leanpub, 2016).
- Fowler, M., "Event Sourcing" and "CQRS" (martinfowler.com).
- Kleppmann, M., "Designing Data-Intensive Applications" (O'Reilly, 2017) — Chapter 11: Stream Processing.
- Stopford, B., "Designing Event-Driven Systems" (O'Reilly/Confluent, 2018).
