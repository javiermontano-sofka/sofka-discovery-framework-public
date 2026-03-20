# Body of Knowledge — Cloud-Native Architecture

**Comunidad MetodologIA ©** | Autor: Javier Montaño | Última actualización: marzo 2026

---

## 1. Fundamentos Conceptuales

La arquitectura cloud-native es el conjunto de prácticas, patrones y tecnologías que permiten diseñar, construir y operar aplicaciones que explotan las propiedades intrínsecas de las plataformas cloud: elasticidad automática, resiliencia distribuida, observabilidad integrada y optimización continua de costos.

El principio rector es **diseñar para la nube, no mover a la nube**. Una aplicación cloud-native no es simplemente una aplicación legacy ejecutada en una VM cloud — es una aplicación construida con las propiedades de la nube como atributos de calidad de primera clase.

**Propiedades fundamentales:**
- **Elasticidad**: escalar horizontalmente en segundos, no en horas
- **Resiliencia**: fallar de forma aislada, recuperarse automáticamente
- **Observabilidad**: métricas, trazas y logs como ciudadanos de primera clase
- **Automatización**: toda operación reproducible es candidata a automatización
- **Optimización continua**: el costo es un atributo de calidad medible y gestionable

---

## 2. Marcos de Referencia Principales

### 12-Factor App (Heroku, 2012)
Manifiesto de 12 principios para aplicaciones modernas distribuidas. Cubre desde la gestión de dependencias hasta el tratamiento de logs como streams. Sigue siendo la base metodológica para evaluar preparación cloud-native de aplicaciones existentes.

