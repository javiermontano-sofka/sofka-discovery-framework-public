# Scenario Analysis — Sample Output

## Context
Selecting a database for a new event-driven microservice that handles 50K events/sec with 90-day retention. Options: PostgreSQL, Apache Kafka + ClickHouse, and ScyllaDB.

## Output: Decision Criteria & Weights

| # | Criterion | Weight | Rationale |
|---|-----------|--------|-----------|
| 1 | Write throughput (50K events/sec) | 25 | Core requirement, non-negotiable threshold |
| 2 | Query performance (analytical) | 20 | Real-time dashboards on event data |
| 3 | Operational complexity | 20 | Team of 4, limited ops bandwidth |
| 4 | Team expertise | 15 | Reduce ramp-up time, minimize risk |
| 5 | Cost (infrastructure) | 10 | Budget-sensitive but not primary driver |
| 6 | Ecosystem & tooling | 10 | Integration with existing stack |

## Output: Weighted Decision Matrix

| Criterion | Weight | PostgreSQL | Kafka + ClickHouse | ScyllaDB |
|-----------|--------|-----------|-------------------|----------|
| Write throughput | 25 | 2 `[BENCHMARK]` | 5 `[BENCHMARK]` | 5 `[BENCHMARK]` |
| Query performance | 20 | 3 `[BENCHMARK]` | 5 `[BENCHMARK]` | 2 `[DOC]` |
| Operational complexity | 20 | 5 `[INFERENCE]` | 2 `[INFERENCE]` | 3 `[DOC]` |
| Team expertise | 15 | 5 `[CODE]` | 3 `[INFERENCE]` | 1 `[ASSUMPTION]` |
| Cost | 10 | 4 `[DOC]` | 3 `[DOC]` | 3 `[DOC]` |
| Ecosystem | 10 | 5 `[CODE]` | 4 `[CODE]` | 2 `[DOC]` |
| **Weighted Score** | **100** | **3.55** | **3.85** | **2.85** |

## Output: Sensitivity Analysis

| Scenario | Winner | Margin |
|----------|--------|--------|
| Base case (weights as defined) | Kafka + ClickHouse | +0.30 over PostgreSQL |
| If ops complexity weight +10 (from 20→30) | PostgreSQL | +0.05 over Kafka+CH |
| If team expertise weight +10 (from 15→25) | PostgreSQL | +0.20 over Kafka+CH |
| If write throughput weight +10 (from 25→35) | Kafka + ClickHouse | +0.60 over PostgreSQL |

**Decision boundary**: The decision flips to PostgreSQL if operational complexity or team expertise become significantly more important than throughput. This is a close decision.

## Output: Recommendation

**Recommended**: Kafka + ClickHouse

**Rationale**: Meets the non-negotiable write throughput requirement with headroom (Kafka handles 500K+ events/sec). ClickHouse provides sub-second analytical queries on event data. Higher operational complexity mitigated by managed services (Confluent Cloud + ClickHouse Cloud).

**Trade-offs accepted**:
- Higher operational complexity (mitigated by managed services)
- Team ramp-up needed on ClickHouse (mitigated by 2-week training sprint)
- Two systems to manage instead of one (mitigated by clear separation of concerns)

**Reversibility**: Medium. Kafka is a good long-term investment. ClickHouse could be replaced by another OLAP engine without changing the ingestion layer.
