# Metaprompts — Cloud Migration

> Estrategias de meta-nivel para maximizar la efectividad de esta skill.
> Los metaprompts no producen entregables — optimizan COMO se producen.

---

## 1. Migration Risk Radar (Radar de Riesgos de Migracion)

**Proposito:** Antes de finalizar el wave plan, recorrer sistematicamente los riesgos de migracion para validar que cada uno tiene mitigacion documentada. Un riesgo no mitigado en un cutover se convierte en incidente.

```
Para cada wave del programa de migracion, evalua estos ejes de riesgo:

EJE 1 — Riesgo de Datos:
- Tamano total de datos a migrar en esta wave?
- Tiempo estimado de transferencia (con 50% buffer)?
- Continuous replication activa? Lag actual?
- Datos sensibles (PII, PCI, PHI) que requieren encryption en transito?
- Checksum validation definida para tablas criticas?
- Si la transferencia excede la ventana de cutover: BLOCKER.

EJE 2 — Riesgo de Dependencias:
- Todas las dependencias de las apps en esta wave estan mapeadas?
- Hay dependencias fuera de esta wave (apps que aun estan on-prem)?
- Se han identificado dependencias ocultas (shared databases, file shares, batch jobs)?
- Si hay dependencia circular entre waves: REDESIGN wave composition.

EJE 3 — Riesgo de Rollback:
- El rollback procedure ha sido probado en non-prod?
- Cuanto tiempo tarda el rollback completo?
- Si hay datos escritos en cloud durante el parallel run: como se reversan?
- Hay reverse replication configurada?
- Si no hay rollback procedure probado: NO CUTOVER.

EJE 4 — Riesgo de Performance:
- Performance baselines capturadas en source (latency, throughput, error rate)?
- Se han ejecutado load tests en target?
- Right-sizing de instances verificado (no under o over-provisioned)?
- Connection pooling configurado para bases de datos?
- Si no hay baselines: capturar ANTES de aprobar cutover.

EJE 5 — Riesgo Organizacional:
- Application owners identificados y disponibles para sign-off?
- Equipo de migracion tiene capacidad para esta wave (no overloaded)?
- Ventana de cutover aprobada por stakeholders de negocio?
- Comunicacion a usuarios finales planificada?
- Si no hay owner: NO migrar esa app en esta wave.

Para cada eje, documentar:
- Riesgo: descripcion
- Probabilidad: baja / media / alta
- Impacto: bajo / medio / alto / catastrofico
- Mitigacion: implementada / planificada / pendiente
- Owner: quien es responsable

Si algun eje tiene riesgo "alto" + impacto "catastrofico" sin mitigacion implementada:
es un NO-GO para la wave. Remediar antes de aprobar.
```

---

## 2. 7R Challenge Test (Validacion de Clasificacion)

**Proposito:** Despues de la clasificacion 7R inicial, aplicar un "challenge" sistematico para validar que cada clasificacion es correcta. Las clasificaciones incorrectas se descubren durante cutover — que es el peor momento.

```
Para cada aplicacion clasificada con 7R, aplica este challenge:

CHALLENGE 1 — Es realmente Rehost?
Si la app esta clasificada como Rehost, preguntar:
- Tiene la app componentes stateful que no funcionan bien en VM cloud? (sessions, local files)
- Se beneficiaria significativamente de managed database? (→ deberia ser Replatform)
- Tiene mas de 5 anos de vida util restante? (→ evaluar Refactor)
- Hay SaaS equivalent que cubra >80% de funcionalidad? (→ evaluar Repurchase)
- Tiene <10 usuarios activos/mes? (→ evaluar Retire)
Si alguna respuesta sugiere otra estrategia: re-evaluar con justificacion.

CHALLENGE 2 — Es realmente Refactor?
Si la app esta clasificada como Refactor, preguntar:
- Tiene el equipo expertise en cloud-native development?
- Hay codigo fuente disponible y mantenible?
- El timeline permite 6-18 meses de refactoring?
- El business case justifica el costo de refactor vs replatform?
- Es una app estrategica con >5 anos de vida util?
Si >2 respuestas son NO: bajar a Replatform o Rehost.

CHALLENGE 3 — Deberia ser Retire?
Para TODA aplicacion (sin importar su clasificacion actual), preguntar:
- Cuantos usuarios activos tiene (datos reales, no documentacion)?
- Se usa realmente o existe "por si acaso"?
- Hay otra aplicacion que ya cubre la misma funcion?
- El costo de migrar es mayor que el valor que entrega?
Si la app no tiene usuarios activos en 90 dias: es candidata a Retire.

CHALLENGE 4 — Wave assignment correcto?
- Todas las dependencias de esta app estan en la misma wave o en waves anteriores?
- Si esta en Wave 1 (pilot): cumple criterios (low risk, few deps, willing team)?
- Si esta en Final Wave: es porque es genuinamente compleja o porque nadie quiso evaluarla?

Documentar el resultado del challenge:
- CONFIRMED: clasificacion validada con evidencia
- CHANGED: clasificacion modificada (de X a Y) con justificacion
- ESCALATED: requiere mas informacion antes de confirmar
```

