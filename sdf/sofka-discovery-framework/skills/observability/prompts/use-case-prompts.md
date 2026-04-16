# Use Case Prompts — Observability Architecture

> Prompts listos para usar en los casos de uso mas frecuentes de esta skill.
> Cada prompt incluye contexto de cuando usarlo y parametros variables.

---

## 1. Observability Strategy Design

**Cuando:** Inicio de proyecto greenfield o plataforma sin observabilidad definida. El equipo necesita una estrategia integral de observabilidad antes de instrumentar.

```
Disenar estrategia de observabilidad para {SISTEMA} en {CLOUD_PROVIDER}.

Contexto:
- Arquitectura: {ARQUITECTURA} (ej: microservicios, monolito, event-driven, serverless)
- Numero de servicios: {NUM_SERVICIOS}
- Lenguajes principales: {LENGUAJES} (ej: Java, Python, Node.js, .NET, Go)
- Observabilidad actual: {ESTADO_ACTUAL} (ej: ninguna, solo logs basicos, APM parcial)
- Equipo de plataforma: {EQUIPO_PLATFORM} (existe / no existe / en formacion)
- Presupuesto para tooling: {PRESUPUESTO_MAGNITUD} (bajo / moderado / alto)

Requisitos:
- Evaluacion de madurez de los tres pilares (logs, metricas, traces) — score 1-5
- Plan de adopcion de OpenTelemetry (SDK + Collector)
- Collector topology decision (agent vs gateway vs hierarchical)
- Sampling strategy (head-based vs tail-based vs hybrid)
- Tool selection decision matrix (managed vs open-source)
- Retention tiers (hot, warm, cold)
- Observability-driven development guidelines para equipos

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Entregar S1 (Observability Strategy) completo.
Incluir diagrama Mermaid de OTel Collector topology.
```

---

## 2. OpenTelemetry Migration

**Cuando:** El equipo tiene instrumentacion existente (Prometheus client, Jaeger SDK, vendor-specific agents) y quiere migrar a OpenTelemetry para unificacion y vendor-agnostic.

```
Disenar plan de migracion a OpenTelemetry para {SISTEMA}.

Contexto:
- Instrumentacion actual: {INSTRUMENTACION} (ej: Prometheus client libs, Jaeger SDK, Datadog Agent, New Relic Agent)
- Backends actuales: {BACKENDS} (ej: Prometheus + Grafana, Datadog, ELK Stack, Splunk)
- Numero de servicios a migrar: {NUM_SERVICIOS}
- Lenguajes: {LENGUAJES}
- Constraint: {CONSTRAINT} (ej: zero downtime, migracion incremental, deadline)

Planificar:
1. Assessment de instrumentacion actual — que se puede reemplazar con OTel auto-instrumentation
2. OTel SDK rollout strategy — servicio por servicio vs. big bang
3. OTel Collector deployment — coexistencia con agents actuales durante transicion
4. Backend compatibility — OTel Collector exporters para backends existentes
5. Semantic Conventions mapping — naming actual vs OTel conventions
6. Testing strategy — validar que telemetria OTel cubre lo que ya existia
7. Rollback plan — si OTel introduce regresion en telemetria
8. Timeline realista con milestones

Parametros:
- {MODO}: supervisado (confirmar cada fase antes de avanzar)
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: instrumentacion

Entregar plan de migracion con timeline, risks, y rollback strategy.
```

---

## 3. SLO Framework Setup

**Cuando:** El equipo quiere transicionar de threshold-based alerting a SLO-based alerting. Necesita definir SLIs, establecer SLO targets, y configurar burn rate alerting.

