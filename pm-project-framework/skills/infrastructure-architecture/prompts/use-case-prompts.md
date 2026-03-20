# Use Case Prompts — Infrastructure Architecture

> Ready-to-use prompts for the most frequent use cases of this skill.
> Each prompt includes context on when to use it and variable parameters.

---

## 1. Cloud Landing Zone Design

**When:** Start of cloud adoption or restructuring of existing account strategy.

```
Disenar cloud landing zone para {ORGANIZACION} en {CLOUD_PROVIDER}.

Contexto:
- Industria: {INDUSTRIA}
- Numero de aplicaciones/workloads: {NUM_WORKLOADS}
- Equipos de desarrollo: {NUM_EQUIPOS}
- Regulaciones: {REGULACIONES} (ej: PCI-DSS, HIPAA, SOX, GDPR)
- Cloud provider actual: {PROVIDER_ACTUAL} (o greenfield)

Requisitos:
- Account/subscription structure (OUs, management groups)
- Network hub-and-spoke o mesh topology
- SCPs/policies preventivas y detectivas
- Tagging strategy con enforcement
- Billing and cost allocation model
- IaC pipeline para provisioning de cuentas nuevas

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Entregar S6 (Cloud Landing Zone) completo con diagrama de Organizations y SCP matrix.
Incluir S5 (IAM baseline) y S7 (cost allocation) como secciones complementarias.
```

---

## 2. Disaster Recovery Strategy Design

**When:** The client needs to define or improve their DR strategy (RPO/RTO not defined or not met).

```
Disenar estrategia de HA/DR para {SISTEMA} en {CLOUD_PROVIDER}.

Contexto:
- Criticidad de negocio: {CRITICIDAD} (mission-critical / business-critical / operational)
- Usuarios activos: {USUARIOS}
- Transacciones por segundo (pico): {TPS}
- RPO requerido: {RPO_TARGET} (ej: <5 min, <1 hora, <24 horas)
- RTO requerido: {RTO_TARGET}
- Presupuesto de DR: {PRESUPUESTO_MAGNITUD} (ej: bajo, moderado, alto)
- Regiones actuales: {REGIONES}

Evaluar y recomendar:
- Multi-AZ deployment pattern
- DR strategy: backup-restore vs pilot-light vs warm-standby vs active-active
- Replication strategy por componente (DB, cache, storage, event bus)
- Failover automation level (manual vs semi-auto vs full-auto)
- Chaos testing program (frequency, tools, blast radius)
- Runbook de failover y failback

Parametros:
- {MODO}: supervisado (confirmar RPO/RTO antes de disenar)
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Entregar S4 (HA/DR) como seccion principal con diagrama de failover.
Incluir S3 (backup/recovery) y S7 (cost of DR) como complementos.
```

---

## 3. Infrastructure as Code Assessment

**When:** Evaluate IaC maturity and recommend improvements to achieve 100% IaC coverage.

```
Evaluar madurez de Infrastructure as Code para {ORGANIZACION}.

Contexto:
- Herramienta IaC actual: {HERRAMIENTA} (Terraform/Pulumi/CDK/CloudFormation/ninguna)
- Coverage estimado: {COVERAGE}% de recursos en IaC
- Num de entornos: {NUM_ENTORNOS} (dev, staging, prod, etc.)
- Equipo ops/platform: {NUM_OPS} personas
- Pain points actuales: {PAIN_POINTS} (ej: drift, no testing, modulos monoliticos)

Evaluar:
- IaC coverage actual vs target
- Module structure y reutilizacion
- State management (remote state, locking, isolation)
- Testing strategy (unit, integration, compliance)
- CI/CD pipeline para IaC (plan, apply, drift detection)
- Policy-as-code (OPA, Sentinel, Checkov)
- Governance model (module registry, versioning, code review)

Entregar:
1. Maturity assessment (Level 1-5 scale)
2. Gap analysis con roadmap de mejora
3. Quick wins implementables en <2 semanas
4. Target architecture para IaC pipeline

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 4. Network Segmentation Design

**When:** Redesign network topology to improve security, compliance, or prepare for microservices migration.

```
Disenar segmentacion de red para {SISTEMA} en {CLOUD_PROVIDER}.

Contexto:
- Estado actual de red: {ESTADO_RED} (ej: flat network, single VPC, VPCs sin peering)
- Numero de servicios/aplicaciones: {NUM_SERVICIOS}
- Compliance requirements: {COMPLIANCE} (ej: PCI-DSS requires network segmentation)
- Conectividad requerida: {CONECTIVIDAD} (ej: on-premises VPN, partner APIs, multi-region)

Disenar:
- VPC/VNET architecture (cuantos, CIDR planning, no overlap)
- Subnet tiers: public / private / protected
- Security groups y NACLs (least privilege matrix)
- Load balancing strategy (L4 vs L7, internal vs external)
- Service mesh / service discovery
- DNS strategy (public, private zones)
- DDoS and WAF protection layers
- Connectivity: Transit Gateway, VPN, Direct Connect

Parametros:
- {MODO}: supervisado
- {FORMATO}: markdown

Entregar S1 (Network Topology) completo con Mermaid diagram.
Incluir S5 (network security controls) como complemento.
```

---

## 5. Hybrid Cloud Architecture

**When:** Workloads distributed between on-premises and cloud, or partial migration in progress.

```
Disenar arquitectura hibrida para {ORGANIZACION}.

