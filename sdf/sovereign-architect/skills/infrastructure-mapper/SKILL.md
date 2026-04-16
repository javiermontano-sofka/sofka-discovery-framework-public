---
name: infrastructure-mapper
author: JM Labs (Javier Montaño)
description: >
  Docker, Kubernetes, IaC topology, and deployment architecture mapping.
  Trigger: "map infrastructure", "Docker analysis", "K8s topology", "IaC review".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Infrastructure Mapper

Map the complete infrastructure topology from IaC definitions, container configs, and orchestration manifests to produce a deployment architecture view.

## Guiding Principle

> *"Infrastructure that exists only in someone's head is infrastructure you'll lose when they leave."*

## Procedure

### Step 1 — Container Analysis
1. Parse all Dockerfiles: base images, build stages, exposed ports, health checks.
2. Analyze `docker-compose.yml` for service definitions, networks, and volumes.
3. Identify multi-stage builds and their optimization level.
4. Check for security best practices: non-root user, minimal base images, no secrets in layers.
5. Map container dependencies and startup order `[HECHO]`.

### Step 2 — Orchestration Mapping
1. Scan for Kubernetes manifests: Deployments, Services, Ingress, ConfigMaps, Secrets.
2. Identify Helm charts and their value overrides per environment.
3. Map service mesh configuration (Istio, Linkerd) if present.
4. Document resource requests/limits, replica counts, and autoscaling rules.
5. Catalog namespaces and their purpose `[HECHO]`.

### Step 3 — IaC Analysis
1. Locate Terraform, Pulumi, CloudFormation, or CDK definitions.
2. Map cloud resources: compute, storage, networking, databases, queues.
3. Identify environment separation: shared infra vs. per-environment resources.
4. Check for state management: remote state, locking, encryption.
5. Assess module organization and reusability `[HECHO]`.

### Step 4 — Topology Diagram
1. Produce a deployment architecture diagram showing all infrastructure components.
2. Map network topology: VPCs, subnets, security groups, load balancers.
3. Identify single points of failure and redundancy gaps.
4. Document the deployment flow from code to production.

## Quality Criteria
- Every infrastructure component traced to a config file `[HECHO]`
- Topology diagram reflects actual configs, not assumed architecture
- Security practices assessed for containers and IaC
- Environment differences documented (dev vs. staging vs. prod)

## Anti-Patterns
- Reading only Docker configs while ignoring Kubernetes manifests
- Assuming all environments are identical without checking overrides
- Ignoring network policies and security groups in the analysis
- Treating IaC modules as black boxes without reading their contents
