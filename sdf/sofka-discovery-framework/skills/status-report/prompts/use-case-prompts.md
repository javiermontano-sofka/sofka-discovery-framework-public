# Use Case Prompts — Status Report Generation

> Ready-to-use prompts for status reporting scenarios.

---

## 1. Weekly Status Report (Standard)

**When:** Regular weekly reporting cadence.

```
Generate weekly status report for {PROJECT_NAME}.

Context:
- Reporting period: {PERIOD} (e.g., 2026-W11)
- Project type: {TIPO_PROYECTO}
- Audience: {AUDIENCE} (team|management|steering|client)
- Key accomplishments this week: {ACCOMPLISHMENTS}
- Blockers/issues: {BLOCKERS}
- Upcoming milestones: {MILESTONES}

Deliver:
1. RAG dashboard (overall + per dimension)
2. Accomplishments list (outcomes, not activities)
3. Upcoming activities for next period
4. Top 3 risks with P*I and mitigation status
5. Decisions needed with owners and deadlines

Parameters:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 2. Sprint Review Report

**When:** End of sprint, for sprint review and stakeholder communication.

```
Generate Sprint {SPRINT_NUMBER} report for {PROJECT_NAME}.

Context:
- Sprint goal: {GOAL}
- Planned points: {PLANNED}
- Completed points: {COMPLETED}
- Carry-over items: {CARRYOVER}
- Team velocity (last 3 sprints): {VELOCITY}
- Retrospective highlights: {RETRO}

Deliver:
1. Sprint goal achievement assessment (Yes/Partial/No)
2. Velocity chart with trend
3. Completed stories with acceptance status
4. Carry-over analysis with root causes
5. Sprint N+1 preview

Parameters:
- {TIPO_PROYECTO}: Agile
- {MODO}: piloto-auto
```

---

## 3. Executive Status for Steering Committee

**When:** Steering committee meeting preparation.

```
Generate executive status report for steering committee review of {PROJECT_NAME}.

Context:
- Last steering review date: {LAST_REVIEW}
- Current phase: {PHASE}
- Budget status: {BUDGET_STATUS}
- Schedule status: {SCHEDULE_STATUS}
- Critical risks: {RISKS}
- Decisions needed from steering: {DECISIONS}

Deliver:
1. One-page executive summary with RAG
2. Budget vs baseline comparison
3. Schedule vs baseline with critical path status
4. Top 5 risks requiring steering attention
5. Decision requests with options and recommendations

Parameters:
- {AUDIENCE}: steering
- {MODO}: supervisado
```

---

## 4. Recovery Project Status

**When:** Reporting on a troubled project under recovery.

```
Generate recovery status report for {PROJECT_NAME}.

Context:
- Recovery plan start date: {START}
- Recovery milestones: {MILESTONES}
- Stabilization metrics: {METRICS}
- Root cause resolution status: {ROOT_CAUSES}
- Team morale indicators: {MORALE}

Deliver:
1. Recovery RAG (separate from project RAG)
2. Recovery milestone tracker
3. Root cause resolution progress
4. Stabilization indicators trend
5. Team health assessment

Parameters:
- {TIPO_PROYECTO}: Recovery
- {MODO}: supervisado
```

---

*PMO-APEX v1.0 — Use Case Prompts · Status Report Generation*
