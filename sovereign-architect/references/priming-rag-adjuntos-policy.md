# Attachment Policy — RAG Priming Index

> **TL;DR**: Protocol for processing attachments (PDF, XLSX, DOCX, images, URLs) — automatic classification, companion file generation, and RAG priming integration.

## Purpose

This RAG file defines how SA handles external inputs: documents uploaded by the user, URLs investigated, and artifacts generated during analysis. Every external input becomes reusable knowledge through companion files.

---

## Supported Input Types

| Type | Extensions | Processing |
|------|-----------|------------|
| **Documents** | `.pdf`, `.docx`, `.doc` | Extract text, generate insights companion |
| **Spreadsheets** | `.xlsx`, `.xls`, `.csv` | Parse structure, identify data models |
| **Images** | `.png`, `.jpg`, `.svg` | Visual analysis, diagram extraction |
| **Code archives** | `.zip`, `.tar.gz` | Extract, scan structure, generate inventory |
| **URLs** | `https://...` | Fetch, analyze, generate priming companion |
| **API specs** | `.yaml`, `.json` (OpenAPI) | Parse contract, generate API surface map |
| **Diagrams** | `.drawio`, `.mmd` | Parse architecture, extract components |

---

## Companion File Generation

Every processed attachment generates one or more companion files:

### Document Companions

| Input | Generated Companion | Location |
|-------|-------------------|----------|
| PDF/DOCX (requirements) | `insights-{name}.md` | `sa/` |
| PDF/DOCX (architecture) | `priming-rag-{name}.md` | `references/priming-rag/` |
| Transcript/meeting notes | `transcript-{name}.md` | `sa/` |
| URL investigation | `priming-rag-{domain}.md` | `references/priming-rag/` |
| Spreadsheet (data model) | `insights-{name}.md` | `sa/` |

### Naming Convention

```
insights-{descriptive-name}.md        # Session-scoped analysis
transcript-{source}-{date}.md         # Meeting/interview transcripts
priming-rag-{knowledge-domain}.md     # Reusable knowledge (persisted)
```

---

## Processing Protocol

### Step 1: Classification

When an attachment arrives, classify it:

| Category | Signals | Action |
|----------|---------|--------|
| **Requirements** | "requisitos", "funcional", "historia de usuario" | Extract requirements, generate insights |
| **Architecture** | "arquitectura", "diagrama", "C4", "componentes" | Extract patterns, generate priming-rag |
| **Data** | "modelo", "esquema", "ERD", tables | Extract data model, generate insights |
| **Infrastructure** | "infra", "deploy", "cloud", "terraform" | Extract topology, generate priming-rag |
| **Business** | "negocio", "proceso", "flujo" | Extract domain context, generate insights |
| **Transcript** | "acta", "minuta", "reunión", "entrevista" | Extract decisions and action items |

### Step 2: Extraction

- Extract structured content (headings, tables, lists, diagrams)
- Identify key entities, decisions, constraints
- Tag with evidence markers: `[DOC]` for content directly from the document

### Step 3: Companion Generation

- Generate the appropriate companion file
- Cross-reference with existing priming-rag files
- Update `calibration-digest.md` with new knowledge

### Step 4: Recalibration

After companion generation, `post-prime-calibrate.sh` runs automatically to:
- Update the session's knowledge map
- Adjust specialist activation signals
- Refresh the ghost menu with new navigation options

---

## URL Investigation Protocol

When the user provides a URL or requests web research:

1. **Fetch and analyze** the URL content
2. **Classify** the knowledge domain
3. **Generate** `priming-rag-{domain}.md` if the content is reusable
4. **Tag** all extracted information with `[DOC]` evidence marker
5. **Recalibrate** session context

### URL Types and Actions

| URL Type | Action |
|----------|--------|
| GitHub repository | Scan README, structure, tech stack |
| API documentation | Extract endpoints, models, auth patterns |
| Blog/article (technical) | Extract patterns, decisions, trade-offs |
| Cloud provider docs | Extract service capabilities, limits |
| Stack Overflow | Extract solution patterns (with caveats) |

---

## Auto-Classification Rules

Files are auto-classified based on content signals, not just extension:

| Signal | Classification | Confidence |
|--------|---------------|-----------|
| Contains "API", endpoint tables | API specification | High |
| Contains ERD or table definitions | Data model | High |
| Contains "requisito", "historia" | Requirements | High |
| Contains diagrams or architecture keywords | Architecture | Medium |
| Contains meeting attendees, dates | Transcript | Medium |
| No clear signals | Ask user for classification | Low |

When confidence is Low, SA asks the user to classify before generating companions.

---

*Sovereign Architect — Every input becomes reusable knowledge.*
*JM Labs · Javier Montano.*
