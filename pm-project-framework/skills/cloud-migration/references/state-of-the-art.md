# State of the Art — Cloud Migration (2024-2028)

> Tendencias, herramientas emergentes y debates abiertos en el dominio de migracion cloud, modernizacion de workloads, y estrategia multi-cloud.

---

## 1. Tendencias Dominantes

### 1.1 Multi-Cloud como Realidad Operativa

- **Que esta pasando:** Multi-cloud ha dejado de ser un debate teorico para convertirse en realidad operativa. Segun Flexera State of the Cloud (2025), el 89% de las empresas tiene una estrategia multi-cloud, aunque la mayoria es "multi-cloud by accident" (adquisiciones, shadow IT, best-of-breed). El multi-cloud intencional crece impulsado por data sovereignty, negotiation leverage, y best-of-breed services.
- **Impacto en el skill:** La clasificacion 7R debe considerar el cloud target por workload, no asumir un unico provider. El wave planning puede incluir workloads migrando a diferentes clouds. Landing zone design se multiplica.
- **Herramientas clave:** Terraform/OpenTofu (IaC multi-cloud), Crossplane (K8s-native multi-cloud), Flexera One (portfolio management multi-cloud).
- **Fuentes:** Flexera (2025) "State of the Cloud Report"; Gartner (2025) "Magic Quadrant for Cloud Infrastructure"; HashiCorp (2025) "State of Cloud Strategy".

### 1.2 FinOps Integrado en Programas de Migracion

- **Que esta pasando:** FinOps ha evolucionado de practica post-migracion ("cuanto gastamos?") a componente integral del programa de migracion ("cuanto DEBERIA costar cada workload migrado?"). TCO analysis se ha sofisticado con herramientas como AWS Migration Evaluator, Azure Migrate Assessment, y Google Cloud Migration Center que proyectan costos cloud pre-migracion.
- **Impacto en el skill:** S5 (TCO Calculator) se enriquece con herramientas automatizadas de proyeccion. La clasificacion 7R incluye dimension de costo como criterio primario. Post-migracion optimization se convierte en fase formal del programa (S6).
- **Estado 2026:** El 60% de programas de migracion enterprise incluyen FinOps team desde Wave 0. El estandar FOCUS normaliza datos de facturacion entre proveedores.
- **Fuentes:** FinOps Foundation (2025) "State of FinOps Report"; FOCUS Project (2025) "v1.1 Specification"; AWS (2025) "Migration Evaluator".

### 1.3 AI-Assisted Migration

- **Que esta pasando:** La inteligencia artificial se esta integrando en multiples fases de la migracion cloud. Discovery automatizado usa ML para identificar dependencias no documentadas. Classification utiliza modelos para recomendar la estrategia 7R optima basandose en metricas de uso, complejidad tecnica y patrones historicos. Code transformation tools (como AWS Q Developer, GitHub Copilot) asisten en la modernizacion de codigo legacy.
- **Impacto en el skill:** La clasificacion 7R puede ser asistida por AI pero requiere validacion humana (el contexto de negocio no es capturado por metricas). Los cutover runbooks pueden incluir AI-driven anomaly detection para decision de rollback.
- **Herramientas clave:** AWS Q Developer (code transformation), Amazon Q Migration Hub (AI-assisted migration planning), Azure Copilot for Migration, Google Cloud Duet AI for Migration.
- **Fuentes:** AWS (2025) "AI-Assisted Migration"; Gartner (2025) "AI in Cloud Migration Programs"; McKinsey (2025) "Generative AI for Cloud Modernization".

### 1.4 Platform Engineering para Landing Zones

- **Que esta pasando:** Las landing zones estan evolucionando de configuraciones estaticas a Internal Developer Platforms (IDPs) que ofrecen self-service para equipos de migracion. En lugar de tickets para provisionar recursos cloud, los equipos de migracion consumen templates pre-aprobados via portal (Backstage, Port, Humanitec).
- **Impacto en el skill:** S4 (Landing Zone Design) se expande para incluir IDP design. La migration factory se beneficia de self-service provisioning que reduce bottlenecks en el equipo de plataforma.
- **Estado 2026:** El 40% de las organizaciones enterprise con programas de migracion activos usan algun nivel de IDP. Gartner predice 80% para 2028.
- **Fuentes:** Gartner (2025) "Top Strategic Tech Trends — Platform Engineering"; Humanitec (2025) "State of Platform Engineering Report".

