---
name: performance-bottleneck-identifier
author: JM Labs (Javier Montaño)
description: >
  Profiling-based identification of hot paths, resource constraints, and throughput limiters.
  Trigger: "find bottlenecks", "hot paths", "performance profiling", "throughput limits".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Performance Bottleneck Identifier

Identify performance bottlenecks through code-level profiling analysis, hot path detection, resource constraint mapping, and throughput limiter identification.

## Guiding Principle

> *"Optimize the bottleneck. Everything else is noise until the constraint moves."*

## Procedure

### Step 1 — Hot Path Detection
1. Trace the critical request path from entry point to response.
2. Identify synchronous blocking points in async codebases.
3. Map I/O operations: database queries, HTTP calls, file system access on the critical path.
4. Detect serialized operations that could be parallelized.
5. Flag computational hotspots: large data transformations, sorting, serialization `[HECHO]`.

### Step 2 — Resource Constraint Analysis
1. Identify CPU-bound operations: heavy computation, encryption, compression.
2. Find memory-bound operations: large object allocation, buffer copying, cache size.
3. Detect I/O-bound operations: disk reads, network calls, database round-trips.
4. Check for thread/connection pool exhaustion patterns.
5. Map resource contention: locks, mutexes, shared state between request handlers `[HECHO]`.

### Step 3 — Throughput Limiter Identification
1. Calculate theoretical throughput based on resource constraints.
2. Identify the single biggest constraint (Theory of Constraints).
3. Check for backpressure mechanisms: what happens when the system is overloaded?
4. Assess queue depths and processing rates for async workloads.
5. Detect cascading failures: when one bottleneck causes others to degrade.

### Step 4 — Bottleneck Report
1. Rank bottlenecks by impact on user-facing latency.
2. Provide specific optimization recommendations per bottleneck.
3. Estimate improvement potential for each fix.
4. Produce a latency breakdown diagram showing time spent in each component.

## Quality Criteria
- Bottlenecks identified on actual critical paths, not theoretical `[HECHO]`
- Resource constraints specified with type (CPU/memory/I/O/network)
- Optimization estimates include reasoning `[INFERENCIA]`
- Theory of Constraints applied to identify the single biggest limiter

## Anti-Patterns
- Optimizing non-bottleneck code (no improvement until the constraint moves)
- Profiling only in development without production-like data volumes
- Treating all slow queries equally without checking if they're on the hot path
- Adding caching without understanding invalidation requirements
