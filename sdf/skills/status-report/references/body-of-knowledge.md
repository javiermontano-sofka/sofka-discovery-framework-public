# Body of Knowledge — Status Report Generation

> Academic, industrial, and practitioner sources for project status reporting, RAG frameworks, and stakeholder communication.

---

## 1. Foundational Frameworks

### PMBOK 7th Edition — Measurement Performance Domain

- **Relevance:** PMI's measurement domain covers establishing measures, what to measure, presenting information, and using information for decision-making. Status reports are the primary vehicle for measurement communication.
- **Key concepts:** Leading vs lagging indicators, dashboards, information radiators, earned value metrics, variance analysis.
- **Use in skill:** The RAG framework and metrics selection derive from PMI's measurement principles.
- **Source:** PMI (2021). *PMBOK Guide — 7th Edition*.

### Earned Value Management (EVM)

- **Relevance:** EVM provides objective, quantitative measures of project performance. CPI (Cost Performance Index) and SPI (Schedule Performance Index) replace subjective "on track" assessments.
- **Key metrics:**
  - CPI = EV / AC (>1 = under budget, <1 = over budget)
  - SPI = EV / PV (>1 = ahead of schedule, <1 = behind)
  - EAC = BAC / CPI (forecast cost at completion)
  - TCPI = (BAC - EV) / (BAC - AC) (required efficiency to finish on budget)
- **Use in skill:** Waterfall and hybrid projects should include EVM metrics. Agile projects use velocity-based equivalents.
- **Source:** PMI (2019). *Practice Standard for Earned Value Management — 3rd Edition*.

---

## 2. RAG Framework

### RAG Definitions (APEX Standard)

| Color | Meaning | Criteria | Action Required |
|-------|---------|----------|----------------|
| **Blue** | On track | Within baseline tolerance (schedule ±5%, budget ±5%) | Continue as planned |
| **Amber** | At risk | Approaching tolerance limits (schedule ±10%, budget ±10%) or emerging risk | PM intervention, mitigation plan |
| **Red** | Off track | Beyond tolerance (schedule >10%, budget >10%) or critical risk materialized | Escalation to sponsor, corrective action |

### RAG Dimensions

| Dimension | Blue | Amber | Red |
|-----------|------|-------|-----|
| **Schedule** | SPI ≥ 0.95 | 0.85 ≤ SPI < 0.95 | SPI < 0.85 |
| **Budget** | CPI ≥ 0.95 | 0.85 ≤ CPI < 0.95 | CPI < 0.85 |
| **Scope** | <5% change requests | 5-15% change requests | >15% change requests |
| **Quality** | Defect rate within target | Defect rate 1.5x target | Defect rate >2x target |
| **Resources** | Full allocation | 1-2 resource gaps | Critical resource gaps |
| **Risks** | No Critical risks | 1-2 Critical risks with mitigation | >2 Critical risks or unmitigated |

### Overall RAG Calculation

- **Red** if ANY dimension is Red
- **Amber** if ANY dimension is Amber (and none Red)
- **Blue** if ALL dimensions are Blue

*Note: APEX uses Blue instead of Green. #2563EB royal blue, #F59E0B amber. NEVER green.*

---

## 3. Report Structure Templates

### Weekly Status Report

1. **Header:** Project name, date, reporting period, overall RAG
2. **Executive Summary:** 3-5 sentences covering the "so what"
3. **RAG Dashboard:** Visual status per dimension
4. **Accomplishments:** What was completed this period (not what was worked on)
5. **Upcoming:** What will be completed next period
6. **Risks & Issues:** Top 3 risks, new issues, escalations
7. **Decisions Needed:** Pending decisions with deadline and owner
8. **Metrics:** Key numbers (velocity, CPI/SPI, defect count)

### Sprint Report

1. **Sprint Goal:** Was it achieved? (Yes/Partial/No)
2. **Velocity:** Planned vs actual story points
3. **Burndown:** Sprint burndown chart
4. **Completed Items:** Stories delivered with acceptance status
5. **Carry-Over:** Items not completed and why
6. **Retrospective Highlights:** Top improvement action
7. **Next Sprint:** Preview of Sprint N+1 goal

---

## 4. Audience Adaptation

### Detail Level by Audience

| Audience | Detail Level | Focus | Format | Duration to Read |
|----------|-------------|-------|--------|-----------------|
| Steering Committee | Strategic | RAG, decisions, escalations | 1-page summary | 3 minutes |
| Sponsor | Executive | RAG, budget, timeline, risks | 2-page report | 5 minutes |
| Management | Tactical | Milestones, resources, dependencies | Full report | 10 minutes |
| Project Team | Operational | Tasks, blockers, sprint data | Dashboard + meeting | 15 minutes |
| Client | Contractual | Deliverables, acceptance, timeline | Formal report | 10 minutes |

---

*PMO-APEX v1.0 — Body of Knowledge · Status Report Generation*
