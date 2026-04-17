# BTP Extension Blueprint — Custom Timesheet Approval

> **Skill**: sap-btp-extensibility · **Phase**: CP-N · **Agent**: `@sap-orchestrator`
> **Author**: Diseñado por Javier Montaño

## TL;DR

- Requirement: Custom workflow de approval para timesheet con políticas por país
- Decision: **ABAP Cloud RAP** (tightly coupled S/4HANA, released APIs) [DOC]
- Clean Core Level A compliance (6/6)
- ADR-017 firmado por SDA

---

## 1. Extension Decision Tree

```
Gap: Custom approval workflow timesheet
  ↓
¿Standard SAP resuelve? → NO (country-specific rules)
  ↓
¿Key User Extensibility alcanza? → NO (requires custom BO)
  ↓
¿ABAP Cloud RAP? → SÍ (tightly coupled, uses released CATS APIs)
  ↓
DECISION: RAP
```

## 2. RAP Design [DOC]

- **CDS Root Entity**: `ZI_TimesheetApproval`
- **Behavior Definition**: managed with draft
- **Service Binding**: OData V4 → Fiori Elements UI
- **Released APIs consumed**: `I_TimeSheet`, `I_BusinessPartner`

## 3. Clean Core Check (6/6) [DOC]

- ✓ Released APIs only
- ✓ No standard code modification
- ✓ Upgrade-safe (RAP)
- ✓ Custom fields vs Z-tables: custom BO in ABAP Cloud namespace
- ✓ OData V4 protocol
- ✓ Fiori Elements UI

## Ghost Menu

| Acción | Comando |
|--------|---------|
| Generar código RAP | `/sap:generate-abap "Custom timesheet approval workflow"` |


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
