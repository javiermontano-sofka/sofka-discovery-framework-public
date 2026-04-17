# Module Configuration — SD (Sales & Distribution) — {CLIENTE}

> **Module Specialist**: `@module-specialist` · **Phase**: CP-5 / Realize
> **Author**: Diseñado por Javier Montaño

## 1. Module Overview

SAP Sales & Distribution maneja órdenes de venta, precios, facturación y gestión de créditos. Para services: 1:1 Sales Order ↔ Project (PS).

## 2. Master Data Requirements

### 2.1 Customer Master (Business Partner)
- **Fiori App** [DOC]: Maintain Business Partner
- **Roles**: FLCU00 (Customer), FLCU01 (Customer + role)

### 2.2 Pricing Conditions
- **Fiori App** [DOC]: Manage Pricing Conditions
- **Condition Types**: PSP0 (Sales Price), PCP0 (Cost Price), discounts, taxes

### 2.3 Billing Plans
- **Types**: Periodic (retainer), Milestone (fixed price), Resource (T&M)

---

## 3. Configuration Steps

### 3.1 Sales Order Types por Billing Model

| Modelo | Sales Order Type | Billing Plan | Scope Item [DOC] |
|--------|-----------------|--------------|------------------|
| T&M Fixed Hours | OR/TA with timesheet | Resource-based | 4E9 |
| T&M Variable | OR/TA with timesheet + FX | Resource-based | 4E9 |
| Fixed Price | OR/TA + Milestones | Milestone Billing | 4E9 |
| Retainer | Service Contract | Periodic | 4E9 |

### 3.2 Pricing Condition Types
- **IMG Path** [CONFIG]: SPRO → Sales and Distribution → Basic Functions → Pricing → Define Condition Types
- **PSP0**: Sales Price per Activity Type
- **PCP0**: Cost Price (for margin visibility)

### 3.3 Billing Plans
- **IMG Path**: Billing → Billing Plan → Define Billing Plan Types
- **Milestone billing**: link to PS milestones
- **Periodic billing**: monthly run

### 3.4 Output Management (E-Invoicing)
- **IMG Path**: Billing → Billing Documents → Output
- **Country-specific**: CFDI (Mexico), FEL (Guatemala), etc.

### 3.5 Credit Management
- **Scope Item** [DOC]: 1EH
- **Credit check rules**: on sales order creation

---

## 4. Revenue Recognition Integration

| Scenario | SD Config | FI-RA Config | Scope Item |
|----------|-----------|--------------|-----------|
| T&M | Timesheet-based billing | Over time (hours x rate) | 1IL |
| Fixed Price | Milestone billing plan | % completion (PoC) | 1IL |
| Retainer | Periodic billing | Straight-line | 1IL |

---

## 5. Scope Items Activation

| Scope Item | Status | Notes |
|-----------|--------|-------|
| 4E9 | Activate | Project Billing |
| J14 | Activate | Sales Orders for Projects |
| 1IL | Activate | Revenue Recognition |
| 1EH | Conditional | Credit Management |

---

## 6. Dependencies con Otros Módulos

| Módulo | Dependencia | Acción |
|--------|-------------|--------|
| CO | Activity Type Sales Price | Coordinar con CO specialist |
| PS | Sales Order ↔ Project 1:1 | Coordinar con PS specialist |
| FI | Revenue postings → GL | Coordinar con FI specialist |
| FI-RA | Revenue recognition rules | Config conjunta |

---

## 7. Test Plan

### 7.1 T&M Scenario
- [ ] Create Sales Order (T&M type)
- [ ] Link to Project (PS)
- [ ] Confirm timesheet
- [ ] Generate invoice
- [ ] Revenue recognition posting

### 7.2 Fixed Price Scenario
- [ ] Create Sales Order with Milestone Billing Plan
- [ ] Achieve milestone (PS)
- [ ] Trigger billing
- [ ] Revenue per milestone

### 7.3 Retainer Scenario
- [ ] Create Service Contract
- [ ] Periodic billing run
- [ ] Straight-line revenue

---

## 8. Risks & Mitigations

| Risk | Mitigation |
|------|-----------|
| Pricing errors | Test with real client data pre-go-live |
| Milestone misalignment | PS-SD workshop for milestone design |
| E-invoicing compliance | Country-specific output testing |

---

## Quality Validation

- [ ] Sales Order types per billing model configurados
- [ ] Pricing conditions con segregación Cost vs Sales
- [ ] Billing plans por tipo (periodic/milestone/resource)
- [ ] Revenue recognition integration
- [ ] E-invoicing compliance por país
- [ ] `@qa-validator` consistency check

---

## Ghost Menu

| Acción | Comando |
|--------|---------|
| Configurar FI (revenue recognition) | `/sap:module-config FI` |
| Configurar PS (project linkage) | `/sap:module-config PS` |

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
