# Opportunity Management — Body of Knowledge

> PMO-APEX Skill Reference | Domain: Positive Risk Management | Last updated: 2026-03-17

---

## 1. Foundational Frameworks

### PMBOK 7th Edition — Positive Risk
- **Source**: PMI *PMBOK Guide* 7th Ed. (2021) [DOC]
- **Definition**: Opportunities are uncertain events with positive impact on project objectives [DOC]
- **Strategies**: Exploit, Share, Enhance, Accept [DOC]

### PMI Practice Standard for Risk Management
- **Source**: PMI *Practice Standard for Project Risk Management* [DOC]
- **Application**: Opportunity management as integral part of risk management process [DOC]

---

## 2. Opportunity Response Strategies

| Strategy | Description | When to Use | Example |
|----------|-------------|-------------|---------|
| **Exploit** | Ensure the opportunity is realized | High probability, high impact | Assign best team to critical module [PLAN] |
| **Share** | Allocate ownership to a capable third party | Cannot exploit alone | Joint venture with technology partner [PLAN] |
| **Enhance** | Increase probability or positive impact | Moderate opportunity | Add resources to accelerate timeline [PLAN] |
| **Accept** | Acknowledge but take no proactive action | Low impact or low investment justification | Note potential reuse opportunity [PLAN] |

---

## 3. Opportunity Identification Sources

| Source | Opportunity Types | Evidence |
|--------|------------------|----------|
| Risk workshops | Identified alongside threats | Risk register [PLAN] |
| Sprint retrospectives | Process improvement possibilities | Retro outputs [PLAN] |
| Vendor relationships | Early delivery, technology access | Vendor communications [PLAN] |
| Team capabilities | Skills beyond requirements enable extras | Skills matrix [STAKEHOLDER] |
| Market conditions | Technology cost reductions, partnerships | Market analysis [PLAN] |
| Stakeholder feedback | Expanded value delivery | Stakeholder meetings [STAKEHOLDER] |

---

## 4. Opportunity Register Structure

| Field | Description | Required |
|-------|-------------|:---:|
| Opportunity ID | Unique identifier (OPP-001) | Yes |
| Description | Clear statement of potential positive outcome | Yes |
| Category | Schedule, cost, scope, quality, technical | Yes |
| Probability | Likelihood of occurrence (1-5) | Yes [METRIC] |
| Positive Impact | Benefit if realized (1-5) | Yes [METRIC] |
| Expected Value | Probability x Impact (quantified where possible) | Yes [METRIC] |
| Strategy | Exploit / Share / Enhance / Accept | Yes [PLAN] |
| Actions | Specific steps to pursue | Yes [PLAN] |
| Owner | Named opportunity champion | Yes [STAKEHOLDER] |
| Investment | Cost of pursuing | Recommended [METRIC] |
| Status | Open / In Progress / Realized / Expired | Yes |

---

## 5. Integration Points

- **Upstream**: `risk-register` provides opportunity entries [PLAN]
- **Cross-reference**: `benefits-realization-plan` tracks realized opportunities [METRIC]
- **Cross-reference**: `change-control-board` approves scope-changing opportunities [DECISION]
- **Downstream**: `project-charter` benefits from prior-project opportunities [PLAN]

---

*PMO-APEX v1.0 — Body of Knowledge: Opportunity Management*
