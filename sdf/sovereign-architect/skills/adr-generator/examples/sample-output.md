# ADR Generator — Sample Output

## Context
A fintech startup needs to decide on the message broker for their event-driven payment processing pipeline. The team has experience with RabbitMQ but is evaluating Kafka and AWS SNS/SQS.

## Output

# ADR-0017: Message Broker Selection for Payment Events Pipeline

- **Date**: 2026-03-15
- **Status**: Accepted
- **Deciders**: Platform Team, Payments Squad Lead

## Context

The payment processing pipeline currently uses synchronous REST calls between services, causing cascade failures during peak load (Black Friday 2025 saw 12 minutes of partial outage). We need an asynchronous messaging backbone that supports at-least-once delivery, ordered processing per payment ID, and replay capability for reconciliation audits.

## Decision Drivers

| # | Driver | Weight |
|---|--------|--------|
| 1 | Message ordering per partition key | High |
| 2 | At-least-once delivery guarantee | High |
| 3 | Event replay / audit log capability | High |
| 4 | Operational complexity | Medium |
| 5 | Team familiarity | Medium |
| 6 | Cost at 500K messages/day | Low |

## Considered Options

### Option A — Apache Kafka (Confluent Cloud)
- **Pros**: Native partitioned ordering, indefinite retention for replay, proven at scale, rich ecosystem (Kafka Streams, Connect).
- **Cons**: Higher operational complexity if self-hosted, partition rebalancing can cause brief consumer pauses, steeper learning curve for the team.
- **Effort**: 3 weeks for integration + 1 week team training.

### Option B — RabbitMQ (existing)
- **Pros**: Team already proficient, simple to operate, flexible routing via exchanges, low latency for small messages.
- **Cons**: No native event replay without plugin, ordering only within a single queue (not scalable), clustering complexity at high throughput.
- **Effort**: 1 week for new exchange topology.

### Option C — AWS SNS/SQS
- **Pros**: Zero operational overhead (fully managed), native AWS integration, FIFO queues provide ordering, dead-letter queues built in.
- **Cons**: FIFO throughput capped at 3,000 msg/s per queue (300 with deduplication), no native replay, vendor lock-in, message size limit 256 KB.
- **Effort**: 2 weeks for integration.

## Decision Outcome

**Chosen option: Apache Kafka (Confluent Cloud)** — because it is the only option satisfying all three high-weight drivers simultaneously. Confluent Cloud mitigates operational complexity concerns. Team training is a one-time investment that pays dividends across future event-driven services.

## Consequences

### Positive
- Payment events are durably ordered per payment ID via partition keys.
- Full replay capability enables reconciliation audits without a separate audit store.
- Foundation established for future event-sourced services.

### Negative
- 3-week integration timeline delays the Q2 milestone by one sprint.
- Monthly Confluent Cloud cost estimated at $1,200 (vs. $0 for existing RabbitMQ).
- Team requires Kafka training; two engineers allocated for one week.

### Neutral
- RabbitMQ remains in use for non-payment internal notifications (no migration needed).
- Monitoring stack (Datadog) already supports Kafka metrics — no new tooling required.

## Related ADRs
- ADR-0009: Event-Driven Architecture Adoption (superseded partially — this ADR refines broker choice).
- ADR-0012: Observability Stack Selection (related — Datadog integration).
