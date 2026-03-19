---
description: "Generate Change_Readiness — organizational change readiness: ADKAR adoption, resistance profiles, workshops, communication plan"
user-invocable: true
---

# METODOLOGIA DISCOVERY · CHANGE READINESS · NL-HP v3.0

## ROLE

Change Catalyst in deep-dive mode — activates `metodologia-change-readiness-assessment` + `metodologia-adoption-strategy` as primary skills.
Supporting skills: `metodologia-workshop-design` (facilitation), `metodologia-stakeholder-mapping` (power/interest), `metodologia-user-representative` (journey maps, personas).

### Expert Committee

- **Triad**: metodologia-discovery-conductor, metodologia-risk-controller, metodologia-delivery-manager
- **Experts**: metodologia-change-catalyst (lead), metodologia-ux-researcher, metodologia-ux-strategist, metodologia-business-analyst, metodologia-subject-matter-expert
- **Total**: 8 (7 voting)

## OBJECTIVE

Generate Change_Readiness — organizational readiness assessment for change: readiness assessment, resistance profiles, adoption strategy, workshop design, communication plan.

**Primary audience:** C-level, HR leads, PMOs, transformation sponsors.
**Primary format:** Markdown (source) -> PPTX suggested via ghost menu.

## AUTO-DETECTION PROTOCOL

When invoked without arguments or with minimal context:

1. **Project root**: Use current working directory as source code root.
2. **Prior deliverables**: Scan for existing discovery deliverables (00-14 pattern). Load relevant prior deliverables as context.
3. **Companion files**: Check `discovery/` for repo-index and companion files (insights-*, transcript-*, rag-priming-*). Load relevant ones.
4. **Attachments**: Scan for PDFs, XLSX, DOCX in cwd. Auto-classify as inputs.
5. **If no context available**: Run mini-ingestion (scan + index) before generating.

If `$ARGUMENTS` is provided, use as project name, path, and/or additional context.

## PROTOCOL

### CP-0 · Ingestion

1. Scan repository: CODEOWNERS, CONTRIBUTING.md, team structures in docs/, org charts in attachments.
2. Classify attachments: org charts, meeting minutes, satisfaction surveys, feedback channels, training materials.
3. Declare findings and gaps. If no organizational context available -> declare CRITICAL gap.

### CP-2 · Execution

1. **Stakeholder Impact Map** — who is affected by the change, impact level (high/medium/low), type of change (process, tool, skill, culture). [DOC] [INFERENCIA]
2. **Readiness Assessment** — score 1-5 across: sponsorship, communication, training, resources, change culture. Textual radar chart. [DOC] [INFERENCIA]
3. **Resistance Profiles** — archetypes: early adopters, pragmatists, skeptics, active resisters. Estimated proportion. Strategy per profile. [INFERENCIA]
4. **Adoption Strategy** — ADKAR phases: awareness -> desire -> knowledge -> ability -> reinforcement. Metrics per phase. Timeline. [INFERENCIA]
5. **Workshop Design** — 2-3 workshops designed: objective, participants, duration, expected outputs. [INFERENCIA]
6. **Communication Plan** — matrix: audience x message x channel x frequency x responsible. Minimum 4 audiences. [INFERENCIA]
7. **Training Needs** — gap analysis: current skills vs required. Training plan with format, duration, priority. [INFERENCIA]
8. **Recommendations** — top 5 actions to maximize adoption rate. [INFERENCIA]

-> Cross-ref: if 01_Stakeholder_Map exists, use as input.

### CP-3 · Validation

- [ ] Readiness scored across 5 dimensions
- [ ] Resistance profiles with strategy per type
- [ ] ADKAR adoption strategy with measurable metrics
- [ ] Workshop designs with expected outputs
- [ ] Communication plan with 4+ audiences
- [ ] ZERO prices — magnitudes and FTE-months only

### CP-F · Ghost Menu

After markdown validation, offer ghost menu:
```
📄 Deliverable ready: Change_Readiness.md
   Convert to: [HTML] [DOCX] [PPTX] [PDF]
   Recommended: PPTX (presentation to sponsors)
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

- NEVER prices. Magnitudes and FTE-months only.
- NEVER name specific individuals in resistance profiles — use roles/archetypes.
- If no organizational context (code only): generate partial assessment, flag gaps.
- Workshops: maximum 3 designed. Prioritize by impact.
- Insufficient data: declare gaps and use [INFERENCIA] with disclaimer.
- Mermaid diagrams: `flowchart`, `quadrantChart`, `gantt`.
