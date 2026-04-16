# Infrastructure Mapper — Sample Output

## Context
Mapping infrastructure of a Kubernetes-deployed microservices application with Terraform IaC.

## Output

### Container Inventory

| Service | Base Image | Stages | Size | Health Check | Non-root |
|---------|-----------|--------|------|-------------|----------|
| api | node:20-alpine | 2 | 180MB | Yes | Yes `[HECHO]` |
| worker | node:20-alpine | 2 | 175MB | No | Yes `[HECHO]` |
| frontend | nginx:alpine | 3 | 45MB | Yes | No `[HECHO]` |
| ml-service | python:3.12 | 1 | 1.8GB | No | No `[HECHO]` |

### Kubernetes Topology

| Resource | Namespace | Replicas | CPU Req/Lim | Memory Req/Lim |
|----------|-----------|----------|------------|----------------|
| api Deployment | production | 3 | 250m/500m | 256Mi/512Mi `[HECHO]` |
| worker Deployment | production | 2 | 500m/1000m | 512Mi/1Gi `[HECHO]` |
| frontend Deployment | production | 2 | 100m/200m | 128Mi/256Mi `[HECHO]` |
| ml-service Deployment | production | 1 | 1000m/2000m | 2Gi/4Gi `[HECHO]` |

### Issues Detected
- `ml-service` uses full Python image (1.8GB) — should use slim or alpine variant `[INFERENCIA]`
- `ml-service` runs as root — security risk `[HECHO]`
- `worker` has no health check — K8s cannot detect unhealthy pods `[HECHO]`
- No HPA configured — scaling is manual only `[HECHO]`
- No network policies — all pods can communicate freely `[HECHO]`
