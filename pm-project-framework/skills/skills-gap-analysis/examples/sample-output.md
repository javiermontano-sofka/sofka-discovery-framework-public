# 02 Skills Gap Analysis — Acme Corp ERP Migration

> **Proyecto:** Acme Corp ERP Migration | **Fecha:** 15 de marzo de 2026
> **Tipo:** Waterfall | **Modo:** piloto-auto

---

## Executive Summary

Skills assessment conducted for 12 team members across 18 project-critical skills. Assessment methods: self-assessment (all), peer review (senior roles), practical demonstration (SAP-specific skills). Identified 4 Critical gaps, 3 High gaps, 5 Medium gaps. Key-person dependencies found in 2 skills (SAP ABAP, data migration). Training plan requires 28 FTE-days; 1 staff augmentation role recommended. [PLAN]

---

## Skills Inventory Matrix

| Team Member | SAP ABAP | SAP Fiori | Data Migration | IFRS 17 | Change Mgmt | Testing | PM |
|-------------|----------|-----------|---------------|---------|-------------|---------|-----|
| Ana Torres (Tech Lead) | 4 | 3 | 5 | 2 | 2 | 3 | 4 |
| Pablo Gonzalez (Dev) | 3 | 4 | 2 | 1 | 1 | 2 | 1 |
| Sofia Herrera (BA) | 1 | 1 | 2 | 4 | 3 | 3 | 3 |
| Carlos Mendez (PM) | 1 | 1 | 1 | 2 | 4 | 2 | 5 |
| Laura Vega (QA) | 1 | 2 | 1 | 2 | 1 | 5 | 2 |

*Scale: 1=Novice, 2=Basic, 3=Intermediate, 4=Advanced, 5=Expert* [METRIC]

---

## Gap Analysis

| Skill | Required Level | Highest on Team | Gap | Severity | Closure Strategy | Evidence |
|-------|---------------|-----------------|-----|----------|-----------------|---------|
| SAP ABAP | 4 | 4 (Ana) | Bus factor=1 | Critical | Cross-train Pablo (8 FTE-days) | [PLAN] |
| Data Migration | 5 | 5 (Ana) | Bus factor=1 | Critical | Cross-train 1 person + augment 1 | [PLAN] |
| IFRS 17 Compliance | 4 | 4 (Sofia) | No backup | High | Train Ana (3 FTE-days workshop) | [PLAN] |
| SAP Fiori UX | 4 | 4 (Pablo) | Bus factor=1 | High | Cross-train 1 additional developer | [PLAN] |
| Change Management | 4 | 4 (Carlos) | Scope exceeds 1 person | Medium | Augment with OCM consultant | [SUPUESTO] |
| Performance Testing | 3 | 2 (max) | No one qualified | Critical | Train Laura (5 FTE-days) | [PLAN] |
| SAP Integration (BAPI) | 4 | 3 (Pablo) | Gap of 1 level | Critical | Vendor-led training (4 FTE-days) | [PLAN] |

---

## Training Plan

| Training | Target | Duration | Deadline | Method | Tracks To |
|----------|--------|----------|----------|--------|-----------|
| SAP ABAP Advanced | Pablo Gonzalez | 8 FTE-days | Sprint 3 start | Pair programming with Ana + course | Data migration phase |
| IFRS 17 Basics | Ana Torres | 3 FTE-days | Sprint 2 end | External workshop | UAT phase |
| Performance Testing | Laura Vega | 5 FTE-days | Sprint 4 start | Course + hands-on lab | SIT phase |
| SAP BAPI Integration | Pablo Gonzalez | 4 FTE-days | Sprint 2 start | Vendor-led training | Integration phase |
| SAP Fiori Cross-train | New hire/augment | 4 FTE-days | Sprint 3 start | Mentoring by Pablo | UI development phase |

**Total training investment:** 28 FTE-days [PLAN]
**Staff augmentation needed:** 1 Data Migration Specialist (8-week engagement) [PLAN]

---

## Key-Person Dependencies

| Skill | Only Person | Bus Factor | Risk Level | Mitigation |
|-------|------------|-----------|------------|------------|
| SAP ABAP | Ana Torres | 1 | High | Cross-training Pablo (in progress) |
| Data Migration | Ana Torres | 1 | Critical | Augmentation + KT plan |

> **Risk generated:** R-SKL-001: Key-person dependency on Ana Torres for 2 critical skills. If unavailable >1 week, project schedule slips 3+ weeks. P=0.3, I=0.7, P*I=0.21. [PLAN]

---

*PMO-APEX v1.0 — Skills Gap Analysis · Acme Corp ERP Migration*
