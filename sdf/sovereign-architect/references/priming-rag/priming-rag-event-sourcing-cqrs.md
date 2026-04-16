# Event Sourcing & CQRS — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Event Sourcing stores state as a sequence of immutable events rather than mutable current state. CQRS (Command Query Responsibility Segregation) separates write models from read models. They are often used together but are independent patterns. This document covers event stores, projections, snapshots, consistency patterns, and practical decision criteria.

## Event Sourcing Fundamentals

### Core Concepts

- **Event**: An immutable fact that something happened. Past tense: `OrderPlaced`, `PaymentProcessed`, `ItemShipped`. Contains data needed to reconstruct the state change.
- **Event Stream**: Ordered sequence of events for a single aggregate. The stream IS the source of truth.
- **Aggregate**: The consistency boundary that produces events. To rebuild current state, replay all events in the stream from the beginning (or from a snapshot).
- **Event Store**: Append-only database optimized for writing and reading event streams.

### Event Structure

```
{
  "eventId": "uuid",
  "streamId": "order-12345",
  "eventType": "OrderPlaced",
  "data": { "customerId": "c-1", "items": [...], "total": 150.00 },
  "metadata": { "correlationId": "...", "causationId": "...", "userId": "..." },
  "version": 1,
  "timestamp": "2026-03-17T10:00:00Z"
}
```

### Benefits

- Complete audit trail by default — every state change is recorded
- Temporal queries — reconstruct state at any point in time
- Event replay — rebuild read models, fix bugs retroactively
- Natural fit for event-driven architectures
- Debugging: replay events to reproduce exact state

### Costs

- Increased storage (every event persisted, not just current state)
- Complexity: developers must think in events, not CRUD
- Schema evolution of events is non-trivial
- Read model lag (eventual consistency)
- Snapshot management for aggregates with many events

## Event Store Technologies

| Store | Type | Strengths | Considerations |
|-------|------|-----------|----------------|
| **EventStoreDB** | Purpose-built | Native projections, subscriptions, built for ES | Smaller community, operational learning curve |
| **DynamoDB** | General (adapted) | Serverless, scales infinitely, AWS-native | Must design partition keys carefully; no native projections |
| **PostgreSQL** | General (adapted) | Teams already know it, ACID, JSON support | Not optimized for append-only; requires careful indexing |
| **Kafka** | Log-based | High throughput, built-in pub/sub, retention | Not a true event store (no stream-per-aggregate natively) |
| **Marten** | Library (.NET) | PostgreSQL-backed, .NET-native, projections included | .NET ecosystem only |
| **Axon Server** | Purpose-built (Java) | Java/Kotlin native, saga support, event routing | JVM ecosystem only |

### DynamoDB Event Store Pattern

```
PK: stream#{streamId}
SK: v#{version}
Data: { eventType, data, metadata, timestamp }
```

- Optimistic concurrency via conditional writes on version
- Global Secondary Index on eventType for cross-stream projections
- TTL for archival of old events to S3

### PostgreSQL Event Store Pattern

```sql
CREATE TABLE events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  stream_id TEXT NOT NULL,
  version INTEGER NOT NULL,
  event_type TEXT NOT NULL,
  data JSONB NOT NULL,
  metadata JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE (stream_id, version)
);

CREATE INDEX idx_events_stream ON events (stream_id, version);
CREATE INDEX idx_events_type ON events (event_type);
```

## Projections

Projections transform event streams into read-optimized views. They subscribe to events and update denormalized read models.

### Projection Types

| Type | Description | Use Case |
|------|-------------|----------|
| **Inline** | Updated synchronously during command processing | Strong consistency needed, simple aggregates |
| **Async** | Updated by background process consuming events | Eventual consistency acceptable, complex views |
| **Catch-up** | Replays all events from the beginning | Rebuilding after schema change or bug fix |
| **Live** | Subscribes only to new events going forward | Real-time dashboards, notifications |

### Projection Patterns

**Single-stream projection**: One read model per aggregate stream. Simple, fast. Example: order status view from order events.

**Cross-stream projection**: Combines events from multiple streams. More complex, requires ordering guarantees. Example: customer dashboard showing orders + payments + support tickets.

**Partitioned projection**: Multiple instances process different partitions. Horizontal scaling for high-volume event processing.

### Projection Rebuild Strategy

When a projection has a bug or schema change:
1. Drop the read model (table, collection)
2. Reset the projection's checkpoint to 0
3. Replay all events through the corrected projection logic
4. Once caught up, switch traffic to the rebuilt model

