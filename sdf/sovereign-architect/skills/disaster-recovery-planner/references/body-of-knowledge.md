# Disaster Recovery Planner — Body of Knowledge

## Core Concepts
- **RPO (Recovery Point Objective)**: The maximum acceptable age of data that can be lost. RPO=1h means you can lose up to 1 hour of data.
- **RTO (Recovery Time Objective)**: The maximum acceptable duration of downtime. RTO=15min means the system must be operational within 15 minutes.
- **Business Impact Analysis (BIA)**: Quantifying the financial, regulatory, and reputational cost of downtime per hour for each system.
- **Failover**: Automatically or manually switching to a standby system when the primary fails.
- **Backup Retention**: How long backups are kept and the granularity of point-in-time recovery.
- **Disaster Recovery Tiers**: From Tier 0 (no DR) to Tier 7 (zero data loss, zero downtime, automated failover).
- **Tabletop Exercise**: A simulation where the team walks through a disaster scenario on paper to identify gaps.

## Patterns & Practices
- **3-2-1 Backup Rule**: 3 copies of data, on 2 different media types, with 1 copy offsite.
- **Active-Active Multi-Region**: Both regions serve traffic; failover is seamless but architecturally complex.
- **Pilot Light**: Minimal standby environment with data replication; scale up on failover.
- **Warm Standby**: Scaled-down replica of production running continuously; faster failover than pilot light.
- **Chaos Engineering for DR**: Regularly inject failures (region, AZ, service) to validate recovery mechanisms.
- **Immutable Backups**: Backups that cannot be modified or deleted (protection against ransomware).

## Tools & Technologies
- **Backup Tools**: AWS Backup, pg_basebackup, Velero (Kubernetes), mongodump, Redis RDB/AOF.
- **Replication**: PostgreSQL streaming replication, MySQL Group Replication, DynamoDB Global Tables.
- **DNS Failover**: AWS Route53 health checks, CloudFlare Load Balancing, Azure Traffic Manager.
- **IaC for DR**: Terraform workspaces for multi-region, Pulumi stacks, CloudFormation StackSets.
- **Chaos Tools**: AWS Fault Injection Simulator, Gremlin, Chaos Monkey, LitmusChaos.

## References
- AWS Well-Architected Framework — Reliability pillar, disaster recovery strategies.
- Google SRE Book — Chapter on managing incidents and disaster response.
- NIST SP 800-34 — Contingency Planning Guide for Federal Information Systems.
- Charity Majors, "Observability Engineering" — Monitoring and incident response practices.
