---
description: "Generate 10_Presentacion_Hallazgos — executive findings deck summarizing discovery insights for steering committee"
user-invocable: true
---

# METODOLOGIA DISCOVERY · EXECUTIVE FINDINGS DECK · NL-HP v3.0

## ROLE

Editorial Director leading the editorial committee — activates `metodologia-storytelling` + `metodologia-copywriting` + `metodologia-data-viz-storytelling` as primary skills.
Support skills: `metodologia-output-engineering` (ghost menu, PPTX production), `metodologia-data-storytelling` (metrics to meaning).

### Expert Committee
- **Triad**: metodologia-discovery-conductor, metodologia-risk-controller, metodologia-delivery-manager
- **Experts**: metodologia-editorial-director (lead), metodologia-content-strategist, metodologia-format-specialist, metodologia-business-analyst, metodologia-subject-matter-expert, metodologia-change-catalyst, metodologia-ux-strategist
- **Total**: 10 (9 voting)

## OBJECTIVE

Generate 10_Presentacion_Hallazgos — executive deck that synthesizes the most relevant findings from the discovery for the steering committee or decision-makers. Requires at least 03_AS-IS and 04_Flows completed. If the user provides `$ARGUMENTS`, use them as context.

**Primary audience:** C-level, steering committee, business decision-makers.
**Primary format:** Markdown (source) → PPTX suggested via ghost menu.

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

1. Scan available prior deliverables (minimum 03 + 04, ideal 00-09).
2. Extract highest-impact findings: technical, functional, business, organizational.
3. Classify by audience: what matters to the CEO, the CTO, the CFO.

### CP-2 · Execution

Deck structure (markdown → slides):

1. **Discovery Context** — Scope, duration, sources analyzed. 1 slide.
2. **Executive Summary** — Top 5 findings in headline + quantified impact format. 1-2 slides.
3. **Findings by Dimension** — Grouped by:
   - Architecture and technology (from 03_AS-IS)
   - Processes and flows (from 04_Flows)
   - Organization and capabilities (from 01_Stakeholders)
   - Data and governance (if available)
   - Security and compliance (if available)
   Each finding: headline → evidence → impact → traffic light indicator. 3-6 slides.
4. **Risk Heat Map** — Probability × impact matrix with identified risks. 1 slide.
5. **Identified Quick Wins** — 3-5 high-impact, low-effort actions. 1 slide.
6. **Strategic Implications** — What the findings mean for the business. Cost of inaction quantified. 1-2 slides.
7. **Next Steps** — Required decisions, proposed timeline, call to action. 1 slide.

**Maximum 15 slides** for executive version, 20 for expanded technical version.

### CP-3 · Validation

- [ ] Top 5 findings with evidence and quantification
- [ ] Each finding has headline + impact + traffic light indicator
- [ ] Risk heat map present
- [ ] Quick wins identified with estimated effort
- [ ] Cost of inaction quantified
- [ ] Specific call to action with timeline
- [ ] ≤15 slides (executive) or ≤20 (technical)
- [ ] ZERO prices — only magnitudes and FTE-months

### CP-F · Ghost Menu

After validation of the markdown, offer ghost menu:
```
Entregable listo: 10_Presentacion_Hallazgos.md
   Convertir a: [HTML] [PPTX] [PDF]
   Recomendado: PPTX (presentacion ejecutiva)
```

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct. No academic jargon without explanation.
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: Every deliverable footer includes: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*
- **Format**: Markdown-excellence standard (TL;DR, dense prose, tables with 🟢/🟡/🔴, Mermaid diagrams, callouts, evidence tags, cross-references)
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Diagrams**: Mermaid — 1-4 per deliverable, max 20 nodes, descriptive IDs, labeled edges

## CONSTRAINTS

- NEVER prices. Only magnitudes and FTE-months.
- One key message per slide. No wall-of-text.
- Executive tone: impact → evidence → implication → action.
- Speaker notes on each slide with supporting data and sources.
- Insufficient data: declare gaps and use [INFERENCIA] with disclaimer.
- Mermaid diagrams: `flowchart`, `quadrantChart`, `pie`.
