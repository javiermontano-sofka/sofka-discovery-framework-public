# How to feed a large PDF via FASE 0

**When you need this**: Client supplied a 200-page PDF spec; it can't fit in Claude's window.

**Prerequisites**: PDF readable (not scanned-image-only; if scanned, OCR first externally).

**Time**: 2-5 min extraction + normal pipeline time.

## Steps

1. Place the PDF in `.discovery/inbox/` (or any accessible path).

2. Invoke with attachment:

   ```
   /sdf:prime-repo --adjuntos .discovery/inbox/spec.pdf
   ```

   Or inside a pipeline command:

   ```
   /sdf:run-guided --tipo SDA --adjuntos .discovery/inbox/spec.pdf
   ```

3. `@attachment-processor` dispatches to the PDF extractor, produces `.discovery/priming-rag-spec.md`.

4. Subsequent agents cite with `[ADJUNTO:spec.pdf:page=N]`.

## Verification

- `.discovery/priming-rag-spec.md` exists and is ≤ 50 KB (pre-filtered).
- Evidence tags in downstream deliverables resolve back to specific pages.

## Common pitfalls

- Scanned-image PDFs without OCR → extractor returns empty. Run OCR externally (ABBYY, Adobe, or `ocrmypdf`) before re-ingesting.
- Extracted priming-rag truncates important content — the 50 KB ceiling applies; for very rich docs, split the PDF into sections.
- Stale priming-rag from a previous version — delete `.discovery/priming-rag-spec.md` and re-run FASE 0.

## See also

- [ADR-0008](../adr/0008-fase-0-attachment-ingestion.md)
- [`references/ontology/attachment-taxonomy.md`](../../references/ontology/attachment-taxonomy.md)
- `scripts/extract-pdf.py`
