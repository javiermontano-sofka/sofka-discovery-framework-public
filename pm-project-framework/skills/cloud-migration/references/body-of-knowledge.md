# Body of Knowledge — Cloud Migration

**Comunidad MetodologIA ©** | Autor: Javier Montaño | Ultima actualizacion: marzo 2026

---

## 1. Fundamentos Conceptuales

La migracion cloud es el proceso de mover workloads, datos e infraestructura desde entornos on-premises o legacy hacia plataformas cloud. No es un evento unico — es un programa que requiere assessment, clasificacion, planificacion por oleadas, ejecucion controlada y validacion post-migracion.

El principio rector es **migrar con estrategia 7R, nunca migrar "todo igual"**. Cada workload tiene un contexto unico — dependencias, compliance, criticidad de negocio, deuda tecnica — que determina su estrategia optima. Mover problemas del datacenter a la nube solo produce problemas mas caros.

**Propiedades fundamentales de un programa de migracion exitoso:**
- **Clasificacion rigurosa**: cada workload clasificado con 7R y justificacion documentada
- **Wave planning**: migracion incremental con piloto, aprendizaje y escalamiento progresivo
- **Cutover rehearsal**: nunca se ejecuta un cutover en produccion sin ensayo previo
- **Rollback definido**: criterios de rollback explicitos con procedimiento probado
- **Retire agresivo**: cada workload que no migra es costo evitado

---

## 2. Marcos de Referencia Principales

### AWS Cloud Adoption Framework (AWS CAF)

Marco de AWS que organiza la adopcion cloud en 6 perspectivas: Business, People, Governance, Platform, Security, Operations. Proporciona guidance para migration readiness assessment, landing zone design, y migration execution. Incluye herramientas especificas: AWS Migration Hub, Application Discovery Service, Migration Evaluator.

### Azure Cloud Adoption Framework (Azure CAF)

Marco de Microsoft que define fases de adopcion: Strategy, Plan, Ready, Adopt (Migrate/Innovate), Govern, Manage. Incluye Azure Migrate como herramienta central de discovery y migracion. Enfasis en landing zones con Azure Landing Zone Accelerator y governance con Azure Policy.

### Google Cloud Adoption Framework

Marco de Google que evalua la madurez de adopcion cloud en 4 temas (Learn, Lead, Scale, Secure) y 3 fases (Tactical, Strategic, Transformational). Google Cloud Migration Center proporciona discovery y assessment automatizado con scoring de complejidad.

### Gartner 7R Framework

Originalmente 5R (Gartner, 2010), expandido a 7R para cubrir todas las opciones de disposicion de workloads:
1. **Rehost**: mover as-is (lift-and-shift)
2. **Replatform**: ajustes menores (lift-and-reshape)
3. **Refactor**: redisenar para cloud-native
4. **Repurchase**: reemplazar con SaaS
5. **Retire**: decomisionar
6. **Retain**: mantener on-premises
7. **Relocate**: mover a nivel de hypervisor

### TOGAF Migration Planning

TOGAF (The Open Group Architecture Framework) incluye la fase F (Migration Planning) que define como crear paquetes de trabajo de migracion, analizar dependencias, y secuenciar la implementacion basandose en business value y technical feasibility.

---

## 3. Obras Seminales y Literatura Fundamental

| Obra | Autores | Aportacion |
|------|---------|-----------|
| *Cloud Strategy* | Gregor Hohpe (AWS) | Decision frameworks para estrategia cloud corporativa |
| *Reaching Cloud Velocity* | Jonathan Allen, Thomas Blood (AWS) | Metodologia de migracion a escala empresarial |
| *The Cloud Adoption Playbook* | Moe Abdula et al. (IBM) | Framework para adopcion cloud con change management |
| *Cloud Migration: A Practical Guide* | Corey Sanders (Microsoft) | Guia practica de migracion con Azure CAF |
| *AWS Prescriptive Guidance: Migration* | AWS | Patrones de migracion por tipo de workload |
| *Migrating to the Cloud* | Srinivasan, Alef | Oracle-to-cloud migration patterns |
| *Enterprise Cloud Strategy* | Barry Briggs (Microsoft) | Estrategia cloud desde perspectiva de CTO |

---

## 4. Metodologias y Practicas

