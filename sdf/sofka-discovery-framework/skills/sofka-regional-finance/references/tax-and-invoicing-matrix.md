# Tax Systems & Electronic Invoicing Matrix

## Purpose

Consolidated tax system reference and electronic invoicing requirements for the 5 HENKA jurisdictions. Includes accounting standards, withholding tax interaction matrix, and SAP localization configuration scope.

---

## Accounting Standards by Country

| Country | Framework | Body | Functional Currency | Fiscal Year |
|---------|-----------|------|---------------------|-------------|
| Colombia | NIIF/IFRS (Grupo 1) | Superintendencia de Sociedades | COP | Calendar |
| Ecuador | NIIF/IFRS | Superintendencia de Companias | USD (dollarized) | Calendar |
| Mexico | NIF (converging IFRS) | CINIF | MXN | Calendar |
| United States | US GAAP (ASC) | FASB/SEC | USD | Calendar or fiscal |
| Spain | PGC (EU IFRS aligned) | ICAC | EUR | Calendar |

---

## Tax Systems (Last verified: 2025)

### Colombia
- **Corporate Income Tax**: 35%. Verify current rate — potential reform changes.
- **IVA (VAT)**: 19% standard, 5% reduced, 0% exports of services
- **Retencion en la Fuente**: Withholding at source (rates vary by activity: 4-11% for services)
- **ICA**: Municipal industry and commerce tax (0.5-3.5% depending on municipality)
- **Auto-retencion**: Self-withholding for large taxpayers
- **GMF**: Financial transactions tax (4x1000)

### Ecuador
- **Corporate Income Tax**: 25% standard (may vary by sector/size)
- **IVA**: 15% standard (increased 2024). Verify stability.
- **Withholding**: 1-10% depending on service type
- **Advance Income Tax**: Quarterly prepayments
- **Utilidades (Profit Sharing)**: 15% of net profits distributed to employees (mandatory)

### Mexico
- **Corporate Income Tax (ISR)**: 30%
- **IVA**: 16% standard, 0% exports, 8% border zone
- **ISR Withholding on Services**: 10% for foreign services
- **IEPS**: Special production/services tax (certain categories)
- **PTU**: Profit sharing with employees (10% of fiscal profits)

### United States
- **Federal Corporate Tax**: 21%
- **State Income Tax**: 0-13.3% (varies by state)
- **Sales Tax**: State-by-state nexus, generally not applicable to IT services B2B
- **FUTA/SUTA**: Unemployment insurance
- **Multi-state**: Nexus determination based on economic presence (Wayfair ruling)

### Spain
- **Corporate Income Tax (IS)**: 25% standard
- **IVA**: 21% standard, 10% reduced, 4% super-reduced
- **Withholding on Services**: 15% standard for professional services
- **EU Intra-community**: Reverse charge mechanism for B2B cross-border services

---

## Electronic Invoicing Requirements

| Country | Authority | Format | Validation | SAP Integration |
|---------|-----------|--------|------------|-----------------|
| Colombia | DIAN | UBL 2.1 XML + digital signature | Real-time (max 24h acceptance) | SAP Document Compliance (SAP Note 2904459+) or third-party PAC |
| Ecuador | SRI | XML + digital signature | Real-time SRI validation | SRI-compliant via SAP Document Compliance |
| Mexico | SAT | CFDI XML | PAC certification, UUID per invoice | SAP Document Compliance for Mexico |
| Spain | AEAT | SII real-time VAT reporting | 4 business days from invoice | SII integration in SAP S/4HANA |
| US | N/A | No federal e-invoicing mandate | N/A | Standard PDF/print invoicing |

---

## Withholding Tax Interaction Matrix (CO <-> EC)

| Direction | Service Type | Retencion CO | Retencion EC | DTA |
|-----------|-------------|-------------|-------------|-----|
| CO invoices EC | IT staff aug | N/A (seller) | 1-10% on payment | CAN Decision 578 |
| EC invoices CO | IT staff aug | ReteFuente 4-11% | N/A (seller) | CAN Decision 578 |
| CO invoices EC | Shared services | N/A | 1-5% | Verify treaty article |
| EC invoices CO | Consulting | ReteFuente 11% | N/A | Verify treaty article |

**CAN Decision 578**: Colombia and Ecuador are Comunidad Andina members. This decision provides rules to avoid double taxation. Verify applicability with tax advisor before configuring SAP withholding tax types.

---

## Tarifa Purina — Problem and Resolution

### What It Is
"Tarifa Purina" is Sofka's term for a single net rate per resource that mixes the internal CTC (cost to company) with the client-facing sales price. This single number makes it impossible to calculate real margin by project, client, or period.

