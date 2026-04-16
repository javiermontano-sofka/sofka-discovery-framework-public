# Container Orchestration — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Containers standardize application packaging; orchestration automates their deployment, scaling, networking, and lifecycle management. This document covers Dockerfile best practices, Kubernetes resource model, Helm and Kustomize, service mesh integration, and the Operator pattern — the patterns an architect evaluates when assessing or designing containerized systems.

## Dockerfile Best Practices

### Multi-Stage Builds

Separate build-time dependencies from runtime. The final image contains only what is needed to run.

```dockerfile
# Stage 1: Build
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --production=false
COPY . .
RUN npm run build

# Stage 2: Runtime
FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
EXPOSE 3000
USER node
CMD ["node", "dist/main.js"]
```

### Layer Optimization

Docker caches layers. Order instructions from least-changed to most-changed:

1. Base image (rarely changes)
2. System dependencies (occasionally changes)
3. Application dependencies (changes with lockfile)
4. Application code (changes frequently)

### Security Hardening

| Practice | Implementation |
|----------|---------------|
| Non-root user | `USER node` or `USER 1001:1001` |
| Read-only filesystem | `--read-only` flag at runtime |
| No shell | Use distroless or scratch base images |
| Minimal base | `alpine`, `distroless`, or `scratch` |
| Pin versions | `FROM node:20.11.1-alpine3.19` not `node:latest` |
| Scan images | Trivy, Snyk, or Grype in CI pipeline |
| No secrets in layers | Use build secrets (`--mount=type=secret`) |

### Image Size Reduction

| Technique | Impact |
|-----------|--------|
| Alpine base | ~5MB vs ~150MB for Debian |
| Distroless | ~20MB, no shell, minimal attack surface |
| Multi-stage | Only runtime artifacts in final image |
| `.dockerignore` | Exclude `node_modules`, `.git`, docs |
| Layer squashing | Combine RUN commands with `&&` |

## Kubernetes Resource Model

### Core Resources

| Resource | Purpose | Scope |
|----------|---------|-------|
| **Pod** | Smallest deployable unit. One or more containers sharing network/storage. | Namespace |
| **Deployment** | Declarative pod management. Rolling updates, replicas, rollback. | Namespace |
| **Service** | Stable network endpoint for a set of pods. Load balancing. | Namespace |
| **ConfigMap** | Non-sensitive configuration data (key-value pairs, files). | Namespace |
| **Secret** | Sensitive data (Base64-encoded, optionally encrypted at rest). | Namespace |
| **Ingress** | HTTP/HTTPS routing rules. Maps external hostnames to services. | Namespace |
| **Namespace** | Virtual cluster for resource isolation and RBAC scoping. | Cluster |

### Workload Resources

| Resource | Use Case |
|----------|----------|
| **Deployment** | Stateless applications (web servers, APIs) |
| **StatefulSet** | Stateful applications needing stable identity (databases, Kafka) |
| **DaemonSet** | One pod per node (monitoring agents, log collectors) |
| **Job** | Run-to-completion tasks (migrations, batch processing) |
| **CronJob** | Scheduled jobs (backups, reports) |

### Resource Requests and Limits

```yaml
resources:
  requests:
    cpu: "250m"      # Guaranteed minimum (scheduler uses this)
    memory: "512Mi"  # Guaranteed minimum
  limits:
    cpu: "1000m"     # Hard ceiling (throttled if exceeded)
    memory: "1Gi"    # Hard ceiling (OOMKilled if exceeded)
```

**Critical**: Always set requests (scheduling) and limits (protection). Pods without limits can starve other workloads. Pods with limits too low get OOMKilled.

### Health Checks

| Probe | Purpose | Failure Action |
|-------|---------|----------------|
| **Liveness** | Is the container alive? | Restart container |
| **Readiness** | Can the container serve traffic? | Remove from service endpoints |
| **Startup** | Has the container started? | Block liveness/readiness until ready |

```yaml
livenessProbe:
  httpGet:
    path: /healthz
    port: 8080
  initialDelaySeconds: 15
  periodSeconds: 10
readinessProbe:
  httpGet:
    path: /ready
    port: 8080
  initialDelaySeconds: 5
  periodSeconds: 5
```

### Pod Disruption Budgets (PDB)

Control how many pods can be unavailable during voluntary disruptions (node drain, cluster upgrade):

```yaml
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: api-pdb
spec:
  minAvailable: 2    # OR maxUnavailable: 1
  selector:
    matchLabels:
      app: api
```

## Helm Charts

Helm is the package manager for Kubernetes. Charts are parameterized templates.

### Chart Structure

