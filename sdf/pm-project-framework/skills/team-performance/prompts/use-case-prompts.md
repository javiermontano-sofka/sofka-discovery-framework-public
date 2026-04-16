# Use Case Prompts — Team Performance & Health Tracking

> Ready-to-use prompts for team performance assessment scenarios.

---

## 1. Sprint-Over-Sprint Performance Analysis

**When:** After 5+ sprints of data, analyze performance trends.

```
Analyze team performance for {TEAM_NAME} over the last {SPRINT_COUNT} sprints.

Context:
- Velocity data: {VELOCITY_DATA}
- Predictability data: {PREDICTABILITY_DATA}
- Team composition changes: {CHANGES}
- Quality metrics: {QUALITY_DATA}

Deliver:
1. Velocity trend chart with analysis
2. Predictability trend (% commitment delivered)
3. Quality metrics trend (defect density, rework rate)
4. Root cause analysis for any declining metrics
5. Improvement recommendations with expected impact

Parameters:
- {TIPO_PROYECTO}: Agile
- {MODO}: piloto-auto
```

---

## 2. Team Health Check Facilitation

**When:** Monthly or quarterly team health assessment.

```
Facilitate team health check for {TEAM_NAME}.

Context:
- Team size: {SIZE}
- Team maturity: {MATURITY} (Forming/Storming/Norming/Performing)
- Previous health check results: {PREVIOUS_RESULTS}
- Known concerns: {CONCERNS}

Deliver:
1. Health check results across 11 dimensions
2. Trend comparison with previous assessment
3. Root cause analysis for Red/Amber dimensions
4. Improvement action plan (max 3 actions)
5. Next health check schedule

Parameters:
- {MODO}: supervisado
- {FORMATO}: markdown
```

---

## 3. Burnout Risk Assessment

**When:** Team showing signs of stress or declining performance.

```
Assess burnout risk for {TEAM_NAME}.

Context:
- Overtime data: {OVERTIME}
- Velocity trend: {VELOCITY_TREND}
- Recent turnover: {TURNOVER}
- Team feedback: {FEEDBACK}
- Current workload: {WORKLOAD}

Deliver:
1. Burnout risk score per team member (anonymized)
2. Early warning signal analysis
3. Workload sustainability assessment
4. Immediate intervention recommendations
5. Long-term sustainability plan

Parameters:
- {MODO}: supervisado
- {FORMATO}: markdown
```

---

*PMO-APEX v1.0 — Use Case Prompts · Team Performance & Health Tracking*
