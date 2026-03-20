# Metaprompts — Event Architecture

> Estrategias de meta-nivel para maximizar la efectividad de esta skill.
> Los metaprompts no producen entregables — optimizan COMO se producen.

---

## 1. Failure Cascade Analysis (Analisis de Cascada de Fallos)

**Proposito:** Antes de finalizar cualquier diseno event-driven, recorrer sistematicamente los modos de fallo para validar que la arquitectura los sobrevive sin perdida de datos ni cascading failures.

```
Para cada flujo de eventos critico del diseno, aplica este analisis:

FLUJO: {nombre} (ej: "Order Fulfillment", "Payment Processing")

NIVEL 1 — Fallo de productor:
- Que pasa si el productor crashea DESPUES de escribir en DB pero ANTES de publicar el evento?
  - Outbox pattern implementado? (atomicidad DB + evento)
  - Si no hay outbox: hay riesgo de inconsistencia? (dato guardado, evento perdido)
- Que pasa si el productor publica duplicados? (retry sin idempotence key)
  - Los consumidores son idempotentes? Tienen dedup table?

NIVEL 2 — Fallo de broker:
- Que pasa si una particion/queue no esta disponible?
  - Replication factor >= 3? min.insync.replicas >= 2?
  - Producer con acks=all? (o acepta data loss con acks=1?)
- Que pasa si el broker completo esta down por 5 minutos?
  - Producer tiene buffer local? (Kafka producer tiene buffer, pero tamaño?)
  - Consumer reanuda desde ultimo offset commiteado? (at-least-once garantizado?)

NIVEL 3 — Fallo de consumidor:
- Que pasa si un consumidor crashea a mitad del procesamiento?
  - Offset commit strategy: manual after processing (recommended) o auto-commit?
  - Si auto-commit: posible data loss (offset avanzado, evento no procesado)
- Que pasa si el consumidor esta lento (lag creciente)?
  - Alertas de lag configuradas? (threshold warning/critical)
  - Auto-scaling de consumers posible? (max = num partitions)
- Que pasa si el consumidor no puede procesar un evento especifico?
  - Retry con backoff? Max retries antes de DLT?
  - DLT monitoring y proceso de remediacion?

NIVEL 4 — Fallo de schema:
- Que pasa si un productor publica un evento con schema incompatible?
  - Schema registry valida en publish-time? (recommended)
  - O falla en consume-time? (peor — evento ya en el topic)
  - Compatibilidad BACKWARD enforced en CI? (schema-diff en PR)

NIVEL 5 — Fallo de saga:
- Que pasa si un paso del saga falla despues de que pasos anteriores se completaron?
  - Compensaciones definidas para CADA paso?
  - Compensaciones son idempotentes? (se pueden reintentar?)
  - Que pasa si la compensacion misma falla? (manual intervention, alerting)
  - Timeout strategy: cuanto espera antes de compensar? (no infinity)

Para cada nivel:
1. Probabilidad (rara / baja / media / alta)
2. Impacto (bajo / medio / alto / catastrofico)
3. Mitigacion implementada
4. Mitigacion pendiente (gap)

Si algun nivel tiene impacto "catastrofico" sin mitigacion: BLOCKER.
Si el outbox pattern no esta implementado para flujos criticos: BLOCKER.
```

---

## 2. Event Granularity Decision (Decision de Granularidad de Eventos)

**Proposito:** Para cada evento del catalogo, decidir si debe ser thin (notification), fat (state transfer), o delta, basado en criterios medibles — no en preferencia.