### 1.5 Mainframe y Legacy Modernization Acelerada

- **Que esta pasando:** La migracion de mainframes, antes considerada un programa de 5-10 anos, se esta acelerando con herramientas especializadas. AWS Mainframe Modernization, Azure Mainframe Migration, y Micro Focus proporcionan paths desde COBOL/PL1 hacia cloud. La presion viene de costos de mainframe (MIPS pricing), escasez de talento COBOL, y reguladores que exigen modernizacion.
- **Impacto en el skill:** Edge case de "Mainframe Workloads" se vuelve caso de uso frecuente. La clasificacion 7R para mainframes tiene opciones adicionales: replatform a cloud-hosted emulation, automated refactor (COBOL a Java), o repurchase con SaaS moderno.
- **Fuentes:** AWS (2025) "Mainframe Modernization Service"; Micro Focus (2025) "Enterprise Server on Cloud"; Kyndryl (2025) "Mainframe Modernization at Scale".

---

## 2. Herramientas Emergentes (2024-2026)

### 2.1 Discovery y Assessment

| Herramienta | Proposito | Madurez | Relevancia para el skill |
|---|---|---|---|
| **AWS Migration Hub Orchestrator** | Orquestacion automatizada de pasos de migracion | GA | S5 — automatiza el migration factory workflow |
| **Amazon Q for Migration** | AI-assisted migration planning | Preview-GA | S1 — recomendaciones 7R basadas en metricas |
| **Azure Migrate (v2)** | Assessment + migracion unificados | Madura | S1-S5 — herramienta integral para migraciones Azure |
| **Google Cloud Migration Center** | Discovery + TCO + complexity scoring | GA | S1-S2 — scoring automatizado de complejidad |
| **Cloudamize** | Profiling de performance + cost projection | Madura | S2 — dependency mapping detallado |
| **Flexera One** | Portfolio management multi-cloud | Madura | S1 — rationalization del portafolio de aplicaciones |

### 2.2 Migracion y Modernizacion

| Herramienta | Proposito | Relevancia para el skill |
|---|---|---|
| **AWS Q Developer** | Code transformation (Java 8→17, .NET→Linux) | S5 — modernizacion de codigo durante refactor |
| **AWS Mainframe Modernization** | COBOL a Java, emulacion cloud | Edge case mainframe |
| **Azure App Service Migration Assistant** | .NET/Java migration a PaaS | S5 — replatform automatizado |
| **Terraform Import** | Importar infra existente a IaC | S4 — landing zone from existing resources |
| **Crossplane** | Infrastructure provisioning K8s-native | S4 — landing zone via GitOps |

### 2.3 Observabilidad y Validacion Post-Migracion

| Herramienta | Proposito | Relevancia para el skill |
|---|---|---|
| **OpenTelemetry** | Observability estandar (traces, metrics, logs) | S6 — baseline de performance post-migracion |
| **Grafana Stack** | Dashboards unificados OSS | S6 — comparacion source vs target |
| **Infracost** | Cost estimation pre-apply para Terraform | S4 — cost projection de landing zone |
| **OpenCost** | Cost allocation por workload K8s | S6 — optimizacion post-migracion |

---

## 3. Debates Abiertos en la Industria

### 3.1 Rehost Masivo vs. Modernizacion Selectiva?

- **Pro-rehost masivo:** "Get out of the datacenter first, optimize later." Velocidad maxima, riesgo de ejecucion bajo. Cloud benefits (elasticidad, DR) se obtienen sin modificar aplicaciones. Ideal para datacenter exit con deadline.
- **Pro-modernizacion selectiva:** "Rehost sin optimizar es pagar cloud prices por on-prem architecture." El 30-40% de workloads rehosted no aprovechan cloud capabilities. Los costos cloud pueden ser MAYORES que on-prem sin rightsizing.
- **Posicion del skill:** 7R assessment per workload. Rehost para quick wins y apps sin codigo fuente. Replatform para moderate benefit. Refactor solo para apps estrategicas con >5 anos de vida util. NUNCA "todo rehost" ni "todo refactor".

