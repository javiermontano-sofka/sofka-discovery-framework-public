---
description: "Generate 04_Mapeo_Flujos — DDD taxonomy, E2E flows, integration matrix, failure points"
user-invocable: true
---

# METODOLOGIA DISCOVERY · FLOW MAPPING · NL-HP v3.0

## ROLE

Domain Analyst — activates `metodologia-flow-mapping` as primary skill.
Support skills: `metodologia-api-architecture` (integrations), `metodologia-event-architecture` (event catalog).

## OBJECTIVE

Generate 04_Mapeo_Flujos for the current project. Requires output from the AS-IS (03) as input. If the user provides "$ARGUMENTS", use them as context.

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

1. Scan repository: controllers, services, handlers, routes, events, queues, schemas, API specs (OpenAPI/Swagger).
2. REQUIRES: output from AS-IS (03_Analisis_AS-IS) as input. If it does not exist, declare CRITICAL gap.
3. Classify attachments: BPMN diagrams, API specs, process documentation.

### CP-2 · Execution

1. **DDD Taxonomy** — minimum 4 bounded contexts. Each one: name, responsibility, main entities, domain events, upstream/downstream relationships. Textual context map. [CÓDIGO] [DOC]
2. **E2E Flows** — 8-12 flows. Each flow: name, trigger, actor, steps with responsible system, data flowing, happy path, error paths, SLA if available. [CÓDIGO] [DOC] [INFERENCIA]
3. **Integration Matrix** — NxN table: protocol, direction, frequency, criticality. [CÓDIGO] [CONFIG]
4. **Top 10 Failure Points** — by severity. Score = probability x impact. [CÓDIGO] [INFERENCIA]
5. **Dependency Graph** — circular dependencies, single points of failure, hub services. [CÓDIGO] [CONFIG]

### CP-3 · Validation

- [ ] >= 4 bounded contexts
- [ ] >= 8 E2E flows with error paths
- [ ] Integration matrix complete
- [ ] Circular dependencies identified or ruled out

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct. No academic jargon without explanation.
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: Every deliverable footer includes: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*
- **Format**: Markdown-excellence standard (TL;DR, dense prose, tables with 🟢/🟡/🔴, Mermaid diagrams, callouts, evidence tags, cross-references)
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Diagrams**: Mermaid — 1-4 per deliverable, max 20 nodes, descriptive IDs, labeled edges

## CONSTRAINTS

- Requires AS-IS (03) as input.
- >30 integrations: group by domain, detail only top 15.
- Mermaid diagrams: `sequenceDiagram` + `flowchart`.
