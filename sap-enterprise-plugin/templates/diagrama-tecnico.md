# Diagrama Técnico — {OBJETO}

> **Skill**: sap-diagrama-tecnico · **Author**: Javier Montaño

## Metadata

- **Tipo**: {c4 | er | sequence | deployment | component}
- **Audiencia**: {arquitectos | developers | ops}

## Context

{Objeto técnico + scope}

## Diagrama

### C4 Context Example

```mermaid
C4Context
    Person(user, "Business User", "Fiori user")
    System(s4, "S/4HANA Cloud", "Core ERP")
    System_Ext(ext, "External Timesheet", "Legacy")
    System(cpi, "SAP CPI", "Integration hub")

    Rel(user, s4, "Uses", "Fiori UI")
    Rel(ext, cpi, "Sends data", "REST/JSON")
    Rel(cpi, s4, "Posts timesheet", "CATS BAPI")
```

### Sequence Example

```mermaid
sequenceDiagram
    participant E as External System
    participant C as SAP CPI
    participant S as S/4HANA Cloud

    E->>C: POST /timesheet (JSON)
    C->>C: Transform JSON → BAPI
    C->>S: BAPI_CATIMESHEETMGR_INSERT
    S-->>C: Return status
    C-->>E: 200 OK
```

## Released APIs Used [DOC]

- `I_JournalEntry` (CDS released)
- `A_BusinessPartner` (OData V2)
- `BAPI_CATIMESHEETMGR_INSERT` (released for CPI, NOT for ABAP Cloud)

## Communication Arrangements

- SAP_COM_0008 (SuccessFactors ↔ S/4HANA)

## Protocols

| Integration | Protocol | Version | Auth |
|-------------|----------|---------|------|
| External → CPI | REST/JSON | n/a | OAuth 2.0 |
| CPI → S/4 | OData | V4 | OAuth 2.0 |
| S/4 → Event Mesh | AMQP | 1.0 | mTLS |

## Clean Core Compliance [DOC]

- ✅ Released APIs only
- ✅ No direct RFC from external
- ✅ Via CPI mediation
- ✅ Standard Communication Arrangements

## Deployment Topology

- BTP subaccount: DEV/QAS/PRD
- CPI tenant: {name}
- S/4 tenant: {name}

---

📊 METADATA DE RAZONAMIENTO
• Confianza global: {X.XX}
• Comité: @environment-orch, @abap-expert, @integration-patterns-expert, @solution-architect, @sap-docs-steward, @qa-validator
• Referencias: help.sap.com citadas

---
*SAP Enterprise Plugin v3.0 — Diseñado por Javier Montaño.*
