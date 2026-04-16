# Body of Knowledge: Query Optimization

## Core Concepts

### EXPLAIN ANALYZE Output Structure

PostgreSQL's query planner outputs a tree of plan nodes. Reading it from bottom to top:

```
EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT) SELECT ...

Limit  (cost=0.56..8.31 rows=1 width=100)
       (actual time=0.052..0.053 rows=1 loops=1)
  -> Index Scan using idx_users_email on users
       (cost=0.56..8.31 rows=1 width=100)
       (actual time=0.050..0.051 rows=1 loops=1)
     Index Cond: (email = 'user@example.com'::text)
     Buffers: shared hit=3
Planning Time: 0.150 ms
Execution Time: 0.112 ms
```

**Key fields to read**:
- `cost=startup..total`: Planner's estimated cost (arbitrary units, relative to each other).
- `actual time=first..last`: Real execution time in ms. `first` = time to first row, `last` = total.
- `rows=N`: Planner's row estimate. If far from actual, statistics may be stale.
- `loops=N`: How many times this node was executed (× its time for total).
- `Buffers: shared hit=N read=N`: Cache hits vs. disk reads. `read` means disk I/O.

**Red flags**:
- `Seq Scan` on table with `rows=millions`: Index missing.
- `actual rows` >> `rows` (estimate): Run `ANALYZE tablename`.
- `Buffers: read=50000`: Heavy disk I/O; consider index or `shared_buffers` increase.
- `Sort Method: external merge Disk`: Sort spilled to disk; increase `work_mem`.
- `Hash Batches: 8` (> 1): Hash join spilled to disk; increase `work_mem`.

### Index Types Deep Dive

**B-tree** (default): Balanced tree, good for equality, range, ORDER BY, NULL checks.
```sql
CREATE INDEX idx_orders_created ON orders(created_at DESC);
-- Supports: WHERE created_at > '2024-01-01'
-- Supports: ORDER BY created_at DESC
-- Supports: WHERE created_at IS NULL
```

**GIN** (Generalized Inverted Index): Good for full-text search, JSONB, arrays.
```sql
-- Full-text search
CREATE INDEX idx_articles_body_fts ON articles
  USING GIN(to_tsvector('english', body));
SELECT * FROM articles
WHERE to_tsvector('english', body) @@ plainto_tsquery('english', 'search term');

-- JSONB containment
CREATE INDEX idx_products_meta ON products USING GIN(metadata);
SELECT * FROM products WHERE metadata @> '{"category": "electronics"}';

-- Array containment
CREATE INDEX idx_posts_tags ON posts USING GIN(tags);
SELECT * FROM posts WHERE tags @> ARRAY['typescript'];
```

**GiST** (Generalized Search Tree): Good for ranges, geometric data, PostGIS.
```sql
-- Range exclusion (no overlapping time ranges)
CREATE INDEX idx_bookings_period ON bookings USING GIST(tstzrange(start_at, end_at));
EXCLUDE USING GIST (room_id WITH =, tstzrange(start_at, end_at) WITH &&);
```

**BRIN** (Block Range Index): Very small index for sequential/correlated data.
```sql
-- Time-series data inserted in order
CREATE INDEX idx_events_created_brin ON events USING BRIN(created_at);
-- 100x smaller than B-tree, good for data warehousing
-- Bad for random access patterns
```

### N+1 Pattern Detection

N+1 occurs when a loop executes one query per iteration instead of one query total.

```typescript
// PATTERN: N+1
// 1 query for posts + N queries for each post's author
const posts = await db.post.findMany({ take: 100 });
const postsWithAuthors = await Promise.all(
  posts.map(post => db.user.findUnique({ where: { id: post.authorId } }))
);
// Result: 101 queries

// PATTERN: 1+1 (correct)
const posts = await db.post.findMany({
  take: 100,
  include: { author: { select: { id: true, name: true, avatarUrl: true } } },
});
// Result: 2 queries (posts + JOIN or batched select on authors)
```

