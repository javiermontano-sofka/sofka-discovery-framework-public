# Data Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Data architecture decisions outlive application code by years. Database selection, schema design, access patterns, and operational topology directly determine system performance, consistency guarantees, and migration complexity. This document covers relational and non-relational patterns, schema evolution strategies, scaling topologies, and ORM considerations for architects governing data-intensive systems.

## Core Patterns

### SQL vs NoSQL Selection

**Relational (PostgreSQL, MySQL, SQL Server)**: ACID transactions, strong consistency, rich querying via SQL, mature tooling. Best for: transactional systems, complex joins, regulatory compliance requiring consistency guarantees, reporting workloads. PostgreSQL is the default recommendation for most workloads — JSONB support bridges document needs, extensions (PostGIS, pg_trgm, TimescaleDB) cover specialized use cases.

**Document (MongoDB, DynamoDB, Firestore)**: Schema-flexible, nested documents, horizontal scaling. Best for: content management, user profiles, catalogs with variable attributes, rapid prototyping. Trade-off: no joins (application-level joins), transaction support is limited or recent, data duplication is expected.

**Key-Value (Redis, DynamoDB, etcd)**: Fastest reads for simple lookups. Best for: caching, session storage, feature flags, rate limiting, leaderboards. Trade-off: no complex queries, limited data modeling.

**Column-Family (Cassandra, ScyllaDB, HBase)**: Designed for massive write throughput and wide rows. Best for: time-series data, IoT telemetry, event logs at scale. Trade-off: limited query flexibility (design tables around queries), eventual consistency by default.

**Graph (Neo4j, Amazon Neptune)**: Relationship-first data model, efficient traversal queries. Best for: social networks, recommendation engines, fraud detection, knowledge graphs. Trade-off: poor for non-graph queries, smaller ecosystem.

**Decision principle**: Start with PostgreSQL unless you have a specific access pattern that relational databases handle poorly. Most applications that choose NoSQL early end up reimplementing relational features in application code.

### Normalization vs Denormalization

**Normalized (3NF)**: Eliminates data redundancy, ensures update consistency, minimizes storage. Best for write-heavy transactional systems where data integrity is paramount. Standard for OLTP workloads.

**Denormalized**: Duplicates data to optimize read performance, reducing joins. Best for read-heavy reporting, search indexes, materialized views, and NoSQL document models. Trade-off: update anomalies — changing a denormalized field requires updating all copies.

**Hybrid approach**: Normalize the transactional store, denormalize into read models (CQRS pattern), search indexes (Elasticsearch), or data warehouses (Star/Snowflake schema). This is the dominant pattern for systems with mixed workloads.

### Schema Migration Strategies

**Version-controlled migrations**: Sequential, numbered migration files (001_create_users.sql, 002_add_email_index.sql). Tools: Flyway, Liquibase, Alembic, Prisma Migrate, TypeORM migrations, golang-migrate. Every schema change is a committed, reviewable, rollback-capable migration.

**Expand-contract pattern**: For zero-downtime migrations. Phase 1 (expand): add new column/table, deploy code that writes to both old and new. Phase 2 (migrate): backfill existing data. Phase 3 (contract): remove old column/table, deploy code that uses only new. Each phase is independently deployable and rollback-safe.

**Key rules**: Never rename columns in production without expand-contract. Never drop columns without verifying no code references. Always add columns as nullable or with defaults. Test migrations against production-sized datasets — a migration that takes 2ms on dev can lock tables for 30 minutes on production.

### Sharding & Partitioning

**Horizontal partitioning (sharding)**: Distribute rows across multiple database instances by shard key (e.g., tenant_id, user_id hash). Enables horizontal scaling beyond single-node limits. Trade-off: cross-shard queries are expensive, rebalancing shards is complex, join limitations across shards.

**Vertical partitioning**: Split tables by columns into separate tables or databases. Hot columns (frequently queried) separated from cold columns (rarely accessed). Reduces I/O per query.