### Why It Fails
- **No margin visibility**: P&L shows revenue and a blended cost, but the split is unknown
- **Person dependency**: Gabriel Lopez is the only one who knows the CTC formula — his absence paralyzes cost calculation (risk R-07)
- **SAP incompatibility**: SAP CO requires separate Cost Rate and Sales Price objects

### Resolution: Segregate CTC from Sales Price
**Layer 1 — CTC Cost Rate**: Use CTC formulas per country (see ctc-formulas-by-country.md). Load into SAP `Manage Cost Rates` by Activity Type and period.
**Layer 2 — Sales Price**: Negotiated client rate, independent of CTC. Load into SAP `Manage Sales Prices` with pricing conditions by client, profile, seniority, currency.
**Layer 3 — Automatic Margin**: SAP CO-PA calculates `Margin = Sales Price - Cost Rate` per Activity Type per posting.

### Activity Type Structure (ADR-002 Reconciliation)

8 Activity Types reconcile the 16 PLANNED roles with 5 ADR-002 Skill Levels:

| AT | Skill Level | Description | CO Cost Rate Range | CO Sales Rate Range |
|----|-------------|-------------|--------------------|---------------------|
| AT-01 | Architect | Architecture, cross-project design | COP 75K-95K/hr | COP 120K-160K/hr |
| AT-02 | Lead Technical | Technical leadership, code authority | COP 60K-80K/hr | COP 95K-130K/hr |
| AT-03 | Lead Management | PM, coordination, client management | COP 55K-75K/hr | COP 90K-120K/hr |
| AT-04 | Senior Technical | Autonomous execution, mentoring | COP 45K-60K/hr | COP 70K-100K/hr |
| AT-05 | Senior Management | Process management, reporting | COP 42K-55K/hr | COP 65K-90K/hr |
| AT-06 | Semi-Senior | Executes with minimal supervision | COP 35K-48K/hr | COP 55K-75K/hr |
| AT-07 | Junior Rookie | Developing, requires guidance | COP 25K-35K/hr | COP 40K-55K/hr |
| AT-08 | Junior Newbie | Entry level, 20% discount | COP 20K-28K/hr | COP 32K-45K/hr |

Functional role (DevOps, QA, Frontend) is NOT an Activity Type dimension — it maps to employee qualifications in personnel master.

---

## HENKA Intercompany Scenarios (CO-EC)

### Scenario 1: Colombian Resource for Any CO Account (CO-CO, no IC)
Resource in CO works for a Colombian account (e.g., DALE, SURA). Billed by CO entity in COP. No intercompany. CTC: Colombian formula. Revenue: hours x Sales Price per AT. Source data: `ASIGNACION_*` where `*` is the account name (e.g., ASIGNACION_DALE, ASIGNACION_SURA).

### Scenario 2: Colombian Resource for Ecuador Client (CO->EC)
```
1. CO entity incurs CTC cost (COP)
2. CO invoices EC intercompany: CTC x (1 + 8% markup) = IC Price (COP)
3. FX conversion: IC Price COP -> USD at transaction date rate (NIC 21)
4. EC entity records IC cost (USD)
5. EC invoices end client in USD at Sales Price
6. EC margin = Client Sales Price - IC Cost (USD)
7. CO margin = IC markup (8% of CTC)
```
Source data: `ASIGNACION_PICHINCHA` or other EC account Excel.
Withholding: See matrix above. TP method: Cost-Plus 8%. FX risk: CO bears COP/USD on IC receivable.

### Scenario 3: Shared Services Allocation
Central services (HR, Finance, IT) in CO allocated to all entities. Method: Cost-Plus 5-8%. Allocation key: headcount or revenue proportional. SAP: Internal Orders + IC billing via Scope 1GP.

---

## Transfer Pricing Decision Tree

```
Is it provision of IT staff (people under client direction)?
|-- YES: Market comparables available?
|   |-- YES -> CUP (third-party rate cards for same market)
|   |-- NO  -> Cost-Plus (CTC + 5-12% markup)
|       Recommended: staff aug 5-10%, managed svcs 8-15%
|-- NO: Shared services (HR, Finance, IT support)?
    |-- YES -> Cost-Plus 5-8% (low value-added safe harbor)
    |-- NO: IP licensing or product development?
        |-- YES -> TNMM or Profit Split (requires benchmark study)
        |-- NO  -> Consult tax advisor
```

**HENKA MVP default**: Cost-Plus 8% for all CO-EC IC transactions. Median of OECD-defensible range (Q1=5%, Q2=8%, Q3=12%). Neutral between CO 35% CIT and EC 25% CIT.
