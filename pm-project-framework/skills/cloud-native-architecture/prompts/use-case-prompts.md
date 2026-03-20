# Use Case Prompts — Cloud-Native Architecture

> Prompts listos para usar en los casos de uso mas frecuentes de esta skill.
> Cada prompt incluye contexto de cuando usarlo y parametros variables.

---

## 1. Diseno de Microservicios Cloud-Native (Greenfield)

**Cuando:** Proyecto nuevo que nace cloud-native. No existe aplicacion legacy — se disena desde cero con contenedores, Kubernetes y observabilidad.

```
Disenar arquitectura cloud-native para {SISTEMA} de {ORGANIZACION} (proyecto greenfield).

Contexto:
- Industria: {INDUSTRIA}
- Numero estimado de microservicios: {NUM_SERVICIOS}
- Cloud provider: {CLOUD_PROVIDER} (AWS / Azure / GCP)
- Equipo de desarrollo: {NUM_DEVS} personas, experiencia K8s: {K8S_MATURITY} (none / basic / intermediate / advanced)
- Patron de trafico esperado: {PATRON_TRAFICO} (ej: steady, bursty, event-driven)
- Requisitos de compliance: {COMPLIANCE} (ej: PCI-DSS, HIPAA, SOX, ninguno)

Entregar las 6 secciones completas:
- S1: 12-Factor compliance assessment (como guia de diseno, no auditoria)
- S2: Container strategy + Kubernetes architecture (cluster topology, namespaces, autoscaling)
- S3: Service mesh decision (adopt vs defer) con comparison matrix
- S4: Serverless vs container decision por tipo de workload
- S5: Multi-cloud posture (cloud-primary vs cloud-agnostic)
- S6: FinOps baseline (OpenCost, labels, cost allocation desde dia uno)

Incluir diagrama Mermaid de arquitectura de alto nivel (C4 Context o Container).

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: tecnica
```

---

## 2. Estrategia de Contenedores y Kubernetes

**Cuando:** La organizacion adopta Kubernetes o redisena su plataforma de contenedores. Foco en S2 (Container & Orchestration Strategy).

```
Disenar estrategia de contenedores y Kubernetes para {ORGANIZACION}.

Contexto:
- Numero de microservicios actuales/planeados: {NUM_SERVICIOS}
- Trafico pico (RPS): {RPS}
- Cloud provider: {CLOUD_PROVIDER}
- Kubernetes actual: {K8S_ACTUAL} (ninguno / EKS / AKS / GKE / self-managed)
- Equipo platform: {NUM_PLATFORM} personas
- Compliance: {COMPLIANCE}
- Pain points actuales: {PAIN_POINTS} (ej: scaling lento, costos altos, incidents frecuentes)

Disenar:
1. Container image best practices (base images, multi-stage, scanning, signing)
2. Cluster topology (single vs multi-cluster, per-env vs per-region)
3. Namespace strategy + RBAC
4. Resource requests/limits (CPU burst, memory capped) con tabla de guidance
5. Node autoscaling: Karpenter vs Cluster Autoscaler con decision matrix
6. Pod autoscaling: HPA + KEDA + VPA (recommend-only) — combinacion recomendada
7. GitOps deployment (ArgoCD vs Flux)

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: contenedores
```

---

## 3. Evaluacion de Service Mesh

**Cuando:** La organizacion tiene >10 microservicios y necesita decidir si adoptar service mesh y cual implementacion elegir.

