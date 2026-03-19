# Cost Estimation — Sample Output

## Context
Estimating the effort for building a new customer portal with 5 major features, 3 third-party integrations, and deployment to Kubernetes.

## Output: Scope Decomposition

| Epic | Type | Effort Inductors | T-Shirt | Risk |
|------|------|-----------------|---------|------|
| User Authentication (SSO + MFA) | Integration | 3 auth flows, 2 IdP integrations | L | Medium |
| Dashboard & Reporting | New Development | 6 dashboard pages, 12 widgets, 3 data sources | XL | Low |
| Payment Processing | Integration | 2 payment providers, PCI compliance, webhooks | XL | High |
| Notification System | New Development | 4 channels (email, SMS, push, in-app), templates | M | Low |
| Admin Panel | New Development | 8 CRUD entities, RBAC, audit logging | L | Low |
| CI/CD & Infrastructure | Configuration | K8s manifests, Terraform, GitHub Actions | M | Medium |
| Cross-cutting | Non-functional | Testing, documentation, security review | L | Medium |

## Output: Effort Breakdown (FTE-months)

| Component | Optimistic | Most Likely | Pessimistic | PERT Estimate |
|-----------|-----------|-------------|-------------|---------------|
| Authentication | 1.5 | 2.5 | 4.0 | 2.6 |
| Dashboard | 3.0 | 4.5 | 7.0 | 4.7 |
| Payments | 2.5 | 4.0 | 7.0 | 4.3 |
| Notifications | 1.0 | 1.5 | 2.5 | 1.6 |
| Admin Panel | 2.0 | 3.0 | 4.5 | 3.1 |
| Infrastructure | 1.0 | 1.5 | 2.5 | 1.6 |
| **Development subtotal** | **11.0** | **17.0** | **27.5** | **17.8** |
| Testing (35%) | 3.9 | 6.0 | 9.6 | 6.2 |
| Documentation (8%) | 0.9 | 1.4 | 2.2 | 1.4 |
| **Total** | **15.8** | **24.4** | **39.3** | **25.4** |

## Output: Team Composition

| Phase | Duration | Team | FTEs | Key Skills |
|-------|----------|------|------|------------|
| Phase 1: Foundation (Auth + Infra) | 6 weeks | 2 backend, 1 DevOps | 3 | OAuth/OIDC, Kubernetes, Terraform |
| Phase 2: Core Features (Dashboard + Admin) | 8 weeks | 2 backend, 2 frontend, 1 QA | 5 | React, Node.js, PostgreSQL |
| Phase 3: Integrations (Payments + Notifications) | 6 weeks | 2 backend, 1 frontend, 1 QA | 4 | PCI compliance, webhook design |
| Phase 4: Hardening + Launch | 4 weeks | 1 backend, 1 frontend, 2 QA, 1 DevOps | 5 | Performance testing, security review |

## Output: Timeline Confidence

| Confidence | Duration | End Date (start: Apr 1) | Assumptions |
|-----------|----------|------------------------|-------------|
| 50% (aggressive) | 18 weeks | Aug 5 | No scope changes, team at full capacity |
| 75% (likely) | 22 weeks | Sep 2 | Minor scope adjustments, 1 week ramp-up |
| 90% (conservative) | 28 weeks | Oct 14 | Integration delays, team availability gaps |

**Key assumptions documented**:
1. Team has experience with the technology stack (no ramp-up beyond 1 week)
2. Third-party API documentation is accurate and sandbox environments available
3. PCI compliance requirements are well-understood by the team
4. No major scope changes after Phase 1 completion
