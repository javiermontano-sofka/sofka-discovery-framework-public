---
name: sofka-vendor-assessment
description: >
  Vendor evaluation and selection framework — RFP/RFI design, scoring matrices, TCO analysis, contract risk.
  Use when the user asks to "evaluate vendors", "design RFP", "compare platforms", "assess TCO",
  or mentions vendor selection, build-vs-buy, technology evaluation, procurement strategy.
model: opus
context: fork
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Vendor Assessment: Evaluation, Selection & Risk Analysis

Vendor assessment provides structured evaluation of technology vendors and platforms. The skill produces vendor scorecards, comparison matrices, and recommendation reports that support objective, defensible procurement decisions.

## TL;DR

- Disena framework de evaluacion de vendors con criterios ponderados y scoring transparente
- Genera matrices de comparacion multi-dimensional (funcional, tecnico, financiero, riesgo)
- Calcula TCO (Total Cost of Ownership) a 3-5 anos incluyendo costos ocultos
- Evalua riesgo contractual, lock-in tecnologico y viabilidad del vendor
- Produce recomendacion fundamentada con analisis build-vs-buy cuando aplica

## Inputs

The user provides a vendor evaluation context as `$ARGUMENTS`. Parse `$1` as the **evaluation name/context**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)
- `{TIPO_EVALUACION}`: `rfp` | `build-vs-buy` | `platform-selection` | `auto` (default)

## Entregables

1. **Vendor scorecard** — Weighted multi-criteria evaluation per vendor with normalized scores
2. **Matriz de comparacion** — Side-by-side comparison across functional, technical, and commercial dimensions
3. **Analisis TCO** — Total cost of ownership projection including licensing, implementation, operations, exit costs
4. **Evaluacion de riesgo** — Vendor viability, lock-in risk, contractual risk, and mitigation strategies
5. **Informe de recomendacion** — Final recommendation with rationale, trade-offs, and conditions

## Proceso

1. **Definir criterios de evaluacion** — Establish evaluation dimensions: functional fit, technical capability, financial, vendor viability, support, ecosystem
2. **Ponderar criterios** — Assign weights based on business priorities; validate with stakeholders
3. **Disenar RFP/RFI** — Structure information request covering must-have requirements, nice-to-haves, and deal-breakers
4. **Recopilar respuestas** — Gather vendor responses, demos, references, and proof-of-concept results
5. **Evaluar y puntuar** — Score each vendor against criteria using consistent 1-5 scale with evidence
6. **Calcular TCO** — Project 3-5 year total cost including: licenses, implementation, training, customization, integration, operations, and exit/migration
7. **Analizar riesgos** — Assess vendor financial health, market position, lock-in factors, contract terms, and data portability
8. **Formular recomendacion** — Synthesize scores, TCO, and risk into defensible recommendation with conditions and negotiation leverage points

## Criterios de Calidad

- [ ] Evaluation criteria are weighted and weights are justified
- [ ] All vendors scored using identical criteria and methodology
- [ ] TCO includes hidden costs: training, integration, customization, migration, exit
- [ ] Vendor viability assessed (financial health, market position, roadmap alignment)
- [ ] Lock-in risk quantified with data portability and exit cost analysis
- [ ] Build-vs-buy analysis included when custom development is a viable alternative
- [ ] Recommendation includes conditions and negotiation points
- [ ] Evidence tags applied: [DOC], [INFERENCIA], [SUPUESTO]

## Supuestos y Limites

- Vendor evaluations based on publicly available information and provided documentation
- TCO projections are estimates based on stated assumptions
- Does not negotiate contracts — provides analysis to support negotiation
- Market conditions and vendor positions may change post-assessment

## Cross-References

- **sofka-software-architecture:** Technical architecture requirements that constrain vendor selection
- **sofka-integration-architecture:** Integration capabilities required from vendors
- **sofka-security-architecture:** Security and compliance requirements for vendor evaluation

---
**Autor:** Equipo PreSales Sofka | **Version:** 1.0.0