---

## 3. Cutover Readiness Gate (Gate de Preparacion para Cutover)

**Proposito:** Antes de aprobar un cutover de produccion, validar que TODOS los prerequisitos estan cumplidos. Este gate previene cutovers prematuros que terminan en rollbacks costosos.

```
Antes de dar GO al cutover de Wave {N}, validar CADA item:

INFRAESTRUCTURA:
- [ ] Landing zone completamente provisionada y tested
- [ ] Networking: connectivity source-target verificada (ping, traceroute, bandwidth test)
- [ ] DNS: split-horizon configurado y probado
- [ ] Security: IAM roles, encryption, security groups configurados
- [ ] Monitoring: dashboards y alertas operativas en target

DATOS:
- [ ] Continuous replication activa con lag <1 minuto
- [ ] Data validation ejecutada: row counts + checksums match
- [ ] Backup del source tomado inmediatamente antes de cutover
- [ ] Storage sizing verificado en target (no se va a llenar durante cutover)

APLICACION:
- [ ] Application deployed en target environment
- [ ] Configuration (env vars, secrets) verificada en target
- [ ] Health checks passing (liveness, readiness)
- [ ] Integration tests con dependencias passing
- [ ] SSL/TLS certificates provisioned en target

REHEARSAL:
- [ ] Cutover rehearsal ejecutado end-to-end en non-prod
- [ ] Duracion real del rehearsal: {DURACION_REHEARSAL} (debe ser <80% de ventana)
- [ ] Rollback ejecutado durante rehearsal (no solo documentado)
- [ ] Duracion de rollback: {DURACION_ROLLBACK} (debe ser <30 min)
- [ ] Gaps del rehearsal documentados y remediados

PERSONAS:
- [ ] App owner disponible durante ventana de cutover
- [ ] Migration engineer asignado
- [ ] Escalation path definido (quien llamar si hay problemas)
- [ ] Comunicacion a usuarios enviada (maintenance window notice)

ROLLBACK:
- [ ] Rollback procedure actualizado post-rehearsal
- [ ] Rollback decision criteria definidos (error rate, latency, data integrity)
- [ ] Source environment running y accesible para rollback
- [ ] Si database: reverse replication configurada

SCORING:
- Todos los items checked: GO — proceder con cutover
- 1-2 items pendientes (no criticos): GO CONDICIONAL — documentar risk acceptance
- Cualquier item de REHEARSAL o ROLLBACK pendiente: NO-GO — remediar primero
- Cualquier item de DATOS pendiente: NO-GO — riesgo de perdida de datos

El NO-GO no es un fracaso — es el gate funcionando correctamente.
```

---

## 4. Post-Migration Optimization Sprint (Sprint de Optimizacion Post-Migracion)

**Proposito:** Despues de completar cada wave, ejecutar un sprint de optimizacion para evitar que los workloads migrados operen con configuracion sub-optima (oversized, no-rightsized, sin cost controls).