Critical: projections must be idempotent — replaying the same event twice produces the same result.

## Snapshots

For aggregates with many events (thousands+), replaying from the beginning becomes slow. Snapshots periodically capture aggregate state.

### Snapshot Strategy

```
Load aggregate:
1. Find latest snapshot (if any)
2. Load events after snapshot version
3. Apply events to snapshot state
4. Return current state
```

**When to snapshot**: Every N events (e.g., every 100), or when replay time exceeds a threshold (e.g., 100ms).

**Storage**: Same event store (special event type) or separate snapshot store.

**Versioning**: Snapshots must be versioned. When aggregate logic changes, old snapshots may need migration or invalidation.

## CQRS (Command Query Responsibility Segregation)

### Core Concept

Separate the write model (commands) from the read model (queries). The write side enforces business invariants and produces events. The read side serves denormalized projections optimized for display.

### Without Event Sourcing

CQRS can work with traditional databases:
- Write model: normalized tables with business validation
- Read model: materialized views, denormalized tables, or search indexes
- Sync mechanism: database triggers, change data capture (CDC), or application-level events

### With Event Sourcing

The natural pairing:
- Write side: event-sourced aggregates (append events)
- Read side: projections built from event streams
- Sync: projections subscribe to event streams

### Command Handling

```
Command → Validate → Load Aggregate → Execute Business Logic → Emit Events → Persist Events
```

Commands are imperative: `PlaceOrder`, `CancelOrder`, `ProcessPayment`. They can be rejected if business rules are violated. A command handler loads the aggregate, calls domain logic, and persists resulting events.

### Query Handling

```
Query → Read Model → Return Data
```

Queries are always served from denormalized read models. They never touch the write model. This allows independent scaling: read replicas, caching, search engines.

## Eventual Consistency Patterns

### Causal Consistency

Ensure that events caused by the same command are processed in order. Use correlation IDs and causation IDs to track event chains.

### Read-Your-Own-Writes

After a command succeeds, the client may query before the projection updates. Solutions:
- Return the new state directly in the command response
- Client-side optimistic update
- Poll the read model until version catches up
- Use a "pending" state in the UI

### Idempotency

Every event handler and projection must handle duplicate delivery gracefully. Use event IDs for deduplication. At-least-once delivery with idempotent handlers gives effectively-once semantics.

### Compensating Events

When something goes wrong in an eventually consistent system, emit compensating events to undo the effect:
- `OrderPlaced` → `OrderCancelled`
- `PaymentCharged` → `PaymentRefunded`
- `InventoryReserved` → `InventoryReleased`

## Schema Evolution

Events are immutable — you cannot change past events. Strategies for evolving event schemas:

| Strategy | Description | Trade-off |
|----------|-------------|-----------|
| **Upcasting** | Transform old events to new schema on read | No data migration, logic in code |
| **Versioned types** | `OrderPlacedV1`, `OrderPlacedV2` | Explicit, but proliferates types |
| **Weak schema** | Use flexible formats (JSON) with optional fields | Easy evolution, harder validation |
| **Copy-transform** | Migrate events to new store with new schema | Clean, but expensive and risky |

Best practice: design events with evolution in mind. Use optional fields, avoid removing fields, version from day one.

## Anti-Patterns

| Anti-Pattern | Problem | Fix |
|-------------|---------|-----|
| **CRUD events** | `OrderUpdated` with full state — loses intent | Use specific events: `OrderItemAdded`, `OrderShipped` |
| **Giant aggregates** | Too many events, slow replay, contention | Split into smaller aggregates, use sagas |
| **Projection as source of truth** | Reading from projections to make write decisions | Always load aggregate from event stream for writes |
| **Missing correlation** | Cannot trace event chains across services | Always include correlationId and causationId |
| **Snapshot addiction** | Snapshotting every event | Only snapshot when replay performance degrades |

## Decision Criteria

| Factor | Event Sourcing Justified | Traditional CRUD Sufficient |
|--------|-------------------------|---------------------------|
| Audit requirements | Regulatory audit trail required | No audit requirements |
| Temporal queries | Need to query state at any point in time | Only current state matters |
| Complex domain | Rich domain logic with many state transitions | Simple CRUD operations |
| Event-driven integration | System already event-driven | Request-response sufficient |
| Read/write asymmetry | 100:1 read ratio, different query patterns | Balanced read/write, simple queries |
| Team experience | Team has DDD and event-driven experience | Team is CRUD-focused |

---

*Sovereign Architect — State is a sequence of facts, not a mutable snapshot.*
*JM Labs · Javier Montano.*
