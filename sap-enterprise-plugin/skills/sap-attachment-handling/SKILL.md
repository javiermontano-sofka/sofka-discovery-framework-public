---
name: sap-attachment-handling
description: "Use this skill whenever the user drops files (.csv .xlsx .docx .pdf .pptx .html .py .tsx .sql .json .yaml .xml .md) as context for SAP work, or passes --adjuntos to any /sap:* command. It normalizes heterogeneous attachments into priming-rag docs with evidence tags [ADJUNTO], making them first-class inputs for the ToT committee."
allowed-tools: [Read, Bash, Write, Grep, Glob]
author: Javier Montaño
contributors: "Jean Ruiz Granda (ad-hoc feedback & review), Catherine Rodrigo"
copyright: "© 2026 Sofka Technologies. All Rights Reserved."
co-authored-with: Claude Code
---

# SAP Attachment Handling — FASE 0 ingestion

> Skill that turns any dropped file into committee-consumable evidence.

## When to trigger

- User prompt mentions a file path or says "adjunto", "archivo", "attach"
- Any `/sap:*` command invoked with `--adjuntos a.xlsx,b.pdf`
- Files present in `./adjuntos/`, `./inputs/`, or `./.discovery/inbox/`

## Decision tree

```
ext in {.csv} → extract-csv.py
ext in {.xlsx,.xlsm,.xls} → extract-xlsx.py
ext in {.docx,.doc} → extract-docx.py
ext in {.pdf} → extract-pdf.py
ext in {.pptx,.ppt} → extract-pptx.py
ext in {.html,.htm} → extract-html.py
ext in {.py,.ts,.tsx,.js,.sql,.abap} → extract-code.py
ext in {.json,.yaml,.yml,.xml} → extract-structured.py
ext in {.md,.txt,.log} → passthrough
else → extract-generic.sh (file/strings/hexdump)
```

## Workflow

1. **Bootstrap once**: `bash scripts/setup-attachments.sh` creates `scripts/.venv/` and installs deps from `requirements.txt`.
2. **Ingest**: `bash scripts/ingest-attachments.sh path1 path2 ...` auto-dispatches to the right extractor.
3. **Output**: for each file, a `./.discovery/priming-rag-{stem}.md` with:
   - Frontmatter (source_path, sha256, bytes, extractor, captured_at)
   - `## Resumen` (3-5 bullets)
   - `## Contenido estructurado` (extracted data)
   - `## Evidencia utilizable` (ready-to-quote `[ADJUNTO:...]` tags)
4. **Consume**: `@sap-orchestrator` reads the priming docs; committee quotes via `[ADJUNTO:filename.ext:locator]`.

## Evidence tag grammar

`[ADJUNTO:filename.ext:locator]` where locator ∈ `{sheet=NAME, page=N, row=N, slide=N, heading=TEXT, col=NAME, sig=NAME, line=N, root}`.

## Security

Extractors redact obvious secrets (api keys, bearer tokens, sk-* strings) before writing priming docs. Binaries >5 MB trigger a warning and head-only processing.

## Quality gates

- `@qa-validator` fails the deliverable if:
  - An `[ADJUNTO]` tag appears without a matching priming-rag-* doc
  - The priming doc is larger than 200 KB (chunking should have been applied)
  - Extractor errors weren't escalated via `[VACIO_CRITICO]`

## Toolbox

| Script | Purpose |
|--------|---------|
| `scripts/setup-attachments.sh` | one-time venv bootstrap |
| `scripts/ingest-attachments.sh` | dispatcher, recommended entrypoint |
| `scripts/extract-*.py` | per-format extractors (same CLI) |
| `scripts/extract-generic.sh` | fallback for unknown types |

## Red flags

- Extractor ran but priming doc is empty → the file is likely encrypted or image-only; escalate.
- PDF with only page 1 extracted → might be scanned; flag for OCR.
- XLSX with formulas only (no values) → reopen with `data_only=True` already, flag as empty-sheet.

---
*Skill v1.0 — dependencia de `@attachment-processor`. Plugin v4.0.*
