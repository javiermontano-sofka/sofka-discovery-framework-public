---
name: sofka-observability
description: >
  Observability architecture — logging, tracing, metrics, alerting, SLO/SLI, incident response.
  Use when the user asks to "design observability", "set up monitoring", "implement tracing", "configure alerting",
  "define SLOs", "design incident response", or mentions OpenTelemetry, Prometheus, Grafana, ELK, correlation IDs, burn rate, runbooks.
model: opus
context: fork
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Observability Architecture: Instrumentation, Detection & Response

Observability architecture enables teams to understand system behavior from external outputs — logs, traces, and metrics. The skill produces comprehensive observability strategies covering the three pillars, alerting frameworks, and incident response integration that transform raw telemetry into actionable operational intelligence.

## Principio Rector

**Si no se puede observar, no se puede operar. Si no se puede operar, no existe.** Los 3 pilares (logs, metrics, traces) son el mínimo, no el máximo. SLO-based alerting reemplaza threshold alerting, y la respuesta a incidentes empieza con observabilidad — no termina ahí.

### Filosofía de Observability

1. **3 pillars are minimum.** Logs, métricas y traces son la base — no el techo. Exemplars conectan métricas con traces. Service maps conectan traces con topología. Sin las tres, hay monitoring — no observability.
2. **SLO-based alerting > threshold alerting.** Alertar cuando CPU > 80% es ruido. Alertar cuando el error budget burn rate consume 14.4x en 1 hora es acción. Las alertas sirven al negocio, no a la infraestructura.
3. **Incident response starts with observability.** Si el equipo no puede diagnosticar un incidente en <15 minutos con dashboards, traces y logs correlacionados, la arquitectura de observabilidad falló. Post-mortem retroalimenta la instrumentación.

## Inputs

The user provides a system or platform name as `$ARGUMENTS`. Parse `$1` as the **system/platform name** used throughout all output artifacts.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para instrumentation design y log architecture, HITL para SLO targets y alerting thresholds.
  - **desatendido**: Cero interrupciones. Observability architecture documentada automáticamente. Supuestos documentados.
  - **supervisado**: Autónomo con checkpoint en collector topology y alert rule design.
  - **paso-a-paso**: Confirma cada log standard, trace sampling strategy, metric naming, y alert rule.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 strategy + S4 metrics/dashboards + S5 alerting) | `técnica` (full 6 sections, default)

Before generating architecture, detect the technology context:

