# DevOps Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

DevOps patterns bridge the gap between development velocity and operational reliability. A mature DevOps practice enables teams to ship confidently through automated pipelines, infrastructure as code, container orchestration, and progressive delivery. This document covers CI/CD design, containerization, orchestration, IaC tools, GitOps workflows, and feature flag strategies for architects governing delivery infrastructure.

## Core Patterns

### CI/CD Pipeline Architecture

**Continuous Integration**: Every commit triggers build, lint, test, and security scan. Trunk-based development with short-lived branches (< 1 day) is the gold standard. CI must be fast — under 10 minutes for the inner loop (build + unit tests), under 30 minutes for the full pipeline including integration tests.

**Continuous Delivery**: Every commit that passes CI is deployable to production. Deployment is a business decision, not a technical one. Requires: automated testing with high confidence, infrastructure automation, and deployment automation.

**Continuous Deployment**: Every commit that passes CI deploys to production automatically. Requires: feature flags for incomplete features, canary/blue-green deployments for safety, robust monitoring and automated rollback.

**Pipeline stages** (ordered): checkout, dependency install (cached), lint, unit test, build, integration test, security scan (SAST), container build, container scan, deploy to staging, smoke test, deploy to production, post-deploy verification.

**Platform options**: GitHub Actions (best for GitHub-native teams, marketplace ecosystem), GitLab CI (best for self-hosted, built-in registry and security), Jenkins (legacy but flexible, plugin-based), CircleCI (fast, good caching), Buildkite (hybrid agents, scale). For enterprises: Harness, Tekton (Kubernetes-native), Dagger (portable pipelines).

### Container Strategy (Docker)

**Multi-stage builds**: Separate build and runtime stages. Build stage includes compilers, dev dependencies; runtime stage contains only the application and production dependencies. Reduces image size by 60-90%.

**Base image selection**: Use distroless or alpine-based images for production. Distroless (gcr.io/distroless) has no shell or package manager — smallest attack surface. Alpine is a compromise with shell access for debugging. Never use `latest` tag — pin specific versions.

**Layer optimization**: Order Dockerfile instructions from least-changing to most-changing. Copy dependency manifests first (`package.json`, `requirements.txt`, `go.mod`), install dependencies, then copy source code. Maximizes layer caching.

**Security**: Run as non-root user (`USER 1001`). Use read-only filesystem where possible. Scan images with Trivy, Grype, or Snyk Container in CI. Set resource limits (CPU, memory) in orchestration config.

### Kubernetes Orchestration

**When to adopt**: Kubernetes is justified when running 10+ services, needing automated scaling, requiring self-healing, or operating multi-cloud. For fewer services, consider managed container services (ECS, Cloud Run, Azure Container Apps) — less operational overhead.

**Core abstractions**: Deployments (stateless workloads), StatefulSets (databases, stateful services), DaemonSets (node-level agents), Jobs/CronJobs (batch processing). Services for internal networking, Ingress for external traffic routing.

**Namespace strategy**: Separate namespaces by environment (dev, staging, prod) or by team/domain. Apply ResourceQuotas and LimitRanges per namespace. Use NetworkPolicies to restrict inter-namespace communication.

**Helm vs Kustomize**: Helm for templated, parameterized charts with release management. Kustomize for overlay-based configuration without templating. Kustomize is simpler for environment-specific overrides; Helm is better for reusable, distributable packages. Both can coexist.

### Infrastructure as Code (IaC)

**Terraform**: Declarative, provider-based, state-managed. Largest provider ecosystem (AWS, GCP, Azure, Cloudflare, Datadog). HCL syntax. State file requires remote backend (S3+DynamoDB, Terraform Cloud). Module system for reusable infrastructure. Trade-off: state management complexity, plan/apply workflow requires discipline.

