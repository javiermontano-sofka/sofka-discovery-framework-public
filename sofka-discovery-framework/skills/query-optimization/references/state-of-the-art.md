# State of the Art: Query Optimization (2025-2026)

## Current Landscape

PostgreSQL 16-17 has continued improving query planning, parallelism, and JSON performance.
pgvector and its optimization patterns have become a new category of query optimization.
Observability tools like pganalyze have matured significantly.

## Key 2025-2026 Developments

### PostgreSQL 17 Improvements (2024)

- **MERGE improvements** — Better ON CONFLICT handling for upserts.
- **Incremental sort** — More efficient ORDER BY on pre-sorted subsets.
- **JSON_TABLE()** — SQL standard JSON path queries.
- **Logical replication improvements** — Better failover for read replicas.
- **VACUUM improvements** — Faster vacuuming on large tables.

### pg_stat_io (PostgreSQL 16+)

New view for detailed I/O statistics:
```sql
SELECT backend_type, object, context, reads, writes, extends
FROM pg_stat_io
WHERE reads > 0
ORDER BY reads DESC;
```

### Automatic Vacuum Tuning (Growing Practice)

Per-table autovacuum tuning based on actual data patterns:
```sql
ALTER TABLE large_high_write_table SET (
  autovacuum_vacuum_scale_factor = 0.01,   -- Vacuum at 1% dead tuples (vs 20%)
  autovacuum_analyze_scale_factor = 0.005, -- Analyze at 0.5% new rows
  autovacuum_vacuum_cost_delay = 2         -- Less aggressive throttling
);
```

### pgvector Query Optimization (2024-2025)

Vector similarity queries require specialized optimization:
```sql
-- Set probes at session level for IVFFlat (higher = better recall, slower)
SET ivfflat.probes = 10;

-- Set ef_search for HNSW at query time (higher = better recall, slower)
SET hnsw.ef_search = 100;

-- IMPORTANT: EXPLAIN shows "Index Scan" for vector index
-- Verify the index is used: cost should be much lower than Seq Scan
```

### Connection Pooler Landscape

- **PgBouncer** — Still the standard; PgBouncer 1.23 added improved auth options.
- **Supavisor** (Supabase, 2023) — Cloud-native connection pooler, replaces PgBouncer in Supabase projects.
- **Prisma Accelerate** — Managed connection pool + query cache for Prisma users.
- **pgpool-II** — Load balancing + pooling for HA setups.

### AI-Assisted Query Analysis

Tools like pganalyze now offer AI-powered query explanations:
- Automatic identification of missing indexes.
- Explains query plans in natural language.
- Tracks plan regressions over time (plan history).

## Best Current Practices (2025)

1. **`EXPLAIN (ANALYZE, BUFFERS)`** — Always use BUFFERS to see cache vs. disk I/O.
2. **explain.dalibo.com** — Visualize query plans online; much easier to read than text output.
3. **Cursor pagination over OFFSET** — For any paginated query with more than 10 pages.
4. **`pg_stat_statements` enabled in production** — Continuous slow query visibility.
5. **Prisma Accelerate** for serverless — Prevents connection storms, adds query-level caching.
6. **HNSW index for pgvector** — Default choice; significantly better recall than IVFFlat.

## Performance Benchmarks (2025)

- Index scan vs Seq Scan (10M rows, 1 result): 0.05ms vs 2800ms
- GIN index on JSONB (100k rows): 1ms vs 250ms Seq Scan
- Cursor pagination (page 10000 of 20 items): 0.5ms (keyset) vs 500ms (OFFSET)
- N+1 fix (100 items with related): 2 queries vs 101 queries
- Connection with PgBouncer vs direct (serverless): 2ms vs 50-200ms (cold connection)