```
Definir framework de SLOs para {SISTEMA}.

Contexto:
- Servicios criticos: {SERVICIOS_CRITICOS} (lista de servicios con SLAs de negocio)
- SLAs contractuales: {SLAS} (ej: 99.9% availability, p95 < 500ms)
- Alerting actual: {ALERTING_ACTUAL} (ej: threshold-based, CPU > 80%, error rate > 5%)
- Alert fatigue: {FATIGUE_LEVEL} (bajo / medio / alto — cuantas alerts/semana que no requieren accion)
- Herramientas: {HERRAMIENTAS} (ej: Prometheus + Alertmanager, Datadog, PagerDuty)

Disenar:
1. SLI specification — que metricas representan la experiencia del usuario
   - Availability SLI: successful requests / total requests
   - Latency SLI: requests faster than threshold / total requests
   - Quality SLI: correct responses / total responses
2. SLO targets — basados en SLAs contractuales con margen interno
3. Error budget calculation — cuanto fallo se permite por ventana
4. Burn rate alert rules — multi-window (14.4x/1h, 6x/6h, 1x/3d)
5. Severity mapping — burn rate -> P1/P2/P3
6. Error budget policy — que pasa cuando se agota (feature freeze? reliability sprint?)
7. SLO dashboard — visualizacion de error budget remaining por servicio
8. Review cadence — revision semanal de SLO compliance

Parametros:
- {MODO}: supervisado (confirmar SLO targets antes de generar alert rules)
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: alertas

Entregar S5 (Alerting Framework) completo con burn rate rules en formato Prometheus/PromQL.
Incluir S4 (SLO dashboard specification).
```

---

## 4. Alerting Strategy & Hygiene

**Cuando:** El equipo sufre de alert fatigue — demasiadas alertas, pocas accionables. Necesita reestructurar alerting para reducir ruido y mejorar respuesta.

```
Redisenar estrategia de alertas para {SISTEMA}.

Contexto:
- Alertas activas: {NUM_ALERTAS}
- Alertas por semana: {ALERTAS_SEMANA}
- % de alertas accionables: {PCT_ACCIONABLES}% (target: >80%)
- On-call burnout: {BURNOUT_LEVEL} (bajo / medio / alto)
- Herramientas: {HERRAMIENTAS} (ej: Prometheus Alertmanager, PagerDuty, Slack)
- Runbooks existentes: {RUNBOOKS} (si / no / parciales)

Analizar y recomendar:
1. Alert audit — clasificar cada alerta: accionable / informativa / ruido
2. Consolidation — agrupar alertas relacionadas (misma causa raiz)
3. Severity re-classification — P1/P2/P3 basado en impacto real al usuario
4. Routing optimization — P1 a PagerDuty, P2 a Slack on-call, P3 a ticket
5. Suppression rules — maintenance windows, known issues, flapping detection
6. Runbook creation — runbook mandatorio para cada alerta retenida
7. Alert hygiene cadence — revision mensual, retiro de alertas stale
8. Metricas de salud de alerting:
   - Alert-to-incident ratio (target: >50%)
   - Pages-to-action ratio (target: >80%)
   - MTTA (Mean Time To Acknowledge)
   - False positive rate (target: <20%)

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: alertas

Entregar S5 (Alerting Framework) con audit results y alert redesign.
Incluir template de runbook para las top 5 alertas mas frecuentes.
```

---

## 5. Distributed Tracing Implementation

**Cuando:** El equipo necesita implementar tracing distribuido para diagnosticar latencia y errores en un sistema de microservicios o event-driven.

```
Implementar distributed tracing para {SISTEMA}.

Contexto:
- Arquitectura: {ARQUITECTURA} (microservicios / event-driven / hibrida)
- Protocolos de comunicacion: {PROTOCOLOS} (HTTP/REST, gRPC, Kafka, RabbitMQ, SQS)
- Lenguajes: {LENGUAJES}
- Tracing actual: {TRACING_ACTUAL} (ninguno / parcial / vendor-specific)
- Numero de servicios: {NUM_SERVICIOS}
- Transacciones por segundo (pico): {TPS}
- Presupuesto de storage para traces: {STORAGE_MAGNITUD} (bajo / moderado / alto)

Disenar:
1. Trace propagation — W3C Trace Context para HTTP/gRPC, headers para message queues
2. Span architecture — span por operacion logica (HTTP handler, DB query, cache, queue)
3. Span attributes — operation name, status, error flag, business attributes
4. Sampling strategy con calculo de volumen:
   - 100% para errores (always capture)
   - 100% para traces > p95 latency
   - {SAMPLE_RATE}% probabilistic para exitos
   - Tail-based para anomalias
5. OTel Collector topology para tracing (gateway con trace-ID routing para tail-based)
6. Exemplars — linkage metricas-traces en Prometheus/Grafana
7. Service map — auto-generacion desde trace data
8. Storage backend decision (Tempo vs Jaeger vs X-Ray)

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: instrumentacion

Entregar S3 (Distributed Tracing) completo con Mermaid sequence diagram.
Incluir S1 (Collector topology para tail-based sampling) como complemento.
```