### 3.2 Big-Bang vs. Wave-Based Migration?

- **Pro-big-bang:** Ventana de cutover unica, sin periodo hibrido prolongado, sin dual-run costs. Mas simple desde perspectiva de networking (no DNS split-horizon).
- **Pro-wave-based:** Riesgo incremental, aprendizaje entre waves, blast radius controlado. Cada wave valida tooling y procesos. Permite ajustar throughput.
- **Posicion del skill:** Wave-based es el default para portfolios >10 apps. Big-bang solo para portfolios pequenos (<10 apps) con ventana de mantenimiento disponible. La migration factory no funciona con big-bang.

### 3.3 Cuanto Discovery es Suficiente?

- **Pro-discovery extensivo (60+ dias):** Captura patrones mensuales, batch jobs, dependencias ocultas. Reduce sorpresas en cutover. "You can't migrate what you don't understand."
- **Pro-discovery rapido (2-3 semanas):** "Perfect is the enemy of good." El discovery extensivo retrasa el programa y los findings se desactualizan. La wave piloto descubre lo que el discovery no capturo.
- **Posicion del skill:** Minimo 30 dias de discovery con herramientas automatizadas. El piloto (Wave 1) es el verdadero "discovery test" — seleccionar apps representativas que validen el discovery.

---

## 4. Casos de Exito Documentados

### 4.1 Capital One — Datacenter Exit Completo a AWS

- **Contexto:** Capital One fue la primera empresa Fortune 500 en mover 100% de sus workloads a AWS (completado 2020). Programa de 5+ anos con migration factory de alta throughput.
- **Relevancia:** Demuestra que datacenter exit completo es viable en industria regulada (banking, PCI-DSS). Landing zone enterprise con 1,000+ cuentas AWS.
- **Fuente:** Capital One Tech Blog (2024); AWS re:Invent case study.

### 4.2 GE Aviation — Migracion a Escala con Migration Factory

- **Contexto:** GE Aviation migro 500+ aplicaciones a AWS usando un modelo de migration factory con procesos estandarizados y metricas de throughput. Redujo time-to-migrate de 6 meses a 3-4 semanas por wave.
- **Relevancia:** Modelo de migration factory a escala enterprise con metricas claras de productividad.
- **Fuente:** AWS (2024) "GE Aviation Migration Case Study".

### 4.3 Gobierno de UK (Crown Commercial Service) — Migracion Multi-Cloud

- **Contexto:** El gobierno de UK migro servicios criticos a multiples cloud providers (AWS, Azure, GCP) por requirements de data sovereignty y vendor diversity. Uso Terraform como abstraction layer.
- **Relevancia:** Referencia para migraciones multi-cloud en sector publico con regulaciones estrictas.
- **Fuente:** UK Government Digital Service (2024); Crown Commercial Service Cloud Report.

---

## 5. Evolucion Esperada (2026-2028)

| Tendencia | Probabilidad | Impacto en el skill |
|---|---|---|
| **AI clasifica 7R automaticamente con >85% accuracy** | Alta | S1 se acelera pero requiere validacion humana para contexto de negocio |
| **Migration-as-a-Service (MaaS) offerings maduran** | Alta | Migration factory se puede tercerizar; el skill se enfoca en governance |
| **FinOps como requisito previo a migracion** | Alta | S5 (TCO) se vuelve gate obligatorio antes de iniciar Wave 0 |
| **Mainframe migration se acelera 3x con AI code transform** | Media-Alta | Edge case de mainframe se normaliza como caso de uso principal |
| **Landing zones se consumen como IDP via platform engineering** | Media-Alta | S4 evoluciona a "seleccionar template" mas que "disenar landing zone" |
| **Quantum-safe encryption requerida en landing zones** | Baja (2028+) | S4 incluye post-quantum encryption como requisito de security baseline |

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