```
!find . -name "*.yaml" -o -name "*.yml" -o -name "docker-compose*" -o -name "*.tf" -o -name "otel*" | head -20
```

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/observability-patterns.md
```

---

## When to Use

- Designing observability strategy for new systems or platform migrations
- Implementing structured logging with correlation across services
- Adding distributed tracing to microservices or event-driven architectures
- Defining metric collection, naming conventions, and dashboard hierarchies
- Building SLO-based alerting with burn rate windows
- Integrating observability with incident response workflows
- Evaluating or consolidating existing monitoring tooling

## When NOT to Use

- Performance optimization and load testing — use performance-engineering
- Infrastructure provisioning and platform design — use infrastructure-architecture
- CI/CD pipeline design and deployment automation — use devsecops-architecture
- Application code architecture and patterns — use software-architecture

---

## Delivery Structure: 6 Sections

### S1: Observability Strategy

Define the overarching approach to system understanding through the three pillars.

**Three-pillar assessment:** Evaluate current maturity of logging, tracing, and metrics. Score each 1-5 (ad hoc -> optimized).

**OpenTelemetry (OTel) Adoption Plan:**
- SDK integration per language (auto-instrumentation for Java, Python, .NET, Node.js)
- Collector deployment (see topology below)
- Vendor-agnostic export via OTLP protocol

**OTel Collector Topology Decision:**

| Pattern | Description | When to use |
|---|---|---|
| **Agent (per-node)** | Sidecar or DaemonSet alongside each app. Lightweight, local processing. | Default starting point. Minimizes network hops. |
| **Gateway (centralized)** | Standalone service receiving from multiple agents. Heavy processing, routing. | Tail-based sampling, multi-backend routing, data enrichment. |
| **Hierarchical (Agent + Gateway)** | Agents handle local batching/filtering; Gateways handle aggregation/sampling. | Production recommendation for >10 services. |

**Critical topology rule for tail-based sampling:** Separate Agent from Gateway. All spans from the same trace must reach the same Gateway instance for correct sampling decisions. Use trace-ID-based routing (consistent hashing) at the load balancer in front of Gateways.

**Sampling strategies:**
- Head-based (decided at entry): simple, predictable cost, misses interesting traces
- Tail-based (decided after trace completes): captures slow/error traces, requires Gateway buffering
- Hybrid: head-based 10% + tail-based for errors and slow traces (recommended)

**Retention tiers:** Hot 7d (real-time query), warm 30d (aggregated), cold 90d+ (archived, compliance)

**Observability-driven development:** Instrument first, then code. Define "healthy" in telemetry before writing business logic. New features ship with dashboards and alerts as part of definition of done.

### S2: Logging Architecture

Design structured logging with aggregation, correlation, and retention management.

**Mandatory structured log fields (JSON):**
```
timestamp, level, service, traceId, spanId, message, environment, version
```

**Log Level Standards:**

| Level | Production use | Definition |
|---|---|---|
| **ERROR** | Always on | Actionable failures requiring intervention |
| **WARN** | Always on | Degraded but functioning, may need attention |
| **INFO** | Always on | Business events, request lifecycle |
| **DEBUG** | Off (enable per-service temporarily) | Development detail, never in prod by default |

**Correlation ID propagation:** Request ID generated at entry point, passed through all service calls via W3C Trace Context headers. Every log line includes traceId and spanId.

**Aggregation pipeline:** Collection agent (Vector, Fluentd) -> Processing (filtering, enrichment) -> Storage

**Storage backend decision:**
- **Elasticsearch:** Full-text search, flexible queries. Higher cost at scale.
- **Loki:** Label-indexed, cheaper at scale, Grafana-native. No full-text search.
- **CloudWatch/Cloud Logging:** Managed, no ops. Limited query power.

**Sensitive data:** PII masking at collection layer (Vector transforms, Fluentd filters). Never log credentials, tokens, or full credit card numbers.

**Retention:** ERROR 90d, WARN 30d, INFO 30d, DEBUG 7d (non-prod only)

### S3: Distributed Tracing

Implement trace propagation, span design, and cross-signal correlation.

**Trace propagation:** W3C Trace Context headers across HTTP, gRPC metadata, message queue headers (Kafka record headers, AMQP properties)

**Span design:** One span per logical operation:
- HTTP handler (server span)
- Database query (client span)
- Cache lookup (client span)
- Queue publish/consume (producer/consumer span)
- External API call (client span)

**Span attributes:** Operation name, status code, error flag, custom business attributes (order ID, tenant ID)

**Sampling strategy:**
- 100% for errors (always capture)
- 100% for traces exceeding p95 latency threshold
- 1-10% probabilistic for normal success traces
- Tail-based sampling at Gateway Collector for slow/error traces

**Exemplars — Metrics-to-Traces Linking:**
Exemplars attach a trace/span reference to a specific metric data point. Configure both OTel metric and trace SDKs; record metrics within an active span context. This enables clicking from a latency spike on a dashboard directly to the offending trace — the critical bridge between "what is happening" (metrics) and "why" (traces). Enable exemplars in Prometheus (--enable-feature=exemplar-storage) and Grafana (exemplar data source configuration).

**Service map:** Auto-generate topology from trace data. Review weekly for unexpected dependencies.

**Storage:** Tempo (Grafana-native, cost-efficient), Jaeger (mature, Elasticsearch/Cassandra backend), X-Ray (AWS native)

### S4: Metrics & Dashboards

Define metric types, naming conventions, collection methods, and dashboard hierarchy.

**Metric types:** Counters (requests total), Gauges (active connections), Histograms (latency distribution)

**Naming convention:** `<service>_<component>_<metric>_<unit>` (e.g., `api_http_request_duration_seconds`)

**Framework methods:**
- **RED (for services):** Rate, Errors, Duration — every service gets these three
- **USE (for resources):** Utilization, Saturation, Errors — for CPU, memory, disk, network

**Dashboard hierarchy:**
1. **Executive:** SLO status across all services (green/yellow/red), error budget remaining
2. **Service:** RED metrics per service, dependency health, deployment markers
3. **Component:** USE metrics per resource, GC, connection pools, queue depths

**Log-Based Metrics:** Derive counters and gauges from structured logs without separate instrumentation. Extract ERROR counts per service per minute, parse latency from request logs. Tools: Loki recording rules, Vector transforms, CloudWatch Metric Filters. Useful for legacy systems that only emit logs.

**Cardinality Management:**

| Problem | Solution |
|---|---|
| URL paths with IDs (`/users/123`) | Normalize to `/users/{id}` |
| User/request IDs as labels | Remove; use trace correlation instead |
| Unbounded enum labels | Allowlist known values, bucket rest as "other" |
| Per-pod metrics in large clusters | Aggregate to service level, drill down on demand |

**Default OTel cardinality limit:** 2000 unique time series per metric (configurable via View API). Cardinality explosion is the primary driver of unpredictable observability costs. Enforce per-service observability budgets (e.g., max 5000 active series per service). Use delta temporality for high-cardinality counters.

**Dashboard-as-code:** Grafana dashboards in JSON/Jsonnet, version-controlled. Deploy with Terraform or grizzly.

### S5: Alerting Framework

Build SLO-based alerting with burn rate windows, severity levels, and runbook integration.

**Alert Fatigue Prevention — Error Budget Burn Rate Model (Google SRE):**

| Alert type | Burn rate | Long window | Short window | Action |
|---|---|---|---|---|
| **Fast burn** | 14.4x | 1 hour | 5 minutes | Page immediately (P1) |
| **Medium burn** | 6x | 6 hours | 30 minutes | Page during hours (P2) |
| **Slow burn** | 1x | 3 days | 6 hours | Create ticket (P3) |

This dual-window approach reduces false positives while maintaining sensitivity. Alert only when error budget burn rate is sustained — eliminates transient noise.

**Severity Levels:**

| Severity | Criteria | Response | Notification |
|---|---|---|---|
| **P1** | Customer-visible impact, SLO breach imminent | Page immediately, 15min response | PagerDuty/OpsGenie |
| **P2** | Degraded performance, no SLO breach yet | Page during business hours | Slack + on-call |
| **P3** | Anomaly, potential future issue | Next business day ticket | Email + Jira |

**Alert hygiene:**
- Review noisy alerts monthly. Target: >80% of pages result in action taken.
- Track alert-to-incident ratio. If <50%, alerts are too noisy.
- Retire stale alerts quarterly.
- Suppress during maintenance windows.
- Aggregate related alerts (group by service + error type).

**Runbook linkage:** Every alert MUST link to a runbook with: diagnostic steps, likely root causes, remediation actions, escalation path. No alert without a runbook.

### S6: Incident Response Integration

Connect observability to incident management with on-call, classification, and post-mortem feedback.

**On-call:** Rotation schedules (weekly), follow-the-sun for distributed teams, primary + secondary
**Classification:** Severity matrix (impact x urgency), auto-suggest severity from SLO data

**Incident timeline:** Auto-generated from:
- Alert timestamps
- Recent deployments (deploy markers on dashboards)
- Config changes
- Related alerts across services

**Post-mortem template:** Timeline, impact (users affected, duration, error budget consumed), root cause, contributing factors, action items with owners and deadlines

**Feedback loops:** Post-mortem actions feed into:
- Alert rule improvements (fewer false positives)
- Runbook updates (faster resolution next time)
- Architecture changes (eliminate root cause class)
- SLO adjustments (if targets were unrealistic)

**Blameless culture:** Focus on system failures, not individual mistakes. Mandatory post-mortems for P1, optional for P2.

---

## Observability Tool Comparison

| Capability | Grafana Stack (OSS) | Datadog | New Relic | Honeycomb |
|---|---|---|---|---|
| **Metrics** | Prometheus/Mimir | Built-in | Built-in | Limited (traces-first) |
| **Logs** | Loki | Built-in | Built-in | Limited |
| **Traces** | Tempo | Built-in | Built-in | Core strength |
| **Exemplars** | Native | Supported | Supported | Native |
| **High-cardinality exploration** | Limited | Good | Good | Excellent |
| **Cost model** | Infra + ops | Per-host + ingestion | Per-GB ingested | Per-event |
| **Vendor lock-in** | None (OTel native) | Medium | Medium | Low (OTel) |
| **Best for** | Platform teams, cost-conscious, full control | Full-stack teams, fast setup | Legacy + modern mixed | Debugging complex distributed systems |

**Selection criteria:** <20 services and no platform team -> managed (Datadog/New Relic). Platform engineering team present -> Grafana stack. Complex distributed debugging priority -> Honeycomb. Always use OTel SDK regardless of backend for portability.

---

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Full trace sampling** | Complete visibility | High storage cost, processing overhead | Debugging, low-traffic, compliance |
| **Tail-based sampling** | Captures slow/error reliably | Collector buffering, added latency | High-traffic, anomaly focus |
| **Managed platform** | Fast setup, unified UI | Vendor lock-in, cost at scale | Small-medium teams, rapid value |
| **Open-source stack** | No lock-in, full control | Ops burden, integration work | Large teams with platform capacity |
| **SLO-based alerting** | Reduced noise, business-aligned | Requires SLO definition discipline | Mature teams with defined service levels |

---

## Assumptions

- Services can be instrumented (source access or sidecar injection available)
- Network allows telemetry collection (firewall rules, egress for cloud collectors)
- Team has on-call rotation or is willing to establish one
- Budget exists for observability tooling (storage, compute, licensing)

## Limits

- Does not design application architecture
- Does not perform load testing or capacity planning
- Does not implement security monitoring or SIEM
- Observability data quality depends on instrumentation discipline across all teams
- Cost estimates are directional; actual costs depend on data volumes and retention

---

## Edge Cases

**Greenfield System:** Instrument from day one. Embed OTel SDK in service templates. Define logging and tracing standards before first deployment.

**Legacy Monolith:** Start with infrastructure metrics and access logs. Add structured logging incrementally. Use APM agents for automatic instrumentation. Trace boundaries at external calls.

**Serverless / FaaS:** Cold starts complicate tracing. Use OTel Lambda layers or vendor-native tracing (X-Ray, Cloud Trace). Push metrics (no scrape endpoint). Log to stdout with structured format.

**Multi-Cloud or Hybrid:** Normalize telemetry with OTel. Centralized Gateway Collector aggregating across clouds. Standardize naming conventions regardless of provider.

**High-Cardinality Environments:** Microservices with many endpoints and tenants. Use label allowlists, drop unused labels at collection, enforce per-service series budgets.

---

## Validation Gate

Before finalizing delivery, verify:

- [ ] All three pillars covered with specific tooling and OTel Collector topology defined
- [ ] Exemplars configured linking metrics to traces
- [ ] Log levels have clear definitions with production defaults
- [ ] Trace sampling strategy balances cost and visibility (hybrid recommended)
- [ ] Metric naming follows consistent conventions with cardinality limits enforced
- [ ] Dashboard hierarchy exists (executive SLO, service RED, component USE)
- [ ] Alerts use SLO-based burn rate with multi-window configuration
- [ ] Alert-to-runbook linkage is mandatory (no alert without runbook)
- [ ] Alert fatigue metrics tracked (>80% pages result in action)
- [ ] Incident response connects alerts -> on-call -> post-mortem -> improvement loop

---

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | ✅ | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `A-01_Observability_Architecture.html` — Executive summary, three-pillar strategy, OTel Collector topology, logging standards, tracing design, metric taxonomy, alerting framework, incident response integration.

**Secondary:** OTel Collector configuration (agent + gateway), Grafana dashboard JSON, burn rate alert rules, runbook templates, post-mortem template.

---
**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026
