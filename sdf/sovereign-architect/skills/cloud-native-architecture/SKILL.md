---
name: cloud-native-architecture
author: JM Labs (Javier Montaño)
description: >
  Container orchestration, service mesh design, serverless patterns, multi-cloud strategy,
  and FinOps optimization for cloud-native systems. Trigger: "cloud native", "containers",
  "kubernetes", "service mesh", "serverless", "multi-cloud", "FinOps".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Cloud-Native Architecture

Design and evaluate cloud-native systems: container orchestration, service mesh topology, serverless composition, multi-cloud strategies, and FinOps cost optimization.

## Guiding Principle
> *"Cloud-native is not about where you run — it is about how you build: loosely coupled, resilient, observable, and continuously delivered."*

## Procedure

### Step 1 — Cloud-Native Maturity Assessment
1. Evaluate current workloads against the Cloud Native Maturity Model (CNMM) levels 1-5
2. Assess containerization readiness: stateless vs. stateful, 12-factor compliance
3. Review CI/CD pipeline cloud-native capabilities (GitOps, progressive delivery)
4. Evaluate observability stack maturity (metrics, logs, traces, dashboards)
5. Produce a maturity radar across 6 dimensions: culture, automation, delivery, infrastructure, observability, security

### Step 2 — Container & Orchestration Design
1. Define container strategy: base images, multi-stage builds, vulnerability scanning
2. Design Kubernetes topology: namespaces, resource quotas, network policies
3. Specify workload types: Deployments, StatefulSets, Jobs, CronJobs, DaemonSets
4. Configure autoscaling: HPA, VPA, KEDA event-driven scaling
5. Design storage strategy: PVCs, CSI drivers, backup and restore procedures

### Step 3 — Service Mesh & Networking
1. Evaluate service mesh need: traffic volume, mTLS requirements, observability gaps
2. Design mesh topology: sidecar (Istio/Linkerd) vs. ambient mesh vs. eBPF-based
3. Configure traffic management: canary releases, traffic mirroring, fault injection
4. Define security policies: mTLS enforcement, authorization policies, rate limiting
5. Plan observability integration: mesh telemetry into existing monitoring stack

### Step 4 — FinOps & Cost Optimization
1. Analyze current cloud spend by service, environment, and team
2. Identify cost optimization opportunities: right-sizing, spot/preemptible, reserved capacity
3. Design cost allocation model: tags, labels, chargeback/showback
4. Implement cost guardrails: budget alerts, quota limits, idle resource detection
5. Establish FinOps feedback loop: weekly cost reviews, anomaly detection

## Quality Criteria
- All containers pass vulnerability scanning with zero critical/high CVEs
- Autoscaling tested under 3x normal load with documented behavior
- FinOps model provides per-team cost visibility with <5% unallocated spend
- Service mesh adds <5ms p99 latency overhead

## Anti-Patterns
- Lift-and-shift VMs into containers without re-architecting for cloud-native
- Over-meshing: adding service mesh when simple DNS-based discovery suffices
- Serverless for everything including long-running, stateful processes
- FinOps as a one-time exercise rather than continuous practice
