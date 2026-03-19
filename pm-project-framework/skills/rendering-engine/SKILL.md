---
name: apex-rendering-engine
description: >
  Use when the user asks to "render to PNG", "convert to PDF",
  "export Mermaid diagrams", "generate printable deliverables", "create branded exports",
  or mentions rendering engine, Mermaid-to-PNG, markdown-to-PDF, format rendering,
  export engine, visual format conversion.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Rendering Engine (Mermaid-to-PNG, Markdown-to-PDF)

**TL;DR**: Converts project deliverables between formats: Mermaid diagrams to PNG/SVG images, Markdown to styled PDF with APEX branding, and HTML to print-ready PDF. Ensures visual fidelity across format conversions while maintaining brand consistency.

## Principio Rector
El formato de entrega debe ser el que el receptor puede consumir. No todos los stakeholders pueden renderizar Mermaid o leer Markdown. El rendering engine es el puente entre el formato de trabajo (Markdown + Mermaid) y el formato de distribución (PDF, PNG, HTML). La fidelidad visual en la conversión es no negociable.

## Assumptions & Limits
- Assumes source content (Markdown, Mermaid, HTML) is syntactically valid before rendering [PLAN]
- Assumes APEX brand tokens are available in `references/ontology/canonical-tokens.md` [PLAN]
- Breaks when rendering tools (mmdc, puppeteer, wkhtmltopdf) are not installed on the system
- Does not create content; only transforms existing content between formats
- Assumes target audience format preferences are known from communication plan [SUPUESTO]
- Limited to static format conversion; interactive dashboards require separate tooling

## Usage

```bash
# Render Mermaid diagram to PNG
/pm:rendering-engine $ARGUMENTS="--source diagram.mmd --target PNG --resolution 300dpi"

# Convert Markdown deliverable to branded PDF
/pm:rendering-engine --type md-to-pdf --source charter.md --branding apex

# Batch render all Mermaid files in project
/pm:rendering-engine --type batch --glob "**/*.mmd" --target SVG
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to source file |
| `--type` | No | `mermaid-to-png` (default), `md-to-pdf`, `html-to-pdf`, `batch` |
| `--target` | No | `PNG`, `SVG`, `PDF` |
| `--resolution` | No | Image resolution (default 150dpi) |
| `--branding` | No | `apex` (default), `none` |
| `--glob` | No | Pattern for batch rendering |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types need format rendering. Executive deliverables typically need PDF; dashboard elements need PNG/SVG; working documents stay in Markdown.

## Before Rendering
1. **Read** the source content to verify it renders correctly in its native format [PLAN]
2. **Read** `references/ontology/canonical-tokens.md` to load APEX brand tokens for styling [PLAN]
3. **Glob** for all files matching the source pattern if batch rendering [PLAN]
4. **Grep** for Mermaid syntax errors (unclosed brackets, invalid node refs) in source files [INFERENCIA]

## Entrada (Input Requirements)
- Source content (Markdown, Mermaid, HTML)
- Target format (PNG, SVG, PDF)
- APEX brand tokens for styling
- Page layout requirements (for PDF)
- Resolution requirements (for images)

## Proceso (Protocol)
1. **Source validation** — Verify source content renders correctly in native format
2. **Format mapping** — Determine conversion pipeline (source → intermediate → target)
3. **Style preparation** — Prepare CSS/styling for target format
4. **Rendering execution** — Execute format conversion using appropriate tools
5. **Quality verification** — Compare rendered output against source for fidelity
6. **Brand compliance** — Verify brand colors and typography in output
7. **Resolution check** — Verify image resolution meets requirements
8. **Page layout** — For PDF, verify pagination, margins, and headers/footers
9. **Accessibility** — Ensure rendered output meets accessibility standards
10. **Distribution** — Deliver rendered output per communication plan

## Edge Cases
1. **Mermaid diagram too complex for single PNG** — Split into sub-diagrams or increase canvas size. For diagrams with >50 nodes, recommend SVG format for scalability [INFERENCIA].
2. **PDF page breaks split tables or diagrams** — Apply CSS page-break-inside: avoid rules. For long tables, add repeated headers [PLAN].
3. **Rendering tool not installed** — Provide installation instructions. Fall back to HTML output which requires no external tools. Document the limitation [SUPUESTO].
4. **Brand colors render differently on screen vs print** — Use CMYK-safe color equivalents for print PDF. Verify with test print before distribution [PLAN].

## Example: Good vs Bad

**Good example — High-fidelity rendering:**

| Attribute | Value |
|-----------|-------|
| Source | Mermaid Gantt chart with 30 activities |
| Target | PNG at 300dpi + PDF with branded header |
| Brand compliance | APEX blue #2563EB and amber #F59E0B verified |
| Fidelity | All text readable, no truncation, correct encoding |
| File size | PNG 2.1MB (web-optimized), PDF 450KB |
| Accessibility | Alt text included for PNG, tagged PDF structure |

**Bad example — Broken rendering:**
PNG exported at 72dpi with text too small to read, brand colors replaced with default Mermaid theme, and Spanish characters showing as encoding artifacts. Low-resolution exports fail the professional standard test and damage credibility.

## Salida (Deliverables)
- Rendered output in target format
- Rendering quality report
- Format conversion log

## Validation Gate
- [ ] Source content validates without syntax errors before rendering [PLAN]
- [ ] Rendered output visually matches source content (no data loss) [METRIC]
- [ ] APEX brand colors (#2563EB, #F59E0B, #0F172A) present in output [PLAN]
- [ ] Image resolution ≥150dpi for screen, ≥300dpi for print [METRIC]
- [ ] All text readable at intended viewing size [PLAN]
- [ ] Spanish characters render correctly (accents, ñ, ¿, ¡) [METRIC]
- [ ] PDF pagination does not split tables or diagrams [PLAN]
- [ ] File size within distribution limits (email <10MB, web <5MB) [METRIC]
- [ ] Accessibility requirements met (alt text, tagged PDF) [PLAN]
- [ ] Output verified on ≥2 target platforms (browser, reader) [METRIC]

## Escalation Triggers
- Rendering tool unavailable
- Visual fidelity loss in conversion
- Format not supported by rendering pipeline
- Output file size exceeds distribution limits

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before starting to understand standards and frameworks | `references/body-of-knowledge.md` |
| State of the Art | When benchmarking against industry trends | `references/state-of-the-art.md` |
| Knowledge Graph | To understand skill dependencies and data flow | `references/knowledge-graph.mmd` |
| Use Case Prompts | For specific scenarios and prompt templates | `prompts/use-case-prompts.md` |
| Metaprompts | To enhance output quality and reduce bias | `prompts/metaprompts.md` |
| Sample Output | Reference for deliverable format and structure | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark
