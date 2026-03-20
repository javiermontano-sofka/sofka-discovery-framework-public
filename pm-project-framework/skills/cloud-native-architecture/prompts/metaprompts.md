# Metaprompts — Cloud-Native Architecture

> Estrategias de meta-nivel para maximizar la efectividad de esta skill.
> Los metaprompts no producen entregables — optimizan COMO se producen.

---

## 1. 12-Factor Stress Test (Prueba de Estres de Cloud-Native Readiness)

**Proposito:** Antes de disenar la arquitectura cloud-native, validar sistematicamente que cada componente cumple los 12 factores. Los gaps no son blockers — son el input para decidir la estrategia de remediacion.

```
Para cada componente/servicio del sistema, aplica este analisis de 12-Factor:

FASE 1 — Audit rapido (rating por factor):
Para cada uno de los 12 factores, asignar:
- COMPLIANT: cumple el principio
- PARTIAL: cumple parcialmente (documentar gap)
- NON-COMPLIANT: no cumple (documentar remediacion y esfuerzo S/M/L)

1. Codebase: un repo, muchos deploys?
2. Dependencies: declaradas explicitamente, aisladas?
3. Config: en environment, no en codigo?
4. Backing services: attached resources (DB, cache, queue)?
5. Build/release/run: separacion estricta de stages?
6. Processes: stateless, share-nothing?
7. Port binding: self-contained, exporta via port?
8. Concurrency: escala via process model?
9. Disposability: startup <10s, shutdown graceful (SIGTERM)?
10. Dev/prod parity: drift minimo entre entornos?
11. Logs: event streams a stdout?
12. Admin processes: tareas one-off?

FASE 2 — Impacto en estrategia cloud-native:
Para cada factor NON-COMPLIANT:
- Es blocker para containerizacion? (ej: factor 6 stateful = require external store)
- Se puede remediar antes de containerizar? (esfuerzo)
- Se puede remediar DURANTE la containerizacion? (mas eficiente)

FASE 3 — Priorizacion de remediacion:
- Quick wins: factores que se arreglan en config (3, 11, 12)
- Medium effort: factores que requieren refactor menor (1, 2, 5, 7, 10)
- High effort: factores que requieren rediseno (4, 6, 8, 9)

Si >4 factores son NON-COMPLIANT, la aplicacion necesita un programa de
remediacion ANTES de disenar la arquitectura cloud-native completa.
Considerar containerizar el monolito primero (strangler fig).
```

---

## 2. Container vs Serverless Decision Framework (Arboles de Decision)

**Proposito:** Para cada workload, aplicar un arbol de decision sistematico que determine si debe ser container, serverless, o VM. Evitar la trampa de "todo a Kubernetes" o "todo a Lambda".

```
Para cada workload/componente, recorre este arbol de decision:

NODO 1 — Tiene codigo fuente y puede modificarse?
- NO → Solo rehost (VM o container del binario). FIN.
- SI → Continuar.

NODO 2 — Es stateful o stateless?
- STATEFUL (database, file system, sessions in-memory):
  → Evaluar managed service (RDS, DynamoDB, ElastiCache)
  → Si no hay managed service adecuado: container con Operator (CloudNativePG, Strimzi)
  → NUNCA serverless para workloads stateful. FIN.
- STATELESS → Continuar.

NODO 3 — Patron de trafico?
- STEADY (constante, predecible): Container (HPA)
- BURSTY (picos impredecibles): Evaluar serverless
- EVENT-DRIVEN (triggers de cola/stream): Serverless o KEDA
- PERIODIC (cron, batch): Serverless (si <15min) o K8s CronJob

NODO 4 — Volumen de invocaciones/mes?
- <1M: Serverless probablemente mas economico
- 1M-10M: Calcular break-even (serverless vs container)
- >10M: Container casi siempre mas economico

NODO 5 — Cold start tolerance?
- ACEPTABLE (100-500ms): Serverless viable
- NO ACEPTABLE (<50ms P99): Container o provisioned concurrency (mas caro)

NODO 6 — Vendor lock-in tolerance?
- ACEPTABLE: Cloud-native serverless (Lambda, Cloud Functions)
- NO ACEPTABLE: Container en K8s (portable) o Knative

RESULTADO: Documentar la decision por workload con la ruta del arbol.
Si la decision no es obvia (ej: 3M invocaciones, bursty, no-cold-start),
documentar ambas opciones con cost comparison y recomendar piloto.
```

---

## 3. Service Mesh Adoption Gate (Evaluacion de Necesidad Real)

**Proposito:** Service mesh agrega valor significativo PERO tambien complejidad y overhead. Este metaprompt fuerza una evaluacion honesta de si el equipo realmente necesita mesh o esta sobre-ingenieriando.

