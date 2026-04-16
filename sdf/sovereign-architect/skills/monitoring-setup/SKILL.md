---
name: monitoring-setup
author: JM Labs (Javier Montaño)
description: >
  Designs monitoring dashboards, alerting rules, SLOs, and error budgets for production systems.
  Trigger: "monitoring setup", "dashboards", "alerts", "SLOs", "error budgets", "observability".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Monitoring Setup

Designs comprehensive monitoring strategies including dashboards, alerting rules, SLO definitions, and error budgets — turning raw metrics into actionable operational intelligence.

## Guiding Principle

> *"You cannot improve what you do not measure, and you should not alert on what you cannot act upon."*

## Procedure

### Step 1 — Define Service Level Objectives
1. Identify critical user journeys and the services that support them.
2. Define SLIs (Service Level Indicators): latency, error rate, throughput, availability.
3. Set SLO targets: e.g., "99.9% of requests complete in under 300ms over a 30-day window."
4. Calculate error budgets: (1 - SLO) * total requests = allowable failures.
5. Define error budget policies: what happens when the budget is exhausted (feature freeze, reliability sprint).

### Step 2 — Design Dashboards
1. **System Overview Dashboard**: Service health, request rate, error rate, latency percentiles (p50, p95, p99).
2. **Business Metrics Dashboard**: Revenue-impacting metrics, conversion rates, feature adoption.
3. **Infrastructure Dashboard**: CPU, memory, disk, network, pod count, node health.
4. **Deployment Dashboard**: Deploy frequency, rollback count, change failure rate, lead time.
5. Follow the USE method (Utilization, Saturation, Errors) for infrastructure and RED method (Rate, Errors, Duration) for services.

### Step 3 — Configure Alerting Rules
1. Alert on symptoms (error rate, latency) not causes (CPU, memory) — unless causes predict imminent failure.
2. Define severity levels: PAGE (wake someone up), TICKET (fix in business hours), LOG (informational).
3. Set appropriate thresholds with burn-rate alerts (fast burn vs. slow burn against error budget).
4. Configure alert routing: on-call rotation, escalation paths, notification channels.
5. Include runbook links in every alert so responders know what to do.

### Step 4 — Operationalize and Iterate
1. Establish on-call rotation with clear responsibilities and escalation.
2. Schedule quarterly SLO reviews to adjust targets based on data.
3. Track alert noise: if an alert fires and requires no action, it should be tuned or removed.
4. Conduct post-incident reviews that feed back into monitoring improvements.
5. Document all dashboards, alerts, and SLOs in an operational catalog.

## Quality Criteria
- Every SLO has a corresponding SLI, dashboard panel, and alert.
- Alerts include runbook links and are classified by severity.
- Error budgets are tracked and have defined exhaustion policies.
- Dashboard load time is under 5 seconds with 30 days of data.

## Anti-Patterns
- Alerting on every metric without considering actionability (alert fatigue).
- Setting SLOs at 100% (impossible and prevents all change).
- Dashboards with 50 panels that no one reads.
- Monitoring infrastructure but not user experience.
