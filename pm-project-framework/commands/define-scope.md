---
description: "Generate 02_Scope_Statement_WBS — scope definition, WBS decomposition, acceptance criteria"
user-invocable: true
---

# PMO-APEX · SCOPE STATEMENT & WBS · NL-HP v3.0

## ROLE

Scope Analyst — activates `apex-scope-definition` as primary skill.
Support skills: `apex-requirements-traceability` (traceability), `apex-change-control` (scope change process).

## OBJECTIVE

Generate 02_Scope_Statement_WBS.md — detailed scope definition with Work Breakdown Structure, acceptance criteria, and change control process.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Prior deliverables**: Load 00_Project_Charter for scope context and objectives.
3. **Attachments**: Scan for SOW, requirements documents, user stories, feature lists.
4. **Source inference**: Extract scope signals from README, issue trackers, backlog files.

## PROTOCOL

### CP-0 · Ingestion

1. Load charter and any SOW/contract for scope boundaries.
2. Scan for existing requirements, user stories, feature lists, backlogs.
3. Identify scope sources: contractual, stakeholder requests, technical needs.
4. Declare findings and gaps.

### CP-2 · Execution

1. **Project Scope Statement** — purpose, product scope, project scope, deliverables list, acceptance criteria, exclusions, assumptions, constraints. [DOC] [INFERENCIA]
2. **WBS** — minimum 3 levels (4 for deep mode). Mermaid mindmap or flowchart. Numbered coding scheme (1.0, 1.1, 1.1.1). [DOC] [INFERENCIA]
3. **WBS Dictionary** — for each level-3 work package: description, responsible, duration estimate, acceptance criteria, dependencies. Table format. [INFERENCIA]
4. **In-Scope / Out-of-Scope Boundary** — explicit table with rationale for each exclusion. [DOC] [INFERENCIA]
5. **Acceptance Criteria** — per major deliverable: what, how measured, who approves. [DOC]
6. **Scope Change Control Process** — change request form, evaluation criteria, approval authority, impact assessment protocol. [INFERENCIA]
7. **Requirements Traceability** — high-level requirements linked to WBS packages. [DOC]

### CP-3 · Validation

- [ ] Scope statement with clear in/out boundary
- [ ] WBS minimum 3 levels with numbered scheme
- [ ] WBS dictionary for all level-3 packages
- [ ] Acceptance criteria per major deliverable
- [ ] Change control process defined
- [ ] Evidence tags present

### CP-4 · Delivery

Output: 02_Scope_Statement_WBS.md
Cross-reference: feeds into 03_Schedule_Baseline, 04_Resource_Plan, 05_Risk_Register.

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct.
- **Attribution**: Expert committee of the PMO-APEX Framework
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*
- **Format**: Markdown-excellence (TL;DR, tables, Mermaid, evidence tags)
- **Diagrams**: Mermaid mindmap for WBS hierarchy

## CONSTRAINTS

- WBS must be deliverable-oriented, not activity-oriented.
- Every WBS package must have a unique identifier.
- 100% rule: WBS must capture 100% of project scope.
- No gold-plating: out-of-scope items explicitly listed.
