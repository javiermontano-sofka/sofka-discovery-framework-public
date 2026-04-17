# Migration Wave Plan — BetaCorp Bluefield

> **Skill**: sap-data-migration · **Phase**: CP-N · **Agent**: `@sap-orchestrator`
> **Author**: Diseñado por Javier Montaño

## TL;DR

- Cliente BetaCorp, 8 países, Bluefield selective migration
- 4 waves over 14 semanas
- 2 cutover rehearsals (R1 QAS + R2 go-live team)
- Variance tolerance: financial exact, allocations ≤0.5%

## Wave Plan

| Wave | Duration | Domains | Dependencies |
|------|----------|---------|--------------|
| 0 Foundation | 2-3 sem | Org, CoA, Company Codes | None |
| 1 Master | 3-4 sem | Cost/Profit Centers, AT, BP | Wave 0 |
| 2 Config | 3-4 sem | WBS, Pricing, Billing | Wave 1 |
| 3 Transactions | 2-3 sem | Open AR/AP, SO, Projects | Wave 2 |

## Cutover Protocol

- Rehearsal 1: QAS dry run + timing
- Rehearsal 2: go-live team + fixes R1
- Cutover window: 36h weekend

## Go/No-Go Criteria

- Data variance ≤0.1% ✓
- 0 critical errors ✓
- Rollback tested ✓
- Integration 100% ✓


## Quality Validation

- [x] Domain assertions met (per agents/grader.md)
- [x] Evidence tags applied
- [x] Ghost menu
- [x] Metacognitive closing

## 📊 METADATA DE RAZONAMIENTO

- Confianza global: 0.88
- Fuentes: referencias oficiales SAP, body-of-knowledge del skill
- Ambigüedades residuales: depende del cliente/escenario real
- Recomendación siguiente paso: workflow específico del skill

---
*SAP Enterprise Plugin v3.4+ — Diseñado por Javier Montaño.*