```
Evaluar adopcion de service mesh para {SISTEMA} de {ORGANIZACION}.

Contexto:
- Numero de microservicios en produccion: {NUM_SERVICIOS}
- Patrones de comunicacion: {PATRONES} (ej: sync HTTP, gRPC, async Kafka, mixed)
- Requisito de mTLS: {MTLS} (obligatorio por compliance / deseable / no requerido)
- CNI actual: {CNI} (ej: aws-vpc-cni, Calico, Cilium, default)
- Observabilidad actual: {OBSERVABILIDAD} (ej: ninguna, Prometheus basico, OTel parcial)
- Preocupaciones principales: {PREOCUPACIONES} (ej: security, traffic management, observability, all)

Evaluar las opciones con comparison matrix:
| Opcion | Data Plane | Overhead | Mejor para |
|--------|-----------|----------|-----------|
| No mesh (defer) | N/A | Ninguno | <10 servicios, patrones simples |
| Cilium (eBPF) | Kernel-level | Mas bajo | Ya usando Cilium CNI, L3/L4 mTLS |
| Istio Ambient | ztunnel + waypoint | 90% menos que sidecar | Zero-trust mTLS at scale, nuevos clusters |
| Istio Sidecar | Envoy per pod | ~50-100MB/sidecar | Traffic management L7 complejo |
| Linkerd | Rust proxy | ~10MB/sidecar | Simplicidad, bajo overhead |

Incluir:
- Decision rule basada en numero de servicios y requisitos
- Gateway API migration plan (si usa Ingress legacy)
- Observability stack recomendado (OTel + Jaeger/Tempo + Grafana)
- Impacto en costos de recursos (overhead de mesh)

Parametros:
- {MODO}: supervisado (confirmar requisito mTLS antes de recomendar)
- {FORMATO}: markdown
```

---

## 4. Arquitectura Serverless para Workloads Event-Driven

**Cuando:** Evaluar o disenar serverless para procesamiento de eventos, APIs de bajo trafico, o funciones batch. Foco en S4 (Serverless Decision Framework).

```
Disenar arquitectura serverless para {CASO_USO} de {ORGANIZACION}.

Contexto:
- Caso de uso: {CASO_USO} (ej: event processing, API backend, data pipeline, scheduled jobs)
- Patron de trafico: {PATRON} (ej: bursty, event-driven, periodic, unpredictable)
- Invocaciones estimadas/mes: {INVOCACIONES}
- Duracion promedio de ejecucion: {DURACION}
- Cold start tolerance: {COLD_START} (aceptable / no aceptable)
- Cloud provider: {CLOUD_PROVIDER}
- Estado de las funciones: {ESTADO} (stateless / requiere estado externo)

Aplicar decision matrix serverless vs containers:
- Trafico spiky + stateless + cold start OK = serverless
- Trafico steady + stateful + latencia critica = containers
- >10M invocaciones/mes = modelar break-even point

Entregar:
1. Clasificacion de cada componente: serverless vs container con justificacion
2. Cold start mitigation strategy (provisioned concurrency, SnapStart, language choice)
3. State management (DynamoDB, Redis, Step Functions)
4. Vendor lock-in assessment con exit cost por componente
5. Abstraction layers recomendadas (SST, Pulumi, CloudEvents)
6. Cost projection: serverless vs container at current and 10x volume

Parametros:
- {MODO}: desatendido
- {FORMATO}: markdown
```

---

## 5. Modernizacion de Legacy a Cloud-Native

**Cuando:** Aplicacion monolitica existente que se quiere modernizar a cloud-native. Diferente de cloud-migration (que mueve sin redisenar) — aqui se redisena la arquitectura.

```
Disenar plan de modernizacion cloud-native para {SISTEMA} de {ORGANIZACION}.

Contexto:
- Aplicacion actual: {DESCRIPCION} (ej: monolito Java EE, .NET Framework, COBOL)
- Antiguedad: {ANOS} anos
- Tamano del equipo: {NUM_DEVS} desarrolladores
- Codigo fuente disponible: {CODIGO} (si / parcial / no)
- Base de datos: {DATABASE} (ej: Oracle, SQL Server, PostgreSQL)
- Integraciones criticas: {INTEGRACIONES} (ej: SAP, MQ, File-based)
- Timeline disponible: {TIMELINE} (ej: 6 meses, 12 meses, 18 meses)

Plan de modernizacion:
1. 12-Factor compliance audit del monolito actual (gaps y remediation)
2. Strangler Fig pattern: identificar boundaries de decomposicion
3. Containerization strategy: monolito en container PRIMERO, luego decompose
4. Database decomposition: shared DB → database-per-service (timeline)
5. Service mesh adoption timeline (cuanto agregar mesh en el proceso)
6. FinOps: comparacion de costos monolito-on-prem vs microservicios-cloud

Edge cases a considerar:
- Si no hay codigo fuente: solo containerizacion del binario (rehost en container)
- Si equipo <5 devs: managed K8s + skip mesh + cloud managed services
- Si database es Oracle con procedimientos: evaluar refactor vs keep-on-prem

Parametros:
- {MODO}: supervisado (confirmar boundaries de decomposicion)
- {FORMATO}: markdown
- {VARIANTE}: tecnica
```

