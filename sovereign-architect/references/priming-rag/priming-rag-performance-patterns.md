# Performance Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Performance is a feature. Slow systems lose users, increase infrastructure costs, and compound technical debt. Performance optimization must be data-driven — measure before optimizing, optimize the bottleneck, and verify improvement. This document covers profiling techniques, multi-layer caching, frontend optimization, database tuning, and connection management for architects responsible for system performance.

## Core Patterns

### Profiling Strategy

**Measure first, optimize second**: Never optimize based on intuition. Profile the actual workload under realistic conditions. The bottleneck is almost never where you think it is.

**Backend profiling**: CPU profiling (flame graphs via async-profiler for JVM, py-spy for Python, pprof for Go, perf for Linux-level). Memory profiling (heap dumps, allocation tracking). I/O profiling (strace for syscalls, database query logging with execution plans). APM tools (Datadog, New Relic, Dynatrace) provide continuous profiling in production.

**Frontend profiling**: Chrome DevTools Performance tab (main thread blocking, layout shifts, paint timing). Lighthouse for synthetic audits. Web Vitals (LCP, FID/INP, CLS) for user-centric metrics. Real User Monitoring (RUM) via Datadog, Sentry, or web-vitals library for production data.

**Load testing**: Simulate realistic traffic patterns, not just peak RPS. Tools: k6 (JavaScript-based, modern), Locust (Python), Gatling (Scala/Java), Artillery (Node.js). Test against production-like data volumes. Identify breaking points: at what concurrency does P99 latency exceed SLO?

### Multi-Layer Caching

**Browser cache**: HTTP cache headers (Cache-Control, ETag, Last-Modified). Immutable assets (hashed filenames) get `max-age=31536000, immutable`. HTML pages get `no-cache` (revalidate every time) or short max-age with stale-while-revalidate.

**CDN cache**: Cache static assets and semi-static API responses at edge locations. CloudFront, Cloudflare, Fastly. Cache key includes URL, query params, and selected headers. Purge strategies: tag-based purging (Fastly/Cloudflare), path-based invalidation (CloudFront). TTL balances freshness vs origin load.

**Application cache (Redis/Memcached)**: Cache expensive computations, database query results, and external API responses. Redis for structured data (hashes, sorted sets, streams). Memcached for simple key-value with multi-threaded performance. Cache invalidation strategies: TTL-based (simplest), event-based (publish cache invalidation on write), version-based (cache key includes data version).

**In-process cache**: Caffeine (JVM), node-cache/lru-cache (Node.js), cachetools (Python). Zero network overhead. Best for hot, frequently-read, rarely-changing data (config, feature flags, lookup tables). Size-bounded with LRU eviction. Invalidation via TTL or pub/sub notification.

**Cache hierarchy**: Request hits browser cache, then CDN, then application cache, then database. Each layer reduces load on the next. Cache-aside at application layer with write-through for consistency-sensitive data.

### Frontend Performance Optimization

**Code splitting**: Split JavaScript bundles by route (dynamic imports). Frameworks handle this automatically (Next.js, Nuxt, SvelteKit). Manual split points for heavy libraries: `const Chart = lazy(() => import('chart.js'))`. Target: initial bundle < 100KB gzipped for fast TTI.

**Lazy loading**: Images below the fold load on scroll (`loading="lazy"` attribute or Intersection Observer). Components rendered on demand. Third-party scripts deferred or loaded on interaction (chat widgets, analytics).

**Image optimization**: WebP/AVIF formats (30-50% smaller than JPEG/PNG). Responsive images via `srcset` and `sizes`. Image CDN (Cloudinary, imgix, Vercel Image Optimization) for on-the-fly resizing and format negotiation. Placeholder strategies: LQIP (Low Quality Image Placeholder), BlurHash, dominant color.

**Font optimization**: Subset fonts to used characters. `font-display: swap` prevents invisible text. Preload critical fonts. Self-host fonts instead of Google Fonts for performance and privacy. Variable fonts reduce file count.

**Critical rendering path**: Inline critical CSS (above-the-fold styles). Preload critical resources (`<link rel="preload">`). Defer non-critical JavaScript. Minimize render-blocking resources. Target: LCP < 2.5s, INP < 200ms, CLS < 0.1.

