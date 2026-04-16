---
name: ci-cd-analyzer
author: JM Labs (Javier Montaño)
description: >
  Pipeline health, build times, flakiness, and deployment strategy analysis.
  Trigger: "analyze CI/CD", "pipeline health", "build times", "deployment strategy".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# CI/CD Analyzer

Evaluate continuous integration and deployment pipelines for reliability, speed, security practices, and deployment strategy maturity.

## Guiding Principle

> *"A pipeline you don't trust is a pipeline you'll bypass. Reliability is non-negotiable."*

## Procedure

### Step 1 — Pipeline Discovery
1. Locate CI/CD configuration files: `.github/workflows/`, `.gitlab-ci.yml`, `Jenkinsfile`, `.circleci/`, `azure-pipelines.yml`, `bitbucket-pipelines.yml`.
2. Identify all pipeline definitions: build, test, lint, deploy, release.
3. Map trigger conditions: push, PR, schedule, manual, tag-based.
4. Catalog environment targets: dev, staging, production, preview.
5. Document the pipeline graph with dependencies between jobs `[HECHO]`.

### Step 2 — Reliability Assessment
1. Analyze job configurations for retry logic and timeout settings.
2. Check for pinned action/image versions vs. floating tags (`:latest` is a reliability risk).
3. Identify jobs without caching (slow builds indicate missing cache).
4. Look for flakiness indicators: retry directives, `continue-on-error`, conditional failure ignoring.
5. Assess secret management: hardcoded vs. vault/secrets manager `[HECHO]`.

### Step 3 — Speed Analysis
1. Identify the longest-running jobs and their bottlenecks.
2. Check for parallelization opportunities (independent jobs running sequentially).
3. Evaluate caching strategies: dependency caches, build caches, Docker layer caches.
4. Assess whether test splitting or sharding is used for large test suites.
5. Estimate total pipeline time and identify the critical path.

### Step 4 — Deployment Strategy
1. Classify deployment strategy: rolling, blue-green, canary, recreate, or manual.
2. Check for rollback mechanisms and health checks.
3. Assess environment promotion: automated vs. manual gates.
4. Verify production deploy requires approval or conditions `[HECHO]`.
5. Check for feature flags and progressive delivery integration.

## Quality Criteria
- Pipeline configs analyzed directly, not described from memory `[HECHO]`
- Reliability issues backed by specific configuration evidence
- Speed bottlenecks identified with estimated time impact
- Deployment strategy classified with maturity assessment

## Anti-Patterns
- Ignoring scheduled/cron pipelines (they often run neglected)
- Assuming all green builds mean the pipeline is healthy
- Not checking whether CI secrets are scoped appropriately
- Overlooking deployment rollback capabilities