```
Antes de recomendar service mesh, responde estas preguntas con evidencia:

PREGUNTA 1 — Cuantos servicios en produccion?
- <10 servicios: PROBABLEMENTE no necesitas mesh. Defer.
- 10-50 servicios: Evaluar con las preguntas siguientes.
- >50 servicios: Mesh probablemente justificado.

PREGUNTA 2 — Que problema ESPECIFICO resuelve el mesh?
Marcar SOLO los que aplican con evidencia:
- [ ] mTLS obligatorio por compliance (citar regulacion)
- [ ] Traffic management complejo (canary, A/B, circuit breaking)
- [ ] Observabilidad distribuida sin instrumentacion de codigo
- [ ] Rate limiting per-service
- [ ] Retry/timeout policies uniformes

Si NINGUNA casilla marcada: NO necesitas mesh. Defer.
Si solo mTLS: considerar Cilium (sin sidecar) o NetworkPolicies + cert-manager.

PREGUNTA 3 — El equipo puede operarlo?
- Tiene experiencia operando mesh en produccion? SI/NO
- Tiene equipo de plataforma dedicado (>2 personas)? SI/NO
- Si ambas NO: Defer mesh. Implementar observabilidad basica (OTel) primero.

PREGUNTA 4 — Overhead aceptable?
| Mesh | Overhead por pod | Total para {N} pods |
|------|-----------------|-------------------|
| Istio Sidecar | ~50-100MB RAM | N * 75MB |
| Istio Ambient | ~20MB per node | mucho menor |
| Linkerd | ~10MB RAM | N * 10MB |
| Cilium | 0 (kernel-level) | incluido en CNI |

Si el overhead > 10% de los recursos totales del cluster: reconsiderar.

DECISION FINAL:
- ADOPT: Justificacion tecnica clara + equipo capaz + overhead aceptable
- DEFER: Revisar en 6 meses cuando el numero de servicios o requisitos crezcan
- PARTIAL: Solo mTLS via Cilium/Ambient, sin traffic management completo

Documentar la decision con evidencia. "Porque es buena practica" NO es justificacion.
```

---

## 4. FinOps Day-One Checklist (Validacion de Costos Desde el Diseno)

**Proposito:** Asegurar que cada decision de arquitectura cloud-native tiene su dimension de costo evaluada ANTES de implementar, no despues de recibir la primera factura.

```
Para cada seccion del diseno cloud-native, validar:

S2 (CONTAINERS & K8S):
- [ ] Resource requests/limits configurados por guidance table (no defaults genericos)?
- [ ] VPA en recommend-only mode planificado para las primeras 2 semanas?
- [ ] Karpenter (EKS) o Cluster Autoscaler configurado con consolidation policy?
- [ ] Spot instances habilitados para workloads fault-tolerant?
- [ ] Node autoscaler scale-down configurado (no solo scale-up)?

S3 (SERVICE MESH):
- [ ] Overhead de mesh cuantificado (MB/pod * num_pods)?
- [ ] Si overhead > 10% del cluster: mesh realmente justificado?

S4 (SERVERLESS):
- [ ] Break-even point calculado para cada funcion (serverless vs container)?
- [ ] Provisioned concurrency justificado (es significativamente mas caro)?
- [ ] Timeout configurado (nunca max default)?

S5 (MULTI-CLOUD):
- [ ] Costo de abstraction layers cuantificado?
- [ ] Data egress fees considerados en diseno multi-cloud?
- [ ] Cross-region data transfer minimizado?

S6 (FINOPS):
- [ ] OpenCost o equivalente planificado desde dia uno?
- [ ] Label strategy definida (team, service, env, cost-center)?
- [ ] Budget alerts configurados per namespace?
- [ ] Anomaly detection habilitado (>20% daily spike)?
- [ ] Unit economics definidos (costo/usuario, costo/transaccion)?

REGLA: Si mas de 3 checkboxes estan sin marcar, el diseno tiene un gap de FinOps.
Remediar ANTES de entregar la arquitectura final.

NUNCA incluir precios exactos — solo magnitudes, porcentajes y ordenes de magnitud.
```

---

## 5. Cloud-Native Complexity Budget (Presupuesto de Complejidad)

**Proposito:** Cada decision cloud-native agrega complejidad operacional. Este metaprompt fuerza a cuantificar la complejidad acumulada y validar que el equipo puede manejarla.

```
Asigna un "complexity token" (1-3) a cada decision de arquitectura:

| Decision | Complexity Tokens | Requiere |
|----------|------------------|----------|
| Managed K8s (EKS/GKE/AKS) | 1 | Equipo con K8s basico |
| Self-managed K8s | 3 | Equipo con K8s avanzado + ops dedicado |
| GitOps (ArgoCD) | 1 | Training en GitOps |
| Service mesh (Istio/Linkerd) | 2 | Equipo plataforma dedicado |
| Service mesh (Cilium eBPF) | 1 | Ya usando Cilium como CNI |
| Serverless (Lambda/CF) | 1 | Entender cold starts y limits |
| Multi-cloud activo | 3 | Equipo ops doble, abstraction layers |
| KEDA autoscaling | 1 | Config de triggers |
| Karpenter | 1 | AWS-specific knowledge |
| FinOps tooling (OpenCost) | 1 | Setup inicial |
| Custom operators | 2 | Go development + K8s API knowledge |

CALCULO:
- Sumar tokens de todas las decisiones del diseno
- Dividir por numero de personas en equipo ops/platform

RATIO = total_tokens / equipo_ops

INTERPRETACION:
- Ratio < 2: Complejidad manejable. Proceder.
- Ratio 2-4: Complejidad alta. Considerar simplificar o agregar personas.
- Ratio > 4: Complejidad insostenible. El equipo va a sufrir.
  ACCION: Eliminar las decisiones de mayor complejidad que no sean criticas.
  Priorizar managed services sobre self-managed.

Si un equipo de 3 personas tiene ratio > 4: recomendar managed K8s + skip mesh +
cloud managed services + serverless donde posible. Revisitar complejidad
cuando el equipo crezca.

Documentar el complexity budget como parte del trade-off matrix del entregable.
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
