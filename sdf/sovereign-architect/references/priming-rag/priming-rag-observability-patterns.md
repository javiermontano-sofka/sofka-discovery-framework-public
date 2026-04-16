# Observability Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Observability enables teams to understand system behavior from external outputs without modifying the system. The three pillars — logs, metrics, and traces — provide complementary views into system health, performance, and failure modes. Modern observability extends to profiling, error tracking, and SLO-based alerting. This document covers implementation patterns, tooling selection, and operational practices for architects building observable systems.

## Core Patterns

### Structured Logging

**Principle**: Logs are data, not text. Every log entry is a structured JSON object with consistent fields: timestamp, level, message, service, trace_id, span_id, user_id, and context-specific fields. Structured logs enable querying, aggregation, and correlation across services.

**Log levels**: ERROR (action required, system degradation), WARN (unexpected but handled, investigate if frequent), INFO (significant business events — user login, order placed, payment processed), DEBUG (developer diagnostics, disabled in production).

**Correlation**: Every log entry includes `trace_id` and `span_id` from distributed tracing context. This links logs to traces and enables reconstructing a request's journey across services with a single query.

**Log aggregation stack**: ELK (Elasticsearch, Logstash, Kibana) — mature, flexible, self-hosted. Loki (Grafana) — log aggregation without full-text indexing, label-based queries, cost-effective. Cloud-native: CloudWatch Logs (AWS), Cloud Logging (GCP), Datadog Logs.

**Retention strategy**: Hot storage (7-14 days, full query capability), warm (30-90 days, reduced query performance), cold/archive (1+ year, compliance, S3/GCS). Define retention per log level — DEBUG logs may need only 3 days; audit logs may need 7 years.

### Metrics (Prometheus Model)

**Metric types**: Counter (monotonically increasing — requests total, errors total), Gauge (point-in-time value — active connections, queue depth, temperature), Histogram (distribution of values — request duration, response size), Summary (client-side quantile calculation — similar to histogram but computed on the client).

**Naming convention**: `{namespace}_{subsystem}_{name}_{unit}` — e.g., `http_server_request_duration_seconds`, `db_connection_pool_active_connections`. Always include units in the name.

**RED method (for services)**: Rate (requests per second), Errors (error rate), Duration (latency distribution). Every service endpoint should expose these three metric types.

**USE method (for resources)**: Utilization (% time busy), Saturation (queue depth), Errors (error count). Apply to CPU, memory, disk, network, connection pools.

**Prometheus stack**: Prometheus (scrape-based metrics collection), Grafana (visualization), Alertmanager (alert routing). Prometheus scrapes `/metrics` endpoints at configured intervals. Service discovery via Kubernetes, Consul, or static config. Thanos or Cortex for long-term storage and multi-cluster federation.

**Alternative stacks**: Datadog (SaaS, all-in-one), InfluxDB + Telegraf (time-series native), Victoria Metrics (Prometheus-compatible, better performance at scale), OpenTelemetry Collector with any backend.

### Distributed Tracing

**Concept**: A trace represents a complete request journey through a distributed system. Each trace contains spans — named, timed operations with parent-child relationships. Spans carry attributes (key-value metadata), events (timestamped annotations), and status.

**OpenTelemetry**: The industry standard for instrumentation. Vendor-neutral SDKs for all major languages. Auto-instrumentation for common frameworks (Express, Spring, Django, gRPC) captures spans without code changes. Manual instrumentation for business-specific spans.

**Trace context propagation**: W3C Trace Context standard (`traceparent` header) propagates trace ID across service boundaries. All HTTP clients, message producers, and gRPC clients must propagate context. OpenTelemetry SDKs handle this automatically for instrumented libraries.

**Backends**: Jaeger (open source, Kubernetes-native, supports Elasticsearch and Cassandra storage), Tempo (Grafana, object storage backend, cost-effective), Zipkin (lightweight, simple), cloud-managed (AWS X-Ray, GCP Cloud Trace, Datadog APM).

