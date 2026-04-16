# Cloud-Native Architecture — Sample Output

## Context
A SaaS platform running 15 microservices on Kubernetes (EKS) with growing cloud costs and inconsistent deployment practices. Team requests a cloud-native maturity assessment and optimization plan.

## Output: Cloud-Native Maturity Radar

| Dimension | Score | Assessment |
|-----------|-------|------------|
| Culture & Organization | 3/5 | DevOps practices adopted; platform team forming |
| Build & Release | 2/5 | CI exists but no GitOps; manual deployments to production |
| Infrastructure | 4/5 | Kubernetes with IaC (Terraform); needs policy enforcement |
| Observability | 2/5 | Basic logging only; no distributed tracing or SLOs |
| Security | 3/5 | mTLS via service mesh; missing runtime security scanning |
| Cost Management | 1/5 | No cost allocation; no right-sizing; 40% estimated waste |

## Output: Right-Sizing Analysis

| Service | Current CPU Req | P95 Usage | Recommended | Monthly Savings |
|---------|----------------|-----------|-------------|----------------|
| `user-api` | 1000m | 120m | 250m | $340 |
| `product-catalog` | 2000m | 180m | 400m | $680 |
| `search-indexer` | 4000m | 3200m | 4000m | $0 (correctly sized) |
| `notification-svc` | 500m | 15m | 100m | $170 |
| `analytics-worker` | 2000m | 50m (idle 22h/day) | KEDA scale-to-zero | $890 |

**Total estimated monthly savings: $2,080 (38% reduction)**

## Output: Optimization Plan

### Phase 1 — Quick Wins (Week 1-2)
- Right-size CPU/memory requests for 12 over-provisioned services
- Enable VPA in recommendation mode for continuous right-sizing
- Convert `analytics-worker` to KEDA-based scaling (scale to zero)

### Phase 2 — GitOps Adoption (Week 3-6)
- Deploy ArgoCD for declarative, auditable deployments
- Migrate all environments to GitOps workflow
- Implement progressive delivery (canary) for production releases

### Phase 3 — Observability Foundation (Week 7-10)
- Deploy OpenTelemetry collectors with auto-instrumentation
- Define SLOs for top 5 critical services
- Build alert-on-SLO-burn-rate dashboards

### Phase 4 — FinOps Practice (Ongoing)
- Tag all resources with team/service/environment labels
- Deploy Kubecost for per-team cost visibility
- Establish weekly cost review cadence with engineering leads
