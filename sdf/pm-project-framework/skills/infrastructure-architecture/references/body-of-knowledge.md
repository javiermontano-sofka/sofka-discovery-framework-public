# Body of Knowledge — Infrastructure Architecture

> Fuentes académicas, industriales y prácticas que fundamentan el diseño de plataformas e infraestructura cloud: IaC, networking, compute/storage, HA/DR, y cloud landing zones.

---

## 1. Cloud Architecture Frameworks

### AWS Well-Architected Framework (6 Pillars)
- **Relevancia:** Marco de referencia primario para decisiones de infraestructura en AWS. Los 6 pilares — Operational Excellence, Security, Reliability, Performance Efficiency, Cost Optimization, Sustainability — mapean directamente a las 7 secciones del skill.
- **Uso en el skill:** S1 (Network) y S4 (HA/DR) se fundamentan en Reliability; S5 (IAM) en Security; S7 (Cost) en Cost Optimization; S2 (Compute) en Performance Efficiency.
- **Fuente:** AWS (2024). *AWS Well-Architected Framework*. docs.aws.amazon.com/wellarchitected
- **Herramienta:** AWS Well-Architected Tool — evaluación automatizada contra los 6 pilares.

### Azure Cloud Adoption Framework (CAF)
- **Relevancia:** Framework end-to-end para adopción cloud que incluye landing zone design, governance, y security baseline. Complementa la perspectiva AWS con enfoque multi-cloud.
- **Uso en el skill:** S6 (Cloud Landing Zone) adopta la estructura de Azure CAF para account/subscription topology, management groups, y policy enforcement.
- **Fuente:** Microsoft (2024). *Cloud Adoption Framework for Azure*. learn.microsoft.com/azure/cloud-adoption-framework
- **Complemento:** Azure Landing Zones (formerly Enterprise-Scale) — reference architecture para landing zones.

### GCP Architecture Framework
- **Relevancia:** Framework de Google Cloud con énfasis en operational excellence, security, reliability, cost optimization, y performance optimization. Enfoque distinctive en data-driven infrastructure decisions.
- **Uso en el skill:** Referencia complementaria para evaluaciones multi-cloud y para workloads data-intensive donde GCP tiene ventajas (BigQuery, GKE).
- **Fuente:** Google Cloud (2024). *Google Cloud Architecture Framework*. cloud.google.com/architecture/framework

### TOGAF ADM — Phase D (Technology Architecture)
- **Relevancia:** La fase de Technology Architecture de TOGAF define la infraestructura tecnológica que soporta los building blocks de aplicación. Nuestro skill ES la implementación detallada de Phase D.
- **Uso en el skill:** El framework de 7 secciones operacionaliza lo que TOGAF Phase D describe a nivel conceptual, con profundidad técnica de implementación.
- **Fuente:** The Open Group (2022). *TOGAF Standard, 10th Edition*. Chapter 20: Phase D.

---

## 2. Infrastructure as Code (IaC)

### Infrastructure as Code — Kief Morris (O'Reilly, 2nd Edition, 2021)
- **Relevancia:** Texto fundacional para IaC. Define los principios de infraestructura declarativa, idempotencia, inmutabilidad, y modularización que el skill asume como baseline.
- **Patrones clave:** Stack pattern, module pattern, pipeline-driven infrastructure, environment configuration, testing pyramid for IaC.
- **Anti-patrones:** Snowflake servers, manual hotfixes, configuration drift, untested infrastructure.
- **Uso en el skill:** Todo el skill asume IaC como prerequisito ("Si no está en código, no existe"). Los patrones de Morris fundamentan las recomendaciones de S6 (Landing Zone) y la Validation Gate.
- **Fuente:** Morris, K. (2021). *Infrastructure as Code: Dynamic Systems for the Cloud Age*, 2nd Ed. O'Reilly.

### Terraform: Up & Running — Yevgeniy Brikman (O'Reilly, 3rd Edition, 2022)
- **Relevancia:** Referencia práctica para implementación de IaC con Terraform, la herramienta más adoptada (72% market share en IaC, según HashiCorp 2024).
- **Uso en el skill:** Patrones de módulos, estado remoto, workspaces, y testing informan las recomendaciones de implementación.
- **Fuente:** Brikman, Y. (2022). *Terraform: Up & Running*, 3rd Ed. O'Reilly.

### AWS CDK Patterns
- **Relevancia:** Referencia para equipos que prefieren CDK (TypeScript/Python) sobre HCL. Relevant cuando el equipo tiene más developers que ops.
- **Fuente:** AWS (2024). *AWS CDK Patterns*. cdkpatterns.com; Swidler, M. (2023). *The CDK Book*. thecdkbook.com.

