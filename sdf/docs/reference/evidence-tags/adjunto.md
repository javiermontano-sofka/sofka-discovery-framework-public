# `[ADJUNTO]`

- **Priority**: 2 / 8
- **Class (CSS)**: `t ta`

## When to use

A claim traceable to a user-supplied artefact ingested via FASE 0 ([ADR-0008](../../adr/0008-fase-0-attachment-ingestion.md)): CSV, XLSX, DOCX, PDF, PPTX, HTML, JSON/YAML/XML, source-code dump, markdown.

## Locator format

```
[ADJUNTO:<filename>:<locator>]
[ADJUNTO:transactions.xlsx:Sheet2!B14]
[ADJUNTO:arch-spec.pdf:page=22]
[ADJUNTO:process-map.docx:heading=Approval Flow]
```

Locator varies by format:
- XLSX: `SheetName!Cell` or `SheetName!Range`
- PDF: `page=N`
- DOCX: `heading=...` or `section=...`
- CSV: `row=N`
- Code: `line=N`

## Examples

- `El cliente ejecuta 47 transacciones custom mensuales [ADJUNTO:ztransactions.csv:row=1-47]`
- `El SLA actual es 99.5 % [ADJUNTO:master-agreement.pdf:page=8]`

## NOT to use for

- Summaries of the attachment without a specific locator — split into specific claims.
- Content not in the priming-rag doc — FASE 0 must have run.

## Reviewer check

Open the original attachment at the locator. Locator must resolve to the claimed content.
