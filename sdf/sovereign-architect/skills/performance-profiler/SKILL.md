---
name: performance-profiler
author: JM Labs (Javier Montaño)
description: >
  N+1 query detection, bottleneck identification, and resource usage analysis.
  Trigger: "profile performance", "find bottlenecks", "N+1 queries", "resource usage".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Performance Profiler

Identify performance anti-patterns in code: N+1 queries, unbounded loops, missing pagination, memory leaks, and inefficient algorithms through static analysis.

## Guiding Principle

> *"Performance is a feature. Users measure your software in milliseconds, not function points."*

## Procedure

### Step 1 — Query Pattern Analysis
1. Grep for database queries inside loops (N+1 pattern).
2. Identify missing eager loading / includes / joins in ORM queries.
3. Check for `SELECT *` usage instead of column-specific queries.
4. Find queries without pagination or limits on unbounded result sets.
5. Document each N+1 candidate with file, line, and estimated impact `[HECHO]`.

### Step 2 — Algorithm & Data Structure Review
1. Identify nested loops operating on collections (O(n^2) or worse).
2. Check for repeated computations that should be memoized or cached.
3. Find synchronous blocking operations in async contexts.
4. Detect large object serialization/deserialization in hot paths.
5. Flag string concatenation in loops instead of builder/join patterns.

### Step 3 — Resource Usage Analysis
1. Identify unbounded in-memory collections (arrays/maps that grow without limit).
2. Check for missing connection pool configuration (database, HTTP clients).
3. Find file handles, streams, or connections that may not be properly closed.
4. Detect missing timeouts on external calls (HTTP, database, queue).
5. Assess caching strategy: what's cached, expiration policies, invalidation `[INFERENCIA]`.

### Step 4 — Performance Report
1. Prioritize findings by estimated user impact (latency, throughput, resource cost).
2. Classify each finding: query optimization, algorithm improvement, resource management, caching.
3. Provide specific code-level remediation for each finding.
4. Estimate improvement potential (e.g., "N+1 fix could reduce query count from ~100 to 2").

## Quality Criteria
- N+1 patterns identified with specific ORM calls and loop context `[HECHO]`
- Algorithm complexity noted with Big-O notation
- Resource leaks identified with specific file handles or connections
- Remediation includes concrete code suggestions

## Anti-Patterns
- Only looking at database queries while ignoring algorithmic inefficiency
- Optimizing code that isn't on the hot path (premature optimization)
- Recommending caching without considering invalidation complexity
- Ignoring async/await misuse that causes sequential execution of parallel-capable work
