# CI/CD Pipeline Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

CI/CD pipelines automate the path from code commit to production deployment. The pipeline's design directly impacts deployment frequency, lead time, failure rate, and recovery time — the four DORA metrics that predict engineering performance. This document covers pipeline platforms, branching strategies, feature flags, artifact management, and environment promotion.

## Pipeline Platforms

### GitHub Actions

```yaml
name: CI
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: npm
      - run: npm ci
      - run: npm test
      - run: npm run build
```

**Strengths**: Native GitHub integration, marketplace of actions, free for public repos, matrix builds, reusable workflows. **Considerations**: YAML complexity at scale, runner costs for private repos, limited local debugging (act helps).

### GitLab CI

```yaml
stages:
  - test
  - build
  - deploy

test:
  stage: test
  image: node:20-alpine
  script:
    - npm ci
    - npm test
  cache:
    paths:
      - node_modules/

build:
  stage: build
  script:
    - npm run build
  artifacts:
    paths:
      - dist/
```

**Strengths**: Built into GitLab, DAG pipeline support, built-in container registry, auto DevOps. **Considerations**: Self-hosted runners need maintenance, YAML can become very large.

### Jenkins

**Strengths**: Extremely flexible, vast plugin ecosystem, Groovy scripting (Jenkinsfile), self-hosted control. **Considerations**: Operational burden (maintenance, security patching), plugin compatibility issues, slower to set up than managed solutions.

### Platform Comparison

| Factor | GitHub Actions | GitLab CI | Jenkins |
|--------|---------------|-----------|---------|
| Hosting | Managed (+ self-hosted runners) | Managed (+ self-hosted runners) | Self-hosted only |
| Config | YAML | YAML | Groovy (Jenkinsfile) |
| Marketplace | Actions marketplace | Templates | Plugins |
| Container registry | GitHub Packages | Built-in | Plugin |
| Security scanning | Dependabot, CodeQL | SAST/DAST/Secret detection built-in | Plugins |
| Cost model | Per-minute | Per-minute or flat | Infrastructure cost |

## Branching Strategies

### Trunk-Based Development

All developers commit to `main` (trunk) directly or via short-lived feature branches (<1 day). Requires feature flags to hide incomplete work. Enables continuous deployment. DORA research shows this is the highest-performing strategy.

**Rules**:
- Branches live <24 hours
- All commits pass CI before merge
- Feature flags gate incomplete features
- No long-lived branches

### GitFlow

Structured branching: `main`, `develop`, `feature/*`, `release/*`, `hotfix/*`. Designed for versioned software releases. Creates bottlenecks at merge points. High overhead for web applications with continuous deployment.

**When justified**: Desktop software, mobile apps, or systems with formal release cycles and multiple supported versions.

### GitHub Flow

Simplified: `main` + short-lived feature branches. Every merge to `main` is deployable. Pull requests are the review and merge mechanism. Good middle ground for teams not ready for pure trunk-based development.

### Comparison

| Factor | Trunk-Based | GitHub Flow | GitFlow |
|--------|------------|-------------|---------|
| Branch lifetime | Hours | Days | Days to weeks |
| Merge frequency | Continuous | Per PR | Per release |
| Feature flags needed | Yes | Optional | No |
| Release process | Continuous | Per merge | Formal release branch |
| Merge conflicts | Rare | Occasional | Frequent |
| Best for | High-performing teams, web apps | Most web teams | Versioned software |

## Feature Flags

Feature flags decouple deployment from release. Code ships to production but is toggled on/off for specific users or cohorts.

### Flag Types

| Type | Lifecycle | Example |
|------|-----------|---------|
| **Release** | Short (days-weeks) | New checkout flow behind flag during development |
| **Experiment** | Medium (weeks) | A/B test of pricing page |
| **Operational** | Permanent | Circuit breaker, kill switch for expensive feature |
| **Permission** | Permanent | Premium feature gated by subscription tier |

### Platforms

| Platform | Type | Strengths |
|----------|------|-----------|
| **LaunchDarkly** | SaaS | Mature, targeting rules, audit log, SDKs for 25+ languages |
| **Unleash** | Open source | Self-hosted, Kubernetes-native, good API |
| **Flagsmith** | Open source + SaaS | Feature flags + remote config, self-hosted or managed |
| **Split.io** | SaaS | Feature flags + experimentation + metrics |
| **OpenFeature** | Standard | Vendor-neutral SDK specification (CNCF) |

### Best Practices

1. Name flags descriptively: `enable-new-checkout-v2` not `flag-123`
2. Set expiration dates for release flags
3. Clean up stale flags (technical debt accumulates fast)
4. Test both flag states in CI
5. Use flag dependencies sparingly (creates coupling)
6. Audit flag changes (who toggled what, when)
7. Have a kill switch mechanism for critical flags

