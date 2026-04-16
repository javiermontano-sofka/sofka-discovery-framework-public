---
name: observability-architecture
author: JM Labs (Javier Montaño)
description: >
  Logging architecture, distributed tracing, metrics design, alerting strategy,
  SLO/SLI definition, and incident response procedures. Trigger: "observability",
  "logging", "tracing", "metrics", "alerting", "SLO", "SLI", "incident response".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Observability Architecture

Design observability systems: structured logging, distributed tracing, metrics collection, alerting strategies, SLO/SLI frameworks, and incident response procedures.

## Guiding Principle
> *"Observability is the ability to understand internal system state from external outputs — not just knowing something is broken, but understanding why."*

## Procedure

### Step 1 — Three Pillars Design
1. Design structured logging: format (JSON), fields (trace_id, service, level, context), sampling
2. Design distributed tracing: instrumentation strategy, context propagation, sampling rate
3. Design metrics collection: RED (Rate, Errors, Duration) for services, USE (Utilization, Saturation, Errors) for resources
4. Define correlation strategy: linking logs, traces, and metrics via trace_id and span_id
5. Select observability backend: Prometheus + Grafana, Datadog, or OpenTelemetry Collector

### Step 2 — SLO/SLI Framework
1. Identify critical user journeys for SLI measurement
2. Define SLIs per journey: availability, latency, correctness, freshness
3. Set SLO targets: e.g., 99.9% of requests complete in <500ms over 30-day window
4. Calculate error budgets and burn rate alerting thresholds
5. Design SLO dashboards showing budget consumption rate and trend

### Step 3 — Alerting Strategy
1. Define alerting tiers: P1 (page), P2 (ticket), P3 (log review), P4 (informational)
2. Design alert routing: on-call schedules, escalation paths, team ownership
3. Implement symptom-based alerting (SLO burn rate) instead of cause-based
4. Define alert quality metrics: signal-to-noise ratio, MTTA, time-to-acknowledge
5. Establish alert review cadence: weekly review of noisy/ineffective alerts

### Step 4 — Incident Response
1. Define incident severity levels with clear criteria and examples
2. Design incident workflow: detection, triage, mitigation, resolution, postmortem
3. Implement runbook automation for common incident types
4. Design postmortem process: blameless, action-item tracking, pattern analysis
5. Build incident metrics dashboard: MTTD, MTTA, MTTR, incident frequency

## Quality Criteria
- Every service emits structured logs, traces, and RED metrics
- SLOs defined for all critical user journeys with error budget tracking
- Alert signal-to-noise ratio >80% (alerts that lead to action)
- Postmortem completed for every P1/P2 incident within 5 business days

## Anti-Patterns
- Logging everything at DEBUG level in production (cost and noise)
- Alerting on every metric threshold instead of SLO burn rate
- Tracing at 100% sample rate in high-throughput systems (cost explosion)
- Postmortems that assign blame instead of improving systems
