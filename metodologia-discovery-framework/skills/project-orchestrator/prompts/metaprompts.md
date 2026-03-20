# Metaprompts — Project Orchestrator

## Meta-Strategy 1: Over-Orchestration Detection

**Purpose:** Prevent excessive coordination that slows rather than accelerates delivery

```
For any orchestration design, apply the overhead test:
1. CEREMONY LOAD — Total ceremony hours per team per sprint. If > 20% of capacity, reduce.
2. HANDOFF COUNT — Number of handoffs per work item. If > 3, redesign the flow.
3. APPROVAL BOTTLENECK — Decisions waiting > 48 hours. If frequent, delegate authority.
4. NOTIFICATION NOISE — Alerts per person per day. If > 10, filter and consolidate.
5. MEETING-TO-WORK RATIO — If teams spend more time coordinating than building, restructure.
For each finding, propose a simplification with expected throughput improvement.
```

## Meta-Strategy 2: Resilience Testing

**Purpose:** Ensure orchestration survives disruptions

```
Stress-test the orchestration model:
SCENARIO 1: Key orchestrator is unavailable for 2 weeks. Does coordination continue?
SCENARIO 2: Primary tool (Jira/Slack) has a 3-day outage. What is the fallback?
SCENARIO 3: Two teams simultaneously escalate blocking issues. How are they prioritized?
SCENARIO 4: A critical dependency is delayed by 4 sprints. How does re-orchestration happen?
For each scenario, verify the model has a response or design one.
```

## Meta-Strategy 3: Value Stream Alignment

**Purpose:** Ensure orchestration serves value delivery, not process compliance

```
Map every orchestration activity to value delivery:
For each ceremony, notification, handoff, and approval in the orchestration model:
1. What VALUE does this activity protect or enable?
2. What RISK does it mitigate?
3. What happens if we REMOVE it for 2 sprints?
Activities that cannot answer #1 or #2 are candidates for elimination.
Document findings in a value-vs-overhead matrix.
```

*PMO-APEX v1.0 — Metaprompts · Project Orchestrator*