## Artifact Management

### Container Registries

| Registry | Type | Strengths |
|----------|------|-----------|
| **Docker Hub** | SaaS | Universal default, public images |
| **GitHub Container Registry** | SaaS | GitHub-native, free for public |
| **Amazon ECR** | Managed | AWS-native, IAM integration, replication |
| **Google Artifact Registry** | Managed | GCP-native, multi-format (Docker, npm, Maven) |
| **Harbor** | Open source | Self-hosted, vulnerability scanning, replication |

### Versioning Strategies

| Strategy | Format | Use Case |
|----------|--------|----------|
| **Semantic versioning** | `v1.2.3` | Libraries, APIs with backward compatibility contracts |
| **CalVer** | `2026.03.17` | Applications with continuous deployment |
| **Git SHA** | `abc1234` | Internal builds, immutable reference |
| **Branch + SHA** | `main-abc1234` | Development builds |

### Artifact Immutability

Once published, an artifact version must never change. If a version is broken, publish a new version. Immutability enables reliable rollbacks and auditable deployments.

## Environment Promotion Strategies

### Linear Promotion

```
Build → Dev → Staging → Production
```

Each environment is a gate. The same artifact (image tag, binary) promotes through all environments. Only configuration changes between environments (via ConfigMaps, environment variables, or secret managers).

### Ring-Based Deployment

```
Build → Ring 0 (internal) → Ring 1 (canary 1%) → Ring 2 (early adopters 10%) → Ring 3 (all users)
```

Progressive rollout with monitoring between rings. Automated rollback if error rates exceed thresholds. Used by Microsoft, Facebook, LinkedIn.

### Blue-Green Deployment

Two identical environments. Blue runs current version; green runs new version. Switch traffic atomically (DNS or load balancer). Instant rollback by switching back. Requires 2x infrastructure during deployment.

### Canary Deployment

Route a small percentage of traffic (1-5%) to the new version. Monitor error rates, latency, business metrics. Gradually increase if healthy. Rollback if degradation detected. Requires traffic splitting capability (service mesh, load balancer, or API gateway).

### Rolling Update

Replace instances one at a time. Kubernetes default strategy. No extra infrastructure needed. Mixed versions coexist during rollout. Rollback requires re-rolling to previous version.

### Comparison

| Strategy | Zero Downtime | Rollback Speed | Infrastructure Cost | Complexity |
|----------|--------------|----------------|--------------------|-----------|
| **Blue-Green** | Yes | Instant | 2x during deploy | Medium |
| **Canary** | Yes | Fast | +1-5% during deploy | High |
| **Rolling** | Yes | Slow (re-roll) | None extra | Low |
| **Recreate** | No (downtime) | Redeploy | None extra | Lowest |

## Pipeline Security

### Supply Chain Security

| Practice | Implementation |
|----------|---------------|
| **Signed commits** | GPG/SSH key signing, branch protection |
| **Signed images** | Cosign, Notary, Docker Content Trust |
| **SBOM generation** | Syft, Trivy, `docker buildx` with SBOM |
| **Dependency scanning** | Dependabot, Renovate, Snyk |
| **SAST** | CodeQL, Semgrep, SonarQube |
| **Secret detection** | Gitleaks, TruffleHog, GitHub Secret Scanning |
| **SLSA compliance** | Build provenance, hermetic builds |

### Pipeline Hardening

1. Pin all action/plugin versions (never use `@latest` or `@main`)
2. Use OIDC for cloud authentication (no static credentials)
3. Limit pipeline permissions (principle of least privilege)
4. Separate build and deploy stages (different permissions)
5. Require approval gates for production deployments
6. Audit all pipeline changes

## Anti-Patterns

| Anti-Pattern | Problem | Fix |
|-------------|---------|-----|
| **Snowflake pipelines** | Each repo has unique CI config | Standardize with shared workflows/templates |
| **Slow CI** | >15 minutes blocks developer flow | Parallelize, cache dependencies, run only affected tests |
| **No artifact promotion** | Rebuilding for each environment | Build once, promote the same artifact |
| **Manual deployments** | Error-prone, undocumented | Automate with approval gates |
| **Stale feature flags** | Dead code, unexpected behavior | Flag hygiene: expiration dates + cleanup sprints |
| **Secrets in pipelines** | Hardcoded credentials | Use OIDC, Vault, or managed secret stores |

---

*Sovereign Architect — The pipeline is the factory. Optimize the factory.*
*JM Labs · Javier Montano.*
