---
name: sofka-regional-finance
author: JM Labs (Javier Montano)
description: >
  Regional finance and accounting standards skill covering Colombia (NIIF/DIAN/CTC),
  Ecuador (SRI/USD dollarization), Mexico (SAT/CFDI), United States (GAAP/ASC 606),
  Spain (AEAT/SII), and pan-Americas considerations. Use whenever the user mentions
  financial regulations, tax compliance, electronic invoicing, transfer pricing, CTC
  calculation, intercompany billing, multi-currency management, localization requirements,
  withholding taxes, or labor cost structures for IT services companies operating across
  these regions. Essential for SAP localization configuration and fit-to-standard financial
  workshops. Also trigger when discussing cost-vs-sale segregation, Activity Type cost
  rates, margin visibility, arm's length pricing, or any cross-border billing.
  Trigger: CTC calculation, transfer pricing, intercompany billing, tax compliance,
  e-invoicing, SAP localization, withholding taxes, Activity Type rates, margin visibility.
argument-hint: "<country-or-topic> [--scenario domestic|intercompany|shared-services]"
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash
  - Agent
---

# Regional Finance & Accounting Standards Skill

> "You cannot manage margin if cost and price live in the same number."

## Purpose

Provide financial regulatory guidance for IT services companies operating across Colombia, Ecuador, Mexico, United States, and Spain. Covers accounting standards (NIIF/IFRS, US GAAP), tax compliance, electronic invoicing, transfer pricing, CTC calculation, intercompany billing, and SAP localization.

This skill resolves the common IT services problem of blended rates — segregating CTC-based internal cost from client-facing sales price — enabling real margin visibility in SAP CO.

## When to Use

- Calculating CTC for IT services employees in any of 5 target countries
- Configuring SAP localization (Company Codes, tax procedures, e-invoicing)
- Designing intercompany billing and transfer pricing (OECD-compliant)
- Evaluating withholding tax implications for cross-border services
- Segregating cost rate from sales price for margin visibility
- Defining Activity Type cost structures for SAP CO

---

## Table of Contents