### Migration Factory Model

Modelo operativo que industrializa la migracion: roles definidos (factory manager, migration architect, migration engineer, test lead), procesos repetibles, tooling estandarizado, y metricas de throughput (apps/week). Permite escalar de 5-10 apps/month en fase piloto a 15-25 apps/month en steady state.

### Wave Planning

Metodologia de secuenciacion que agrupa workloads en oleadas basandose en dependencias, riesgo, y complejidad. Wave 0 (foundation), Wave 1 (pilot), Waves 2-N (production), Final Wave (high-risk). Cada wave tiene go/no-go gate, retrospectiva, y buffer para ajustes.

### Cutover Rehearsal

Practica de ejecutar el runbook de cutover completo en un entorno no-productivo antes de ejecutarlo en produccion. Incluye: migracion de datos, switch de DNS, smoke testing, y rollback. Mide tiempos reales vs. planificados. Obligatorio para todo cutover de produccion.

### Discovery-Driven Migration

Practica de ejecutar herramientas de descubrimiento automatizado (agentes o agentless) durante minimo 30 dias antes de planificar la migracion. Captura dependencias reales (no documentadas), patrones de uso (batch mensual, picos estacionales), y baseline de performance.

### TCO Analysis

Metodologia de comparacion de Total Cost of Ownership entre on-premises y cloud. Incluye costos visibles (compute, storage, licencias) e invisibles (facilities, personal, oportunidad). El break-even tipico es 18-36 meses. Debe incluir costos de migracion (dual-run, tooling, training) como inversion unica.

---

## 5. Herramientas y Tecnologias Clave

### Discovery y Assessment

| Herramienta | Proveedor | Metodo | Alcance |
|-------------|-----------|--------|---------|
| AWS Application Discovery Service | AWS | Agente o agentless | Config, utilizacion, conexiones de red |
| AWS Migration Hub | AWS | Agregador | Vista unificada de discovery + migracion |
| Azure Migrate | Azure | Agente o appliance | Servidores, bases de datos, web apps, VDI |
| Google Cloud Migration Center | GCP | Agente o API import | Technical fit, TCO, scoring de complejidad |
| Cloudamize | Multi-cloud | Agente | Performance profiling, right-sizing, dependency mapping |
| Flexera One | Multi-cloud | CMDB integration | License optimization, portfolio rationalization |

### Migracion de Servidores

| Herramienta | Proveedor | Tipo |
|-------------|-----------|------|
| AWS Application Migration Service (MGN) | AWS | Block-level replication |
| Azure Migrate / Site Recovery | Azure | VM replication |
| GCP Migrate for Compute Engine | GCP | VM migration |
| RiverMeadow | Multi-cloud | Cloud migration platform |

### Migracion de Bases de Datos

| Herramienta | Proveedor | Tipo |
|-------------|-----------|------|
| AWS Database Migration Service (DMS) | AWS | Continuous replication |
| AWS Schema Conversion Tool (SCT) | AWS | Heterogeneous schema conversion |
| Azure Database Migration Service | Azure | Online and offline migration |
| Google Database Migration Service | GCP | MySQL, PostgreSQL, SQL Server |

---

## 6. Patrones Arquitectonicos Fundamentales

### Patrones de Migracion por 7R

- **Rehost (Lift-and-Shift)**: copiar VM as-is a la nube. Minimo riesgo, minima optimizacion. Usar cuando: deadline de datacenter exit, sin codigo fuente, quick win.
- **Replatform (Lift-and-Reshape)**: ajustes menores para aprovechar managed services (ej: DB a RDS, app server a container runtime). Moderado esfuerzo, moderado beneficio.
- **Refactor (Re-architect)**: redisenar para cloud-native (microservicios, serverless, event-driven). Maximo beneficio, maximo esfuerzo. Solo para apps estrategicas con >5 anos de vida util.
- **Repurchase (Drop-and-Shop)**: reemplazar con SaaS (ej: on-prem email a Office 365, on-prem CRM a Salesforce). Evaluar fit funcional y costo total de SaaS.
- **Retire**: decomisionar aplicaciones no usadas, redundantes, o reemplazadas. Validar con metricas de uso reales (no solo inventario).
- **Retain**: mantener on-premises cuando: compliance lo exige, inversion reciente, nearing end-of-life.
- **Relocate**: mover VMs a nivel de hypervisor (VMware Cloud on AWS, Azure VMware Solution). Rapido para datacenter exit.

