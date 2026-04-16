# Use Case Prompts — Agile Maturity Assessment

> Ready-to-use prompts for the most frequent agile assessment scenarios.

---

## 1. Single Team Assessment (Standard)

**When:** A specific team wants to understand their agile maturity and improve.

```
Assess agile maturity for team {TEAM_NAME} in project {PROJECT_NAME}.

Context:
- Framework: {FRAMEWORK} (Scrum|Kanban|XP|Hybrid)
- Team size: {SIZE}
- Sprints completed: {SPRINTS}
- Current velocity: {VELOCITY}
- Known challenges: {CHALLENGES}

Deliver:
1. 6-dimension maturity scorecard (1-5 with behavioral evidence)
2. Maturity radar chart (Mermaid) with current vs target
3. Anti-pattern catalog with ≥3 identified patterns
4. Gap analysis per dimension with root cause
5. Improvement roadmap (3 horizons: 30/60/90 days)

Parameters:
- {TIPO_PROYECTO}: Agile
- {MODO}: supervisado
```

---

## 2. Organization-Wide Agile Audit

**When:** PMO or leadership needs a consolidated view across all teams.

```
Conduct organization-wide agile maturity audit for {ORG_NAME}.

Context:
- Number of teams: {TEAM_COUNT}
- Agile adoption tenure: {YEARS} years
- Frameworks in use: {FRAMEWORKS}
- Previous coaching investments: {INVESTMENTS}
- Strategic goal: {GOAL} (scaling|optimizing|baseline)

Deliver:
1. Team-by-team scorecard matrix (6 dimensions × N teams)
2. Organizational heat map showing maturity distribution
3. Cross-team anti-pattern analysis (systemic vs team-specific)
4. Investment recommendation (coaching, tooling, restructuring)
5. Benchmark against industry averages (State of Agile data)

Parameters:
- {TIPO_PROYECTO}: PMO
- {MODO}: piloto-auto
```

---

## 3. Pre-SAFe Readiness Assessment

**When:** Organization considering SAFe adoption needs to assess team-level agile readiness.

```
Assess agile readiness for SAFe adoption in {ORG_NAME}.

Context:
- Target SAFe configuration: {CONFIG} (Essential|Large Solution|Portfolio|Full)
- Current team count: {TEAMS}
- Highest current maturity dimension: {HIGHEST}
- Lowest current maturity dimension: {LOWEST}

Deliver:
1. SAFe readiness scorecard (prerequisites by zone)
2. Gap analysis: current state vs SAFe minimum requirements
3. Risk register for SAFe adoption (top 10 risks)
4. Recommended ART composition based on team topology
5. Investment estimate (FTE-months for coaching, training, tooling)

Parameters:
- {TIPO_PROYECTO}: Transformation
- {MODO}: supervisado
```

---

## 4. Post-Transformation Progress Check

**When:** Reassessing agile maturity 6-12 months after a transformation initiative.

```
Reassess agile maturity for {ORG_NAME} — progress check at {MONTHS} months.

Context:
- Previous assessment date: {PREV_DATE}
- Previous scores: {PREV_SCORES}
- Interventions applied: {INTERVENTIONS}
- Budget consumed: {BUDGET_CONSUMED}

Deliver:
1. Delta analysis: current vs previous scores per dimension
2. ROI of agile transformation investments
3. Stalled dimensions with root cause analysis
4. Updated improvement roadmap for next 6 months
5. Recommendation: continue/accelerate/pivot/pause

Parameters:
- {TIPO_PROYECTO}: Transformation
- {MODO}: supervisado
```

---

*PMO-APEX v1.0 — Use Case Prompts · Agile Maturity Assessment*
