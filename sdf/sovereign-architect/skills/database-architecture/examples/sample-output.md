# Database Architecture — Sample Output

## Context
A PostgreSQL database (500GB, 200M rows in the largest table) powering a multi-tenant SaaS application with growing query latency on reporting endpoints.

## Output: Schema Review Findings

| # | Finding | Severity | Table | Recommendation |
|---|---------|----------|-------|---------------|
| 1 | Missing FK constraint | High | `orders.customer_id` | Add FK to `customers(id)` with ON DELETE RESTRICT |
| 2 | No index on filter column | High | `orders.status` | Add partial index: `WHERE status IN ('pending', 'processing')` |
| 3 | UUID v4 as PK | Medium | `events` | Consider UUIDv7 for sortable, index-friendly primary keys |
| 4 | Unbounded text columns | Low | `orders.notes` | Add CHECK constraint for max length |
| 5 | Missing audit columns | Medium | `products` | Add `created_at`, `updated_at` with triggers |
| 6 | N+1 query pattern | High | `orders` + `order_items` | Add composite index on `order_items(order_id, product_id)` |

## Output: Indexing Strategy

| Table | Index | Type | Columns | Rationale |
|-------|-------|------|---------|-----------|
| `orders` | `idx_orders_tenant_created` | B-tree | `(tenant_id, created_at DESC)` | Primary query filter for tenant-scoped reporting |
| `orders` | `idx_orders_status_partial` | Partial B-tree | `(status) WHERE status NOT IN ('completed', 'cancelled')` | Active order queries (5% of rows) |
| `order_items` | `idx_order_items_covering` | B-tree | `(order_id, product_id) INCLUDE (quantity, unit_price)` | Covering index for order detail queries |
| `events` | `idx_events_tenant_type_time` | B-tree | `(tenant_id, event_type, created_at)` | Analytics queries |
| `users` | `idx_users_email_lower` | Expression | `(lower(email))` | Case-insensitive login lookup |

**Indexes to drop**: `idx_orders_old_status` (superseded), `idx_events_unused` (0 scans in 90 days)

## Output: Partitioning Plan

```
Table: events (200M rows, 300GB, growing 5M rows/month)
Strategy: Range partition by created_at (monthly)

Current:  events (single table, sequential scan on reporting queries)
Target:
  events (parent)
  ├── events_2024_01
  ├── events_2024_02
  ├── ...
  ├── events_2025_12
  └── events_default

Automation:
  - pg_partman creates partitions 3 months ahead
  - Partitions older than 12 months detached and moved to cold storage
  - Reporting queries automatically pruned to relevant partitions

Expected improvement: 90% reduction in scan size for time-bounded queries
```
