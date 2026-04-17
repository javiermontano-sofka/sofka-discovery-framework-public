# Module Configuration — PS (Project System) — {CLIENTE}

> **Module Specialist**: `@module-specialist` · **Phase**: CP-5 / Realize
> **Author**: Diseñado por Javier Montaño

## 1. Module Overview

SAP Project System (PS) estructura proyectos jerárquicamente (WBS), planifica recursos, trackea milestones y conecta con SD (billing) y CO (costing).

## 2. Master Data Requirements

### 2.1 Project Profiles
- **Fiori App** [DOC]: Manage Project Profiles
- **Types**: Customer Project, Internal Project, Opportunity Project

### 2.2 WBS Element Hierarchy
- **Typical depth**: 3-5 levels (Project → Phase → Work Package → Activity)
- **Naming convention**: {prefix-client-year-sequence}

### 2.3 Networks / Activities
- **Fiori App** [DOC]: Manage Project Activities

### 2.4 Milestones
- **Linked to**: SD Billing Plan for fixed-price
- **Validation**: must be achievable (not artificial)

---

## 3. Configuration Steps

### 3.1 Project Profile Setup
- **IMG Path** [CONFIG]: SPRO → Project System → Structures → Operative Structures → WBS → Create Project Profiles
- **Scope Item** [DOC]: J11 (Customer Projects)

### 3.2 WBS Element Master Data
- **Fiori App** [DOC]: Manage Projects — Financials
- **Settings**: planning allowed, account assignment, billing element

### 3.3 Commercial Project Management (CPM)
- **Fiori App** [DOC]: Commercial Project Management
- **Features**: budget vs actual, profitability dashboard, staffing

### 3.4 Time Recording Integration
- **Option A**: Manage My Timesheet (native SAP Fiori)
- **Option B**: External timesheet → CATS BAPI via CPI
- **Scope Item** [DOC]: J12 (Time Management)

### 3.5 Resource Assignment
- **Fiori App** [DOC]: Staff Resource Requests

---

## 4. Project-to-Sales Order Linkage (1:1)

```
Customer Project (PS)
    ↓ 1:1
Sales Order (SD)
    ↓
Billing Plan (periodic/milestone)
    ↓
Revenue Recognition (FI-RA, Scope 1IL)
```

---

## 5. Scope Items Activation

| Scope Item | Status | Notes |
|-----------|--------|-------|
| J11 | Activate | Customer Projects |
| J12 | Activate | Time Management |
| (integration) | Config | Sales Order ↔ Project |

---

## 6. Dependencies con Otros Módulos

| Módulo | Dependencia | Acción |
|--------|-------------|--------|
| CO | Activity Types → Resource Costing | Coordinar con CO specialist |
| SD | Sales Order ↔ Project 1:1 | Coordinar con SD specialist |
| HCM | Employee → Project Assignment | Coordinar con HCM specialist |
| FI | Project postings → GL | Coordinar con FI specialist |

---

## 7. Test Plan

### 7.1 Project Lifecycle
- [ ] Create Customer Project
- [ ] Build WBS hierarchy
- [ ] Assign resources
- [ ] Set milestones
- [ ] Link to Sales Order

### 7.2 Time Recording
- [ ] Record time via Fiori (native)
- [ ] Record time via external + CATS
- [ ] Approve timesheet
- [ ] Post to WBS

### 7.3 Billing Integration
- [ ] Milestone achievement → billing trigger
- [ ] Monthly T&M billing run

### 7.4 Project Analytics
- [ ] CPM dashboard: budget vs actual
- [ ] Profitability by project

---

## 8. Risks & Mitigations

| Risk | Mitigation |
|------|-----------|
| WBS hierarchy too deep | Design workshop — max 5 levels |
| External timesheet delay | Fallback plan: Manage My Timesheet |
| Milestones artificial | Milestone design workshop with PM community |

---

## Quality Validation

- [ ] Project Profiles configurados por tipo
- [ ] WBS hierarchy diseñada
- [ ] Milestones alineados con SD Billing Plans
- [ ] Time recording integration working
- [ ] Resource assignment functional
- [ ] CPM dashboard operative
- [ ] `@qa-validator` consistency check

---

## Ghost Menu

| Acción | Comando |
|--------|---------|
| Configurar SD | `/sap:module-config SD` |
| Configurar CO | `/sap:module-config CO` |
| Generar extensión ABAP | `/sap:generate-abap "Custom PS report"` |

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
