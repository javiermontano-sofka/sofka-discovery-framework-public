---
name: auto-prime
author: JM Labs
description: >
  Auto-generate RAG priming files from client documents (PDFs, HTMLs, Word files). Reads each document, extracts key knowledge, and creates structured priming files with evidence tags. Trigger on: priming, auto-prime, procesar documentos, generar RAG, extract knowledge, documentos del cliente.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Auto-Priming desde Documentos del Cliente

> Every unprocessed document is untapped knowledge. Auto-priming transforms raw documents into structured, queryable knowledge that agents can use.

## Purpose

Read all unprocessed documents in the working directory, extract structured knowledge, and generate RAG priming files that agents can reference during content generation.

## Procedure

1. List all unprocessed documents (compare against calibration-digest.md to skip already-processed files).

2. For each document, determine type and extraction strategy:
   - **PDF textbook**: Extract unit structure, section patterns, activity types, vocabulary level, assessment formats
   - **PDF curriculum**: Extract destrezas, indicators, competencies, grade mapping
   - **PDF inserts**: Extract cross-cutting themes, integration patterns, frequency rules
   - **HTML deliverable**: Extract architecture decisions, agent specs, process flows, metrics
   - **Image (taxonomy)**: Describe levels, verbs, structure visually observed
   - **Word/text draft**: Extract content, identify sections, note style patterns

3. For each document, generate a RAG priming file:
   ```markdown
   ---
   source: {filename}
   type: {curriculum|textbook|deliverable|insert|taxonomy|draft}
   domain: {curriculo|editorial|pedagogia|neurociencia|proceso}
   processed_date: {ISO timestamp}
   confidence: {alta|media|baja}
   ---
   ## TL;DR
   {3-5 bullet summary}

   ## Key Entities
   {Names, systems, processes extracted}

   ## Constraints and Requirements
   {Explicit constraints found}

   ## Evidence
   {Key quotes or data points with [METODOLOGIA] tags}
   ```

4. Save priming files to `references/priming-rag/rag-{domain}-{source-slug}.md`

5. Update calibration-digest.md with new priming files and recalculated level.

6. Report: "N documentos procesados. N priming files generados. Nivel: {NUEVO}."

## Inputs

| Name | Source | Required |
|------|--------|----------|
| Unprocessed documents | Working directory | Yes |
| calibration-digest.md | Previous calibration | No |

## Outputs

| Artifact | Format | Destination |
|----------|--------|-------------|
| RAG priming files | Markdown | references/priming-rag/ |
| Updated calibration-digest.md | Markdown | Working directory |

## Acceptance Criteria

- Every readable document processed (PDFs via Read tool, limited to first 20 pages for large files)
- Each priming file has TL;DR, entities, constraints, evidence with tags
- Calibration level updated
- Zero content fabrication — only extract what's in the document

## Output Format

```markdown
# Auto-Prime Report — {TIMESTAMP}

## Documentos Procesados: {N}

| Archivo | Tipo | Dominio | Confianza | Priming File |
|---------|------|---------|-----------|--------------|
| {filename} | curriculum | curriculo | alta | rag-curriculo-{slug}.md |

## Nivel Actualizado: {COLD|WARM|HOT|DEEP}

## Nuevos Priming Files
- references/priming-rag/rag-{domain}-{slug}.md

## Archivos Omitidos
- {filename}: {razon}
```

## Error Handling

- PDF too large to read: Process first 20 pages, note "PARTIAL" in priming file
- Unreadable format: Skip, log in calibration-digest as "SKIPPED: {reason}"
- Duplicate source: Update existing priming file instead of creating new one
- Binary files (images): Describe visually if image tool available, otherwise skip with note

## Anti-Patterns

- Don't invent content not in the source document — use [SUPUESTO] for any inference
- Don't generate priming files for documents already processed (check digest first)
- Don't try to read binary files (images are described visually, not OCR'd)
- Don't generate a single monolithic priming file — one file per source document
- Don't skip the TL;DR section — it's the most-referenced part by downstream agents

## References

- `references/priming-extraction-patterns.md` — Extraction strategies per document type
