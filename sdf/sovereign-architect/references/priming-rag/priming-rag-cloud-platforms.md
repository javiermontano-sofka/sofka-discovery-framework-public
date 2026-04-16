# Cloud Platforms — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Cloud platform selection is a strategic decision that affects cost structure, team skills, vendor dependency, and architectural options for years. While AWS, GCP, and Azure offer comparable core services, each has distinct strengths, pricing models, and ecosystem characteristics. This document provides service-level comparison, serverless patterns, managed service evaluation criteria, multi-cloud considerations, and edge computing patterns for architects making platform decisions.

## Core Patterns

### Service Comparison (Core Categories)

**Compute**:
- AWS: EC2 (VMs), ECS/EKS (containers), Lambda (serverless), Fargate (serverless containers)
- GCP: Compute Engine, GKE (best managed Kubernetes), Cloud Run (serverless containers), Cloud Functions
- Azure: Virtual Machines, AKS, Azure Functions, Container Apps

**Databases**:
- AWS: RDS/Aurora (relational), DynamoDB (key-value/document), ElastiCache (Redis/Memcached), Redshift (warehouse)
- GCP: Cloud SQL, AlloyDB (PostgreSQL-compatible, analytics), Firestore (document), Bigtable (wide-column), BigQuery (warehouse, best-in-class)
- Azure: Azure SQL, Cosmos DB (multi-model), Azure Cache, Synapse Analytics

**Messaging/Eventing**:
- AWS: SQS (queue), SNS (pub/sub), EventBridge (event bus), Kinesis (streaming), MSK (managed Kafka)
- GCP: Cloud Pub/Sub (unified queue + pub/sub), Dataflow (stream processing)
- Azure: Service Bus (enterprise messaging), Event Grid, Event Hubs (streaming)

**Object Storage**: S3 (AWS, de facto standard), Cloud Storage (GCP), Blob Storage (Azure). All functionally equivalent with different pricing models.

**CDN**: CloudFront (AWS), Cloud CDN (GCP), Azure CDN / Front Door. CloudFront has the most edge locations; Front Door combines CDN with global load balancing.

### Platform Strengths

**AWS**: Broadest service catalog (200+ services), largest market share, deepest enterprise tooling, most third-party integrations. Strengths: compute flexibility, networking (VPC, Transit Gateway), enterprise services (Outposts, GovCloud). Weakness: console UX, pricing complexity, many services overlap.

**GCP**: Best data and ML platform (BigQuery, Vertex AI, Dataflow). Best managed Kubernetes (GKE Autopilot). Strongest networking (private global backbone). Best developer experience for cloud-native apps. Weakness: smaller enterprise footprint, fewer managed services for niche use cases, smaller partner ecosystem.

**Azure**: Best integration with Microsoft ecosystem (Active Directory, Office 365, Teams). Strongest hybrid cloud story (Azure Arc, Azure Stack). Dominant in enterprises already on Microsoft. Strength: enterprise identity (Entra ID), hybrid deployments. Weakness: reliability incidents, naming inconsistency, complex pricing.

### Serverless Patterns

**Function as a Service (FaaS)**: Lambda, Cloud Functions, Azure Functions. Event-triggered, pay-per-invocation, auto-scaling to zero. Best for: event processing, webhooks, scheduled tasks, lightweight APIs. Trade-offs: cold start latency (100ms-10s depending on runtime and memory), 15-minute execution limit (Lambda), vendor-specific deployment.

**Serverless containers**: Fargate (AWS), Cloud Run (GCP), Container Apps (Azure). Run containers without managing servers. Cloud Run is the simplest model — deploy a container, get a URL. Auto-scales to zero, pay per request-second. Best for: HTTP APIs, microservices, any workload packaged as a container. Trade-off: less control over instance placement and networking than Kubernetes.

**Serverless databases**: DynamoDB (AWS), Firestore (GCP), Cosmos DB serverless (Azure). Pay per operation, no capacity planning. Aurora Serverless v2 scales relational databases with sub-second response to traffic changes. Best for: variable/unpredictable workloads, new projects without baseline traffic data.

**Event-driven serverless**: EventBridge + Lambda (AWS), Pub/Sub + Cloud Functions (GCP), Event Grid + Azure Functions (Azure). Compose serverless workflows from events. Step Functions (AWS), Workflows (GCP), Durable Functions (Azure) for orchestration.

**Cold start mitigation**: Provisioned concurrency (Lambda), minimum instances (Cloud Run), keep-alive pings. Use lightweight runtimes (Go, Rust, Node.js) over heavy runtimes (Java, .NET) for latency-sensitive functions. GraalVM native images reduce JVM cold starts to < 100ms.

### Managed Services Evaluation