**Detection methods**:
1. Prisma: `log: [{ level: 'query', emit: 'event' }]` — count queries per request.
2. Django: Django Debug Toolbar.
3. Rails: Bullet gem.
4. Manual: Log query count; alert if > threshold per request.

### Statistics and the Query Planner

PostgreSQL's planner uses statistics (from `ANALYZE`) to estimate row counts:

```sql
-- Check when table was last analyzed
SELECT relname, last_analyze, last_autoanalyze, n_live_tup, n_dead_tup
FROM pg_stat_user_tables
WHERE relname = 'orders';

-- Manual analyze (after bulk insert)
ANALYZE orders;

-- Increase statistics target for better estimates on skewed data
ALTER TABLE orders ALTER COLUMN status SET STATISTICS 200;  -- default 100
ANALYZE orders;
```

### Connection Pooling Architecture

```
Application Instances (n)
  ↓ (n × max_pool_size connections)
PgBouncer (Transaction Pooling)
  ↓ (configurable pool, e.g., 20-100 connections)
PostgreSQL (max_connections = 100-500)
```

Without pooling: 100 application pods × 10 connections each = 1000 connections to Postgres.
Postgres default `max_connections = 100` — this crashes.

With PgBouncer transaction pooling:
- 100 pods × 10 connections = 1000 to PgBouncer.
- PgBouncer maintains 20 connections to Postgres.
- Transaction-level pooling: connection returned to pool between transactions.

```
# PgBouncer pgbouncer.ini
[databases]
mydb = host=postgres port=5432 dbname=mydb

[pgbouncer]
pool_mode = transaction
max_client_conn = 1000
default_pool_size = 20
```

### `pg_stat_statements` for Production Monitoring

```sql
-- Enable (in postgresql.conf or dynamically)
CREATE EXTENSION pg_stat_statements;

-- Top queries by total time
SELECT
  round(total_exec_time::numeric, 2) AS total_ms,
  round((total_exec_time / calls)::numeric, 2) AS avg_ms,
  calls,
  round(rows::numeric / calls, 2) AS avg_rows,
  left(query, 120) AS query
FROM pg_stat_statements
ORDER BY total_exec_time DESC
LIMIT 20;

-- Reset stats (after optimization, to measure improvement)
SELECT pg_stat_statements_reset();
```

## Common Patterns

### Pagination Strategies

```sql
-- OFFSET pagination (simple, but slow for large offsets)
SELECT * FROM posts ORDER BY created_at DESC LIMIT 20 OFFSET 100000;
-- Problem: DB reads 100020 rows and discards 100000

-- Cursor-based pagination (keyset pagination, fast for any offset)
SELECT * FROM posts
WHERE (created_at, id) < ('2024-01-01', 'uuid-of-last-seen')
ORDER BY created_at DESC, id DESC
LIMIT 20;
-- Index: CREATE INDEX ON posts(created_at DESC, id DESC);
-- Always O(log n) regardless of page depth
```

### Query Plan Forcing (Last Resort)

```sql
-- Force index use when planner makes wrong choice (rare, investigate root cause first)
SET enable_seqscan = OFF;  -- Session level
SELECT * FROM large_table WHERE ...;
SET enable_seqscan = ON;

-- Permanent: use pg_hint_plan extension
/*+ IndexScan(large_table idx_name) */
SELECT * FROM large_table WHERE ...;
```

## References

- [PostgreSQL EXPLAIN Documentation](https://www.postgresql.org/docs/current/sql-explain.html)
- [use-the-index-luke.com](https://use-the-index-luke.com/) — Best practical index guide
- [pganalyze.com/docs](https://pganalyze.com/docs) — Commercial query analysis
- [explain.dalibo.com](https://explain.dalibo.com/) — EXPLAIN ANALYZE visualizer
