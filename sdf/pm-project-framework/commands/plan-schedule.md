---
description: "Generate 03_Schedule_Baseline — schedule with Gantt, critical path, 3-point estimates, Monte Carlo"
user-invocable: true
---

# PMO-APEX · SCHEDULE BASELINE · NL-HP v3.0

## ROLE

Schedule Planner — activates `apex-schedule-planning` as primary skill.
Support skills: `apex-earned-value-management` (baseline), `apex-risk-assessment` (schedule risk).

## OBJECTIVE

Generate 03_Schedule_Baseline.md — detailed schedule with activity sequencing, critical path, 3-point estimates, Gantt chart, and risk-adjusted forecasts.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Prior deliverables**: Load 00_Charter (milestones), 02_Scope_WBS (work packages) as primary inputs.
3. **Attachments**: Scan for MPP, XLSX, Gantt exports, sprint plans.
4. **Methodology context**: Detect if Agile (sprints) or Waterfall (phases) to adapt schedule format.

## PROTOCOL

### CP-0 · Ingestion

1. Load WBS work packages as scheduling input.
2. Load charter milestones as constraints.
3. Identify team availability and calendar constraints.
4. Declare findings and gaps.

### CP-2 · Execution

1. **Activity List** — derived from WBS level-3 packages. Each activity: ID, name, WBS reference, responsible, predecessor. [DOC]
2. **Activity Sequencing** — dependency network with types: FS (Finish-to-Start), FF, SS, SF. Mermaid flowchart. [INFERENCIA]
3. **Duration Estimates** — 3-point estimates per activity: Optimistic (O), Most Likely (M), Pessimistic (P). PERT expected = (O + 4M + P) / 6. Table format. [INFERENCIA] [SUPUESTO]
4. **Critical Path Analysis** — identify critical path, total float per activity, near-critical paths (<5 days float). [INFERENCIA]
5. **Gantt Chart** — Mermaid gantt with phases, milestones, dependencies, critical path highlighted. [INFERENCIA]
6. **Milestone Schedule** — key milestones with baseline dates, dependencies, owners. [DOC] [INFERENCIA]
7. **Schedule Risk Analysis** — Monte Carlo simulation summary: P50, P80, P95 completion dates. Top 5 schedule risks with impact. [INFERENCIA]
8. **Buffer Management** — feeding buffers and project buffer. Critical chain or traditional contingency. [INFERENCIA]
9. **Resource Loading Summary** — peak resource demand by phase. Resource histogram concept. [INFERENCIA]

### CP-3 · Validation

- [ ] All WBS packages have corresponding activities
- [ ] Dependencies are logical (no circular)
- [ ] Critical path identified with float values
- [ ] 3-point estimates for all activities
- [ ] Gantt chart with milestones
- [ ] P50/P80/P95 schedule forecasts
- [ ] Evidence tags present

### CP-4 · Delivery

Output: 03_Schedule_Baseline.md
Cross-reference: feeds into 04_Resource_Plan, 08_Executive_Dashboard, 11_EVM_Setup.

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct.
- **Attribution**: Expert committee of the PMO-APEX Framework
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*
- **Format**: Markdown-excellence (TL;DR, tables, Mermaid gantt, evidence tags)
- **Diagrams**: Mermaid `gantt` for schedule, `flowchart` for dependency network

## CONSTRAINTS

- 3-point estimates required — single-point estimates are insufficient.
- Critical path must be explicitly identified, not just implied.
- Schedule dates are planning targets, not commitments — add disclaimer.
- NEVER commit to specific calendar dates without stakeholder validation — use relative durations.