```
my-chart/
├── Chart.yaml          # Chart metadata (name, version, dependencies)
├── values.yaml         # Default configuration values
├── templates/
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   ├── configmap.yaml
│   ├── _helpers.tpl    # Template helpers (naming, labels)
│   └── NOTES.txt       # Post-install instructions
└── charts/             # Sub-chart dependencies
```

### Best Practices

- Version charts independently from app versions
- Use `values.yaml` for all configurable parameters
- Include sensible defaults
- Label resources consistently (app.kubernetes.io/name, version, component)
- Use `_helpers.tpl` for reusable template snippets
- Pin dependency versions in Chart.yaml

## Kustomize

Kubernetes-native configuration management. No templating — uses overlays and patches.

### Structure

```
base/
├── kustomization.yaml
├── deployment.yaml
└── service.yaml

overlays/
├── dev/
│   ├── kustomization.yaml
│   └── replica-patch.yaml
├── staging/
│   └── kustomization.yaml
└── production/
    ├── kustomization.yaml
    └── resource-patch.yaml
```

### Helm vs Kustomize

| Factor | Helm | Kustomize |
|--------|------|-----------|
| Approach | Templating | Patching/overlays |
| Learning curve | Moderate (Go templates) | Low (YAML only) |
| Packaging | Charts as packages | Directory structure |
| Dependency mgmt | Built-in | Manual |
| Ecosystem | Large chart repository | Kubectl built-in |
| Best for | Distributing to others | Internal team configs |

## Service Mesh

### Istio Architecture

| Component | Purpose |
|-----------|---------|
| **istiod** | Control plane — config distribution, certificate management |
| **Envoy sidecar** | Data plane — proxy injected into each pod |
| **Ingress Gateway** | External traffic entry point |
| **VirtualService** | Traffic routing rules (canary, header-based) |
| **DestinationRule** | Load balancing, circuit breaking, TLS settings |
| **PeerAuthentication** | mTLS policy (STRICT, PERMISSIVE) |
| **AuthorizationPolicy** | L7 access control (path, method, source) |

### Linkerd Architecture

Simpler alternative to Istio. Rust-based proxy (lighter than Envoy). Automatic mTLS. Built-in service profiles for per-route metrics. Lower operational overhead.

### When to Use a Service Mesh

| Signal | Mesh Justified | Not Justified |
|--------|---------------|---------------|
| Service count | 10+ | <5 |
| mTLS requirement | Yes, without app changes | No mTLS needed |
| Traffic management | Canary, fault injection, retries | Simple load balancing sufficient |
| Observability | Need per-service metrics without SDK | Already using application-level tracing |

## Operator Pattern

Operators extend Kubernetes with domain-specific automation. They encode operational knowledge as code.

### Custom Resource Definition (CRD) + Controller

```
CRD defines: what the desired state looks like (e.g., PostgresCluster spec)
Controller watches: CRD instances and reconciles actual state to desired state
```

### Common Operators

| Operator | Purpose |
|----------|---------|
| **CloudNativePG** | PostgreSQL lifecycle (backups, failover, scaling) |
| **Strimzi** | Apache Kafka on Kubernetes |
| **Prometheus Operator** | Monitoring stack (Prometheus, Alertmanager, ServiceMonitor) |
| **cert-manager** | TLS certificate automation (Let's Encrypt) |
| **ArgoCD** | GitOps continuous delivery |
| **External Secrets** | Sync secrets from Vault, AWS Secrets Manager |

### Operator Maturity Model

| Level | Capability |
|-------|-----------|
| 1 | Basic install — automated deployment |
| 2 | Seamless upgrades — patch and minor version upgrades |
| 3 | Full lifecycle — backup, restore, failure recovery |
| 4 | Deep insights — metrics, alerts, log analysis |
| 5 | Auto-pilot — auto-scaling, auto-tuning, anomaly detection |

## Anti-Patterns

| Anti-Pattern | Problem | Fix |
|-------------|---------|-----|
| **No resource limits** | Pods consume unlimited resources, starving others | Always set requests and limits |
| **Latest tag** | Unpredictable deployments, no rollback | Pin image versions |
| **Root containers** | Security risk, container escape | Run as non-root user |
| **No health checks** | Dead containers keep receiving traffic | Add liveness + readiness probes |
| **Monolith in container** | All the overhead, none of the benefits | Containerize only if it adds deployment value |
| **Secrets in ConfigMaps** | Unencrypted, logged in plain text | Use Secrets + external secret management |

---

*Sovereign Architect — Containers are packaging. Orchestration is operations.*
*JM Labs · Javier Montano.*