---

## 6. Logging Standardization

**Cuando:** Los logs del sistema son inconsistentes (formato libre, sin correlation IDs, sin niveles estandarizados). Necesita estandarizar logging across todos los servicios.

```
Estandarizar logging para {SISTEMA}.

Contexto:
- Formato de logs actual: {FORMATO_LOGS} (ej: texto libre, semi-estructurado, mixto)
- Correlation IDs: {CORRELATION} (existen / no existen / parciales)
- Log storage actual: {STORAGE} (ej: archivos locales, CloudWatch, ELK, Loki)
- Volumen de logs: {VOLUMEN} (GB/dia estimado)
- PII en logs: {PII} (si / no / desconocido)
- Regulaciones: {REGULACIONES} (ej: GDPR, PCI-DSS, HIPAA)

Disenar:
1. Structured log standard — campos mandatorios JSON
   (timestamp, level, service, traceId, spanId, message, environment, version)
2. Log level definitions — ERROR, WARN, INFO, DEBUG con criterios claros
3. Correlation ID propagation — traceId en cada log line
4. PII handling — masking rules at collection layer
5. Aggregation pipeline — collection agent -> processing -> storage
6. Storage backend selection (Elasticsearch vs Loki vs CloudWatch)
7. Retention policy por nivel (ERROR 90d, WARN 30d, INFO 30d, DEBUG 7d)
8. Log-based metrics — derivar counters/gauges de logs estructurados
9. Migration plan — como migrar servicios incrementalmente

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: instrumentacion

Entregar S2 (Logging Architecture) completo.
Incluir ejemplo de log entry estandarizado y pipeline diagram.
```

---

## 7. Incident Response Integration

**Cuando:** El equipo tiene observabilidad pero no un proceso formal de incident response. Los incidentes se manejan ad-hoc sin post-mortems ni mejora continua.

```
Integrar observabilidad con incident response para {ORGANIZACION}.

Contexto:
- On-call actual: {ONCALL} (existe / no existe / informal)
- Post-mortems: {POSTMORTEMS} (se hacen / no se hacen / inconsistentes)
- MTTR actual: {MTTR} (minutos / horas / desconocido)
- Herramientas de observabilidad: {HERRAMIENTAS_OBS}
- Herramientas de incident mgmt: {HERRAMIENTAS_INC} (ej: PagerDuty, OpsGenie, manual)
- Cultura de blame: {BLAME} (blameless / mixta / blame-heavy)

Disenar:
1. On-call rotation — weekly, primary + secondary, follow-the-sun si aplica
2. Severity classification — impact x urgency matrix
3. Escalation paths — P1: page immediately, P2: business hours, P3: ticket
4. Incident timeline automation — correlacionar alerts + deploys + config changes
5. Communication protocol — stakeholder updates, status page
6. Post-mortem framework — timeline, impact, root cause, action items with owners
7. Feedback loops — post-mortem -> alert improvements -> runbook updates -> architecture changes
8. Blameless culture — mandatory for P1, optional for P2
9. Incident metrics — MTTA, MTTR, incidents/month, recurring incidents

Parametros:
- {MODO}: supervisado
- {FORMATO}: markdown

Entregar S6 (Incident Response Integration) completo.
Incluir post-mortem template y on-call rotation guidelines.
```

---

**Autor:** Javier Montaño | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