**Build vs buy criteria**: Use managed services when the service is not a competitive differentiator, the operational burden of self-hosting exceeds the cost premium, and the service meets performance and compliance requirements. Self-host when you need customization beyond what managed services offer, have regulatory constraints on data location/handling, or when cost at scale makes managed services prohibitive.

**Evaluation checklist**: SLA guarantees (99.9% vs 99.99%), data residency options, encryption (at rest, in transit, customer-managed keys), backup and disaster recovery, monitoring and logging integration, scaling limits and behavior, egress costs, migration path (can you leave?).

**Lock-in spectrum**: Low lock-in (VMs, managed databases with standard engines, S3-compatible storage) to high lock-in (DynamoDB, Firestore, proprietary ML services, Step Functions). Use cloud-agnostic abstractions (Terraform, Kubernetes) for infrastructure, but accept strategic lock-in for high-value managed services where the productivity gain justifies the switching cost.

### Multi-Cloud Strategy

**When justified**: Regulatory requirements (data sovereignty in regions served by only one provider), best-of-breed services (GCP BigQuery + AWS compute), negotiation leverage, resilience against provider-level outages (rare but possible).

**When not justified**: Most organizations. Multi-cloud adds operational complexity, requires cross-cloud networking, limits use of managed services, and requires expertise in multiple platforms. The cost of multi-cloud expertise and tooling often exceeds the risk mitigation benefit.

**Practical multi-cloud**: Use Terraform for IaC (provider-agnostic), Kubernetes for workload portability (though not truly portable without significant effort), and standard protocols (PostgreSQL, Redis, Kafka, S3-compatible APIs) for data services. Accept that true portability requires using the lowest common denominator of features.

### Edge Computing

**CDN-level compute**: Cloudflare Workers (V8 isolates, global, < 1ms cold start), Lambda@Edge / CloudFront Functions (AWS), Vercel Edge Functions, Deno Deploy. Best for: request routing, A/B testing, authentication, personalization, geolocation-based responses. Sub-50ms global latency.

**Regional edge**: AWS Wavelength (telco edge), Azure Edge Zones, GCP Distributed Cloud Edge. Compute at telco points of presence. Best for: ultra-low-latency applications (gaming, AR/VR, real-time IoT processing). Niche use case for most applications.

**IoT edge**: AWS Greengrass, Azure IoT Edge, GCP Edge TPU. Run ML inference and data processing on edge devices. Best for: manufacturing, automotive, remote locations with intermittent connectivity.

**Pattern**: Process at the edge what benefits from proximity (routing, caching, auth checks, lightweight transformations). Delegate to regional compute for business logic. Use central cloud for data persistence and heavy processing.

## Decision Framework

| Criterion | AWS | GCP | Azure |
|-----------|-----|-----|-------|
| Enterprise adoption | Highest | Growing | High (Microsoft shops) |
| Data/ML | Good | Best | Good |
| Kubernetes | Good (EKS) | Best (GKE) | Good (AKS) |
| Serverless simplicity | Good (Lambda) | Best (Cloud Run) | Good |
| Hybrid cloud | Good (Outposts) | Fair | Best (Arc) |
| Pricing transparency | Complex | Simpler | Complex |
| Free tier | 12 months | Always free tiers | 12 months |
| Global edge | Largest | Strong backbone | Growing |

## Anti-Patterns

- **Multi-cloud by accident**: Using AWS for compute, GCP for data, Azure for identity without deliberate strategy. Results in: complex networking, no centralized security posture, expertise spread thin, highest possible cost.
- **Serverless for everything**: Running long-running batch jobs on Lambda, stateful applications on Cloud Functions. Serverless excels for event-driven, stateless, short-lived workloads. Use containers or VMs for long-running, stateful, or compute-intensive workloads.
- **Ignoring egress costs**: Cloud pricing is asymmetric — ingress is free, egress is expensive. Architecture decisions that move large data volumes between services, regions, or clouds incur significant costs. Design data flow to minimize egress.
- **Lift-and-shift without optimization**: Moving VMs to the cloud without re-architecting for cloud-native patterns. Results in higher costs than on-premise without cloud benefits. Plan a modernization phase after initial migration.

## Evidence Signals

- `serverless.yml`, `template.yaml` (SAM), `app.yaml` (GCP) — serverless framework configuration.
- Cloud SDK dependencies in code (`@aws-sdk/*`, `@google-cloud/*`, `@azure/*`) — cloud provider coupling level.
- Terraform provider blocks — infrastructure platform choices and multi-cloud indicators.
- Container registry URLs in CI/CD (ECR, GCR/Artifact Registry, ACR) — deployment target.
- Environment variable prefixes (`AWS_`, `GOOGLE_`, `AZURE_`) — cloud platform indicators.
- Cost allocation tags in infrastructure config — cost management maturity.

---
*Sovereign Architect RAG Priming · JM Labs*
