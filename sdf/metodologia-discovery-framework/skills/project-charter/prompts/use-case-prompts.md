# Use Case Prompts — Project Charter

> Ready-to-use prompts for the most frequent charter generation scenarios.

---

## 1. Charter from Project Brief

**When:** A formal project request document exists and needs to be transformed into a charter.

```
Generate a project charter from the attached brief for {PROJECT_NAME}.

Context:
- Brief location: {BRIEF_PATH}
- Sponsor: {SPONSOR_NAME}
- Methodology: {TIPO_PROYECTO}
- Strategic alignment: {OKR_REFERENCE}
- Constraints: {CONSTRAINTS}

Deliver:
1. Full charter (10 sections per PMO-APEX standard)
2. SMART objectives table (≥3 objectives)
3. Milestone schedule (≥5 milestones)
4. Assumptions log (tagged H/M/L confidence)
5. Authorization block ready for sponsor review

Parameters:
- {MODO}: supervisado (confirm objectives before compiling)
```

---

## 2. Lean Charter for Agile Project

**When:** Quick project initiation for agile teams, 1-2 page format.

```
Generate a lean charter for agile project {PROJECT_NAME}.

Context:
- Problem: {PROBLEM_STATEMENT}
- Solution hypothesis: {HYPOTHESIS}
- Team: {TEAM_COMPOSITION}
- Sprint cadence: {CADENCE}
- Target: {TARGET_DATE}

Deliver:
1. One-page lean charter (problem, vision, objectives, boundaries, team, risks)
2. Success metrics (≥3 measurable KPIs)
3. Initial product backlog themes (top 5)

Parameters:
- {TIPO_PROYECTO}: Agile
- {MODO}: desatendido
```

---

## 3. Recovery Charter

**When:** Troubled project needs formal re-initiation with corrective plan.

```
Generate a recovery charter for troubled project {PROJECT_NAME}.

Context:
- Original charter (if exists): {ORIGINAL_PATH}
- Current status: {STATUS}
- Root causes of trouble: {ROOT_CAUSES}
- Remaining scope: {REMAINING}
- Stakeholder trust level: {TRUST}

Deliver:
1. Recovery charter with root cause analysis section
2. Corrective action plan (what changes from original approach)
3. Revised objectives and success criteria
4. Re-baseline recommendation (scope, schedule, budget)
5. Stakeholder re-engagement strategy

Parameters:
- {TIPO_PROYECTO}: Recovery
- {MODO}: supervisado
```

---

## 4. Program Charter

**When:** Multi-project program needs consolidated initiation.

```
Generate a program charter for {PROGRAM_NAME}.

Context:
- Component projects: {PROJECT_LIST}
- Strategic objective: {STRATEGIC_OBJ}
- Program duration: {DURATION}
- Governance: {GOV_MODEL}

Deliver:
1. Program charter with component project summary table
2. Strategic alignment map (program → organizational goals)
3. Inter-project dependency matrix
4. Program governance structure (roles, gates, reporting)
5. Benefits realization timeline

Parameters:
- {TIPO_PROYECTO}: Portfolio
- {MODO}: supervisado
```

---

*PMO-APEX v1.0 — Use Case Prompts · Project Charter*
