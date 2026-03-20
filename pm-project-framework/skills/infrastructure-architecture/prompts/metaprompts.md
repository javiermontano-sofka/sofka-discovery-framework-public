# Metaprompts — Infrastructure Architecture

> Meta-level strategies to maximize the effectiveness of this skill.
> Metaprompts do not produce deliverables — they optimize HOW they are produced.

---

## 1. Failure Mode Analysis

**Purpose:** Before finalizing any infrastructure design, systematically walk through failure modes to validate that the architecture survives them.

```
Para cada componente critico del diseno de infraestructura, aplica este analisis:

NIVEL 1 — Fallo de instancia unica:
- Que pasa si esta instancia/pod/nodo muere?
- Hay redundancia automatica? (replicas, auto-scaling, failover)
- Tiempo de recuperacion? (segundos, minutos, manual?)
- Datos perdidos? (RPO real, no teorico)

NIVEL 2 — Fallo de zona de disponibilidad:
- Que pasa si una AZ completa cae?
- Los componentes estan distribuidos en multiples AZs?
- El load balancer redirige automaticamente?
- La base de datos tiene replicas cross-AZ?

NIVEL 3 — Fallo de region:
- Que pasa si la region completa no esta disponible?
- Hay DR configurado en otra region?
- El DNS failover es automatico o manual?
- Cuanto tarda el scale-up en la region DR?

NIVEL 4 — Fallo de dependencia externa:
- Que pasa si un servicio managed (RDS, MSK, S3) tiene degradacion?
- Hay circuit breakers? Fallbacks? Graceful degradation?
- Los timeouts estan configurados? (nunca infinity)

NIVEL 5 — Fallo de datos:
- Que pasa si hay corrupcion de datos?
- Hay backups inmutables? Point-in-time recovery?
- Se puede restaurar a un punto especifico en el tiempo?
- Se han PROBADO los restores? (backup sin restore test = no backup)

Para cada nivel, documentar:
- Probabilidad (rara / baja / media / alta)
- Impacto (bajo / medio / alto / catastrofico)
- Mitigacion implementada
- Mitigacion pendiente (gap)

Si algun nivel tiene impacto "catastrofico" sin mitigacion, es un blocker.
```

---

## 2. Cost-Performance Trade-off

**Purpose:** For each infrastructure decision, make the trade-off between cost, performance, and complexity explicit. Avoid over-engineering and under-engineering.

```
Para cada decision significativa de infraestructura, documenta el trade-off:

DECISION: {descripcion de la decision}

OPCION A (Lower cost):
- Configuracion: {detalle}
- Costo mensual (magnitud): {bajo/medio/alto}
- Performance: {que se sacrifica}
- Risk: {que riesgo se acepta}
- Cuando elegir: {condiciones}

OPCION B (Balanced):
- Configuracion: {detalle}
- Costo mensual (magnitud): {bajo/medio/alto}
- Performance: {que se gana vs. A}
- Risk: {que riesgo se mitiga vs. A}
- Cuando elegir: {condiciones}

OPCION C (Higher performance/reliability):
- Configuracion: {detalle}
- Costo mensual (magnitud): {bajo/medio/alto}
- Performance: {que se gana vs. B}
- Risk: {que riesgo adicional se mitiga}
- Cuando elegir: {condiciones}

RECOMENDACION: Opcion {X} porque {justificacion basada en contexto del cliente}.

Reglas del trade-off analysis:
- NUNCA recomendar la opcion mas cara sin justificacion explicita
- NUNCA recomendar la opcion mas barata para componentes criticos
- Siempre incluir "cuando escalar a la siguiente opcion" (trigger)
- El costo de NO hacer algo (costo de downtime, costo de breach) es parte del analisis
- Cost magnitudes only — NUNCA precios exactos
```

---

## 3. Compliance-First Design

**Purpose:** When infrastructure has regulatory requirements (PCI-DSS, HIPAA, SOX, GDPR), design compliance-first instead of retro-fitted.

```
Antes de disenar infraestructura, identifica el marco regulatorio:

PASO 1 — Identificar regulaciones aplicables:
- PCI-DSS: datos de tarjetas de pago?
- HIPAA: datos de salud?
- SOX: controles financieros?
- GDPR: datos personales de ciudadanos EU?
- Regulaciones locales: {especificar}
- Ninguna: documentar explicitamente que no aplica regulacion

PASO 2 — Mapear requisitos a secciones del skill:
| Regulacion | S1 Network | S2 Compute | S3 Storage | S4 HA/DR | S5 IAM | S6 Landing Zone | S7 Cost |
|---|---|---|---|---|---|---|---|
| PCI-DSS | Segmentacion de red obligatoria | Hardened images | Encryption at rest mandatory | Backups fuera de scope PCI | MFA, least privilege, audit logs | Cuenta separada para CDE | CloudHSM adds cost |
| HIPAA | VPN/Direct Connect para PHI | BAA con cloud provider | Encryption + access logging | Backup & DR mandatory | Access controls auditados | Dedicated account | Compliance adds ~15% cost |
| ... | ... | ... | ... | ... | ... | ... | ... |

PASO 3 — Disenar controles ANTES de la arquitectura:
- La segmentacion de red va PRIMERO (no se agrega despues)
- La encryption es default-on (no opt-in)
- Los audit logs son inmutables desde day 1
- Los IAM roles son least privilege desde el inicio

PASO 4 — Documentar compliance mapping:
Para cada control implementado, citar:
- Requisito regulatorio especifico (ej: PCI-DSS Req 1.3.1)
- Implementacion tecnica (ej: Security Groups deny all inbound to CDE except from DMZ)
- Evidencia de cumplimiento (ej: VPC Flow Logs retenidos 1 ano)
- Responsable de auditoria

Si una decision de diseno NO cumple un requisito regulatorio, es un blocker.
No se puede "arreglar despues" — compliance-by-design o no se implementa.
```

