# Database Optimization — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Database performance is one of the highest-leverage optimization targets in any system. A single missing index can degrade response times by orders of magnitude. This document covers index types, query plan analysis, sharding strategies, replication topologies, and connection pooling — the patterns an architect needs when diagnosing or designing a data layer.

## Index Types

### B-Tree Index

The default index type in most relational databases. Stores data in a balanced tree structure. Supports equality (`=`) and range queries (`<`, `>`, `BETWEEN`, `ORDER BY`). Efficient for most workloads. Left-prefix rule applies to composite indexes: an index on `(a, b, c)` supports queries on `a`, `a+b`, `a+b+c` but NOT `b` alone.

### Hash Index

Maps keys to values via hash function. Only supports exact equality (`=`). Constant-time lookup for single values. No range queries, no ordering. PostgreSQL supports hash indexes; MySQL's MEMORY engine uses them. Useful for lookup tables with exact-match queries only.

### GIN (Generalized Inverted Index)

Designed for composite values: arrays, JSONB, full-text search (tsvector). Maps each element within a value to the rows containing it. Excellent for "contains" queries (`@>`, `?`, `@@`). Slower to update than B-tree (must index each element). PostgreSQL-specific.

```sql
CREATE INDEX idx_tags ON articles USING GIN (tags);
SELECT * FROM articles WHERE tags @> ARRAY['postgres', 'performance'];
```

### GiST (Generalized Search Tree)

Supports geometric, geographic, and range data types. Used for PostGIS spatial queries, range types, and nearest-neighbor searches. Supports operators like `&&` (overlap), `@>` (contains), `<->` (distance).

```sql
CREATE INDEX idx_location ON places USING GiST (coordinates);
SELECT * FROM places WHERE coordinates <-> point(40.7, -74.0) < 0.1;
```

### BRIN (Block Range Index)

Stores min/max values per block of physical pages. Extremely compact. Ideal for naturally ordered data (timestamps, sequential IDs). Almost useless if data is randomly distributed. Orders of magnitude smaller than B-tree.

```sql
CREATE INDEX idx_created ON events USING BRIN (created_at);
```

### Partial Index

Indexes only rows matching a condition. Smaller, faster, more focused.

```sql
CREATE INDEX idx_active_users ON users (email) WHERE active = true;
```

### Covering Index (INCLUDE)

Includes non-key columns in the index to enable index-only scans.

```sql
CREATE INDEX idx_orders_customer ON orders (customer_id) INCLUDE (total, status);
```

## Query Plan Analysis

### Reading EXPLAIN Output

PostgreSQL:
```sql
EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT) SELECT ...
```

Key indicators:

| Indicator | What It Means | Concern Threshold |
|-----------|--------------|-------------------|
| **Seq Scan** | Full table scan | On tables >10K rows without WHERE |
| **Index Scan** | Using an index | Good — expected behavior |
| **Index Only Scan** | Data served entirely from index | Best — no heap access |
| **Bitmap Index Scan** | Multi-index combination | Good for OR conditions |
| **Nested Loop** | Row-by-row join | Fine for small result sets; N+1 risk for large |
| **Hash Join** | Hash-based join | Good for large joins with equality |
| **Merge Join** | Pre-sorted join | Good when both sides are sorted |
| **Sort** | Sorting in memory or disk | Check `Sort Method: external merge` = disk spill |
| **Buffers: shared hit** | Pages from cache | Higher is better |
| **Buffers: shared read** | Pages from disk | Lower is better |

### Common Query Pathologies

| Pathology | Symptom | Fix |
|-----------|---------|-----|
| **Missing index** | Seq Scan on large table | Add appropriate index |
| **Wrong index** | Index Scan but high cost | Review index column order |
| **N+1 queries** | Same query repeated N times | Use JOIN or batch loading |
| **Over-fetching** | SELECT * when only 2 columns needed | Select only needed columns |
| **Implicit cast** | Index not used due to type mismatch | Match column and query types |
| **Function on indexed column** | `WHERE UPPER(email) = ...` invalidates index | Create functional index or normalize data |
| **High cardinality filter missing** | Filtering on low-cardinality column | Filter on high-cardinality column first |
| **Correlated subquery** | Subquery re-executed per row | Rewrite as JOIN or CTE |

## Sharding Strategies

Sharding distributes data across multiple database instances to scale horizontally.

### Hash Sharding

