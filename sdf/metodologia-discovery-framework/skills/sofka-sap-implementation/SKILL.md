---
name: sofka-sap-implementation
author: JM Labs (Javier Montano)
description: >
  SAP S/4HANA implementation skill covering module selection (CO, SD, PS, FI, HCM),
  SAP Activate methodology, fit-to-standard workshops, multi-country localization,
  intercompany configuration, and professional services industry patterns. Use whenever
  the user mentions SAP, S/4HANA, SAP implementation, fit-to-standard, SAP modules,
  SAP localization, SAP migration, ERP implementation, or needs guidance on SAP
  configuration for IT services companies. Also trigger for SAP-specific gap analysis,
  SAP scope definition, SAP best practices, CATS integration, Strangler Fig migration,
  Activity Type configuration, or revenue recognition patterns for T&M, fixed price,
  retainer, or managed services contracts.
  Trigger: SAP implementation, S/4HANA configuration, fit-to-standard, SAP modules,
  SAP localization, CATS integration, Strangler Fig, Activity Types, revenue recognition.
argument-hint: "<module-or-topic> [--variant tm|fixprice|retainer|managed]"
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash
  - Agent
---

# SAP S/4HANA Implementation Skill

> "Fit-to-Standard is not about bending the business to SAP — it's about finding where SAP already solved the problem."

## Purpose

Guide SAP S/4HANA Public Cloud implementations for IT services companies. Covers module configuration, SAP Activate methodology, fit-to-standard workshops, multi-country localization, intercompany billing, incremental data migration (Strangler Fig), timesheet integration (external frontend + CATS API), and revenue recognition across multiple service variants.

## When to Use

- Planning or executing SAP S/4HANA implementation for professional services
- Conducting fit-to-standard workshops or gap analysis
- Configuring SAP modules (CO, SD, PS, FI, HCM) for staffing/IT services
- Addressing multi-country localization
- Designing intercompany and transfer pricing configurations
- Planning incremental data migration from legacy Excel/tools to SAP
- Designing timesheet integration (external frontend + CATS API)
- Configuring revenue recognition for different service models

---

## Table of Contents