```
Despues de completar Wave {N} y validar el parallel run, ejecutar este sprint:

SEMANA 1-2 — Baseline y Observacion:
- Capturar metricas reales en cloud: CPU utilization, memory usage, IOPS, network
- Comparar vs baseline on-prem (source)
- Identificar: instancias over-provisioned (CPU <20% avg), under-provisioned (CPU >80% avg)
- Cost actual vs TCO proyectado: gap analysis

SEMANA 3-4 — Quick Wins de Optimizacion:
1. Right-sizing: reducir instancias over-provisioned al tipo correcto
   - Ahorro tipico: 20-40% en compute
   - Herramienta: AWS Compute Optimizer, Azure Advisor, Google Recommender

2. Commitment discounts: si workloads son steady-state, evaluar Reserved Instances o Savings Plans
   - Ahorro tipico: 30-60% vs on-demand
   - Solo para workloads confirmados (post-validation period)

3. Storage cleanup:
   - Eliminar snapshots innecesarios (originales de migracion)
   - Aplicar lifecycle policies (S3 Intelligent Tiering, archive)
   - Identificar volumes no attached (orphaned)

4. Network optimization:
   - VPC endpoints para servicios frecuentes (S3, DynamoDB)
   - Verificar cross-AZ traffic innecesario

5. Environment scheduling:
   - Staging/dev: apagar fuera de horario laboral
   - Ahorro tipico: 60-70% en non-prod

METRICAS DEL SPRINT:
- Cost antes del sprint: {COSTO_MAGNITUD_ANTES}
- Cost despues del sprint: {COSTO_MAGNITUD_DESPUES}
- Ahorro logrado: {PORCENTAJE}%
- Target: 15-30% de reduccion dentro de 90 dias post-migracion

Si el costo cloud post-migracion es >120% del TCO proyectado:
escalar al FinOps team y ejecutar deep-dive de cost analysis.

REGLA: NUNCA reportar precios exactos. Solo magnitudes y porcentajes de ahorro.
```

---

## 5. Dependency Discovery Validation (Validacion de Descubrimiento de Dependencias)

**Proposito:** Las dependencias no descubiertas son la causa #1 de fallos en cutover. Este metaprompt fuerza una validacion sistematica del dependency mapping antes de aprobar el wave plan.

```
Para cada aplicacion en el wave plan, validar las dependencias con este protocolo:

NIVEL 1 — Dependencias de red (automatizables):
- Revisar network flow data (VPC Flow Logs, firewall logs) de los ultimos 30 dias
- Listar todas las IPs/puertos con los que la aplicacion se comunica
- Clasificar: interno (misma org) / externo (partner, SaaS, internet)
- Resultado esperado: lista completa de conexiones de red

NIVEL 2 — Dependencias de datos (semi-automatizables):
- Shared databases: cuantas aplicaciones usan la misma DB?
  - Si >1 app usa la misma DB: deben migrar juntas O introducir API layer
- File shares: hay directorios compartidos entre aplicaciones?
- ETL/batch feeds: hay feeds de datos entre aplicaciones (archivos, colas, replicacion)?
- Resultado esperado: data dependency graph

NIVEL 3 — Dependencias de autenticacion (manuales):
- LDAP/AD: la app se autentica contra Active Directory on-prem?
  - Si SI: la landing zone tiene federation configurada?
- Certificados: la app usa certificados que estan en un HSM on-prem?
- SSO: la app participa en SSO que requiere conectividad con identity provider on-prem?
- Resultado esperado: identity dependency checklist

NIVEL 4 — Dependencias de negocio (solo stakeholders):
- Proceso de negocio: hay procesos de negocio que cruzan multiples aplicaciones?
  - Si una app migra y otra no: el proceso puede funcionar en modo hibrido?
- SLAs: hay SLAs que dependen de latencia entre aplicaciones?
  - Si apps interdependientes estan en different waves: latencia puede aumentar
- Batch windows: hay batch jobs que deben ejecutarse en secuencia con otros sistemas?
- Resultado esperado: business dependency matrix

VALIDACION:
- Todas las dependencias de NIVEL 1 y 2 descubiertas por herramientas: ALTO confianza
- Solo NIVEL 1 descubierto: MEDIO confianza — ejecutar dependency workshop con app owners
- Sin discovery automatizado: BAJO confianza — NO aprobar wave plan sin discovery

Si una aplicacion tiene >5 dependencias no resueltas:
moverla a una wave posterior hasta que las dependencias se resuelvan.
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
