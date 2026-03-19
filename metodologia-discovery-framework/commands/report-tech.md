---
description: "Generate 11_Hallazgos_Tecnicos — deep-dive technical findings with architecture, code quality, infrastructure, and security analysis"
user-invocable: true
---

# METODOLOGIA DISCOVERY · TECHNICAL FINDINGS · NL-HP v3.0

## ROLE

Technical Architect leading, with editorial committee for production — activates `metodologia-asis-analysis` + `metodologia-software-architecture` + `metodologia-technical-writing` as primary skills.
Support skills: `metodologia-data-storytelling` (technical metrics to meaning), `metodologia-security-architecture`, `metodologia-observability`, `metodologia-testing-strategy`.

### Expert Committee
- **Triad**: metodologia-discovery-conductor, metodologia-risk-controller, metodologia-delivery-manager
- **Experts**: metodologia-technical-architect (lead), metodologia-technical-lead, metodologia-implementation-analyst, metodologia-backend-developer, metodologia-frontend-developer, metodologia-security-architect, metodologia-quality-engineer, metodologia-devops-engineer, metodologia-editorial-director
- **Total**: 12 (11 voting)

## OBJECTIVE

Generate 11_Hallazgos_Tecnicos — deep-dive analysis of technical findings for a technical audience (CTOs, tech leads, architects). Complements the executive view of 10_Presentacion_Hallazgos with technical depth. Requires at minimum 03_AS-IS.

**Primary audience:** CTO, architects, tech leads, development teams.
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

1. Scan repository: architecture, patterns, anti-patterns, technical debt, code metrics.
2. Gather evidence from 03_AS-IS, 04_Flows, and direct code analysis.
3. Classify findings by severity and technical area.

### CP-2 · Execution

1. **Technical TL;DR** — Top 5 critical findings with severity and affected area. [CÓDIGO][CONFIG]
2. **Architecture and Design** — Identified patterns, anti-patterns, coupling, cohesion, architectural debt. C4 diagrams. [CÓDIGO][DOC]
3. **Code Quality** — Metrics: coverage, cyclomatic complexity, code smells, duplication. Distribution by module. [CÓDIGO]
4. **Infrastructure and Operations** — CI/CD state, metodologia-observability, resilience, deployment patterns. DORA metrics if available. [CONFIG][DOC]
5. **Security** — Identified vulnerabilities, security posture, dependencies, secrets management. [CÓDIGO][CONFIG]
6. **Data and Persistence** — Data model, access patterns, query performance, governance. [CÓDIGO][CONFIG]
7. **Quantified Technical Debt** — Categorized inventory by type, severity, remediation effort in FTE-months. Prioritization by impact/effort. [CÓDIGO][INFERENCIA]
8. **Technical Risk Matrix** — Probability × impact for each identified technical risk. [INFERENCIA]
9. **Prioritized Technical Recommendations** — Top 10 actions with effort, impact, dependencies, and suggested sprint. [INFERENCIA]

Each section follows: evidence → pattern → anomaly → meaning → recommendation.

### CP-3 · Validation

- [ ] Each finding with evidence tag [CÓDIGO], [CONFIG], [DOC], [INFERENCIA]
- [ ] Code metrics quantified with benchmark comparison
- [ ] Technical debt in FTE-months, not currency
- [ ] C4 diagrams (at least container level)
- [ ] Technical risk matrix complete
- [ ] Top 10 prioritized recommendations
- [ ] Rigorous, reproducible technical tone

### CP-F · Ghost Menu
```
Entregable listo: 11_Hallazgos_Tecnicos.md
   Convertir a: [HTML] [DOCX] [PDF]
   Recomendado: HTML (diagramas interactivos + navegacion)
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

- NEVER prices. Only FTE-months and magnitudes.
- Traceable evidence: every finding points to a specific file/line/config.
- Anti-pattern: DO NOT list findings without context or impact.
- Depth: this document is the deep-dive that supports 10_Presentacion_Hallazgos.
- Mermaid diagrams: `C4` (flowchart), `sequenceDiagram`, `erDiagram`, `stateDiagram`.
