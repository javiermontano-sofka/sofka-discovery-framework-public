---
description: "Generate 11_EVM_Analysis — Earned Value Management analysis with CPI, SPI, forecasts, and trends"
user-invocable: true
---

# PMO-APEX · EARNED VALUE ANALYSIS · NL-HP v3.0

## ROLE

EVM Analyst — activates `apex-evm-analysis` as primary skill.
Support skills: `apex-schedule-planning` (baseline), `apex-risk-assessment` (cost risk).

## OBJECTIVE

Generate 11_EVM_Setup.md — Earned Value Management setup, performance indices, forecasts, and variance analysis.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Prior deliverables**: Load 03_Schedule (PV baseline), 04_Resources (cost baseline).
3. **Current data**: Scan for time tracking, budget actuals, completion percentages.

## PROTOCOL

### CP-2 · Execution

1. **EVM Baseline Setup** — Planned Value (PV) curve, Budget at Completion (BAC), measurement method (0/100, 50/50, % complete). [DOC] [INFERENCIA]
2. **Performance Indices** — CPI (Cost Performance Index), SPI (Schedule Performance Index), TCPI (To-Complete Performance Index). Interpretation. [INFERENCIA]
3. **Variance Analysis** — CV (Cost Variance), SV (Schedule Variance), VAC (Variance at Completion). Both absolute and percentage. [INFERENCIA]
4. **Forecasting** — EAC (Estimate at Completion) using multiple methods: EAC = BAC/CPI, EAC = AC + (BAC-EV), EAC = AC + (BAC-EV)/(CPI*SPI). ETC. [INFERENCIA]
5. **S-Curve Visualization** — PV, EV, AC curves over time. Mermaid line chart or table representation. [INFERENCIA]
6. **Performance Thresholds** — CPI/SPI thresholds for R/Y/G status. Trigger actions per threshold. [INFERENCIA]
7. **Trend Analysis** — CPI/SPI trend over last 3-5 periods. Improving, stable, declining. [INFERENCIA]

### CP-3 · Validation

- [ ] PV baseline established
- [ ] CPI and SPI calculated
- [ ] EAC using at least 2 methods
- [ ] Thresholds defined with trigger actions
- [ ] Evidence tags present

### CP-4 · Delivery

Output: 11_EVM_Setup.md
Cross-reference: feeds into 08_Dashboard, 10_Status_Reports.

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — analytical but accessible.
- **Attribution**: Expert committee of the PMO-APEX Framework
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*
- **Format**: Markdown-excellence (TL;DR, tables, Mermaid, evidence tags)

## CONSTRAINTS

- NEVER prices. All values in FTE-months or work units.
- EVM indices must be calculated, not estimated.
- Forecast ranges required — single-point forecasts are insufficient.
- If no actual data available, generate setup and template only.
