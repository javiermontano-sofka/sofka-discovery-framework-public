---
description: "Generate 08_Executive_Dashboard — project health dashboard with KPIs, traffic lights, forecasts"
user-invocable: true
---

# PMO-APEX · EXECUTIVE DASHBOARD · NL-HP v3.0

## ROLE

Dashboard Architect — activates `apex-dashboard-generation` as primary skill.
Support skills: `apex-earned-value-management` (EVM KPIs), `apex-risk-assessment` (risk indicators).

## OBJECTIVE

Generate 08_Executive_Dashboard.md — executive-level project health dashboard with KPIs, traffic lights, trend indicators, and forecasts.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Prior deliverables**: Load all available deliverables for dashboard data.
3. **Methodology context**: Adapt KPIs to selected methodology (Agile: velocity, burndown; Waterfall: EVM, milestones).

## PROTOCOL

### CP-0 · Ingestion

1. Load all prior deliverables as data sources.
2. Identify available metrics and KPI data.
3. Determine reporting audience (executive, steering committee, team).
4. Declare findings.

### CP-2 · Execution

1. **Project Health Summary** — 6 dimensions: scope, schedule, budget, quality, risk, team. Each with R/Y/G status, trend arrow, and 1-line summary. [DOC] [INFERENCIA]
2. **KPI Definitions** — table: KPI name, formula, target, threshold (green/yellow/red), data source, measurement frequency. [INFERENCIA]
3. **Traffic Light Criteria** — explicit definitions for R/Y/G per dimension. Objective, not subjective. [INFERENCIA]
4. **Trend Indicators** — improving, stable, declining for each dimension. Based on last 3 reporting periods. [INFERENCIA]
5. **Forecast Models** — optimistic, expected, pessimistic for schedule and budget. P50/P80 dates and FTE-months. [INFERENCIA] [SUPUESTO]
6. **Key Decisions Pending** — items requiring steering committee or sponsor decision. Priority, deadline, impact of delay. [DOC] [INFERENCIA]
7. **Risk Heatmap Summary** — top 5 risks with current status and trend. [INFERENCIA]
8. **Milestone Tracker** — key milestones with baseline vs actual/forecast dates. Variance. [DOC] [INFERENCIA]
9. **Executive Summary Template** — 1-page template for recurring dashboard updates. [INFERENCIA]

### CP-3 · Validation

- [ ] All 6 health dimensions covered
- [ ] KPIs with measurable targets and thresholds
- [ ] Traffic light criteria objective and specific
- [ ] Forecast with confidence ranges
- [ ] Evidence tags present

### CP-4 · Delivery

Output: 08_Executive_Dashboard.md
Cross-reference: feeds into 10_Status_Reports, steering committee meetings.

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — executive level, concise.
- **Attribution**: Expert committee of the PMO-APEX Framework
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*
- **Format**: Markdown-excellence (TL;DR, tables with R/Y/G, Mermaid, evidence tags)
- **Diagrams**: Mermaid for milestone timeline, tables for health matrix

## CONSTRAINTS

- Dashboard must fit on one page when printed.
- Traffic lights must be objective — no "feelings".
- NEVER prices. FTE-months and percentages only.
- Forecast ranges, not point estimates.
