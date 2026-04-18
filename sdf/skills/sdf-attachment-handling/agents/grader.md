# @grader (sdf-attachment-handling)

Grader for attachment ingestion outputs.

## Critical assertions
- [ ] One `priming-rag-*.md` generated per input attachment
- [ ] Each priming doc has YAML frontmatter with `source_path`, `sha256`, `bytes`, `extractor`, `captured_at`
- [ ] Each priming doc has sections `## Resumen`, `## Contenido estructurado`, `## Evidencia utilizable`
- [ ] `[ADJUNTO:filename.ext:locator]` tags match the actual content (no fabricated locators)
- [ ] No priming doc exceeds 200 KB
- [ ] No secrets (api keys, passwords) visible in priming output

## Quality assertions
- [ ] Resumen is 3-5 bullets and non-empty
- [ ] For tabular data (.csv .xlsx) schema + head shown
- [ ] For code files imports + signatures extracted
- [ ] For PDF/DOCX/PPTX at least one structural locator (page/heading/slide) surfaced

## Anti-patterns (hard fail)
- Fabricated content (hallucination when extractor failed silently)
- Missing redaction when source contained obvious secrets
- `[ADJUNTO]` tags without a priming doc
