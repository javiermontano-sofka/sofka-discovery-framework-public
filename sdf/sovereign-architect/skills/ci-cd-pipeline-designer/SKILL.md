---
name: ci-cd-pipeline-designer
author: JM Labs (Javier Montaño)
description: >
  Designs CI/CD pipeline architecture including stages, quality gates, artifact management, and deployment strategies.
  Trigger: "CI/CD pipeline", "build pipeline", "deployment pipeline", "continuous delivery setup".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# CI/CD Pipeline Designer

Architects end-to-end CI/CD pipelines that balance speed, safety, and observability — from commit to production with appropriate gates at every stage.

## Guiding Principle

> *"A pipeline is not a script; it is an opinion about quality made executable."*

## Procedure

### Step 1 — Assess Current State
1. Inventory existing CI/CD tools, scripts, and configurations.
2. Measure current cycle time: commit to production deployment.
3. Identify bottlenecks: slow builds, flaky tests, manual approvals, environment provisioning.
4. Map the current branching strategy and its interaction with the pipeline.
5. Catalog existing artifacts: container images, packages, binaries, static assets.

### Step 2 — Design Pipeline Stages
1. **Build Stage**: Compile, lint, type-check, dependency audit — must complete in < 2 minutes.
2. **Test Stage**: Unit tests (fast), integration tests (parallel), contract tests — with caching.
3. **Security Stage**: SAST, dependency vulnerability scan, secret detection, license compliance.
4. **Artifact Stage**: Build immutable artifacts (Docker images, packages), tag with commit SHA.
5. **Deploy Stage**: Progressive deployment (canary/blue-green), smoke tests, automated rollback.

### Step 3 — Define Quality Gates
1. Gate after build: compilation success, zero lint errors, type-check pass.
2. Gate after test: coverage threshold met, zero test failures, contract verification.
3. Gate after security: no critical/high vulnerabilities, no leaked secrets.
4. Gate before production: staging smoke tests pass, manual approval for high-risk changes.
5. Define gate bypass policies (emergency hotfix path with post-facto review).

### Step 4 — Optimize and Document
1. Implement caching strategies: dependency caches, Docker layer caching, test result caching.
2. Design parallel execution for independent stages.
3. Set up pipeline-as-code: version-controlled pipeline definitions.
4. Configure notifications: Slack/Teams for failures, dashboards for metrics.
5. Document the pipeline architecture with a visual diagram and runbook.

## Quality Criteria
- Commit-to-deploy cycle time is measured and optimized.
- Every quality gate has a clear pass/fail criterion and bypass policy.
- Pipeline definitions are version-controlled and reviewed like code.
- Artifact immutability is enforced — same artifact from test to production.

## Anti-Patterns
- Manual steps in the middle of an automated pipeline.
- Running all tests sequentially when parallelism is available.
- Deploying different artifacts to different environments (building per-env).
- Ignoring pipeline performance as a first-class concern.
