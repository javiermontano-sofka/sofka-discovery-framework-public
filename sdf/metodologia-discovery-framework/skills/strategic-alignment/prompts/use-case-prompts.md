# Use Case Prompts — Strategic Alignment & OKR Tracking

> Ready-to-use prompts for strategy-to-project alignment scenarios.

---

## 1. Full Portfolio Alignment Assessment

**When:** Quarterly or annual strategy alignment review.

```
Assess strategic alignment for portfolio at {ORG_NAME}.

Context:
- Strategic plan/OKRs: {STRATEGY_DOC}
- Active projects: {PROJECT_LIST}
- Budget allocation: {BUDGET_ALLOCATION}
- Recent strategic changes: {CHANGES}

Deliver:
1. Strategy-to-project alignment matrix with scores (0-5)
2. Strategic orphan list (projects with score ≤1)
3. Coverage gap analysis (objectives without project support)
4. Investment vs strategy allocation comparison
5. Rebalancing recommendations

Parameters:
- {TIPO_PROYECTO}: Portfolio
- {MODO}: supervisado
```

---

## 2. Single Project Alignment Check

**When:** Project charter review or gate assessment.

```
Verify strategic alignment for {PROJECT_NAME}.

Context:
- Project objectives: {OBJECTIVES}
- Organizational OKRs: {OKRS}
- Business case: {BUSINESS_CASE}
- Sponsor's strategic justification: {JUSTIFICATION}

Deliver:
1. Alignment score per strategic objective
2. Primary and secondary strategic contributions
3. Alignment risk assessment (drift potential)
4. Recommendations for strengthening alignment
5. Monitoring triggers for alignment drift

Parameters:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 3. Post-Pivot Realignment

**When:** Organization changes strategy; existing projects need realignment assessment.

```
Assess impact of strategy pivot on portfolio at {ORG_NAME}.

Context:
- Previous strategy: {OLD_STRATEGY}
- New strategy: {NEW_STRATEGY}
- Current portfolio: {PROJECT_LIST}
- Budget constraints: {CONSTRAINTS}

Deliver:
1. Re-scored alignment matrix under new strategy
2. Projects gaining alignment (accelerate)
3. Projects losing alignment (review/cancel)
4. New coverage gaps created by pivot
5. Portfolio rebalancing roadmap

Parameters:
- {TIPO_PROYECTO}: Portfolio
- {MODO}: supervisado
```

---

*PMO-APEX v1.0 — Use Case Prompts · Strategic Alignment*
