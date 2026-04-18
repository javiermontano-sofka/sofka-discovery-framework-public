---
name: sdf-attachment-handling
description: "Use this skill whenever the user drops files (.csv .xlsx .docx .pdf .pptx .html .py .tsx .sql .json .yaml .xml .md) as context for a Sofka SAGE discovery, or passes --adjuntos to any /sdf:* command. It normalizes heterogeneous attachments into priming-rag docs with evidence tags [ADJUNTO], making them first-class inputs for the Think Tank of 7 Sages and the full pipeline G0→G3."
allowed-tools: [Read, Bash, Write, Grep, Glob]
---

# SDF Attachment Handling — FASE 0 ingestion

> Skill that turns any dropped file into committee-consumable evidence. Part of SDF v13 SAGE.

## When to trigger

- User prompt mentions a file path or says "adjunto", "archivo", "attach"
- Any `/sdf:*` command invoked with `--adjuntos a.xlsx,b.pdf`
- Files present in `./adjuntos/`, `./inputs/`, or `./.discovery/inbox/`
- Early in FASE 0 of the `sofka-discovery-conductor` orchestration

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
else → extract-generic.sh
```

## Workflow

1. **Bootstrap once**: `bash scripts/setup-attachments.sh` creates `scripts/.venv/` and installs deps from `requirements.txt`.
2. **Ingest**: `bash scripts/ingest-attachments.sh path1 path2 ...` auto-dispatches.
3. **Output**: per file, a `./.discovery/priming-rag-{stem}.md` with frontmatter (source_path, sha256, bytes, extractor, captured_at) + `## Resumen` + `## Contenido estructurado` + `## Evidencia utilizable` (ready-to-quote `[ADJUNTO:...]` tags).
4. **Consume**: `@sofka-discovery-conductor` reads priming docs; the Think Tank cites via `[ADJUNTO:filename.ext:locator]`.

## Evidence tag grammar

`[ADJUNTO:filename.ext:locator]` where locator ∈ `{sheet=NAME, page=N, row=N, slide=N, heading=TEXT, col=NAME, sig=NAME, line=N, root}`.

## Security

Extractors redact obvious secrets before writing priming docs. Binaries >5 MB trigger a warning and head-only processing.

## Quality gates

`@sofka-quality-guardian` fails the deliverable if:
- An `[ADJUNTO]` tag appears without a matching priming-rag-* doc
- Priming doc > 200 KB (chunking should have been applied)
- Extractor errors weren't escalated via `[VACIO_CRITICO]`

## Toolbox

| Script | Purpose |
|--------|---------|
| `scripts/setup-attachments.sh` | one-time venv bootstrap |
| `scripts/ingest-attachments.sh` | dispatcher, recommended entrypoint |
| `scripts/extract-*.py` | per-format extractors (same CLI) |
| `scripts/extract-generic.sh` | fallback for unknown types |

## Red flags

- Extractor ran but priming doc is empty → file is likely encrypted or image-only; escalate
- PDF with only page 1 extracted → might be scanned; flag for OCR
- XLSX con fórmulas sin valores → reopened con `data_only=True`, flag empty-sheet

---
*Skill v1.0 — port de SAP v4 a SDF v13. Depende de `@attachment-processor`.*
