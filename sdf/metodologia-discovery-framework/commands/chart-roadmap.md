---
description: "Generate 06_Solution_Roadmap — 5-phase roadmap with cost drivers, Monte Carlo, pivot points (GATE 2)"
user-invocable: true
---

# METODOLOGIA DISCOVERY · SOLUTION ROADMAP · NL-HP v3.0

## ROLE

Delivery Manager — activates `metodologia-solution-roadmap` as primary skill.
Support skills: `metodologia-cost-estimation` (cost driver taxonomy), `metodologia-commercial-model` (commercial structure), `metodologia-risk-controlling-dynamics` (pivot points), `metodologia-pipeline-governance` (phase gates).

## OBJECTIVE

Generate 06_Solution_Roadmap for the current project. Requires prior deliverables (03, 04, 05). If the user provides "$ARGUMENTS", use them as context.

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

1. Scan repository: LOC, modules, complexity, infra, CI/CD, tests — everything that informs effort magnitude.
2. Classify attachments: prior deliverables, budget or timeline constraints, capacity data.

### CP-2 · Execution

1. **5-Phase Roadmap** — Foundation → Migration → Integration → Optimization → Stabilization. Exit gate with criteria per phase. [DOC] [INFERENCIA]
2. **Cost Driver Taxonomy** — personnel, infrastructure, licenses, tooling, training, ramp-up, change management, contingency. NO PRICES. [INFERENCIA]
3. **Team Model** — roles per phase, seniority, FTE, duration. NO rates or tariffs. [INFERENCIA]
4. **Magnitude Framing** — FTE-months, NOT money. 3 scenarios: conservative, base, aggressive. [INFERENCIA]
5. **Monte Carlo Timeline** — P50/P80/P95 with variance factors. [INFERENCIA]
6. **Pivot Points** — minimum 5 with signals, options, decision criteria, impact. [INFERENCIA]

> **GATE 2**: If MODE=piloto-auto → STOP here. Do not proceed without approval.

> **MANDATORY COSTING DISCLAIMER**: The magnitudes are order-of-magnitude indicators. They do NOT constitute a quote or commercial proposal. They include a 5% innovation margin.

### CP-3 · Validation

- [ ] Exit gates per phase
- [ ] P50/P80/P95 with variance factors
- [ ] 3 magnitude scenarios in FTE-months
- [ ] >= 5 pivot points
- [ ] ZERO prices — magnitudes only
- [ ] Disclaimer present

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct. No academic jargon without explanation.
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: Every deliverable footer includes: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*
- **Format**: Markdown-excellence standard (TL;DR, dense prose, tables with 🟢/🟡/🔴, Mermaid diagrams, callouts, evidence tags, cross-references)
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Diagrams**: Mermaid — 1-4 per deliverable, max 20 nodes, descriptive IDs, labeled edges

## CONSTRAINTS

- NEVER include prices, tariffs, rates, or currency amounts.
- >100 FTE-months: flag megaproject, recommend sub-programs.
- Mermaid diagrams: `gantt` + `mindmap` + `flowchart`.
