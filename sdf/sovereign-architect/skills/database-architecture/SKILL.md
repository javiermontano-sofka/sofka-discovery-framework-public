---
name: database-architecture
author: JM Labs (Javier Montaño)
description: >
  Schema design patterns, indexing strategies, partitioning, replication topologies,
  migration procedures, and performance tuning. Trigger: "database architecture",
  "schema design", "indexing", "partitioning", "replication", "database migration".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Database Architecture

Design and optimize database systems: schema patterns, indexing strategies, partitioning schemes, replication topologies, migration procedures, and performance tuning.

## Guiding Principle
> *"The database is the gravity well of your system — schema decisions are the hardest to change, so invest the most thought where the cost of change is highest."*

## Procedure

### Step 1 — Schema Design
1. Identify entities, relationships, and cardinality from domain model
2. Select modeling approach: normalized (OLTP), denormalized (OLAP), document, graph
3. Design primary keys: natural vs. surrogate, UUID vs. sequential
4. Define constraints: foreign keys, unique, check, not-null
5. Apply schema patterns: soft delete, audit columns, polymorphic associations, EAV (when justified)

### Step 2 — Indexing Strategy
1. Analyze query patterns: most frequent queries, filter columns, join paths
2. Design covering indexes for critical queries
3. Evaluate composite index column order based on selectivity and access patterns
4. Identify candidates for partial indexes, expression indexes, and GIN/GiST indexes
5. Establish index monitoring: unused index detection, missing index recommendations

### Step 3 — Partitioning & Replication
1. Evaluate partitioning need based on table size and query patterns
2. Select partitioning strategy: range (time), list (region), hash (tenant)
3. Design partition management: creation, pruning, archival automation
4. Select replication topology: primary-replica, multi-primary, synchronous/async
5. Define read routing: read replicas for reporting, primary for writes

### Step 4 — Migration & Tuning
1. Design schema migration strategy: forward-only, reversible, expand-contract
2. Implement zero-downtime migration patterns for production changes
3. Establish connection pooling configuration: pool size, timeout, idle management
4. Define query performance baselines and monitoring thresholds
5. Design capacity planning: storage growth projections, IOPS requirements, scaling triggers

## Quality Criteria
- Schema normalized to at least 3NF for OLTP with documented denormalization decisions
- Critical queries have covering indexes with execution plans verified
- Partition strategy tested with 2x current data volume
- Schema migrations tested in staging with rollback procedures verified

## Anti-Patterns
- Adding indexes for every slow query without analyzing root cause
- Partitioning tables that do not need it (overhead without benefit)
- Schema migrations with data loss potential and no rollback plan
- Connection pool exhaustion from missing timeout or pool size configuration