---

## 4. Scalability Stress Test

**Purpose:** Validate that the infrastructure design supports 10x current traffic without fundamental redesign.

```
Toma el diseno de infraestructura y aplicale estos multiplicadores:

ESCENARIO 1 — 3x actual (crecimiento organico, 12-18 meses):
- Compute: los auto-scalers pueden manejar 3x pods/instances?
- Database: el instance type soporta 3x connections/queries?
- Cache: el cluster maneja 3x operations/second?
- Network: el bandwidth es suficiente? NAT Gateway no es bottleneck?
- Cost: el costo escala linealmente o hay cliff?

ESCENARIO 2 — 10x actual (evento viral, Black Friday, campana):
- Compute: cuanto tarda el auto-scaler en llegar a 10x? (Karpenter: <60s, Cluster Autoscaler: 3-5 min)
- Database: read replicas suficientes? Necesita Aurora Serverless v2?
- Cache: necesita mas shards? Hot key problem?
- Network: WAF rate limiting configurado? CDN absorbe el trafico estatico?
- Cost: cuanto cuesta 10x por 4 horas? Es aceptable?

ESCENARIO 3 — 100x actual (DDoS o evento imprevisto):
- Network: Shield Advanced absorbe? WAF bloquea?
- Compute: hay max limits configurados (cost protection)?
- Database: connection pooling + circuit breakers activos?
- Cost: hay budget alerts que eviten bill shock?

Para cada escenario:
1. Componentes que escalan automaticamente (OK)
2. Componentes que requieren intervencion manual (RISK)
3. Componentes que son single points of failure (BLOCKER)
4. Costo estimado del escalado (magnitud)
5. Tiempo de escalado (segundos, minutos, horas)

Si algun componente critico no puede escalar a 3x sin rediseno, el diseno tiene un defecto.
Si no puede escalar a 10x con intervencion manual razonable, documentar como limitacion.
```

---

## 5. Cloud-Agnostic Evaluation

**Purpose:** Evaluate the degree of vendor lock-in and design portability. Not to force multi-cloud, but to make CONSCIOUS lock-in decisions.

```
Para cada componente del diseno de infraestructura, evalua la portabilidad:

CLASIFICACION DE LOCK-IN:

PORTABLE (bajo lock-in):
- Containers en Kubernetes (EKS/AKS/GKE son intercambiables)
- Terraform modules (provider swap con refactor)
- PostgreSQL/MySQL (RDS/Cloud SQL/Cloud Databases)
- S3-compatible storage (MinIO, GCS con adapter)
- Prometheus/Grafana (runs anywhere)

ABSTRACTABLE (medio lock-in, costo de migracion moderado):
- Managed Kafka (MSK vs Confluent Cloud vs self-managed)
- Redis (ElastiCache vs Memorystore vs self-managed)
- Container registry (ECR vs ACR vs GCR)
- DNS (Route 53 vs Cloud DNS vs Cloudflare)
- CDN (CloudFront vs Azure CDN vs Cloud CDN)

LOCKED-IN (alto lock-in, beneficio justifica):
- Aurora Serverless (no equivalente directo)
- Lambda + Step Functions (rewrite para Cloud Functions)
- DynamoDB (rewrite para alternatives)
- CloudHSM / KMS (key migration compleja)
- IAM Roles for Service Accounts (IRSA, K8s-specific)

Para cada componente locked-in:
- Beneficio que justifica el lock-in: {explicar}
- Costo de migracion estimado si fuera necesario: {magnitud}
- Alternative portable: {componente} con trade-off de {que se pierde}
- Decision: ACEPTAR lock-in porque {justificacion} | MITIGAR con abstraction layer

Reglas:
- Lock-in no es malo por default — es malo cuando es INCONSCIENTE
- El objetivo NO es eliminar todo lock-in — es documentar las decisiones
- Managed services con lock-in frecuentemente son la opcion correcta (menos ops burden)
- Si el cliente explicitamente requiere multi-cloud, activar abstraction layers
  (Kubernetes, Terraform, Crossplane) pero documentar el costo de la abstraccion
```

---

**Author:** Javier Montano | **Last updated:** March 13, 2026
**© Comunidad MetodologIA — All rights reserved**
