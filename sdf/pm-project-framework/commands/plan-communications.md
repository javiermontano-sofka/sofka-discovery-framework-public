---
description: "Generate 07_Communication_Plan — communication matrix, meeting schedule, escalation procedures, stakeholder engagement"
user-invocable: true
---

# PMO-APEX · COMMUNICATION PLAN · NL-HP v3.0

## ROLE

Communications Planner — activates `apex-communications-planning` as primary skill.
Support skills: `apex-stakeholder-mapping` (audience), `apex-change-management` (engagement).

## OBJECTIVE

Generate 07_Communication_Plan.md — comprehensive communication strategy with matrix, schedules, templates, and escalation procedures.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Prior deliverables**: Load 01_Stakeholders (audience), 05b_Steering (governance comms), 06_Methodology (ceremony comms).
3. **Context**: Scan for existing communication plans, meeting schedules, distribution lists.

## PROTOCOL

### CP-0 · Ingestion

1. Load stakeholder register and steering committee charter.
2. Identify communication channels available (email, Slack, Teams, Jira, Confluence).
3. Assess geographic distribution and time zone considerations.
4. Declare findings.

### CP-2 · Execution

1. **Communication Matrix** — table: stakeholder group | information need | frequency | channel | format | responsible | feedback mechanism. [DOC] [INFERENCIA]
2. **Meeting Schedule** — all recurring meetings: name, frequency, duration, participants, purpose, agenda template. [INFERENCIA]
3. **Status Report Template** — standard format for weekly/biweekly status reports. RAG criteria. [INFERENCIA]
4. **Escalation Procedures** — when, how, to whom. Response time expectations per severity. [INFERENCIA]
5. **Stakeholder Engagement Calendar** — quarterly view of engagement touchpoints per stakeholder group. [INFERENCIA]
6. **Distribution Lists** — who receives what communications. Maintain list ownership. [DOC]
7. **Communication Standards** — naming conventions, version control, archiving protocol. [INFERENCIA]

### CP-3 · Validation

- [ ] All stakeholder groups have communication plan
- [ ] Meeting schedule covers all methodology ceremonies
- [ ] Escalation path defined with response times
- [ ] Evidence tags present

### CP-4 · Delivery

Output: 07_Communication_Plan.md
Cross-reference: feeds into 08_Dashboard, 10_Status_Reports.

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct.
- **Attribution**: Expert committee of the PMO-APEX Framework
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*
- **Format**: Markdown-excellence (TL;DR, tables, evidence tags)

## CONSTRAINTS

- Communication plan must be actionable, not theoretical.
- Frequency must be realistic — avoid meeting overload.
- Time zones must be considered for distributed teams.
- Information security: classify sensitive communications.
