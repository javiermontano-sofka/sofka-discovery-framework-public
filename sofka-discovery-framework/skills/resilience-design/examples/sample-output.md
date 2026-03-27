# Resilience Design — Sample Output

## Context
An online food ordering platform experiences cascading failures during peak dinner hours (6-9 PM). When the restaurant partner API slows down, the order service exhausts its connection pool, which causes the cart service to timeout, which causes the frontend to show errors. Design the resilience architecture.

## Output

### Failure Mode Analysis

| Dependency | Failure Mode | Frequency | Impact | Current Blast Radius |
|-----------|-------------|-----------|--------|---------------------|
| Restaurant Partner API | Latency spike (3s → 15s) | Weekly during peaks | Order placement fails | All orders, all restaurants |
| Payment Gateway (Stripe) | Intermittent 503 | Monthly | Checkout fails | All checkouts |
| PostgreSQL Primary | Connection exhaustion | Rare | Total outage | Entire platform |
| Redis Cache | Node failure | Quarterly | Degraded performance | All services using cache |
| Notification Service (email) | Queue backpressure | Weekly | Delayed confirmations | Order confirmations |

### Resilience Pattern Configuration

#### Circuit Breaker — Restaurant Partner API

```yaml
circuit_breaker:
  name: restaurant-partner-api
  failure_rate_threshold: 50%        # Open after 50% failures
  slow_call_rate_threshold: 80%      # Open after 80% slow calls
  slow_call_duration_threshold: 5s   # Calls >5s are "slow"
  minimum_number_of_calls: 10        # Minimum sample before evaluation
  wait_duration_in_open_state: 30s   # Time before half-open probe
  permitted_calls_in_half_open: 3    # Probe calls before deciding
  sliding_window_type: COUNT_BASED
  sliding_window_size: 20
```

**Fallback**: When circuit is open, return cached restaurant data (menu, hours) with a staleness banner. Orders queue for retry when circuit closes.

#### Retry Policy — Payment Gateway

```yaml
retry:
  name: payment-gateway
  max_attempts: 3
  wait_duration: 1s                  # Initial wait
  backoff_multiplier: 2              # 1s, 2s, 4s
  jitter: 0.5                       # +/- 50% randomization
  retry_on:
    - ConnectTimeoutException
    - HTTP_503
    - HTTP_429
  do_not_retry_on:
    - HTTP_400                       # Client error — don't retry
    - HTTP_402                       # Payment declined — don't retry
    - HTTP_409                       # Conflict — don't retry
  idempotency_key: required          # Prevent double-charge
```

#### Timeout Configuration

| Service Call | Timeout | Connect Timeout | Rationale |
|-------------|:---:|:---:|-----------|
| Restaurant Partner API | 5s | 1s | Degraded menu is better than 15s hang |
| Payment Gateway | 10s | 2s | Payments are critical; allow more time |
| PostgreSQL queries | 3s | 500ms | Slow queries indicate saturation |
| Redis cache | 500ms | 100ms | Cache miss is acceptable; slow cache is not |
| Notification Service (async) | 2s | 500ms | Fire and forget; notification is non-blocking |

#### Bulkhead Isolation

```
┌──────────────────────────────────┐
│          Order Service            │
│                                    │
│  ┌──────────────┐ ┌────────────┐ │
│  │ Restaurant   │ │ Payment    │ │
│  │ API Pool     │ │ API Pool   │ │
│  │ max: 20      │ │ max: 30    │ │
│  │ queue: 10    │ │ queue: 15  │ │
│  └──────────────┘ └────────────┘ │
│                                    │
│  ┌──────────────┐ ┌────────────┐ │
│  │ Database     │ │ Internal   │ │
│  │ Pool         │ │ Services   │ │
│  │ max: 50      │ │ max: 25    │ │
│  │ queue: 25    │ │ queue: 10  │ │
│  └──────────────┘ └────────────┘ │
└──────────────────────────────────┘
```

**Effect**: When the Restaurant API pool is exhausted (20 active + 10 queued), new restaurant API calls are rejected immediately with a fallback response. The Payment, Database, and Internal Service pools remain unaffected.

### Graceful Degradation Ladder

| Level | Condition | User Experience | Automated? |
|-------|-----------|----------------|:---:|
| **L0: Normal** | All systems healthy | Full functionality | — |
| **L1: Degraded** | Restaurant API circuit open | Cached menus shown, "prices may be outdated" banner | Yes |
| **L2: Limited** | Payment gateway failing | Orders accepted, payment retried in background, "processing" status | Yes |
| **L3: Read-Only** | Database write failures | Browse and search work, cart/checkout disabled | Yes |
| **L4: Static** | Multiple critical failures | Static maintenance page with estimated recovery time | Manual |

### Load Shedding Strategy

```
Priority levels (highest to lowest):
1. Payment confirmations and webhooks (never shed)
2. Order placement (shed at 95% capacity)
3. Menu and restaurant browsing (shed at 98% capacity)
4. Search suggestions and recommendations (shed at 85% capacity)
5. Analytics and tracking events (shed at 70% capacity)
```

**Implementation**: API gateway (Kong) applies rate limiting per priority level. When system load exceeds thresholds, lower-priority endpoints return 503 with `Retry-After` header.

### Chaos Experiment Plan

| # | Experiment | Hypothesis | Blast Radius | Abort Condition |
|---|-----------|-----------|-------------|----------------|
| 1 | Add 5s latency to Restaurant API | Circuit breaker opens within 30s; users see cached menus | Single AZ | Error rate > 5% for 3 min |
| 2 | Kill 1 of 3 order-service pods | Traffic redistributes; no user-visible errors | Single pod | Any 5xx responses |
| 3 | Block Stripe API connectivity | Retry logic kicks in; failover to Adyen after 3 retries | Payment path | Checkout success rate < 95% |
| 4 | Exhaust Redis connection pool | Services fall back to direct DB reads; latency increases but no errors | Cache layer | p95 latency > 3s |
| 5 | Simulate AZ failure (drain all pods in us-east-1a) | Traffic shifts to 1b and 1c; no downtime | One AZ (33% capacity) | Any service unavailable |

**Schedule**: Monthly game days, alternating between staging (weeks 1-3) and production (week 4).
