---
description: "Generate 05_Escenarios — Tree-of-Thought scenario analysis with 6D scoring (GATE 1)"
user-invocable: true
---

# METODOLOGIA DISCOVERY · SCENARIO ANALYSIS · NL-HP v3.0

## ROLE

Full Expert Panel — activates `metodologia-scenario-analysis` as primary skill.
Support skills: `metodologia-technical-feasibility` (6D validation), `metodologia-software-viability` (claim viability), `metodologia-risk-controlling-dynamics` (stress-testing).

## OBJECTIVE

Generate 05_Escenarios_ToT for the current project. Requires prior deliverables (03, 04) as context. If the user provides "$ARGUMENTS", use them as context.

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

1. Scan repository: focus on technical constraints, hard dependencies, implicit NFRs.
2. Classify attachments: prior deliverables (AS-IS, flows), business constraints, timeline constraints.

### CP-2 · Execution

1. **Candidate Scenarios** — minimum 3 genuinely distinct. Each one: name, 3-5 line description, technical philosophy, scope, timeline, preconditions. [DOC] [CÓDIGO] [INFERENCIA]
2. **Multidimensional Scoring (6D)** — scenario x dimension table: (1) technical viability, (2) business impact, (3) execution risk, (4) time-to-value, (5) relative cost, (6) residual debt. Scale 1-5, justification per cell. [INFERENCIA]
3. **SWOT per Scenario** — minimum 3 items per quadrant. [INFERENCIA]
4. **Decision Tree** — Tree-of-Thought with criteria, branches, leaves with recommended scenario. [INFERENCIA]
5. **Switching Logic** — triggers, early signals, abandonment criteria, plan B per scenario. [INFERENCIA]
6. **Panel Recommendation** — recommended scenario, documented dissents, validity conditions. [INFERENCIA]

> **GATE 1**: If MODE=piloto-auto → STOP here. Do not proceed without explicit approval.

### CP-3 · Validation

- [ ] >= 3 genuinely distinct scenarios
- [ ] 6 dimensions scored with justification
- [ ] SWOT complete (minimum 3 per quadrant)
- [ ] Switching logic with concrete triggers

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct. No academic jargon without explanation.
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: Every deliverable footer includes: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*
- **Format**: Markdown-excellence standard (TL;DR, dense prose, tables with 🟢/🟡/🔴, Mermaid diagrams, callouts, evidence tags, cross-references)
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Diagrams**: Mermaid — 1-4 per deliverable, max 20 nodes, descriptive IDs, labeled edges

## CONSTRAINTS

- Score tie: tiebreaker by highest-weight dimension, NEVER by preference.
- Scenarios must be genuinely distinct, not cosmetic variations.
- Mermaid diagrams: `quadrantChart` + `flowchart TD`.
