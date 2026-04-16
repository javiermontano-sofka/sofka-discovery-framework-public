# HENKA Architecture Decision Records (ADRs) & PoC Validation

## Purpose

Complete reference for the 7 ADRs governing the HENKA SAP S/4HANA implementation, including SAP configuration impact, blocking GAPs, PoC criteria, and sandbox validation checklists.

---

## ADR-001: Awards 2.0 + CATS API (Timesheet Integration)

- **Decision**: Use Awards Sofka 2.0 as frontend for timesheet entry; integrate with SAP via CATS BAPI/API
- **SAP Impact**: Replace native Manage My Timesheet with external integration
- **Status**: Approved. Awards 2.0 timeline outside HENKA control.
- **Fallback**: If Awards 2.0 delayed, use Manage My Timesheet native (risk: user adoption resistance from 500+ users)
- **PoC**: Validate CATS BAPI accepts external timesheet data in sandbox (T+20)

### Integration Flow
```
Awards 2.0 (Angular/React frontend)
  -> REST API call
  -> SAP Integration Suite (CPI/BTP) mediation layer
  -> CATS BAPI (BAPI_CATIMESHEETMGR_INSERT)
  -> SAP PS/CO (hours posted to WBS + Activity Type)
  -> Triggers: cost allocation, billing, revenue recognition
```

**Fields mapped**: Employee ID, Project/WBS, Activity Type, Hours, Date, Approval Status, Cost Center

### Why Awards 2.0 Instead of Manage My Timesheet
500+ Sofka employees already use OurSofka/Awards for timesheet entry. Forcing them to switch to SAP's native Manage My Timesheet risks massive adoption resistance (Assumption A-05). ADR-001 preserves the familiar frontend while connecting to SAP's backend via CATS API.

### Technical Architecture
```
[Awards 2.0 Frontend] --REST/JSON--> [SAP CPI/BTP Integration Suite]
  --CATS BAPI (BAPI_CATIMESHEETMGR_INSERT)--> [SAP S/4HANA]
  --> PS (project hours) + CO (cost allocation) + SD (billing trigger)
```

### Error Handling
| Error Scenario | CATS Response | Resolution |
|---------------|--------------|------------|
| Invalid WBS/Project | Rejection code | Awards 2.0 shows error; user corrects |
| Inactive Activity Type | Rejection code | Admin activates AT for period |
| Hours exceed threshold | Warning/rejection | PM approval override or correction |
| API timeout | No response | Retry queue in CPI with alerting |
| Employee not assigned to project | Rejection | PM must assign in PS first |

### PoC Checklist (T+20 Milestone)
- [ ] CATS BAPI callable from external system in sandbox
- [ ] Awards 2.0 test payload accepted and posted to PS/CO
- [ ] Cost allocation fires correctly per Activity Type
- [ ] Billing document creatable from confirmed hours
- [ ] Rejection scenarios handled with meaningful error messages
- [ ] Performance: < 2s response for single timesheet entry

---

## ADR-002: Activity Types (8 Skill Levels)
- **Decision**: 8 Activity Types reconciling 16 PLANNED roles with 5 Skill Levels
- **SAP Impact**: CO configuration — Manage Cost Rates and Manage Sales Prices per AT
- **Blocking GAP**: GAP-02 (Tarifa Purina must be segregated before AT rates can be loaded)
- **See**: `sofka-regional-finance` skill for full AT table

## ADR-003: Company Codes CO + EC (MVP)
- **Decision**: 2 Company Codes for MVP — Colombia (COP/DIAN) and Ecuador (USD/SRI)
- **SAP Impact**: FI configuration — separate Chart of Accounts extensions, tax procedures, e-invoicing
- **Note**: 5 Sofka entities (SOFKA, DIGITAL, ATIG, VALTICA, IMETRIX) — confirm which map to which Company Code
- **Blocking GAP**: GAP-03 (intercompany model must be defined before IC clearing accounts configured)

## ADR-004: Multi-Client via Sales Org / Distribution Channel / Business Partner
- **Decision**: Use Sales Organization + Distribution Channel + Business Partner hierarchy for multi-client management
- **SAP Impact**: SD configuration — pricing conditions vary by client, not by AT alone
- **Classification**: Configure (standard SAP capability)

## ADR-005: Revenue Recognition by Service Model (Scope 1IL)
- **Decision**: Configure Scope 1IL for 4 service variants with variant-specific recognition patterns
- **SAP Impact**: FI-RA configuration
- **Open**: Multi-currency COP+USD validation pending in sandbox (Assumption A-02)

## ADR-006: Strangler Fig Data Migration
- **Decision**: Incremental migration from 15+ Excel files to SAP using Strangler Fig pattern
- **SAP Impact**: Data migration — phased, not big-bang. Each Excel eliminated one at a time.

## ADR-007: Intercompany Cost-Plus (CO-EC)
- **Decision**: Cost-Plus transfer pricing with 8% markup for CO-EC intercompany
- **SAP Impact**: Scope 1GP/40Y configuration — IC pricing conditions, clearing accounts, FX treatment
- **Blocking GAP**: GAP-03 (model definition required before configuration)
- **See**: `sofka-regional-finance` skill for full intercompany scenario detail

---

## HENKA ADR Gap Classification

