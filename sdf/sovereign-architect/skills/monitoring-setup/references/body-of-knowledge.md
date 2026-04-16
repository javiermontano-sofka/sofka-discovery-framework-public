# Monitoring Setup — Body of Knowledge

## Core Concepts
- **SLI (Service Level Indicator)**: A quantitative measure of service behavior — latency, error rate, availability, throughput.
- **SLO (Service Level Objective)**: A target value for an SLI over a time window — e.g., "99.9% availability over 30 days."
- **Error Budget**: The acceptable amount of unreliability — (1 - SLO) expressed as allowed downtime or errors.
- **RED Method**: Rate, Errors, Duration — the three golden signals for request-driven services.
- **USE Method**: Utilization, Saturation, Errors — the three dimensions for infrastructure resources.
- **Burn Rate**: How fast the error budget is being consumed — fast burn (outage) vs. slow burn (degradation).
- **Alert Fatigue**: When too many non-actionable alerts cause responders to ignore or delay response to real incidents.
- **Observability Pillars**: Metrics (what happened), Logs (why it happened), Traces (where it happened).

## Patterns & Practices
- **Multi-Window Multi-Burn-Rate Alerts**: Alert on error budget consumption rate across different time windows for balanced sensitivity.
- **Dashboard Hierarchy**: Overview (executives) → Service (team leads) → Component (engineers) → Debug (incident response).
- **Alert Runbook Linking**: Every alert includes a link to a runbook with diagnostic steps and remediation procedures.
- **SLO-Based Alerting**: Alert when error budget burn rate indicates the SLO will be breached, not on arbitrary thresholds.
- **Symptom-Based Alerting**: Alert on user-facing symptoms (errors, latency) rather than internal causes (CPU, memory).
- **Chaos-Driven Monitoring Validation**: Use chaos engineering to verify that monitoring detects real failure modes.

## Tools & Technologies
- **Metrics**: Prometheus, Datadog, New Relic, CloudWatch, Grafana Mimir.
- **Dashboards**: Grafana, Datadog Dashboards, Kibana, Chronograf.
- **Alerting**: PagerDuty, Opsgenie, Grafana Alerting, Datadog Monitors.
- **SLO Tracking**: Nobl9, Sloth (Prometheus-based), Datadog SLO widgets.
- **Log Aggregation**: ELK Stack, Loki, Splunk, Datadog Logs.
- **Distributed Tracing**: Jaeger, Zipkin, Datadog APM, Honeycomb.

## References
- Google SRE Book — Chapters on monitoring, alerting, and SLOs.
- Betsy Beyer et al., "The Site Reliability Workbook" — Practical SLO implementation.
- Cindy Sridharan, "Distributed Systems Observability" — Modern observability patterns.
- Tom Wilkie, "The RED Method" — grafana.com/blog for service monitoring.