```
Para cada evento del catalogo, evalua la granularidad optima:

EVENTO: {Domain}.{Entity}.{Action}
PRODUCTOR: {servicio}
CONSUMIDORES: {lista de consumidores conocidos}

CRITERIO 1 — Acoplamiento vs autonomia:
- Los consumidores tienen acceso al API del productor para fetch de datos?
  - Si: thin event viable (consumer llama API para detalles)
  - No: fat event necesario (consumer no puede callback)
- El productor esta disponible cuando el consumidor procesa? (async = no garantizado)
  - Si: thin event ok
  - No: fat event para self-contained processing

CRITERIO 2 — Latencia:
- El consumer necesita procesar en <100ms?
  - Si: fat event (evita round-trip al API del productor)
  - No: thin event + API callback aceptable
- El API callback agrega latencia inaceptable? (network hop, auth, rate limiting)

CRITERIO 3 — Bandwidth:
- Payload size del fat event: {KB}
- Volume de eventos por segundo: {N}
- Throughput total: {MB/s}
- Storage impact con retention de {N} dias: {GB}
- Si throughput > broker capacity: thin event + selective fetch

CRITERIO 4 — Schema evolution:
- Cuantos campos cambian frecuentemente?
  - Si muchos: thin event reduce breaking change surface
  - Si pocos/estables: fat event es manejable
- Num de consumidores: {N}
  - A mas consumidores, mas costo de schema change coordination

DECISION MATRIX:
| Criterio | Thin (notification) | Fat (state transfer) | Delta |
|----------|--------------------|--------------------|-------|
| C1       | API accesible      | API no accesible   | Consumer mantiene estado local |
| C2       | Latencia tolerable | Latencia critica   | Latencia critica + bandwidth limitado |
| C3       | Alto volumen       | Bajo-medio volumen | Alto volumen + bandwidth limitado |
| C4       | Schema volatile    | Schema estable     | Schema estable + cambios parciales |

DECISION: {granularidad} porque {justificacion}.
Documentar como parte del event catalog entry.

Regla de oro: empezar thin, engordar solo cuando los consumidores demuestran necesidad de datos embebidos.
```

---

## 3. Consistency Pattern Selection (Seleccion de Patron de Consistencia)

**Proposito:** Cuando un flujo de negocio requiere coordinacion entre multiples servicios, seleccionar el patron de consistencia correcto basado en la complejidad real del flujo — no en la complejidad percibida.

```
Para cada flujo de negocio que cruza boundaries de servicio, evalua:

FLUJO: {nombre}
SERVICIOS INVOLUCRADOS: {lista}
CRITICIDAD DE NEGOCIO: {financiera / operacional / informacional}

PASO 1 — Necesita coordinacion distribuida?
- Es un query que lee de multiples servicios? → API composition, NO saga
- Es una escritura que afecta multiples servicios? → Continuar evaluacion
- Es una notificacion sin necesidad de rollback? → Publish event, NO saga

PASO 2 — Cuantos servicios modifica?
- 1 servicio: no necesita saga (single service transaction)
- 2 servicios: choreography simple (evento + compensacion)
- 3-4 servicios: evaluar orchestration vs choreography
- 5+ servicios: orchestration obligatorio (choreography es inmanejable)

PASO 3 — Requiere visibilidad del flujo?
- Si (compliance, auditoria, debugging): orchestration (estado centralizado)
- No (flujo simple, desacoplamiento prioritario): choreography

PASO 4 — Errores parciales:
- Compensacion es automatizable? (reverse DB write, cancel API call)
  - Si: saga viable
  - No: requiere manual intervention + alerting (saga + human-in-the-loop)
- La compensacion tiene efectos externos irreversibles? (email enviado, pago procesado)
  - Si: window of compensation limitado, diseno defensivo

SCORING:
| Factor | Choreography | Orchestration | Distributed TX (avoid) |
|--------|-------------|---------------|----------------------|
| Servicios: 2 | Recomendado | Overkill | Evitar |
| Servicios: 3-4 | Posible | Recomendado | Evitar |
| Servicios: 5+ | No viable | Obligatorio | Evitar |
| Compliance | No | Recomendado | Posible |
| Debugging | Dificil | Facil | Facil |
| Acoplamiento | Bajo | Medio | Alto |

DECISION: {patron} porque {justificacion}.
IMPORTANTE: distributed transactions (2PC) solo se consideran si el broker/DB lo soporta nativamente Y la latencia es aceptable. En la vasta mayoria de los casos, saga es la respuesta correcta.
```

---

## 4. Broker Selection Framework (Framework de Seleccion de Broker)

**Proposito:** Cuando se necesita seleccionar un message broker, aplicar un framework sistematico que evite bias por familiaridad y se base en requisitos reales.