**Sampling strategies**: Head-based sampling (decide at trace start — simple, may miss interesting traces), tail-based sampling (decide after trace completes — captures errors and high-latency traces, requires collector buffering). Production systems at scale need sampling — 100% trace capture is prohibitively expensive. Start with 10% head-based, add tail-based rules for errors and slow requests.

### Alerting Strategy

**SLO-based alerting**: Define Service Level Objectives (SLOs) — e.g., 99.9% of requests complete in < 500ms over 30 days. Alert on error budget burn rate, not on individual threshold breaches. Multi-window multi-burn-rate alerts reduce noise: fast burn (2% budget consumed in 1 hour) pages immediately; slow burn (10% consumed in 3 days) creates a ticket.

**Alert quality**: Every alert must be actionable — if the responder cannot take a specific action, the alert should not exist. Include runbook link, dashboard link, and expected impact in alert annotations. Target: < 5 pages per on-call shift, < 10% false positive rate.

**Escalation tiers**: P1 (customer-facing outage, page immediately), P2 (degraded service, page during business hours), P3 (internal impact, ticket), P4 (informational, dashboard only). Define clear criteria for each tier.

**Alert routing**: PagerDuty, Opsgenie, or Grafana OnCall for on-call management. Route by service ownership. Alertmanager grouping and inhibition rules prevent alert storms — group related alerts, inhibit downstream alerts when upstream is firing.

### Error Tracking

**Dedicated error tracking**: Sentry, Bugsnag, or Rollbar. Captures stack traces, user context, breadcrumbs (events leading to error), and environment metadata. Groups similar errors automatically. Tracks error frequency, regression detection, and release correlation.

**Integration with observability**: Error tracking tools link to traces (via trace_id), logs, and deploys. Sentry release tracking correlates errors with specific deployments, enabling rapid identification of regression sources.

**Source maps**: Upload source maps to error tracking service for readable stack traces in minified/transpiled code. Keep source maps private — do not serve them to clients.

## Decision Framework

| Need | Open Source | SaaS | When to Choose |
|------|------------|------|----------------|
| Logs | Loki + Grafana | Datadog Logs | Loki: cost-sensitive. Datadog: ease of use |
| Metrics | Prometheus + Grafana | Datadog Metrics | Prometheus: Kubernetes-native. Datadog: multi-signal |
| Traces | Jaeger / Tempo | Datadog APM | Tempo: Grafana ecosystem. Datadog: correlation |
| Errors | Sentry (self-hosted) | Sentry SaaS | Self-hosted: data residency. SaaS: simplicity |
| All-in-one | Grafana Stack (LGTM) | Datadog / New Relic | Grafana: open, composable. SaaS: operational simplicity |

## Anti-Patterns

- **Alert fatigue**: Too many alerts, most non-actionable. Responders ignore all alerts including critical ones. Cure: SLO-based alerting, ruthless alert pruning, require runbooks for every alert.
- **Log-only observability**: Relying exclusively on logs without metrics or traces. Searching logs to understand latency distribution is slow and unreliable. Metrics for trends, traces for individual request diagnosis, logs for context.
- **Unstructured logs**: Free-text log messages that require regex parsing. `console.log("User " + userId + " logged in")` is unsearchable at scale. Use structured logging from day one.
- **Missing correlation IDs**: Logs, metrics, and traces exist but cannot be correlated. Without trace_id in logs and exemplars in metrics, debugging requires manual timeline reconstruction.

## Evidence Signals

- OpenTelemetry SDK in dependencies (`@opentelemetry/sdk-node`, `opentelemetry-sdk` for Python) indicates instrumentation.
- `/metrics` endpoint returning Prometheus format indicates metrics exposure.
- `OTEL_EXPORTER_*` environment variables indicate trace/metric export configuration.
- Grafana dashboards in `grafana/` or `dashboards/` directories indicate visualization maturity.
- Alert rules in `alertmanager.yml`, Terraform alert resources, or Datadog monitor definitions indicate alerting strategy.
- Structured logging library in dependencies (winston, pino, structlog, zerolog, serilog) indicates logging maturity.

---
*Sovereign Architect RAG Priming · JM Labs*
