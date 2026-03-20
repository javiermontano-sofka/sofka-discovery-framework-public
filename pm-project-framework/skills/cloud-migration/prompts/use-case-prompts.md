# Use Case Prompts — Cloud Migration

> Prompts listos para usar en los casos de uso mas frecuentes de esta skill.
> Cada prompt incluye contexto de cuando usarlo y parametros variables.

---

## 1. 7R Assessment de Portafolio de Aplicaciones

**Cuando:** Inicio de programa de migracion. Se necesita clasificar todo el portafolio de aplicaciones con la estrategia 7R optima por workload.

```
Clasificar portafolio de aplicaciones de {ORGANIZACION} usando framework 7R.

Contexto:
- Numero total de aplicaciones: {NUM_APPS}
- Cloud provider target: {CLOUD_PROVIDER} (AWS / Azure / GCP / multi-cloud)
- Driver principal: {DRIVER} (ej: datacenter exit, modernizacion, costo, compliance)
- Timeline general: {TIMELINE} (ej: 12 meses, 18 meses, 24 meses)
- Inventario disponible: {INVENTARIO} (CMDB / planilla manual / no existe)
- Discovery ejecutado: {DISCOVERY} (si, {DIAS} dias / no)

Para cada aplicacion o grupo de aplicaciones, determinar:
1. Estrategia 7R: Rehost / Replatform / Refactor / Repurchase / Retire / Retain / Relocate
2. Justificacion: por que esta estrategia y no otra
3. Effort estimate: S (semanas) / M (meses) / L (trimestres)
4. Risk level: bajo / medio / alto
5. Wave assignment: Wave 0 (foundation) / Wave 1 (pilot) / Wave 2-N / Final Wave
6. Dependencies: aplicaciones que deben migrar juntas

Aplicar decision matrix:
| Factor | Rehost | Replatform | Refactor |
|--------|--------|-----------|---------|
| Business criticality | Low-med | Medium | High (strategic) |
| Technical complexity | Any | Low-med | High (code access) |
| Timeline pressure | Urgent <3mo | Moderate 3-6mo | Long-term 6-18mo |
| Cloud benefit needed | Minimal | Moderate | Maximum |

IMPORTANTE: Documentar aplicaciones candidatas a Retire y Retain con justificacion.
Cada app que no migra es costo evitado.

Parametros:
- {MODO}: piloto-auto (auto para classification, HITL para wave sequencing)
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Entregar S1 (7R Classification) completo con tabla application-by-application.
```

---

## 2. Diseno de Landing Zone

**Cuando:** Preparar el entorno cloud para recibir los workloads migrados. Incluye account structure, networking, security baseline, y governance.

```
Disenar landing zone para programa de migracion de {ORGANIZACION} en {CLOUD_PROVIDER}.

Contexto:
- Cloud provider: {CLOUD_PROVIDER}
- Numero de workloads a migrar: {NUM_WORKLOADS}
- Equipos de desarrollo: {NUM_EQUIPOS}
- Regulaciones aplicables: {REGULACIONES} (ej: PCI-DSS, HIPAA, SOX, GDPR, ninguna)
- Conectividad: {CONECTIVIDAD} (VPN existente / Direct Connect / ninguna)
- Entornos requeridos: {ENTORNOS} (ej: dev, staging, prod, DR)

Disenar:
1. Account/subscription structure (OUs, management groups, cuentas por env/team/workload)
2. Networking: hub-and-spoke, transit gateway, CIDR planning sin overlap
3. Hybrid connectivity: VPN vs Direct Connect/ExpressRoute (decision matrix)
4. DNS strategy: split-horizon para cutover gradual
5. Security baseline: IAM federation, encryption default, audit logging inmutable
6. Governance guardrails: SCPs/policies preventivas y detectivas
7. Tagging strategy: owner, environment, cost-center, migration-wave (con enforcement)
8. Budget alerts: per-account, per-wave, anomaly detection

Incluir diagrama Mermaid de Organizations/account structure.

Parametros:
- {MODO}: supervisado (confirmar account strategy antes de detallar)
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: zona-aterrizaje
```

---

## 3. Planificacion de Oleadas de Migracion (Wave Planning)

**Cuando:** Ya existe la clasificacion 7R y se necesita secuenciar la ejecucion en oleadas con calendar, roles, y go/no-go gates.