Contexto:
- Datacenter on-premises: {DATACENTER} (ubicacion, capacidad)
- Cloud provider: {CLOUD_PROVIDER}
- Workloads en on-prem: {WORKLOADS_ONPREM} (ej: ERP, legacy DB, mainframe)
- Workloads en cloud: {WORKLOADS_CLOUD} (ej: web apps, mobile backends)
- Connectivity actual: {CONECTIVIDAD} (VPN, Direct Connect, internet)
- Latency requirements: {LATENCIA} entre on-prem y cloud
- Data residency constraints: {DATA_RESIDENCY}

Disenar:
- Network connectivity (Direct Connect vs VPN vs both)
- DNS split-horizon strategy
- Identity federation (on-prem AD + cloud IAM)
- Data replication between on-prem and cloud
- Monitoring unificado (single pane of glass)
- Migration wave planning (what stays, what moves, when)
- Cost comparison: on-prem vs cloud per workload

Parametros:
- {MODO}: supervisado
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Entregar todas 7 secciones con enfasis en S1 (hybrid networking) y S4 (cross-environment DR).
```

---

## 6. Container Platform Design

**When:** Kubernetes adoption or redesign of existing container platform.

```
Disenar plataforma de contenedores para {ORGANIZACION}.

Contexto:
- Num de microservicios: {NUM_SERVICES}
- Traffic (RPS peak): {RPS}
- Equipo platform: {NUM_PLATFORM} personas
- Kubernetes experience: {K8S_MATURITY} (none / basic / intermediate / advanced)
- Cloud provider: {CLOUD_PROVIDER}
- Compliance: {COMPLIANCE}

Disenar:
- Managed K8s vs self-managed decision
- Cluster architecture (control plane, node groups, namespaces)
- Node strategy: instance types, Graviton/ARM, spot vs on-demand
- Autoscaling: HPA, VPA, Karpenter/Cluster Autoscaler
- Networking: CNI selection, service mesh, ingress controller
- Storage: CSI drivers, persistent volumes strategy
- Security: RBAC, network policies, pod security standards, image scanning
- Observability: metrics, logs, traces (OpenTelemetry)
- GitOps deployment: ArgoCD vs Flux

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown

Entregar S2 (Compute & Containers) como seccion principal.
Incluir S1 (K8s networking) y S5 (K8s security) como complementos.
```

---

## 7. Serverless Infrastructure Design

**When:** Evaluate or implement serverless for event-driven workloads, low-traffic APIs, or batch functions.

```
Disenar infraestructura serverless para {CASO_USO} de {ORGANIZACION}.

Contexto:
- Caso de uso: {CASO_USO} (ej: API backend, event processing, data pipeline, scheduled jobs)
- Patron de trafico: {PATRON} (ej: bursty, steady, periodic, event-driven)
- Invocaciones estimadas/mes: {INVOCACIONES}
- Duracion promedio de ejecucion: {DURACION}
- Cold start tolerance: {COLD_START} (acceptable / not acceptable)
- Cloud provider: {CLOUD_PROVIDER}

Evaluar:
- Lambda/Cloud Functions vs Fargate/Cloud Run vs Step Functions
- Event sources: API Gateway, SQS, SNS, EventBridge, Kafka
- State management: Step Functions, DynamoDB, S3
- Observability: X-Ray, CloudWatch, custom metrics
- Security: execution roles, VPC integration, secrets
- Cost projection: per-invocation vs always-on comparison
- Anti-patterns: serverless monolith, over-orchestration, cold start chains

Decision framework:
- Si invocaciones < {THRESHOLD_LOW}: serverless wins
- Si invocaciones > {THRESHOLD_HIGH}: containers may be cheaper
- Si cold start intolerable: provisioned concurrency o containers

Parametros:
- {MODO}: desatendido
- {FORMATO}: markdown
```

---

## 8. Infrastructure Cost Optimization

**When:** The client wants to reduce cloud spend without sacrificing performance or reliability.

```
Optimizar costos de infraestructura para {ORGANIZACION} en {CLOUD_PROVIDER}.

Contexto:
- Cloud spend actual: {SPEND_MAGNITUD}/mes (ej: $50K-100K range)
- Crecimiento de spend: {CRECIMIENTO}% mensual
- Cloud provider: {CLOUD_PROVIDER}
- Servicios principales: {SERVICIOS} (ej: EC2, RDS, S3, Lambda, EKS)
- Reservaciones actuales: {RESERVACIONES} (ej: ninguna, parcial, completa)
- Equipo FinOps: {EQUIPO_FINOPS} (existe / no existe)

Analizar y recomendar:
1. Right-sizing: recursos sobre-provisionados (CPU, memory utilization)
2. Commitment discounts: Reserved Instances, Savings Plans, CUDs
3. Spot/preemptible: workloads elegibles para spot instances
4. Storage optimization: lifecycle policies, tiering, cleanup
5. Network optimization: VPC endpoints, CDN, data transfer reduction
6. Managed vs self-managed: break-even analysis
7. Environment scheduling: staging/dev off-hours shutdown
8. Unused resources: orphaned volumes, idle load balancers, unused EIPs
9. Governance: tagging compliance, budget alerts, anomaly detection
10. FinOps practice: team structure, tooling, cadence

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown

Entregar S7 (Cost Optimization) como seccion principal.
IMPORTANTE: Solo magnitudes y porcentajes. NUNCA precios exactos como compromiso.
Incluir quick wins (< 5 dias cada uno) y strategic recommendations (1-3 meses).
```

---

**Author:** Javier Montano | **Last updated:** March 13, 2026
**© Comunidad MetodologIA — All rights reserved**
