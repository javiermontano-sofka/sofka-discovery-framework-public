# SAP Object Catalog — Reference

> **Plugin**: sap-enterprise-plugin v2.1
> **Maintained by**: `@sap-docs-steward`
> **Author**: Diseñado por Javier Montaño

## Propósito

Catálogo de objetos SAP validados contra referencias oficiales. `@sap-docs-steward` consulta este archivo antes de confirmar cualquier objeto citado por otros agentes.

---

## 1. Scope Items (SAP Best Practices)

### Professional Services / IT Services

| Scope Item | Process Area | URL oficial |
|-----------|-------------|-------------|
| J11 | Customer Projects | rapid.sap.com (J11) |
| J12 | Time Management | rapid.sap.com (J12) |
| 1IL | Revenue Recognition (EBRR) | rapid.sap.com (1IL) |
| 4E9 | Project Billing | rapid.sap.com (4E9) |
| J14 | Sales Orders for Projects | rapid.sap.com (J14) |

### Finance

| Scope Item | Process Area |
|-----------|-------------|
| 1FC | Cost Center Accounting |
| 1FD | Accounts Receivable |
| 1FE | Accounts Payable |
| 1G0 | Profit Center Accounting |
| 1XQ | Bank Account Management |
| 2QR | Tax Management |
| 4EZ | Intercompany |
| J87 | Profitability Analysis (CO-PA) |

### Cross-Industry

| Scope Item | Process Area |
|-----------|-------------|
| BNX | Organizational Management |
| 1EH | Credit Management |

> **Validation**: Scope Items evolucionan con cada release SAP. Verificar contra SAP Best Practices Explorer antes de citar.

---

## 2. Fiori Apps Catalog

### Controlling (CO)
| App Name | Semantic Object | Type |
|----------|----------------|------|
| Manage Cost Centers | CostCenter | Transactional |
| Manage Activity Types | ActivityType | Transactional |
| Manage Cost Rates | CostRate | Transactional |
| Manage Sales Prices | SalesPrice | Transactional |
| Manage Internal Orders | InternalOrder | Transactional |

### Sales & Distribution (SD)
| App Name | Semantic Object |
|----------|----------------|
| Manage Sales Orders | SalesOrder |
| Create Billing Due List | BillingDueList |
| Manage Pricing Conditions | PriceCondition |

### Project System (PS)
| App Name | Semantic Object |
|----------|----------------|
| Manage Projects — Financials | Project |
| Commercial Project Management | CommercialProject |
| Staff Resource Requests | ResourceRequest |

### Financial Accounting (FI)
| App Name | Semantic Object |
|----------|----------------|
| Manage G/L Account Master Data | GLAccount |
| Manage Journal Entries | JournalEntry |
| Manage Customer Line Items | Customer |
| Manage Supplier Line Items | Supplier |
| Post General Journal Entries | JournalEntry |

### HCM / SuccessFactors
| App Name | Semantic Object |
|----------|----------------|
| Manage My Timesheet | Timesheet |
| Maintain Business Partner | BusinessPartner |

> **Validation source**: fioriappslibrary.hana.ondemand.com

---

## 3. Released APIs (ABAP Cloud)

### Business Partner
- `I_BusinessPartner` (CDS view)
- `A_BusinessPartner` (OData V2 service)

### Sales Order
- `I_SalesOrder`, `I_SalesOrderItem`
- `API_SALES_ORDER_SRV` (OData)

### Journal Entry
- `I_JournalEntry`
- `API_JOURNALENTRY_SRV`

### Cost Center
- `I_CostCenter`

### Project
- `I_Project`, `I_WBSElement`

> **Released Objects Catalog**: Accesible vía Eclipse ADT → Released Objects view

---

## 4. BAPIs (Classic — Use Released Equivalents Where Possible)

| BAPI | Purpose | ABAP Cloud Alternative |
|------|---------|----------------------|
| BAPI_CATIMESHEETMGR_INSERT | CATS timesheet entry | Via CPI mediation |
| BAPI_SALESORDER_CREATEFROMDAT2 | Create sales order | `API_SALES_ORDER_SRV` |
| BAPI_BUSINESS_PARTNER_CREATE | Create BP | `A_BusinessPartner` |

> **Warning**: Verificar released status en Released Objects catalog antes de usar en ABAP Cloud.

---

## 5. Simplification Items (ECC → S/4HANA)

Ejemplos de items críticos que afectan conversión:

| Simplification Item | Área | Impact |
|--------------------|------|--------|
| Business Partner Mandatory | SD, FI | Customer/Vendor → BP |
| New Asset Accounting | FI-AA | Activation required |
| Material Ledger | MM, CO | Mandatory activation |
| New G/L | FI | Must use new GL |

> **Source**: help.sap.com/s4hana Simplification List

---

## 6. Communication Arrangements (Standard Scenarios)

| Scenario | Communication Arrangement |
|----------|--------------------------|
| SuccessFactors ↔ S/4HANA | SAP_COM_0008 |
| Bank Communication | SAP_COM_0006 |
| Tax Calculation | SAP_COM_0039 |

> **Source**: Communication Management Fiori app

---

## 7. How `@sap-docs-steward` Uses This Catalog

1. Agente pregunta: "¿Existe la tabla KONV?"
2. `@sap-docs-steward` busca en este catálogo.
3. Si está → responde con `[DOC]` y URL oficial.
4. Si NO está → busca en help.sap.com.
5. Si no encuentra → responde: "No tengo referencia validada para KONV".

---

## Maintenance

Este catálogo se actualiza:
- Cada SAP quarterly release
- Al detectar objetos nuevos en discovery
- Cuando `@sap-docs-steward` valida un objeto no listado

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
