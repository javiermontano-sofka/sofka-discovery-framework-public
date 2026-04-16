---
name: disaster-recovery-planner
author: JM Labs (Javier Montaño)
description: >
  Designs RPO/RTO targets, failover procedures, backup strategies, and tabletop exercises for disaster recovery.
  Trigger: "disaster recovery", "DR plan", "RPO RTO", "failover", "backup strategy", "business continuity".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Disaster Recovery Planner

Produces disaster recovery plans that define RPO/RTO targets, failover mechanisms, backup strategies, and validation exercises — ensuring business continuity when the worst happens.

## Guiding Principle

> *"Hope is not a strategy. Every system fails; the question is whether you have rehearsed the recovery."*

## Procedure

### Step 1 — Classify Systems and Data
1. Inventory all services, databases, and third-party dependencies.
2. Classify each by business criticality: Tier 1 (revenue-critical), Tier 2 (operational), Tier 3 (internal tooling).
3. Identify data stores and their characteristics: relational, document, blob, cache, event log.
4. Map data dependencies: which services share databases, which produce/consume events.
5. Document compliance requirements: data retention, geo-residency, encryption mandates.

### Step 2 — Define RPO and RTO Targets
1. **RPO (Recovery Point Objective)**: Maximum acceptable data loss measured in time — 0 (no loss), 1h, 24h.
2. **RTO (Recovery Time Objective)**: Maximum acceptable downtime — 0 (no downtime), 15min, 4h, 24h.
3. Align RPO/RTO with business impact analysis: revenue loss per hour, regulatory penalties, customer trust.
4. Validate that RPO/RTO targets are technically achievable with current architecture.
5. Document the gap between current capability and target, with a remediation roadmap.

### Step 3 — Design Recovery Strategies
1. **Backup Strategy**: Automated backups, retention policy, cross-region replication, encryption at rest.
2. **Failover Architecture**: Active-passive, active-active, pilot light, warm standby configurations.
3. **Data Recovery**: Point-in-time recovery, event replay, snapshot restoration procedures.
4. **DNS Failover**: Route53 health checks, CloudFlare failover, TTL configuration.
5. **Communication Plan**: Internal escalation, customer notification templates, status page updates.

### Step 4 — Validate with Tabletop Exercises
1. Design quarterly tabletop scenarios: region outage, database corruption, ransomware, third-party failure.
2. Walk through the recovery procedure step-by-step with the team.
3. Identify gaps: missing runbooks, stale credentials, untested backup restores.
4. Measure simulated RTO against target RTO.
5. Update the DR plan with lessons learned from each exercise.

## Quality Criteria
- Every Tier 1 system has defined RPO/RTO targets with technical justification.
- Backup restoration is tested monthly with documented results.
- Failover procedures are automated where possible, documented where not.
- Tabletop exercises are conducted quarterly with findings tracked to resolution.

## Anti-Patterns
- Setting RPO=0 without investing in synchronous replication.
- Backing up data but never testing restore procedures.
- DR plans that exist as documents but have never been rehearsed.
- Assuming cloud provider availability negates the need for DR planning.