### Patrones de Datos

- **Big Bang Data Migration**: transferir todo en una ventana de mantenimiento. Riesgo alto, simple.
- **Continuous Replication**: replicar continuamente durante semanas, cutover final es solo un switch. Riesgo bajo.
- **Dual-Write**: escribir en source y target simultaneamente durante transicion. Complejo pero zero-downtime.
- **ETL Replay**: reconstruir datos en target via ETL historico. Util cuando se cambia schema.

### Patrones de Landing Zone

- **Single-account**: todo en una cuenta. Solo para PoC o startups.
- **Multi-account**: cuentas separadas por entorno, equipo, o workload. Estandar para enterprise.
- **Hub-and-spoke**: cuenta de networking central con cuentas de workload como spokes. Estandar AWS/Azure.

---

## 7. Glosario de Terminos Clave

| Termino | Definicion |
|---------|-----------|
| **7R Framework** | Modelo de clasificacion de workloads: Rehost, Replatform, Refactor, Repurchase, Retire, Retain, Relocate |
| **Landing Zone** | Entorno cloud pre-configurado con cuentas, redes, seguridad y governance listo para recibir workloads |
| **Wave Planning** | Secuenciacion de migraciones en oleadas agrupadas por dependencia, riesgo y complejidad |
| **Cutover** | Momento en que el trafico de produccion se redirige del entorno source al target cloud |
| **Rollback** | Reversion al entorno source cuando el cutover falla o no cumple criterios de aceptacion |
| **Migration Factory** | Modelo operativo industrializado para ejecutar migraciones a escala con roles y procesos estandarizados |
| **TCO (Total Cost of Ownership)** | Costo total de poseer y operar un workload, incluyendo costos visibles e invisibles |
| **Data Gravity** | Tendencia de los datos a atraer aplicaciones y servicios hacia donde residen, dificultando su movimiento |
| **Parallel Run** | Periodo donde source y target operan simultaneamente para validar correctitud antes de decomisionar source |
| **Dual-Run Cost** | Costo de operar ambos entornos (source + target) durante el periodo de transicion |
| **RPO (Recovery Point Objective)** | Cantidad maxima de datos que se puede perder, medida en tiempo |
| **RTO (Recovery Time Objective)** | Tiempo maximo para restaurar el servicio despues de una interrupcion |
| **Direct Connect / ExpressRoute** | Conexion de red dedicada entre datacenter on-prem y cloud provider |
| **SCP (Service Control Policy)** | Politica de control a nivel de organizacion AWS que restringe acciones en cuentas hijas |
| **CMDB** | Configuration Management Database — inventario de activos de IT y sus relaciones |

---

## 8. Intersecciones y Referencias Cruzadas

| Skill Relacionada | Interseccion |
|------------------|-------------|
| `cloud-native-architecture` | Los workloads clasificados como Refactor requieren diseno cloud-native completo |
| `infrastructure-architecture` | La landing zone define la infraestructura base que recibe los workloads migrados |
| `asis-analysis` | El analysis AS-IS provee el inventario y estado actual que alimenta la clasificacion 7R |
| `enterprise-architecture` | La estrategia de portafolio empresarial determina prioridades de migracion |
| `finops` | TCO analysis y optimizacion post-migracion son responsabilidad compartida |
| `security-architecture` | La security baseline de la landing zone y compliance durante migracion |

---

## 9. Lecturas Recomendadas y Recursos Continuos

- **AWS Prescriptive Guidance** (docs.aws.amazon.com/prescriptive-guidance) — Patrones de migracion por tipo de workload
- **Azure Cloud Adoption Framework** (learn.microsoft.com/azure/cloud-adoption-framework) — Guia completa de adopcion y migracion
- **Google Cloud Migration Center** (cloud.google.com/migration-center) — Herramientas y assessment automatizado
- **Gartner Magic Quadrant for Cloud Infrastructure** — Evaluacion anual de proveedores cloud
- **FinOps Foundation** (finops.org) — Practicas de optimizacion financiera post-migracion

---

*© Comunidad MetodologIA. Uso interno — Equipo Discovery.*
