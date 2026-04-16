# Database Architecture — Body of Knowledge

## Core Concepts
- **Normalization**: Organizing data to minimize redundancy (1NF → BCNF), with intentional denormalization for performance
- **ACID Properties**: Atomicity, Consistency, Isolation, Durability — the guarantees of relational transactions
- **CAP Theorem**: A distributed system can provide at most two of: Consistency, Availability, Partition tolerance
- **Indexing**: Data structures (B-tree, hash, GIN, GiST) that accelerate data retrieval at the cost of write overhead
- **Partitioning**: Dividing a table into smaller physical pieces (range, list, hash) for manageability and performance
- **Replication**: Copying data across multiple nodes for availability, read scaling, and disaster recovery
- **Connection Pooling**: Managing a pool of reusable database connections to reduce connection overhead

## Patterns
- **Expand-Contract Migration**: Add new column → backfill → migrate code → remove old column (zero-downtime)
- **Soft Delete**: Mark records as deleted rather than physically removing them (is_deleted flag or deleted_at timestamp)
- **Polymorphic Association**: Single table referencing multiple entity types via type discriminator column
- **Read Replica Routing**: Direct write traffic to primary, read traffic to replicas based on staleness tolerance
- **Sharding**: Horizontal partitioning across multiple database instances by a shard key

## Tools & Frameworks
- **PostgreSQL**: Advanced open-source RDBMS with extensions (PostGIS, pg_cron, pgvector)
- **pganalyze / pg_stat_statements**: PostgreSQL performance analysis and query monitoring
- **Flyway / Liquibase / Atlas**: Database schema migration management tools
- **PgBouncer / ProxySQL**: Connection pooling proxies for PostgreSQL and MySQL
- **Percona Toolkit**: Database administration and performance analysis utilities

## References
- Martin Kleppmann — *Designing Data-Intensive Applications* (2017) — Storage, indexing, and replication chapters
- Markus Winand — *SQL Performance Explained* (2012) — Indexing deep dive
- PostgreSQL Documentation — Partitioning, indexing, and query planning
- Rick Branson — *Scaling Postgres* (2023)