1. [SAP Module Reference](#sap-s4hana-module-reference)
2. [Revenue Recognition — Service Variants](#revenue-recognition--service-variants)
3. [Fit-to-Standard Framework](#fit-to-standard-workshop-framework)
4. [Intercompany Configuration](#intercompany-configuration)
5. [Strangler Fig Migration](#strangler-fig-data-migration)
6. [Timesheet Integration](#timesheet-integration-via-cats-api)
7. [Implementation Risks](#implementation-risks)
8. [Deliverable Structure](#deliverable-structure)

> For project-specific ADRs, PoCs, and sandbox validation: `references/henka-adrs-and-pocs.md`
> For SAP Activate phases and localization checklists: `references/sap-activate-and-localization.md`

---

## SAP S/4HANA Module Reference

### CO - Controlling

**Key Objects for IT Services**:
- **Cost Centers**: Departments, teams, GEOs
- **Profit Centers**: Business units with revenue AND cost
- **Activity Types**: Work classification by seniority. Link to Cost Rates and Sales Prices.
- **Internal Orders**: Time-bound initiatives (training, bench, internal projects)
- **Statistical Key Figures**: Headcount, hours, utilization

**Decision Tree — Which CO Object?**
```
What are you tracking?
|-- Recurring departmental costs -> Cost Center
|-- Revenue AND cost for a business unit -> Profit Center
|-- A specific time-bound initiative -> Internal Order
|-- Hours worked at a certain skill level -> Activity Type
|-- An external client deliverable -> WBS Element (PS)
```

**Activity Type Configuration**:
Activity Types map skill levels to Cost Rates and Sales Prices. Each AT has:
- **Cost Rate** (from CTC per country, loaded via Manage Cost Rates)
- **Sales Price** (client-negotiated, loaded via Manage Sales Prices)
- **Validity period** (rates change with annual reviews)

See `sofka-regional-finance` skill for CTC formulas and AT rate tables.

### SD - Sales & Distribution

**Decision Tree — Which Document Type?**
```
What kind of engagement?
|-- Client pays per hour worked -> Sales Order (T&M)
|-- Client pays on milestones -> Sales Order + Milestone Billing Plan
|-- Client pays fixed monthly -> Sales Order + Periodic Billing
|-- Client pays per ticket/SLA -> Service Contract
```

| Model | SAP Config | Revenue Recognition |
|-------|-----------|-------------------|
| Time & Materials | Sales order + timesheet confirmation | Hours x Rate per period |
| Fixed Price | Sales order + milestone billing plan | PoC or milestone-based |
| Retainer | Sales order + periodic billing | Monthly straight-line |
| Managed Services | Service contract + SLA monitoring | Per-period or per-ticket |

### PS - Project System

- **WBS Elements**: Hierarchical project structure
- **Activities/Networks**: Task scheduling with resource assignments
- **Milestones**: Deliverable dates linked to billing events
- **Project Profiles**: Templates per project type

### FI - Financial Accounting

- **Company Codes**: One per legal entity
- **Chart of Accounts**: Unified with country-specific extensions
- **Currency Types**: Group, local, hard currency
- **Parallel Ledgers**: Local GAAP + IFRS if required
- **Withholding Tax**: Per country (see regional-finance skill)

### HCM / SuccessFactors

- **Employee Master**: Links to Activity Types and Cost Rates
- **Time Management**: Native Manage My Timesheet OR external frontend + CATS API
- **Payroll Integration**: Hours -> payroll per country labor law

---

## Revenue Recognition — Service Variants

IT services companies typically have multiple billing models. Each requires distinct SAP config:

| Variant | SAP Config | Recognition Pattern | Notes |
|---------|-----------|---------------------|-------|
| **T&M Fixed Hours** | Timesheet x Sales Price per AT. Scope 1IL. | Over time: monthly on hours confirmed | Most common for staffing |
| **T&M Variable** | Same + FX conversion, volume tiers | Over time: monthly, variable | Cross-border scenarios |
| **Fixed Price** | Milestone Billing Plan in SD. PoC. | Over time: % completion | Requires proper milestone design |
| **Cost-Only (Bench)** | Internal Orders in CO. No SD. | N/A — cost tracking only | No revenue recognition needed |

**Decision Tree**:
```
Revenue-generating contract?
|-- NO -> Internal Order (CO only). Bench/training.
|-- YES: Pricing per hour?
    |-- YES: Fixed hours/month? -> T&M fixed. Variable? -> T&M variable.
    |-- NO: Per milestone? -> Fixed Price. Monthly fee? -> Retainer.
```

---

## Fit-to-Standard Workshop Framework

1. **Present SAP Best Practice** for the process area
2. **Compare with AS-IS**: Green (match), Yellow (partial), Red (mismatch)
3. **Score gaps**:

| Dimension | 1 (Low) | 3 (Medium) | 5 (High) |
|-----------|---------|------------|----------|
| **Effort** | < 3 days | 1-2 weeks | > 2 weeks |
| **Risk** | No dependencies | Some | Critical path |
| **Upgrade Impact** | None | Key user ext. | Custom ABAP |
| **Business Value** | Nice to have | Important | Must have |

**Score = Effort + Risk + Upgrade Impact - Business Value**. Lower = higher priority.

| Gap Type | Score | Recommendation |
|----------|-------|----------------|
| Fit | 0 | Use standard |
| Configure | 2-4 | Preferred |
| Extend | 5-8 | Acceptable with justification |
| Custom | 9-12 | Avoid — redesign process |
| Workaround | 3-6 | Assess change management effort |

---

## Intercompany Configuration

### Posting Cycle (Cross-Border IT Services)
```
1. Sending entity: Employee works, confirms hours
2. Sending entity: Cost posted (Dr Labor Cost, Cr Payroll Accrual)
3. Sending entity: IC billing (Dr IC Receivable, Cr IC Revenue)
   - IC Price = CTC Cost Rate x (1 + markup %)
4. Receiving entity: IC posting (Dr IC Cost, Cr IC Payable)
   - FX conversion at transaction date rate (IAS 21)
5. Receiving entity: Bills end client (Dr AR, Cr Revenue)
6. Month-end: IC clearing + FX revaluation
7. TP documentation attached to postings
```

### IC Account Design
| Account | Sending Entity | Receiving Entity | Purpose |
|---------|---------------|-----------------|---------|
| IC Receivable | Balance sheet | — | Claim on receiving entity |
| IC Payable | — | Balance sheet | Obligation to sending |
| IC Revenue | P&L | — | Markup income |
| IC Cost | — | P&L | Intercompany cost |
| FX Gain/Loss | P&L | P&L | IAS 21 revaluation |

---

## Strangler Fig Data Migration

Instead of big-bang migration, eliminate legacy Excel/tools incrementally. SAP takes over one data domain at a time.

### Migration Protocol Per Source
1. **Map**: Document every column, formula, business rule
2. **Design**: Define SAP equivalent (table, field, app)
3. **Cleanse**: Data quality checks; fix BEFORE loading
4. **Load**: Initial migration to sandbox
5. **Validate**: SAP output vs legacy. Tolerance: <= 0.1% variance
6. **Shadow**: Parallel run for 1-2 periods
7. **Cutover**: Decommission legacy when SAP matches consistently
8. **Document**: Archive with migration evidence

### Priority Matrix Template
| Priority | Source | Data Domain | SAP Target | Risk |
|----------|--------|-------------|-----------|------|
| 1 (MVP) | Revenue tracking | Hours, rates, recognition | SD + CO + FI-RA | High |
| 2 (MVP) | Cost rate source | Cost per resource | CO (Manage Cost Rates) | High (key person) |
| 3 (MVP) | Staffing allocation | Resource-project mapping | PS (WBS assignments) | Medium |
| 4 | Validation/BI | Reporting | Analytics Cloud | Low |
| 5+ | Remaining tools | Various | Phase 2+ | TBD |

---

## Timesheet Integration via CATS API

### Why External Frontend + CATS
When employees already use an established timesheet tool, forcing migration to SAP's native Manage My Timesheet risks adoption resistance. Instead, preserve the familiar frontend and integrate with SAP backend via CATS BAPI.

### Architecture
```
[External Timesheet Frontend] --REST/JSON--> [SAP CPI/BTP]
  --CATS BAPI--> [SAP S/4HANA]
  --> PS (hours) + CO (cost allocation) + SD (billing trigger)
```

### Error Handling Patterns
| Error | Response | Resolution |
|-------|----------|------------|
| Invalid WBS/Project | Rejection | User corrects in frontend |
| Inactive Activity Type | Rejection | Admin activates for period |
| Hours exceed threshold | Warning/rejection | PM override or correction |
| API timeout | No response | Retry queue with alerting |
| Employee not assigned | Rejection | PM assigns in PS first |

---

## Implementation Risks (IT Services Pattern)

| Risk | Impact | Mitigation |
|------|--------|-----------|
| Master data quality | High | Data cleansing sprint per source |
| Blended rate (no cost/price split) | High | CTC formula automation; Activity Types |
| Intercompany model undefined | High | Cost-Plus proposal; tax advisor validation |
| External timesheet delayed | High | Fallback to native Manage My Timesheet |
| Multi-currency rounding | Medium | Rounding rules upfront; test with real data |
| Key person dependency on cost calc | High | Document formula; automate in SAP |
| Parallel ERP/system implementation | Medium | Coordinate touchpoints and release calendars |
| User adoption resistance | High | Change management + keep familiar frontend |

---

## Deliverable Structure

### Gap Analysis: `XX_Gap_Analysis_SAP_Deep.html`
1. Executive Summary: Scope, modules, gap count by type
2. Module-by-Module Gap Analysis (CO, SD, PS, FI, HCM)
3. Gap Detail Cards with scoring
4. Intercompany & Localization Gaps
5. Prioritized Remediation Roadmap

### Implementation Roadmap: `XX_Roadmap_SAP_Deep.html`
1. SAP Activate phase timeline
2. Module deployment sequence
3. Migration calendar (Strangler Fig)
4. Risk register with mitigations
5. PoC milestone tracker

---

## Quality Criteria

1. All SAP modules identified with configuration scope and gap scores
2. Service variants mapped to distinct revenue recognition configurations
3. Intercompany posting cycle documented with GL account design
4. Migration priority matrix with per-source protocol
5. Timesheet integration architecture with error handling
6. Multi-country localization documented per jurisdiction
7. Risk register with IT-services-specific mitigations

## Anti-Patterns

1. **Generic ERP advice** — Every recommendation must name the SAP app, scope code, or config step.
2. **Treating blocking gaps independently** — Interdependent gaps (e.g., master data + cost segregation + intercompany) must be resolved as a package.
3. **Assuming big-bang migration** — Always propose Strangler Fig incremental approach unless explicitly overridden.
4. **Conflating cost rate with sales price** — Always segregate CTC-based Cost Rate from client Sales Price.

## Edge Cases

1. **Fixed price variant with broken AS-IS** — When milestones are forced to fictitious hours, do not propose timesheet-based recognition. Redesign with Milestone Billing Plan.
2. **External timesheet timeline outside control** — Always document both paths (external integration AND native fallback) in recommendations.
3. **Per-account allocation files** — Legacy staffing allocation may exist as N files (one per account/client), not a single master. Migration must account for this family.

## Cross-References

- **sofka-regional-finance**: CTC formulas, Activity Type rates, transfer pricing, withholding matrix
- **sofka-bpmn-process-analysis**: AS-IS/TO-BE process models, Fit-to-Standard workshop flows
- **analisis-horizontal-financiero**: Financial analysis for implementation business case
