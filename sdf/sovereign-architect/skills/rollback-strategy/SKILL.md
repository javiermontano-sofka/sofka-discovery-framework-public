---
name: rollback-strategy
author: JM Labs (Javier Montaño)
description: >
  Designs undo plans for each deployment phase, including data migration reversibility and feature flag fallbacks.
  Trigger: "rollback plan", "undo strategy", "how to revert", "migration reversibility".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Rollback Strategy

Produces a comprehensive rollback plan for every phase of a deployment, ensuring that any change can be safely reversed without data loss, service disruption, or orphaned state.

## Guiding Principle

> *"The measure of a deployment is not how it goes forward, but how gracefully it can go back."*

## Procedure

### Step 1 — Inventory Rollback Surfaces
1. List every deployment artifact: code, database migrations, infrastructure changes, config changes, feature flags.
2. Classify each artifact's reversibility: fully reversible, partially reversible, irreversible.
3. Identify stateful vs. stateless changes — stateful changes require data-aware rollback.
4. Map each artifact to its deployment mechanism (CI/CD, manual, IaC).

### Step 2 — Design Per-Phase Undo Plans
1. For each deployment phase, write explicit rollback steps in reverse order.
2. For database migrations: design compensating migrations (down migrations) and verify data integrity.
3. For feature flags: define the flag state that restores previous behavior.
4. For infrastructure changes: document terraform destroy / rollback commands.
5. Estimate rollback time for each phase.

### Step 3 — Handle Data Migration Reversibility
1. Identify data transformations that are lossy (column drops, format changes).
2. Design backup-before-migrate strategies for lossy transformations.
3. Create data validation queries that confirm rollback completeness.
4. Define the point-of-no-return: the phase after which rollback requires restore-from-backup.
5. Document the data reconciliation process if rollback occurs mid-migration.

### Step 4 — Validate and Document
1. Produce a rollback runbook with step-by-step commands.
2. Define rollback triggers: metrics thresholds, error rates, or manual decision criteria.
3. Assign rollback ownership: who decides, who executes, who verifies.
4. Schedule rollback drills for high-risk deployments.
5. Tag each rollback step with evidence level.

## Quality Criteria
- Every deployment phase has a corresponding rollback phase.
- Data migration rollbacks are tested against realistic data volumes.
- Point-of-no-return is explicitly identified and communicated.
- Rollback time estimates are stated and validated.

## Anti-Patterns
- Assuming all changes are reversible without analysis.
- Writing rollback plans that have never been tested.
- Ignoring data state changes during rollback design.
- Treating rollback as an afterthought instead of a first-class deliverable.
