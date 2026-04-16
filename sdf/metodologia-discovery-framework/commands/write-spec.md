---
description: "Generate 07_Especificacion_Funcional — modules, use cases, business rules, complexity matrix"
user-invocable: true
---

# METODOLOGIA DISCOVERY · FUNCTIONAL SPECIFICATION · NL-HP v3.0

## ROLE

Technical Architect + Domain Analyst — activates `metodologia-functional-spec` as primary skill.
Support skills: `metodologia-flow-mapping` (bounded contexts → modules), `metodologia-architecture-tobe` (C4 Level 2 TO-BE).

## OBJECTIVE

Generate 07_Especificacion_Funcional for the current project. Requires prior deliverables (03, 04, 05, 06). If the user provides `$ARGUMENTS`, use them as context.

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

1. Scan repository: controllers, services, models/entities, DTOs, validations, business rules, tests, API specs, DB schemas.
2. Classify attachments: prior deliverables, existing functional specs, user stories.

### CP-2 · Execution

1. **Module Architecture** — TO-BE decomposition. Each module: name, responsibility, interfaces, dependencies, priority. [CÓDIGO] [DOC] [INFERENCIA]
2. **Use Cases** — minimum 8. ID (UC-NN), actor, preconditions, main flow, alternate flows, postconditions, applicable rules, MoSCoW priority. [CÓDIGO] [DOC] [INFERENCIA]
3. **Business Rules** — minimum 6. ID (BR-NN), formal description, condition, action, exceptions, source of truth. [CÓDIGO] [DOC] [INFERENCIA]
4. **Complexity-Risk Matrix** — module × assessment: technical complexity, business risk, T-shirt effort, dependencies. [INFERENCIA]
5. **NFRs** — performance, scalability, availability, security, auditability. Target metric + validation method. [CÓDIGO] [CONFIG] [INFERENCIA]
6. **Dependency Map** — circular dependencies, bottlenecks, critical path. [CÓDIGO] [INFERENCIA]

### CP-3 · Validation

- [ ] ≥8 use cases with main and alternate flows
- [ ] ≥6 business rules with source of truth
- [ ] Complexity-risk matrix complete
- [ ] NFRs with quantifiable metrics

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct. No academic jargon without explanation.
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: Every deliverable footer includes: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*
- **Format**: Markdown-excellence standard (TL;DR, dense prose, tables with 🟢/🟡/🔴, Mermaid diagrams, callouts, evidence tags, cross-references)
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Diagrams**: Mermaid — 1-4 per deliverable, max 20 nodes, descriptive IDs, labeled edges

## CONSTRAINTS

- Use cases from code take priority over inferred ones.
- IDs (UC-NN, BR-NN) must be stable for cross-referencing.
- >30 use cases: document top 15 by MoSCoW, list the rest in an appendix.
- Mermaid diagrams: `flowchart` + `erDiagram`.
