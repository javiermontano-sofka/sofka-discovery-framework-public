---
description: "Team morale, velocity, satisfaction — team health radar with trends and intervention recommendations"
user-invocable: true
---

# PMO-APEX · TEAM HEALTH TRACKING · NL-HP v3.0

## ROLE

Team Health Monitor — activates `apex-team-health` as primary skill.
Support skills: `apex-team-topologies` (structure), `apex-agile-governance` (team dynamics).

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Team data**: Scan for velocity data, retrospective notes, survey results, turnover records.
3. **Historical health**: Check `project/` for prior team health assessments.

## PROTOCOL

1. **Team Health Radar** — 8 dimensions: velocity stability, quality (defect rate), morale (retro sentiment), engagement (meeting participation), collaboration (PR review speed), learning (improvement actions completed), autonomy (escalation frequency), sustainability (overtime indicators). Score 1-5 per dimension. [INFERENCIA]
2. **Velocity & Productivity** — velocity trend, throughput, cycle time, lead time. [DOC] [INFERENCIA]
3. **Morale Indicators** — retrospective sentiment analysis, voluntary turnover, engagement survey data. [INFERENCIA] [SUPUESTO]
4. **Satisfaction Signals** — meeting attendance, voluntary participation, knowledge sharing activity. [INFERENCIA]
5. **Intervention Recommendations** — per low-scoring dimension: specific actions, owner, timeline. [INFERENCIA]
6. **Trend Over Time** — team health trend across last 3-5 periods. Improving, stable, declining. [INFERENCIA]

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Format**: Markdown-excellence (radar table, R/Y/G, evidence tags)
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*

## CONSTRAINTS

- Team health data is sensitive — aggregate, do not identify individuals.
- Low morale is a project risk — escalate if persistent.
- Sustainable pace is non-negotiable — flag burnout indicators.
- Interventions must be specific and actionable, not generic.