---

## 3. Networking

### RFC 1918 — Address Allocation for Private Internets
- **Relevancia:** Define los rangos de IP privados (10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16) que fundamentan todo diseño de VPC/VNET.
- **Uso en el skill:** S1 (Network Topology) usa rangos RFC 1918 para CIDR planning. El skill verifica que no haya solapamiento entre VPCs.
- **Fuente:** Rekhter, Y., Moskowitz, B., Karrenberg, D., de Groot, G.J., Lear, E. (1996). RFC 1918.

### RFC 4271 — BGP-4 (Border Gateway Protocol)
- **Relevancia:** Protocolo fundamental para conectividad híbrida (Direct Connect, VPN, Transit Gateway con BGP peering).
- **Uso en el skill:** S1 cuando se diseña conectividad híbrida o multi-cloud con BGP route propagation.
- **Fuente:** Rekhter, Y., Li, T., Hares, S. (2006). RFC 4271.

### RFC 6749 — OAuth 2.0 Authorization Framework
- **Relevancia:** Estándar para autorización que fundamenta la integración de identity federation en S5 (IAM).
- **Fuente:** Hardt, D. (2012). RFC 6749.

### Zero Trust Networks — Gilman & Barth (O'Reilly, 2017)
- **Relevancia:** Modelo de seguridad que asume breach y verifica todo acceso. Fundamenta el diseño de network segmentation y IAM en S1 y S5.
- **Uso en el skill:** Principio de "never trust, always verify" aplicado a security groups, service mesh, y service-to-service auth.
- **Fuente:** Gilman, E. & Barth, D. (2017). *Zero Trust Networks*. O'Reilly.

---

## 4. Reliability & Disaster Recovery

### Site Reliability Engineering — Google (Beyer, Jones, Petoff, Murphy)
- **Relevancia:** Texto fundacional de SRE. Define SLO/SLI/SLA, error budgets, toil elimination, y incident response que fundamentan S4 (HA/DR) y la filosofía operativa del skill.
- **Conceptos clave:** Error budget, toil budget, blameless post-mortems, release engineering, monitoring (the four golden signals: latency, traffic, errors, saturation).
- **Uso en el skill:** S4 usa SLO-driven design. RPO/RTO se derivan de SLOs de negocio, no de capacidades técnicas.
- **Fuente:** Beyer, B., Jones, C., Petoff, J., & Murphy, N.R. (2016). *Site Reliability Engineering*. O'Reilly.
- **Complemento:** Beyer, B. et al. (2018). *The Site Reliability Workbook*. O'Reilly.

### Chaos Engineering — Casey Rosenthal & Nora Jones (O'Reilly, 2020)
- **Relevancia:** Disciplina de experimentación en sistemas distribuidos para descubrir debilidades. Fundamenta el programa de chaos testing en S4.
- **Principios:** Hipótesis de steady state, variar eventos del mundo real, ejecutar en producción, automatizar para ejecución continua, minimizar blast radius.
- **Fuente:** Rosenthal, C. & Jones, N. (2020). *Chaos Engineering*. O'Reilly.

### Release It! — Michael Nygard (Pragmatic, 2nd Edition, 2018)
- **Relevancia:** Patrones de estabilidad (circuit breaker, bulkhead, timeout, retry) y anti-patrones (cascading failure, blocked threads) que informan el diseño de resiliencia.
- **Uso en el skill:** S4 referencia los stability patterns. S1 aplica bulkhead a nivel de red (network segmentation como bulkhead).
- **Fuente:** Nygard, M. (2018). *Release It!*, 2nd Ed. Pragmatic Bookshelf.

---

## 5. Security & Compliance

### NIST SP 800-53 Rev. 5 — Security and Privacy Controls
- **Relevancia:** Catálogo de 1,189 controles de seguridad organizados en 20 familias. Fundamenta S5 (IAM & Platform Security) y las guardrails de S6 (Landing Zone).
- **Familias relevantes:** AC (Access Control), AU (Audit and Accountability), CA (Assessment), CM (Configuration Management), IA (Identification and Authentication), SC (System and Communications Protection), SI (System and Information Integrity).
- **Uso en el skill:** Mapeamos controles NIST a implementaciones cloud (IAM policies, CloudTrail, Config, GuardDuty, etc.).
- **Fuente:** NIST (2020). *SP 800-53 Rev. 5: Security and Privacy Controls for Information Systems and Organizations*.

