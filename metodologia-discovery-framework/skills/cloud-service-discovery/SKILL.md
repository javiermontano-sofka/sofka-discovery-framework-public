---
name: cloud-service-discovery
description: >
  Cloud service discovery -- cloud readiness assessment, DevOps maturity (DORA), cloud operations model,
  FinOps assessment, cloud security posture, and cloud services roadmap.
  Use when the user asks to "assess cloud readiness", "evaluate DevOps maturity", "plan cloud operations",
  "assess FinOps maturity", "evaluate cloud security posture", "create cloud services roadmap",
  or mentions DORA metrics, SRE practices, FinOps, cloud operating model, cloud security baseline,
  cloud readiness, or cloud services strategy.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Cloud Service Discovery -- Readiness, Operations & Services Roadmap

Genera un analisis integral de servicios cloud que cubre cloud readiness assessment, DevOps maturity (DORA), cloud operations model, FinOps assessment, cloud security posture, y cloud services roadmap. Disenado para organizaciones que buscan evaluar, adoptar o madurar su estrategia de servicios cloud con un partner de consultoria.

## Principio Rector

> *La nube no es un destino — es un modelo operativo. Adoptar cloud sin transformar la operacion es pagar mas por lo mismo.*

1. **Madurez operativa antes que migracion masiva.** La capacidad de operar en cloud (observabilidad, respuesta a incidentes, despliegue continuo) determina el exito mas que la cantidad de workloads migrados. Sin madurez operativa, la nube amplifica los problemas existentes.
2. **DORA como brujula, no como meta.** Las metricas DORA (deployment frequency, lead time, change failure rate, MTTR) son indicadores de capacidad organizacional. Mejorarlas requiere cambios en cultura, procesos y herramientas — no solo automatizacion.
3. **FinOps es disciplina, no recorte de costos.** FinOps no busca gastar menos — busca gastar mejor. La visibilidad del costo por servicio, equipo y feature permite decisiones informadas, no austeridad ciega.

## Inputs

- `$1` — Project or client name used throughout all output artifacts

