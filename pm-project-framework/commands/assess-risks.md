---
description: "Generate 05_Risk_Register — risk identification, P-I matrix, response strategies, monitoring plan"
user-invocable: true
---

# PMO-APEX · RISK REGISTER & RESPONSE PLAN · NL-HP v3.0

## ROLE

Risk Analyst — activates `apex-risk-assessment` as primary skill.
Support skills: `apex-risk-controlling-dynamics` (continuous monitoring), `apex-earned-value-management` (cost risk).

## OBJECTIVE

Generate 05_Risk_Register.md — comprehensive risk identification, probability-impact analysis, response strategies, and monitoring plan.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Prior deliverables**: Load all available deliverables (00-04) for cross-cutting risk identification.
3. **Source analysis**: Scan code for technical risks, schedule for timeline risks, resources for people risks.
4. **Industry context**: Identify regulatory and compliance risks from industry signals.

## PROTOCOL

### CP-0 · Ingestion

1. Load all prior deliverables for comprehensive risk scanning.
2. Scan project documentation for risk indicators: technical debt, regulatory requirements, vendor dependencies, team gaps.
3. Classify risk sources: technical, schedule, cost, scope, quality, organizational, external.
4. Declare findings.

### CP-2 · Execution

1. **Risk Register** — minimum 15 risks. Table: ID, category, description, probability (1-5), impact (1-5), score (PxI), owner, status. [DOC] [INFERENCIA]
2. **Probability-Impact Matrix** — 5x5 matrix with risk placement. Color-coded: green (1-5), yellow (6-12), red (15-25). Mermaid or table. [INFERENCIA]
3. **Risk Response Strategies** — for top 15 risks: strategy (avoid, mitigate, transfer, accept, escalate), response actions, trigger, contingency plan, residual risk. [INFERENCIA]
4. **Contingency Reserves** — schedule contingency (buffer days), cost contingency (FTE-months), management reserve recommendation. [INFERENCIA] [SUPUESTO]
5. **Risk Monitoring Plan** — monitoring frequency, trigger thresholds, escalation criteria, risk review meeting cadence. [INFERENCIA]
6. **Risk Categories** — taxonomy: technical risks, schedule risks, cost risks, scope risks, quality risks, organizational risks, external risks. [DOC]
7. **Secondary Risks** — risks introduced by risk responses. At least 3 identified. [INFERENCIA]

### CP-3 · Validation

- [ ] Minimum 15 risks identified
- [ ] All 7 risk categories represented
- [ ] P-I matrix complete
- [ ] Response strategies for top 15
- [ ] Risk owners assigned
- [ ] Monitoring plan defined
- [ ] Evidence tags present

### CP-4 · Delivery

Output: 05_Risk_Register.md
Cross-reference: feeds into 05b_Steering (escalation), 08_Dashboard (risk KPIs), 14_Closure (residual risks).

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct.
- **Attribution**: Expert committee of the PMO-APEX Framework
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*
- **Format**: Markdown-excellence (TL;DR, tables with R/Y/G, Mermaid, evidence tags)
- **Diagrams**: Mermaid or table for P-I matrix

## CONSTRAINTS

- Risks must be specific, not generic. "Schedule delay" is too vague — "Sprint 3 delayed by API vendor SLA breach" is specific.
- Every risk must have an owner.
- Probability and impact must be justified, not arbitrary.
- NEVER underestimate risks to make the project look good.
