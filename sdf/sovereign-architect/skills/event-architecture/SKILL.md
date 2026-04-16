---
name: event-architecture
author: JM Labs (Javier Montaño)
description: >
  Event catalog design, schema registry management, eventual consistency patterns,
  saga orchestration, and CQRS implementation. Trigger: "event architecture", "event-driven",
  "event catalog", "schema registry", "saga", "CQRS", "eventual consistency".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Event Architecture

Design event-driven architectures: event catalog, schema registry governance, eventual consistency patterns, saga orchestration/choreography, and CQRS implementation.

## Guiding Principle
> *"Events are facts about things that happened — they are immutable, timestamped, and the foundation of systems that embrace eventual consistency as a feature, not a bug."*

## Procedure

### Step 1 — Event Discovery & Catalog
1. Identify domain events from business processes (Event Storming output or codebase analysis)
2. Classify events: domain events, integration events, system events, notification events
3. Define event naming conventions: `{domain}.{entity}.{action}.{version}` (e.g., `orders.order.created.v1`)
4. Create event catalog with schema, producer, consumers, and SLA per event
5. Define event ownership: which team/service is the authoritative producer

### Step 2 — Schema Design & Registry
1. Select schema format: Avro (compact, evolution), JSON Schema (human-readable), Protobuf (performance)
2. Design schema evolution rules: backward, forward, and full compatibility
3. Implement schema registry with validation on produce (reject incompatible schemas)
4. Define schema review and approval process for changes
5. Generate consumer code from schemas for type-safe event handling

### Step 3 — Consistency & Transaction Patterns
1. Identify transactions that span multiple services
2. Select pattern per transaction: saga (orchestration or choreography), outbox, CDC
3. Design compensation logic for each saga step (undo on failure)
4. Implement idempotent consumers with deduplication (event ID + consumer state)
5. Define ordering guarantees: per-partition, per-entity, or global

### Step 4 — CQRS Implementation
1. Identify read/write asymmetries that justify CQRS
2. Design command model: validations, business rules, event emission
3. Design query model: denormalized read stores optimized for access patterns
4. Implement projection logic: event handlers that build read models
5. Design eventual consistency handling: stale reads, optimistic UI, read-your-writes

## Quality Criteria
- Every event in the catalog has a schema, producer, and at least one documented consumer
- Schema evolution tested with backward compatibility checks in CI
- Saga compensation logic tested with failure injection at each step
- Consumer idempotency verified: replaying events produces no side effects

## Anti-Patterns
- Events as remote procedure calls (request/response disguised as events)
- Schema-less events that break consumers on any producer change
- Sagas without compensation logic that leave the system in inconsistent state
- CQRS everywhere, including simple CRUD domains that do not need it
