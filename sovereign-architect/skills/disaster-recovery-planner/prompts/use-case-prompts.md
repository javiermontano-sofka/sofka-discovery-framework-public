# Disaster Recovery Planner — Use Case Prompts

## Prompt 1: Multi-Region DR for SaaS
> Design a disaster recovery plan for our SaaS platform running in AWS us-east-1. We have PostgreSQL (RDS), Redis (ElastiCache), S3 for file storage, and 6 EKS services. Business requirements: RPO < 1 hour, RTO < 30 minutes for Tier 1 services. Budget allows for a warm standby in us-west-2. Include failover procedures, data replication strategy, DNS cutover, and quarterly tabletop exercise scenarios.

## Prompt 2: Ransomware Recovery
> Our on-premises infrastructure was hit by ransomware in a recent industry incident next door. Design a ransomware recovery strategy for our hybrid environment (on-prem VMware + AWS). Cover: immutable backup strategy, air-gapped backup copies, detection and isolation procedures, clean restore process, credential rotation, and a communication plan for customers and regulators.

## Prompt 3: Database Disaster Recovery
> Our PostgreSQL database (2TB, 50K transactions/hour) is our single point of failure. Design a DR strategy that achieves RPO < 5 minutes and RTO < 15 minutes. Evaluate options: streaming replication to a standby, WAL archiving to S3, logical replication, and Aurora PostgreSQL. Include failover automation, split-brain prevention, and post-failover data validation.
