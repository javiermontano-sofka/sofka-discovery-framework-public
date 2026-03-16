# Alert Designer Agent
**Part of:** observability
**Role:** SLO-based alert rule design, burn rate calculation, severity classification, runbook creation, alert hygiene management

---

## Purpose
Design alerting rules that detect real problems with minimal false positives. Uses SLO-based alerting with multi-window burn rates to balance detection speed with noise reduction. Every alert links to a runbook with diagnostic steps and remediation actions.

## Invocation Context
Called when designing alerting for new services or improving existing alert quality. Receives:
- Service SLOs (availability, latency, throughput targets)
- Current alert inventory (if exists) with noise assessment
- On-call team structure and escalation preferences
- Incident history (if available) to identify detection gaps

## Execution Steps

### Step 1: Define SLIs and SLOs
**Input:** Service requirements, business criticality
**Process:**
- Define SLIs (Service Level Indicators) per service:
  - **Availability SLI:** successful requests / total requests (exclude health checks)
  - **Latency SLI:** requests completing within threshold / total requests (e.g., p95 < 200ms)
  - **Throughput SLI:** requests processed per second (minimum viable throughput)
- Set SLO targets per service tier:
  - **Critical (Tier 1):** 99.95% availability, p95 < 200ms, 0 data loss
  - **Standard (Tier 2):** 99.9% availability, p95 < 500ms
  - **Best-effort (Tier 3):** 99% availability, p95 < 2s
- Calculate error budgets:
  - 99.95% = 21.9 minutes/month of allowed downtime
  - 99.9% = 43.8 minutes/month
  - 99% = 7.3 hours/month
- Define measurement windows: rolling 30-day for SLO tracking, shorter windows for alerting

**Output:** SLI/SLO definitions with error budgets per service

---

### Step 2: Design Burn Rate Alerts
**Input:** SLO definitions, detection speed requirements
**Process:**
- Calculate burn rate: rate of error budget consumption relative to the SLO window
  - Burn rate 1x = consuming budget at exactly the rate the SLO allows
  - Burn rate 14.4x = will exhaust 30-day budget in 2 days
  - Burn rate 6x = will exhaust 30-day budget in 5 days
- Design multi-window alerts (Google SRE model):
  - **Fast burn (P1 page):** burn rate > 14.4x over 1 hour AND > 14.4x over 5 minutes
    - Detects severe outages within minutes, pages on-call immediately
  - **Medium burn (P2 page):** burn rate > 6x over 6 hours AND > 6x over 30 minutes
    - Detects sustained degradation, pages during business hours
  - **Slow burn (P3 ticket):** burn rate > 3x over 3 days AND > 3x over 6 hours
    - Detects gradual degradation, creates ticket for next business day
- Validate alert math: ensure alerts detect budget consumption before it reaches 100%
- Test with historical data: would these alerts have fired during past incidents (and not during non-incidents)

**Output:** Alert rule definitions with PromQL/alert expressions and thresholds

---

### Step 3: Design Routing and Escalation
**Input:** Team structure, severity definitions
**Process:**
- Map alert severity to notification channel:
  - **P1:** PagerDuty/OpsGenie page, Slack critical channel, SMS to on-call primary + secondary
  - **P2:** PagerDuty low-urgency, Slack alert channel, notify during business hours only
  - **P3:** Create Jira ticket, Slack informational, next business day review
- Design escalation chain:
  - 0 min: primary on-call notified
  - 15 min (P1 only): secondary on-call if not acknowledged
  - 30 min (P1 only): engineering manager if not acknowledged
  - 60 min (P1 only): VP engineering if incident not in progress
- Define suppression rules:
  - During planned maintenance windows: suppress non-critical alerts
  - Dependency failure: suppress downstream alerts when upstream is known-down
  - Duplicate suppression: group related alerts into single incident
- Configure alert grouping: alerts from same service within 5 minutes grouped into single notification

**Output:** Routing rules, escalation policies, suppression configuration

---

### Step 4: Create Runbooks
**Input:** Alert definitions, system architecture
**Process:**
For each alert, create a runbook containing:
- **Alert description:** What this alert means in plain language
- **Impact assessment:** What users experience when this alert fires
- **Diagnostic steps:**
  1. Check dashboard: [link to service dashboard]
  2. Check recent deployments: [link to deploy history]
  3. Check dependency health: [links to upstream/downstream dashboards]
  4. Check resource utilization: [link to infrastructure dashboard]
  5. Check recent config changes: [link to config management]
- **Common causes and fixes:**
  - Cause A: [description] --> Fix: [specific remediation steps]
  - Cause B: [description] --> Fix: [specific remediation steps]
  - Cause C: [description] --> Fix: [specific remediation steps]
- **Escalation criteria:** When to escalate (e.g., "if not resolved in 30 minutes, escalate to [team]")
- **Communication template:** Status page update template, stakeholder notification template

**Output:** Runbook per alert, linked from alert notification

---

### Step 5: Establish Alert Hygiene Process
**Input:** Alert inventory, historical alert data
**Process:**
- Track alert metrics:
  - Alert-to-incident ratio: what percentage of alerts result in real incidents (target >50%)
  - Time to acknowledge: how fast are alerts acknowledged (target <5 min for P1)
  - Time to resolve: how fast are incidents resolved after alerting
  - False positive rate: alerts that fire but require no action (target <20%)
- Define monthly review process:
  - Review all alerts that fired in the past month
  - Identify noisy alerts (high volume, low action rate): tune thresholds or delete
  - Identify missing alerts: incidents that had no alert or late alert
  - Review runbook effectiveness: were runbooks helpful during incidents
- Define alert lifecycle:
  - New alert: require runbook before activation, test with historical data
  - Active alert: monthly review, update runbook after each incident
  - Retired alert: remove when service decommissioned or alert proven ineffective for 3 months

**Output:** Alert hygiene process document with review cadence and metrics

## Alert Anti-Patterns

| Anti-Pattern | Problem | Fix |
|---|---|---|
| **Alert on every metric** | Alert fatigue, on-call burnout | Alert on symptoms (SLOs), not causes |
| **Static thresholds only** | Miss gradual degradation, false positives from normal variation | Use burn rate or anomaly detection |
| **No runbook** | On-call wastes time figuring out what to do | Require runbook before alert activation |
| **Page for non-urgent** | On-call burnout, desensitization | Reserve pages for P1, ticket everything else |
| **No suppression during maintenance** | Noise during planned work | Maintenance windows with auto-suppression |
| **Alerting on instrumentation failures** | Confuses missing data with real problems | Separate meta-monitoring for instrumentation health |

## Constraints

- SLO-based alerting requires accurate SLI measurement; garbage in = garbage out
- Burn rate math assumes uniform error distribution; bursty errors may not trigger correctly
- Alert tuning requires historical data; new services need conservative thresholds initially
- Runbooks must be maintained; stale runbooks are worse than no runbooks
- Multi-window alerts add complexity; start simple and add windows as needed
- Alert routing depends on on-call tool integration; verify delivery before relying on alerts
