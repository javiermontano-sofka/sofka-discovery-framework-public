---
description: "Generate 12_Hallazgos_Funcionales — functional findings covering user journeys, process gaps, UX issues, and business rule analysis"
user-invocable: true
---

# METODOLOGIA DISCOVERY · FUNCTIONAL FINDINGS · NL-HP v3.0

## ROLE

Domain Analyst leading, with editorial committee for production — activates `metodologia-flow-mapping` + `metodologia-functional-spec` + `metodologia-storytelling` as primary skills.
Support skills: `metodologia-user-representative` (user voice), `metodologia-ux-writing` (accessibility), `metodologia-data-storytelling` (functional metrics).

### Expert Committee
- **Triad**: metodologia-discovery-conductor, metodologia-risk-controller, metodologia-delivery-manager
- **Experts**: metodologia-domain-analyst (lead), metodologia-business-analyst, metodologia-ux-strategist, metodologia-ux-researcher, metodologia-frontend-developer, metodologia-quality-guardian, metodologia-subject-matter-expert, metodologia-editorial-director
- **Total**: 11 (10 voting — conductor calls tie-break with evidence request)

## OBJECTIVE

Generate 12_Hallazgos_Funcionales — analysis from the functional, process, and user experience perspective. Complements 11_Hallazgos_Tecnicos with the business and end-user perspective. Requires at minimum 04_Flows, ideally 01 + 03 + 04.

**Primary audience:** Product managers, process owners, UX leads, functional stakeholders.
**Primary format:** Markdown (source) → HTML suggested via ghost menu.

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

1. Scan flow deliverables (04), stakeholders (01), functional AS-IS.
2. Identify user journeys, business processes, implicit business rules.
3. Map user touchpoints and friction points.

### CP-2 · Execution

1. **Functional TL;DR** — Top 5 functional findings with user/process impact. [DOC][STAKEHOLDER]
2. **Evaluated User Journeys** — For each main journey:
   - Current path vs. ideal path
   - Quantified friction points (clicks, time, errors)
   - Moments of truth (where the user is won or lost)
   - Improvement opportunities. [CÓDIGO][DOC][STAKEHOLDER]
3. **Process Gaps** — Manual processes that should be automated, handoffs with information loss, bottlenecks, processes without an owner. [DOC][INFERENCIA]
4. **Implicit Business Rules** — Business logic found in code that is not documented, contradictory rules, hardcoded exceptions. [CÓDIGO]
5. **User Experience** — UX patterns, interface consistency, accessibility (WCAG), responsive design, perceived load times. [CÓDIGO][DOC]
6. **Functional Data** — Data quality from the functional perspective: unvalidated fields, orphaned data, domain inconsistencies. [CÓDIGO][CONFIG]
7. **Functional Impact Matrix** — Findings prioritized by: user impact × frequency × correction effort. [INFERENCIA]
8. **Functional Recommendations** — Top 10 prioritized improvements with impact on experience, process, and business metric. [INFERENCIA]

### CP-3 · Validation

- [ ] User journeys documented with quantified friction points
- [ ] Process gaps identified with impact
- [ ] Implicit business rules extracted from code
- [ ] UX/accessibility evaluation present
- [ ] Functional impact matrix complete
- [ ] Prioritized recommendations with impact metrics
- [ ] End-user perspective present (not just technical)

### CP-F · Ghost Menu
```
Entregable listo: 12_Hallazgos_Funcionales.md
   Convertir a: [HTML] [DOCX] [PDF]
   Recomendado: HTML (journey maps interactivos)
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

- USER perspective, not system perspective. The user is the protagonist.
- Each finding includes: what affects the user + how frequently + how much impact.
- Do not duplicate technical analysis from 11 — reference instead: "→ See 11_Hallazgos_Tecnicos section".
- Mermaid diagrams: `flowchart` (journeys), `stateDiagram` (states), `sequenceDiagram` (interactions).
