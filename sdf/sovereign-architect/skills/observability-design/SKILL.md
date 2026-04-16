---
name: observability-design
author: JM Labs (Javier Montaño)
description: >
  Designs logging, metrics, and distributed tracing architectures using OpenTelemetry and observability platforms.
  Trigger: "observability design", "logging architecture", "metrics strategy", "distributed tracing", "OpenTelemetry".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Observability Design

Architects comprehensive observability systems covering the three pillars — logs, metrics, and traces — with correlation strategies, alerting rules, and dashboard design for operational excellence.

## Guiding Principle

> *"You cannot improve what you cannot observe. You cannot debug what you cannot trace."*

## Procedure

### Step 1 — Define Observability Requirements
1. Identify the key user journeys and critical business transactions to monitor.
2. Define SLIs (Service Level Indicators) for each service: latency, error rate, throughput, saturation.
3. Establish SLOs (Service Level Objectives) with error budgets.
4. Map the system topology to identify all instrumentation points.
5. Determine compliance requirements for log retention and data residency.

### Step 2 — Instrumentation Strategy
1. Select OpenTelemetry as the vendor-neutral instrumentation standard.
2. Define automatic instrumentation targets: HTTP frameworks, database clients, message brokers.
3. Identify custom instrumentation points: business events, critical decision paths, external API calls.
4. Establish context propagation rules: trace ID, span ID, baggage items across service boundaries.
5. Define sampling strategy: head-based sampling for high-throughput, tail-based sampling for error capture.

### Step 3 — Telemetry Pipeline
1. **Logs**: Structured JSON logging with standard fields (timestamp, level, service, trace_id, span_id, message).
2. **Metrics**: RED metrics (Rate, Errors, Duration) per service + USE metrics (Utilization, Saturation, Errors) per resource.
3. **Traces**: Distributed traces with spans for each service hop, database call, and external API call.
4. Design the collection pipeline: OTel Collector → processing/filtering → backend storage.
5. Specify the correlation strategy: every log entry includes trace_id and span_id for cross-pillar navigation.

### Step 4 — Dashboards & Alerting
1. Design the dashboard hierarchy: system overview → service detail → endpoint detail → trace explorer.
2. Define alert rules based on SLOs: alert when error budget burn rate exceeds threshold.
3. Establish on-call runbooks linked to each alert.
4. Specify escalation paths and notification channels (PagerDuty, Slack, email).
5. Define anomaly detection rules for proactive issue identification.

## Quality Criteria
- Every service emits correlated logs, metrics, and traces with shared context (trace_id).
- SLOs are defined for all critical user journeys with error budget tracking.
- Alert rules have a signal-to-noise ratio > 80% (fewer than 20% false positives).
- Dashboards follow the RED/USE methodology and answer "is the system healthy?" in < 30 seconds.

## Anti-Patterns
- Logging without structure (free-text logs that are impossible to parse or aggregate).
- Alert fatigue: too many alerts, too sensitive thresholds, leading to ignored notifications.
- Metrics without baselines — alerting on arbitrary thresholds instead of deviation from normal.
- Observability as an afterthought — instrumenting only after incidents, missing the context needed to debug.
