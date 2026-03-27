# Incident Analyzer — Body of Knowledge

## Core Concepts
- **Blameless culture**: Incidents are system failures, not individual failures. The goal is to understand what conditions made the failure possible, not who pressed the wrong button
- **Swiss cheese model**: Incidents occur when multiple defensive layers each have a hole, and the holes align. Prevention means adding layers and shrinking holes, not finding the "one cause"
- **Contributing factors over root cause**: The term "root cause" implies a single point of failure. Real incidents have triggering causes, enabling conditions, escalation factors, and recovery friction — all must be addressed
- **MTTR over MTBF**: Mean Time To Recovery is more actionable than Mean Time Between Failures. Systems will fail; the question is how fast you detect, respond, and recover
- **Incident severity classification**: SEV1 (customer-facing outage), SEV2 (significant degradation), SEV3 (internal impact), SEV4 (near-miss). Near-misses are the most valuable to analyze because they reveal holes before alignment
- **Hindsight bias**: After an incident, the failure path looks obvious. During the incident, responders operated with partial information under time pressure. Analysis must account for what was knowable at each moment
- **Prevention hierarchy**: Eliminate > Detect earlier > Reduce blast radius > Speed recovery. Each level down is less effective but often more practical

## Patterns & Practices
- **Timeline-first analysis**: Reconstruct the complete timeline before drawing any conclusions. Premature root cause identification anchors analysis on the wrong factor
- **Five contributing factors**: For every incident, identify at least five contributing factors across triggering cause, enabling conditions, detection gaps, escalation factors, and recovery friction
- **Pattern matching across incidents**: Track recurring contributing factors across multiple incidents. If "missing timeout configuration" appears in 3 incidents, it is a systemic issue, not a one-off
- **Codebase archaeology**: Use `git log`, `git blame`, and deployment history to correlate code changes with incident timing. The change that triggered the incident may not be the most recent one
- **Runbook validation**: After each incident, update or create the relevant runbook. If responders had to improvise, the runbook either did not exist, was outdated, or was not discoverable
- **Chaos engineering as prevention**: Proactively inject failures (network partitions, latency, resource exhaustion) to discover contributing factors before they combine into real incidents

## Tools & Technologies
- **Incident management**: PagerDuty, OpsGenie, Incident.io, Rootly for structured incident response workflows
- **Observability stack**: Datadog, Grafana + Prometheus, New Relic, Honeycomb for metrics, traces, and logs correlation
- **Post-mortem tooling**: Jeli (incident analysis platform), Google's post-mortem template, Blameless platform
- **Git forensics**: `git log --since --until`, `git bisect` for correlating code changes with incident timing
- **Chaos engineering**: Gremlin, Chaos Monkey, Litmus, toxiproxy for controlled failure injection

## References
- "Incident Metrics in SRE" — Google SRE Workbook (TTD, TTR, TTRS measurement frameworks)
- "The Field Guide to Understanding Human Error" — Sidney Dekker (systems thinking over blame)
- "Accelerate" — Forsgren, Humble, Kim (MTTR as key software delivery performance metric)
- "Chaos Engineering" — Casey Rosenthal & Nora Jones (proactive failure discovery)
