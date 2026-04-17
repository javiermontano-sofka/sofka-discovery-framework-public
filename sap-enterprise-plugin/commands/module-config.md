---
description: "Configuración detallada por módulo SAP (CO, SD, PS, FI, MM, HCM) con template determinístico"
user-invocable: true
argument-hint: "<module> (CO|SD|PS|FI|MM|HCM)"
---

# /sap:module-config — Granular Module Configuration

> Diseñado y desarrollado por **Javier Montaño**. Plugin: sap-enterprise-plugin v2.1

## ROL

Master: `@module-specialist` (activado con parámetro de módulo)
Consulta: `@sap-docs-steward` (validar Fiori apps y Scope Items)
QA: `@qa-validator` (consistency cross-módulo)

## OBJETIVO

Generar configuración detallada a nivel IMG / Fiori apps / master data para el módulo especificado en "$ARGUMENTS". Usa template determinístico por módulo.

## PROTOCOLO

### CP-0 · Module Dispatch
Según el parámetro, cargar el template correspondiente:

| Módulo | Template |
|--------|----------|
| CO | `templates/module-config-co.md` |
| SD | `templates/module-config-sd.md` |
| PS | `templates/module-config-ps.md` |
| FI | `templates/module-config-fi.md` |
| MM | (template genérico + detalle MM) |
| HCM | (template genérico + detalle HCM) |

### CP-1 · Load Template
`@module-specialist` carga template y lo llena:

**Estructura común**:
1. Module Overview
2. Master Data Requirements
3. Configuration Steps (IMG paths + Fiori apps)
4. Scope Items Activation
5. Dependencies con otros módulos
6. Test Plan
7. Risks & Mitigations

### CP-2 · Cross-Module Dependencies
Verificar dependencias obligatorias:

| Si configuras... | Debes coordinar con... |
|-----------------|----------------------|
| CO Activity Types | SD Sales Prices, PS Resource Costing |
| SD Billing Plans | FI Revenue Recognition, PS Milestones |
| PS WBS | CO Cost Centers, SD Sales Orders |
| FI Company Code | Todos los módulos dependen |
| FI Intercompany | CO (IC allocation) + SD (IC billing) |

Si hay dependencias → invocar `@module-specialist` con módulo afectado.

### CP-3 · Validation
`@sap-docs-steward` valida:
- Cada Fiori app existe en Fiori Apps Reference Library
- Cada Scope Item existe en rapid.sap.com
- IMG paths son válidos

### CP-F · QA
`@qa-validator`:
- Evidence tags [CONFIG], [DOC]
- Template compliance
- Cross-module consistency

## OUTPUT

`{NN}_Module_Config_{module}_{cliente}_{WIP}.md`

## MÓDULOS SOPORTADOS

- **CO** (Controlling): Cost Centers, Profit Centers, Activity Types, Internal Orders, CO-PA
- **SD** (Sales & Distribution): Sales Order Types, Pricing, Billing Plans, Credit Mgmt
- **PS** (Project System): WBS, Networks, Milestones, Commercial Project Mgmt
- **FI** (Financial Accounting): GL, AP, AR, Intercompany, Parallel Ledgers, E-Invoicing
- **MM** (Materials Management): PO Types, Info Records, Supplier Invoices
- **HCM / SuccessFactors**: Employee Master, Time Management, Payroll Integration

## RESTRICCIONES

- NUNCA configurar un módulo sin template cargado
- Dependencias cross-módulo deben resolverse antes de go-live
- Master data requerida debe existir antes de config detallada

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
