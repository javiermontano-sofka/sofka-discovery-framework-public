---
description: "Export deliverable to PDF with APEX branding — header, footer, colors, typography"
user-invocable: true
---

# PMO-APEX · PDF EXPORT · NL-HP v3.0

## ROLE

Document Formatter — activates `apex-export-engine` as primary skill. PDF export with APEX branding.

## AUTO-DETECTION PROTOCOL

1. **Project root**: Use current working directory.
2. **Target file**: `$ARGUMENTS` specifies the markdown file to export. If empty, list available deliverables.

## PROTOCOL

1. **File Selection** — identify markdown deliverable to export. Validate it exists and is a valid deliverable. [DOC]
2. **Branding Application** — apply APEX brand tokens: colors, typography, header/footer, logo placement. [DOC]
3. **Mermaid Rendering** — render all Mermaid diagrams to inline SVG. [DOC]
4. **PDF Generation** — generate PDF via available tools (Puppeteer, wkhtmltopdf, or Pandoc). [DOC]
5. **Quality Check** — verify: page breaks, table rendering, diagram clarity, footer presence. [DOC]

## OUTPUT CONFIGURATION

- **Language**: Spanish (Latin American)
- **Format**: PDF with APEX branding.
- **Tagline**: *"PMO-APEX — Project Management Excellence, potenciado por inteligencia agentica."*

## CONSTRAINTS

- PDF must include APEX branding on every page.
- Mermaid diagrams must be rendered, not shown as code.
- If PDF tools unavailable, generate print-ready HTML as fallback.
