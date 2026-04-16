# Risk Monitoring Dashboard — Acme Corp Platform (Sprint 15)

## TL;DR
Total risk exposure decreased 12% from Sprint 14. One risk escalated to Red (vendor dependency). Two risks closed. One new emerging risk identified (regulatory change). [METRIC]

## 1. Risk Heat Map

| | Negligible | Minor | Moderate | Major | Critical |
|---|:-:|:-:|:-:|:-:|:-:|
| **Almost Certain** | | | | | |
| **Likely** | | | R-004 | **R-001** | |
| **Possible** | R-007 | R-005 | R-003 | | |
| **Unlikely** | | R-006 | | | |
| **Rare** | | | | | |

**Movement:** R-001 moved from Amber to Red. R-003 stable. R-005 moved from Moderate to Minor.

## 2. Top Risks Status

| ID | Risk | Severity | Trend | Response Status |
|----|------|:--------:|:-----:|:---------------|
| R-001 | Vendor API delivery delayed | RED | Worsening | Contingency activated [PLAN] |
| R-003 | Data migration quality | AMBER | Stable | Mitigation on track [METRIC] |
| R-004 | Team capacity shortfall | AMBER | Improving | Contractor onboarded |
| R-005 | Integration complexity | GREEN | Improving | POC successful [METRIC] |
| R-NEW | Regulatory data residency | AMBER | New | Assessment in progress [SUPUESTO] |

## 3. KRI Dashboard

| KRI | Current | Threshold | Status |
|-----|:-------:|:---------:|:------:|
| SPI | 0.91 | < 0.85 = Red | GREEN [METRIC] |
| Defect escape rate | 8% | > 10% = Amber | GREEN |
| Open risk actions overdue | 2 | > 3 = Amber | GREEN |
| Vendor milestone adherence | 60% | < 75% = Red | RED [METRIC] |
| Team overtime | 108% | > 120% = Amber | GREEN |

## 4. Actions Required

| Action | Owner | Priority | Deadline |
|--------|-------|----------|----------|
| Escalate vendor delay to Steering Committee | PM | Critical | This week [PLAN] |
| Complete regulatory impact assessment | BA Lead | High | Sprint 16 |
| Close R-002 and R-008 (resolved) | Risk Owner | Medium | Sprint 15 end |

*PMO-APEX v1.0 — Sample Output · Risk Monitoring*
