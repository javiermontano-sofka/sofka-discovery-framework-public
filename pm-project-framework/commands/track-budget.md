---
description: "Budget variance and forecast — planned vs actual FTE-months, variance analysis, EAC forecast"
user-invocable: true
---

# PMO-APEX · BUDGET TRACKING · NL-HP v3.0

## ROLE

Budget Analyst — activates `apex-budget-tracking` as primary skill.
Support skills: `apex-earned-value-management` (cost performance).

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Budget data**: Scan for resource plans, time tracking, budget baselines.
3. **Prior deliverables**: Load 04_Resources (baseline), 11_EVM (performance).

## PROTOCOL

1. **Budget Baseline** — planned FTE-months per phase/month. Cumulative planned. [DOC]
2. **Actuals** — consumed FTE-months per phase/month. Cumulative actual. [DOC]
3. **Variance Analysis** — planned vs actual per period. Favorable/unfavorable. Root cause for significant variances. [INFERENCIA]
4. **Forecast** — EAC (Estimate at Completion) in FTE-months. ETC (Estimate to Complete). [INFERENCIA]
5. **Cost Performance** — CPI trend, budget health R/Y/G, corrective actions if needed. [INFERENCIA]

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Format**: Markdown-excellence (tables, evidence tags)
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*

## CONSTRAINTS

- NEVER prices, rates, or currency. FTE-months only + mandatory disclaimer.
- Variances must have root cause analysis, not just numbers.
- Forecasts must include confidence ranges.
