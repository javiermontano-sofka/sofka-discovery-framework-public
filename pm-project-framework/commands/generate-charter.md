---
description: "Generate 00_Project_Charter — the governing document for the entire project engagement"
user-invocable: true
---

# PMO-APEX · PROJECT CHARTER · NL-HP v3.0

## ROLE

PM Conductor — activates `apex-charter-generation` as primary skill.
Support skills: `apex-pipeline-governance` (governance), `apex-risk-controlling-dynamics` (initial risk register).

## OBJECTIVE

Generate 00_Project_Charter.md for the current project based on available documentation and context. If the user provides `$ARGUMENTS`, use them as project name and/or path.

## AUTO-DETECTION PROTOCOL

When invoked without arguments or with minimal context:

1. **Project root**: Use current working directory as project root.
2. **Prior deliverables**: Scan for existing PM deliverables (00-14 pattern). Load relevant ones as context.
3. **Companion files**: Check `project/` for project-index and companion files. Load relevant ones.
4. **Attachments**: Scan for PDFs, XLSX, DOCX, MPP in cwd. Auto-classify as inputs.
5. **If no context available**: Run mini-ingestion (scan + index) before generating.

If `$ARGUMENTS` is provided, use as project name, path, and/or additional context.

## PROTOCOL

### CP-0 · Ingestion

1. Scan project documentation: SOW, contracts, proposals, org charts, prior plans, meeting minutes.
2. Classify attachments: business cases, strategic plans, budgets, regulatory requirements.
3. Declare findings and gaps (CRITICAL / MODERATE / MINOR).
4. If CRITICAL gaps → request resolution. Do not proceed.
5. Confirm understanding: present 5-line summary, wait for "ok".

### CP-1 · Deliverable Plan

1. Propose composition: skills and agents to activate.
2. Declare deliverable sections with expected coverage.
3. Select charter depth:
   - Complex program (>50 people, regulated) → Full charter (12 sections)
   - Standard project (10-50 people) → Standard charter (8 sections)
   - Small initiative (<10 people) → Lean charter (5 sections)

### CP-2 · Execution

Generate the following sections:

1. **Project Overview** — name, sponsor, PM, start date, strategic alignment. [DOC]
2. **Business Case** — problem statement, opportunity, cost of inaction, expected benefits with measurable targets. [DOC] [INFERENCIA]
3. **Project Objectives** — SMART objectives with OKR mapping where applicable. [DOC]
4. **Scope Overview** — high-level scope, in/out boundary, key assumptions, constraints. [DOC] [INFERENCIA]
5. **Success Criteria** — measurable KPIs with targets and measurement method. [DOC] [INFERENCIA]
6. **Milestone Schedule** — top 8-12 milestones with target dates. Mermaid Gantt. [INFERENCIA]
7. **Budget Summary** — magnitude in FTE-months (NEVER prices), confidence range, mandatory disclaimer. [INFERENCIA] [SUPUESTO]
8. **Governance Structure** — sponsor, steering committee, PM, key roles, decision authority. [DOC]
9. **Initial Risk Assessment** — top 10 risks with probability-impact classification. [INFERENCIA]
10. **Stakeholder Summary** — key stakeholders, roles, engagement level. [DOC] [INFERENCIA]
11. **Assumptions & Constraints** — documented with origin tag and confidence level. [SUPUESTO]
12. **Approval Signatures** — sign-off template for sponsor and key stakeholders.

### CP-3 · Validation

- [ ] Business case with measurable benefits
- [ ] SMART objectives defined
- [ ] Scope boundary clear (in/out)
- [ ] Key milestones with dates
- [ ] Budget in FTE-months only (no prices)
- [ ] Governance structure with decision authority
- [ ] Top 10 risks identified
- [ ] Evidence tags present on all assertions

If validation fails → correct (max 1 retry) → deliver with documented gaps.

### CP-4 · Delivery

Output: 00_Project_Charter.md in structured Markdown.
Every assertion carries an origin tag: [CODIGO], [CONFIG], [DOC], [INFERENCIA].
This document is for GOVERNANCE and AUTHORIZATION. It frames the entire project.

## Committee Spawning Protocol

### Permanent Triad (always active CP-0 -> CP-F)

| Agent | Role | Votes? |
|-------|------|--------|
| `pm-conductor` | Orchestrates phases, enforces gates, facilitates | NO — facilitates only |
| `delivery-manager` | Timeline, scope, budget, stakeholder management | YES — always |
| `risk-controller` | Quality gates, risk monitoring, deliverable validation | YES — always |

### Spawning Rules

1. **Triad only** for charter generation unless complexity warrants panel
2. **Escalation** — If charter reveals high complexity, recommend `/pm:run-deep`

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct. No academic jargon without explanation.
- **Attribution**: Expert committee of the PMO-APEX Framework
- **Tagline**: Every deliverable footer includes: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*
- **Format**: Markdown-excellence standard (TL;DR, dense prose, tables with R/Y/G traffic lights, Mermaid diagrams, callouts, evidence tags, cross-references)
- **Evidence tags**: [CODIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Diagrams**: Mermaid — milestone Gantt, governance org chart

## CONSTRAINTS

- Do not proceed by intuition. Proceed by evidence.
- NEVER prices, rates, or currency amounts. FTE-months + mandatory disclaimer.
- This document authorizes the project — it must be clear and concise.
- Markdown-excellence standard: TL;DR, tables R/Y/G, callouts, zero filler.
- Mermaid diagrams: `gantt` for milestones, `flowchart TD` for governance.
