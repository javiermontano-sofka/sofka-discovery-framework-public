# CI/CD Analyzer — Body of Knowledge

## Core Concepts
- **DORA metrics**: Deployment frequency, lead time for changes, change failure rate, time to restore — the four key measures of delivery performance `[HECHO]`
- **Pipeline as code**: CI/CD configuration versioned alongside application code for auditability and reproducibility
- **Immutable artifacts**: Build once, deploy everywhere; the same artifact moves through environments unchanged
- **Shift-left testing**: Moving quality gates earlier in the pipeline to catch issues sooner and cheaper
- **Trunk-based development**: Short-lived branches merged frequently; requires robust CI to maintain stability
- **GitOps**: Declarative infrastructure with Git as the single source of truth; reconciliation loops ensure desired state

## Patterns & Practices
- **Parallelization**: Independent jobs run concurrently; test sharding splits large suites across workers
- **Caching layers**: Dependency cache (node_modules), build cache (compiled artifacts), Docker layer cache
- **Progressive delivery**: Feature flags + canary releases + automated rollback based on error rate thresholds
- **Ephemeral environments**: Per-PR preview environments for integration testing before merge
- **Security scanning in pipeline**: SAST, DAST, SCA, and secret scanning as pipeline stages

## Tools & Technologies
- **CI platforms**: GitHub Actions, GitLab CI, Jenkins, CircleCI, Azure DevOps, Buildkite
- **Deployment**: ArgoCD, Flux, Spinnaker, AWS CodeDeploy, Vercel, Netlify
- **Artifact registries**: Docker Hub, ECR, GCR, Artifactory, npm registry
- **Monitoring**: Datadog CI Visibility, BuildPulse (flaky tests), Codecov

## References
- DORA — "Accelerate: State of DevOps" annual report
- Jez Humble & David Farley — "Continuous Delivery"
- Google SRE Book — Chapter on release engineering
- Martin Fowler — "Continuous Integration" article
