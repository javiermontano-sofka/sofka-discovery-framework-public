# HENKA-Specific Process Variants & Templates

## Purpose

Detailed process flows for Sofka's 4 service models, RACI templates, automation ROI calculation methodology, and process maturity assessment framework specific to the HENKA SAP implementation.

---

## HENKA Service Variants

Sofka operates 4 service models. These are NOT exceptions — they are real, distinct business models that SAP must parameterize separately.

### Variant 1: Dale T&M (180h Fixed, COP)
- **Client**: DALE (Colombia)
- **Model**: Staffing with fixed 180h/month per resource
- **Billing**: Monthly, COP, hours x Sales Price per Activity Type
- **Revenue Recognition**: Over time, on timesheet confirmation
- **Pain Points**: Tarifa Purina mixes cost/sale; no real margin visibility
- **TO-BE**: Awards 2.0 -> CATS API -> SAP CO/SD with segregated Cost Rate + Sales Price

### Variant 2: Ecuador Actual Hours (Variable, USD)
- **Client**: Banco Pichincha and others (Ecuador)
- **Model**: Hours actually worked (variable monthly due to holiday calendar)
- **Billing**: Monthly, USD, actual hours x tiered rate (volume-based)
- **Revenue Recognition**: Over time, variable amount per month
- **Intercompany**: CO entity incurs CTC, invoices EC entity at Cost-Plus 8%, EC invoices client
- **Pain Points**: FX exposure COP-USD; rate variability complicates forecasting
- **TO-BE**: Same CATS integration + IC posting cycle (Scope 1GP/40Y)

### Variant 3: Fix Price (Milestones, Currently Broken)
- **Model**: Client pays per deliverable/milestone
- **Current AS-IS**: Hitos forced to staffing model (converted to fictitious hours) — fundamentally broken
- **Billing**: Should be milestone-based, not hour-based
- **Revenue Recognition**: Should be PoC (% completion) or milestone-based
- **Pain Points**: No proper recognition method; hours are fictitious
- **TO-BE**: Milestone Billing Plan in SAP SD + PoC recognition. Redesign required (S-12, post-MVP)

### Variant 4: Talent Zone (No Revenue)
- **Model**: Resources in training/bench with no client billing
- **Billing**: None
- **Revenue Recognition**: N/A — cost tracking only
- **TO-BE**: Internal Orders in SAP CO for cost accumulation. No SD involvement.

---

## RACI Templates

### Generic RACI Per Process Step
```
| Step | R | A | C | I |
|------|---|---|---|---|
| Create Project in SAP | PM | Account Director | Resource Mgr | Finance |
| Approve Timesheet | PM | Client Lead | — | Employee, Finance |
| Generate Invoice | Finance | CFO | PM | Client |
```

### HENKA 8 Stakeholders for RACI Assignment
1. Gerente de Operaciones (Operations Manager)
2. Service Manager
3. Controller al Servicio de la Operacion (Gabriel)
4. Account Director
5. Resource Manager
6. Finance / CFO
7. IT / Desarrollo Interno (Leonardo)
8. Gestion Humana (HR)

---

## Automation ROI Calculation Template

For each candidate automation opportunity:

```
Annual Manual Cost = (Hours/month x 12) x Hourly Rate of performer
Automation Development Cost = One-time build + test effort
Annual Maintenance Cost = ~15-20% of development cost
Annual Savings = Annual Manual Cost - Annual Maintenance Cost
ROI = (Annual Savings - Annual Maintenance) / Development Cost x 100%
Payback Period = Development Cost / (Annual Savings - Annual Maintenance)
```

### Worked Example (HENKA — timesheet validation)
```
AS-IS: 2 people x 4 hours/week x 52 weeks x COP 55,000/hr = COP 22,880,000/year
Automation: SAP validation rules, 3 weeks dev = COP 15,000,000
Maintenance: COP 2,250,000/year
Savings: COP 22,880,000 - 2,250,000 = COP 20,630,000/year
ROI: 137% first year
Payback: 8.7 months
```

---

## Process Maturity Assessment

| Level | Name | Characteristics | HENKA Typical |
|-------|------|----------------|---------------|
| 1 | **Ad-hoc** | Undocumented, person-dependent, tribal knowledge | Staffing allocation, CTC calculation |
| 2 | **Documented** | AS-IS captured but not standardized across GEOs | Billing cycle (CO only) |
| 3 | **Standardized** | Single process across GEOs, parameterized by country | Target for MVP processes |
| 4 | **Measured** | KPIs tracked, SLAs defined, dashboards active | Target for Phase 6 (Run) |
| 5 | **Optimized** | Continuous improvement, process mining, predictive | Long-term aspiration |

### Assessment Template
```
| Process Area | Current Level | Target Level | Gap | Priority |
|-------------|--------------|-------------|-----|----------|
| Timesheet entry | 2 (Awards exists) | 3 (SAP-integrated) | 1 | High |
| Billing cycle | 2 (CO documented) | 4 (measured) | 2 | High |
| Staffing allocation | 1 (tribal) | 3 (standardized) | 2 | Medium |
| Revenue recognition | 1 (manual) | 4 (SAP automatic) | 3 | Critical |
| Intercompany IC | 1 (undefined) | 3 (standardized) | 2 | Critical (GAP-03) |
```

---

## Compliance & Audit Trail

### Requirements by Standard

| Standard | Process Documentation Need | Audit Trail Element |
|----------|--------------------------|-------------------|
| IFRS 15 | Revenue recognition per contract type | Recognition method per service variant, evidence of performance obligation satisfaction |
| SOX (if applicable) | Segregation of duties | RACI showing no single person controls entire flow |
| DIAN/SRI | Invoice validity | E-invoicing timestamps, approval chain evidence |
| Transfer Pricing | Arm's length documentation | IC pricing methodology, markup calculation, comparable analysis |
| NIC 21 | FX treatment | Transaction date rate used, closing rate for revaluation |

### Audit Trail Design Per Process
For every process that touches financial data, document:
1. **Who** initiated, approved, and completed each step (from RACI)
2. **When** each step occurred (system timestamps)
3. **What** data was created, modified, or consumed
4. **Why** decisions were made (gateway documentation)
5. **Evidence**: Link to SAP document numbers, approval logs, e-invoice UUIDs

---

## Cross-reference
- **Runbook_Procesos_ASIS_TOBE_HENKA.md** in discovery/ for the full documented AS-IS/TO-BE process runbook
