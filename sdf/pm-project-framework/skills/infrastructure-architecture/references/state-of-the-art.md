# State of the Art — Infrastructure Architecture (2024-2026)

> Tendencias, herramientas emergentes y debates abiertos en el dominio de infraestructura cloud, IaC, networking, HA/DR, y platform engineering.

---

## 1. Tendencias Dominantes

### 1.1 Platform Engineering como Disciplina

- **Qué está pasando:** Platform Engineering ha evolucionado de buzzword a disciplina formal. Gartner lo incluyó en Top Strategic Tech Trends (2024-2025) y predice que el 80% de las organizaciones de ingeniería tendrán un equipo de plataforma para 2026. El enfoque se centra en Internal Developer Platforms (IDPs) que abstraen la complejidad de infraestructura y ofrecen self-service.
- **Impacto en el skill:** El rol de platform-engineer (owner de este skill) gana centralidad. El diseño de infraestructura ya no es solo "dónde corren los servidores" sino "cómo construir una plataforma que los desarrolladores puedan consumir sin tickets". S6 (Landing Zone) se expande para incluir IDP design.
- **Herramientas clave:** Backstage (Spotify, CNCF incubating), Port, Humanitec, Crossplane.
- **Fuentes:** Gartner (2024) "Top Strategic Technology Trends"; Humanitec (2025) "State of Platform Engineering Report"; CNCF (2025) "Platform Engineering Maturity Model".

### 1.2 GitOps y Infraestructura Declarativa

- **Qué está pasando:** GitOps (acuñado por Weaveworks, 2017) se ha consolidado como el paradigma operativo dominante para infraestructura Kubernetes y más allá. ArgoCD y Flux son graduated/incubating en CNCF. La extensión a infraestructura base (no solo K8s) vía Crossplane y Terraform Cloud/Spacelift está madurando.
- **Impacto en el skill:** IaC ya no es suficiente — se espera GitOps como modelo operativo completo: Git como source of truth, reconciliation loops, drift detection automático, y pull-based deployment.
- **Estado 2026:** ~60% de organizaciones con K8s usan alguna forma de GitOps. La adopción para infraestructura base (VPCs, databases) está en ~25% y creciendo.
- **Fuentes:** CNCF (2025) "GitOps Working Group"; Weaveworks (2024) "GitOps Principles v1.0"; OpenGitOps.dev

### 1.3 FinOps Integrado en Decisiones de Infraestructura

- **Qué está pasando:** FinOps ha dejado de ser una práctica post-facto ("¿cuánto gastamos?") para integrarse en el diseño de infraestructura ("¿cuánto DEBERÍA costar esto?"). Los equipos de plataforma incorporan cost constraints como un requisito no funcional más, al nivel de latencia o availability.
- **Impacto en el skill:** S7 (Cost Optimization) se vuelve transversal — cada sección debe considerar implicaciones de costo. Las decisiones de compute (S2), storage (S3), y HA/DR (S4) incluyen análisis de costo como dimensión primaria, no secundaria.
- **Herramientas clave:** Infracost (costo de Terraform antes de apply), FOCUS (FinOps Open Cost and Usage Specification), Kubecost, CloudZero, Vantage.
- **Fuentes:** FinOps Foundation (2025) "State of FinOps Report"; Infracost (2025) "Shift-Left Cloud Costs"; FOCUS Project (2024) "v1.0 Specification".

### 1.4 Green Computing / Infraestructura Sostenible

- **Qué está pasando:** La sostenibilidad se ha convertido en el sexto pilar de AWS Well-Architected (agregado en 2022) y en un diferenciador competitivo. La EU Corporate Sustainability Reporting Directive (CSRD) obliga a reportar emisiones de IT. Los cloud providers publican herramientas de carbon footprint (AWS Customer Carbon Footprint Tool, Google Carbon Footprint, Azure Emissions Impact Dashboard).
- **Impacto en el skill:** Las decisiones de región ya no son solo por latencia y compliance — el carbon intensity de la región importa. Graviton/ARM processors reducen consumo energético 60% vs. x86 en mismas cargas. Auto-scaling a zero reduce waste.
- **Estado 2026:** ~30% de empresas Fortune 500 incluyen carbon footprint de cloud en reportes ESG. Los proveedores de cloud compiten en carbon-neutral operations.
- **Fuentes:** AWS (2024) "Sustainability Pillar — Well-Architected Framework"; EU CSRD (2024); The Green Software Foundation (2025) "Software Carbon Intensity Specification".

### 1.5 Edge Computing y Cloud Híbrido

- **Qué está pasando:** El edge computing ha madurado más allá del IoT hacia aplicaciones de baja latencia (gaming, video processing, AI inference). AWS Local Zones, Azure Edge Zones, y Google Distributed Cloud permiten ejecutar workloads en ubicaciones cercanas al usuario final con la misma API del cloud central.
- **Impacto en el skill:** S1 (Network) debe considerar topologías hub-and-spoke con edge locations. S2 (Compute) evalúa qué workloads se benefician del edge (latency < 10ms) vs. cloud central. S4 (HA/DR) se complica con más puntos de fallo.
- **Fuentes:** Gartner (2025) "Edge Computing: Where Data and Action Meet"; AWS (2024) "Local Zones"; CNCF (2025) "Edge Working Group".

