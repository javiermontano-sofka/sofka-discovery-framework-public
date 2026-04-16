---
name: infrastructure-architecture
author: JM Labs (Javier Montaño)
description: >
  Compute, network, storage topology, HA/DR design, IAM strategy, and landing zone
  architecture for production systems. Trigger: "infrastructure architecture", "landing zone",
  "HA/DR", "network topology", "compute", "IAM".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Infrastructure Architecture

Design production infrastructure: compute topology, network architecture, storage strategy, high availability and disaster recovery, IAM governance, and cloud landing zones.

## Guiding Principle
> *"Infrastructure is code, but good infrastructure architecture is about the decisions behind the code — every resource is a trade-off between cost, performance, and resilience."*

## Procedure

### Step 1 — Compute Architecture
1. Classify workloads by compute pattern: long-running, burst, batch, event-driven
2. Select compute primitives per workload: VMs, containers, serverless, bare metal
3. Design autoscaling strategy: metrics, thresholds, cool-down periods
4. Plan capacity for steady state and peak load (with headroom percentage)
5. Define instance families, sizes, and spot/reserved mix for cost optimization

### Step 2 — Network Architecture
1. Design VPC/VNET topology: CIDR planning, subnet strategy, availability zones
2. Define connectivity: VPN, Direct Connect/ExpressRoute, peering, transit gateway
3. Design DNS strategy: public/private zones, split-horizon, failover records
4. Implement network security: NACLs, security groups, WAF, DDoS protection
5. Plan for hybrid connectivity if required (on-prem to cloud)

### Step 3 — Storage & Data Architecture
1. Classify data by access pattern: hot, warm, cold, archive
2. Select storage services per tier: block, object, file, database-specific
3. Design backup strategy: frequency, retention, cross-region replication
4. Define data lifecycle policies: automatic tiering, expiration, compliance holds
5. Plan encryption: at-rest encryption keys, rotation, access policies

### Step 4 — HA/DR & Landing Zone
1. Define availability targets: RTO and RPO per workload tier
2. Design multi-AZ and multi-region topology for critical workloads
3. Plan failover mechanisms: active-active, active-passive, pilot light, warm standby
4. Design landing zone structure: account/subscription hierarchy, OU policies, guardrails
5. Implement infrastructure as code with drift detection and compliance scanning

## Quality Criteria
- Network CIDR plan accommodates 3x current workload growth without re-addressing
- HA design validated with chaos engineering (AZ failure simulation)
- All infrastructure defined as code with no manual console changes
- DR runbook tested quarterly with documented RTO/RPO achievement

## Anti-Patterns
- Manual infrastructure provisioning without IaC version control
- Single-AZ deployments for production workloads
- Over-sized instances running 24/7 for burst workloads
- Landing zones without guardrails or compliance automation
