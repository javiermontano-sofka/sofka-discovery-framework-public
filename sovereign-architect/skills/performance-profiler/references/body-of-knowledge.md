# Performance Profiler — Body of Knowledge

## Core Concepts
- **N+1 query problem**: Loading a parent with N children makes 1 + N queries instead of 2; most common ORM performance issue `[HECHO]`
- **Algorithmic complexity**: O(1) < O(log n) < O(n) < O(n log n) < O(n^2) < O(2^n) — choose the right data structure for the access pattern
- **Connection pooling**: Reusing database/HTTP connections avoids handshake overhead; pools must be sized to workload
- **Memory pressure**: Garbage collection pauses increase with heap size; large object allocation on hot paths triggers GC thrashing
- **Tail latency**: P99 latency matters more than average; a few slow requests indicate systemic issues
- **Backpressure**: Systems must handle load exceeding capacity gracefully; unbounded queues lead to OOM

## Patterns & Practices
- **Eager loading**: Fetch related data in a single query using JOINs or batch loading
- **Read-through caching**: Cache-aside pattern with TTL; reduces database load for read-heavy workloads
- **Connection pool tuning**: Pool size = (number of physical cores * 2) + effective spindle count (PostgreSQL formula)
- **Pagination**: Cursor-based for real-time feeds, keyset for ordered data, offset for simple cases
- **Debouncing & throttling**: Reduce frequency of expensive operations triggered by user events
- **Lazy evaluation**: Defer computation until the result is needed; avoid computing values that may never be used

## Tools & Technologies
- **APM**: Datadog, New Relic, Dynatrace, Elastic APM
- **Profilers**: Chrome DevTools, py-spy, pprof (Go), async-profiler (JVM)
- **Query analysis**: EXPLAIN ANALYZE, pg_stat_statements, slow query logs
- **Load testing**: k6, Locust, Artillery, Gatling

## References
- Brendan Gregg — "Systems Performance" (resource utilization methodology)
- Martin Kleppmann — "Designing Data-Intensive Applications" (caching, replication)
- PostgreSQL documentation — Query planning and optimization
- Google Web Vitals — User-centric performance metrics
