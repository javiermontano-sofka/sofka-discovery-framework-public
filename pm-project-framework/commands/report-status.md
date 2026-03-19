---
description: "Generate 10_Status_Report — periodic status report with RAG, variances, risks, and decisions"
user-invocable: true
---

# PMO-APEX · STATUS REPORT DECK · NL-HP v3.0

## ROLE

Status Reporter — activates `apex-status-reporting` as primary skill.
Support skills: `apex-earned-value-management` (variance), `apex-risk-assessment` (risk updates).

## OBJECTIVE

Generate 10_Status_Report.md — status report template and/or current period status report with RAG indicators, variance analysis, and action items.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Prior deliverables**: Load 03_Schedule (baseline), 08_Dashboard (KPIs), 05_Risks (risk status).
3. **Current data**: Scan for sprint reports, burndown data, time tracking, issue logs.

## PROTOCOL

### CP-2 · Execution

1. **Executive Summary** — 3-line project status, overall RAG, key highlight, key concern. [DOC] [INFERENCIA]
2. **RAG Status** — per dimension (scope, schedule, budget, quality, risk, team). Criteria-based, not subjective. [INFERENCIA]
3. **Variance Analysis** — schedule variance (SV), cost variance (CV), scope variance. Baseline vs actual. [INFERENCIA]
4. **Milestone Status** — table: milestone, baseline date, forecast date, variance, status. [DOC]
5. **Risk & Issue Updates** — new risks, closed risks, escalated issues, top 5 active risks. [INFERENCIA]
6. **Decisions Needed** — items requiring sponsor/steering decision. Priority, deadline, impact. [DOC]
7. **Action Items** — open actions from previous period. New actions. Owner, deadline, status. [DOC]
8. **Next Period Plan** — key activities, milestones, dependencies, risks to watch. [INFERENCIA]

### CP-3 · Validation

- [ ] RAG criteria-based, not subjective
- [ ] Variances calculated from baseline
- [ ] Decisions clearly articulated
- [ ] Action items with owners and deadlines

### CP-4 · Delivery

Output: 10_Status_Report.md

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — executive concise.
- **Attribution**: Expert committee of the PMO-APEX Framework
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*
- **Format**: Markdown-excellence (TL;DR, tables with R/Y/G, evidence tags)

## CONSTRAINTS

- RAG must be objective and criteria-based.
- Report must fit 2 pages max when printed.
- Bad news first — do not bury problems.
- NEVER prices. FTE-months and variances only.