1. [Country Summaries](#country-summaries)
2. [CTC Calculation Framework](#ctc-calculation-framework)
3. [Cost-Sale Segregation](#cost-sale-segregation)
4. [Intercompany Scenarios](#intercompany-scenarios)
5. [Transfer Pricing](#transfer-pricing-decision-tree)
6. [SAP Localization Checklist](#sap-localization-checklist)
7. [Deliverable Structure](#deliverable-structure)

> For detailed CTC formulas with worked examples per country: `references/ctc-formulas-by-country.md`
> For tax systems, e-invoicing, withholding matrix, AT table: `references/tax-and-invoicing-matrix.md`

---

## Country Summaries

### Colombia (COP)
- **Framework**: NIIF/IFRS (Grupo 1). **Tax (2025)**: CIT 35%, IVA 19%/5%/0%
- **E-invoicing**: DIAN UBL 2.1 XML. SAP Note 2904459+
- **CTC payroll factor**: ~49.7% (>10 SMLMV) / ~54.7% (<10 SMLMV)
- **Key**: ReteFuente 4-11%, ICA, GMF 4x1000, auto-retencion

### Ecuador (USD — dollarized)
- **Framework**: NIIF/IFRS. **Tax (2025)**: CIT 25%, IVA 15%
- **E-invoicing**: SRI XML + digital signature
- **CTC payroll factor**: ~32%. Utilidades 15% profit sharing (mandatory)

### Mexico (MXN)
- **Framework**: NIF (converging IFRS). ISR 30%, IVA 16%, PTU 10%
- **E-invoicing**: CFDI via PAC. SAP Document Compliance

### United States (USD)
- **Framework**: US GAAP (ASC 606). Federal 21% + state 0-13.3%
- **CTC payroll factor**: ~25-35% (varies by state and benefits)

### Spain (EUR)
- **Framework**: PGC (EU IFRS). IS 25%, IVA 21%/10%/4%
- **E-invoicing**: SII real-time (4-day deadline)

> Full formulas, examples, hourly conversion: `references/ctc-formulas-by-country.md`

---

## CTC Calculation Framework

### Generic Formula (All Countries)
```
Base Salary (monthly)
+ Mandatory Social Security (employer portion)
+ Mandatory Benefits (vacation, bonuses, profit sharing)
+ Voluntary Benefits (health insurance, retirement match)
+ Non-salary Allocations (tools, office, training)
= TOTAL CTC per month
```

### Hourly Conversion
```
Internal Cost Rate = Monthly CTC / Productive Hours
Productive Hours = Standard Hours - Vacations - Holidays - Sick - Training
```

| Country | Standard Hours/Mo | Typical Productive | Payroll Factor |
|---------|-------------------|-------------------|----------------|
| Colombia | 192 (48h/wk) | 160-170 | ~49-55% |
| Ecuador | 160 (40h/wk) | 148-158 | ~32% |
| Mexico | 192 (48h/wk) | 155-165 | ~35-40% |
| US | 173 (40h/wk) | 155-165 | ~25-35% |
| Spain | 160 (40h/wk) | 140-152 | ~35-40% |

The payroll factor varies significantly because social security structure differs per country. Colombia's is highest due to combined health+pension+ARL+prestaciones. Ecuador is lowest because of simpler IESS structure.

---

## Cost-Sale Segregation

### The Problem
IT services companies often use a single blended rate per resource that mixes internal cost with client price. This makes real margin invisible and creates key-person risk when only one person knows the cost formula.

### Resolution: 3 Layers

**Layer 1 — CTC Cost Rate**: Calculate CTC per country → hourly rate. Load into SAP `Manage Cost Rates` by Activity Type and period.

**Layer 2 — Sales Price**: Client-negotiated rate, independent of CTC. Load into SAP `Manage Sales Prices` with pricing conditions by client, profile, seniority, currency.

**Layer 3 — Automatic Margin**: SAP CO-PA calculates `Margin = Sales Price - Cost Rate` per Activity Type per posting. No manual calculation needed.

### Activity Type Structure

Activity Types map skill levels to separate Cost Rate and Sales Price:

| Level | Description | Typical Margin Range |
|-------|-------------|---------------------|
| Architect | Architecture, cross-project design | 40-60% |
| Lead | Technical/management leadership | 35-55% |
| Senior | Autonomous execution, mentoring | 30-50% |
| Semi-Senior | Executes with minimal supervision | 30-45% |
| Junior | Developing, requires guidance | 25-40% |

Functional role (DevOps, QA, Frontend, etc.) is NOT an Activity Type dimension — it maps to employee qualifications in personnel master.

> For specific rate ranges and full AT table: `references/tax-and-invoicing-matrix.md`

---

## Intercompany Scenarios

### Scenario 1: Domestic (No IC)
Resource works for a domestic client. Billed by local entity. No intercompany. CTC from local formula.

### Scenario 2: Cross-Border Service Delivery
```
1. Sending entity incurs CTC cost (local currency)
2. Sending invoices receiving: CTC x (1 + markup %) = IC Price
3. FX conversion at transaction date rate (IAS 21 / NIC 21)
4. Receiving entity records IC cost (local currency)
5. Receiving bills end client at Sales Price
6. Month-end: IC clearing, FX revaluation
7. TP documentation attached
```

### Scenario 3: Shared Services
Central services (HR, Finance, IT) allocated to all entities. Cost-Plus 5-8%. Allocation key: headcount or revenue.

---

## Transfer Pricing Decision Tree

```
IT staff provision (people under client direction)?
|-- YES: Market comparables available?
|   |-- YES -> CUP (third-party rate cards)
|   |-- NO  -> Cost-Plus (CTC + 5-12% markup)
|-- NO: Shared services (HR, Finance, IT support)?
    |-- YES -> Cost-Plus 5-8% (low value-added safe harbor, OECD Par. 7.45)
    |-- NO: IP licensing or product development?
        |-- YES -> TNMM or Profit Split (requires benchmark study)
        |-- NO  -> Consult tax advisor
```

### Withholding Tax Considerations (Bilateral)
When two entities transact cross-border, withholding applies in both directions depending on service type, jurisdiction, and applicable double taxation agreement. Always verify:
- Withholding rates by service category in both jurisdictions
- Applicable DTA (e.g., CAN Decision 578 for Andean Community countries)
- Whether self-withholding or buyer-withholding applies

> For specific withholding matrix: `references/tax-and-invoicing-matrix.md`

---

## SAP Localization Checklist (Per Company Code)

- [ ] Company Code with country, currency, fiscal year variant
- [ ] Chart of Accounts (unified + country extension)
- [ ] Tax calculation procedures (VAT, income tax, withholding)
- [ ] Withholding tax types and codes per jurisdiction
- [ ] Electronic invoicing integration (SAP Document Compliance)
- [ ] Payment methods configuration
- [ ] Currency conversion rates (daily/monthly feed)
- [ ] Parallel ledger if required (local GAAP + IFRS)
- [ ] Intercompany trading partner (Scope 1GP/40Y)
- [ ] Transfer pricing markup in SD pricing conditions
- [ ] Activity Types with Cost Rates and Sales Prices

---

## Deliverable Structure

File: `XX_Analisis_Financiero_Regional_Deep.html`

1. Executive Summary: Jurisdictions, compliance requirements
2. Per-Country Tax & Compliance Cards (with "Last verified" dates)
3. CTC Calculation Models per country with worked examples
4. Cost-Sale Segregation: ATs, Cost Rate vs Sales Price
5. Intercompany Structure & Transfer Pricing
6. Withholding Tax Interaction Matrix
7. Multi-Currency Management Design
8. E-Invoicing Requirements Matrix
9. SAP Localization Configuration Scope
10. Compliance Risk Register

---

## Quality Criteria

1. All 5 countries documented with tax rates, verification dates, and SAP localization scope
2. CTC formulas for ALL 5 countries with worked examples and hourly conversion
3. Activity Types with separate Cost Rate and Sales Price ranges
4. Intercompany billing with TP method justification and arm's length evidence
5. Withholding tax matrix for bilateral transactions
6. E-invoicing mapped to SAP integration per country

## Anti-Patterns

1. **Using a single blended rate** — Always segregate CTC Cost Rate from Sales Price. The entire skill exists to prevent this.
2. **Hardcoding tax rates without dates** — Tax rates change. Every rate must include "Last verified: YYYY" and a verification note.
3. **Generic "check treaty" for withholding** — Always identify the specific DTA and applicable articles for the country pair.

## Edge Cases

1. **Volume-based pricing** — Some contracts have tiered rates by headcount per profile/month. SAP pricing conditions must support tiered rates, not flat.
2. **Salary threshold affecting payroll factor** — In Colombia, SENA/ICBF exemptions depend on salary vs SMLMV threshold. CTC calculation must branch.
3. **Dollarized economies** — Ecuador uses USD natively. IC with COP-denominated entities requires FX but not at the Ecuador entity level.

## Cross-References

- **sofka-sap-implementation**: Module configuration (CO Activity Types, SD pricing, FI Company Codes)
- **sofka-bpmn-process-analysis**: Intercompany billing process flows
- **analisis-horizontal-financiero**: Financial statement analysis with IT Services benchmarks
