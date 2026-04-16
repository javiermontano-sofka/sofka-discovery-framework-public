# Rollback Strategy — Body of Knowledge

## Core Concepts
- **Compensating Transaction**: An operation that semantically undoes a previous operation without requiring a literal undo.
- **Point-of-No-Return (PONR)**: The deployment phase after which rollback requires restore-from-backup rather than incremental reversal.
- **Blue-Green Rollback**: Switching traffic back to the previous environment without modifying the new one.
- **Canary Rollback**: Retracting a canary deployment by routing 100% traffic back to the stable version.
- **Data Migration Reversibility**: The ability to undo schema and data transformations without data loss.
- **Feature Flag Fallback**: Using feature toggles to disable new behavior without redeploying code.
- **Rollback Trigger**: A predefined condition (error rate, latency, business metric) that initiates rollback.

## Patterns & Practices
- **Expand-Contract Migration**: Add new schema alongside old, migrate data, then remove old — each step independently reversible.
- **Backup-Before-Migrate**: Snapshot critical tables before applying destructive migrations.
- **Rollback Runbook**: A step-by-step document with exact commands, verification queries, and escalation contacts.
- **Rollback Drills**: Periodically practice rollbacks in staging to validate runbooks and team readiness.
- **Immutable Deployments**: Deploy new versions as new instances; rollback means routing to old instances.
- **Circuit Breaker Integration**: Automated rollback triggered by circuit breaker thresholds.

## Tools & Technologies
- **Database Migration Tools** (Flyway, Liquibase, Alembic): Support up/down migrations with versioning.
- **Feature Flag Platforms** (LaunchDarkly, Unleash, Flagsmith): Kill-switch capability for instant behavioral rollback.
- **Infrastructure as Code** (Terraform, Pulumi): `terraform plan -destroy` for infrastructure rollback.
- **Container Orchestrators** (Kubernetes): Rolling update rollback with `kubectl rollout undo`.
- **Backup Tools** (pg_dump, mongodump, AWS RDS snapshots): Point-in-time data restoration.

## References
- Sam Newman, "Building Microservices" — Chapter on deployment and rollback strategies.
- Google SRE Book — Release engineering and rollback automation.
- Martin Kleppmann, "Designing Data-Intensive Applications" — Data migration patterns.
- AWS Well-Architected Framework — Reliability pillar, change management.
