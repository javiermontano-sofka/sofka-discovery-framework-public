# Dynamic SME — Sample Output

## Context

A team requests a review of their Kubernetes deployment strategy for a
microservices platform running 24 services in production.

## Output

### Domain Calibration

**Domain**: Container Orchestration — Kubernetes
**Sub-domain**: Production deployment strategy for microservices
**Depth**: Deep review (production readiness assessment)
**Key Frameworks**: 12-Factor App, Kubernetes Best Practices (Google SRE), Production Readiness Checklist

### Expert Assessment

| Area | Finding | Severity | Pattern/Anti-Pattern |
|------|---------|----------|---------------------|
| Resource Management | 18 of 24 services have no resource limits defined | Critical | Anti-pattern: Unbounded resource consumption. Noisy neighbor risk. |
| Health Checks | 6 services use only TCP checks instead of application-level readiness probes | High | Anti-pattern: False positive health. Service reports ready before it can serve traffic. |
| Pod Disruption Budgets | 0 of 24 services have PDBs configured | High | Missing pattern: No disruption control during node drains or upgrades. |
| HPA Configuration | 3 services have HPA. 21 run at fixed replica count. | Medium | Gap: No auto-scaling for variable workloads. Over-provisioned during off-peak. |
| Deployment Strategy | All services use RollingUpdate with default settings | Low | Acceptable but not optimal. Canary deployments recommended for critical services. |
| Secrets Management | 8 services mount secrets as environment variables from ConfigMaps | Critical | Anti-pattern: Secrets in ConfigMaps (not Kubernetes Secrets). No encryption at rest. |

### Domain-Specific Recommendations

1. **Resource Limits (Critical)**: Set CPU and memory requests AND limits for all 24 services. Use vertical pod autoscaler (VPA) in recommendation mode for 2 weeks to establish baselines before setting static limits.

2. **Secrets Management (Critical)**: Migrate all secrets from ConfigMaps to Kubernetes Secrets with encryption at rest enabled. Consider external secrets operator (AWS Secrets Manager or HashiCorp Vault) for production-grade secret lifecycle management.

3. **Health Probes (High)**: Implement application-level readiness probes that verify downstream dependency connectivity. The probe should return unhealthy if the database connection pool is exhausted or a critical dependency is unreachable.

4. **Pod Disruption Budgets (High)**: Define PDBs for all services with `minAvailable` based on the service's criticality tier. Tier 1 (payment, auth): minAvailable 2. Tier 2 (catalog, search): minAvailable 1.

### Expertise Boundary Flag

This review covers Kubernetes deployment strategy. The following areas were observed but require specialist consultation:
- **Network policies**: Not reviewed. Requires network security SME assessment.
- **RBAC configuration**: Observed but not deeply assessed. Requires security domain review.
- **Cost optimization**: Spot instance strategy and reserved capacity planning require FinOps expertise.
