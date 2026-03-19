---
name: deployment-strategy
author: JM Labs (Javier Montaño)
description: >
  Designs deployment strategies including blue-green, canary, rolling, feature flags, and progressive delivery.
  Trigger: "deployment strategy", "blue-green", "canary deployment", "feature flags", "progressive delivery", "rolling update".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Deployment Strategy

Designs deployment strategies that minimize risk and downtime, selecting appropriate patterns (blue-green, canary, rolling), feature flag architectures, and progressive delivery pipelines.

## Guiding Principle

> *"The best deployment is one your users never notice. The best rollback is one that happens before users are affected."*

## Procedure

### Step 1 — Assess Deployment Requirements
1. Determine the zero-downtime requirement: hard zero (financial), soft zero (minor blip acceptable), or maintenance window.
2. Inventory the deployment targets: containers, serverless, VMs, edge, mobile.
3. Map database migration coupling: can the old code run against the new schema? (expand-contract compatibility).
4. Identify the blast radius: how many users are affected if a deployment fails?
5. Document the current deployment frequency and target frequency.

### Step 2 — Select Deployment Pattern
1. **Rolling Update**: Gradually replace instances; simple but limited rollback granularity.
2. **Blue-Green**: Two identical environments; instant traffic switch; requires 2x infrastructure.
3. **Canary**: Route a small percentage of traffic to the new version; promote or rollback based on metrics.
4. **Shadow (Dark Launch)**: Send duplicate traffic to the new version without serving its responses.
5. **A/B Testing Deployment**: Route users to different versions based on user attributes for experimentation.
6. Select the pattern based on risk tolerance, infrastructure cost, and operational maturity.

### Step 3 — Feature Flag Architecture
1. Design the feature flag taxonomy: release flags (temporary), ops flags (permanent), experiment flags (time-boxed).
2. Select the flag management system: LaunchDarkly, Unleash, Flagsmith, or custom.
3. Define flag lifecycle: creation → testing → rollout → cleanup (remove stale flags).
4. Specify the evaluation context: user ID, tenant, region, percentage, custom attributes.
5. Establish the flag cleanup policy: remove release flags within 2 sprints of full rollout.

### Step 4 — Progressive Delivery Pipeline
1. Define the promotion stages: dev → staging → canary (1%) → partial (10%) → full (100%).
2. Specify automated promotion criteria: error rate < threshold, latency < SLO, no alerts.
3. Define automated rollback triggers: error rate spike, latency degradation, manual abort.
4. Integrate with observability: deployment markers on dashboards, automated metric comparison.
5. Document the manual override procedure for emergency rollbacks.

## Quality Criteria
- Every deployment has an automated rollback trigger based on observability metrics.
- Database migrations are backward-compatible (expand-contract) to support rollback without data loss.
- Feature flags have documented owners and a cleanup schedule to prevent flag debt.
- Canary deployments compare metrics against a baseline, not just absolute thresholds.

## Anti-Patterns
- Deploying database migrations that break the previous application version ("locked step" deployments).
- Feature flags without cleanup policy, accumulating hundreds of stale flags ("flag debt").
- Canary deployments without automated metric comparison ("canary theater" — deploy and hope).
- Skipping staging environment because "it works locally" or "we have good tests."