```
Planificar oleadas de migracion para programa {PROGRAMA} de {ORGANIZACION}.

Contexto:
- Total de aplicaciones clasificadas: {NUM_APPS} (con 7R assignment completo)
- Cloud provider: {CLOUD_PROVIDER}
- Capacidad del equipo de migracion: {CAPACIDAD} personas
- Timeline del programa: {TIMELINE}
- Landing zone: {LANDING_ZONE} (lista / en progreso / no iniciada)
- Pilot candidates identificados: {PILOTS} (si / no)

Disenar:
1. Wave 0 (Foundation): landing zone, connectivity, shared services, monitoring
   - Duracion estimada: 4-6 semanas
   - Entregables: landing zone operativa, connectivity validated, monitoring baseline

2. Wave 1 (Pilot): 2-3 apps low-risk, low-dependency
   - Criterios de seleccion: baja criticidad, pocas dependencias, tech representativa, equipo willing
   - Success criteria definidos upfront
   - Duracion: 2-4 semanas

3. Waves 2-N (Production): agrupadas por dependency clusters y business domain
   - Migration factory model: roles, automation, metricas (apps/week)
   - Go/no-go gate antes de cada wave
   - Buffer 1-2 semanas entre waves para retrospective

4. Final Wave: apps complejas, high-risk, deeply integrated

5. Wave calendar: timeline visual con parallel streams (infra, app, data, test, cutover)
6. Migration factory staffing: factory manager, migration architects, engineers, test leads
7. Metricas: apps migrated/week, avg cutover duration, rollback rate, post-migration incidents

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: planificacion-oleadas
```

---

## 4. Application Portfolio Rationalization

**Cuando:** Antes de la migracion, racionalizar el portafolio para eliminar redundancias, identificar candidatos a Retire/Repurchase, y reducir el scope de migracion.

```
Racionalizar portafolio de aplicaciones de {ORGANIZACION} previo a migracion cloud.

Contexto:
- Numero total de aplicaciones en inventario: {NUM_APPS}
- CMDB disponible: {CMDB} (si / parcial / no)
- Discovery data disponible: {DISCOVERY} (si, {DIAS} dias / no)
- Budget de migracion (magnitud): {BUDGET_MAGNITUD}
- Presion de timeline: {PRESION} (datacenter exit deadline / no)

Analizar:
1. Aplicaciones zombies (sin trafico real en ultimos 90 dias) → candidatas a Retire
2. Aplicaciones duplicadas (misma funcion, diferentes implementaciones) → consolidar
3. Aplicaciones con SaaS equivalent disponible → candidatas a Repurchase
4. Aplicaciones con compliance constraints → candidatas a Retain (con justificacion)
5. Aplicaciones con inversion reciente (<2 anos) → evaluar ROI de migrar vs retain

Entregar:
1. Portfolio heat map: criticidad vs complejidad (cuadrante)
2. Retire candidates con costo evitado (magnitud)
3. Repurchase candidates con SaaS alternatives evaluadas
4. Scope reducido: numero final de apps a migrar vs inventario original
5. Quick wins: apps que pueden migrar en <2 semanas (rehost simple)

Aplicar regla: Si >20% del portafolio puede retirarse, el ahorro justifica
el esfuerzo de rationalization antes de iniciar Wave 0.

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 5. Cutover Strategy y Runbook

**Cuando:** Disenar la estrategia de cutover para una wave especifica, incluyendo rehearsal, procedimiento de rollback, y criterios de decision.

```
Disenar estrategia de cutover para Wave {WAVE_NUM} del programa {PROGRAMA}.

Contexto:
- Aplicaciones en esta wave: {APPS} (listar con criticidad)
- Tipo de migracion predominante: {TIPO} (rehost / replatform / mixed)
- Ventana de cutover disponible: {VENTANA} (ej: 4 horas nocturnas, fin de semana completo)
- Datos a sincronizar: {DATOS} (volumen estimado, tipo de replicacion)
- Rollback requirement: {ROLLBACK} (obligatorio / best-effort)

Disenar:
1. Cutover timeline: paso a paso con duracion estimada y responsable
2. Pre-cutover checklist:
   - [ ] Rehearsal ejecutado en non-prod (fecha: {FECHA_REHEARSAL})
   - [ ] Replicacion continua activa y lag <1 min
   - [ ] Smoke test suite preparado
   - [ ] Rollback procedure documentado y probado
   - [ ] Monitoring/alerting configurado en target

3. Cutover procedure:
   - Freeze source (stop writes)
   - Final sync (verify lag = 0)
   - DNS switch
   - Smoke test suite
   - Monitoring validation
   - Go/No-Go decision (owner sign-off)

4. Rollback decision criteria (tabla):
   | Condicion | Umbral | Accion |
   |-----------|--------|--------|
   | Error rate | >5x baseline 15min | Rollback inmediato |
   | Latencia | P99 >3x baseline 15min | Rollback inmediato |
   | Data integrity | Checksum mismatch | Rollback inmediato |
   | Ventana excedida | >80% window con pasos restantes | Evaluar y probablemente rollback |

