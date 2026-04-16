# Performance Bottleneck Identifier — Sample Output

## Context
Identifying bottlenecks in a REST API handling 500 req/s with P99 latency of 2.5s (target: 500ms).

## Output

### Latency Breakdown (P99)

| Component | Time | % of Total | Type |
|-----------|------|-----------|------|
| Auth middleware | 15ms | 0.6% | CPU `[HECHO]` |
| Request validation | 8ms | 0.3% | CPU `[HECHO]` |
| **DB query (main)** | **1,200ms** | **48%** | **I/O** `[HECHO]` |
| **External API call** | **800ms** | **32%** | **I/O** `[HECHO]` |
| Business logic | 50ms | 2% | CPU `[HECHO]` |
| Serialization | 120ms | 4.8% | CPU `[HECHO]` |
| Response overhead | 307ms | 12.3% | Mixed `[INFERENCIA]` |

### Primary Bottleneck: Database Query (48% of latency)
- Query joins 4 tables without proper indexing on `orders.customer_id` `[HECHO]`
- Full table scan detected on `order_items` table (2M rows) `[HECHO]`
- **Fix**: Add composite index on `(customer_id, created_at)` — estimated reduction to ~100ms `[INFERENCIA]`

### Secondary Bottleneck: External API Call (32% of latency)
- Sequential call to payment status API blocking the response `[HECHO]`
- **Fix**: Move to async with cached result; return stale data with background refresh — estimated reduction to ~50ms `[INFERENCIA]`

### Theoretical Max Throughput
- Current constraint: DB connection pool (20 connections) x avg query time (200ms) = 100 concurrent requests
- After optimization: 20 connections x 50ms avg = 400 concurrent requests = ~2,000 req/s `[INFERENCIA]`
