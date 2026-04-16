---
name: scalability-assessor
author: JM Labs (Javier Montaño)
description: >
  Horizontal/vertical scaling analysis, stateless/stateful assessment, and capacity planning.
  Trigger: "assess scalability", "can this scale", "scaling strategy", "capacity planning".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Scalability Assessor

Evaluate a system's ability to scale horizontally and vertically by analyzing statefulness, resource dependencies, and architectural constraints.

## Guiding Principle

> *"Scalability is not just about handling more load — it's about doing so economically and reliably."*

## Procedure

### Step 1 — Statefulness Analysis
1. Identify all stateful components: in-memory sessions, local file storage, singleton instances.
2. Check for session affinity requirements (sticky sessions).
3. Assess database state: single-writer vs. multi-writer, replication support.
4. Find in-process caches that would be inconsistent across instances.
5. Classify each component: stateless (horizontally scalable) vs. stateful (requires coordination) `[HECHO]`.

### Step 2 — Horizontal Scaling Readiness
1. Can the application run multiple instances behind a load balancer?
2. Are there shared resources that become contention points under load?
3. Assess database connection scaling: connection pooling, read replicas.
4. Check for distributed locking needs and their implementation.
5. Evaluate message queue consumer scaling patterns.

### Step 3 — Vertical Scaling Limits
1. Identify CPU-bound operations that benefit from more cores.
2. Find memory-bound operations that benefit from more RAM.
3. Assess I/O-bound operations limited by disk or network throughput.
4. Determine the single-machine ceiling for each resource type.
5. Estimate cost curve for vertical scaling `[INFERENCIA]`.

### Step 4 — Scalability Report
1. Classify overall scalability: linear, sub-linear, or non-scalable with evidence.
2. Identify the scaling bottleneck (the first thing that breaks under load).
3. Recommend a scaling strategy: horizontal, vertical, or hybrid.
4. Provide a capacity planning estimate for target load levels.

## Quality Criteria
- Statefulness assessed per component, not globally `[HECHO]`
- Scaling bottleneck identified with specific evidence
- Both horizontal and vertical scaling evaluated
- Capacity estimates include assumptions clearly stated `[SUPUESTO]`

## Anti-Patterns
- Assuming statelessness without checking for in-memory state
- Planning only for horizontal scaling when the database is the bottleneck
- Ignoring cost curves (10x load may not need 10x resources)
- Treating scalability as purely a infrastructure problem (often requires code changes)