5. Post-cutover:
   - Parallel run period: {PARALLEL_RUN} dias
   - Validation checklist
   - Decommission criteria para source

Parametros:
- {MODO}: paso-a-paso (confirmar cada fase del cutover)
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: planificacion-oleadas
```

---

## 6. TCO Analysis: On-Premises vs Cloud

**Cuando:** Justificar la migracion con comparacion de costos totales. Requerido para business case y aprobacion de presupuesto.

```
Calcular TCO comparativo on-premises vs cloud para {ORGANIZACION}.

Contexto:
- Workloads a comparar: {WORKLOADS} (ej: 50 VMs, 10 databases, 5 file shares)
- Cloud provider target: {CLOUD_PROVIDER}
- Horizonte de comparacion: {HORIZONTE} (ej: 3 anos, 5 anos)
- Datacenter actual: {DATACENTER} (propio / colocation / managed hosting)
- Contratos de licencias: {LICENCIAS} (ej: Oracle, SQL Server, Windows Server)
- Hardware refresh pendiente: {REFRESH} (si, en {MESES} meses / no / reciente)

Comparar por categoria:
| Categoria | On-Premises | Cloud |
|-----------|------------|-------|
| Compute | Amortizacion hardware (3-5 anos) | Reserved + on-demand |
| Storage | SAN/NAS, reemplazo disco | S3/EBS tiered pricing |
| Facilities | Energia, cooling, DC lease | Incluido |
| Personal | FTE * costo fully loaded | Reducido (managed services) |
| Licencias | On-prem perpetual o subscription | BYOL, cloud-native, o incluido |
| Network | WAN circuits, load balancers | Egress fees, cross-AZ traffic |
| Migracion (unica vez) | N/A | Dual-run, tooling, consulting, training |

Incluir:
1. Break-even point estimado (tipico: 18-36 meses)
2. Hidden costs cloud: egress fees, premium support, cross-AZ traffic
3. Hidden costs on-prem: hardware failure, capacity planning, opportunity cost
4. Savings opportunities: reserved instances, spot, rightsizing
5. Sensitividad: que pasa si el consumo crece 2x o 3x

IMPORTANTE: Solo magnitudes y porcentajes. NUNCA precios exactos como compromiso.
Usar calculadoras oficiales (AWS Pricing Calculator, Azure TCO Calculator) para estimaciones.

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 7. Migracion de Bases de Datos

**Cuando:** Migracion especifica de bases de datos, ya sea homogenea (misma engine) o heterogenea (cambio de engine). Requiere estrategia de replicacion y validacion de datos.

```
Planificar migracion de base de datos {DB_SOURCE} a {DB_TARGET} para {ORGANIZACION}.

Contexto:
- Database source: {DB_SOURCE} (ej: Oracle 19c on-prem, SQL Server 2019)
- Database target: {DB_TARGET} (ej: RDS PostgreSQL, Aurora MySQL, Cloud SQL)
- Tipo de migracion: {TIPO_DB} (homogenea / heterogenea)
- Tamano de datos: {TAMANO} (ej: 500GB, 2TB, 10TB)
- Downtime tolerance: {DOWNTIME} (zero / minutos / horas / ventana de mantenimiento)
- Stored procedures / triggers: {PROCS} (si, cantidad estimada / no)
- Aplicaciones consumidoras: {CONSUMIDORES} (numero y criticidad)

Disenar:
1. Schema assessment: compatibilidad source → target
   - Si heterogenea: usar AWS SCT o equivalente para analisis de conversion
   - Identificar: data types incompatibles, procedimientos sin equivalente, triggers

2. Migration strategy:
   - Homogenea: native replication o DMS continuous replication
   - Heterogenea: schema conversion + DMS + custom scripts para stored procedures
   - Zero-downtime: continuous replication con cutover final (lag target: <1 min)

3. Data validation:
   - Row counts por tabla
   - Checksums en tablas criticas
   - Sample comparison (top 100 rows por tabla)
   - Functional validation con aplicaciones consumidoras

4. Performance baseline:
   - Queries top-20 por tiempo de ejecucion: comparar source vs target
   - Connection pooling configurado (PgBouncer, ProxySQL)
   - Index optimization post-migracion

5. Rollback plan:
   - Reverse replication (target → source) para datos escritos durante parallel run
   - DNS/connection string reversion

Parametros:
- {MODO}: supervisado (confirmar schema assessment antes de migrar)
- {FORMATO}: markdown
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
