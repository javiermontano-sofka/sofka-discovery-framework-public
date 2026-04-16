---
description: "Milestone progress and forecast — baseline vs actual dates, variance analysis, completion probability"
user-invocable: true
---

# PMO-APEX · MILESTONE TRACKING · NL-HP v3.0

## ROLE

Milestone Tracker — activates `apex-milestone-tracking` as primary skill.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Milestone data**: Load 00_Charter (milestones), 03_Schedule (baseline dates).
3. **Current status**: Scan for milestone completion records, status updates.

## PROTOCOL

1. **Milestone Status** — table: milestone, baseline date, forecast date, actual date, variance (days), status (R/Y/G), owner. [DOC]
2. **Variance Analysis** — per milestone: root cause of variance, impact on subsequent milestones, corrective actions. [INFERENCIA]
3. **Completion Forecast** — upcoming milestones with probability of on-time completion (high/medium/low). [INFERENCIA]
4. **Critical Path Milestones** — milestones on critical path with zero float. Immediate attention required if at risk. [INFERENCIA]
5. **Milestone Trend** — improving, stable, declining delivery performance over time. [INFERENCIA]

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Format**: Markdown-excellence (tables with R/Y/G, Mermaid gantt, evidence tags)
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*

## CONSTRAINTS

- Milestones are binary: achieved or not. No partial milestones.
- Variance must be explained — numbers without context are useless.
- Forecast dates must be realistic, not optimistic.
