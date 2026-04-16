# Cloud Migration — Sample Output

## Context
A financial services company with 25 applications running on-premises needs to migrate to AWS. Portfolio includes legacy Java monoliths, .NET APIs, and PostgreSQL/Oracle databases.

## Output: 7R Disposition Matrix (excerpt)

| Application | Stack | 7R Strategy | Complexity | Rationale |
|------------|-------|-------------|------------|-----------|
| `core-banking` | Java 8 / Oracle 19c | Retain (Phase 2 Refactor) | Very High | Regulatory constraints; Oracle licensing; plan refactor after wave 3 |
| `customer-portal` | .NET 6 / PostgreSQL | Replatform | Medium | Containerize on ECS; migrate DB to RDS PostgreSQL |
| `reporting-engine` | Java 11 / Jasper | Repurchase | Low | Replace with AWS QuickSight + custom Lambda transforms |
| `email-service` | Python 3.9 / SES-ready | Rehost | Low | Already stateless; lift to EC2 then optimize to Lambda |
| `legacy-batch` | COBOL / flat files | Retire | N/A | Functionality absorbed by `core-banking` 2 years ago |
| `mobile-bff` | Node.js 18 / Redis | Replatform | Medium | Deploy to EKS; Redis to ElastiCache |

## Output: Wave Plan

```
Wave 0 — Foundation (Week 1-3)
  Landing zone, VPN connectivity, IAM, DNS delegation
  Success: Connectivity validated end-to-end

Wave 1 — Low Risk (Week 4-6)
  email-service (Rehost), reporting-engine (Repurchase)
  Dependencies: None
  Rollback: DNS failback within 15 minutes

Wave 2 — Medium Complexity (Week 7-11)
  customer-portal (Replatform), mobile-bff (Replatform)
  Dependencies: Both depend on core-banking (Retained)
  Hybrid: API calls to on-prem core-banking via VPN
  Rollback: Blue-green with 1-hour rollback window

Wave 3 — High Complexity (Week 12-20)
  core-banking (Refactor to microservices on EKS)
  Dependencies: All other services; requires Wave 1-2 complete
  Data: Oracle to Aurora PostgreSQL via DMS with CDC
  Rollback: Dual-write with 4-hour rollback window
```

## Output: Cutover Runbook (Wave 2 — customer-portal)

| Time | Action | Owner | Validation | Rollback Trigger |
|------|--------|-------|------------|-----------------|
| T-24h | Start final DMS sync | DBA | Replication lag <1s | Lag >60s for 10min |
| T-2h | Scale down on-prem to read-only | Ops | No write errors in logs | Write attempts detected |
| T-1h | Run integration test suite against cloud | QA | 100% pass rate | Any critical test failure |
| T-0 | Switch DNS (weighted: 10% cloud) | Ops | 200 OK from cloud endpoint | Error rate >1% |
| T+15m | Increase to 50% cloud traffic | Ops | p99 latency <500ms | Latency spike >2x baseline |
| T+1h | Full cutover: 100% cloud | Ops | All health checks green | Any health check failure |
| T+4h | Decommission on-prem (soft) | Ops | 4h of clean operation | N/A — point of no return |
