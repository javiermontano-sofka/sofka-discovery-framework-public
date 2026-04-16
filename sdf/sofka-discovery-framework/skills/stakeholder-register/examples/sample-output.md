# 00 Stakeholder Register — Acme Corp ERP Migration

> **Proyecto:** Acme Corp ERP Migration | **Fecha:** 15 de marzo de 2026
> **Tipo:** Waterfall | **Modo:** piloto-auto

---

## Executive Summary

Stakeholder analysis conducted for Acme Corp ERP Migration project. Identified 18 stakeholders across 5 categories (executive, management, operational, technical, external). Power/Interest analysis reveals 4 in Manage Closely quadrant, 5 in Keep Satisfied, 6 in Keep Informed, 3 in Monitor. Engagement gap analysis identifies 5 stakeholders requiring active engagement strategy adjustment. [STAKEHOLDER]

---

## Stakeholder Register (Top 10)

| ID | Name | Role | Power | Interest | Quadrant | Current | Desired | Gap | Evidence |
|----|------|------|:-----:|:--------:|----------|---------|---------|:---:|---------|
| SK-001 | Maria Lopez | CFO / Sponsor | 5 | 5 | Manage Closely | Supportive | Leading | 1 | [STAKEHOLDER] |
| SK-002 | Carlos Mendez | CIO | 5 | 4 | Manage Closely | Neutral | Supportive | 2 | [STAKEHOLDER] |
| SK-003 | Ana Torres | VP Operations | 4 | 5 | Manage Closely | Resistant | Supportive | 3 | [STAKEHOLDER] |
| SK-004 | Diego Ruiz | Compliance Director | 4 | 4 | Manage Closely | Neutral | Supportive | 2 | [PLAN] |
| SK-005 | Sofia Herrera | Finance Director | 4 | 3 | Keep Satisfied | Supportive | Supportive | 0 | [STAKEHOLDER] |
| SK-006 | Laura Vega | HR Director | 3 | 2 | Keep Satisfied | Unaware | Neutral | 2 | [INFERENCIA] |
| SK-007 | Pablo Gonzalez | IT Infrastructure Mgr | 3 | 5 | Keep Informed | Supportive | Supportive | 0 | [STAKEHOLDER] |
| SK-008 | Roberto Diaz | Warehouse Manager | 2 | 5 | Keep Informed | Resistant | Neutral | 2 | [STAKEHOLDER] |
| SK-009 | SAP Vendor (TechCorp) | Implementation Partner | 3 | 4 | Keep Satisfied | Supportive | Leading | 1 | [PLAN] |
| SK-010 | External Auditor | Annual Audit | 4 | 2 | Keep Satisfied | Unaware | Neutral | 2 | [SUPUESTO] |

---

## Power/Interest Matrix

```mermaid
quadrantChart
    title Stakeholder Power/Interest Matrix
    x-axis Low Interest --> High Interest
    y-axis Low Power --> High Power
    quadrant-1 Manage Closely
    quadrant-2 Keep Satisfied
    quadrant-3 Monitor
    quadrant-4 Keep Informed
    Maria Lopez (Sponsor): [0.9, 0.95]
    CIO Carlos: [0.75, 0.95]
    VP Ops Ana: [0.95, 0.8]
    Compliance Diego: [0.75, 0.8]
    Finance Sofia: [0.55, 0.75]
    HR Laura: [0.35, 0.6]
    IT Pablo: [0.9, 0.55]
    Warehouse Roberto: [0.9, 0.35]
    SAP Vendor: [0.75, 0.6]
    Auditor: [0.35, 0.75]
```

---

## Critical Engagement Gaps

| Stakeholder | Current → Desired | Strategy | Timeline | Owner |
|-------------|-------------------|----------|----------|-------|
| Ana Torres (VP Ops) | Resistant → Supportive | 1:1 briefings on operational benefits; involve in UAT planning; address WMS concerns directly | Weeks 1-4 | PM + Sponsor [STAKEHOLDER] |
| Carlos Mendez (CIO) | Neutral → Supportive | Monthly architecture reviews; position project as IT modernization enabler | Weeks 1-8 | PM [STAKEHOLDER] |
| Diego Ruiz (Compliance) | Neutral → Supportive | Early compliance testing plan sharing; invite to gate reviews | Weeks 2-6 | PM [PLAN] |
| Laura Vega (HR) | Unaware → Neutral | Change management briefing; training needs impact assessment | Week 3 | PM [INFERENCIA] |
| Roberto Diaz (Warehouse) | Resistant → Neutral | On-site demo of new WMS; involve warehouse team in requirements validation | Weeks 2-4 | PM + Ana Torres [STAKEHOLDER] |

---

*PMO-APEX v1.0 — Stakeholder Register · Acme Corp ERP Migration*
