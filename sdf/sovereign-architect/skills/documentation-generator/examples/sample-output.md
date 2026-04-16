# Documentation Generator — Sample Output

## Context
Generating an ADR for a decision to adopt event sourcing for the order management domain in an e-commerce platform.

## Output

### ADR-0015: Adopt Event Sourcing for Order Management

**Status**: Accepted
**Date**: 2026-03-15
**Deciders**: Tech Lead, Domain Architect, Backend Team Lead

#### Context

The order management domain currently uses a CRUD-based persistence model with a PostgreSQL `orders` table. We face three recurring problems:

1. **Audit trail gaps**: Business requires complete history of every order state change for compliance. Current approach relies on application-level logging that is inconsistent and incomplete.
2. **State reconstruction**: Customer support frequently needs to understand *how* an order reached its current state, but we only store the final state.
3. **Temporal queries**: Analytics needs to answer questions like "what was the state of all orders at 3pm yesterday?" which is impossible with current snapshot-only storage.

#### Alternatives Considered

| Alternative | Pros | Cons | Verdict |
|-------------|------|------|---------|
| CDC with Debezium | No app changes, captures all DB changes | Captures implementation details not domain events, schema-coupled | Rejected |
| Audit log table | Simple to implement, familiar pattern | Separate from domain model, easily forgotten, not queryable for state reconstruction | Rejected |
| Event Sourcing | Complete history, temporal queries, natural audit trail, enables CQRS | Learning curve, eventual consistency complexity, projection management | **Selected** |
| Bi-temporal tables | SQL-friendly, supports as-of queries | Complex schema, still loses domain intent | Rejected |

#### Decision

Adopt event sourcing for the order management bounded context using an append-only event store backed by PostgreSQL with a JSONB events table. Read models will be maintained via projections into optimized query tables.

Scope is limited to the order aggregate. Other domains continue with CRUD until individual evaluation justifies migration.

#### Consequences

**Positive:**
- Complete, immutable audit trail for every order — compliance requirement satisfied.
- Temporal queries become trivial — replay events to any point in time.
- Domain events become first-class citizens, enabling downstream consumers (analytics, notifications).

**Negative:**
- Team must learn event sourcing patterns — allocate 1 sprint for training and spike.
- Read model projections add operational complexity — need monitoring for projection lag.
- Eventual consistency between write and read models — UI must handle stale reads gracefully.
- Event schema evolution requires careful versioning strategy (upcasters).

**Evidence**: `[CODIGO]` — Order domain analyzed. `[DOC]` — Compliance requirement from SOC2 audit findings.
