# Cloud-Native Architecture — Body of Knowledge

## Core Concepts
- **12-Factor App**: Methodology for building SaaS applications that maximize portability and resilience
- **Container Orchestration**: Automated deployment, scaling, and management of containerized applications (Kubernetes, Nomad)
- **Service Mesh**: Infrastructure layer for service-to-service communication with mTLS, observability, and traffic management
- **Serverless Computing**: Event-driven execution model where infrastructure is fully managed (Lambda, Cloud Functions, Cloud Run)
- **GitOps**: Declarative infrastructure and application management using Git as single source of truth
- **FinOps**: Financial accountability framework for cloud spend optimization combining engineering, finance, and business
- **Platform Engineering**: Building internal developer platforms that abstract Kubernetes and cloud complexity

## Patterns
- **Sidecar**: Co-locate helper containers alongside the main application container
- **Ambassador**: Proxy container that handles outbound communication on behalf of the main container
- **Init Container**: Run setup tasks before the main container starts
- **Operator Pattern**: Custom controllers that encode operational knowledge for complex stateful workloads
- **Cell-Based Architecture**: Independent, self-contained deployment units that limit blast radius

## Tools & Frameworks
- **Kubernetes**: Container orchestration platform (EKS, GKE, AKS)
- **Istio / Linkerd / Cilium**: Service mesh implementations (sidecar, ambient, eBPF)
- **ArgoCD / Flux**: GitOps continuous delivery for Kubernetes
- **KEDA**: Kubernetes Event-Driven Autoscaler for scaling based on external metrics
- **Kubecost / OpenCost**: Kubernetes cost monitoring and optimization
- **Crossplane / Pulumi**: Infrastructure as code with Kubernetes-native APIs

## References
- Brendan Burns et al. — *Designing Distributed Systems* (2018)
- Bilgin Ibryam & Roland Hub — *Kubernetes Patterns* (2nd ed., 2023)
- CNCF Cloud Native Maturity Model — https://maturitymodel.cncf.io/
- J.R. Storment & Mike Fuller — *Cloud FinOps* (2nd ed., 2023)
