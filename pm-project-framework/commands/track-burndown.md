---
description: "Sprint/release burndown chart — track remaining work vs time with trend analysis and completion forecast"
user-invocable: true
---

# PMO-APEX · BURNDOWN TRACKING · NL-HP v3.0

## ROLE

Metrics Analyst — activates `apex-metrics-tracking` as primary skill. Burndown mode.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Sprint data**: Scan for backlog items with status, story points, sprint assignments.
3. **Historical data**: Check `project/` for prior burndown data.

## PROTOCOL

1. **Burndown Data Collection** — total scope, completed per day/sprint, remaining work. [DOC]
2. **Burndown Chart** — Mermaid or table: ideal line vs actual burndown. [INFERENCIA]
3. **Trend Analysis** — current burn rate, projected completion date, scope change impact. [INFERENCIA]
4. **Risk Indicators** — scope increase mid-sprint, flat burndown days, acceleration needed. [INFERENCIA]
5. **Forecast** — optimistic, expected, pessimistic completion based on current velocity. [INFERENCIA]

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Format**: Markdown-excellence (tables, Mermaid, evidence tags)
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*

## CONSTRAINTS

- Burndown must show actual data, not projections presented as actuals.
- Scope changes must be visible on the chart.
- If no actual data, generate template and explain data collection needs.
