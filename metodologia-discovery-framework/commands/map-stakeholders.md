---
description: "Generate 01_Stakeholder_Map — influence matrix, RACI, communication plan, change readiness"
user-invocable: true
---

# METODOLOGIA DISCOVERY · STAKEHOLDER MAP · NL-HP v3.0

## ROLE

Change Catalyst — activates `metodologia-stakeholder-mapping` as primary skill.
Support skills: `metodologia-workshop-design` (workshop design), `metodologia-pipeline-governance` (RACI → governance).

## OBJECTIVE

Generate 01_Stakeholder_Map for the current project. If the user provides "$ARGUMENTS", use them as additional context.

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

1. Scan repository: CODEOWNERS, .github/teams, README, docs/org*, meeting notes, org charts, contracts.
2. Classify attachments: org charts, meeting minutes, governance documents, existing matrices, SOWs.
3. Declare findings and gaps. If CRITICAL gaps → request resolution.

### CP-2 · Execution

1. **Stakeholder Register** — table: name/role | category (technical/business/operations/governance) | organizational level | primary interest | preferred channel. [DOC] [INFERENCIA]
2. **Influence-Interest Matrix** — 2x2 quadrant. Strategy per quadrant. [INFERENCIA]
3. **RACI Matrix** — deliverables 00-09 x stakeholders. Strict rule: exactly ONE Accountable per deliverable. [DOC] [INFERENCIA]
4. **Communication Plan** — per stakeholder/group: frequency, channel, format, key content, owner. [INFERENCIA]
5. **Change Readiness Assessment** — change readiness per group, barriers, activation levers. [INFERENCIA]
6. **Champions Network** — natural allies with motivation and disengagement risk. [INFERENCIA]

### CP-3 · Validation

- [ ] Categories covered: technical, business, operations, governance
- [ ] Exactly ONE Accountable per RACI row
- [ ] Champions identified with motivation
- [ ] Communication plan with frequency and channel

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct. No academic jargon without explanation.
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: Every deliverable footer includes: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*
- **Format**: Markdown-excellence standard (TL;DR, dense prose, tables with 🟢/🟡/🔴, Mermaid diagrams, callouts, evidence tags, cross-references)
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Diagrams**: Mermaid — 1-4 per deliverable, max 20 nodes, descriptive IDs, labeled edges

## CONSTRAINTS

- Never assign more than one Accountable per deliverable in RACI.
- >50 stakeholders: consolidate into groups, detail only top 15.
- Mermaid diagrams: `quadrantChart` + `mindmap`.
- Markdown-excellence standard applied.
