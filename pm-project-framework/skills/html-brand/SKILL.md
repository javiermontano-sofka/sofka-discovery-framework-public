---
name: apex-html-brand
description: >
  Use when the user asks to "create branded HTML", "generate HTML deliverable",
  "apply APEX branding", "convert markdown to styled HTML", "produce browser-ready report",
  or mentions HTML output, branded presentation, HTML deliverable, APEX design system,
  blue authority styling. Triggers on: renders a branded HTML document, applies design tokens
  to project output, converts markdown to APEX-styled HTML, generates print-ready HTML,
  produces a self-contained HTML deliverable.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# HTML with APEX Branding

**TL;DR**: Produces HTML deliverables with APEX branding (royal blue #2563EB authority, amber #F59E0B accent, dark #0F172A background). Applies design tokens, responsive layout, and PM-focused visual identity to create professional project management outputs ready for browser rendering or PDF export.

## Principio Rector
El branding no es decoración — es identidad profesional. Los entregables HTML con branding APEX comunican autoridad y excelencia en gestión de proyectos. El sistema de diseño asegura consistencia visual sin requerir diseño manual para cada documento. NUNCA usar verde para indicadores de éxito — usar azul (healthy) y ámbar (warning).

## Assumptions & Limits
- Assumes design tokens are available in `references/ontology/canonical-tokens.md` [SUPUESTO]
- Assumes target browsers support modern CSS (flexbox, grid, custom properties) [SUPUESTO]
- Breaks if Mermaid diagrams exceed 50 nodes — rendering becomes unreadable; split into sub-diagrams [PLAN]
- Output is self-contained single-file HTML — no external CDN dependencies allowed [PLAN]
- Does not handle dynamic data binding or server-side rendering — static HTML only [PLAN]
- Print/PDF export requires browser print function; no server-side PDF generation [PLAN]

## Usage
```bash
/pm:html-brand $DELIVERABLE_PATH --type=report
/pm:html-brand $DELIVERABLE_PATH --type=dashboard --embed-mermaid
/pm:html-brand $DELIVERABLE_PATH --type=presentation --slides=12
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$DELIVERABLE_PATH` | Yes | Path to Markdown source file |
| `--type` | No | `report` / `dashboard` / `presentation` (default: `report`) |
| `--embed-mermaid` | No | Render Mermaid diagrams inline |
| `--slides` | No | Number of slides for presentation type |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types use APEX branding for HTML deliverables. Dashboard HTML uses data visualization tokens; Report HTML uses document layout tokens; Presentation HTML uses slide-style tokens.

## Before Creating HTML
1. Read `references/ontology/canonical-tokens.md` — load current design tokens [PLAN]
2. Glob `*mermaid*` in source — identify diagrams requiring rendering [PLAN]
3. Read source Markdown — verify content completeness before conversion [PLAN]
4. Check target deliverable type — select correct HTML template and layout tokens [PLAN]

## Entrada (Input Requirements)
- Content in Markdown format
- Target deliverable type (report, dashboard, presentation)
- Design tokens from `references/ontology/canonical-tokens.md`
- Mermaid diagrams to embed
- Branding guidelines

## Proceso (Protocol)
1. **Content preparation** — Parse Markdown content for HTML conversion
2. **Template selection** — Choose HTML template based on deliverable type
3. **Token application** — Apply CSS design tokens (colors, typography, spacing)
4. **Layout design** — Structure content in responsive grid layout
5. **Mermaid embedding** — Render Mermaid diagrams inline
6. **RAG styling** — Apply RAG indicator styling (Blue/Amber/Red, NEVER green)
7. **Interactive elements** — Add collapsible sections, navigation, ghost menu
8. **Responsive check** — Verify rendering on desktop, tablet, and mobile
9. **Accessibility** — Ensure color contrast and semantic HTML
10. **Export preparation** — Prepare for PDF export if needed

## Edge Cases
1. **Mermaid diagram fails to render** — Provide static SVG fallback or table-based alternative; never leave broken diagram placeholder.
2. **Content exceeds single-page layout** — Add table of contents with anchor links and section navigation; split into paginated sections for presentation type.
3. **Brand colors conflict with accessibility** — Adjust contrast ratios to meet WCAG AA (4.5:1 minimum); document any token overrides.
4. **Source Markdown contains raw HTML** — Sanitize and re-style to match APEX tokens; strip inline styles that conflict with design system.
5. **Target audience requires PDF only** — Generate print-optimized CSS with page breaks; add print-specific header/footer with project metadata.

## Example: Good vs Bad

**Good HTML Deliverable:**
| Attribute | Value |
|-----------|-------|
| Design tokens | All from canonical-tokens.md, zero hardcoded colors [PLAN] |
| Responsiveness | Renders correctly at 1440px, 1024px, 768px breakpoints |
| Accessibility | WCAG AA compliant, semantic HTML, alt text on all visuals |
| Self-contained | Single file, no external dependencies, embedded CSS |
| RAG indicators | Blue (healthy), Amber (warning), Red (critical) — no green |
| Mermaid diagrams | Rendered inline with APEX color theming |

**Bad HTML Deliverable:**
HTML file with inline styles using random colors, green for "good" status, broken Mermaid diagrams, external CDN links that fail offline, and no responsive layout. Unprofessional appearance undermines content credibility.

## Salida (Deliverables)
- HTML file with APEX branding
- Embedded CSS (no external dependencies)
- Self-contained single-file deliverable
- Print-ready styling for PDF export

## Validation Gate
- [ ] Brand colors exactly match specification — #2563EB, #F59E0B, #0F172A only
- [ ] Zero external CDN dependencies — fully self-contained file
- [ ] All content sections rendered — no missing or empty sections
- [ ] Design tokens sourced from canonical-tokens.md — no hardcoded values
- [ ] WCAG AA color contrast met on all text elements (4.5:1 ratio minimum)
- [ ] Mermaid diagrams render correctly or have fallback alternatives
- [ ] No green used anywhere for status indicators — blue/amber/red only
- [ ] Responsive layout verified at 3 breakpoints minimum
- [ ] Ghost menu present for navigation in documents with 5 or more sections
- [ ] Print CSS produces clean output without broken layouts

## Escalation Triggers
- Design tokens not available or outdated
- Mermaid diagrams failing to render
- Accessibility standards not met
- Brand colors used incorrectly

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
