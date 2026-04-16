# Metaprompts — Project Charter

> Meta-level strategies to maximize charter quality.

---

## 1. SMART Objective Validator

**Purpose:** Ensure every objective passes rigorous SMART testing.

```
For each stated objective, apply this 5-point validation:

1. SPECIFIC: Does it describe a concrete, observable outcome?
   - FAIL: "Improve customer experience" → too vague
   - PASS: "Reduce average support ticket resolution time"

2. MEASURABLE: Is there a quantitative target with measurement method?
   - FAIL: "Significantly reduce" → no number
   - PASS: "From 48h to 24h, measured by helpdesk system reports"

3. ACHIEVABLE: Is the target realistic given team capabilities?
   - Check: Has a similar project achieved this? [HISTORICO]
   - If no precedent: tag as [SUPUESTO] and note assumption

4. RELEVANT: Does it link to ≥1 organizational OKR/goal?
   - FAIL: No stated connection to business strategy
   - PASS: "Aligned with OKR Q3-2: Operational Excellence"

5. TIME-BOUND: Is there a specific deadline?
   - FAIL: "By end of year" → which year?
   - PASS: "By December 15, 2026"

If ANY criterion fails: rewrite the objective before including in charter.
Never include an objective that fails SMART testing.
```

---

## 2. Scope Boundary Discipline

**Purpose:** Prevent scope ambiguity by enforcing explicit exclusions.

```
After defining scope inclusions, systematically check for missing exclusions:

For each inclusion, ask: "What could a stakeholder reasonably assume is included
that IS NOT?"

Common missed exclusions:
- Data migration (included in "system replacement"?)
- Training (included in "implementation"?)
- Post-go-live support (included in "deployment"?)
- Third-party integrations (included in "system"?)
- Performance optimization (included in "development"?)
- Documentation (included in "delivery"?)

RULE: ≥3 explicit exclusions minimum.
RULE: Each exclusion needs a 1-sentence rationale.
RULE: If stakeholder pushback on exclusion, escalate — don't silently include.
```

---

## 3. Assumption Confidence Calibration

**Purpose:** Prevent assumption inflation — most assumptions are lower confidence than teams claim.

```
For each assumption, apply this calibration:

HIGH confidence (>80% likely true):
- Based on documented evidence [DOC] or [METRIC]
- Has been true in ≥2 similar past projects
- Stakeholder has confirmed in writing

MEDIUM confidence (50-80%):
- Based on verbal confirmation [STAKEHOLDER]
- True in some similar projects but not all
- Reasonable inference from available data [INFERENCIA]

LOW confidence (<50%):
- No evidence, pure assumption [SUPUESTO]
- Contradicted by some past experience
- Depends on external factors outside project control

RULE: If >50% of assumptions are rated HIGH, you're probably miscalibrated.
Typical distribution: 20% High, 50% Medium, 30% Low.
```

---

*PMO-APEX v1.0 — Metaprompts · Project Charter*
