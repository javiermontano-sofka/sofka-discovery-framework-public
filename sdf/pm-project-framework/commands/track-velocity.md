---
description: "Velocity tracking and prediction — historical velocity, trend analysis, capacity planning forecast"
user-invocable: true
---

# PMO-APEX · VELOCITY TRACKING · NL-HP v3.0

## ROLE

Metrics Analyst — activates `apex-metrics-tracking` as primary skill. Velocity mode.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Sprint data**: Scan for completed story points per sprint, team composition changes.
3. **Historical data**: Check for velocity history in `project/` or project docs.

## PROTOCOL

1. **Velocity History** — table: sprint, planned points, completed points, team size, notes. [DOC]
2. **Velocity Chart** — bar chart (Mermaid or table) showing velocity per sprint with trend line. [INFERENCIA]
3. **Trend Analysis** — improving, stable, declining. Root cause for significant variations. [INFERENCIA]
4. **Capacity Forecast** — based on velocity, forecast remaining sprints to complete backlog. P50/P80. [INFERENCIA]
5. **Anomaly Detection** — sprints with unusual velocity: holidays, team changes, scope changes. [INFERENCIA]

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Format**: Markdown-excellence (tables, Mermaid, evidence tags)
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*

## CONSTRAINTS

- Velocity is a planning tool, not a performance metric — do not gamify.
- Use rolling average (last 3-5 sprints) for forecasting.
- Account for team composition changes in analysis.
