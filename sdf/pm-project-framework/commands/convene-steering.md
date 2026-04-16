---
description: "Generate 05b_Steering_Committee — governance charter, escalation matrix, decision authority, meeting cadence"
user-invocable: true
---

# PMO-APEX · STEERING COMMITTEE REVIEW · NL-HP v3.0

## ROLE

Governance Architect — activates `apex-steering-committee` as primary skill.
Support skills: `apex-pipeline-governance` (governance framework), `apex-stakeholder-mapping` (stakeholder alignment).

## OBJECTIVE

Generate 05b_Steering_Committee.md — steering committee charter, decision authority, escalation framework, and governance dashboard.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Prior deliverables**: Load 00_Charter (governance), 01_Stakeholders (decision-makers), 05_Risks (escalation needs).
3. **Org context**: Scan for org charts, governance documents, existing committee structures.

## PROTOCOL

### CP-0 · Ingestion

1. Load charter governance structure and stakeholder register.
2. Identify decision-makers, sponsors, and escalation authorities.
3. Assess governance complexity: single project vs program vs portfolio.
4. Declare findings.

### CP-2 · Execution

1. **Steering Committee Charter** — purpose, scope of authority, membership, quorum requirements, term. [DOC] [INFERENCIA]
2. **Membership Register** — table: name/role, organization, voting rights, availability, deputy. [DOC]
3. **Decision Authority Matrix (RAPID)** — Recommend, Agree, Perform, Input, Decide for key decision types. [INFERENCIA]
4. **Escalation Matrix** — issue severity levels, escalation path, SLA per level, responsible party. [INFERENCIA]
5. **Meeting Cadence** — frequency, duration, standard agenda template, quorum rules, minutes protocol. [INFERENCIA]
6. **Reporting Requirements** — what the steering committee needs: KPIs, RAG status, risk updates, change requests, financial summary. [INFERENCIA]
7. **Governance Dashboard Template** — executive view: project health, key decisions pending, risks requiring attention, budget status. [INFERENCIA]
8. **Issue Resolution Protocol** — how issues are raised, classified, assigned, tracked, and closed. [INFERENCIA]

### CP-3 · Validation

- [ ] Committee charter with clear authority boundaries
- [ ] RAPID matrix for all decision types
- [ ] Escalation matrix with SLAs
- [ ] Meeting cadence and agenda template
- [ ] Evidence tags present

### CP-4 · Delivery

Output: 05b_Steering_Committee.md
Cross-reference: feeds into 07_Communication_Plan, 08_Dashboard, 10_Status_Reports.

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct.
- **Attribution**: Expert committee of the PMO-APEX Framework
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*
- **Format**: Markdown-excellence (TL;DR, tables, Mermaid, evidence tags)
- **Diagrams**: Mermaid flowchart for escalation path

## CONSTRAINTS

- Governance must be proportional to project complexity — avoid over-engineering.
- RAPID: exactly ONE Decide per decision type.
- Escalation SLAs must be realistic and enforceable.
- Committee structure must not create bottlenecks.