**Pulumi**: IaC using general-purpose languages (TypeScript, Python, Go, C#). Same cloud providers as Terraform. Benefits: IDE autocomplete, testing with familiar frameworks, shared logic with application code. Trade-off: smaller community, language complexity can obscure infrastructure intent.

**AWS CDK / CDKTF**: CDK generates CloudFormation (AWS-specific) or CDKTF generates Terraform. Good for teams deep in one ecosystem. Trade-off: abstraction layers can obscure what is actually provisioned.

**Key principles**: All infrastructure in version control. No manual changes (detect drift with `terraform plan`). Modular design — network, compute, database as separate modules/stacks. Environment parity — same modules, different parameters.

### GitOps

**Core principle**: Git is the single source of truth for declarative infrastructure and application state. Changes are made via pull requests, applied by an automated agent, and reconciled continuously.

**ArgoCD**: Kubernetes-native GitOps controller. Watches Git repositories, detects drift between desired state (Git) and actual state (cluster), and reconciles automatically. Application CRDs define source repo, target cluster, and sync policy. Supports Helm, Kustomize, plain YAML, and Jsonnet.

**Flux**: Alternative GitOps toolkit. More composable — separate controllers for source, Kustomize, Helm, notification. Better for multi-tenancy scenarios. Less opinionated UI.

**Workflow**: Developer merges code PR. CI builds container image and pushes to registry. Image updater (ArgoCD Image Updater or Flux Image Automation) detects new image, updates manifests in config repo. ArgoCD/Flux detects manifest change, syncs to cluster. Rollback = revert Git commit.

### Feature Flags

**Implementation tiers**: Tier 1 — simple boolean flags in config (environment variables, config file). Tier 2 — flag management service with UI (LaunchDarkly, Unleash, Flagsmith, ConfigCat). Tier 3 — full targeting rules (user segments, percentage rollouts, A/B testing).

**Flag types**: Release flags (short-lived, remove after rollout), ops flags (kill switches, long-lived), experiment flags (A/B tests, remove after analysis), permission flags (entitlements, long-lived).

**Lifecycle discipline**: Every flag has an owner and expiration date. Stale flags (> 90 days for release flags) are tech debt. Track flag count as a team metric. Automated cleanup reminders.

## Decision Framework

| Criterion | Kubernetes | ECS/Cloud Run | Docker Compose |
|-----------|-----------|---------------|----------------|
| Service count | 10+ | 3-15 | 1-5 |
| Team ops skill | High | Medium | Low |
| Multi-cloud need | Yes | No | No |
| Auto-scaling | Native | Managed | Manual |
| Cost at small scale | High | Medium | Low |

| IaC Tool | Best For |
|----------|----------|
| Terraform | Multi-cloud, largest ecosystem |
| Pulumi | Teams wanting real programming languages |
| AWS CDK | AWS-only shops |
| CloudFormation | Simple AWS-only, no external tooling |

## Anti-Patterns

- **Snowflake environments**: Production differs from staging in undocumented ways. All environments must use the same IaC modules with different parameters.
- **CI/CD pipeline as code review bottleneck**: Pipeline takes 45+ minutes. Parallelize stages, cache dependencies, use test splitting, run only affected tests.
- **Kubernetes for everything**: Running a simple CRUD app on Kubernetes with 3 nodes is over-engineering. Match orchestration complexity to actual needs.
- **Manual infrastructure changes**: "Just this once" in the console. Drift detection must be automated and changes must go through IaC. Terraform Cloud or Spacelift can enforce this.

## Evidence Signals

- `.github/workflows/`, `.gitlab-ci.yml`, `Jenkinsfile`, `.circleci/config.yml` — CI/CD platform and pipeline maturity.
- `Dockerfile` quality: multi-stage builds, non-root user, pinned base images, layer ordering.
- `terraform/`, `pulumi/`, `cdk/` directories — IaC adoption. Check for remote state backend configuration.
- `argocd/`, `flux-system/` in cluster or config repos — GitOps adoption.
- `k8s/`, `helm/`, `charts/` directories — Kubernetes deployment manifests. Check for resource limits, health probes, pod disruption budgets.
- Feature flag SDK in dependencies (`launchdarkly-node-server-sdk`, `unleash-client`, `@configcat/node`) indicates progressive delivery maturity.

---
*Sovereign Architect RAG Priming · JM Labs*