Apply a hash function to the shard key and distribute rows by hash value. Even distribution if the hash function is uniform. Range queries across shards require scatter-gather. Adding or removing shards requires data redistribution (consistent hashing mitigates this).

### Range Sharding

Partition data by ranges of the shard key (e.g., dates, geographic regions, alphabetical). Natural for time-series data. Hotspot risk: recent data concentrates on one shard. Rebalancing by splitting ranges.

### Geographic Sharding

Partition by geographic region. Data stays close to users (latency benefit). Compliance benefit (data residency requirements). Cross-region queries are expensive.

### Directory-Based Sharding

A lookup table maps each key to its shard. Maximum flexibility. The directory becomes a single point of failure and must be cached and replicated.

### Shard Key Selection Criteria

| Criterion | Good Key | Bad Key |
|-----------|----------|---------|
| Cardinality | High (many unique values) | Low (few values, creates hotspots) |
| Distribution | Uniform across shards | Skewed (80% of data in one shard) |
| Query alignment | Most queries include shard key | Most queries cross shards |
| Growth | Grows with data | Static (one shard fills while others empty) |
| Immutability | Never changes | Changes frequently (requires re-sharding) |

## Replication Topologies

### Single-Leader (Primary-Replica)

One primary handles writes; replicas handle reads. Simple, well-understood. Write scaling is limited to the primary. Replication lag can cause stale reads.

### Multi-Leader

Multiple nodes accept writes. Conflict resolution required (last-write-wins, custom merge logic). Used in multi-datacenter deployments where each datacenter needs a local writer.

### Leaderless (Dynamo-style)

Any node accepts reads and writes. Quorum-based consistency: read from R nodes, write to W nodes, where R + W > N (total replicas). Used by Cassandra, DynamoDB, Riak. Tunable consistency at the cost of complexity.

### Replication Methods

| Method | Description | Lag | Consistency |
|--------|-------------|-----|-------------|
| **Synchronous** | Primary waits for replica ACK | Zero | Strong |
| **Asynchronous** | Primary commits without waiting | Milliseconds to seconds | Eventual |
| **Semi-synchronous** | Wait for at least one replica | Minimal | Between strong and eventual |
| **Logical replication** | Row-level changes, cross-version | Variable | Eventual |
| **Streaming replication** | WAL shipping (PostgreSQL) | Low | Eventual |

## Connection Pooling

### Why Pool Connections

Database connections are expensive: TCP handshake, TLS negotiation, authentication, memory allocation. Without pooling, each request creates a new connection. With pooling, connections are reused from a shared pool.

### Pooling Strategies

| Pooler | Type | Description |
|--------|------|-------------|
| **PgBouncer** | External (PostgreSQL) | Lightweight proxy, supports session/transaction/statement pooling |
| **Pgpool-II** | External (PostgreSQL) | Pooling + load balancing + replication management |
| **HikariCP** | Application-level (JVM) | High-performance JDBC pool, default for Spring Boot |
| **ProxySQL** | External (MySQL) | Query routing, pooling, read/write splitting |
| **RDS Proxy** | Managed (AWS) | Managed pooling for RDS, handles failover |

### Pool Sizing Formula

The Hikari team's guidance: optimal pool size is surprisingly small.

```
pool_size = ((core_count * 2) + effective_spindle_count)
```

For SSDs, effective spindle count is high, but practical limit is usually 10-20 connections per application instance. Over-provisioning creates contention: too many connections competing for CPU, disk, and locks.

### Connection Pool Monitoring

| Metric | Healthy | Problem |
|--------|---------|---------|
| Active connections | < 80% of max | > 90% = pool exhaustion risk |
| Wait time | < 10ms | > 100ms = pool too small or queries too slow |
| Timeout rate | 0% | > 0% = immediate investigation |
| Idle connections | > 20% of pool | 0% = pool saturated |

## Query Optimization Checklist

1. Run EXPLAIN ANALYZE on slow queries
2. Check for missing indexes on WHERE, JOIN, ORDER BY columns
3. Verify index usage (not invalidated by functions or type mismatches)
4. Look for N+1 patterns in application code
5. Check for SELECT * — only select needed columns
6. Review lock contention (pg_stat_activity for PostgreSQL)
7. Check table bloat and schedule VACUUM if needed
8. Verify statistics are up to date (ANALYZE)
9. Review connection pool metrics for saturation
10. Check replication lag if reading from replicas

---

*Sovereign Architect — The database is the foundation. Optimize it first.*
*JM Labs · Javier Montano.*
