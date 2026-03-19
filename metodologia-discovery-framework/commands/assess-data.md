---
description: "Generate Data_Landscape — data ecosystem assessment: model, pipelines, governance, quality, analytics, mesh readiness"
user-invocable: true
---

# METODOLOGIA DISCOVERY · DATA LANDSCAPE · NL-HP v3.0

## ROLE

Data Architect in deep-dive mode — activates `metodologia-data-governance` + `metodologia-data-engineering` + `metodologia-database-architecture` as primary skills.
Supporting skills: `metodologia-data-mesh-strategy` (ownership), `metodologia-analytics-engineering` (dbt, metrics), `metodologia-bi-architecture` (semantic layer).

### Expert Committee

- **Triad**: metodologia-discovery-conductor, metodologia-risk-controller, metodologia-delivery-manager
- **Experts**: metodologia-data-architect (lead), metodologia-data-engineer, metodologia-analytics-architect, metodologia-ai-architect, metodologia-quality-engineer
- **Total**: 8 (7 voting)

## OBJECTIVE

Generate Data_Landscape — comprehensive assessment of the data ecosystem: model, pipelines, governance, quality, analytics, mesh readiness.

**Primary audience:** CDOs, data leads, data and architecture teams.
**Primary format:** Markdown (source) -> HTML suggested via ghost menu.

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

1. Scan repository: schemas, migrations, ORM models, queries, ETL/ELT scripts, dbt models, API data contracts, data catalogs.
2. Classify attachments: ERDs, data dictionaries, data flow diagrams, data SLAs.
3. Declare findings and gaps.

### CP-2 · Execution

1. **Data Inventory** — databases, types (relational, NoSQL, time-series, graph), volume, growth, technologies, versions. [CÓDIGO] [CONFIG]
2. **Data Model** — main entities, relationships, normalization, anti-patterns. ER diagram. [CÓDIGO]
3. **Data Pipelines** — existing ETL/ELT: sources -> transformations -> destinations, frequency, latency, technologies. [CÓDIGO] [CONFIG]
4. **Data Quality** — dimensions: completeness, consistency, accuracy, freshness, uniqueness. Findings with evidence. [CÓDIGO] [INFERENCIA]
5. **Data Governance** — catalog, lineage, ownership, access policies, compliance (GDPR, HIPAA if applicable), sensitive data. [CONFIG] [DOC]
6. **Analytics & BI** — dashboards, key metrics, semantic layer, self-service readiness. [CONFIG] [DOC]
7. **Data Mesh Readiness** — score 1-5 across 4 pillars: domain ownership, data-as-product, self-serve platform, federated governance. [INFERENCIA]
8. **Recommendations** — top 10 actions prioritized by impact/effort. [INFERENCIA]

-> Cross-ref: if 03_AS-IS § Data exists, use as input.

### CP-3 · Validation

- [ ] Complete database inventory with technologies and volumes
- [ ] Data quality evaluated across at least 3 dimensions
- [ ] Governance assessment with identified gaps
- [ ] Data mesh readiness scored across 4 pillars
- [ ] Recommendations prioritized with evidence
- [ ] ZERO prices — magnitudes and FTE-months only

### CP-F · Ghost Menu

After markdown validation, offer ghost menu:
```
📄 Deliverable ready: Data_Landscape.md
   Convert to: [HTML] [DOCX] [PPTX] [PDF]
   Recommended: HTML (technical navigation)
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
- If the project has no analytics/BI: omit section 6, document as N/A.
- Data mesh readiness only if the system has 3+ differentiated data domains.
- Sensitive data (PII, PHI, financial) is identified but NEVER exposed in the deliverable.
- Insufficient data: declare gaps and use [INFERENCIA] with disclaimer.
- Mermaid diagrams: `erDiagram`, `flowchart`, `pie`.
