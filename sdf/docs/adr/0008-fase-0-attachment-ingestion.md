# ADR-0008: FASE 0 attachment ingestion via @attachment-processor + 9 format extractors

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Clients arrive with context in files: spreadsheets of transactions, PDFs of specs, Word documents with process descriptions, source-code dumps. Asking the user to paste content inline (a) blows the context window, (b) discards file-level structure (sheet names, headings, table positions), (c) loses traceability to the original artefact.

Pre-FASE 0, agents invented content that "looked like" what the file probably said. FASE 0 makes the ingestion step explicit and traceable.

## Decision

Every `/sdf:*` command that accepts `--adjuntos` or detects attached files runs **FASE 0** as its first sub-step:

1. `@attachment-processor` detects format (extension + magic bytes) and dispatches to one of 9 extractors: `csv`, `xlsx`, `docx`, `pdf`, `pptx`, `html`, `code` (py/ts/sql/abap), `structured` (json/yaml/xml), `md`.
2. Extractor emits a normalized `priming-rag-{filename}.md` document with tables preserved, headings kept, locators captured.
3. Subsequent agents consume priming-rag docs and cite back with `[ADJUNTO:filename:locator]` — the locator is the sheet/page/line reference, so reviewers can open the source file and find the quoted bit.

FASE 0 is idempotent: re-running with the same file is a no-op; editing the file and re-running produces a new priming-rag.

## Consequences

### Positive
- Every factual claim traceable to a specific file + locator.
- Context window stays small (priming-rag docs are summaries, not dumps).
- Reviewers can audit by spot-checking `[ADJUNTO]` tags against source files.

### Negative
- Extractor maintenance: 9 extractors × ecosystem drift = non-zero. Mitigated by standalone extractor tests and treating extractor bugs as lessons (antifragile loop).
- Locator granularity varies (PDF page vs CSV row vs DOCX heading). Consumers must handle the variance.

### Neutral
- Storage: priming-rag docs live in `.discovery/` (gitignored). Lost when session ends; re-derivable by re-running FASE 0.

## Alternatives considered

- **Inline paste** — dismissed: window bloat + locator loss.
- **External vector DB** — dismissed: infra overhead; markdown files are enough at current scale.
- **Single universal extractor (Apache Tika-style)** — dismissed: per-format extractors produce better structure; Tika's output is flat text.

## References

- `references/ontology/attachment-taxonomy.md`
- `agents/attachment-processor.md`
- `scripts/extract-*.py` (9 extractors)
- ADR-0002 (introduced `[ADJUNTO]` tag)
