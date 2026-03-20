# 03b Steering Minutes — Acme Corp ERP Migration

> **Proyecto:** Acme Corp ERP Migration | **Fecha:** 15 de marzo de 2026
> **Gate:** G1.5 (Mid-Pipeline) | **Tipo:** Waterfall

---

## Decision: CONDITIONAL GO

The steering committee recommends **Conditional Go** (5 Go, 1 Conditional-Go, 1 No-Go) subject to 3 conditions to be resolved within 2 weeks. [DECISION]

---

## Evidence Package Reviewed

| Deliverable | Status | Completeness |
|-------------|--------|:------------:|
| Project Charter | Approved | 100% |
| Stakeholder Register | Complete | 100% |
| Schedule Baseline | Complete | 95% |
| Budget Baseline | Complete | 100% |
| Risk Register (22 risks) | Complete | 90% |
| Architecture Assessment | Complete | 85% |
| Methodology Assessment | Complete | 100% |

---

## Advisor Assessments & Votes

| Advisor | Vote | Assessment Summary | Key Concern | Evidence |
|---------|------|-------------------|-------------|---------|
| Strategy | Go | Business case strong; ROI projections validated against industry benchmarks | IFRS 17 deadline creates fixed constraint | [PLAN] |
| Architecture | Conditional-Go | Architecture sound but SAP BAPI integration untested at scale | Recommends integration PoC before full build | [INFERENCIA] |
| Risk | Go | 22 risks identified with response strategies; 4 Critical risks have mitigation plans | Vendor dependency risk (R-003) requires contractual remediation | [PLAN] |
| Finance | Go | Budget realistic with 10% contingency; CPI baseline established | Augmentation costs not finalized | [METRIC] |
| Methodology | Go | Waterfall appropriate for regulatory context; team trained | Phase overlap could create quality issues | [PLAN] |
| Delivery | Go | Schedule achievable with current resources; critical path identified | SAP vendor delivery is schedule critical path | [SCHEDULE] |
| Stakeholders | No-Go | VP Operations actively resistant; engagement strategy insufficient | Without VP Ops support, UAT and go-live at risk | [STAKEHOLDER] |

---

## Conditions for Go

| # | Condition | Owner | Deadline | Success Criteria |
|---|-----------|-------|----------|-----------------|
| 1 | Complete SAP BAPI integration PoC demonstrating throughput at 2x peak load | Solution Architect | 29 Mar 2026 | PoC passes performance criteria [PLAN] |
| 2 | Secure VP Operations commitment through 1:1 engagement session with sponsor | PM + Sponsor | 22 Mar 2026 | VP Ops moves from Resistant to Neutral [STAKEHOLDER] |
| 3 | Finalize staff augmentation contracts with cost commitment | Procurement | 25 Mar 2026 | Contracts signed, budget updated [PLAN] |

---

## Dissent Register

| Advisor | Position | Reasoning | Mitigation Required |
|---------|----------|-----------|-------------------|
| Stakeholders | No-Go | VP Operations resistance creates significant adoption risk at go-live. Historical data shows 60% of ERP implementations with active executive resistance fail UAT. Engagement strategy lacks specificity. | Sponsor-level intervention required before proceeding. Detailed engagement plan with measurable milestones. [STAKEHOLDER] |

---

## Next Steps

| # | Action | Owner | Deadline |
|---|--------|-------|----------|
| 1 | Execute BAPI integration PoC | Pablo Gonzalez | 29 Mar |
| 2 | Schedule sponsor/VP Ops alignment meeting | Carlos Mendez (PM) | 18 Mar |
| 3 | Finalize augmentation contracts | Procurement | 25 Mar |
| 4 | Re-review conditions at G1.5b checkpoint | PM | 31 Mar |
| 5 | Update risk register with steering findings | PM | 17 Mar |

---

*PMO-APEX v1.0 — Steering Minutes · Acme Corp ERP Migration*
