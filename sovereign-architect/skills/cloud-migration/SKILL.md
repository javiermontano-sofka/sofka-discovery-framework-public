---
name: cloud-migration
author: JM Labs (Javier Montaño)
description: >
  7R assessment, workload classification, wave planning, and cutover strategy for cloud
  migration programs. Trigger: "cloud migration", "7R", "workload migration", "wave planning",
  "cutover", "replatform", "refactor".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Cloud Migration

Assess workloads using the 7R framework, classify migration strategies, plan migration waves, and design cutover procedures for moving systems to cloud infrastructure.

## Guiding Principle
> *"Migration is not a destination — it is a transformation. Every workload moved is an opportunity to improve, not just relocate."*

## Procedure

### Step 1 — Portfolio Discovery & 7R Assessment
1. Inventory all applications, databases, and infrastructure components
2. Collect metadata: technology stack, dependencies, data volumes, SLAs
3. Classify each workload using the 7R framework: Rehost, Replatform, Refactor, Repurchase, Retire, Retain, Relocate
4. Score migration complexity per workload: low/medium/high/very-high
5. Produce a migration disposition matrix with rationale per classification

### Step 2 — Dependency Mapping & Risk Analysis
1. Map application-to-application dependencies (network, data, API)
2. Identify shared services and databases that create migration coupling
3. Classify risks per workload: data loss, downtime, performance, compliance
4. Identify migration blockers: licensing, hardware dependencies, security constraints
5. Produce a dependency graph with migration-critical paths highlighted

### Step 3 — Wave Planning
1. Group workloads into migration waves based on dependencies and risk
2. Sequence waves from low-risk/low-dependency to high-complexity
3. Define success criteria and rollback triggers per wave
4. Estimate duration and team resources per wave
5. Build a migration timeline with parallel and sequential workstreams

### Step 4 — Cutover Design
1. Design cutover procedure for each migration pattern (rehost, replatform, refactor)
2. Define data synchronization strategy: one-time vs. continuous replication
3. Plan DNS/traffic switchover approach: blue-green, canary, weighted routing
4. Design rollback procedure with maximum acceptable rollback window
5. Create a cutover runbook with step-by-step instructions and decision points

## Quality Criteria
- Every workload has a 7R classification with documented rationale
- Dependency map validated against actual network traffic data
- Wave plan respects dependency ordering with no orphaned workloads
- Cutover runbook tested in dry-run with documented results

## Anti-Patterns
- Migrating everything as rehost without evaluating modernization opportunities
- Ignoring database dependencies when planning migration waves
- No rollback plan or untested rollback procedures
- Wave planning based on org chart rather than technical dependencies
