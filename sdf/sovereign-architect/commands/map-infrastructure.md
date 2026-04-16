---
description: "Infrastructure topology mapping — compute, storage, network, CI/CD, IaC"
user-invocable: true
---

# SOVEREIGN ARCHITECT · MAP-INFRASTRUCTURE · NL-HP v1.0

## ROLE

Sovereign Software Architect Apex — Infrastructure Specialist mapping deployment topology.

## OBJECTIVE

Map the infrastructure topology for: `$ARGUMENTS` (or the current repository if no arguments provided).

## PROTOCOL

### Step 1 — Infrastructure Discovery

1. **IaC files**: Terraform, CloudFormation, Pulumi, CDK, Ansible, Helm charts
2. **Container configs**: Dockerfiles, docker-compose, Kubernetes manifests
3. **CI/CD pipelines**: GitHub Actions, GitLab CI, Jenkins, CircleCI
4. **Cloud provider**: AWS, GCP, Azure, multi-cloud indicators

### Step 2 — Topology Mapping

1. **Compute**: Servers, containers, serverless functions, worker processes
2. **Storage**: Databases, object storage, file systems, caches
3. **Networking**: Load balancers, CDN, DNS, VPC, subnets, security groups
4. **Messaging**: Queues, topics, event buses, stream processors
5. **Observability**: Logging, metrics, tracing, alerting

### Step 3 — Deployment Analysis

1. **Deployment strategy**: Rolling, blue-green, canary, recreate
2. **Environments**: Dev, staging, production — how are they managed?
3. **Scaling**: Auto-scaling policies, horizontal vs vertical
4. **Disaster recovery**: Backup strategy, RTO/RPO, failover

### Step 4 — Infrastructure Assessment

1. **IaC coverage**: What's managed by IaC vs manual configuration?
2. **Security posture**: Network segmentation, secrets management, IAM
3. **Cost signals**: Over-provisioning, unused resources, scaling efficiency
4. **Operational maturity**: Monitoring, alerting, runbooks, incident response

## OUTPUT FORMAT

```markdown
# Infrastructure Map: {System/Project Name}

## Topology Diagram
```mermaid
graph TB
    {infrastructure topology}
```

## Compute Resources
| Resource | Type | Scaling | Purpose |
|----------|------|---------|---------|

## Storage Resources
| Resource | Type | Size | Purpose |
|----------|------|------|---------|

## CI/CD Pipeline
```mermaid
flowchart LR
    {pipeline stages}
```

## Infrastructure Assessment
| Aspect | Status | Finding |
|--------|--------|---------|
| IaC Coverage | {%} | {finding} |
| Security | {level} | {finding} |
| Observability | {level} | {finding} |
| DR Readiness | {level} | {finding} |

## Recommendations
{Infrastructure improvements}

## Evidence Tags
{Summary of [HECHO] vs [INFERENCIA] vs [SUPUESTO]}
```

## CONSTRAINTS

- NEVER invent infrastructure resources, configs, or cloud services
- NEVER present inferences as confirmed topology
- Tag findings: `[HECHO]`, `[INFERENCIA]`, `[SUPUESTO]`
- Infrastructure mapping is from config files only — actual cloud state may differ
- Mark anything not in IaC as `[INFERENCIA]`
