# Body of Knowledge — Steering Review (7-Advisor Committee)

> Academic, industrial, and practitioner sources for project governance, stage-gate reviews, and steering committee practices.

---

## 1. Foundational Frameworks

### PMBOK 7th Edition — Project Governance

- **Relevance:** PMI addresses governance as the framework within which project decisions are made. Governance includes oversight, control, decision-making, and escalation mechanisms. Steering committees are the primary governance body.
- **Key concepts:** Decision gates, governance framework, escalation paths, delegation of authority, organizational governance alignment.
- **Use in skill:** The 7-advisor model implements PMI's multi-perspective governance principle with formalized domain specialization.
- **Source:** PMI (2021). *PMBOK Guide — 7th Edition*; PMI (2016). *Governance of Portfolios, Programs, and Projects*.

### PRINCE2 — Stage Gate Reviews

- **Relevance:** PRINCE2 mandates formal stage gates (End Stage Assessments) where the project board decides whether to authorize the next stage. Each assessment evaluates the stage plan, updated business case, and risk assessment.
- **Key principles:** Management by exception, continued business justification, learn from experience, defined roles and responsibilities.
- **Use in skill:** PRINCE2's End Stage Assessment maps to APEX gates G1, G1.5, G2, G3. The Business Case review by the Executive mirrors the Finance advisor role.
- **Source:** AXELOS (2023). *Managing Successful Projects with PRINCE2 — 7th Edition*.

### Cooper's Stage-Gate Process

- **Relevance:** Originally designed for product development, Stage-Gate divides the project into stages separated by gates where Go/Kill/Hold/Recycle decisions are made. Each gate has defined criteria, deliverables, and decision authority.
- **Key insight:** Gates are not progress reviews — they are investment decision points. The question is not "did you do the work?" but "should we invest more?"
- **Use in skill:** The Go/Conditional-Go/No-Go voting model derives from Cooper's gate decision options.
- **Source:** Cooper, R.G. (2024). *Winning at New Products — 6th Edition*.

---

## 2. The 7-Advisor Model

### Advisor Roles and Assessment Domains

| Advisor | Domain | Key Questions | Evidence Sources |
|---------|--------|--------------|-----------------|
| **Strategy** | Strategic alignment | Does the project still serve the strategy? Is the business case valid? | Business case, strategic plan, OKRs |
| **Architecture** | Technical feasibility | Is the architecture sound? Is tech debt managed? Can we build this? | Architecture assessment, PoC results, tech stack analysis |
| **Risk** | Risk management | Are risks identified and managed? Is residual risk acceptable? | Risk register, response plans, Monte Carlo results |
| **Finance** | Budget and ROI | Is the budget realistic? Is ROI justified? Is funding committed? | Budget baseline, cost estimation, benefits realization plan |
| **Methodology** | Process fitness | Is the methodology fit for the project? Is the team ready? | Methodology assessment, team readiness, ceremony design |
| **Delivery** | Execution readiness | Is the schedule realistic? Are resources available? Are dependencies managed? | Schedule baseline, resource plan, dependency map |
| **Stakeholders** | People alignment | Are stakeholders engaged? Is the communication plan adequate? Is change managed? | Stakeholder register, communication plan, engagement assessment |

### Voting Protocol

| Vote | Meaning | Implication |
|------|---------|-------------|
| **Go** | Evidence supports proceeding | No conditions; proceed to next phase |
| **Conditional-Go** | Evidence supports proceeding IF conditions are met | Specific conditions must be resolved within defined timeline |
| **No-Go** | Evidence does not support proceeding | Project pauses until concerns are addressed |
| **Unable to Assess** | Insufficient evidence to form opinion | Treated as No-Go; missing evidence is itself a risk |

### Decision Rules

- **Unanimous Go:** Proceed with confidence
- **Majority Go with conditions:** Proceed, but conditions tracked as mandatory deliverables
- **Split (4-3):** Sponsor decides with full dissent visibility
- **Majority No-Go:** Project pauses; specific remediation required before re-review
- **Any Unable to Assess:** Evidence gap must be closed before re-review

---

## 3. Gate Criteria by Type

### G1 — Charter Gate

| Criteria | Standard |
|----------|---------|
| Business case | Documented with ROI projection |
| Stakeholder register | ≥10 stakeholders identified with power/interest |
| High-level scope | Defined with in/out boundaries |
| Budget magnitude | Order of magnitude estimate (±50%) |
| Risk register | ≥10 initial risks identified |

### G1.5 — Mid-Pipeline Gate

| Criteria | Standard |
|----------|---------|
| Detailed schedule | WBS + schedule baseline with critical path |
| Budget baseline | Detailed estimate (±15%) |
| Risk response plans | Top 10 risks have response strategies |
| Architecture assessment | Technical approach validated (PoC if needed) |
| Methodology confirmed | Assessment complete, team trained |

### G2 — Delivery Readiness Gate

| Criteria | Standard |
|----------|---------|
| Team formed | All roles filled and onboarded |
| Environment ready | Dev, test, staging environments operational |
| Sprint 0 / Phase 1 | Complete with demonstrated capability |
| Quality gates | Defined and automated where possible |
| Change control | CCB formed, process documented |

### G3 — Closure Gate

| Criteria | Standard |
|----------|---------|
| Acceptance | Client/sponsor formal acceptance |
| Lessons learned | Documented and shared |
| Financial closure | Budget reconciled, contracts closed |
| Transition | Operations handover complete |
| Benefits tracking | Measurement plan established |

---

## 4. Steering Minutes Template

### Required Sections

1. **Header:** Project name, gate, date, advisors present
2. **Evidence package summary:** Documents reviewed
3. **Advisor assessments:** Individual assessment per advisor (structured)
4. **Vote tally:** Go/Conditional-Go/No-Go per advisor
5. **Conditions:** Specific conditions for Conditional-Go votes
6. **Dissent register:** Reasoning for No-Go votes
7. **Decision:** Final gate decision with authority
8. **Next steps:** Action items with owners and deadlines
9. **Next review:** Date and criteria for next gate

---

*PMO-APEX v1.0 — Body of Knowledge · Steering Review*
