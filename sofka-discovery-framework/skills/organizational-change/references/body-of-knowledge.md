# Organizational Change Management — Body of Knowledge

> PMO-APEX Skill Reference | Domain: OCM & Adoption | Last updated: 2026-03-17

---

## 1. Foundational Frameworks

### ADKAR Model (Prosci)
- **Source**: Jeff Hiatt, *ADKAR: A Model for Change* (Prosci, 2006) [DOC]
- **Elements**: Awareness, Desire, Knowledge, Ability, Reinforcement [DOC]
- **Application**: Individual change model applied at organizational scale; barrier point analysis identifies which element is the bottleneck [DOC]
- **Key insight**: Change happens one person at a time; organizational adoption is the sum of individual transitions [DOC]

### Kotter's 8-Step Change Model
- **Source**: John Kotter, *Leading Change* (1996, updated 2012) [DOC]
- **Steps**: Create urgency → Build coalition → Form vision → Communicate → Empower → Short-term wins → Consolidate → Anchor [DOC]
- **Application**: Enterprise-level change strategy; top-down leadership-driven transformation [DOC]

### Bridges Transition Model
- **Source**: William Bridges, *Managing Transitions* (2009, 4th ed. 2016) [DOC]
- **Phases**: Ending (loss) → Neutral Zone (uncertainty) → New Beginning (acceptance) [DOC]
- **Application**: Emotional and psychological dimension of change; addresses grief and identity disruption [STAKEHOLDER]

### PMI Managing Change in Organizations
- **Source**: PMI *Managing Change in Organizations: A Practice Guide* (2013) [DOC]
- **Integration**: Links change management to portfolio, program, and project management [PLAN]

---

## 2. ADKAR Diagnostic Framework

| Element | Question | Barrier Indicator | Intervention |
|---------|---------|-------------------|-------------|
| **Awareness** | Do they know WHY change is needed? | Confusion, rumors, denial | Communication campaign, sponsor town halls [PLAN] |
| **Desire** | Do they WANT to participate? | Passive resistance, low engagement | WIIFM messaging, champion network, sponsor visibility [STAKEHOLDER] |
| **Knowledge** | Do they know HOW to change? | Errors, questions, frustration | Training, coaching, job aids, documentation [PLAN] |
| **Ability** | Can they PERFORM the new way? | Performance gaps, workarounds, reverting | Practice environments, coaching, peer support [PLAN] |
| **Reinforcement** | Will the change STICK? | Regression, old habits returning | Incentives, metrics, recognition, governance [METRIC] |

---

## 3. Change Impact Assessment Dimensions

| Dimension | Assessment Questions | Evidence |
|-----------|---------------------|----------|
| **Process** | Which processes change? How significantly? | Process maps, SOPs [PLAN] |
| **Technology** | Which tools/systems change? New skills needed? | System architecture [PLAN] |
| **Organization** | Do reporting lines, roles, or structures change? | Org chart, RACI [STAKEHOLDER] |
| **Job Role** | Do daily tasks, responsibilities, or KPIs change? | Job descriptions [STAKEHOLDER] |
| **Culture** | Does the change challenge existing norms or values? | Culture assessment [STAKEHOLDER] |

### Impact Severity Scale
| Level | Description | OCM Response |
|:---:|-------------|-------------|
| 1 | Minor — small process adjustment | Communication only [PLAN] |
| 2 | Moderate — new tool or modified process | Communication + training [PLAN] |
| 3 | Significant — new role responsibilities | Full ADKAR plan [PLAN] |
| 4 | Major — organizational restructuring | Dedicated OCM workstream [PLAN] |

---

## 4. Communication Campaign Structure

| Phase | ADKAR Focus | Message Type | Channel | Frequency |
|-------|-----------|-------------|---------|:---:|
| Pre-launch | Awareness | Why change, what's at stake | Town hall, email from sponsor | 2x [SCHEDULE] |
| Launch | Awareness + Desire | Vision, WIIFM, success stories | Team meetings, intranet | Weekly [SCHEDULE] |
| Training | Knowledge | How-to, new processes, tools | Workshops, videos, docs | Per training [SCHEDULE] |
| Go-live | Ability | Support, FAQs, troubleshooting | Help desk, Slack channel | Daily [SCHEDULE] |
| Post-launch | Reinforcement | Success metrics, recognition | Dashboard, newsletters | Bi-weekly [SCHEDULE] |

---

## 5. Resistance Management

### Sources of Resistance
| Source | Root Cause | Intervention |
|--------|-----------|-------------|
| Fear of unknown | Insufficient awareness and knowledge | Communication + training [PLAN] |
| Loss of control | Role changes or authority shifts | Involve in design, address concerns [STAKEHOLDER] |
| Bad past experience | Previous failed changes created cynicism | Acknowledge history, demonstrate different approach [STAKEHOLDER] |
| Comfort with status quo | No perceived need for change | WIIFM messaging, peer success stories [PLAN] |
| Competence anxiety | Fear of looking incompetent | Safe practice environment, coaching [PLAN] |
| Legitimate concerns | Real issues with the change approach | Listen, incorporate feedback, adjust plan [DECISION] |

### SCARF Model for Resistance Diagnosis
| Dimension | Threat Signal | Mitigation |
|-----------|-------------|-----------|
| **Status** | "My expertise becomes irrelevant" | Position as expert in new system [STAKEHOLDER] |
| **Certainty** | "I don't know what my job will look like" | Detailed transition roadmap [PLAN] |
| **Autonomy** | "I'm being forced to change" | Offer choices within the change [STAKEHOLDER] |
| **Relatedness** | "My team is being restructured" | Preserve social connections [STAKEHOLDER] |
| **Fairness** | "Why is my team impacted more?" | Transparent rationale, equitable support [STAKEHOLDER] |

---

## 6. Adoption Measurement

| KPI | Measurement | Target | Evidence |
|-----|-----------|:---:|---|
| Utilization rate | % of impacted users using new system/process | >80% at target date | System logs [METRIC] |
| Proficiency | % meeting performance standards | >70% within 30 days | Assessment scores [METRIC] |
| Speed of adoption | Time from go-live to target utilization | <60 days | Trend data [METRIC] |
| Resistance index | % expressing active resistance | <15% | Survey data [METRIC] |
| Sponsor visibility | Sponsor actions per week | >2 visible actions/week | Action log [STAKEHOLDER] |

---

## 7. Integration Points

- **Upstream**: `stakeholder-register` provides impacted group identification [STAKEHOLDER]
- **Upstream**: `risk-register` identifies change-related risks [PLAN]
- **Cross-reference**: `communication-plan` provides channel strategy [PLAN]
- **Cross-reference**: `onboarding-playbook` supports new-hire change enablement [PLAN]
- **Downstream**: `lessons-register` captures OCM lessons for future projects [PLAN]
- **Downstream**: `benefits-realization-plan` measures actual adoption outcomes [METRIC]

---

*PMO-APEX v1.0 — Body of Knowledge: Organizational Change Management*
