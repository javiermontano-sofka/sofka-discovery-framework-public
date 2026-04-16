# Sample Output: Query Optimization Audit

## Performance Profile

- **Source**: pg_stat_statements export from staging [SUPUESTO — direct DB access not available]
- **Top bottleneck**: `SELECT * FROM orders WHERE user_id = $1 AND status = $2` — avg 2847ms [HECHO]
- **Root cause**: Seq Scan on `orders` (10M rows) — no composite index on `(user_id, status)`

---

## EXPLAIN ANALYZE Analysis

```
Seq Scan on orders  (cost=0.00..285432.00 rows=1234 width=8)
                    (actual time=0.052..2847.123 rows=1234 loops=1)
  Filter: (user_id = 42 AND status = 'pending')
  Rows Removed by Filter: 9998766
Planning Time: 0.3 ms
Execution Time: 2847.4 ms
```

**Issues identified**:

1. **[P0] Seq Scan on 10M row table** — PostgreSQL is reading all 10M rows and filtering.
   - No index on `user_id` + `status` combination.
   - `Rows Removed by Filter: 9998766` — 99.98% of rows discarded after reading.

2. **[P1] Row estimate accuracy** — `rows=1234` vs `actual rows=1234` — estimate is accurate here,
   but this means the planner chose Seq Scan intentionally (likely no index at all, or very poor selectivity estimate).

3. **[P2] `SELECT *`** — Fetching all columns (width=8 suggests only a few selected, but verify).

---

## Optimization Plan

| Finding | Fix | Expected Improvement |
|---------|-----|---------------------|
| No composite index on (user_id, status) | `CREATE INDEX CONCURRENTLY idx_orders_user_status ON orders(user_id, status)` | 2847ms → ~0.5ms |
| Frequent status='pending' filter | Consider partial index for hot status values | Additional 20-30% size reduction |
| `SELECT *` pattern | Replace with explicit column list | 10-30% data transfer reduction |

---

## SQL to Apply

```sql
-- Step 1: Create composite index (non-blocking)
CREATE INDEX CONCURRENTLY idx_orders_user_status
  ON orders(user_id, status);

-- Step 2: Verify index is used
EXPLAIN (ANALYZE, BUFFERS)
SELECT id, total_cents, created_at
FROM orders
WHERE user_id = 42 AND status = 'pending'
ORDER BY created_at DESC
LIMIT 20;

-- Expected after index:
-- Index Scan using idx_orders_user_status on orders
--   (cost=0.56..12.34 rows=8 width=28)
--   (actual time=0.023..0.041 rows=8 loops=1)
--   Index Cond: ((user_id = 42) AND (status = 'pending'))
--   Buffers: shared hit=5

-- Step 3: (Optional) Partial index if 'pending' is the dominant filter
CREATE INDEX CONCURRENTLY idx_orders_user_pending
  ON orders(user_id, created_at DESC)
  WHERE status = 'pending';
-- ~5-10x smaller than full index; faster for the common case
```

---

## N+1 Analysis (from codebase scan)

Found in `order.service.ts` line 45-62 [HECHO]:

```typescript
// BEFORE: 1 + N queries (1 for orders + N for each order's customer)
const orders = await db.order.findMany({
  where: { userId, status: 'pending' },
  take: 50,
});

for (const order of orders) {
  const customer = await db.customer.findUnique({ where: { id: order.customerId } });
  // 51 queries total for 50 orders
}
```

```typescript
// AFTER: 2 queries total
const orders = await db.order.findMany({
  where: { userId, status: 'pending' },
  take: 50,
  include: {
    customer: {
      select: { id: true, name: true, email: true },
    },
  },
  orderBy: { createdAt: 'desc' },
});
// 2 queries: SELECT orders + SELECT customers WHERE id IN (...)
```

---

## Additional Index Recommendations

```sql
-- For the ORDER BY created_at DESC pattern (if used frequently)
CREATE INDEX CONCURRENTLY idx_orders_user_created
  ON orders(user_id, created_at DESC)
  WHERE status = 'pending';

-- Covering index to eliminate heap fetch for list queries
CREATE INDEX CONCURRENTLY idx_orders_user_status_covering
  ON orders(user_id, status, created_at DESC)
  INCLUDE (id, total_cents);
-- INCLUDE eliminates table access for SELECT id, total_cents, created_at ... WHERE user_id = x AND status = y
```

---

## Verification Plan

```sql
-- Before optimization: capture baseline
SELECT calls, round(mean_exec_time::numeric, 2) AS avg_ms, total_exec_time
FROM pg_stat_statements
WHERE query LIKE '%FROM orders%'
ORDER BY mean_exec_time DESC;

-- Reset stats
SELECT pg_stat_statements_reset();

-- Run representative queries
-- [wait 15 minutes of normal traffic]

-- After optimization: compare
SELECT calls, round(mean_exec_time::numeric, 2) AS avg_ms, total_exec_time
FROM pg_stat_statements
WHERE query LIKE '%FROM orders%'
ORDER BY mean_exec_time DESC;
```

Expected results:
- `orders WHERE user_id = $1 AND status = $2`: 2847ms → ~0.5ms
- Overall query volume: unchanged
- Database CPU: -30 to -50% (Seq Scan eliminated)

---

## Next Steps

1. Run `CREATE INDEX CONCURRENTLY` during low-traffic window (takes ~5 min for 10M rows).
2. Verify with EXPLAIN ANALYZE that Index Scan is now used.
3. Fix N+1 in `order.service.ts` (separate PR).
4. Enable `pg_stat_statements` in production if not already.
5. Set up alert: `mean_exec_time > 200ms` on any query.
