---
description: "Plan de migración de datos SAP — Strangler Fig, Migration Cockpit, data quality, wave planning, cutover"
user-invocable: true
argument-hint: "[--approach strangler-fig|big-bang|hybrid]"
---

# /sap:migration-plan — Data Migration Strategy

> Diseñado y desarrollado por **Javier Montaño**. Plugin: sap-enterprise-plugin v2.1

## ROL

Master: `@sap-orchestrator` (estrategia de migración)
Consulta: `@sap-docs-steward` (Migration Cockpit templates oficiales)
QA: `@qa-validator` (variance tolerance por dominio)

## OBJETIVO

Diseñar estrategia de migración de datos: Strangler Fig incremental (default), SAP Migration Cockpit, data quality framework, wave planning, cutover rehearsal, parallel run.

## PROTOCOLO

### CP-0 · Data Source Inventory
Inventariar sources actuales:
- ERP actual
- Excel / Access / shadow IT
- APIs / bases de datos externas
- Volúmenes y criticidad por dominio

### CP-1 · Approach Selection

| Approach | Cuándo usar | Riesgo |
|----------|-------------|--------|
| **Strangler Fig** (default) | Landscapes complejos, multi-source | Bajo |
| **Big-Bang** | Volúmenes pequeños, landscape simple | Alto |
| **Hybrid** | Mezcla según dominio | Medio |

### CP-2 · Strangler Fig Protocol (8 pasos por dominio)
1. **Map**: columnas, fórmulas, reglas de negocio
2. **Design**: SAP target (tabla, campo, objeto de migración)
3. **Cleanse**: data quality fix ANTES de cargar
4. **Load**: migración inicial a sandbox via Migration Cockpit
5. **Validate**: SAP output vs legacy (tolerancia ≤ 0.1%)
6. **Shadow**: parallel run 1-2 periodos
7. **Cutover**: migración final + decommission legacy
8. **Document**: archivo de evidencias

### CP-3 · Data Quality Framework
6 dimensiones con targets:

| Dim | Target |
|-----|--------|
| Completeness | >= 98% |
| Accuracy | >= 99% |
| Consistency | 100% formato |
| Uniqueness | 0 duplicados |
| Timeliness | < 6 meses |
| Referential Integrity | 100% |

### CP-4 · Wave Plan
Template estándar:

| Wave | Duración | Dominios |
|------|----------|---------|
| 0 (Foundation) | 2-3 sem | Org structure, CoA, Company Codes |
| 1 (Master) | 3-4 sem | Cost Centers, Profit Centers, Activity Types, BP |
| 2 (Config) | 3-4 sem | WBS, Pricing, Billing Plans |
| 3 (Transactions) | 2-3 sem | Open AR/AP, Open SO, Open Projects |
| 4 (History) | 2-4 sem | Históricos (si aplica) / Archive |

### CP-5 · Cutover Rehearsal
Mínimo 2 rehearsals:
- R1: dry run en QAS, timing medido
- R2: dry run con go-live team, fixes de R1 aplicados

### CP-6 · Go/No-Go Criteria

| Criterio | Pass |
|----------|------|
| Data variance | <= 0.1% |
| Critical errors | 0 |
| Cutover time | Within window |
| Rollback plan | Tested |

### CP-F · QA
`@qa-validator` valida:
- Wave dependencies correctas
- Tolerance thresholds documentados per dominio
- Rollback procedure explícito

## OUTPUT

`05_Migration_Plan_{cliente}_{WIP}.md` (cargado desde `templates/migration-wave-plan.md`)

## RESTRICCIONES

- NUNCA migrar datos sucios — cleanse ANTES de cargar
- Mínimo 2 rehearsals (primera siempre tiene issues)
- Financial data requiere parallel run (compliance)
- Tolerance: exact match master data; <= 0.1% financial balances

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
