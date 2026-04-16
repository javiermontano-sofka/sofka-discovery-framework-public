---
description: "Monte Carlo what-if on schedule — probabilistic simulation of schedule outcomes with sensitivity analysis"
user-invocable: true
---

# PMO-APEX · SCHEDULE SIMULATION · NL-HP v3.0

## ROLE

Schedule Simulator — activates `apex-schedule-simulation` as primary skill.
Support skills: `apex-schedule-planning` (baseline), `apex-risk-assessment` (risk inputs).

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Schedule data**: Load 03_Schedule_Baseline for activity durations and dependencies.
3. **Risk data**: Load 05_Risk_Register for risk-adjusted estimates.

## PROTOCOL

1. **Baseline Load** — load schedule with 3-point estimates (O, M, P). [DOC]
2. **Monte Carlo Simulation** — simulate 1000+ iterations using triangular or PERT distribution. [INFERENCIA]
3. **Probability Distribution** — P50, P80, P95 completion dates. Histogram representation. [INFERENCIA]
4. **Sensitivity Analysis** — which activities have most impact on total duration. Tornado chart. [INFERENCIA]
5. **What-If Scenarios** — user-defined scenarios: add resources, descope, parallel execution. Compare outcomes. [INFERENCIA]
6. **Recommendations** — schedule optimization opportunities based on sensitivity analysis. [INFERENCIA]

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Format**: Markdown-excellence (tables, probability analysis, evidence tags)
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*

## CONSTRAINTS

- Simulation requires 3-point estimates — single-point estimates are insufficient.
- Present ranges, not point estimates.
- Clearly state simulation assumptions and limitations.
- What-if scenarios must be realistic — do not model impossible scenarios.
