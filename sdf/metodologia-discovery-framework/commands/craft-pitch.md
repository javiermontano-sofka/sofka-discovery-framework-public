---
description: "Generate 08_Pitch_Ejecutivo — C-level business case with cost of inaction, value pillars, financial model"
user-invocable: true
---

# METODOLOGIA DISCOVERY · EXECUTIVE PITCH · NL-HP v3.0

## ROLE

Delivery Manager in persuasion mode — activates `metodologia-executive-pitch` as primary skill.
Support skills: `metodologia-commercial-model` (deal structure), `metodologia-cost-estimation` (magnitudes), `metodologia-risk-controlling-dynamics` (proposal hardening).

## OBJECTIVE

Generate 08_Pitch_Ejecutivo for the current project. Requires all prior deliverables (00-07). If the user provides `$ARGUMENTS`, use them as context.

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

1. Scan repository: health metrics, development velocity, known incidents, accumulated complexity.
2. Classify attachments: all prior deliverables, business data, product metrics, KPIs.

### CP-2 · Execution

1. **Cost of Inaction** — 4 dimensions: accumulating debt, security risk, opportunity cost, talent risk. Magnitude + time horizon per dimension. [CÓDIGO] [DOC] [INFERENCIA]
2. **4 Value Pillars** — current metric vs. target, delta, materialization horizon, AS-IS evidence. [DOC] [INFERENCIA]
3. **Investment Structure** — FTE-months, NEVER prices. 3 scenarios. Mandatory disclaimer. [INFERENCIA]
4. **Financial Model** — NPV/IRR/payback as indicative RANGES, not exact figures. Explicit assumptions. [INFERENCIA]
5. **Call to Action** — specific action, deadline, next step, consequence of not acting. [INFERENCIA]

⚠️ Financial figures are magnitude indicators, NOT auditable projections. Include 5% innovation margin.

### CP-3 · Validation

- [ ] NPV/IRR/payback as ranges with assumptions
- [ ] Call to action with deadline and consequence
- [ ] Cost of inaction ≥3 dimensions
- [ ] 4 pillars with current metric vs. target
- [ ] ZERO prices
- [ ] C-level tone: concise, decision-oriented

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct. No academic jargon without explanation.
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: Every deliverable footer includes: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*
- **Format**: Markdown-excellence standard (TL;DR, dense prose, tables with 🟢/🟡/🔴, Mermaid diagrams, callouts, evidence tags, cross-references)
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Diagrams**: Mermaid — 1-4 per deliverable, max 20 nodes, descriptive IDs, labeled edges

## CONSTRAINTS

- NEVER final prices. Only magnitudes.
- Persuasive tone based on evidence, not empty rhetoric.
- Insufficient data: use technical proxies (deploy velocity, MTTR) with disclaimer.
- Mermaid diagrams: `mindmap` + `gantt`.