### 1.6 Infraestructura para AI (GPU Clusters, Model Serving)

- **Qué está pasando:** La explosión de AI/ML ha creado un nuevo tipo de infraestructura con requerimientos fundamentalmente diferentes: GPU clusters con high-bandwidth networking (InfiniBand, EFA), storage de alta throughput (FSx for Lustre, GCS FUSE), y frameworks de serving (vLLM, TGI, Triton). La escasez de GPUs ha hecho que el capacity planning para AI sea una disciplina crítica.
- **Impacto en el skill:** Nuevo edge case para S2 (Compute): GPU node groups con scheduling especializado (fractional GPUs, MIG, time-slicing). S3 (Storage): model artifacts de GBs-TBs que necesitan staging rápido. S7 (Cost): GPUs son 10x-100x más caras que CPUs; reservations y spot son críticos.
- **Fuentes:** NVIDIA (2025) "AI Infrastructure Reference Architecture"; AWS (2025) "SageMaker Infrastructure Best Practices"; Ray Project (2025) "Scaling AI Workloads".

---

## 2. Herramientas Emergentes (2024-2026)

### 2.1 Infrastructure as Code

| Herramienta | Propósito | Madurez | Relevancia para el skill |
|---|---|---|---|
| **Terraform** | IaC declarativa multi-cloud | Madura (dominante, 72% share) | S6 — estándar de facto para landing zones |
| **OpenTofu** | Fork open-source de Terraform | Creciendo (CNCF) | Alternativa OSS post-BSL de HashiCorp |
| **Pulumi** | IaC en lenguajes generales (TS, Python, Go) | Creciendo | Equipos developer-first que prefieren TypeScript/Python |
| **Crossplane** | IaC Kubernetes-native (CRDs) | Creciendo (CNCF incubating) | GitOps para infraestructura base via K8s API |
| **AWS CDK / cdktf** | IaC con abstracciones de alto nivel | Madura | Equipos AWS-native o multi-cloud via cdktf |
| **Spacelift / Env0** | IaC CI/CD platforms | Creciendo | Governance, policy-as-code, drift detection |

### 2.2 Kubernetes & Platform

| Herramienta | Propósito | Relevancia para el skill |
|---|---|---|
| **Karpenter** | Just-in-time node provisioning | S2 — autoscaling eficiente en costo |
| **ArgoCD** | GitOps deployment for K8s | Deployment pipeline para infraestructura K8s |
| **Backstage** | Internal Developer Portal | S6 — self-service platform para developers |
| **Cilium** | eBPF-based networking + security | S1 — network policies sin overhead de iptables |
| **Istio / Linkerd** | Service mesh | S1 — mTLS, traffic management, observability |
| **External Secrets Operator** | Secrets sync to K8s | S5 — integración con Vault/AWS Secrets Manager |

### 2.3 Observabilidad e Infraestructura

| Herramienta | Propósito | Relevancia para el skill |
|---|---|---|
| **OpenTelemetry** | Observability estándar (CNCF graduated) | Monitoring de infraestructura estandarizado |
| **Grafana Stack (Loki, Tempo, Mimir)** | Unified observability OSS | Dashboards para todas las secciones |
| **Infracost** | Cost estimation pre-apply | S7 — shift-left de costos en PR review |
| **Checkov / tfsec** | IaC security scanning | S5 — policy-as-code para Terraform |
| **AWS FIS / LitmusChaos** | Chaos testing | S4 — chaos engineering automatizado |

---

## 3. Debates Abiertos en la Industria

### 3.1 ¿Terraform vs. Pulumi vs. Crossplane?

**El debate de IaC en 2026:**
- **Pro-Terraform:** Ecosistema maduro, enorme provider ecosystem, community knowledge. El cambio a BSL license (agosto 2023) generó preocupación pero no migración masiva.
- **Pro-OpenTofu:** Fork OSS de Terraform (CNCF). Para organizaciones que necesitan licencia genuinamente open-source.
- **Pro-Pulumi:** "Si mis developers ya saben TypeScript, por qué aprender HCL?" Mejor testing, mejor IDE support, type safety.
- **Pro-Crossplane:** "Infraestructura como extensión de Kubernetes." Ideal para GitOps puro. Pero curva de aprendizaje alta si no tienes K8s expertise.
- **Posición del skill:** Terraform como default para landing zones; Pulumi/CDK cuando el equipo es developer-heavy; Crossplane para GitOps-native. La herramienta importa menos que los principios (idempotencia, versionado, testing).

### 3.2 ¿Multi-Cloud es Real o Marketing?

