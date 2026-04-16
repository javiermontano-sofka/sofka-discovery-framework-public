# Use Case Prompts — Risk Register & Identification

> Ready-to-use prompts for the most frequent risk identification scenarios.
> Each prompt includes context for when to use it and variable parameters.

---

## 1. New Project Risk Identification (Standard)

**When:** Project initiation, after charter and WBS are approved.

```
Create a comprehensive risk register for {PROJECT_NAME}.

Context:
- Project type: {TIPO_PROYECTO} (Agile|Waterfall|SAFe|Kanban|Hybrid)
- Industry: {INDUSTRY} (banking, retail, health, SaaS, manufacturing, gov, energy)
- Team size: {TEAM_SIZE}
- Duration: {DURATION}
- Budget magnitude: {BUDGET} (FTE-months, NOT currency)
- Key integrations: {INTEGRATIONS}
- Known constraints: {CONSTRAINTS}

Deliver:
1. Risk register with ≥20 risks using ≥3 identification techniques
2. RBS diagram (Mermaid) showing risk distribution by category
3. P×I heat map with color coding (Red ≥0.36, Amber ≥0.15, Green <0.05)
4. Top 10 risks summary for executive briefing
5. Identification log documenting techniques used and participants

Parameters:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 2. Recovery Project — Forensic Risk Identification

**When:** Rescuing a troubled project that has no existing risk register.

```
Conduct forensic risk identification for troubled project {PROJECT_NAME}.

Context:
- Current status: {STATUS} (red/amber, behind schedule, over budget, scope creep)
- Known issues: {ISSUES}
- Previous failures: {FAILURES}
- Stakeholder trust level: {TRUST} (low/medium/high)
- Remaining budget: {REMAINING}
- Original vs current deadline: {ORIGINAL} → {CURRENT}

Deliver:
1. Forensic analysis: risks that have already materialized (from issue logs, change requests)
2. Forward-looking risk register for remaining project scope
3. Root cause analysis (Ishikawa) of top 3 materialized risks
4. Recovery risk profile: what could go wrong in the rescue attempt itself
5. Recommendation: continue/pivot/cancel with risk-based justification

Parameters:
- {MODO}: supervisado (confirm forensic findings before forward register)
- {TIPO_PROYECTO}: Recovery
```

---

## 3. Portfolio-Level Risk Aggregation

**When:** PMO needs consolidated risk view across multiple projects.

```
Aggregate risks across the following projects for portfolio-level visibility:
{PROJECT_LIST}

Deliver:
1. Cross-project risk correlation matrix (which risks cascade)
2. Portfolio heat map showing cumulative exposure by category
3. Shared resource risks (same person/team across projects)
4. Systemic risks (affect all projects: regulatory, market, technology)
5. Portfolio risk score with trend indicator

Parameters:
- {TIPO_PROYECTO}: Portfolio
- {MODO}: piloto-auto
```

---

## 4. Sprint Risk Review (Agile)

**When:** Sprint planning or mid-sprint risk check for agile teams.

```
Quick risk review for sprint {SPRINT_NUMBER} of {PROJECT_NAME}.

Context:
- Sprint goal: {SPRINT_GOAL}
- Velocity (last 3 sprints): {VELOCITY}
- Current blockers: {BLOCKERS}
- Team changes: {CHANGES}

Deliver:
1. Sprint-specific risks (≤10, focused on sprint goal)
2. Updated risk backlog items (risk stories for this sprint)
3. Risk burndown update (total P×I exposure trend)
4. Recommended risk responses executable within sprint

Parameters:
- {TIPO_PROYECTO}: Agile
- {MODO}: desatendido (quick, no interruptions)
```

---

## 5. SAFe PI Planning Risk Workshop

**When:** During PI Planning event, risk identification for the upcoming Program Increment.

```
Facilitate PI Planning risk identification for ART {ART_NAME}, PI {PI_NUMBER}.

Context:
- PI objectives: {PI_OBJECTIVES}
- Number of teams: {TEAM_COUNT}
- Key features: {FEATURES}
- Known dependencies: {DEPENDENCIES}
- Previous PI risks that materialized: {PREVIOUS_RISKS}

Deliver:
1. Program-level risk register with ROAM classification
2. Risk board (visual, suitable for PI Planning room display)
3. Cross-team dependency risks highlighted
4. Confidence vote correlation (low confidence → risk investigation)
5. Risk owners assigned per team/RTE

Parameters:
- {TIPO_PROYECTO}: SAFe
- {MODO}: supervisado (confirm ROAM classifications with RTE)
```

---

*PMO-APEX v1.0 — Use Case Prompts · Risk Register & Identification*
