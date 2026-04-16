---
name: query-optimization
author: "Javier Montaño (JM Labs)"
version: "2.0.0"
description: >
  Analyze and optimize database queries: EXPLAIN ANALYZE plan reading, index
  strategies (B-tree, GIN, GiST, partial, composite), N+1 detection in ORM code,
  connection pooling, and query plan regression testing.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
tags: [postgres, query-optimization, explain-analyze, indexes, n-plus-one, pganalyze, connection-pooling]
---

# Query Optimization

> *"The fastest query is the one you never have to run — the second fastest is the one with a covering index."*

## TL;DR

Five-step procedure to systematically identify, analyze, and optimize slow queries:
capturing slow query logs, reading EXPLAIN ANALYZE output, choosing the right index
type, detecting N+1 patterns in ORM code, and preventing regressions.

---

## Step 1 — Capture Slow Queries

### Enable Slow Query Logging (PostgreSQL)

```sql
-- postgresql.conf or ALTER SYSTEM
ALTER SYSTEM SET log_min_duration_statement = '100';  -- Log queries > 100ms
ALTER SYSTEM SET log_line_prefix = '%t [%p]: [%l-1] db=%d,user=%u,app=%a,client=%h ';
SELECT pg_reload_conf();

-- pg_stat_statements — aggregate query stats
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

-- Top 10 slowest queries by total time
SELECT
  round(total_exec_time::numeric, 2) AS total_ms,
  round(mean_exec_time::numeric, 2) AS avg_ms,
  calls,
  round(stddev_exec_time::numeric, 2) AS stddev_ms,
  rows,
  left(query, 100) AS query_snippet
FROM pg_stat_statements
ORDER BY total_exec_time DESC
LIMIT 10;
```

### Identify Problematic Queries in Application Code

```typescript
// Prisma — enable query logging
const db = new PrismaClient({
  log: [
    { level: 'query', emit: 'event' },
    { level: 'warn', emit: 'stdout' },
  ],
});

// Log all queries in development
db.$on('query', (e) => {
  if (e.duration > 100) {
    console.warn(`Slow query (${e.duration}ms):`, e.query);
  }
});
```

---

## Step 2 — Read EXPLAIN ANALYZE Output

```sql
-- Always use EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)
EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)
SELECT u.id, u.email, COUNT(o.id) as order_count
FROM users u
LEFT JOIN orders o ON o.user_id = u.id
WHERE u.created_at > '2024-01-01'
GROUP BY u.id, u.email
ORDER BY order_count DESC
LIMIT 20;
```

### Reading the Plan — Key Signals

| Signal | Meaning | Fix |
|--------|---------|-----|
| `Seq Scan` on large table | No usable index | Add index on filter column |
| `cost=0.00..50000.00` high cost | Planner estimate is expensive | Index or rewrite |
| `rows=1 actual rows=100000` | Bad row estimate | ANALYZE table, update statistics |
| `Hash Join` vs `Nested Loop` | Hash better for large sets; Nested Loop better for small | Usually correct, verify row estimates |
| `Buffers: shared hit=0 read=50000` | All reads from disk | Increase `shared_buffers`, add index |
| `Sort Method: external merge Disk` | Sort spills to disk | Increase `work_mem`, add index for ORDER BY |

### Example: Identifying a Missing Index

```sql
-- Bad plan: Seq Scan on 10M row table
Seq Scan on orders  (cost=0.00..285432.00 rows=1234 width=8)
                    (actual time=0.052..2847.123 rows=1234 loops=1)
  Filter: (user_id = 42 AND status = 'pending')
  Rows Removed by Filter: 9998766

-- Fix: composite index
CREATE INDEX CONCURRENTLY idx_orders_user_status
  ON orders(user_id, status)
  WHERE status IN ('pending', 'processing');  -- Partial index reduces size

-- After index: Index Scan
Index Scan using idx_orders_user_status on orders
  (cost=0.56..12.34 rows=8 width=8)
  (actual time=0.023..0.041 rows=8 loops=1)
  Index Cond: (user_id = 42 AND status = 'pending')
```

---

## Step 3 — Index Strategy Selection

### Index Type Decision Framework

| Use Case | Index Type | Example |
|----------|-----------|--------|
| Equality / range on scalar | B-tree (default) | `WHERE user_id = 42`, `WHERE created_at > ...` |
| Full-text search | GIN | `WHERE to_tsvector('english', body) @@ query` |
| JSONB field search | GIN | `WHERE metadata @> '{"type": "premium"}'` |
| Array contains | GIN | `WHERE tags @> ARRAY['typescript']` |
| Geospatial / PostGIS | GiST | `WHERE location <-> point '(0,0)' < 1` |
| Case-insensitive text | B-tree + `lower()` expression | `lower(email)` |
| Partial (subset of rows) | Partial B-tree | `WHERE deleted_at IS NULL` |
| Multi-column | Composite B-tree | `(user_id, created_at DESC)` |

