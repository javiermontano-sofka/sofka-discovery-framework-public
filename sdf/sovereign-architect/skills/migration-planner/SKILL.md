---
name: migration-planner
author: JM Labs (Javier Montaño)
description: >
  Plans system migrations using strangler fig, blue-green, data migration, and re-platforming strategies.
  Trigger: "plan migration", "strangler fig", "re-platform", "data migration", "legacy modernization".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Migration Planner

Produces detailed migration plans for legacy modernization, platform changes, and data migrations, using proven patterns like Strangler Fig, Blue-Green, and incremental parallel-run strategies.

## Guiding Principle

> *"The safest migration is the one where you can turn back at every step."*

## Procedure

### Step 1 — Assess Current State
1. Inventory the current system: components, integrations, data stores, and external dependencies.
2. Map traffic patterns and peak usage windows.
3. Identify the migration drivers: end-of-life, cost, performance, compliance, or feature velocity.
4. Classify risk per component: data loss risk, downtime sensitivity, regulatory constraints.
5. Document the "do nothing" cost as a baseline.

### Step 2 — Select Migration Strategy
1. Evaluate migration patterns against the current state:
   - **Strangler Fig**: Incrementally replace components behind a routing facade.
   - **Blue-Green**: Run old and new systems in parallel, switch traffic atomically.
   - **Lift and Shift**: Move as-is to new infrastructure (lowest risk, lowest benefit).
   - **Re-platform**: Adapt to new runtime without rewriting (e.g., containerize).
   - **Re-architect**: Redesign and rebuild from scratch (highest risk, highest benefit).
2. Document the chosen strategy with justification against the risk profile.
3. Define the rollback mechanism for each phase.

### Step 3 — Data Migration Plan
1. Profile source data: volume, schema, quality issues, referential integrity.
2. Design the ETL/ELT pipeline with transformation rules.
3. Plan for dual-write or change-data-capture (CDC) during the transition period.
4. Define data validation criteria: row counts, checksums, business rule assertions.
5. Schedule migration rehearsals on production-like data.

### Step 4 — Execution Roadmap
1. Break the migration into phases with clear milestones and go/no-go gates.
2. Define success criteria for each phase (latency, error rate, data consistency).
3. Assign ownership per phase and establish a war-room cadence.
4. Document the communication plan for stakeholders and end users.
5. Produce a rollback runbook for each phase.

## Quality Criteria
- Every phase has an explicit rollback procedure tested in a rehearsal environment.
- Data validation includes both automated checks and manual spot-checks.
- Migration plan accounts for peak traffic windows and avoids them for cutover.
- Total acceptable downtime is defined and each phase's contribution is budgeted.

## Anti-Patterns
- "Big bang" migration with no rollback path ("hope-driven migration").
- Migrating data without profiling quality, then discovering corruption post-cutover.
- Running dual systems indefinitely without a decommission deadline ("zombie legacy").
- Skipping migration rehearsals because "it worked in staging."
