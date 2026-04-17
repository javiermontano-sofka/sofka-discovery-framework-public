# Module Configuration — CO (Controlling) — {CLIENTE}

> **Module Specialist**: `@module-specialist` · **Phase**: CP-5 / Realize
> **Author**: Diseñado por Javier Montaño

## 1. Module Overview

SAP Controlling (CO) maneja costos, ingresos y rentabilidad interna. Crítico para profesionales services: Activity Types segregan Cost Rate (CTC) de Sales Price (client rate).

## 2. Master Data Requirements

### 2.1 Cost Centers
- **Fiori App** [DOC]: Manage Cost Centers
- **Hierarchy design**: {niveles + naming convention}
- **Ownership**: {functional owner}

### 2.2 Profit Centers
- **Fiori App** [DOC]: Manage Profit Centers
- **Hierarchy**: {business units / geographies}

### 2.3 Activity Types
- **Fiori Apps** [DOC]:
  - Manage Cost Rates (set Cost Rate per period)
  - Manage Sales Prices (set Sales Price per contract)
- **Rate segregation MANDATORY**: CTC-based Cost Rate ≠ client-negotiated Sales Price
- **Validity periods**: annual review

### 2.4 Internal Orders
- **Fiori App** [DOC]: Manage Internal Orders
- **Usage**: bench, training, internal projects (cost-only)

---

## 3. Configuration Steps

### 3.1 Controlling Area Setup
- **IMG Path** [CONFIG]: SPRO → Controlling → General Controlling → Organization → Maintain Controlling Area
- **Scope Item** [DOC]: 1FC (Cost Center Accounting)

### 3.2 Cost Center Hierarchy
- **IMG Path**: Controlling → Cost Center Accounting → Master Data → Cost Centers
- **Naming convention**: {CC-{region}-{dept}}

### 3.3 Activity Type Configuration
- **IMG Path**: Controlling → Cost Center Accounting → Master Data → Activity Types
- **Rate tables**:
  - Cost Rate (from CTC per country — cross-reference `sap-regional-finance`)
  - Sales Price (client-negotiated)

### 3.4 CO-PA (if profitability analysis required)
- **Scope Item** [DOC]: J87 (CO-PA)
- **Characteristics**: {list}
- **Value fields**: {list}

### 3.5 Allocation Cycles
- **IMG Path**: Period-end closing allocation rules
- **Frequency**: Monthly

---

## 4. Scope Items Activation

| Scope Item | Status | Notes |
|-----------|--------|-------|
| 1FC | Activate | Base Cost Center Accounting |
| 1G0 | Conditional | Profit Center if business units need P&L |
| J87 | Conditional | CO-PA if multi-dimensional profitability needed |

---

## 5. Dependencies con Otros Módulos

| Módulo | Dependencia | Acción requerida |
|--------|-------------|-----------------|
| SD | Activity Type → Sales Price | Coordinar con `@module-specialist` SD |
| PS | Activity Type → Resource Costing | Coordinar con `@module-specialist` PS |
| FI | CO postings → GL accounts | Coordinar con `@module-specialist` FI |
| HCM | Employee → Cost Center assignment | HR master data |

---

## 6. Test Plan

### 6.1 Unit Tests
- [ ] Create Cost Center
- [ ] Create Activity Type + Rate + Sales Price
- [ ] Post manual cost to Cost Center
- [ ] Run allocation cycle

### 6.2 Integration Tests
- [ ] Cost flow CO → FI
- [ ] Activity Type rate → SD billing
- [ ] Internal Order settlement

### 6.3 UAT Scenarios
- [ ] Period-end closing full cycle
- [ ] CO-PA report generation
- [ ] Cost Center reporting

---

## 7. Risks & Mitigations

| Risk | Mitigation |
|------|-----------|
| Blended rate (no cost/price split) | Automate CTC formula via `sap-regional-finance` |
| Master data quality | Data cleansing sprint per source |
| Activity Type rate change propagation | Communication Arrangement to SD |

---

## Quality Validation

- [ ] Todas las Cost Centers creadas
- [ ] Activity Types con Cost Rate + Sales Price segregados
- [ ] Allocation cycles configuradas
- [ ] CO-FI reconciliation OK
- [ ] Test cases pasaron
- [ ] `@qa-validator` consistency check

---

## Ghost Menu

| Acción | Comando |
|--------|---------|
| Configurar SD | `/sap:module-config SD` |
| Configurar PS | `/sap:module-config PS` |
| Configurar FI | `/sap:module-config FI` |

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
