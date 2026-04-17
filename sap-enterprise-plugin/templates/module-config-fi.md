# Module Configuration — FI (Financial Accounting) — {CLIENTE}

> **Module Specialist**: `@module-specialist` · **Phase**: CP-5 / Realize
> **Author**: Diseñado por Javier Montaño

## 1. Module Overview

SAP Financial Accounting (FI) maneja contabilidad general, cuentas por cobrar/pagar, localización por país, intercompany y e-invoicing. Crítico para multi-country operations.

## 2. Master Data Requirements

### 2.1 Company Codes
- **Fiori App** [DOC]: Manage Company Codes
- **Regla**: 1 Company Code per Legal Entity

### 2.2 Chart of Accounts
- **Tipos**: Operating (shared), Group (consolidation), Country-specific (local GAAP)
- **Fiori App** [DOC]: Manage G/L Account Master Data

### 2.3 Parallel Ledgers
- **Uso**: IFRS + local GAAP paralelos
- **Typical setup**: 0L (Leading IFRS) + 2L (Local GAAP)

### 2.4 Business Partner
- **Roles**: FLCU (Customer), FLVN (Vendor), FLVN01 (Vendor with PO)
- **Fiori App** [DOC]: Maintain Business Partner

---

## 3. Configuration Steps

### 3.1 Company Code Setup
- **IMG Path** [CONFIG]: SPRO → Enterprise Structure → Definition → Financial Accounting → Edit Company Code
- **Scope Item** [DOC]: 1FC (GL base)

### 3.2 Chart of Accounts Design
- **IMG Path**: SPRO → Financial Accounting → GL Accounting → Master Data → GL Accounts → Preparations → Edit Chart of Accounts
- **Strategy**: Operating CoA unificado + country extensions

### 3.3 Parallel Ledger Configuration
- **IMG Path**: Financial Accounting → Financial Accounting Global Settings → Ledgers → Ledger → Define Ledgers for General Ledger Accounting
- **Use case**: IFRS + local GAAP

### 3.4 Intercompany Clearing
- **Scope Item** [DOC]: 4EZ
- **GL Accounts**: IC Receivable / IC Payable / IC Revenue / IC Cost / FX Gain-Loss
- **Transfer Pricing**: markup % + TP documentation

### 3.5 Tax Configuration
- **IMG Path**: Financial Accounting → Financial Accounting Global Settings → Tax on Sales/Purchases → Basic Settings
- **Per country**: VAT/GST rates, withholding matrix
- **Cross-reference**: `sap-regional-finance` skill

### 3.6 E-Invoicing per Jurisdiction

| País | Compliance | Config |
|------|-----------|--------|
| México | CFDI 4.0 | SAP Document Compliance |
| Colombia | DIAN | SAP Document Compliance |
| Guatemala | FEL | SAP Document Compliance |
| Ecuador | Comprobantes Electrónicos | SAP Document Compliance |
| España | Facturae | SAP Document Compliance |
| Brasil | NFe | SAP Document Compliance |

### 3.7 Bank Account Management
- **Scope Item** [DOC]: 1XQ
- **Fiori App**: Manage Banks

---

## 4. Intercompany Posting Cycle (IT Services Cross-Border)

```
1. Sending entity: Employee hours confirmed
2. Sending entity: Cost posted (Dr Labor, Cr Payroll Accrual)
3. Sending entity: IC billing (Dr IC Receivable, Cr IC Revenue)
   IC Price = CTC × (1 + markup %)
4. Receiving entity: IC posting (Dr IC Cost, Cr IC Payable)
   FX conversion at transaction date (IAS 21)
5. Receiving entity: Bill end client (Dr AR, Cr Revenue)
6. Month-end: IC clearing + FX revaluation
7. TP documentation attached
```

---

## 5. Scope Items Activation

| Scope Item | Status | Notes |
|-----------|--------|-------|
| 1FC | Activate | GL base |
| 1FD | Activate | Accounts Receivable |
| 1FE | Activate | Accounts Payable |
| 4EZ | Conditional | Intercompany |
| 1IL | Activate | Revenue Recognition |
| 1XQ | Activate | Bank Account Management |
| 2QR | Activate | Tax Management |

---

## 6. Dependencies con Otros Módulos

| Módulo | Dependencia | Acción |
|--------|-------------|--------|
| CO | CO postings → GL | Account determination |
| SD | Revenue postings | Revenue Recognition config |
| HCM | Payroll postings → FI | Payroll integration |
| PS | Project cost postings | Cost center settlement |

---

## 7. Test Plan

### 7.1 GL Posting
- [ ] Create journal entry
- [ ] Multi-currency posting
- [ ] Parallel ledger posting (IFRS vs local)

### 7.2 AR/AP
- [ ] Customer invoice + payment
- [ ] Vendor invoice + payment run
- [ ] Dunning process

### 7.3 Intercompany
- [ ] IC billing (sending entity)
- [ ] IC posting (receiving entity)
- [ ] FX revaluation
- [ ] Month-end clearing

### 7.4 E-Invoicing
- [ ] Generate invoice per country
- [ ] Validate compliant document
- [ ] Submit to tax authority (mock)

---

## 8. Risks & Mitigations

| Risk | Mitigation |
|------|-----------|
| Multi-country tax complexity | Engage tax advisor per country |
| FX conversion errors | Rounding rules tested with real data |
| Intercompany model undefined | Tax advisor + ADR |
| E-invoicing non-compliance | Country-specific UAT + audit |
| Parallel ledger divergence | Automated reconciliation |

---

## Quality Validation

- [ ] Company Codes per legal entity
- [ ] Chart of Accounts unificado + country extensions
- [ ] Parallel ledgers configurados (si aplica)
- [ ] Intercompany accounts + clearing
- [ ] Tax codes per country
- [ ] E-invoicing compliance per jurisdicción
- [ ] Bank accounts y payment runs
- [ ] `@qa-validator` consistency check

---

## Ghost Menu

| Acción | Comando |
|--------|---------|
| Configurar CO | `/sap:module-config CO` |
| Configurar SD | `/sap:module-config SD` |

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
