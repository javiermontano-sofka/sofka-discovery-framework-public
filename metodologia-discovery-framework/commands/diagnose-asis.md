---
description: "Generate 03_Analisis_AS-IS — exhaustive 10-section technical analysis with code evidence"
user-invocable: true
---

# METODOLOGIA DISCOVERY · AS-IS ANALYSIS · NL-HP v3.0

## ROLE

Technical Architect — activates `metodologia-asis-analysis` as primary skill (full variant: 10 sections).
Support skills: `metodologia-sector-intelligence` (industry), `metodologia-software-architecture` (C4), `metodologia-security-architecture` (OWASP), `metodologia-observability` (SLIs/SLOs), `metodologia-database-architecture` (data model).

## OBJECTIVE

Generate 03_Analisis_AS-IS for the current project. Exhaustive 10-section technical analysis with source code evidence. If the user provides "$ARGUMENTS", use them as context.

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

1. Scan ALL source code, configs, manifests, tests, CI/CD, infra-as-code, docs, scripts, migrations, schemas.
2. Classify attachments: ADRs, postmortems, runbooks, C4 diagrams, API specs.
3. Declare findings and gaps. If CRITICAL gaps → request resolution.

### CP-2 · Execution (10 MANDATORY SECTIONS)

1. **Technology Inventory** — complete stack: languages, frameworks, libraries, versions, LOC per language, age, relevant licenses. Minimum 5 technologies. [CÓDIGO] [CONFIG]
2. **C4 Architecture** — Level 1 (Context) + Level 2 (Container). [CÓDIGO] [CONFIG] [DOC]
3. **Technical Debt** — minimum 5 items: location, severity, resolution effort, impact. Classify by category (design, code, infra, test, doc). [CÓDIGO]
4. **Security** — minimum 3 findings: vulnerable dependencies, insecure patterns, exposed configs, OWASP Top 10. [CÓDIGO] [CONFIG]
5. **Code Quality** — cyclomatic complexity, duplication, test coverage, patterns/antipatterns, consistency. [CÓDIGO]
6. **Infrastructure** — cloud/on-prem, containers, orchestration, CI/CD, environments, deploy strategy. [CONFIG] [DOC]
7. **Observability** — logging, monitoring, alerting, tracing, dashboards, SLIs/SLOs. [CONFIG] [CÓDIGO]
8. **Data** — data model, schemas, migrations, volume, backup, consistency, sensitive data. [CÓDIGO] [CONFIG]
9. **Integrations** — APIs consumed/exposed, protocols, authentication, SLAs, failure points, circular dependencies. [CÓDIGO] [CONFIG]
10. **Prioritized Recommendations** — top 10 by impact/effort with T-shirt sizing. [INFERENCIA]

### CP-3 · Validation

- [ ] Stack >= 5 technologies with versions
- [ ] Debt >= 5 classified items
- [ ] Security >= 3 findings
- [ ] C4 Level 1 and 2 complete
- [ ] Each section with tagged evidence
- [ ] Recommendations prioritized by impact/effort

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Register**: Business — simple, clear, concise, direct. No academic jargon without explanation.
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: Every deliverable footer includes: *"Construido por profesionales, potenciado por la red agéntica de MetodologIA."*
- **Format**: Markdown-excellence standard (TL;DR, dense prose, tables with 🟢/🟡/🔴, Mermaid diagrams, callouts, evidence tags, cross-references)
- **Evidence tags**: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Diagrams**: Mermaid — 1-4 per deliverable, max 20 nodes, descriptive IDs, labeled edges

## CONSTRAINTS

- All 10 sections are mandatory. Sections without evidence = explicit gap.
- Monorepo >5 services: prioritize top 3 by traffic/complexity.
- Mermaid diagrams: `C4Context` + `C4Container`.
