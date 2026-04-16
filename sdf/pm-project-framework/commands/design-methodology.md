---
description: "Generate 06_Methodology_Playbook — methodology selection, ceremony calendar, DoD, DoR, estimation approach"
user-invocable: true
---

# PMO-APEX · METHODOLOGY PLAYBOOK · NL-HP v3.0

## ROLE

Methodology Architect — activates `apex-methodology-design` as primary skill.
Support skills: `apex-agile-governance` (Agile ceremonies), `apex-safe-governance` (SAFe alignment), `apex-earned-value-management` (metrics).

## OBJECTIVE

Generate 06_Methodology_Playbook.md — methodology selection rationale, ceremony calendar, artifact standards, and quality definitions.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Prior deliverables**: Load all available (00-05b) for methodology context.
3. **Methodology signals**: Detect from existing artifacts, team structure, project characteristics.
4. **Industry context**: Identify regulatory constraints that affect methodology choice.

## PROTOCOL

### CP-0 · Ingestion

1. Analyze project characteristics: team size, distribution, regulatory burden, technology stack, delivery cadence.
2. Scan for existing methodology artifacts: sprint boards, Gantt charts, PI planning docs.
3. Assess team experience with different methodologies.
4. Declare findings.

### CP-2 · Execution

1. **Methodology Selection Rationale** — trade-off analysis: Agile vs Waterfall vs Hybrid vs SAFe. Decision matrix with weighted criteria. Selected approach with justification. [DOC] [INFERENCIA]
2. **Ceremony Calendar** — all ceremonies/meetings with frequency, duration, participants, purpose, outputs. Table + Mermaid timeline. [INFERENCIA]
3. **Artifact Templates** — list of required artifacts per ceremony/phase with template references. [INFERENCIA]
4. **Definition of Done (DoD)** — project-level DoD and iteration/sprint-level DoD. Checklist format. [INFERENCIA]
5. **Definition of Ready (DoR)** — criteria for work items to enter a sprint/iteration. Checklist format. [INFERENCIA]
6. **Estimation Approach** — method (story points, ideal days, T-shirt sizing, function points), calibration process, velocity tracking. [INFERENCIA]
7. **Quality Management** — quality criteria, review gates, testing strategy alignment, acceptance process. [INFERENCIA]
8. **Metrics & KPIs** — methodology-specific metrics: velocity, lead time, cycle time, CFD, burndown, CPI/SPI. [INFERENCIA]
9. **Tool Recommendations** — suggested tools for each ceremony/artifact (Jira, Azure DevOps, Confluence, etc.). [INFERENCIA]

### CP-3 · Validation

- [ ] Methodology selection justified with trade-off analysis
- [ ] Ceremony calendar complete
- [ ] DoD and DoR defined
- [ ] Estimation approach selected and calibrated
- [ ] Metrics aligned with methodology
- [ ] Evidence tags present

### CP-4 · Delivery

Output: 06_Methodology_Playbook.md
Cross-reference: feeds into 07_Communication_Plan, 08_Dashboard, ceremony commands (standup, retro, etc.).

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct.
- **Attribution**: Expert committee of the PMO-APEX Framework
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*
- **Format**: Markdown-excellence (TL;DR, tables, Mermaid, evidence tags)
- **Diagrams**: Mermaid timeline for ceremony calendar

## CONSTRAINTS

- Methodology must fit the team, not the other way around.
- Avoid dogmatic adherence — pragmatic adaptation is preferred.
- If hybrid, clearly define which phases/aspects use which approach.
- DoD and DoR must be specific and measurable, not aspirational.