| ADR | Gap Type | Score | Rationale |
|-----|----------|-------|-----------|
| ADR-001 (Awards + CATS) | Extend | 7 | External API integration, medium effort, high business value |
| ADR-002 (Activity Types) | Configure | 3 | Standard CO functionality, parameter change only |
| ADR-003 (Company Codes) | Configure | 2 | Standard FI functionality |
| ADR-004 (Multi-client) | Configure | 3 | Standard SD functionality |
| ADR-005 (Revenue Rec) | Configure + Extend | 6 | T&M/Retainer = Configure; Fix Price = Extend |
| ADR-006 (Strangler Fig) | N/A (migration) | — | Not a gap — migration strategy |
| ADR-007 (IC Cost-Plus) | Configure | 4 | Standard IC, but requires GAP-03 data |

---

## Sandbox Validation Checklist

### Environment Setup
- [ ] Sandbox provisioned with SAP S/4HANA Public Cloud
- [ ] Company Codes CO (COP) and EC (USD) created
- [ ] Chart of Accounts with country extensions loaded
- [ ] 8 Activity Types configured with test Cost Rates and Sales Prices
- [ ] Tax procedures configured for CO (DIAN) and EC (SRI)
- [ ] Trading Partner configured between CO and EC
- [ ] Test employees created with AT assignments

### 7 PoCs (One per ADR)

| PoC | ADR | Validation Criteria | Pass/Fail |
|-----|-----|---------------------|-----------|
| PoC-1 | ADR-001 | External CATS call posts hours to PS/CO | |
| PoC-2 | ADR-002 | 8 Activity Types with distinct Cost/Sales Rates work in CO-PA | |
| PoC-3 | ADR-003 | Two Company Codes with IC clearing function correctly | |
| PoC-4 | ADR-004 | Multi-client pricing conditions apply correctly in SD | |
| PoC-5 | ADR-005 | T&M revenue recognized on timesheet confirmation; Retainer straight-line | |
| PoC-6 | ADR-006 | PLANNED data migrated; SAP output matches Excel within 0.1% | |
| PoC-7 | ADR-007 | IC posting cycle CO->EC with 8% markup, FX conversion, clearing | |

---

## Intercompany — Expanded (CO-EC)

### Posting Cycle (Step by Step)
```
1. CO entity: Employee works, confirms hours in Awards 2.0 / CATS
2. CO entity: SAP posts cost: Dr Labor Cost (CO), Cr Accrued Payroll (FI)
3. CO entity: IC billing run creates: Dr IC Receivable (FI), Cr IC Revenue (P&L)
   - IC Price = CTC Cost Rate x (1 + 8% markup)
4. EC entity: IC posting creates: Dr IC Cost (P&L), Cr IC Payable (FI)
   - FX conversion: COP -> USD at transaction date rate (NIC 21)
5. EC entity: Bills end client: Dr Accounts Receivable, Cr Revenue
   - Sales Price per AT x actual hours
6. Month-end: IC clearing — net IC Receivable (CO) against IC Payable (EC)
   - FX revaluation: remaining IC balances at closing rate, diff to P&L
7. Documentation: Transfer pricing evidence attached to IC postings
```

### IC Clearing Account Design
| Account | CO Entity (COP) | EC Entity (USD) | Purpose |
|---------|----------------|-----------------|---------|
| IC Receivable | 13XXXX | — | CO's claim on EC |
| IC Payable | — | 21XXXX | EC's obligation to CO |
| IC Revenue | 41XXXX | — | CO's markup income |
| IC Cost | — | 51XXXX | EC's intercompany cost |
| FX Gain/Loss | 42XXXX / 53XXXX | 42XXXX / 53XXXX | NIC 21 revaluation |

### Reconciliation
- Monthly: IC balance reconciliation between Company Codes (automated report)
- Quarterly: Transfer pricing documentation update
- Annually: Master File + Local File update for DIAN and SRI

---

## Data Migration — Strangler Fig (ADR-006)

### Concept
Instead of a big-bang migration of all 15+ Excel files on go-live day, each Excel is eliminated incrementally. SAP takes over one data domain at a time while the remaining Excels continue operating.

### Migration Priority Matrix

| Priority | Excel/Tool | Data Domain | SAP Target | Risk | Effort |
|----------|-----------|-------------|------------|------|--------|
| 1 (MVP) | PLANNED_RECOGNITION_DALE | Revenue recognition, hours, rates | SD + CO + FI-RA | High (272 records, 7 projects) | Medium |
| 2 (MVP) | Gabriel's CTC Excel | Cost rates per resource | CO (Manage Cost Rates) | High (key person risk) | Low |
| 3 (MVP) | Asignaciones (staffing) | Resource-project mapping | PS (WBS assignments) | Medium | Medium |
| 4 | Validador (ETL->BI) | Data validation, reporting | SAP Analytics Cloud (post-MVP) | Low | High |
| 5 | Python Tool (Leonardo) | Master project data | Coexistence — SAP PS receives, Python originates | Low | Low (interface only) |
| Deferred | Remaining 10+ Excel | Various operational data | Phase 2+ | Assess after MVP | TBD |

### Migration Protocol per Excel
1. **Map**: Document every column, formula, and business rule in the Excel
2. **Design**: Define SAP equivalent (table, field, transaction, app)
3. **Cleanse**: Run data quality checks; fix errors BEFORE loading
4. **Load**: Initial data migration to SAP sandbox
5. **Validate**: Compare SAP output with Excel output. Tolerance: <= 0.1% variance
6. **Shadow**: Run both SAP and Excel in parallel for 1-2 periods
7. **Cutover**: When SAP matches Excel consistently, decommission the Excel
8. **Document**: Archive the Excel with migration evidence
