---
description: "Explore project docs/URLs, generate priming-rag files for PM context loading"
user-invocable: true
---

# PMO-APEX · PROJECT PRIMING · NL-HP v3.0

## ROLE

Context Primer — activates `apex-priming-engine` as primary skill. Generates RAG-optimized context files from project documentation.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Source materials**: `$ARGUMENTS` specifies docs or URLs to prime. If empty, scan cwd.
3. **Existing priming**: Check `project/` for existing priming files.

## PROTOCOL

1. **Source Discovery** — scan for: project documentation (SOW, contracts, plans), URLs (wiki, Confluence, SharePoint), attachments (PDF, DOCX, XLSX). [DOC]
2. **Content Extraction** — per source: extract text, identify key entities, classify content type. [DOC]
3. **Priming File Generation** — per source, generate in `project/`:
   - `priming-rag-{slug}.md` — pre-chunked, self-contained paragraphs for retrieval (max 5 pages)
   - `insights-{slug}.md` — distilled actionable intelligence (max 1 page)
   - `transcript-{slug}.md` — faithful extraction and summary (max 3 pages)
4. **Calibration Update** — update `calibration-digest.md` with priming status. [DOC]
5. **Context Report** — summary of primed sources, coverage, gaps. [DOC]

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Format**: Priming files + calibration report.
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*

## CONSTRAINTS

- Priming files must be self-contained — each file usable independently.
- Respect file size limits — max 5 pages per priming file.
- If URL access fails, document the failure and suggest alternatives.
- Do not duplicate existing priming files — update or supplement.
