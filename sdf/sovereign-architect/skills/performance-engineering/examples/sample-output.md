# Performance Engineering — Sample Output

## Context
An API serving 10,000 RPM with p99 latency of 2.5s (target: 500ms) needs performance optimization. The system uses Node.js, PostgreSQL, and Redis.

## Output: Bottleneck Analysis

| # | Bottleneck | Impact | Evidence | Optimization |
|---|-----------|--------|----------|-------------|
| 1 | N+1 query in `/orders` endpoint | 800ms per request | pg_stat: 45 queries per request | Implement DataLoader batching; reduce to 3 queries |
| 2 | Missing DB index on `orders.customer_id + created_at` | 400ms seq scan | EXPLAIN: Seq Scan on orders (rows=2.3M) | Add composite index, expected: 2ms index scan |
| 3 | Connection pool exhaustion | 300ms queue wait | Pool stats: 10 connections, 50 waiting | Increase pool to 25, add connection timeout (5s) |
| 4 | No caching on product catalog | 200ms per call | 95% cache-miss rate; data changes hourly | Redis cache with 5-min TTL; invalidate on update |
| 5 | Synchronous email sending | 150ms blocking | Trace: notification call in request path | Move to async queue (SQS/Bull) |

**Projected improvement**: p99 from 2,500ms to ~350ms (86% reduction)

## Output: Caching Architecture

| Layer | What | Where | TTL | Invalidation | Est. Hit Rate |
|-------|------|-------|-----|-------------|--------------|
| CDN | Static assets, images | CloudFront | 24h | Deploy-triggered purge | 95% |
| CDN | API responses (public) | CloudFront | 60s | Cache-Control headers | 70% |
| App | Product catalog | Redis | 5 min | Event-driven (product.updated) | 90% |
| App | User session data | Redis | 30 min | On logout/update | 85% |
| App | Feature flags | In-memory | 30s | Background polling | 99% |
| DB | Query plan cache | PostgreSQL | Automatic | ANALYZE after bulk operations | 80% |

## Output: Load Test Plan

```
Scenario 1: Baseline (current production traffic)
  Users: 200 concurrent
  Duration: 10 minutes
  Pass criteria: p99 <500ms, error rate <0.1%

Scenario 2: Stress (2x peak)
  Users: ramp 200 → 600 over 5 min, hold 10 min
  Duration: 15 minutes
  Pass criteria: p99 <1s, error rate <1%, no OOM

Scenario 3: Spike (sudden 5x burst)
  Users: 200 steady, spike to 1000 for 60s, back to 200
  Duration: 10 minutes
  Pass criteria: Recovery to baseline p99 within 30s of spike end

Scenario 4: Soak (sustained load)
  Users: 300 concurrent (1.5x baseline)
  Duration: 4 hours
  Pass criteria: No memory leak (RSS stable), no degradation over time
```