- **Pro-multi-cloud:** Evitar vendor lock-in, best-of-breed services, regulatory requirements (data sovereignty).
- **Anti-multi-cloud:** Complejidad operativa explosiva. "Si no puedes operar bien un cloud, ¿por qué intentar dos?" Lowest common denominator problem.
- **Realidad 2026:** La mayoría de empresas son "multi-cloud by accident" (adquisiciones, shadow IT), no por diseño. Multi-cloud estratégico existe pero solo se justifica en organizaciones grandes con specialized needs.
- **Posición del skill:** Cloud-primary con portabilidad consciente. Abstraer donde sea barato (containers, Terraform), aceptar lock-in donde sea valioso (managed services). Documentar decisiones de lock-in explícitamente.

### 3.3 ¿Serverless para Todo?

- **Pro-serverless (2024):** "No managing servers, ever. Pay per request. Scale to zero."
- **Crítica (2025-2026):** Cost at scale (Lambda a >1M invocations/day puede ser más caro que containers). Cold starts. Vendor lock-in. Debugging complexity. "Serverless was never about no servers — it was about no servers you manage."
- **Posición del skill:** Serverless para event-driven, bursty, y low-traffic workloads. Containers (K8s/ECS) para steady-state, high-throughput. VMs para legacy y compliance. Decision matrix en S2.

### 3.4 ¿Cuánto HA/DR es Suficiente?

- **El espectro:** Single-AZ (barato, risky) → Multi-AZ (standard) → Multi-Region active-passive (expensive) → Multi-Region active-active (very expensive, complex).
- **Debate:** "¿Justifica el costo de multi-region el riesgo real de region failure?" AWS/Azure tienen <1 full-region outage per year. Pero cuando ocurre (us-east-1, December 2021), el impacto es catastrófico.
- **Posición del skill:** Multi-AZ es el mínimo para producción. Multi-region solo cuando RPO/RTO del negocio lo exigen O cuando la regulación lo requiere. Siempre cuantificar: costo de DR vs. costo de downtime.

---

## 4. Casos de Éxito Documentados

### 4.1 Spotify — Platform Engineering con Backstage
- **Contexto:** Spotify creó Backstage como su Internal Developer Portal para gestionar 2,000+ microservices. Open-sourced en 2020, ahora CNCF incubating con 1,000+ adopters.
- **Relevancia:** Modelo de cómo platform engineering habilita self-service infrastructure sin sacrificar governance.
- **Fuente:** Spotify Engineering Blog (2024); CNCF Case Study.

### 4.2 Netflix — Chaos Engineering a Escala
- **Contexto:** Netflix inventó Chaos Monkey (2011) y evolucionó a Chaos Engineering como disciplina con herramientas como ChAP (Chaos Automation Platform). Ejecutan experimentos de caos continuamente en producción.
- **Relevancia:** Referencia para S4 (HA/DR). El programa de chaos testing de Netflix demuestra que la resiliencia se construye con práctica, no con teoría.
- **Fuente:** Netflix Tech Blog (2024); Rosenthal & Jones (2020) *Chaos Engineering*.

### 4.3 Capital One — Cloud Landing Zone Enterprise
- **Contexto:** Capital One fue la primera empresa Fortune 500 en mover 100% de sus workloads a AWS (completado 2020). Su landing zone incluye 1,000+ cuentas AWS con governance automatizada.
- **Relevancia:** Referencia para S6 (Cloud Landing Zone) en contexto regulado (banking, PCI-DSS). Demuestra que cloud-first es viable incluso en industrias altamente reguladas.
- **Fuente:** Capital One Tech Blog (2024); AWS re:Invent case study.

### 4.4 Mercado Libre — FinOps a Escala en LATAM
- **Contexto:** Mercado Libre gestiona una de las mayores infraestructuras cloud de LATAM. Su práctica de FinOps redujo costos cloud en 30% sin afectar performance, mediante right-sizing agresivo y spot instances para batch processing.
- **Relevancia:** Referencia para S7 (Cost Optimization) con contexto LATAM relevante para clientes MetodologIA.
- **Fuente:** Mercado Libre Engineering Blog (2024); FinOps Foundation case study.

---

## 5. Evolución Esperada (2026-2028)

| Tendencia | Probabilidad | Impacto en el skill |
|---|---|---|
| **AI generates IaC from natural language** | Alta | S6 se acelera pero requiere review humano |
| **FinOps como requisito regulatorio** | Media-Alta | S7 pasa de nice-to-have a mandatory |
| **Wasm containers reemplazan algunos Docker containers** | Media | S2 agrega Wasm como opción de compute |
| **Carbon-aware scheduling** | Media | S2/S7 incluyen carbon footprint en decisions |
| **Confidential Computing mainstream** | Media | S5 agrega enclaves como opción de seguridad |
| **Infrastructure from Code (IfC)** | Baja-Media | IaC se infiere del código de aplicación (Ampt, Nitric) |
| **Quantum-safe networking** | Baja (2028+) | S1/S5 requieren post-quantum encryption |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
