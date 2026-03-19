---
name: export-html-ebook
author: JM Labs
description: >
  Export editorial content to self-contained HTML5 ebook with interactive navigation, collapsible sections, and responsive design. Trigger on: exportar html, ebook, html ebook, version digital, libro digital, interactive book, preview digital.
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash
---

# Exportar a HTML Ebook

> The HTML ebook makes educational content accessible on any device. Self-contained means it works offline, in any browser, without dependencies.

## Purpose

Generate a self-contained HTML5 ebook from editorial content with interactive navigation, collapsible sections, responsive design, and JM Labs branding.

## Procedure

1. Read brand-config.json for design tokens.

2. Build HTML structure:
   - DOCTYPE html5, lang="es"
   - Inline CSS only (no external stylesheets)
   - Google Fonts link for Inter/display font (only external dependency)
   - CSS variables from brand-config: --primary, --accent, --bg, --text

3. Navigation:
   - Sticky sidebar TOC with unit titles (collapsible on mobile)
   - Smooth scroll to sections
   - Progress indicator (% read)
   - Dark/light mode toggle (CSS media query + JS toggle)

4. Content sections per unit:
   - Unit header with title, ODS badge, competencies
   - Collapsible phases (Experiencia, Conceptualizacion, Reflexion, Aplicacion) — click to expand
   - Activities with visual differentiation (individual vs grupal vs cooperativa)
   - Vocabulary highlights with tooltip definitions
   - Rubric tables with responsive layout
   - Comprehensibility score badge per section (from validation report)

5. Interactive elements:
   - DZ-ref tags as clickable badges linking to destreza descriptions
   - QR codes rendered as inline SVG or image
   - "Mi emocion cuenta" sections with visual emotion indicators
   - Print-friendly mode (hides navigation, expands all sections)

6. Footer: JM Labs branding, generation date, evidence tag summary.

7. Write single .html file to exports/.

## Inputs

| Name | Source | Required |
|------|--------|----------|
| Generated units | units/ directory | Yes |
| Validation report | reports/ directory | Recommended |
| brand-config.json | references/ | Recommended |

## Outputs

| Artifact | Format | Destination |
|----------|--------|-------------|
| HTML ebook | .html | exports/ |

## Acceptance Criteria

- Single self-contained HTML file (<500KB target, <1MB max)
- Works offline (except fonts)
- Responsive (320px to 1920px)
- All units navigable
- Dark mode functional
- WCAG AA contrast compliance
- Print mode expands all sections and hides nav
- All DZ-ref tags rendered as badges

## Output Format

```markdown
# Export HTML Ebook — Report

## Archivo Generado
| Archivo | Tamano | Unidades | Estado |
|---------|--------|----------|--------|
| exports/{asig}_{grado}_ebook.html | N KB | N | OK |

## Caracteristicas
- Navegacion lateral: {functional}
- Modo oscuro: {functional}
- Secciones colapsables: {N secciones}
- Badges DZ: {N badges}
- Responsive: {tested 320px-1920px}
- Modo impresion: {functional}

## Accesibilidad
- Contraste WCAG AA: {pass/fail}
- Navegacion teclado: {functional}
- Roles ARIA: {applied}
```

## Error Handling

- No units generated: Error with pointer to `/scriba:unit`
- Content too large (>20 units): Split into multiple HTML files with index
- Brand config missing: Use JM Labs defaults (#6366F1, #22D3EE, #EFEAE4)
- Special characters: Ensure proper HTML entity encoding
- Missing validation report: Omit comprehensibility badges, warn user

## Anti-Patterns

- Don't use external CSS files — everything must be inline for self-containment
- Don't use JavaScript frameworks — vanilla JS only for minimal interactivity
- Don't generate separate files for each unit — single file unless >20 units
- Don't skip the print mode — teachers need to print sections for class
- Don't use fixed pixel sizes — all dimensions in rem/em/% for responsiveness

## References

- `references/html-ebook-patterns.md` — HTML5 ebook structure and CSS patterns
