# 00 Discovery Plan: Acme Corp Banking Modernization

**Generated:** 12 de marzo de 2026 | **Variant:** Full Pipeline | **Estimated:** 4-6 weeks

---

## Expert Committee Declaration

```
╔══════════════════════════════════════════════════════════════╗
║  DISCOVERY COMMITTEE — Acme Corp Banking Modernization       ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  CONDUCTOR (Impartial Orchestrator)                          ║
║  ├── Sequences phases, enforces gates, manages contracts     ║
║  ├── Does NOT analyze — only coordinates                     ║
║  └── Breaks ties via evidence, escalates judgment to user    ║
║                                                              ║
║  EXPERT PANEL (7 members — odd for consensus)                ║
║  ├── Technical Architect                                     ║
║  │   └── System design, patterns, quality attributes, C4    ║
║  ├── Domain Analyst (SME: Banking/Financial Services)        ║
║  │   └── PCI-DSS, SOX, Basel III, open banking, AML/KYC     ║
║  ├── Full-Stack Generalist                                   ║
║  │   └── Java/Spring monolith feasibility, migration paths   ║
║  ├── Delivery Manager                                        ║
║  │   └── 24-dev team coordination, phased rollout planning   ║
║  ├── Quality Guardian                                        ║
║  │   └── Acceptance criteria, deliverable validation         ║
║  ├── Data Strategist                                         ║
║  │   └── Core banking data model, transaction integrity      ║
║  └── Change Catalyst                                         ║
║      └── Branch operations readiness, teller retraining      ║
║                                                              ║
║  CROSS-CUTTING GOVERNANCE (active all phases)                ║
║  ├── Project & Program Management (PMO backbone)             ║
║  │   └── Gate mgmt, proposal QA, dependency control          ║
║  └── Risk & Controlling Dynamics (anxious controller)        ║
║      └── Risk register, pre-mortem, assumption stress-test   ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

**Industry Lens Activated:** Banking / Financial Services
- Regulatory overlay: PCI-DSS, SOX compliance, Basel III capital requirements
- Domain patterns: transaction integrity, audit trails, real-time fraud detection
- Competitive context: neobank pressure, open banking (PSD2), API-first challengers

---

## Engagement Context

| Attribute | Value |
|-----------|-------|
| **Client** | Acme Corp |
| **System** | Core Banking System (CBS) — loan origination, account management, transaction processing |
| **Industry** | Banking / Financial Services |
| **Tech Stack** | Java 11, Spring Boot 2.7, Oracle 19c, IBM MQ, monolithic architecture |
| **Codebase** | `./acme-cbs/` — 340K LOC, 187 modules, 24 developers |
| **Stakeholders** | CTO (sponsor), VP Engineering, Head of Risk, Head of Operations |
| **Engagement Trigger** | Regulatory pressure + neobank competition; board mandate to modernize within 18 months |

---

## Phase Schedule

| Phase | Name | Lead Expert | Status | Est. Duration | Inputs Required |
|-------|------|-------------|--------|---------------|-----------------|
| 0 | Stakeholder Mapping | Change Catalyst | PENDING | 3-4 days | Org chart, project roster |
| 1 | AS-IS Analysis | Technical Architect | PENDING | 5-7 days | Source code, build config |
| 2 | Flow Mapping | Domain Analyst | PENDING | 4-6 days | AS-IS output |
| 3 | Scenario Analysis | Full Panel (7 experts) | PENDING | 3-5 days | Flow output |
| G1 | Scenario Gate | Conductor | PENDING | 1-3 days | Steering sign-off |
| 3b | Technical Feasibility | Quality Guardian | PENDING | 2-3 days | Approved scenario |
| 3b | Software Viability | Technical Architect | PENDING | 1-2 days | Tech stack claims |
| 4 | Solution Roadmap | Delivery Manager | PENDING | 4-6 days | Feasibility verdict |
| 4b | Commercial Model | Delivery Manager | PENDING | 1-2 days | Cost drivers |
| G2 | Budget Gate | Conductor | PENDING | 1-3 days | Sponsor sign-off |
| 5a | Functional Spec | Technical Architect | PENDING | 3-5 days | Approved roadmap |
| 5b | Executive Pitch | Delivery Manager | PENDING | 2-3 days | Approved roadmap |
| QA | Proposal QA + Risk | Conductor | PENDING | 1-2 days | All deliverables |
| G3 | Final Gate | Conductor | PENDING | 1-2 days | Client sign-off |
| 6 | Handover Operacional | Delivery Manager | PENDING | 2-3 days | G3 approved |

**Total estimated duration:** 32-52 working days (including gate cycles)

---

## Input Registry

| Input | Source | Status | Owner | Required By |
|-------|--------|--------|-------|-------------|
| Source code access | Client IT | ✅ Received | Maria Lopez (VP Eng) | Phase 1 |
| Build configuration | Client IT | ✅ Received | Maria Lopez (VP Eng) | Phase 1 |
| Deployment config | Client DevOps | ⬜ Pending | Carlos Ruiz (DevOps Lead) | Phase 1 |
| API specifications | Client IT | ⬜ Pending | Maria Lopez (VP Eng) | Phase 1 |
| Git history (24mo) | Client IT | ⬜ Pending | Maria Lopez (VP Eng) | Phase 1 |
| Stakeholder list | Client HR/PMO | ⬜ Pending | Ana Torres (CTO Office) | Phase 0 |
| Industry context | SME | ✅ Auto-activated | Domain Analyst | Phase 0 |
| Budget constraints | Client Finance | ⬜ Pending | CFO Office | Phase 4 |
| Team rates | Client HR | ⬜ Pending | HR Director | Phase 4 |
| Decision-maker type | Client | ⬜ Pending | Ana Torres (CTO Office) | Phase 5b |

**Input readiness:** 3/10 confirmed — sufficient for Phase 1 initialization (source code + build config available).

---

## Minimum Viable Input Validation

| Input | Required For | Status | Action |
|-------|-------------|--------|--------|
| Source code | Phase 1 | ✅ PASS | Repository access confirmed at `./acme-cbs/` |
| Build config | Phase 1 | ✅ PASS | Maven `pom.xml` structure identified, 187 modules |
| Deployment config | Phase 1 | ⚠️ WORKAROUND | Not yet received; will infer from Dockerfile + CI scripts. **Logged as Assumption A-001** |
| Stakeholder list | Phase 0 | ⚠️ WORKAROUND | Partial list from CTO; will supplement with git blame analysis. **Logged as Assumption A-002** |
| Industry sector | All phases | ✅ PASS | Banking / Financial Services — SME lens activated |

**Verdict:** PROCEED — minimum viable inputs satisfied. Source code available. Two workarounds logged as assumptions.

---

## Assumptions Log

| # | Assumption | Phase | Impact if Wrong | Validated? |
|---|-----------|-------|-----------------|------------|
| A-001 | Deployment configuration can be inferred from Dockerfile and CI pipeline scripts in the repository | Phase 1 | AS-IS analysis may miss deployment topology; infrastructure recommendations could be inaccurate | ⬜ No |
| A-002 | Stakeholder list from CTO covers key decision-makers; git blame will surface additional technical stakeholders | Phase 0 | Missing stakeholders could delay gate approvals; risk of rework if key voices emerge late | ⬜ No |
| A-003 | The 340K LOC monolith can be analyzed as a single system (no subsystem decomposition needed before Phase 2) | Phase 1 | If complexity exceeds threshold at Phase 1 exit, pipeline pauses for decomposition (+5-7 days) | ⬜ No |

---

## Risk Register (Pipeline-Level)

| # | Risk | Probability | Impact | Mitigation |
|---|------|-------------|--------|------------|
| R-001 | Core banking system has undocumented integrations with third-party payment processors — flow mapping incomplete | Medium | High | Phase 1 AS-IS to explicitly catalog all integration points; flag unknowns for stakeholder clarification |
| R-002 | Regulatory constraints (PCI-DSS, SOX) limit modernization options — scenarios in Phase 3 may be over-constrained | High | Medium | Domain Analyst to provide regulatory overlay early; feasibility check in Phase 3b to validate compliance paths |
| R-003 | 24-developer team has tribal knowledge not captured in documentation — AS-IS analysis misses critical context | Medium | High | Workshop in Phase 0 to capture tacit knowledge; stakeholder interviews to supplement code analysis |

---

## Industry Lens: Banking / Financial Services

The Dynamic SME has been activated with the Banking/Financial Services lens for the full engagement duration.

### Regulatory Context
- **PCI-DSS v4.0** — payment card data handling, encryption at rest and in transit
- **SOX compliance** — audit trails, separation of duties, change management controls
- **Basel III** — capital adequacy, liquidity ratios (impacts data architecture decisions)
- **AML/KYC** — anti-money laundering, know-your-customer verification flows

### Domain-Specific Evaluation Criteria
- Transaction integrity: ACID compliance, idempotency, reconciliation
- Audit trail completeness: every state change must be traceable
- Availability SLAs: 99.99% for core transaction processing
- Data residency: geographic constraints on data storage and processing

### Competitive Benchmarks
- Neobank response times: <200ms for account operations
- Open banking API compliance: PSD2/Open Banking Standard
- Mobile-first: 70%+ of retail banking interactions via mobile

---

## Pipeline Status Report

```
╔══════════════════════════════════════════════════════════════╗
║  PIPELINE STATUS — Acme Corp Banking Modernization           ║
╠══════════════════════════════════════════════════════════════╣
║  Phase -1 of 6: INITIALIZATION COMPLETE                      ║
║  Acceptance Criteria: 4/4 passed                             ║
║    ✅ Discovery plan generated with input registry            ║
║    ✅ Expert committee declared and presented                 ║
║    ✅ Industry SME lens activated (Banking)                   ║
║    ✅ Minimum viable inputs validated                         ║
║  Active Experts: Conductor, Change Catalyst                  ║
║  Assumptions Made: 3 (see assumptions log)                   ║
║  Open Risks: 3                                               ║
║  Next Phase: Phase 0 — Stakeholder Mapping                   ║
║    Lead: Change Catalyst                                     ║
║    Supporting: Domain Analyst, Delivery Manager              ║
║  Next Gate: G1 — Scenario Approval (~week 3-4)               ║
║  Estimated Remaining: 32-52 working days                     ║
║  Blockers: None                                              ║
╚══════════════════════════════════════════════════════════════╝
```

### Next Steps

1. **Immediate:** Request missing inputs (deployment config, API specs, git history, stakeholder list)
2. **Phase 0 Start:** Change Catalyst to begin stakeholder mapping with available org context
3. **Parallel:** Domain Analyst to prepare industry brief for team onboarding

---

## Deliverable Manifest (Planned)

| Phase | File | Status |
|-------|------|--------|
| Plan | `00_Discovery_Plan.md` | ✅ Generated (this document) |
| 0 | `01_Stakeholder_Map.html` | ⬜ Pending |
| 1 | `02_Brief_Tecnico_ASIS.html` | ⬜ Pending |
| 1 | `03_Analisis_AS-IS.html` | ⬜ Pending |
| 2 | `04_Mapeo_Flujos.html` | ⬜ Pending |
| 3 | `05_Escenarios_ToT.html` | ⬜ Pending |
| 4 | `06_Solution_Roadmap.html` | ⬜ Pending |
| 5a | `07_Especificacion_Funcional.html` | ⬜ Pending |
| 5b | `08_Pitch_Ejecutivo.html` | ⬜ Pending |
| QA | `P-01_Program_Governance.md` | ⬜ Pending |
| QA | `P-02_Risk_Controlling.md` | ⬜ Pending |
| 6 | `09_Handover_Operaciones.html` | ⬜ Pending |

---

**Autor:** Javier Montano | **Generado por:** metodologia-discovery-orchestrator v6.0