### CNCF Cloud-Native Definition
La Cloud Native Computing Foundation (CNCF) define cloud-native como el uso de contenedores, service meshes, microservicios, infraestructura inmutable y APIs declarativas. El [CNCF Landscape](https://landscape.cncf.io/) mapea más de 1,200 proyectos organizados en capas.

### Well-Architected Frameworks
Cada proveedor cloud mayor publica su propio marco de buenas prácticas:
- **AWS Well-Architected Framework**: 6 pilares (Excelencia Operacional, Seguridad, Confiabilidad, Eficiencia de Rendimiento, Optimización de Costos, Sostenibilidad)
- **Azure Well-Architected Framework**: alineado con los mismos pilares, extendido con patrones Azure-nativos
- **Google Cloud Architecture Framework**: énfasis en confiabilidad y SRE

### FinOps Framework (FinOps Foundation)
Marco para la gestión financiera del cloud. Define tres fases iterativas: Informar, Optimizar, Operar. El estándar FOCUS normaliza datos de facturación entre proveedores.

---

## 3. Obras Seminales y Literatura Fundamental

| Obra | Autores | Aportación |
|------|---------|-----------|
| *The Twelve-Factor App* | Adam Wiggins (Heroku) | Metodología para apps portables y resilientes |
| *Building Microservices* | Sam Newman | Patrones de descomposición y operación de microservicios |
| *Production Kubernetes* | Josh Rosso et al. | Operaciones Kubernetes en entornos reales |
| *Cloud Native Patterns* | Cornelia Davis (VMware) | Catálogo de patrones para apps cloud-native |
| *Site Reliability Engineering* | Niall Richard Murphy et al. (Google) | SLOs, SLIs, error budgets como práctica operacional |
| *Kubernetes Patterns* | Bilgin Ibryam, Roland Huß (Red Hat) | Patrones de diseño específicos para workloads K8s |
| *Cloud FinOps* | J.R. Storment, Mike Fuller | Prácticas de optimización financiera en cloud |
| *Software Architecture: The Hard Parts* | Neal Ford et al. | Decisiones de arquitectura distribuida con trade-offs |

---

## 4. Metodologías y Prácticas

### GitOps
Metodología donde el estado deseado de la infraestructura y los workloads se almacena en Git como única fuente de verdad. Herramientas: ArgoCD (modelo pull, multi-cluster), Flux CD (Kubernetes-native, progressive delivery). El operador GitOps reconcilia continuamente el estado real con el declarado.

### SRE (Site Reliability Engineering)
Disciplina que aplica principios de ingeniería de software a la operación de sistemas. Conceptos clave: SLO (Service Level Objectives), SLI (Service Level Indicators), error budget, toil reduction, blameless post-mortems.

### FinOps
Práctica organizacional que une finanzas, ingeniería y negocio para optimizar el valor del cloud. No es solo reducción de costos — es maximizar el valor entregado por cada dólar de gasto en cloud.

### Platform Engineering
Disciplina emergente que construye plataformas internas (Internal Developer Platforms) para reducir la carga cognitiva de los equipos de desarrollo. Herramientas representativas: Backstage (Spotify), Kratix, Port.

### Progressive Delivery
Extensión de CI/CD que permite desplegar gradualmente nuevas versiones controlando el riesgo: canary releases, feature flags, A/B testing, traffic shadowing.

---

## 5. Herramientas y Tecnologías Clave

### Orquestación
| Herramienta | Rol | Madurez |
|-------------|-----|---------|
| Kubernetes | Estándar de orquestación de contenedores | GA, producción masiva |
| Helm | Gestor de paquetes Kubernetes | GA estándar |
| Karpenter | Autoscaling de nodos EKS (AWS) | GA, producción |
| KEDA | Autoscaling por eventos (Kubernetes Event-Driven Autoscaler) | GA, CNCF Graduated |
| ArgoCD | GitOps — modelo pull, UI, multi-cluster | GA, CNCF Graduated |

### Service Mesh y Networking
| Herramienta | Rol | Diferenciador |
|-------------|-----|--------------|
| Cilium | CNI + Mesh + Observabilidad (eBPF) | Sin sidecar para L3/L4, Hubble para network flows |
| Istio Ambient | Service mesh sin sidecar (ztunnel + waypoint) | 90% menos overhead que modo sidecar |
| Linkerd | Service mesh minimalista (Rust proxy) | ~10MB por proxy, simplicidad operacional |
| Gateway API | Estándar CNCF para ingress/routing | Reemplaza Ingress (NGINX retira marzo 2026) |

### Observabilidad
| Herramienta | Rol |
|-------------|-----|
| OpenTelemetry | Estándar CNCF para traces, métricas y logs |
| Prometheus + Grafana | Stack de métricas y dashboards |
| Jaeger / Grafana Tempo | Distributed tracing |
| Cilium Hubble | Network observability sin instrumentación (eBPF) |

### FinOps
| Herramienta | Licencia | Alcance |
|-------------|----------|---------|
| OpenCost | Open source (CNCF) | Costo por workload Kubernetes |
| Kubecost | Freemium | K8s + cloud + recomendaciones de ahorro |
| Vantage | Commercial SaaS | Multi-cloud + SaaS unificado |

---

## 6. Patrones Arquitectónicos Fundamentales

### Contenedores e Imágenes
- **Imagen mínima**: base distroless o Alpine, multi-stage build, <100MB objetivo
- **Imagen inmutable**: tag semver, nunca `latest` en producción
- **Image signing**: cosign + Sigstore para cadena de custodia (SLSA)

### Escalabilidad y Resiliencia
- **Stateless by default**: estado externalizado a servicios gestionados (DynamoDB, Redis, S3)
- **Circuit Breaker**: aislamiento de fallos en dependencias externas
- **Retry con jitter**: reintentos con retroceso exponencial solo para operaciones idempotentes
- **PodDisruptionBudget**: garantía de disponibilidad durante disrupciones planificadas

### Zero Trust Networking
- **mTLS entre servicios**: certificados de corta vida (<24h) gestionados por el service mesh
- **SPIFFE/SPIRE**: identidades criptográficas para workloads
- **Deny-by-default**: NetworkPolicies que niegan todo el tráfico no declarado explícitamente

### Multi-Cloud y Portabilidad
- **Kubernetes como capa de portabilidad**: mismos manifiestos en EKS/GKE/AKS
- **Open standards preference**: S3-compatible, OIDC, CloudEvents, OpenTelemetry
- **Data gravity minimization**: co-localizar compute con datos para reducir egress

---

## 7. Intersecciones y Referencias Cruzadas

| Skill Relacionada | Intersección |
|------------------|-------------|
| `infrastructure-architecture` | Landing zones, VPC design, compute platform que hospedan los workloads cloud-native |
| `devsecops-architecture` | CI/CD pipelines, SAST/DAST, SLSA, image signing — construyen y despliegan los contenedores |
| `software-architecture` | Patrones internos de aplicación (DDD, hexagonal, event sourcing) que son prerequisito para containerizar bien |
| `cloud-migration` | La migración produce workloads que deben ser diseñados o rediseñados con esta skill |
| `security-architecture` | Zero trust, mTLS, SPIFFE, threat modeling de workloads Kubernetes |
| `observability` | Stack OTel, RED metrics, SLOs — transversal a todos los servicios cloud-native |

---

## 8. Lecturas Recomendadas y Recursos Continuos

- **CNCF Landscape** (landscape.cncf.io) — Mapa actualizado del ecosistema
- **CNCF Blog** — Artículos técnicos de proyectos graduados
- **KubeCon CFPs** — Casos de uso reales de producción (YouTube CNCF)
- **FinOps Foundation State of FinOps** — Encuesta anual sobre madurez FinOps
- **Kubernetes Changelog** — Notas de versión para deprecaciones y nuevas APIs
- **OpenCost MCP Server docs** — Integración de consultas de costo en agentes IA

---

*© Comunidad MetodologIA. Uso interno — Equipo Discovery.*
