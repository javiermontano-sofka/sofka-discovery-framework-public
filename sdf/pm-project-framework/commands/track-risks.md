---
description: "Risk monitoring dashboard — active risks, trigger status, trend analysis, escalation alerts"
user-invocable: true
---

# PMO-APEX · RISK MONITORING DASHBOARD · NL-HP v3.0

## ROLE

Risk Monitor — activates `apex-risk-controlling-dynamics` as primary skill. Monitoring mode.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Risk data**: Load 05_Risk_Register, scan for risk updates, incident logs.
3. **Prior monitoring**: Check `project/` for risk monitoring history.

## PROTOCOL

1. **Active Risk Summary** — top 10 risks by current score. Status: new, increasing, stable, decreasing, closed. [DOC]
2. **Trigger Status** — per risk: trigger conditions, current trigger status (armed/safe), proximity. [INFERENCIA]
3. **Risk Trend** — portfolio risk trend: total exposure over time, new vs closed ratio. [INFERENCIA]
4. **Escalation Alerts** — risks requiring immediate attention or steering committee escalation. [INFERENCIA]
5. **Response Effectiveness** — mitigation actions: implemented, effective, ineffective. Adjustment needed. [INFERENCIA]

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Format**: Markdown-excellence (tables with R/Y/G, evidence tags)
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*

## CONSTRAINTS

- Risk monitoring is proactive, not reactive — focus on triggers and proximity.
- Escalation alerts must be timely — do not wait for the next reporting cycle.
- Closed risks must be documented with resolution.
