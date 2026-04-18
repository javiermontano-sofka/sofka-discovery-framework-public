# How to render a deliverable to DOCX or PDF

**When you need this**: Client asks for a Word document or PDF rather than HTML.

**Prerequisites**: Markdown source in `.discovery/` or repo; `pandoc` installed (`brew install pandoc`).

**Time**: 1-2 min per file.

## Steps

### DOCX

```bash
pandoc input.md -o output.docx \
    --reference-doc=sdf/templates/brand-reference.docx   # if available
```

If no reference docx exists, pandoc uses its default; brand compliance is reduced.

### PDF (via HTML + headless Chrome)

Deterministic brand-compliant path: render branded HTML first, print to PDF.

```bash
bash sdf/scripts/render-brand-html.sh input.md --out /tmp/out.html --style discovery

google-chrome --headless --disable-gpu --print-to-pdf=output.pdf \
    --no-pdf-header-footer /tmp/out.html
```

Or on macOS:

```bash
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
    --headless --disable-gpu --print-to-pdf=output.pdf --no-pdf-header-footer /tmp/out.html
```

### PDF (pandoc direct, less brand-compliant)

```bash
pandoc input.md -o output.pdf --pdf-engine=xelatex
```

Quick but ignores DS v5 tokens.

## Verification

- **DOCX**: opens in Word; styled with reference doc if provided.
- **PDF**: opens; colors match brand (orange, black, gold, cream); no green.

## Common pitfalls

- Pandoc without reference docx → brand drift.
- Headless Chrome emits headers/footers by default → pass `--no-pdf-header-footer`.
- Very large docs (>100 pages) may be slow in headless Chrome; chunk if needed.

## See also

- [ADR-0010](../adr/0010-brand-html-deterministic.md)
- [`render-deliverable-to-branded-html.md`](render-deliverable-to-branded-html.md)
