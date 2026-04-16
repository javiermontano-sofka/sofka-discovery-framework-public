# Caching Strategy — Body of Knowledge

## Core Concepts
- **Cache Hit Ratio**: Percentage of requests served from cache vs. total requests. Target: >90% for read-heavy workloads.
- **TTL (Time-To-Live)**: Duration a cache entry remains valid before automatic expiration.
- **Cache Stampede (Thundering Herd)**: When many requests simultaneously miss an expired cache entry and flood the backend.
- **Dog-Pile Effect**: A variant of cache stampede where a single popular key expires and triggers concurrent regeneration.
- **Cache Warming**: Pre-loading the cache with anticipated hot data before traffic arrives (after deployments, cold starts).
- **Eviction Policies**: Algorithms for removing entries when cache is full — LRU (least recently used), LFU (least frequently used), FIFO.
- **Stale-While-Revalidate**: Serve stale data immediately while asynchronously refreshing the cache entry in the background.
- **Write Coalescing**: Batching multiple writes to the same key before flushing to the backend, reducing write amplification.

## Patterns & Practices
- **Cache-Aside with Locking**: Use distributed locks (Redis SETNX) to prevent thundering herd — only one process regenerates the cache.
- **Probabilistic Early Expiration**: Each read has a small probability of refreshing the cache before TTL expires, spreading regeneration over time.
- **Multi-Tier Caching**: L1 (in-process, microseconds) → L2 (distributed, milliseconds) → L3 (CDN, edge, milliseconds from user).
- **Cache Key Namespacing**: Use structured keys like `{service}:{entity}:{id}:{version}` to prevent collisions and enable bulk invalidation.
- **Negative Caching**: Cache "not found" results with a short TTL to prevent repeated DB lookups for non-existent keys.
- **Circuit Breaker on Cache**: If the cache layer is down, fall back to direct DB reads instead of failing the request.

## Tools & Technologies
- **Redis**: In-memory data store supporting strings, hashes, lists, sets, sorted sets, pub/sub, and Lua scripting for atomic operations.
- **Memcached**: High-performance, distributed memory caching system optimized for simple key-value storage.
- **Caffeine (Java) / lru-cache (Node.js)**: In-process caching libraries for L1 cache with configurable eviction.
- **Varnish**: HTTP accelerator/reverse proxy for caching HTTP responses at the edge.
- **CloudFront / Fastly / Cloudflare**: CDN providers with configurable cache rules, purge APIs, and edge compute.
- **KeyDB**: Multi-threaded Redis-compatible database with improved throughput for cache workloads.

## References
- Kleppmann, M., "Designing Data-Intensive Applications" (O'Reilly, 2017) — Chapter 11.
- Vattani, A. et al., "Optimal Probabilistic Cache Stampede Prevention" (VLDB, 2015).
- Redis Documentation — Caching patterns and best practices.
- AWS Caching Best Practices Whitepaper.
