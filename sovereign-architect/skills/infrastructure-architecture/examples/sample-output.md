# Infrastructure Architecture — Sample Output

## Context
A B2B SaaS platform deploying to AWS needs a production network architecture supporting 3 environments, hybrid connectivity to an on-premises data center, and 99.99% availability for the production tier.

## Output: Network Architecture

### VPC Topology
```
AWS Organization
├── Management Account
│   └── Transit Gateway (hub)
├── Shared Services Account
│   └── VPC: 10.0.0.0/16
│       ├── tools-subnet (Jenkins, Vault, monitoring)
│       └── dns-subnet (Route 53 Resolver endpoints)
├── Production Account
│   └── VPC: 10.1.0.0/16
│       ├── public-subnet-a/b/c (ALB, NAT GW)
│       ├── app-subnet-a/b/c (EKS nodes)
│       └── data-subnet-a/b/c (RDS, ElastiCache)
├── Staging Account
│   └── VPC: 10.2.0.0/16 (mirrors prod topology)
└── Development Account
    └── VPC: 10.3.0.0/16 (simplified, single-AZ)

Connectivity:
  On-prem ←→ Transit Gateway via AWS Direct Connect (1Gbps)
  Failover: Site-to-Site VPN over public internet
```

### HA/DR Design

| Tier | Workloads | Availability | RTO | RPO | Strategy |
|------|-----------|-------------|-----|-----|----------|
| Tier 1 (Critical) | API Gateway, Auth, Core API | 99.99% | 15 min | 1 min | Multi-AZ active-active, cross-region warm standby |
| Tier 2 (Important) | Background workers, Email | 99.95% | 1 hour | 15 min | Multi-AZ, cross-region backup restore |
| Tier 3 (Standard) | Admin portal, Reporting | 99.9% | 4 hours | 1 hour | Multi-AZ, daily backups |

### Backup Strategy

| Resource | Frequency | Retention | Cross-Region | Encryption |
|----------|-----------|-----------|-------------|------------|
| RDS PostgreSQL | Continuous (PITR) | 35 days | Yes (us-west-2) | KMS CMK |
| ElastiCache Redis | Hourly snapshots | 7 days | No | KMS CMK |
| S3 Buckets | Versioning enabled | 90 days + Glacier | CRR to us-west-2 | SSE-KMS |
| EBS Volumes | Daily via DLM | 14 days | No | KMS CMK |
