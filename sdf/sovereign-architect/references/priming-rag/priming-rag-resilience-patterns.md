# Resilience Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Resilient systems continue operating under adverse conditions — network failures, dependency outages, traffic spikes, and hardware faults. Resilience is not about preventing failures but about designing systems that degrade gracefully, recover automatically, and contain blast radius. This document covers circuit breakers, retry strategies, isolation patterns, health checking, and chaos engineering for architects designing systems that must survive production reality.

## Core Patterns

### Circuit Breaker

**Concept**: Prevents cascading failures by detecting when a downstream dependency is unhealthy and short-circuiting requests to it. Three states: Closed (normal operation, requests pass through), Open (dependency is unhealthy, requests fail immediately without calling dependency), Half-Open (after a timeout, allow a limited number of test requests to check if dependency recovered).

**Configuration**: Failure threshold (e.g., 50% error rate in 10-second window triggers open), reset timeout (e.g., 30 seconds before transitioning to half-open), success threshold in half-open (e.g., 3 consecutive successes to close). Tune based on dependency SLA and recovery characteristics.

**Implementation**: Resilience4j (JVM, recommended), Polly (.NET), cockatiel (TypeScript), gobreaker (Go). Service mesh circuit breakers (Istio, Linkerd) operate at the infrastructure layer — no application code changes. Application-level breakers provide finer-grained control (per-method, per-tenant).

**Key principle**: Circuit breakers protect the caller, not the callee. When open, the caller fails fast (milliseconds) instead of waiting for timeout (seconds), preserving thread pool resources and user experience.

### Retry with Exponential Backoff

**Concept**: Automatically retry failed requests with increasing delays between attempts. Base delay doubles each retry (1s, 2s, 4s, 8s). Jitter (random variation) prevents thundering herd — all clients retrying simultaneously after a transient failure.

**Configuration**: Max retries (3-5 for most cases), initial delay (100ms-1s), maximum delay (30s-60s cap), jitter strategy (full jitter: random between 0 and backoff value; equal jitter: half backoff + random half). Only retry on transient errors (5xx, timeout, connection refused) — never retry on client errors (4xx) or business logic errors.

**Idempotency requirement**: Retries are only safe for idempotent operations. GET, PUT, DELETE are naturally idempotent. POST requires idempotency keys — the client sends a unique key with each request, and the server deduplicates. Store processed idempotency keys with their results (in Redis or database) for the deduplication window.

**Libraries**: axios-retry (Node.js), tenacity (Python), retry-go (Go), Resilience4j retry (JVM), Polly retry (.NET).

### Bulkhead Pattern

**Concept**: Isolate resources into compartments so that failure in one compartment does not exhaust shared resources and cascade to others. Named after ship bulkheads that prevent a hull breach from sinking the entire vessel.

**Thread pool bulkhead**: Separate thread pools for different downstream dependencies. If the database thread pool is exhausted, the cache and external API calls continue unaffected. Hystrix (deprecated but concept lives on), Resilience4j bulkhead.

**Semaphore bulkhead**: Limit concurrent calls to a specific dependency without dedicated thread pools. Lighter weight than thread pool isolation. Appropriate when the overhead of separate thread pools is not justified.

**Infrastructure bulkhead**: Separate Kubernetes deployments, databases, or message queues for different tenants or criticality tiers. A noisy tenant exhausting resources does not affect others. Cell-based architecture is the extreme form of this pattern.

### Timeout Strategy

**Layers of timeouts**: Connection timeout (time to establish TCP connection, typically 1-3s), read/request timeout (time to receive response after connection, depends on expected operation duration), overall timeout (end-to-end budget for the entire operation including retries).

**Timeout budget propagation**: In a chain A -> B -> C, A has a 5s budget. A gives B 4s (reserving 1s for its own processing). B gives C 3s. Each service reduces the timeout passed downstream. Without propagation, C may process a request that A has already timed out on, wasting resources.

**Deadline propagation**: gRPC implements this natively with deadline headers. In HTTP, use custom headers (e.g., `X-Request-Deadline`) to propagate the absolute deadline timestamp. Each service checks if the deadline has passed before starting work.

**Key rule**: Every external call must have a timeout. Default timeouts in HTTP clients are often too long (30s-120s) or infinite. Set explicit timeouts for every dependency call.

### Fallback Patterns

**Graceful degradation**: When a dependency fails, provide reduced functionality instead of an error. Example: if the recommendation engine is down, show popular items instead of personalized recommendations. If real-time pricing is unavailable, show cached prices with a staleness indicator.

