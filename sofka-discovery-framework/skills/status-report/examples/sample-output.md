# 04 Status Report — Acme Corp ERP Migration

> **Proyecto:** Acme Corp ERP Migration | **Fecha:** 15 de marzo de 2026
> **Periodo:** Semana 11 (10-14 marzo 2026) | **Tipo:** Waterfall

---

## Overall Status: AMBER

This period, the Acme ERP Migration is **Amber** because the SAP vendor delivery for custom modules is tracking 2 weeks behind original schedule. The most significant development was the successful completion of data cleansing for the finance module (98.5% data quality achieved). [METRIC]

---

## RAG Dashboard

| Dimension | Status | Metric | Evidence |
|-----------|:------:|--------|---------|
| Schedule | AMBER | SPI = 0.91 (behind 2 weeks on integration track) | [SCHEDULE] |
| Budget | BLUE | CPI = 1.02 (slightly under budget) | [METRIC] |
| Scope | BLUE | 2 change requests (both approved, <3% scope impact) | [PLAN] |
| Quality | BLUE | Defect density: 0.8/KLOC (target: <1.5/KLOC) | [METRIC] |
| Resources | BLUE | Full team allocation; 1 augmented resource onboarded | [PLAN] |
| Risks | AMBER | R-003 (vendor delay) P*I = 0.63, mitigation in progress | [PLAN] |

---

## Accomplishments (This Period)

| # | Accomplishment | Impact | Evidence |
|---|---------------|--------|---------|
| 1 | Finance module data cleansing completed (98.5% quality) | Enables UAT start on schedule | [METRIC] |
| 2 | SAP BAPI integration developer onboarded (augmentation) | Closes critical skills gap for integration phase | [PLAN] |
| 3 | Change request CR-002 approved by CCB | Adds warehouse barcode scanning to scope (+8 FTE-days) | [DECISION] |

---

## Upcoming Activities (Next Period)

| # | Activity | Target Date | Owner | Dependencies |
|---|----------|-------------|-------|-------------|
| 1 | Begin SIT for finance module | 17 Mar | Ana Torres | Data cleansing complete (done) |
| 2 | Vendor delivery review for custom modules | 19 Mar | Carlos Mendez | Vendor milestone |
| 3 | Performance testing environment setup | 20 Mar | Laura Vega | Infrastructure team availability |

---

## Top 3 Risks

| Rank | ID | Risk | P*I | Status | Mitigation |
|------|-----|------|:---:|--------|-----------|
| 1 | R-003 | SAP vendor custom module delay | 0.63 | Active | Weekly vendor calls; parallel workstream identified [STAKEHOLDER] |
| 2 | R-001 | Legacy data business rules undocumented | 0.49 | Mitigating | Data SME sessions scheduled; 70% rules documented [METRIC] |
| 3 | R-007 | Finance team UAT coverage gap | 0.49 | Monitoring | UAT training planned for Week 13 [PLAN] |

---

## Decisions Needed

| # | Decision | Options | Deadline | Owner | Recommendation |
|---|----------|---------|----------|-------|---------------|
| 1 | Approve 2-week schedule extension for integration track | A) Extend timeline B) Add resources C) Reduce scope | 19 Mar | Sponsor (Maria Lopez) | Option A — lowest risk [PLAN] |
| 2 | Approve performance testing tool license | A) JMeter (free) B) LoadRunner (requires procurement) | 21 Mar | CIO (Carlos Mendez) | Option A — sufficient for scope [PLAN] |

---

*PMO-APEX v1.0 — Status Report · Acme Corp ERP Migration*
