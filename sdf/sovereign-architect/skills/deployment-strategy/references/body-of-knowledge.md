# Deployment Strategy — Body of Knowledge

## Core Concepts
- **Blue-Green Deployment**: Maintain two production environments; deploy to the inactive one, then switch traffic. Enables instant rollback by switching back.
- **Canary Deployment**: Release changes to a small subset of users first, monitor metrics, then gradually increase the rollout percentage.
- **Rolling Update**: Replace instances one at a time (or in batches), ensuring some instances always serve traffic during the update.
- **Progressive Delivery**: The practice of gradually rolling out changes with automated analysis at each stage to decide whether to promote or rollback.
- **Feature Flags**: Conditional code paths that enable decoupling deployment from release, allowing features to be toggled without redeployment.
- **Expand-Contract Migration**: Database change pattern where new schema elements are added first (expand), data migrated, then old elements removed (contract).
- **Deployment Marker**: An annotation on observability dashboards indicating when a deployment occurred, for correlation with metric changes.
- **Blast Radius**: The scope of users or systems affected if a deployment introduces a defect.

## Patterns & Practices
- **GitOps**: Declarative infrastructure and application state stored in Git; changes are applied automatically by a reconciliation operator (ArgoCD, Flux).
- **Immutable Deployments**: Deploy new containers/VMs instead of patching existing ones; ensures reproducibility and clean rollback.
- **Traffic Splitting**: Using service mesh or ingress controller to route percentages of traffic to different versions (Istio, Linkerd, NGINX).
- **Automated Canary Analysis**: Tools like Kayenta or Flagger compare canary metrics against baseline using statistical tests.
- **Pre/Post Deployment Hooks**: Run smoke tests after deployment, database migrations before deployment, cleanup after successful rollout.
- **Deployment Windows**: Restrict deployments to business hours when the team is available to respond to issues (vs. Friday 5pm deploys).

## Tools & Technologies
- **ArgoCD / Flux**: GitOps-based continuous delivery for Kubernetes.
- **Flagger**: Progressive delivery operator for Kubernetes with automated canary analysis.
- **Spinnaker**: Multi-cloud continuous delivery platform with sophisticated deployment strategies.
- **LaunchDarkly / Unleash / Flagsmith**: Feature flag management platforms.
- **Istio / Linkerd**: Service mesh platforms enabling traffic splitting for canary and A/B deployments.
- **Helm / Kustomize**: Kubernetes manifest templating and configuration management.

## References
- Humble, J. & Farley, D., "Continuous Delivery" (Addison-Wesley, 2010).
- Forsgren, N. et al., "Accelerate" (IT Revolution Press, 2018) — DORA metrics and deployment frequency.
- Kubernetes Documentation — Deployment strategies.
- Google SRE Book — "Release Engineering" chapter.