### Composite Index Column Order Rule

```sql
-- Selectivity rule: most selective first, then range/sort
-- Query: WHERE user_id = ? AND status = ? ORDER BY created_at DESC

-- Correct order: equality columns first, range/sort column last
CREATE INDEX idx_orders_composite ON orders(user_id, status, created_at DESC);

-- Wrong: range column in the middle breaks index use for rest
-- CREATE INDEX bad_idx ON orders(user_id, created_at, status);
```

### Covering Index (Index-Only Scans)

```sql
-- Include all selected columns to avoid heap fetches
CREATE INDEX idx_users_email_covering
  ON users(email)
  INCLUDE (id, name, created_at);

-- Query becomes Index Only Scan — zero heap access
SELECT id, name, created_at FROM users WHERE email = 'user@example.com';
```

---

## Step 4 — N+1 Detection & Resolution

### Detecting N+1 in ORM Code

```typescript
// BAD — N+1: 1 query for users + N queries for each user's posts
const users = await db.user.findMany({ take: 100 });
for (const user of users) {
  const posts = await db.post.findMany({ where: { userId: user.id } });
  // 101 total queries
}

// GOOD — Eager loading with Prisma include
const users = await db.user.findMany({
  take: 100,
  include: {
    posts: {
      select: { id: true, title: true, publishedAt: true },
      where: { published: true },
      orderBy: { publishedAt: 'desc' },
      take: 5,
    },
  },
});
// 2 queries total: users + a JOIN or batched post fetch
```

### Detecting N+1 with Query Counter

```typescript
// middleware/query-counter.ts — development only
let queryCount = 0;
db.$use(async (params, next) => {
  queryCount++;
  const result = await next(params);
  return result;
});

// In tests
beforeEach(() => { queryCount = 0; });
afterEach(() => {
  if (queryCount > 10) {
    console.warn(`Potential N+1: ${queryCount} queries in this test`);
  }
});
```

---

## Step 5 — Connection Pooling & Prevention

### PgBouncer / Prisma Accelerate Setup

```typescript
// prisma/schema.prisma
datasource db {
  provider  = "postgresql"
  url       = env("DATABASE_URL")
  // PgBouncer requires this for prepared statements
  directUrl = env("DIRECT_DATABASE_URL")
}
```

```
# .env
DATABASE_URL=postgresql://user:pass@pgbouncer-host:6432/mydb?pgbouncer=true
DIRECT_DATABASE_URL=postgresql://user:pass@postgres-host:5432/mydb
```

### Query Plan Regression in CI

```sql
-- Store baseline plan for critical queries
-- Compare in CI to catch plan regressions
EXPLAIN (FORMAT JSON, ANALYZE)
SELECT ...
-- Parse JSON output, fail if "Seq Scan" appears on tables > 10k rows
```

---

## Quality Criteria

1. **No Seq Scan on tables > 10k rows** — All filter columns have indexes.
2. **EXPLAIN ANALYZE run before optimizing** — No blind index creation; plan confirms the bottleneck.
3. **N+1 patterns eliminated in ORM** — Eager loading or DataLoader used for relationship traversal.
4. **Composite index column order matches query** — Equality columns before range/sort columns.
5. **`pg_stat_statements` enabled** — Slow query visibility in production.
6. **ANALYZE run after bulk inserts** — Planner statistics kept current for large data loads.
7. **Connection pool configured** — PgBouncer or application pool prevents connection storms.
8. **Partial indexes for soft deletes** — `WHERE deleted_at IS NULL` on most queries; index matches.

---

## Anti-Patterns

- **Adding an index on every column** — Index maintenance overhead slows writes; each index adds ~10-30% overhead per INSERT/UPDATE. Index only what's queried.
- **Creating indexes inside transactions** — `CREATE INDEX CONCURRENTLY` cannot run inside a transaction; causes error or falls back to locking.
- **`SELECT *` in production queries** — Fetches columns not needed; defeats covering indexes; increases network transfer.
- **ORM `.findAll()` without pagination** — Loading entire tables into memory when the user sees 20 rows.
- **`LIKE '%search%'` on large text columns** — Leading wildcard prevents B-tree use; use full-text search with GIN index and `tsvector` instead.
- **Ignoring row count estimates in EXPLAIN** — A plan with `rows=1 actual rows=50000` is a statistics problem that will return to different bad plans after VACUUM.
- **Not using `EXPLAIN ANALYZE` after adding an index** — The planner might still choose a Seq Scan if statistics are stale or the table is small enough.