### Database Performance Optimization

**Indexing strategy**: Index columns used in WHERE, JOIN, ORDER BY, and GROUP BY clauses. Composite indexes for multi-column queries — column order matters (most selective first, or match query pattern). Covering indexes include all queried columns, avoiding table lookups. Partial indexes for queries with fixed conditions (WHERE status = 'active'). Monitor unused indexes — they slow writes without benefiting reads.

**Query optimization**: Use EXPLAIN ANALYZE (PostgreSQL) or EXPLAIN FORMAT=JSON (MySQL) for every critical query. Eliminate sequential scans on large tables. Avoid SELECT * — specify needed columns. Use pagination (keyset/cursor-based, not OFFSET — OFFSET scans and discards rows). Batch inserts instead of row-by-row. Avoid N+1 queries — use JOINs, subqueries, or DataLoader pattern.

**Connection pooling**: Application-level pooling (HikariCP, Prisma connection pool) plus external pooler (PgBouncer) for serverless. Pool size: (core_count * 2) + spindle_count for OLTP. Monitor active connections, wait time, and pool exhaustion. Idle connection timeout to reclaim resources.

**Read replicas**: Route read queries to replicas for read-heavy workloads. Application-level routing (primary for writes, replica for reads) or proxy-level (ProxySQL, PgPool). Account for replication lag — use primary for reads-after-writes that require consistency.

### Connection Pool Tuning

**HTTP connection pooling**: Keep-alive connections to upstream services. Configure max connections per host, idle timeout, and connection TTL. Node.js: `http.Agent` with `keepAlive: true`. Java: Apache HttpClient connection pool. Go: `http.Transport` with `MaxIdleConnsPerHost`.

**Database connection pooling**: Minimum pool size (warm connections ready), maximum pool size (hard limit), connection timeout (how long to wait for a free connection), idle timeout (reclaim unused connections), max lifetime (prevent stale connections from long-running server processes).

**gRPC connection management**: gRPC uses HTTP/2 with multiplexed streams over a single connection. Connection-level load balancing requires client-side balancing (round-robin, pick-first) or a proxy (Envoy). Keepalive pings maintain connections through load balancers and firewalls.

## Decision Framework

| Symptom | Investigation | Likely Fix |
|---------|--------------|-----------|
| Slow first page load | Lighthouse, bundle analysis | Code splitting, CDN, image optimization |
| Slow API response | APM flame graph, query log | Database index, caching, N+1 fix |
| High P99 latency | Load test, connection pool metrics | Pool tuning, async processing, circuit breaker |
| Database CPU spike | slow query log, pg_stat_statements | Query optimization, read replicas |
| Memory growth over time | Heap profiling, allocation tracking | Memory leak fix, cache eviction tuning |
| Intermittent timeouts | Network tracing, connection pool stats | Pool sizing, timeout tuning, retry logic |

## Anti-Patterns

- **Premature optimization**: Optimizing code that is not the bottleneck. Always profile first. Readable code that is fast enough is better than fast code that is unreadable.
- **Cache without invalidation strategy**: Adding caching without planning how stale data is detected and refreshed. Every cache entry needs a defined TTL or invalidation trigger.
- **Unbounded queries**: API endpoints that return entire tables without pagination. Always enforce maximum page sizes and default limits. Cursor-based pagination for large datasets.
- **Synchronous external calls in request path**: Calling three external APIs sequentially during a user request. Parallelize independent calls, move non-critical calls to async processing, and add timeouts and fallbacks.

## Evidence Signals

- Bundle size analysis: `webpack-bundle-analyzer`, `source-map-explorer`. Bundles > 500KB indicate splitting opportunities.
- Database: `pg_stat_statements` (PostgreSQL) or `performance_schema` (MySQL) reveal slow and frequent queries.
- `Cache-Control` headers on API responses — missing headers mean no caching strategy.
- Connection pool metrics in APM: wait time > 0 consistently means pool is undersized.
- Core Web Vitals in Search Console or RUM data: LCP > 2.5s, INP > 200ms, CLS > 0.1 need attention.
- Load test results in CI: track P50, P95, P99 latency and throughput per release to detect regressions.

---
*Sovereign Architect RAG Priming · JM Labs*
