---
name: performance-engineering
author: JM Labs (Javier Montaño)
description: >
  Load testing design, capacity planning, bottleneck analysis, caching strategies,
  and SLA engineering. Trigger: "performance engineering", "load testing", "capacity planning",
  "bottleneck", "caching", "SLA", "latency".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Performance Engineering

Design and execute performance engineering practices: load testing strategies, capacity planning, bottleneck identification, caching architecture, and SLA definition.

## Guiding Principle
> *"Performance is a feature — measure before optimizing, profile before guessing, and define SLAs before building."*

## Procedure

### Step 1 — Performance Baseline & SLA Definition
1. Define performance SLAs: p50, p95, p99 latency targets per endpoint
2. Identify critical user journeys and their performance budgets
3. Establish baseline measurements for current system performance
4. Define throughput targets: requests/second, concurrent users, transactions/minute
5. Map SLAs to infrastructure capacity and cost constraints

### Step 2 — Load Testing Design
1. Design load test scenarios: baseline, stress, spike, soak, breakpoint
2. Create realistic traffic patterns based on production data analysis
3. Design test data generation to avoid hot-spotting and cache warming bias
4. Configure test infrastructure to isolate from production traffic
5. Define success criteria and automated pass/fail thresholds per scenario

### Step 3 — Bottleneck Analysis
1. Profile application performance: CPU, memory, I/O, network, GC patterns
2. Analyze database performance: slow queries, lock contention, connection pool saturation
3. Identify network bottlenecks: DNS resolution, TLS handshakes, connection limits
4. Map resource utilization across the request path (flame graphs, traces)
5. Prioritize bottlenecks by impact on user-facing latency

### Step 4 — Optimization & Caching
1. Design caching strategy: what, where, how long, invalidation approach
2. Implement caching layers: CDN, application cache, database query cache
3. Design connection pooling optimization for databases and external APIs
4. Implement async processing for non-critical path operations
5. Define performance regression detection in CI/CD pipeline

## Quality Criteria
- SLAs defined for all critical endpoints with automated monitoring
- Load tests validate 2x projected peak traffic with SLAs maintained
- Bottleneck analysis backed by profiling data, not assumptions
- Caching strategy includes invalidation logic and cache-miss fallback

## Anti-Patterns
- Optimizing without profiling (guessing where the bottleneck is)
- Load testing against a single endpoint instead of realistic user journeys
- Caching everything with no invalidation strategy (stale data)
- SLAs defined once and never monitored or enforced
