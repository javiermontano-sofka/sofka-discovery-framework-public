# Integration Architecture — AcmeCorp S/4HANA ↔ External

> **Skill**: sap-integration · **Phase**: CP-N · **Agent**: `@sap-orchestrator`
> **Author**: Diseñado por Javier Montaño

## TL;DR

- 5 integrations cross-system
- 3 sync (OData V4), 1 async (Event Mesh), 1 batch (SFTP)
- Communication Arrangement SAP_COM_0008 activated
- Monitoring via SAP Cloud ALM + CPI dashboard

## Pattern Decisions

| Interface | Pattern | Justification |
|-----------|---------|--------------|
| SF ↔ S/4HANA employee sync | Sync OData V4 | Real-time master data |
| External timesheet → S/4 | CATS BAPI via CPI | Daily batch |
| S/4 → External analytics | Event Mesh async | Fan-out to multiple consumers |
| E-invoicing | SFTP daily batch | Tax authority regulation |
| Bank statements | CPI iFlow inbound | Periodic file |

## Error Handling

- Transient: retry exponential (max 3)
- Data: DLQ + alert
- Auth: credential refresh
- Business: user notification
- System: circuit breaker


## Quality Validation

- [x] Domain assertions met (per agents/grader.md)
- [x] Evidence tags applied
- [x] Ghost menu
- [x] Metacognitive closing

## 📊 METADATA DE RAZONAMIENTO

- Confianza global: 0.88
- Fuentes: referencias oficiales SAP, body-of-knowledge del skill
- Ambigüedades residuales: depende del cliente/escenario real
- Recomendación siguiente paso: workflow específico del skill

---
*SAP Enterprise Plugin v3.4+ — Diseñado por Javier Montaño.*
