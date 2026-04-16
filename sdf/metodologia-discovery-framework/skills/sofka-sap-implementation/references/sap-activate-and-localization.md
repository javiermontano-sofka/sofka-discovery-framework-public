# SAP Activate Methodology & Multi-Country Localization

## Purpose

Reference for SAP Activate phase definitions and multi-country localization configuration for the 5 HENKA jurisdictions.

---

## SAP Activate Methodology

### Phase 1: Discover (2-4 weeks) — CURRENT PHASE
- AS-IS analysis (completed: 2 sessions + 14 sources)
- Scope and objectives (completed: Escenario B, 78/100)
- Stakeholders and governance (completed: 8 RACI stakeholders)
- Gap analysis (completed: 3 blocking GAPs + 7 hallazgos)
- **Gate**: 3 GAPs must close as a package before Explore begins

### Phase 2: Prepare (2-4 weeks)
- Governance setup (steering committee, PMO)
- Team assembly and onboarding
- Environment provisioning (sandbox, dev, QA, prod)
- Project plan with milestones
- Communication plan

### Phase 3: Explore (6-12 weeks)
- **Fit-to-Standard Workshops**: 12 process areas
- Delta design for identified gaps
- Integration architecture (Awards 2.0 + CATS, SOCA, Python coexistence)
- Data migration strategy (Strangler Fig per-Excel plan)
- Test strategy definition
- Change management planning

### Phase 4: Realize (8-16 weeks)
- Configuration per design
- Extension development (CATS API integration, custom pricing logic)
- Integration development
- Data migration execution per Strangler Fig priority
- Testing cycles (unit, integration, UAT)
- Training content development

### Phase 5: Deploy (2-4 weeks)
- Cutover planning and rehearsal
- Production data migration
- Go-live execution
- Parallel run validation
- Hypercare support activation

### Phase 6: Run (Ongoing)
- Stabilization and issue resolution
- Remaining Strangler Fig Excel eliminations
- Performance optimization
- Quarterly business reviews

---

## Multi-Country Localization

### Colombia (COP)
- **Tax Authority**: DIAN. E-invoicing: UBL 2.1 XML (SAP Note 2904459+)
- **VAT**: 19% / 5% / 0% exports. Withholding: ReteFuente 4-11%, ICA, auto-retencion
- **Fiscal**: RUT, NIT, resolucion de facturacion

### Ecuador (USD)
- **Tax Authority**: SRI. E-invoicing: XML + digital signature
- **VAT**: 15% / 0% exports. Withholding: 1-10% by service type
- **Special**: Dollarized. IC with CO requires COP-USD conversion per NIC 21

### Mexico (MXN) — Post-MVP
- **Tax Authority**: SAT. E-invoicing: CFDI via SAP Document Compliance
- **VAT**: 16% / 0% exports. ISR: 30%. PTU: 10% profit sharing

### United States (USD) — Post-MVP
- **Standards**: US GAAP (ASC 606). Multi-state nexus.
- **Tax**: Federal 21% + state 0-13.3%. No federal sales tax for B2B IT services.

### Spain (EUR) — Post-MVP
- **Tax Authority**: AEAT. SII real-time VAT reporting (4-day deadline).
- **VAT**: 21% / 10% / 4%. EU reverse charge for B2B.

---

## SAP Localization Configuration Checklist (Per Company Code)

- [ ] Company Code with correct country, currency, fiscal year variant
- [ ] Chart of Accounts (unified + country extension)
- [ ] Tax calculation procedures (IVA, ISR, retenciones)
- [ ] Withholding tax types and codes
- [ ] Electronic invoicing integration (SAP Document Compliance)
- [ ] Payment methods (bank transfers, checks)
- [ ] Currency conversion rates (daily/monthly feed)
- [ ] Parallel ledger if required (local GAAP + IFRS)
- [ ] Intercompany trading partner (Scope 1GP/40Y)
- [ ] Transfer pricing markup conditions in SD pricing
- [ ] Activity Types in CO with Cost Rates and Sales Prices
- [ ] CAN Decision 578 withholding logic for CO-EC

### SAP Notes Reference
| Country | Key SAP Notes | Purpose |
|---------|--------------|---------|
| Colombia | 2904459+ | DIAN e-invoicing |
| Ecuador | Check latest | SRI e-invoicing |
| Mexico | Document Compliance | CFDI integration |
| Spain | SII standard | Real-time VAT reporting |
| US | Standard localization | Multi-state tax engine |

---

## Integration Patterns

| Pattern | Technology | Use Case | HENKA Application |
|---------|-----------|----------|-------------------|
| API-First (REST) | OData/REST | Real-time sync | Awards 2.0 -> CATS |
| SAP CPI/BTP | Integration Suite | Orchestration, mapping | Multi-system mediation |
| IDocs | Batch async | Bulk transfers | Legacy data migration |
| File-based | CSV/XLSX upload | Initial data loads | Strangler Fig Excel migration |

---

## Key SAP Apps for Professional Services

| App | Purpose | Module | HENKA Relevance |
|-----|---------|--------|-----------------|
| Manage Cost Rates | Internal cost per Activity Type per period | CO | CTC-based rates (eliminates Tarifa Purina) |
| Manage Sales Prices | Billable rate per AT per client/contract | CO/SD | Client-facing rates |
| Manage My Timesheet | Employee time entry (native fallback) | HCM | Fallback if Awards 2.0 delayed |
| Commercial Project Management | Project dashboard with financial KPIs | PS | Budget vs actual, profitability |
| Revenue Accounting | IFRS 15 / ASC 606 recognition engine | FI-RA | 4-variant recognition config |
