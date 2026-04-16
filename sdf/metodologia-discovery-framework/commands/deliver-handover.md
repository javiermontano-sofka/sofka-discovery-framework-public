---
description: "Generate 09_Handover — operational transition package discovery-to-execution with 90-day plan"
user-invocable: true
---

# METODOLOGIA DISCOVERY · OPERATIONAL HANDOVER · NL-HP v3.0

## ROLE

Delivery Manager + Commercial Activator — activates `metodologia-discovery-handover` as primary skill.
Support skills: `metodologia-pipeline-governance` (governance transition), `metodologia-risk-controlling-dynamics` (risk tracker with kill criteria), `metodologia-stakeholder-mapping` (stakeholder transition).

## OBJECTIVE

Generate 09_Handover_Operaciones for the current project. Requires all prior deliverables (00-08). Self-contained document for the execution team. If the user provides `$ARGUMENTS`, use them as context.

## AUTO-DETECTION PROTOCOL

When invoked without arguments or with minimal context:

1. **Project root**: Use current working directory as source code root.
2. **Prior deliverables**: Scan for existing discovery deliverables (00-14 pattern). Load relevant prior deliverables as context (dependencies per phase order).
3. **Companion files**: Check `discovery/` for repo-index and companion files (insights-*, transcript-*, rag-priming-*). Load relevant ones.
4. **Attachments**: Scan for PDFs, XLSX, DOCX in cwd. Auto-classify as inputs.
5. **If no context available**: Run mini-ingestion (scan + index) before generating.

If `$ARGUMENTS` is provided, use as project name, path, and/or additional context.

## PROTOCOL

### CP-0 · Ingestion

1. Scan repository: current code state, open issues, pending PRs, CI/CD, operational documentation.
2. Classify attachments: all deliverables (00-08), commercial agreements, operational constraints.

### CP-2 · Execution (7 MANDATORY SECTIONS)

1. **Transition Summary** — what was discovered, what was decided, what is being delivered. Reference to each deliverable (00-08) with key finding. [DOC]
2. **Commercial Activation** — value proposition, scenario, magnitudes, next steps, timeline. Each item with owner + date. [DOC] [INFERENCIA]
3. **Ops Readiness** — checklist: environments, access, tooling, licenses, onboarding, knowledge transfer. Status + owner + deadline. [CONFIG] [DOC] [INFERENCIA]
4. **90-Day Plan** — 3×30 days. First month week by week. Objectives, deliverables, milestones, metrics, risks per period. [INFERENCIA]
5. **Governance Transition** — meeting cadence, roles, escalation, reporting, quality gates. [INFERENCIA]
6. **Risk Tracker** — inherited risks + new transition risks. Kill criteria for high severity. [DOC] [INFERENCIA]
7. **Stakeholder Transition** — role changes, entries/exits, knowledge handover. Reference stakeholder map (01). [DOC] [INFERENCIA]

### CP-3 · Validation

- [ ] 7 sections complete
- [ ] Every actionable item has owner + date
- [ ] Kill criteria for high-impact risks
- [ ] 90-day plan with first month week by week
- [ ] Self-contained document for a new team

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct. No academic jargon without explanation.
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: Every deliverable footer includes: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*
- **Format**: Markdown-excellence standard (TL;DR, dense prose, tables with 🟢/🟡/🔴, Mermaid diagrams, callouts, evidence tags, cross-references)
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Diagrams**: Mermaid — 1-4 per deliverable, max 20 nodes, descriptive IDs, labeled edges

## CONSTRAINTS

- Every actionable item MUST have an owner and a date.
- Kill criteria mandatory for high-severity risks.
- Gaps in prior deliverables → inherit as risk in the Risk Tracker.
- Mermaid diagrams: `gantt` + `flowchart` + `stateDiagram-v2`.
