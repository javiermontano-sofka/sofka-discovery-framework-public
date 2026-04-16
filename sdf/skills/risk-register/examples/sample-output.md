# 03 Risk Register — Acme Corp ERP Migration

> **Proyecto:** Acme Corp ERP Migration | **Fecha:** 15 de marzo de 2026
> **Tipo:** Waterfall | **Modo:** piloto-auto

---

## Executive Summary

Risk identification conducted using 4 techniques (brainstorming, assumption analysis, checklist review, pre-mortem) with 8 stakeholders across business, IT, and operations. Identified 22 risks: 4 Critical, 7 High, 8 Medium, 3 Low. Total risk exposure (sum P×I): 6.73. Top risk: vendor delivery delay for custom SAP modules (P×I = 0.63).

---

## Risk Breakdown Structure

```mermaid
graph TB
    ROOT[Acme ERP Migration<br/>22 Risks | Exposure: 6.73]

    ROOT --> TECH[Technical<br/>8 risks]
    ROOT --> EXT[External<br/>5 risks]
    ROOT --> ORG[Organizational<br/>6 risks]
    ROOT --> PM[Project Management<br/>3 risks]

    TECH --> T1[Requirements: 2]
    TECH --> T2[Technology: 3]
    TECH --> T3[Quality: 2]
    TECH --> T4[Complexity: 1]

    EXT --> E1[Vendors: 3]
    EXT --> E2[Regulatory: 1]
    EXT --> E3[Market: 1]

    ORG --> O1[Resources: 3]
    ORG --> O2[Culture: 2]
    ORG --> O3[Dependencies: 1]

    PM --> P1[Estimation: 2]
    PM --> P2[Communication: 1]

    style ROOT fill:#2563EB,color:#fff
    style TECH fill:#DC2626,color:#fff
    style EXT fill:#F59E0B,color:#0F172A
    style ORG fill:#F59E0B,color:#0F172A
    style PM fill:#22C55E,color:#fff
```

---

## Top 10 Risks

| Rank | ID | Risk Statement | Category | P | I | P×I | Owner | Evidence |
|------|-----|---------------|----------|---|---|-----|-------|---------|
| 1 | R-003 | *Because* SAP vendor has resource constraints on LATAM team, *risk that* custom module delivery slips 6-8 weeks, *resulting in* go-live delay and $200K additional hosting | External > Vendor | 0.9 | 0.7 | 0.63 | Carlos Mendez | `[STAKEHOLDER]` |
| 2 | R-001 | *Because* legacy data has undocumented business rules, *risk that* data migration requires 3x estimated cleansing effort, *resulting in* schedule overrun of 4 weeks | Technical > Complexity | 0.7 | 0.7 | 0.49 | Ana Torres | `[METRIC]` |
| 3 | R-007 | *Because* 40% of finance team has <2 years tenure, *risk that* UAT coverage misses critical month-end scenarios, *resulting in* post-go-live defects in financial reporting | Organizational > Resources | 0.7 | 0.7 | 0.49 | Laura Vega | `[STAKEHOLDER]` |
| 4 | R-012 | *Because* regulatory deadline for IFRS 17 compliance is fixed, *risk that* any schedule slip eliminates buffer for compliance testing, *resulting in* regulatory non-compliance penalty | External > Regulatory | 0.5 | 0.9 | 0.45 | Diego Ruiz | `[PLAN]` |
| 5 | R-005 | *Because* current ERP has 200+ custom reports, *risk that* report migration scope is underestimated, *resulting in* scope creep of 15-20% | Technical > Requirements | 0.7 | 0.5 | 0.35 | Sofia Herrera | `[METRIC]` |
| 6 | R-008 | *Because* warehouse team has expressed resistance to new WMS module, *risk that* adoption rates fall below 60% at go-live, *resulting in* parallel system operation and doubled operating costs | Organizational > Culture | 0.5 | 0.7 | 0.35 | Maria Lopez | `[STAKEHOLDER]` |
| 7 | R-002 | *Because* SAP S/4HANA 2025 patch introduced breaking changes in BAPI interfaces, *risk that* integration with MES system fails during SIT, *resulting in* 3-week rework cycle | Technical > Technology | 0.5 | 0.5 | 0.25 | Pablo Gonzalez | `[METRIC]` |
| 8 | R-009 | *Because* project depends on shared DBA team across 3 projects, *risk that* database optimization tasks are delayed, *resulting in* performance testing blocked for 2 weeks | Organizational > Dependencies | 0.5 | 0.5 | 0.25 | Carlos Mendez | `[PLAN]` |
| 9 | R-015 | *Because* original estimate used analogous estimation without adjustment, *risk that* development effort is 30% underestimated, *resulting in* budget overrun of 60 FTE-days | PM > Estimation | 0.5 | 0.5 | 0.25 | Ana Torres | `[INFERENCIA]` |
| 10 | R-004 | *Because* API rate limits on legacy system are undocumented, *risk that* real-time integration exceeds throughput capacity, *resulting in* data synchronization failures during peak hours | Technical > Technology | 0.3 | 0.7 | 0.21 | Pablo Gonzalez | `[SUPUESTO]` |

---

## P×I Heat Map

| | Very Low (0.1) | Low (0.3) | Medium (0.5) | High (0.7) | Very High (0.9) |
|---|---|---|---|---|---|
| **Very High (0.9)** | | | | R-003 🔴 | |
| **High (0.7)** | | | R-005, R-008 🟠 | R-001, R-007 🔴 | |
| **Medium (0.5)** | | | R-002, R-009, R-015 🟡 | R-012 🟠 | |
| **Low (0.3)** | | R-018, R-019 🟢 | R-010, R-011 🟡 | R-004 🟠 | |
| **Very Low (0.1)** | R-022 🟢 | R-020, R-021 🟢 | | | |

---

## Identification Techniques Used

| Technique | Participants | Risks Found | Duration |
|-----------|-------------|-------------|----------|
| Structured Brainstorming | 8 stakeholders (IT, Business, Ops) | 12 | 90 min |
| Assumption Analysis | PM + Business Analyst | 5 | 45 min |
| Checklist Review (ERP-specific) | Technical Lead + Solution Architect | 3 | 30 min |
| Pre-Mortem Analysis | Full project team (12 people) | 2 net-new | 60 min |

---

*PMO-APEX v1.0 — Risk Register · Acme Corp ERP Migration*
