# Observability Architecture — Body of Knowledge

## Core Concepts
- **Three Pillars**: Logs (events), metrics (aggregated measurements), traces (request path through distributed systems)
- **SLI (Service Level Indicator)**: A quantitative measure of service behavior (e.g., latency p99, error rate)
- **SLO (Service Level Objective)**: Target value for an SLI over a time window (e.g., 99.9% availability over 30 days)
- **Error Budget**: The allowed amount of SLO violation before action is required (100% - SLO target)
- **Burn Rate Alerting**: Alerting based on how fast the error budget is being consumed rather than threshold breaches
- **OpenTelemetry**: Vendor-neutral standard for collecting and exporting observability data (traces, metrics, logs)
- **Structured Logging**: Logging in machine-parseable formats (JSON) with consistent fields for filtering and correlation

## Patterns
- **RED Method**: Rate, Errors, Duration — the essential metrics for every service
- **USE Method**: Utilization, Saturation, Errors — the essential metrics for every resource
- **Context Propagation**: Passing trace context (trace_id, span_id) across service boundaries via headers
- **Log Aggregation**: Centralized log collection with indexing for search, filter, and correlation
- **On-Call Rotation**: Rotating responsibility for incident response with clear escalation paths

## Tools & Frameworks
- **OpenTelemetry**: SDK and Collector for traces, metrics, and logs collection
- **Prometheus / Grafana**: Metrics collection, storage, and visualization
- **Jaeger / Tempo / Zipkin**: Distributed tracing backends
- **Loki / Elasticsearch**: Log aggregation and search engines
- **PagerDuty / OpsGenie**: Incident management and on-call scheduling
- **Grafana Mimir / Thanos**: Long-term metrics storage with global querying

## References
- Charity Majors, Liz Fong-Jones, George Miranda — *Observability Engineering* (2022)
- Betsy Beyer et al. — *Site Reliability Engineering* (2016) — SLO and alerting chapters
- Alex Hidalgo — *Implementing Service Level Objectives* (2020)
- Google SRE Workbook — Practical SLO implementation guide
