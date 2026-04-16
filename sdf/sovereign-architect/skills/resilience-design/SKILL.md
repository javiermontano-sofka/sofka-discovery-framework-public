---
name: resilience-design
author: JM Labs (Javier Montaño)
description: >
  Designs resilience patterns including circuit breakers, retries, bulkheads, timeouts, and chaos engineering practices.
  Trigger: "resilience design", "circuit breaker", "fault tolerance", "chaos engineering", "bulkhead pattern", "retry strategy".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Resilience Design

Designs fault-tolerant architectures using circuit breakers, retry policies, bulkheads, timeouts, and chaos engineering practices to ensure systems degrade gracefully under failure conditions.

## Guiding Principle

> *"Hope is not a strategy. Design for failure, because failure is not a possibility — it is an inevitability."*

## Procedure

### Step 1 — Failure Mode Analysis
1. Map all external dependencies: databases, APIs, message brokers, DNS, CDN, third-party services.
2. For each dependency, identify failure modes: timeout, error response, partial failure, data corruption, total outage.
3. Classify failures by frequency (common, rare, black swan) and impact (degraded, partial outage, total outage).
4. Identify cascading failure paths: where does one failure trigger another?
5. Document the current blast radius for each failure mode.

### Step 2 — Apply Resilience Patterns
1. **Circuit Breaker**: Prevent cascading failures by stopping calls to a failing dependency after a threshold; periodically test for recovery.
2. **Retry with Backoff**: Retry transient failures with exponential backoff and jitter to prevent thundering herd.
3. **Timeout**: Set explicit timeouts for all external calls; never wait indefinitely.
4. **Bulkhead**: Isolate failure domains so that one failing component cannot exhaust resources needed by others.
5. **Fallback**: Define degraded responses when a dependency is unavailable (cached data, default values, feature disablement).
6. Select patterns per dependency based on failure mode analysis.

### Step 3 — Design for Graceful Degradation
1. Define the degradation hierarchy: what features are sacrificed first, second, third?
2. Implement load shedding: reject low-priority requests under extreme load to protect critical paths.
3. Design rate limiting: per-client, per-endpoint, and global rate limits with clear 429 responses.
4. Specify the health check architecture: liveness (is the process running?) vs. readiness (can it serve traffic?).
5. Plan for data center / availability zone failure: multi-AZ deployment, cross-region failover.

### Step 4 — Chaos Engineering
1. Define steady-state hypotheses: what does "normal" look like in measurable terms?
2. Design chaos experiments: inject latency, kill instances, simulate network partitions, exhaust resources.
3. Start small: single-service chaos in staging before production experiments.
4. Establish the blast radius controls: abort conditions, rollback procedures, scope limits.
5. Schedule regular game days to practice incident response.

## Quality Criteria
- Every external dependency has an explicit timeout, retry policy, and circuit breaker configuration.
- Graceful degradation is defined for at least the top 3 failure scenarios.
- Chaos experiments are documented and run at least quarterly in production.
- Health checks distinguish between liveness and readiness, preventing premature traffic routing.

## Anti-Patterns
- Retrying without backoff or jitter, amplifying the problem on a struggling service ("retry storm").
- Circuit breakers that never open because thresholds are set too high ("decoration-only circuit breaker").
- Infinite timeouts or no timeouts on external HTTP calls ("waiting forever").
- Testing only happy paths — never simulating dependency failures in integration tests.
