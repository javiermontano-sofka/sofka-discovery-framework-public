---
name: event-driven-design
author: JM Labs (Javier Montaño)
description: >
  Designs event-driven architectures using event sourcing, CQRS, and message broker selection.
  Trigger: "event-driven architecture", "event sourcing", "CQRS", "message broker", "pub/sub design".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Event-Driven Design

Architects event-driven systems selecting appropriate messaging patterns, event stores, CQRS projections, and broker topologies for scalable, decoupled, and auditable architectures.

## Guiding Principle

> *"Events are facts. They happened. Design your system around immutable facts, not mutable state."*

## Procedure

### Step 1 — Event Discovery
1. Identify domain events by analyzing business processes ("what happened?" not "what changed?").
2. Classify events: domain events (business), integration events (cross-service), system events (infrastructure).
3. Define event schemas with: event type, timestamp, aggregate ID, payload, metadata (correlation ID, causation ID).
4. Establish an event naming convention: past tense, domain-specific (`OrderPlaced`, `PaymentCaptured`).
5. Produce an event catalog with ownership and consumer mapping.

### Step 2 — Select Messaging Patterns
1. **Pub/Sub**: One producer, many consumers. Best for broadcasting domain events.
2. **Point-to-Point (Queue)**: One producer, one consumer. Best for task distribution.
3. **Request-Reply**: Asynchronous request with a correlated response. Best for async queries.
4. **Event Streaming**: Ordered, durable, replayable log. Best for event sourcing and audit.
5. Select the pattern per event type based on consumer count, ordering requirements, and durability needs.

### Step 3 — Design Event Sourcing & CQRS (if applicable)
1. Determine which aggregates benefit from event sourcing (audit requirements, temporal queries, complex state).
2. Design the event store schema: stream per aggregate, append-only, with snapshots for performance.
3. Define read-model projections: one per query pattern, asynchronously updated from the event stream.
4. Specify the projection rebuild strategy for schema changes or bug fixes.
5. Address idempotency: consumers must handle duplicate events gracefully.

### Step 4 — Broker Selection & Topology
1. Evaluate brokers against requirements: Kafka (streaming), RabbitMQ (routing), SQS/SNS (managed), Pulsar (multi-tenant).
2. Design topic/queue topology: one topic per event type, consumer groups per service.
3. Define dead-letter queue (DLQ) strategy for failed messages.
4. Specify retention policy, partitioning strategy, and consumer group management.
5. Document the monitoring and alerting plan for consumer lag and error rates.

## Quality Criteria
- Every event has a versioned schema with backward-compatible evolution rules.
- Consumers are idempotent — processing the same event twice produces the same result.
- Dead-letter queues are monitored with automated alerts and a reprocessing procedure.
- Event ordering guarantees are explicitly documented per topic/partition.

## Anti-Patterns
- Using events for synchronous request-reply patterns (event-driven RPC).
- Fat events that embed the entire aggregate state instead of just what changed.
- Missing correlation IDs, making it impossible to trace a business process across events.
- Event schema changes that break existing consumers without versioning strategy.
