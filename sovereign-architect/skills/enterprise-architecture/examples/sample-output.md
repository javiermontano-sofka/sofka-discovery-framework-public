# Enterprise Architecture — Sample Output

## Context
A mid-size fintech with 40+ microservices, 3 front-end applications, and a legacy monolith handling core banking operations. The team needs a capability map and technology radar to guide modernization.

## Output: Business Capability Map (L0-L2)

| L0 Capability | L1 Capability | L2 Capability | Implementing System | Maturity |
|---------------|---------------|---------------|-------------------|----------|
| Customer Management | Onboarding | KYC Verification | `kyc-service` | Established |
| Customer Management | Onboarding | Account Creation | `monolith.accounts` | Declining |
| Customer Management | Profile Management | Contact Updates | `profile-api` | Emerging |
| Payment Processing | Transactions | Wire Transfers | `monolith.payments` | Declining |
| Payment Processing | Transactions | Instant Payments | `instant-pay-svc` | Established |
| Payment Processing | Reconciliation | End-of-Day Settlement | `batch-reconciler` | Embryonic |
| Risk & Compliance | Fraud Detection | Real-time Scoring | `fraud-engine` | Established |
| Risk & Compliance | Regulatory Reporting | AML Reports | `monolith.reports` | Declining |

### Capability Gaps Identified
- **Payment Processing > Reconciliation**: Only batch processing; no real-time reconciliation
- **Customer Management > Analytics**: No unified customer 360 view
- **Risk & Compliance > Model Governance**: No ML model versioning or audit trail

## Output: Technology Radar (excerpt)

| Technology | Quadrant | Ring | Rationale |
|-----------|----------|------|-----------|
| Kotlin | Languages | Adopt | Primary language for new services; strong team competency |
| Java 8 | Languages | Hold | EOL; active migration to Kotlin/Java 21 |
| PostgreSQL 15 | Platforms | Adopt | Battle-tested, strong extension ecosystem |
| MongoDB 4.x | Platforms | Hold | Version unsupported; upgrade or migrate |
| Kafka | Platforms | Adopt | Event backbone; well-operated |
| gRPC | Techniques | Trial | Inter-service communication; evaluating vs REST |
| Terraform | Tools | Adopt | Standard IaC across all environments |

## Output: 12-Month Roadmap (Top 3 Initiatives)

```
Q1: [Monolith Decomposition - Phase 1] → Extract Accounts domain
     Gate: API contract tests pass, zero-downtime cutover validated
Q2: [Monolith Decomposition - Phase 2] → Extract Payments domain
     Dependency: Q1 accounts extraction complete
     Gate: Load test at 2x peak traffic
Q3: [Observability Foundation] → Unified logging, tracing, alerting
     Parallel workstream, no dependency on decomposition
     Gate: SLO coverage >80% of critical paths
```