**Range partitioning**: Partition by value range (date ranges for time-series). Native support in PostgreSQL (declarative partitioning), MySQL. Enables partition pruning — queries touching one date range scan only that partition.

**Shard key selection**: Choose a key with high cardinality and even distribution. Avoid hotspot keys (timestamp-based sharding concentrates writes on the latest shard). Composite keys (tenant_id + entity_id) balance distribution with query locality.

### Replication Topologies

**Primary-replica (read replicas)**: Single write node, multiple read nodes. Read traffic distributed across replicas. Replication lag introduces eventual consistency for reads. Best for read-heavy workloads (10:1+ read/write ratio).

**Multi-primary**: Multiple write nodes with conflict resolution. Useful for multi-region active-active deployments. Trade-off: conflict resolution complexity (last-write-wins, CRDTs, application-level merge).

**Synchronous vs asynchronous replication**: Synchronous guarantees zero data loss (RPO=0) but adds write latency. Asynchronous minimizes latency but risks data loss on primary failure. Semi-synchronous (at least one replica acknowledges) is a common compromise.

### Connection Pooling

**Application-level pooling**: Built into ORMs and drivers (HikariCP for Java, pgBouncer for PostgreSQL, connection pool in Prisma). Reuses database connections across requests. Essential — opening a new TCP connection + TLS handshake + auth per request is prohibitively expensive.

**External pooler (PgBouncer, ProxySQL)**: Sits between application and database, multiplexes many application connections onto fewer database connections. Critical for serverless (Lambda/Cloud Functions) where each invocation might open a connection. Modes: session (safest), transaction (most efficient), statement (most aggressive, breaks multi-statement transactions).

**Sizing formula**: Pool size = ((core_count * 2) + effective_spindle_count). For SSDs, effective_spindle_count is typically 1. A 4-core server should have a pool of roughly 10 connections. More connections does not mean more throughput — contention and context switching degrade performance beyond the optimum.

## Decision Framework

| Access Pattern | Recommended Store | Why |
|---------------|-------------------|-----|
| Transactional CRUD | PostgreSQL / MySQL | ACID, joins, mature |
| Document with variable schema | MongoDB / DynamoDB | Schema flexibility |
| High-write time-series | TimescaleDB / Cassandra | Write throughput, partitioning |
| Full-text search | Elasticsearch / Meilisearch | Inverted index, relevance scoring |
| Graph traversal | Neo4j / Neptune | Relationship queries |
| Caching / sessions | Redis | Sub-millisecond reads |
| Analytics / OLAP | ClickHouse / BigQuery / Redshift | Columnar, aggregation |

## Anti-Patterns

- **Shared database between services**: Multiple services reading/writing the same tables. Creates invisible coupling — schema changes break other services. Each service must own its data.
- **ORM-driven schema**: Letting ORM auto-generate tables without reviewing SQL. Results in missing indexes, suboptimal types, and implicit schema changes. Always review generated migrations.
- **Missing connection pooling**: Especially in serverless — each invocation opens a new connection, exhausting database connection limits under load. Always use an external pooler for serverless.
- **Premature sharding**: Sharding before exhausting vertical scaling (bigger instance, read replicas, caching, query optimization, partitioning). Single-node PostgreSQL handles millions of rows and thousands of QPS with proper indexing.

## Evidence Signals

- `docker-compose.yml` or infrastructure config reveals database choices (postgres, mongo, redis, elasticsearch).
- Migration directory structure (`migrations/`, `db/migrate/`, `prisma/migrations/`) indicates schema management maturity.
- Connection string configuration: look for pool size settings, SSL mode, read replica URLs.
- Query patterns in code: N+1 queries (loop inside a loop hitting the database), missing pagination, `SELECT *` without column pruning.
- Index coverage: run `EXPLAIN ANALYZE` on critical queries. Sequential scans on large tables indicate missing indexes.

---
*Sovereign Architect RAG Priming · JM Labs*
