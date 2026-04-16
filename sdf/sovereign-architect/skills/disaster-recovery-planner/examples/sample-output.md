# Disaster Recovery Planner — Sample Output

## Context
DR plan for a fintech API platform running on AWS with PostgreSQL, Redis, and 4 Kubernetes services.

## Output

### System Classification

| System | Tier | RPO Target | RTO Target | Current Capability | Gap |
|--------|------|-----------|-----------|-------------------|-----|
| Payment API | Tier 1 | 0 (zero loss) | 5 min | RPO 1h, RTO 30min | Needs sync replication + auto-failover |
| User Database | Tier 1 | < 5 min | 15 min | RPO 24h (daily backup) | Needs streaming replication |
| Analytics Service | Tier 2 | < 1 hour | 4 hours | RPO 24h | Needs hourly snapshots |
| Admin Portal | Tier 3 | < 24 hours | 24 hours | RPO 24h | Adequate |

### Backup Strategy

| Data Store | Backup Method | Frequency | Retention | Location | Encryption |
|-----------|--------------|-----------|-----------|----------|------------|
| PostgreSQL (primary) | Streaming replication | Continuous | N/A (live replica) | us-west-2 RDS | AES-256 |
| PostgreSQL (snapshots) | Automated RDS snapshots | Every 6 hours | 30 days | Same region + cross-region copy | AES-256 |
| PostgreSQL (WAL) | WAL archiving to S3 | Continuous | 90 days | Cross-region S3 bucket | SSE-S3 |
| Redis | RDB snapshots | Every 15 min | 7 days | S3 cross-region | AES-256 |
| S3 (documents) | Cross-region replication | Real-time | Same as source | us-west-2 bucket | SSE-S3 |

### Failover Procedure (Region Failure)

```
T+0:00  Route53 health check fails for us-east-1 (3 consecutive failures, 30s interval)
T+0:02  Automated DNS failover routes traffic to us-west-2
T+0:02  PagerDuty alert fires to on-call engineer
T+0:03  Standby RDS instance promoted to primary (pre-configured, auto-promotion)
T+0:04  EKS services in us-west-2 connect to promoted database
T+0:05  Smoke tests run automatically against us-west-2 endpoints
T+0:06  Status page updated: "Operating in degraded mode from backup region"
T+0:10  On-call engineer validates system health and confirms failover complete
```

**Estimated RTO: 5-10 minutes** (automated) or **15 minutes** (with manual verification).

### Tabletop Exercise: Q2 2026

**Scenario**: "AWS us-east-1 experiences a partial AZ failure affecting our primary database AZ. The database becomes read-only. Redis is unaffected."

**Questions to work through**:
1. How do we detect this? Which alerts fire first?
2. Can we promote the read replica while the primary is still partially available?
3. What happens to in-flight payment transactions?
4. How do we communicate to customers and partners?
5. When the AZ recovers, how do we fail back?

**Success criteria**: Team completes the exercise in under 60 minutes, identifies all critical gaps, and updates runbooks accordingly.

### Evidence Tags
- Tier classification: `[STAKEHOLDER]` — aligned with business impact analysis from CTO.
- RPO/RTO targets: `[REQUISITO]` — from compliance requirements.
- Current capability gaps: `[CODIGO]` — verified against infrastructure configuration.
- Failover timeline: `[INFERENCIA]` — estimated from AWS documentation and staging tests.
