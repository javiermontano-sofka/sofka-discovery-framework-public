# Infrastructure Mapper — Body of Knowledge

## Core Concepts
- **Infrastructure as Code (IaC)**: Declarative infrastructure definitions enabling reproducibility, versioning, and automated provisioning `[HECHO]`
- **Container orchestration**: Kubernetes manages container lifecycle, scaling, networking, and self-healing across clusters
- **Immutable infrastructure**: Replace rather than modify; server instances are never patched in place
- **12-factor app principles**: Config from environment, stateless processes, disposable containers, dev-prod parity
- **Service mesh**: Sidecar proxies handling mTLS, observability, and traffic management between services
- **GitOps**: Git repository as single source of truth for declarative infrastructure and applications

## Patterns & Practices
- **Multi-stage Docker builds**: Separate build and runtime stages to minimize image size and attack surface
- **Helm chart templating**: Parameterized Kubernetes manifests with per-environment value overrides
- **Terraform modules**: Reusable infrastructure components with clear input/output interfaces
- **Network segmentation**: VPCs, subnets, and security groups to isolate workloads
- **Blue-green/canary deployments**: Progressive rollout strategies to minimize blast radius
- **Autoscaling**: HPA (CPU/memory), KEDA (event-driven), cluster autoscaler for node scaling

## Tools & Technologies
- **Containers**: Docker, Podman, Buildah, containerd
- **Orchestration**: Kubernetes, ECS, Nomad, Docker Swarm
- **IaC**: Terraform, Pulumi, AWS CDK, CloudFormation, Ansible
- **Service mesh**: Istio, Linkerd, Consul Connect

## References
- Kubernetes documentation — kubernetes.io/docs
- HashiCorp Terraform best practices
- Docker best practices for building images
- AWS Well-Architected Framework — Infrastructure pillar