### CIS Benchmarks (Center for Internet Security)
- **Relevancia:** Benchmarks prescriptivos para hardening de plataformas cloud (CIS AWS Foundations, CIS Azure, CIS GCP, CIS Kubernetes).
- **Uso en el skill:** S5 y S6 validan configuración contra CIS benchmarks. AWS Security Hub puede evaluar automáticamente.
- **Fuente:** CIS (2024). *CIS Benchmarks*. cisecurity.org

### PCI DSS v4.0
- **Relevancia:** Estándar para protección de datos de tarjetas de pago. Aplica cuando la infraestructura procesa, almacena o transmite datos de tarjetahabientes.
- **Uso en el skill:** Cuando `{COMPLIANCE}` incluye PCI-DSS, S5 activa controles adicionales (field-level encryption, CloudHSM, network segmentation reforzada).
- **Fuente:** PCI SSC (2022). *PCI DSS v4.0*.

---

## 6. Cost Optimization & FinOps

### Cloud FinOps — J.R. Storment & Mike Fuller (O'Reilly, 2nd Edition, 2023)
- **Relevancia:** Framework operativo para gestión financiera de cloud. Define las fases Inform, Optimize, Operate que fundamentan S7 (Cost Optimization).
- **Principios:** Teams need to collaborate, everyone takes ownership, FinOps reports should be accessible and timely, a centralized team drives FinOps, decisions are driven by business value.
- **Uso en el skill:** S7 estructura las recomendaciones de costo según el framework FinOps. Los dashboards y alertas siguen la fase "Inform".
- **Fuente:** Storment, J.R. & Fuller, M. (2023). *Cloud FinOps*, 2nd Ed. O'Reilly.
- **Complemento:** FinOps Foundation (2024). *FinOps Framework*. finops.org

---

## 7. Bibliografía Práctica

| Categoría | Libro/Recurso | Autor | Relevancia |
|---|---|---|---|
| Fundacional | *Cloud Native Patterns* | Cornelia Davis (2019) | Patrones cloud-native para S2 |
| Fundacional | *Designing Distributed Systems* | Brendan Burns (2018) | Patrones de sistemas distribuidos |
| Avanzado | *Kubernetes Patterns* | Ibryam & Huss, 2nd Ed (2023) | Patrones K8s para S2 compute strategy |
| Avanzado | *Networking and Kubernetes* | Strong & Burer (2021) | Deep dive en networking K8s para S1 |
| Práctico | *Cloud Strategy* | Gregor Hohpe (2020) | Estrategia cloud para executives |
| Práctico | *The Phoenix Project* | Kim, Behr, Spafford (2013) | Cultura DevOps que habilita IaC |
| Métricas | *Accelerate* | Forsgren, Humble, Kim (2018) | DORA metrics para operational maturity |

---

## 8. Glosario de Términos

| Término | Definición |
|---|---|
| **IaC (Infrastructure as Code)** | Gestión de infraestructura mediante archivos de definición declarativos o imperativos, versionados en control de código |
| **Landing Zone** | Entorno cloud pre-configurado con account structure, networking, security, y governance listos para recibir workloads |
| **VPC (Virtual Private Cloud)** | Red virtual aislada dentro de un cloud provider donde se despliegan recursos |
| **CIDR** | Classless Inter-Domain Routing — notación para rangos de IP (ej: 10.0.0.0/16) |
| **RPO (Recovery Point Objective)** | Máxima pérdida de datos aceptable, medida en tiempo |
| **RTO (Recovery Time Objective)** | Máximo tiempo de downtime aceptable tras un incidente |
| **SLO (Service Level Objective)** | Objetivo interno de nivel de servicio, expresado como porcentaje o latencia |
| **Chaos Engineering** | Disciplina de experimentación en producción para descubrir debilidades de resiliencia |
| **FinOps** | Práctica de gestión financiera cloud que combina sistemas, mejores prácticas y cultura |
| **SCP (Service Control Policy)** | Política organizacional en AWS que establece guardrails preventivos sobre cuentas |
| **Transit Gateway** | Hub central de conectividad que interconecta VPCs y redes on-premises |
| **Karpenter** | Autoscaler de nodos Kubernetes que provisiona nodos just-in-time basado en pod requirements |
| **GitOps** | Paradigma operativo donde Git es la fuente de verdad para infraestructura y configuración declarativa |
| **Bulkhead** | Patrón de aislamiento que previene que un fallo en un componente propague a otros |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