---

## 6. Estrategia Multi-Cloud y Portabilidad

**Cuando:** La organizacion necesita evaluar su postura multi-cloud o disenar portabilidad consciente entre proveedores. Foco en S5 (Multi-Cloud & Portability).

```
Evaluar estrategia multi-cloud para {ORGANIZACION}.

Contexto:
- Cloud providers actuales: {PROVIDERS} (ej: AWS primary, Azure para Office 365)
- Motivacion multi-cloud: {MOTIVACION} (ej: vendor lock-in avoidance, regulatory, best-of-breed, M&A)
- Numero de workloads: {NUM_WORKLOADS}
- Equipo ops: {NUM_OPS} personas
- Budget para abstraction layers: {BUDGET_MAGNITUD} (bajo / medio / alto)

Evaluar por tier:
- Tier 1: Cloud-agnostic app (K8s, standard APIs) — costo bajo, portabilidad alta
- Tier 2: Portable infrastructure (Terraform, Crossplane) — costo medio
- Tier 3: Active multi-cloud (workloads distribuidos) — costo alto

Para cada servicio critico, clasificar lock-in:
- PORTABLE: containers K8s, PostgreSQL, Prometheus, S3-compatible
- ABSTRACTABLE: managed Kafka, Redis, CDN, DNS
- LOCKED-IN: Aurora Serverless, DynamoDB, Step Functions

Entregar:
1. Lock-in inventory con justificacion por decision
2. Abstraction layer recommendations (Terraform, Crossplane, app-level interfaces)
3. Data gravity analysis (donde esta la data, costo de mover)
4. Open standards adoption checklist (OIDC, CloudEvents, OTel, S3-compatible)
5. Cost of portability (overhead de abstraccion vs beneficio)
6. Recomendacion: cloud-primary con portabilidad consciente vs multi-cloud activo

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 7. FinOps y Optimizacion de Costos Cloud-Native

**Cuando:** El cliente necesita implementar practicas FinOps para sus workloads Kubernetes o quiere optimizar costos cloud existentes. Foco en S6 (FinOps Integration).

```
Implementar FinOps para workloads cloud-native de {ORGANIZACION}.

Contexto:
- Plataforma: {PLATAFORMA} (ej: EKS con 5 clusters, GKE con 2 clusters)
- Numero de namespaces/equipos: {NUM_EQUIPOS}
- Cloud spend actual (magnitud): {SPEND_MAGNITUD}/mes (ej: bajo, medio, alto, muy alto)
- Crecimiento de spend: {CRECIMIENTO}% mensual
- FinOps maturity: {MATURITY} (crawl / walk / run)
- Herramientas actuales: {HERRAMIENTAS} (ej: ninguna, CloudWatch basic, Kubecost free)

Disenar:
1. Tooling selection: OpenCost (baseline) + Kubecost (recommendations) + Vantage (executive)
2. Label/tag strategy: team, service, environment, cost-center — con enforcement
3. Cost allocation: namespace-level + pod-level attribution
4. Optimization levers prioritizados:
   - Rightsizing via VPA (recommend-only, 2+ weeks data)
   - Spot/preemptible mix via Karpenter (60-90% ahorro en fault-tolerant)
   - Scale to zero via KEDA (queue workers, event-driven)
   - Ephemeral environments (spin up per PR, tear down on merge)
   - Storage lifecycle y cleanup de recursos huerfanos
5. Unit economics: costo por usuario, costo por transaccion
6. Anomaly alerts: >20% daily spike triggers investigacion
7. Governance: budget alerts per namespace, showback reports per team

IMPORTANTE: Solo magnitudes y porcentajes de ahorro. NUNCA precios exactos como compromiso.

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: optimizacion-costos
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
