# Caching Strategy — Sample Output

## Context
A travel booking platform needs to cache hotel search results and pricing. The system handles 100K searches/day with 5K hotels in the catalog. Hotel availability changes every few minutes; pricing is semi-dynamic (updates every 15 minutes from suppliers).

## Output

### Access Pattern Analysis

| Data Domain | Read/Write Ratio | Staleness Tolerance | Hot Set Size | Current Latency |
|------------|-----------------|-------------------|-------------|----------------|
| Hotel metadata (name, photos, amenities) | 1000:1 | Hours | 100% (5K hotels) | 50ms |
| Search results (availability + pricing) | 100:1 | 5 minutes | 20% of query combinations | 1,200ms |
| User session (search history, filters) | 50:1 | Real-time | 100% active sessions | 5ms |
| Supplier pricing feeds | 1:1 (ETL) | 15 minutes | 100% | N/A (batch) |

### Multi-Layer Cache Architecture

```
┌─────────────────────────────────────────────────┐
│  L3: CDN (CloudFront)                           │
│  - Hotel images: TTL 24h, cache-control: public │
│  - Static pages: TTL 1h                         │
└─────────────┬───────────────────────────────────┘
              │
┌─────────────▼───────────────────────────────────┐
│  L2: Distributed Cache (Redis Cluster)          │
│  - Search results: TTL 5min, LRU eviction       │
│  - Hotel metadata: TTL 2h, event invalidation   │
│  - User sessions: TTL 30min, no eviction        │
│  Memory budget: 32GB (8 nodes x 4GB)            │
└─────────────┬───────────────────────────────────┘
              │
┌─────────────▼───────────────────────────────────┐
│  L1: In-Process Cache (Caffeine)                │
│  - Hotel metadata: TTL 10min, max 5K entries    │
│  - Pricing tier rules: TTL 1h, max 100 entries  │
│  Memory budget: 256MB per instance              │
└─────────────┬───────────────────────────────────┘
              │
┌─────────────▼───────────────────────────────────┐
│  Source: PostgreSQL + Supplier APIs              │
└─────────────────────────────────────────────────┘
```

### Cache Pattern Selection

| Data Domain | Pattern | Justification |
|------------|---------|---------------|
| Hotel metadata | **Read-Through** + Event Invalidation | Stable data, infrequent changes; events from CMS trigger invalidation |
| Search results | **Cache-Aside** + TTL | High cardinality query combinations; TTL provides acceptable staleness |
| User sessions | **Write-Through** | Session data must be consistent across instances immediately |
| Supplier pricing | **Cache Warming** (batch) | Bulk-loaded every 15 minutes from ETL pipeline |

### Cache Key Design

```
# Hotel metadata
hotel:meta:{hotel_id}                    → TTL: 2h
hotel:meta:{hotel_id}:photos             → TTL: 24h

# Search results
search:{destination}:{checkin}:{checkout}:{guests}:{sort}:{page}
                                          → TTL: 5min
Example: search:cancun:20260401:20260405:2:price_asc:1

# User session
session:{session_id}                      → TTL: 30min
```

### Invalidation Strategy

| Trigger | Mechanism | Scope |
|---------|-----------|-------|
| Hotel metadata update (CMS) | Publish `hotel.updated` event → Redis DEL | Single hotel key + related search results via tag |
| Pricing feed refresh (every 15 min) | Batch warm: overwrite pricing entries | All pricing keys for affected hotels |
| Search result staleness (TTL) | Automatic TTL expiry | Individual search key |
| Cache stampede prevention | Redis SETNX lock with 10s timeout | Per search-key regeneration |

### Thundering Herd Mitigation

```python
def get_search_results(query_key):
    result = redis.get(query_key)
    if result:
        return deserialize(result)

    # Acquire lock to prevent stampede
    lock_key = f"lock:{query_key}"
    if redis.set(lock_key, "1", nx=True, ex=10):
        try:
            result = execute_search_query(query_key)
            redis.setex(query_key, 300, serialize(result))
            return result
        finally:
            redis.delete(lock_key)
    else:
        # Another process is regenerating; wait and retry
        time.sleep(0.1)
        return get_search_results(query_key)  # retry with backoff
```

### Monitoring & Targets

| Metric | Target | Alert Threshold |
|--------|--------|----------------|
| L2 hit ratio (search results) | >85% | <70% for 5 minutes |
| L2 hit ratio (hotel metadata) | >98% | <90% for 5 minutes |
| Redis memory usage | <80% of budget | >85% |
| Cache miss latency (search) | <1,500ms | >3,000ms p95 |
| Invalidation event lag | <2 seconds | >10 seconds |
