# Observability Design — Body of Knowledge

## Core Concepts
- **Three Pillars of Observability**: Logs (discrete events), Metrics (aggregated measurements), Traces (request flow across services).
- **SLI (Service Level Indicator)**: A quantitative measure of service behavior (e.g., request latency at p99).
- **SLO (Service Level Objective)**: A target value for an SLI (e.g., p99 latency < 200ms for 99.9% of requests).
- **Error Budget**: The allowed amount of unreliability (100% - SLO). When exhausted, freeze feature work and focus on reliability.
- **Distributed Trace**: A tree of spans representing the path of a single request through multiple services.
- **Context Propagation**: Passing trace context (trace_id, span_id, baggage) across service boundaries via headers (W3C Trace Context).
- **RED Method**: Rate (requests/sec), Errors (failed requests/sec), Duration (latency distribution) — for request-driven services.
- **USE Method**: Utilization, Saturation, Errors — for resource monitoring (CPU, memory, disk, network).

## Patterns & Practices
- **Structured Logging**: JSON-formatted log entries with consistent fields enabling machine parsing and aggregation.
- **Log Correlation**: Including trace_id and span_id in every log entry to navigate from logs to traces and back.
- **Tail-Based Sampling**: Decide whether to keep a trace after it completes, based on attributes like errors or high latency.
- **Golden Signals**: Latency, traffic, errors, saturation — the four signals that matter most for any service.
- **Exemplars**: Links from a metric data point to a specific trace, enabling drill-down from dashboards to trace detail.
- **Service Dependency Maps**: Auto-generated topology maps from trace data showing service-to-service communication patterns.

## Tools & Technologies
- **OpenTelemetry**: Vendor-neutral framework for instrumentation, collection, and export of telemetry data.
- **Grafana Stack (Loki + Prometheus + Tempo)**: Open-source observability stack for logs, metrics, and traces.
- **Datadog**: Commercial APM platform with integrated logs, metrics, traces, and profiling.
- **Jaeger / Zipkin**: Open-source distributed tracing backends.
- **Prometheus**: Time-series database for metrics with PromQL query language and AlertManager.
- **ELK Stack (Elasticsearch + Logstash + Kibana)**: Log aggregation, search, and visualization platform.
- **PagerDuty / OpsGenie**: Incident management platforms with escalation policies and on-call scheduling.

## References
- Google SRE Book — "Monitoring Distributed Systems" and "Service Level Objectives" chapters.
- Majors, C. et al., "Observability Engineering" (O'Reilly, 2022).
- OpenTelemetry Documentation — https://opentelemetry.io/docs/
- Sridharan, C., "Distributed Systems Observability" (O'Reilly, 2018).
