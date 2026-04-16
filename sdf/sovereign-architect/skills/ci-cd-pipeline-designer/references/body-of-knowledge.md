# CI/CD Pipeline Designer — Body of Knowledge

## Core Concepts
- **Continuous Integration (CI)**: Automatically build and test every commit to detect integration issues early.
- **Continuous Delivery (CD)**: Every commit that passes CI is deployable; deployment is a business decision.
- **Continuous Deployment**: Every commit that passes all gates is automatically deployed to production.
- **Pipeline as Code**: Pipeline definitions stored in the repository, versioned, reviewed, and tested like application code.
- **Artifact Immutability**: Build once, deploy everywhere — the same binary/image moves through all environments.
- **Quality Gate**: An automated checkpoint that blocks pipeline progression unless defined criteria are met.
- **Deployment Strategy**: The pattern used to roll out changes — blue-green, canary, rolling, feature flags.
- **Blast Radius Control**: Techniques to limit the impact of a bad deployment: canary percentages, ring deployments.

## Patterns & Practices
- **Trunk-Based Development**: Short-lived branches merged to main frequently, pipelines run on every push.
- **Build Cache Optimization**: Cache dependencies, Docker layers, and intermediate build artifacts to speed up pipelines.
- **Parallel Test Execution**: Split test suites across multiple runners to reduce feedback time.
- **Environment Promotion**: Artifacts promote through dev → staging → production with increasing gate strictness.
- **Ephemeral Environments**: Spin up per-PR preview environments, tear down on merge.
- **GitOps**: Desired state declared in Git; deployment tools reconcile cluster state to match.

## Tools & Technologies
- **CI Platforms**: GitHub Actions, GitLab CI, Jenkins, CircleCI, Buildkite.
- **Container Registries**: Docker Hub, ECR, GCR, GitHub Container Registry.
- **Artifact Stores**: Nexus, Artifactory, npm registry, PyPI.
- **Deployment Tools**: ArgoCD, Flux, Spinnaker, Kubernetes, Terraform.
- **Security Scanning**: Snyk, Trivy, Semgrep, Gitleaks, Dependabot.
- **Monitoring**: Datadog, Grafana, PagerDuty for deployment health.

## References
- Jez Humble & David Farley, "Continuous Delivery" — The definitive guide to deployment pipelines.
- Forsgren, Humble & Kim, "Accelerate" — DORA metrics and high-performing delivery teams.
- Google Cloud, "DevOps Capabilities" — Pipeline design patterns at scale.
- Thoughtworks Technology Radar — Current CI/CD tool recommendations.
