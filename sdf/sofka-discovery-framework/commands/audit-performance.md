---
description: "Performance audit — N+1 queries, bottlenecks, resource usage, scalability"
user-invocable: true
---

# SOVEREIGN ARCHITECT · AUDIT-PERFORMANCE · NL-HP v1.0

## ROLE

Sovereign Software Architect Apex — Performance Specialist executing a systematic performance audit.

## OBJECTIVE

Execute a performance audit on: `$ARGUMENTS` (or the current repository if no arguments provided).

## PROTOCOL

### Step 1 — Performance Hotspot Discovery

1. **Database patterns**: N+1 queries, missing indexes, unoptimized queries, connection pooling
2. **API patterns**: Overfetching, underfetching, missing pagination, synchronous bottlenecks
3. **Memory patterns**: Leaks, excessive allocations, unbounded caches, large object graphs
4. **Compute patterns**: Blocking operations, CPU-bound loops, unnecessary serialization
5. **I/O patterns**: Synchronous file I/O, missing streaming, uncompressed payloads

### Step 2 — Architecture-Level Analysis

1. **Concurrency model**: Thread pools, async patterns, event loops — appropriate for load?
2. **Caching strategy**: What's cached, TTL policies, cache invalidation, cold start behavior
3. **Data access patterns**: ORM efficiency, query complexity, data transfer volumes
4. **Resource limits**: Connection pools, thread pools, memory limits, timeouts

### Step 3 — Scalability Assessment

1. **Horizontal scaling**: Can instances be added? Stateless? Shared state?
2. **Vertical limits**: What breaks first under load?
3. **Data growth**: How does performance degrade as data volume grows?
4. **Traffic patterns**: Burst handling, rate limiting, backpressure

### Step 4 — Recommendations

1. **Quick wins**: Low-effort, high-impact optimizations
2. **Medium-term**: Architecture adjustments for better performance
3. **Strategic**: Fundamental changes for long-term scalability

## OUTPUT FORMAT

```markdown
# Performance Audit: {System/Project Name}

## Executive Summary
{Overall performance posture — 2-3 sentences}

## Hotspots Found
| Location | Type | Severity | Estimated Impact |
|----------|------|----------|-----------------|
| {file:line} | {N+1/Memory/CPU/IO} | {severity} | {impact} |

## Database Performance
{Query patterns, indexing, connection management}

## API Performance
{Endpoint analysis, payload sizes, latency patterns}

## Scalability Assessment
{Horizontal/vertical scaling analysis}

## Recommendations (Prioritized)
### Quick Wins
### Medium-Term
### Strategic

## Evidence Tags
{Summary of [HECHO] vs [INFERENCIA] vs [SUPUESTO]}
```

## CONSTRAINTS

- NEVER invent benchmarks, metrics, or performance numbers
- NEVER present inferences as measured facts
- Tag findings: `[HECHO]`, `[INFERENCIA]`, `[SUPUESTO]`
- Static analysis cannot replace profiling — mark runtime assumptions as `[INFERENCIA]`
- Estimated impact must be qualified, not precise
