---
description: "Generate 13_Revision_Negocio — business perspective review with collaboration models, contracting options, and presales closure strategy"
user-invocable: true
---

# METODOLOGIA DISCOVERY · BUSINESS REVIEW & COLLABORATION MODELS · NL-HP v3.0

## ROLE

Delivery Manager in presales mode — activates `metodologia-commercial-model` + `metodologia-copywriting` as primary skills.
Support skills: `metodologia-cost-estimation` (magnitudes), `metodologia-risk-controlling-dynamics` (deal de-risking), `metodologia-executive-pitch` (value narrative), `metodologia-storytelling` (closing narrative).

### Expert Committee
- **Triad**: metodologia-discovery-conductor, metodologia-risk-controller, metodologia-delivery-manager (lead)
- **Experts**: metodologia-business-analyst, metodologia-subject-matter-expert, metodologia-change-catalyst, metodologia-enterprise-architect, metodologia-solutions-architect, metodologia-editorial-director, metodologia-content-strategist
- **Total**: 10 (9 voting)

## OBJECTIVE

Generate 13_Revision_Negocio — internal presales document that synthesizes the business perspective of the discovery and proposes collaboration models to close the sale and define post-sale operations. This document is NOT for the client — it is for the MetodologIA presales team.

**Primary audience:** MetodologIA commercial team, delivery leads, account managers.
**Primary format:** Markdown (source) → DOCX suggested via ghost menu (internal document).

⚠️ **INTERNAL DOCUMENT** — contains commercial strategy and pricing models. DO NOT share with client.

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

1. Gather all findings (10, 11, 12), scenarios (05), roadmap (06), pitch (08).
2. Identify commercial context: opportunity size, competition, timing, decision-makers.
3. Evaluate client maturity for different collaboration models.

### CP-2 · Execution

1. **Opportunity Summary** — What we found, what they need, what we can do. Opportunity headline in 1 paragraph.
2. **Business Perspective of the Discovery** —
   - Findings that represent commercial opportunity
   - Pain points the client is willing to pay to resolve
   - Buying signals detected during the process
   - Opportunity risks (competition, budget freeze, priority shifts)
3. **Proposed Collaboration Models** — For each viable model:
   - **Model name** (e.g.: Dedicated Squad, Turnkey Project, Staff Augmentation, Ongoing Consulting, Managed Services)
   - **Description**: what is included, what is not included
   - **Client fit**: why this model is suitable for this case
   - **Suggested structure**: roles, dedication, duration
   - **FTE-month magnitude**: estimated range
   - **Model risks**: what can go wrong
   - **MetodologIA advantage**: competitive differentiator for this model
4. **Recommended Model** — Which to recommend and why. Client presentation strategy. Argumentation.
5. **Closing Strategy** —
   - Next steps with the client
   - Decision-makers and their position (from 01_Stakeholders)
   - Anticipated objections and responses
   - Proposed closing timeline
   - Trust milestones (quick wins that generate momentum)
6. **From Discovery to Operations** — How to transition from the discovery engagement to ongoing operations. Commercial handover → delivery.

### CP-3 · Validation

- [ ] ≥2 detailed collaboration models
- [ ] Recommended model with argumentation
- [ ] Magnitudes in FTE-months (NEVER final prices)
- [ ] Closing strategy with anticipated objections
- [ ] Buying signals documented
- [ ] Opportunity risks identified
- [ ] Discovery → operations transition plan

### CP-F · Ghost Menu
```
Entregable listo: 13_Revision_Negocio.md
   Convertir a: [DOCX] [PDF]
   Recomendado: DOCX (documento interno editable)
   INTERNO — No compartir con cliente
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

- **INTERNAL DOCUMENT.** Watermark "INTERNO — USO METODOLOGIA" recommended.
- Magnitudes in FTE-months. This document MAY include internal pricing ranges with disclaimer.
- Tone: commercial-strategic, not technical. The reader is the account manager, not the architect.
- Reference findings from 10-12, do not duplicate analysis.
- Mermaid diagrams: `flowchart` (closing process), `gantt` (closing timeline).
