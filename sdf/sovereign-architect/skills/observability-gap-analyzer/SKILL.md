---
name: observability-gap-analyzer
author: JM Labs (Javier Montaño)
description: >
  Logging, metrics, and tracing completeness analysis across the system.
  Trigger: "observability gaps", "logging analysis", "metrics coverage", "tracing completeness".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Observability Gap Analyzer

Assess the three pillars of observability — logging, metrics, and tracing — for completeness, quality, and actionability.

## Guiding Principle

> *"You cannot debug what you cannot observe. Observability is the difference between fixing in minutes and guessing for hours."*

## Procedure

### Step 1 — Logging Assessment
1. Identify logging framework and configuration (log levels, format, destination).
2. Check for structured logging vs. unstructured string messages.
3. Verify log levels are used correctly: ERROR for failures, WARN for degradation, INFO for business events, DEBUG for troubleshooting.
4. Detect sensitive data in logs: PII, tokens, passwords.
5. Assess log coverage on critical paths: auth, payments, errors `[HECHO]`.

### Step 2 — Metrics Analysis
1. Identify metrics instrumentation: Prometheus, StatsD, CloudWatch, custom.
2. Check for RED metrics per service: Rate, Errors, Duration.
3. Check for USE metrics per resource: Utilization, Saturation, Errors.
4. Assess custom business metrics: conversion rates, queue depths, SLI-based metrics.
5. Verify alerting rules exist for critical metrics `[HECHO]`.

### Step 3 — Tracing Completeness
1. Check for distributed tracing implementation (OpenTelemetry, Jaeger, Datadog APM).
2. Verify trace context propagation across service boundaries.
3. Assess span coverage: are all significant operations instrumented?
4. Check for trace sampling strategy (100% vs. probabilistic vs. tail-based).
5. Verify correlation between traces, logs, and metrics (trace ID in logs) `[HECHO]`.

### Step 4 — Observability Gap Report
1. Score each pillar: logging (33%), metrics (33%), tracing (33%).
2. Identify blind spots: system states that cannot be diagnosed with current instrumentation.
3. Map gaps to incident scenarios: "If X fails, can we detect and diagnose it?"
4. Recommend instrumentation additions prioritized by incident impact.

## Quality Criteria
- All three pillars assessed independently `[HECHO]`
- Gaps mapped to specific incident scenarios
- Sensitive data in logs identified and flagged
- Correlation between pillars checked (trace IDs in logs, metrics linked to traces)

## Anti-Patterns
- Only checking if logging exists without assessing quality and coverage
- Ignoring metrics while focusing only on logs (logs don't scale for dashboards)
- Implementing tracing without propagating context across boundaries
- Alert fatigue: too many alerts with no prioritization or runbooks
