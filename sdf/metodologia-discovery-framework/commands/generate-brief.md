---
description: "Generate 02_Brief_Tecnico — executive technical summary (max 3 pages) for steering committee"
user-invocable: true
---

# METODOLOGIA DISCOVERY · TECHNICAL BRIEF AS-IS · NL-HP v3.0

## ROLE

Technical Architect — activates `metodologia-asis-analysis` as primary skill (brief variant: 5 sections, max 3 pages).
Support skills: `metodologia-sector-intelligence` (industry lens), `metodologia-risk-controlling-dynamics` (risk traffic light).

## OBJECTIVE

Generate 02_Brief_Tecnico_ASIS for the current project. BREVITY > completeness. Max 3 pages. If the user provides "$ARGUMENTS", use them as context.

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

1. Scan repository: package.json, pom.xml, build.gradle, go.mod, requirements.txt, Dockerfiles, CI/CD configs.
2. Classify attachments. Declare findings and gaps.

### CP-2 · Execution (MAXIMUM 3 PAGES)

1. **Technical Snapshot** — table: languages, frameworks, versions, estimated LOC, code age. Minimum 5 technologies. [CÓDIGO] [CONFIG]
2. **Health Traffic Light** — 6 dimensions in 🔴/🟡/🟢: maintainability, security, scalability, metodologia-observability, technical debt, test coverage. 1-line justification + evidence per dimension. [CÓDIGO] [CONFIG] [INFERENCIA]
3. **Top 5 Findings** — description, evidence, impact, urgency. [CÓDIGO] [DOC]
4. **Top 5 Risks** — description, probability, impact, mitigation. [CÓDIGO] [INFERENCIA]
5. **Executive Recommendation** — 3-5 lines with action, time horizon, urgency. [INFERENCIA]

> Cross-ref: findings referenced in 03_Analisis_AS-IS for deep-dive.

### CP-3 · Validation

- [ ] Stack >= 5 technologies
- [ ] Traffic light covers 6 dimensions with evidence
- [ ] Maximum 3 pages
- [ ] If no tests: flag as CRITICAL metodologia-observability risk

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct. No academic jargon without explanation.
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: Every deliverable footer includes: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*
- **Format**: Markdown-excellence standard (TL;DR, dense prose, tables with 🟢/🟡/🔴, Mermaid diagrams, callouts, evidence tags, cross-references)
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Diagrams**: Mermaid — 1-4 per deliverable, max 20 nodes, descriptive IDs, labeled edges

## CONSTRAINTS

- BREVITY > completeness. Every word must add value.
- Do not include exhaustive analysis — that belongs in document 03.
- Mermaid diagrams: `mindmap` (stack overview by layer).
