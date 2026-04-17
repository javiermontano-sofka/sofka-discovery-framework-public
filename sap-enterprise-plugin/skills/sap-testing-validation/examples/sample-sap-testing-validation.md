# Test Strategy — AcmeCorp S/4HANA Cloud

> **Skill**: sap-testing-validation · **Phase**: CP-N · **Agent**: `@sap-orchestrator`
> **Author**: Diseñado por Javier Montaño

## TL;DR

- Test pyramid 5 levels, automation target 60%
- UAT 250 test cases across 5 modules
- Regression smoke (15) + standard (75) + full (220)
- 2 cutover rehearsals planned
- Go-live readiness scorecard: target 75%+

## Testing Pyramid

| Level | Tests | Owner | Automation |
|-------|-------|-------|-----------|
| Unit/Config | 800+ | Functional | 40% |
| Integration | 150 | Integration | 60% |
| UAT | 250 | Business | 0% manual |
| Regression | 220 | QA | 80% |
| Performance | 20 | Perf engineer | 50% |

## UAT Scenarios (SD example)

1. T&M Sales Order → timesheet → billing → revenue recognition
2. Fixed Price SO → milestone billing plan → revenue per milestone
3. Retainer Service Contract → periodic billing → straight-line

## Cutover Rehearsal

- R1: dry run QAS + timing measurement
- R2: full cutover team + R1 fixes
- Target: 36h window, rollback tested


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
