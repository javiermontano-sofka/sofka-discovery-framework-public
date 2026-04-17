# Plan AMS (Mantenimiento) — {CLIENTE}

> **Skill**: sap-plan-mantenimiento · **Author**: Javier Montaño

## Executive Summary

- **Scope**: {sistemas SAP en productivo}
- **Modelo de soporte**: {L1/L2/L3 | Shift-left | DevOps}
- **SLAs**: {Critical 2h, High 4h, Medium 8h, Low 24h}
- **Team**: {N} FTE steady-state

## 1. Service Catalog

| Service | SLA | Owner |
|---------|-----|-------|
| Incident Mgmt | 2-24h | L1/L2/L3 |
| Problem Mgmt | 1 week | L3 |
| Change Mgmt | Weekly | Change Board |
| Request Fulfillment | 3-5d | L1 |

## 2. SLA Matrix

| Priority | Response | Resolution |
|----------|----------|-----------|
| Critical | 15 min | 2 h |
| High | 1 h | 4 h |
| Medium | 2 h | 8 h |
| Low | 4 h | 24 h |

## 3. Support Structure

```
L0: Self-service (Enable Now, Knowledge Base)
L1: Helpdesk (ticket triage, FAQ)
L2: Super-users + Functional team
L3: Specialists + Developers
L4: SAP Basis / Vendor
```

## 4. Team Topology

| Role | FTE | Skills |
|------|-----|--------|
| Service Delivery Manager | 1 | ITIL, SAP |
| Functional Leads | 3 | Per module |
| Developers | 2 | ABAP Cloud |
| Integration Specialist | 1 | CPI |
| Basis / Cloud Admin | 1 | Cloud ALM |

## 5. Monitoring & Observability

- **SAP Cloud ALM**: transactional + operational monitoring
- **Focused Run**: if on-prem/private cloud
- **CPI Monitoring**: integration health
- **Alert Rules**: threshold-based + anomaly

## 6. Continuous Improvement Backlog

| # | Item | Priority | Effort |
|---|------|----------|--------|
| 1 | {} | H/M/L | FTE-m |

## 7. Knowledge Management

- Wiki structure
- Runbooks per module
- Playbooks per incident pattern
- Post-mortem template

## 8. Cadence

- Daily: standup
- Weekly: ops review
- Monthly: service review
- Quarterly: QBR with customer

## 9. Cost Model

| Year | FTE-months | Notes |
|------|-----------|-------|
| Y1 | {} | Ramp-up + hypercare overlap |
| Y2+ | {} | Steady-state |

## 10. Transition Plan / Exit

{Criteria para transition from implementation team → AMS team}

---

📊 METADATA DE RAZONAMIENTO
• Confianza global: {X.XX}
• Recomendación siguiente paso: `/sap:plan-evolucion`

---
*SAP Enterprise Plugin v3.0 — Diseñado por Javier Montaño.*
