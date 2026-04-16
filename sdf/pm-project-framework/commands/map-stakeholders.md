---
description: "Generate 01_Stakeholder_Register — stakeholder map, influence-interest matrix, RACI, engagement strategy"
user-invocable: true
---

# PMO-APEX · STAKEHOLDER REGISTER & MAP · NL-HP v3.0

## ROLE

Stakeholder Analyst — activates `apex-stakeholder-mapping` as primary skill.
Support skills: `apex-change-management` (readiness), `apex-communications-planning` (engagement channels).

## OBJECTIVE

Generate 01_Stakeholder_Register.md — comprehensive stakeholder identification, classification, and engagement strategy.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory as project root.
2. **Prior deliverables**: Load 00_Project_Charter if available for stakeholder context.
3. **Companion files**: Check `project/` for companion files.
4. **Source inference**: Extract stakeholders from git log, CODEOWNERS, README, org charts, contracts, SOW.
5. **If no context available**: Run mini-ingestion before generating.

## PROTOCOL

### CP-0 · Ingestion

1. Scan all project documentation for stakeholder references.
2. Extract names and roles from git history, CODEOWNERS, org charts, contracts.
3. Classify stakeholder sources: internal, external, regulatory, vendor.
4. Declare findings and gaps.

### CP-2 · Execution

Generate the following sections:

1. **Stakeholder Register** — table: name/role | organization | category (sponsor, decision-maker, influencer, end-user, regulator, vendor) | contact method | engagement level (manage closely, keep satisfied, keep informed, monitor). [DOC] [INFERENCIA]
2. **Influence-Interest Matrix** — 4-quadrant classification with Mermaid quadrant chart. High/low influence x high/low interest. [INFERENCIA]
3. **RACI Matrix** — Responsible, Accountable, Consulted, Informed for key project activities. Table format. [DOC] [INFERENCIA]
4. **Engagement Strategy** — per stakeholder category: communication frequency, preferred channel, key messages, potential resistance, mitigation approach. [INFERENCIA]
5. **Change Readiness Assessment** — organizational readiness for change, adoption risks, training needs, cultural factors. [INFERENCIA] [SUPUESTO]
6. **Stakeholder Risk Register** — stakeholder-related risks: disengagement, resistance, turnover, conflicting interests. [INFERENCIA]
7. **Communication Preference Matrix** — who needs what information, when, in what format. [DOC] [INFERENCIA]

### CP-3 · Validation

- [ ] All stakeholder categories represented (internal, external, regulatory)
- [ ] Influence-interest matrix complete
- [ ] RACI with no gaps (every activity has exactly one A)
- [ ] Engagement strategy per category
- [ ] Evidence tags present

### CP-4 · Delivery

Output: 01_Stakeholder_Register.md
Cross-reference: feeds into 07_Communication_Plan and 05b_Steering_Committee.

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct.
- **Attribution**: Expert committee of the PMO-APEX Framework
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*
- **Format**: Markdown-excellence (TL;DR, tables, Mermaid, evidence tags)
- **Diagrams**: Mermaid quadrantChart for influence-interest matrix

## CONSTRAINTS

- Stakeholder data is sensitive — flag privacy considerations.
- RACI: exactly ONE Accountable per activity. Multiple Responsible allowed.
- Do not fabricate stakeholder names — use role placeholders if names unknown.
- Evidence tagged on all assertions.