**Default values**: Return sensible defaults when a service is unavailable. Feature flags with default-off behavior. Cached responses served stale (stale-while-revalidate pattern). Static content served from CDN when the origin is down.

**Queue and retry later**: Accept the user's request, queue it for later processing, and confirm receipt. Process when the dependency recovers. Best for non-interactive operations (order processing, notification sending, data synchronization).

**Fallback hierarchy**: Try primary, then secondary, then cached, then default. Each level trades freshness/accuracy for availability. Document the fallback chain so the team understands behavior during partial outages.

### Health Checks

**Liveness probe**: Is the process running and not deadlocked? Simple — return 200 OK if the event loop or thread pool is responsive. If liveness fails, the orchestrator restarts the container. Never include dependency checks in liveness probes — a database outage should not cause cascading container restarts.

**Readiness probe**: Is the service ready to receive traffic? Check critical dependencies (database connection, cache connection, required config loaded). If readiness fails, the service is removed from the load balancer but not restarted. Returns to service when dependencies recover.

**Startup probe**: Is the service still starting up? Allows slow-starting applications (JVM, large data loading) to avoid being killed by liveness probes during initialization. Startup probe runs first; liveness and readiness start after startup succeeds.

**Deep health check**: Comprehensive check of all dependencies, used by monitoring dashboards and alerting. Separate endpoint from liveness/readiness (`/health/detailed`). Returns individual dependency status, latency, and version information. Never expose to public internet — it reveals infrastructure details.

### Chaos Engineering

**Concept**: Proactively inject failures into production (or production-like) systems to discover weaknesses before they cause outages. Not random destruction — disciplined experiments with hypotheses, controlled blast radius, and automated safety mechanisms.

**Experiments**: Network latency injection (verify timeout handling), dependency failure (verify circuit breakers and fallbacks), CPU/memory pressure (verify autoscaling), pod termination (verify graceful shutdown and load balancing), zone/region failure (verify multi-AZ/region resilience).

**Tools**: Chaos Monkey (Netflix, random instance termination), Litmus (Kubernetes-native chaos experiments), Gremlin (commercial, comprehensive), Chaos Mesh (CNCF, Kubernetes-native), toxiproxy (network condition simulation for testing).

**Maturity progression**: Start in staging with manual experiments. Graduate to automated experiments in production with narrow blast radius (single pod, single AZ). Mature to game days — coordinated team exercises simulating complex failure scenarios.

**Safety requirements**: Automated experiment abort if impact exceeds threshold. Observability in place before running chaos experiments — you cannot learn from failures you cannot observe. Start with known-good resilience patterns (circuit breakers, retries) before testing them.

## Decision Framework

| Pattern | Protects Against | Complexity | Implement When |
|---------|-----------------|-----------|---------------|
| Circuit breaker | Cascading failure | Medium | Any external dependency |
| Retry + backoff | Transient failures | Low | All network calls |
| Bulkhead | Resource exhaustion | Medium | Multi-dependency services |
| Timeout | Hung dependencies | Low | Every external call |
| Fallback | Dependency outage | Medium | User-facing features |
| Health checks | Bad deployments | Low | Every service (always) |
| Chaos engineering | Unknown unknowns | High | After basic resilience patterns |

## Anti-Patterns

- **Retry storm**: Retrying without backoff or jitter. Failed dependency receives exponentially more traffic as all callers retry simultaneously, making recovery impossible. Always use exponential backoff with jitter.
- **Missing timeouts**: HTTP clients with default infinite or very long timeouts. One slow dependency exhausts all threads/connections, bringing down the calling service. Set explicit timeouts on every external call.
- **Liveness probe dependency checking**: Liveness probe that checks database connectivity. Database goes down, all pods restart, now they cannot connect to the database either, and the orchestrator keeps restarting them. Use readiness probes for dependency checks, liveness probes only for process health.
- **Optimistic resilience**: Assuming dependencies are always available and handling errors as exceptions. Design for failure as the normal case — every dependency will eventually fail. The question is when and how the system behaves when it does.

## Evidence Signals

- Resilience library in dependencies (Resilience4j, Polly, cockatiel, gobreaker) — explicit resilience patterns.
- Kubernetes probe configuration in deployment manifests — health check strategy.
- Retry configuration in HTTP client setup — retry pattern adoption.
- Timeout values in client configuration — explicit timeout management.
- Circuit breaker metrics in monitoring dashboards — active resilience monitoring.
- Chaos experiment definitions (Litmus, Gremlin, Chaos Mesh) in infrastructure config — chaos engineering maturity.
- Fallback code paths in service implementations — graceful degradation design.

---
*Sovereign Architect RAG Priming · JM Labs*
