# Observability Gap Analyzer — Body of Knowledge

## Core Concepts
- **Three pillars of observability**: Logs (events), metrics (aggregates), traces (request flows) — each serves different debugging needs `[HECHO]`
- **Structured logging**: Key-value pairs instead of free-text strings; enables machine parsing and querying
- **RED method**: Rate, Errors, Duration — the essential metrics for any service
- **USE method**: Utilization, Saturation, Errors — the essential metrics for any resource `[HECHO]`
- **SLIs/SLOs/SLAs**: Service Level Indicators (measurements), Objectives (targets), Agreements (contracts) — the foundation of reliability management
- **Cardinality explosion**: Metrics with too many unique label values overwhelm time-series databases
- **Context propagation**: Passing trace IDs and correlation IDs across service boundaries for end-to-end visibility

## Patterns & Practices
- **Trace-log correlation**: Include trace IDs in every log entry for cross-referencing
- **Golden signals**: Latency, traffic, errors, saturation — Google's four essential service metrics
- **Tail-based sampling**: Capture 100% of error/slow traces while sampling normal traces probabilistically
- **Alert hierarchy**: Page (wake someone up) → Ticket (fix this week) → Log (investigate when convenient)
- **Runbook-linked alerts**: Every alert should link to a runbook with diagnosis and remediation steps
- **Health endpoints**: `/health`, `/ready` endpoints with dependency checks for orchestrator integration

## Tools & Technologies
- **Logging**: ELK Stack, Grafana Loki, Datadog Logs, CloudWatch Logs
- **Metrics**: Prometheus + Grafana, Datadog, New Relic, CloudWatch Metrics
- **Tracing**: OpenTelemetry, Jaeger, Zipkin, Datadog APM, AWS X-Ray
- **Unified**: Grafana Stack (Loki + Mimir + Tempo), Datadog, Elastic Observability

## References
- Google SRE Book — Chapters on monitoring and alerting
- Charity Majors — "Observability Engineering"
- OpenTelemetry documentation — Unified observability standard
- Brendan Gregg — USE Method reference
