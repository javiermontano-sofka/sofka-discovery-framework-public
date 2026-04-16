# Use Case Prompts — Steering Review

> Ready-to-use prompts for steering review scenarios.

---

## 1. Full G1.5 Mid-Pipeline Review

**When:** All Phase 1-3a deliverables complete, ready for Go/No-Go assessment.

```
Conduct a full steering review (G1.5) for {PROJECT_NAME}.

Context:
- Project type: {TIPO_PROYECTO}
- Deliverables available: {DELIVERABLES_LIST}
- Key concerns: {CONCERNS}
- Sponsor: {SPONSOR}
- Timeline pressure: {TIMELINE_PRESSURE}

Deliver:
1. Evidence package summary (deliverables reviewed)
2. 7 individual advisor assessments
3. Vote compilation (Go/Conditional-Go/No-Go per advisor)
4. Conditions for Go (if Conditional-Go)
5. Steering minutes with decision and next steps

Parameters:
- {MODO}: supervisado
- {FORMATO}: markdown
```

---

## 2. Lightweight Steering (3 Advisors)

**When:** Small project or early-stage gate review.

```
Conduct lightweight steering review for {PROJECT_NAME}.

Context:
- Project size: {SIZE} (small/medium)
- Gate: {GATE} (G1|G1.5|G2)
- Available deliverables: {DELIVERABLES}
- Advisors: Strategy, Risk, Delivery (3-advisor model)

Deliver:
1. 3 advisor assessments
2. Vote compilation
3. Conditions list
4. Decision recommendation
5. Brief steering minutes

Parameters:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 3. Recovery Project Viability Review

**When:** Troubled project needs steering assessment of recovery plan viability.

```
Conduct recovery viability steering review for {PROJECT_NAME}.

Context:
- Current project status: {STATUS}
- Recovery plan: {RECOVERY_PLAN}
- Investment to recover: {INVESTMENT}
- Alternative: cancel and write off {SUNK_COST}
- Sponsor position: {SPONSOR_POSITION}

Deliver:
1. 7-advisor assessment of recovery plan viability
2. Continue vs. cancel recommendation with evidence
3. Conditions for recovery Go
4. Resource commitment requirements
5. Recovery monitoring checkpoints (monthly re-review)

Parameters:
- {TIPO_PROYECTO}: Recovery
- {MODO}: supervisado
```

---

## 4. Portfolio Rebalancing Steering

**When:** Portfolio-level steering review for investment decisions.

```
Conduct portfolio steering review for {PORTFOLIO_NAME}.

Context:
- Active projects: {PROJECT_LIST}
- Strategic alignment scores: {ALIGNMENT}
- Budget allocation: {BUDGET}
- Resource constraints: {CONSTRAINTS}
- Proposed changes: {PROPOSALS}

Deliver:
1. Portfolio health assessment per project
2. Strategic alignment validation
3. Rebalancing recommendations with rationale
4. Project-level Go/Pause/Cancel recommendations
5. Portfolio steering minutes

Parameters:
- {TIPO_PROYECTO}: Portfolio
- {MODO}: supervisado
```

---

*PMO-APEX v1.0 — Use Case Prompts · Steering Review*
