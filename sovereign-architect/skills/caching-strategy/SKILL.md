---
name: caching-strategy
author: JM Labs (Javier Montaño)
description: >
  Designs cache architectures using cache-aside, write-through, write-back patterns with invalidation and CDN strategies.
  Trigger: "caching strategy", "cache architecture", "cache invalidation", "CDN design", "cache patterns".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Caching Strategy

Designs multi-layer caching architectures selecting appropriate patterns (aside, through, back), invalidation strategies, TTL policies, and CDN configurations to optimize latency and reduce backend load.

## Guiding Principle

> *"There are only two hard things in computer science: cache invalidation and naming things."*

## Procedure

### Step 1 — Profile Access Patterns
1. Identify the read/write ratio for each data domain (caching benefits read-heavy workloads).
2. Map the hot data set: which 20% of data serves 80% of requests?
3. Determine staleness tolerance per data type (real-time, seconds, minutes, hours).
4. Measure current latency and throughput bottlenecks to establish a baseline.

### Step 2 — Select Cache Patterns
1. **Cache-Aside (Lazy Loading)**: Application checks cache first, loads from DB on miss, writes to cache. Best for read-heavy, tolerates stale data.
2. **Write-Through**: Application writes to cache and DB simultaneously. Ensures cache is always fresh but adds write latency.
3. **Write-Behind (Write-Back)**: Application writes to cache; cache asynchronously flushes to DB. Best throughput but risk of data loss.
4. **Read-Through**: Cache itself fetches from DB on miss (cache acts as the data source). Simplifies application code.
5. Select the pattern per data domain based on consistency requirements and staleness tolerance.

### Step 3 — Design Invalidation Strategy
1. **TTL-Based**: Set time-to-live per cache entry; simple but may serve stale data up to TTL.
2. **Event-Driven Invalidation**: Publish cache-invalidation events on data changes; fresher but requires event infrastructure.
3. **Version-Based**: Include a version key; increment on writes to invalidate all related entries.
4. **Tag-Based Invalidation**: Group cache entries by tags; invalidate all entries with a given tag.
5. Define the cache warming strategy for cold starts and deployments.

### Step 4 — Multi-Layer Architecture
1. **L1 — In-Process Cache**: Local memory (e.g., Caffeine, lru-cache) for ultra-low latency on hot keys.
2. **L2 — Distributed Cache**: Redis or Memcached for shared cache across application instances.
3. **L3 — CDN/Edge Cache**: CloudFront, Fastly, or Cloudflare for static assets and cacheable API responses.
4. Define cache key naming conventions to prevent collisions across services.
5. Document the eviction policy per layer (LRU, LFU, FIFO) and maximum memory allocation.

## Quality Criteria
- Every cached data type has a documented TTL with staleness-tolerance justification.
- Cache hit ratio targets are defined (typically >90% for hot data).
- Invalidation strategy is tested for race conditions (thundering herd, dog-pile effect).
- Cache failure is handled gracefully — the system degrades to direct DB reads, not errors.

## Anti-Patterns
- Caching everything without profiling access patterns ("cache-all" strategy that wastes memory).
- No invalidation strategy — relying solely on TTL expiry for data that requires real-time freshness.
- Cache stampede: all instances simultaneously miss the cache and hammer the database.
- Storing large objects in cache that exceed the eviction budget and push out hot small entries.