```
Para la seleccion del message broker, evaluar contra estos criterios:

REQUISITOS DEL SISTEMA:
- Throughput requerido: {msgs/seg}
- Latency target: {ms} p99
- Event replay necesario: {si / no}
- Ordering guarantee: {global / per-entity / none}
- Multi-tenancy: {si / no}
- Geo-replication: {si / no}
- Team ops capacity: {alta / media / baja}

EVALUACION:

| Criterio | Apache Kafka | RabbitMQ | Apache Pulsar | Cloud-native (SNS+SQS, etc.) |
|----------|-------------|----------|---------------|------------------------------|
| Throughput (score 1-5) | ? | ? | ? | ? |
| Latency (score 1-5) | ? | ? | ? | ? |
| Replay (score 1-5) | ? | ? | ? | ? |
| Ordering (score 1-5) | ? | ? | ? | ? |
| Multi-tenancy (score 1-5) | ? | ? | ? | ? |
| Ops simplicity (score 1-5) | ? | ? | ? | ? |
| Team familiarity (score 1-5) | ? | ? | ? | ? |
| Ecosystem/tooling (score 1-5) | ? | ? | ? | ? |
| TOTAL (/40) | ? | ? | ? | ? |

PESOS:
- Para sistemas con requisito de replay: throughput y replay pesan 2x
- Para equipos con baja ops capacity: ops simplicity pesa 2x
- Para startups/bajo presupuesto: cloud-native bonus de +5 puntos

DECISION: {broker} porque {justificacion con scores}.

Reglas:
- Si el equipo NUNCA ha operado Kafka y ops capacity es baja: cloud-native o RabbitMQ
- Si event sourcing es requisito: Kafka o Pulsar (log-based obligatorio)
- Si latencia sub-millisecond: RabbitMQ
- Si multi-tenant o geo-replication nativa: Pulsar
- Managed Kafka (Confluent Cloud, MSK) reduce ops burden significativamente
```

---

## 5. Event-Driven Readiness Assessment (Evaluacion de Preparacion Event-Driven)

**Proposito:** Antes de iniciar una migracion a event-driven o implementacion nueva, evaluar si la organizacion esta preparada en las 4 dimensiones criticas.

```
Evaluar readiness de {ORGANIZACION} para adoptar event-driven architecture:

DIMENSION 1 — Tecnica (Team capability):
- [ ] El equipo entiende eventual consistency? (no esperan consistency inmediata)
- [ ] El equipo ha trabajado con message brokers antes?
- [ ] El equipo entiende idempotency y por que es critica?
- [ ] Hay experiencia con debugging de sistemas distribuidos? (tracing, correlation)
- [ ] El equipo conoce patrones de error handling async? (retry, DLQ, circuit breaker)
Score: ?/5

DIMENSION 2 — Infraestructura:
- [ ] Hay broker desplegado o se puede provisionar?
- [ ] Monitoring y alerting soporta lag metrics, DLQ depth?
- [ ] CI/CD puede integrar schema validation?
- [ ] Distributed tracing esta implementado? (Jaeger, Zipkin, Datadog APM)
- [ ] IaC cubre configuracion de broker? (topics, partitions, retention, ACLs)
Score: ?/5

DIMENSION 3 — Organizacional:
- [ ] Los domain boundaries estan claros? (DDD bounded contexts)
- [ ] Hay ownership definido de dominios/servicios?
- [ ] Los equipos pueden deployar independientemente?
- [ ] Hay cultura de observability y incident response?
- [ ] Stakeholders entienden que eventual consistency cambia UX?
Score: ?/5

DIMENSION 4 — Gobernanza:
- [ ] Hay (o se puede crear) un event catalog?
- [ ] Hay proceso para schema review?
- [ ] Hay politica de naming conventions?
- [ ] Hay proceso para deprecar eventos?
- [ ] Hay definicion de SLAs por consumer group?
Score: ?/5

TOTAL: ?/20

Interpretacion:
- 16-20: Ready — proceder con implementacion
- 11-15: Ready with enablement — implementar con training + pairing + pilot
- 6-10: Not ready — invertir en foundations antes de event-driven
- 1-5: Significant gap — event-driven no es viable ahora

Para cada dimension con score <3:
- Gap identificado
- Accion de remediacion
- Timeline estimado
- Blocker para proceder? (si/no)
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