Parse from `$ARGUMENTS`.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para assessments de madurez y metricas, HITL para decisiones de modelo operativo y roadmap.
  - **desatendido**: Cero interrupciones. Analisis completo automatizado. Supuestos documentados.
  - **supervisado**: Autonomo con checkpoint al completar cada seccion.
  - **paso-a-paso**: Confirma antes de cada seccion del analisis.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 + S2 + S6 only) | `tecnica` (full 6 sections, default)

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/
```

## When to Use

- La organizacion busca evaluar su readiness para adoptar o expandir servicios cloud
- Se requiere medir la madurez DevOps del equipo usando metricas DORA
- Es necesario disenar o redisenar el modelo operativo cloud (Cloud Operating Model)
- Se necesita un assessment de madurez FinOps para optimizar costos cloud
- Se busca evaluar y mejorar la postura de seguridad en cloud
- Se requiere un roadmap integral de servicios cloud con fases y prioridades

## When NOT to Use

- Migracion de workloads especificos (7R, wave planning, cutover) → use cloud-migration
- Diseno de arquitectura cloud-native para aplicaciones nuevas → use cloud-native-architecture
- Diseno de infraestructura (VPC, compute, storage) → use infrastructure-architecture
- Assessment de estado actual sin intencion de adopcion cloud → use asis-analysis

## Assumptions

- La organizacion tiene alguna presencia en cloud o ha iniciado evaluacion de proveedores cloud
- Existen equipos de desarrollo y operaciones (o un equipo combinado) que operaran los servicios cloud
- Los stakeholders tienen claridad sobre los drivers de negocio para la adopcion cloud (agilidad, costo, escalabilidad, innovacion)
- Se puede acceder a metricas actuales de deployment, incidentes y costos (o se pueden estimar a partir de entrevistas)
- El proveedor cloud principal esta seleccionado o en evaluacion final (AWS, Azure, GCP, multi-cloud)

## Limits

- No reemplaza el diseno detallado de landing zones o arquitectura de infraestructura
- No incluye migracion operativa de workloads (wave planning, cutover runbooks)
- No define precios — solo magnitudes de esfuerzo y drivers de costo
- No cubre seleccion de proveedor cloud (RFP, scoring de vendors)
- El assessment de seguridad es postura general, no penetration testing ni auditoria de compliance formal

## 6-Section Framework

### S1: Cloud Readiness Assessment

Evaluacion multidimensional de la preparacion organizacional para operar en cloud.

**Dimensiones del assessment:**

| Dimension | Que evalua | Indicadores clave |
|---|---|---|
| **Estrategia y liderazgo** | Claridad de vision cloud, sponsorship ejecutivo, alineacion con objetivos de negocio | Cloud strategy documentada, executive sponsor activo, business cases aprobados |
| **Personas y skills** | Capacidades cloud del equipo, gaps de skills, cultura DevOps | Certificaciones cloud, experiencia IaC, disposicion a on-call/SRE |
| **Procesos** | Madurez de procesos de desarrollo, deployment, y operaciones | CI/CD pipelines, IaC adoption, change management, incident response |
| **Tecnologia** | Estado del stack tecnologico, portabilidad, deuda tecnica | Containerizacion, API-first design, observabilidad, test automation |
| **Gobernanza** | Politicas de seguridad, compliance, gestion de costos, risk management | Politicas de seguridad cloud, frameworks de compliance, controles de costo |
| **Datos** | Clasificacion de datos, residencia, estrategia de backup y DR | Data classification, data residency requirements, RPO/RTO definidos |

**Scoring de madurez (1-5):**

| Nivel | Nombre | Descripcion |
|---|---|---|
| 1 | Inicial | Sin estrategia cloud. Experimentacion aislada. Sin gobernanza. |
| 2 | Exploratorio | Pilotos en curso. Skills basicos. Procesos manuales. |
| 3 | Definido | Estrategia documentada. Equipo con skills cloud. CI/CD parcial. Landing zone basica. |
| 4 | Gestionado | Cloud Operating Model establecido. Metricas activas. FinOps practicado. Seguridad automatizada. |
| 5 | Optimizado | Cloud-first culture. Innovacion continua. FinOps maduro. Seguridad shift-left. |

**Output:** Scorecard de readiness con score por dimension, nivel general, gaps criticos, y recomendaciones priorizadas.

### S2: DevOps Maturity Model (DORA)

Assessment de madurez DevOps basado en las metricas DORA (Accelerate — Forsgren, Humble & Kim).

**Metricas DORA:**

| Metrica | Elite | High | Medium | Low |
|---|---|---|---|---|
| **Deployment Frequency** | On-demand (multiple/dia) | 1/dia a 1/semana | 1/semana a 1/mes | 1/mes a 1/6 meses |
| **Lead Time for Changes** | <1 hora | 1 dia a 1 semana | 1 semana a 1 mes | 1 mes a 6 meses |
| **Change Failure Rate** | 0-15% | 16-30% | 16-30% | 46-60% |
| **Time to Restore (MTTR)** | <1 hora | <1 dia | 1 dia a 1 semana | >6 meses |

**Dimensiones adicionales del assessment DevOps:**

- **Culture:** Colaboracion Dev-Ops, blameless postmortems, experimentacion, aprendizaje continuo
- **Automation:** CI/CD maturity, IaC coverage, test automation, deployment automation
- **Lean practices:** WIP limits, value stream mapping, batch size reduction, feedback loops
- **Measurement:** Metricas recolectadas, dashboards operativos, data-driven decisions

**SRE Practices Assessment:**

| Practica SRE | Nivel actual | Target | Gap |
|---|---|---|---|
| SLO/SLI definition | | | |
| Error budgets | | | |
| Toil measurement & reduction | | | |
| Incident management | | | |
| Blameless postmortems | | | |
| Capacity planning | | | |
| Release engineering | | | |

**Output:** DORA scorecard con clasificacion (Elite/High/Medium/Low), SRE maturity assessment, gap analysis, y plan de mejora priorizado.

### S3: Cloud Operations Model

Diseno del modelo operativo para servicios cloud.

**Componentes del Cloud Operating Model:**

- **Organizational design:** Estructura de equipos cloud (Cloud Center of Excellence, Platform Engineering, SRE, Application Teams)
- **Shared responsibility model:** Que gestiona el proveedor cloud, que gestiona el equipo de plataforma, que gestiona el equipo de aplicacion
- **Service management:** ITSM adaptado a cloud (incident, problem, change, request management)
- **Automation strategy:** IaC (Terraform, Pulumi, CloudFormation), GitOps, policy-as-code, compliance-as-code
- **Observability stack:** Monitoring, logging, tracing, alerting — pilares de observabilidad (metricas, logs, traces)

**Team Topologies para Cloud (Skelton & Pais):**

| Topology | Rol en cloud | Ejemplo |
|---|---|---|
| **Platform team** | Provee la plataforma cloud interna (landing zones, pipelines, servicios compartidos) | Cloud Platform Engineering |
| **Stream-aligned team** | Consume la plataforma para entregar valor de negocio | Product/Feature teams |
| **Enabling team** | Acelera la adopcion cloud en stream-aligned teams | Cloud Enablement, DevOps coaching |
| **Complicated-subsystem** | Gestiona componentes especializados (networking, seguridad, datos) | Network Engineering, Data Platform |

**Interaction Modes:**

- **Collaboration:** Platform + Stream-aligned durante adopcion inicial
- **X-as-a-Service:** Platform provee servicios self-service a Stream-aligned teams maduros
- **Facilitating:** Enabling team asiste temporalmente a teams en transicion

**Runbook & playbook library:** Catalogo de runbooks operativos (incident response, scaling, DR failover, security incident, cost anomaly).

**Output:** Cloud Operating Model document con organizational design, shared responsibility matrix, automation strategy, y observability architecture.

### S4: FinOps Assessment

Evaluacion de madurez FinOps basada en el FinOps Framework (FinOps Foundation).

**Fases FinOps:**

| Fase | Objetivo | Actividades clave |
|---|---|---|
| **Inform** | Visibilidad de costos | Tagging, cost allocation, dashboards, showback/chargeback |
| **Optimize** | Reduccion de desperdicio | Right-sizing, reserved instances, savings plans, spot, storage tiering |
| **Operate** | Gobernanza continua | Budgets, alertas, anomaly detection, unit economics, cost per transaction |

**FinOps Maturity Levels:**

| Nivel | Nombre | Indicadores |
|---|---|---|
| **Crawl** | Basico | Visibilidad parcial. Sin tagging. Alertas manuales. Sin accountability. |
| **Walk** | Intermedio | Tagging >80%. Showback activo. Right-sizing trimestral. Presupuestos por equipo. |
| **Run** | Avanzado | Chargeback automatizado. Unit economics tracked. Anomaly detection ML. Forecasting preciso. FinOps como cultura. |

**Assessment dimensions:**

- **Cost visibility:** Nivel de granularidad (cuenta, servicio, equipo, feature, transaccion)
- **Tagging compliance:** Porcentaje de recursos con tags obligatorios (owner, environment, cost-center, project)
- **Optimization practices:** Right-sizing cadence, RI/SP coverage, waste identification
- **Accountability:** Quien es responsable del costo, como se reporta, como se decide
- **Forecasting:** Precision del forecast vs actual (target: +-10%)
- **Anomaly detection:** Alertas configuradas, tiempo de respuesta a anomalias

**Unit Economics:**

- Cost per transaction, cost per user, cost per API call, cost per GB processed
- Correlacion entre costo cloud y metricas de negocio (revenue, users, transactions)
- Trending: costo unitario debe decrecer o estabilizarse a medida que el negocio escala

**Output:** FinOps maturity scorecard, optimization opportunities con magnitudes estimadas, y FinOps operating model recomendado.

### S5: Cloud Security Posture

Evaluacion de la postura de seguridad cloud.

**Dominios de seguridad cloud:**

| Dominio | Que evalua | Controles clave |
|---|---|---|
| **Identity & Access** | IAM, MFA, least privilege, federated identity | SSO/SAML, role-based access, service accounts, privileged access management |
| **Network security** | Segmentacion, perimetro, conectividad | Security groups, NACLs, WAF, DDoS protection, private endpoints |
| **Data protection** | Cifrado, clasificacion, residencia | Encryption at rest/transit, key management, data classification, DLP |
| **Workload protection** | Seguridad de compute, containers, serverless | Vulnerability scanning, runtime protection, image scanning, secrets management |
| **Logging & monitoring** | Auditoria, deteccion de amenazas | CloudTrail/Activity Log, SIEM integration, threat detection, anomaly alerting |
| **Compliance** | Regulaciones, frameworks, certificaciones | CIS Benchmarks, SOC2, ISO 27001, GDPR, PCI-DSS, HIPAA |
| **Incident response** | Capacidad de respuesta a incidentes de seguridad | IR playbooks, forensics capability, communication plan, post-incident review |

**Cloud Security Maturity (1-5):**

| Nivel | Nombre | Descripcion |
|---|---|---|
| 1 | Reactivo | Sin controles formales. Seguridad ad-hoc. Sin visibilidad. |
| 2 | Basico | Controles minimos. MFA parcial. Logging basico. Sin automatizacion. |
| 3 | Definido | Politicas documentadas. IAM estructurado. Encryption por defecto. Scanning regular. |
| 4 | Proactivo | Security-as-code. Automated compliance checks. Threat detection activo. IR playbooks testeados. |
| 5 | Anticipatorio | Zero-trust implementado. Shift-left security. Automated remediation. Red team exercises regulares. |

**Shared Responsibility Clarity:**

- Documentar explicitamente que protege el proveedor cloud (infraestructura fisica, hypervisor, red global)
- Documentar que protege la organizacion (datos, configuracion IAM, network rules, aplicaciones, OS patching)
- Identificar zonas grises (managed services donde la responsabilidad es compartida)

**Output:** Cloud security posture scorecard, gap analysis por dominio, y plan de remediacion priorizado por riesgo.

### S6: Cloud Services Roadmap

Plan de adopcion y maduracion de servicios cloud faseado.

**Phased roadmap:**

- **Fase 1 — Foundation (meses 1-3):** Cloud readiness gaps criticos, landing zone basica, observabilidad minima, equipo core entrenado, FinOps Crawl, seguridad basica. Quick wins identificados en S1.
- **Fase 2 — Operate (meses 4-6):** Cloud Operating Model implementado, DORA metrics tracked, IaC >80%, CI/CD pipelines maduros, FinOps Walk, seguridad definida. Primeros workloads en produccion.
- **Fase 3 — Optimize (meses 7-12):** SRE practices implementadas, FinOps Run, security-as-code, automated compliance, unit economics tracked. Capacidad operativa demostrada.
- **Fase 4 — Innovate (meses 12+):** Cloud-native services adoption, serverless, ML/AI cloud services, multi-region, DR automatizado. Innovacion habilitada por la plataforma.

**Dependencies entre secciones:**

```
S1 (Readiness) → informa gaps → S3 (Operating Model) + S5 (Security)
S2 (DORA) → informa madurez → S3 (Operating Model)
S4 (FinOps) → informa gobernanza de costos → S3 (Operating Model)
S3 + S4 + S5 → alimentan → S6 (Roadmap)
```

**Success metrics por fase:**

| Fase | Metric | Target |
|---|---|---|
| Foundation | Cloud readiness score | >3.0 en todas las dimensiones |
| Operate | DORA classification | Medium o superior en las 4 metricas |
| Optimize | FinOps maturity | Walk en todas las dimensiones |
| Innovate | Cloud-native adoption | >50% de nuevos workloads son cloud-native |

**Contingency planning:**

- Skills gap mas profundo de lo esperado: extender Fase 1 con training intensivo o augmentation temporal
- Resistencia al cambio: introducir enabling team para coaching y acompanamiento
- Costos cloud superiores al forecast: acelerar FinOps Walk con foco en right-sizing y waste elimination
- Incidentes de seguridad: priorizar S5 independientemente de la fase del roadmap

**Output:** Roadmap visual con fases, milestones, dependencies, success metrics, y contingency plan.

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Cloud Center of Excellence** | Gobernanza centralizada, estandares, economia de escala | Bottleneck potencial, velocidad reducida para equipos maduros | Organizaciones en Fase 1-2, multiples equipos adoptando cloud |
| **Platform Engineering** | Self-service, velocidad de equipos, estandarizacion | Inversion significativa en equipo de plataforma | Organizaciones en Fase 3+, >5 equipos de desarrollo |
| **FinOps centralizado** | Visibilidad total, negociacion consolidada (RI/SP) | Menos ownership de costos por equipo | Organizaciones con gasto cloud >$100K/mes |
| **FinOps federado** | Ownership de costos por equipo, accountability directa | Requiere madurez FinOps en cada equipo | Equipos maduros (Walk/Run), cultura DevOps establecida |
| **Multi-cloud** | Evita vendor lock-in, best-of-breed | Complejidad operativa, skills diversificados, costo de abstraccion | Requisitos regulatorios, M&A, workloads con ventaja clara en un provider |
| **Single cloud** | Simplicidad operativa, deep integration, skills focalizados | Vendor dependency, riesgo de pricing | Mayoria de organizaciones, especialmente en fases tempranas |

## Edge Cases

**Organizacion sin experiencia cloud (greenfield cloud):**
Comenzar con un programa de enablement intensivo (4-6 semanas). Certificaciones cloud como baseline. Piloto con workload no critico. El Cloud Operating Model se construye incrementalmente, no se disena completo de antemano.

**Multi-cloud por adquisicion (M&A):**
Cada entidad adquirida trae su propio cloud footprint. Priorizar visibilidad (FinOps Inform) antes de consolidacion. Estandarizar gobernanza y seguridad primero, luego evaluar consolidacion de workloads.

**Equipo de operaciones resistente al cambio:**
La transicion de operaciones tradicionales (ITIL-heavy) a SRE/DevOps requiere change management explicito. Introducir gradualmente: blameless postmortems primero, luego SLOs, luego error budgets. No imponer — demostrar valor.

**Costos cloud fuera de control:**
Sintoma de madurez FinOps Crawl o inferior. Accion inmediata: identificar top 10 cost drivers, eliminar recursos huerfanos, right-size instancias sobredimensionadas. Quick wins antes de estrategia completa.

**Regulaciones de data residency:**
Limita regiones cloud disponibles. Puede eliminar opciones de multi-region o DR. Documentar constraints legales antes del assessment de readiness. Validar con legal y compliance.

## Validation Gate

- [ ] Cloud readiness assessment cubre las 6 dimensiones con scoring documentado
- [ ] DORA metrics medidas o estimadas con clasificacion (Elite/High/Medium/Low)
- [ ] SRE practices assessment completo con gaps identificados
- [ ] Cloud Operating Model alineado con Team Topologies (Skelton & Pais)
- [ ] FinOps maturity evaluada con nivel (Crawl/Walk/Run) por dimension
- [ ] Unit economics definidos (cost per transaction, cost per user, o equivalente)
- [ ] Cloud security posture evaluada en los 7 dominios con scoring
- [ ] Shared responsibility model documentado explicitamente
- [ ] Roadmap faseado con success metrics por fase
- [ ] Dependencies entre secciones explicitadas
- [ ] Contingency plan para los 4 riesgos principales documentado

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | Yes | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML. Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `Cloud_Service_Discovery_{project}.md` — Cloud readiness scorecard, DORA assessment, Cloud Operating Model, FinOps maturity, cloud security posture, and phased cloud services roadmap.

**Diagramas incluidos:**
- Cloud readiness radar chart: score por dimension
- DORA metrics dashboard: current vs target por metrica
- Cloud Operating Model: team topologies y interaction modes
- FinOps maturity progression: Crawl → Walk → Run por dimension
- Cloud services roadmap: Gantt-style phased plan con milestones

---
**Comunidad MetodologIA** | **Licencia:** GPL-3.0 | **Ultima actualizacion:** 14 de marzo de 2026
