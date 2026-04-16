---
name: incident-analyzer
author: JM Labs (Javier Montaño)
description: >
  Post-incident analysis, timeline reconstruction, contributing factor identification, and prevention recommendations.
  Trigger: analyze incident, post-mortem, outage review, incident timeline, blameless review.
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Incident Analyzer

Structured post-incident analysis that reconstructs timelines, identifies contributing factors, and produces actionable prevention recommendations.

## Guiding Principle

> *Incidents are not caused by people — they are caused by systems that make failure easy and recovery hard. Blame the system, fix the system.*

## Procedure

### Step 1 — Timeline Reconstruction

Build a chronological timeline from all available sources:

| Timestamp | Event | Source | Actor |
|-----------|-------|--------|-------|
| T-0 | Trigger event | {logs, monitoring, deploy history} | {system/human} |
| T+N | Detection | {alert, user report, dashboard} | {system/human} |
| T+N | Response actions | {runbook, ad-hoc} | {responder} |
| T+N | Resolution | {fix deployed, config changed} | {responder} |
| T+N | Recovery confirmed | {metrics normalized} | {system} |

Key metrics to extract:
- **Time to detect (TTD)**: Trigger to first alert or human awareness
- **Time to respond (TTR)**: Detection to first meaningful action
- **Time to resolve (TTRS)**: Detection to resolution
- **Time to recover (TTRV)**: Resolution to full recovery (metrics at baseline)

### Step 2 — Contributing Factor Analysis

Identify all factors that contributed to the incident. Never identify a single root cause — incidents are multi-causal:

1. **Triggering cause**: The immediate event that started the incident
2. **Enabling conditions**: Pre-existing conditions that made the trigger possible
3. **Escalation factors**: Conditions that made the incident worse once started
4. **Detection gaps**: Why was the incident not caught earlier?
5. **Recovery friction**: What made resolution slower than it should have been?

### Step 3 — Codebase Correlation

Search the codebase for evidence related to the incident:

1. Recent changes to affected components (`git log --since` on relevant paths)
2. Missing safeguards (rate limits, circuit breakers, timeouts, retry budgets)
3. Similar patterns elsewhere that could produce the same type of failure
4. Test coverage gaps in the failure path
5. Configuration that contributed (hardcoded values, missing environment variables, stale feature flags)

### Step 4 — Prevention Recommendations

For each contributing factor, propose a specific preventive action:

| Factor | Prevention | Type | Effort |
|--------|-----------|------|--------|
| {contributing factor} | {specific action} | {code/config/process/monitoring} | {T-shirt size} |

Categorize preventions:
- **Eliminate**: Remove the possibility entirely (best)
- **Detect earlier**: Add monitoring/alerting to catch before customer impact
- **Reduce blast radius**: Contain failure through circuit breakers, feature flags, graceful degradation
- **Speed recovery**: Improve runbooks, automate rollback, add health checks

## Quality Criteria

- Timeline has timestamps (even approximate) for every significant event
- Contributing factors are structural (system conditions), not personal (blame)
- Every finding has evidence classification (`[HECHO]`, `[INFERENCIA]`, `[SUPUESTO]`)
- Prevention recommendations are specific and actionable (not "improve monitoring")
- Similar patterns in the codebase identified (not just the specific failure point)

## Anti-Patterns

- Identifying a single "root cause" when incidents are multi-causal
- Blaming individuals instead of analyzing system conditions
- Recommendations that are too vague ("be more careful", "add more tests")
- Ignoring the detection and recovery timeline (only analyzing the cause)
- Failing to search for similar patterns elsewhere in the codebase
