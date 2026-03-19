---
name: metodologia-design-system-brand
description: >
  MetodologIA branded design system — full-fidelity output templates for HTML, DOCX, XLSX, PPTX,
  and MD formats. Produces self-contained, accessible, production-ready deliverables in any format
  using the canonical MetodologIA Neo-Swiss Design System v6 tokens, components, and page templates.
  Use when generating branded outputs, converting between formats, creating HTML deliverables,
  building DOCX/PPTX/XLSX from markdown, or establishing brand compliance for any output.
argument-hint: "<format: html|docx|xlsx|pptx|md|all> <deliverable-type>"
author: Javier Montano · Comunidad MetodologIA
model: opus
context: fork
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# MetodologIA Design System Brand — Neo-Swiss Multi-Format Output Templates

Produces production-ready deliverables in 5 formats (HTML, DOCX, XLSX, PPTX, MD) using the canonical **MetodologIA Neo-Swiss Clean & Soft Explainer** design system (v6). Every output is brand-compliant, accessible, self-contained, and ready for client delivery without manual intervention.

## TL;DR

- Estetica: **Neo-Swiss Clean & Soft Explainer** — light off-white body, navy hero+footer, gold accents, Swiss 8px grid
- Palette: Navy #122562, Gold #FFD700, Blue #137DC5, Dark #1F2833, Lavender #BBA0CC
- Typography: Poppins (titles), Trebuchet MS (body), Futura/Century Gothic (notes)
- 5 formatos de salida: HTML (self-contained), DOCX (python-docx), XLSX (openpyxl), PPTX (python-pptx), MD (markdown-excellence)
- Brand compliance automatica via `brand-config-neoswiss.json` como single source of truth
- WCAG AA accessibility en todos los formatos

## CRITICAL: Before Generating ANY Output

**ALWAYS read the brand config first:**

```
Read ${CLAUDE_SKILL_DIR}/../../references/brand-config-neoswiss.json
```

For HTML format, also read:
```
Read ${CLAUDE_SKILL_DIR}/../../references/neo-swiss-template.css
Read ${CLAUDE_SKILL_DIR}/../../references/assets/logo-metodologia.svg
```

## Principio Rector

**Un entregable sin identidad de marca es ruido visual. Un entregable con MetodologIA Neo-Swiss es una experiencia profesional que transmite autoridad, claridad y confianza.** Cada token, cada componente, cada pixel existe para comunicar que detras del documento hay metodo, no improvisacion.

## Inputs

- `$1` — Target format: `html`, `docx`, `xlsx`, `pptx`, `md`, `all`
- `$2` — Deliverable type (optional): `executive-pitch`, `technical-spec`, `roadmap`, `analysis`, `handover`, `commercial`, `findings`, `generic`

Parse from `$ARGUMENTS`. Si no se especifica formato, default `html`. Si no se especifica tipo, inferir del contenido.

## Parametros

| Parametro | Valores | Default | Efecto |
|-----------|---------|---------|--------|
| `{FORMATO}` | `html` `docx` `xlsx` `pptx` `md` `all` | `html` | Formato de salida |
| `{TIPO_PAGINA}` | `neo-swiss-executive` `neo-swiss-technical` `neo-swiss-timeline` `neo-swiss-commercial` | Auto-detect | Template base |
| `{VARIANTE}` | `ejecutiva` `tecnica` `dual` | `tecnica` | Nivel de detalle |
| `{INTERACTIVO}` | `si` `no` | `si` (HTML) | Modals, accordions, scroll animations |

## Design System v6 — Neo-Swiss Token Catalog

### Colores Core

| Token | Valor | Uso |
|-------|-------|-----|
| `--navy` | `#122562` | Hero bg, footer bg, section numbers, table headers |
| `--gold` | `#FFD700` | Accent, CTA, hero highlight, border emphasis, badges |
| `--blue` | `#137DC5` | Action primary, links, positive/success indicator |
| `--dark` | `#1F2833` | Body text on light backgrounds |
| `--lavender` | `#BBA0CC` | Decorative accent, inference chips, secondary cards |
| `--gray` | `#808080` | Muted text, footnotes, labels |
| `--white` | `#FFFFFF` | Card backgrounds, text on dark |
| `--off-white` | `#F8F9FC` | Body background, zebra table rows |
| `--light-gray` | `#E8EAF0` | Borders, dividers |

### Semantic Colors

| Token | Valor | Uso |
|-------|-------|-----|
| `--positive` | `#137DC5` | Success, health, completed — **NUNCA verde** |
| `--warning` | `#D97706` | Caution, medium risk |
| `--critical` | `#DC2626` | Error, high risk, blocker |

### Tipografia

| Familia | Uso | Carga |
|---------|-----|-------|
| **Poppins** | Titles, headings, nav, buttons, badges, section numbers | Google Fonts wght@400-800 |
| **Trebuchet MS** | Body text, paragraphs, table cells, lists | System font (no CDN needed) |
| **Futura / Century Gothic** | Notes, footnotes, TOC links, chips | System font fallback |

### Espaciado (Swiss 8px Grid)

| Token | Valor | Uso |
|-------|-------|-----|
| `--sp-1` | `8px` | Tight gaps, chip padding |
| `--sp-2` | `16px` | Card internal padding |
| `--sp-3` | `24px` | Grid gaps |
| `--sp-4` | `32px` | Section padding |
| `--sp-6` | `48px` | Major breaks |
| `--sp-8` | `64px` | Hero padding |
| `--sp-10` | `80px` | Page margins |

### Bordes

| Token | Valor | Uso |
|-------|-------|-----|
| `--radius-sm` | `8px` | Inputs, badges, buttons |
| `--radius-md` | `12px` | Cards, callouts |
| `--radius-lg` | `16px` | Sections, modals |
| `--radius-xl` | `24px` | Hero elements, feature blocks |

### Sombras (Navy-Tinted)

| Token | Valor | Uso |
|-------|-------|-----|
| `--shadow-sm` | `0 1px 3px rgba(18,37,98,.06)` | Subtle elevation |
| `--shadow-md` | `0 4px 16px rgba(18,37,98,.08)` | Cards, buttons |
| `--shadow-lg` | `0 8px 32px rgba(18,37,98,.10)` | Modals, overlays |
| `--shadow-card` | `0 2px 8px rgba(18,37,98,.05), 0 8px 24px rgba(18,37,98,.06)` | Standard card |

## Tipos de Pagina

### A — Neo-Swiss Executive (Pitch, Handover)
```
Hero (navy bg, gold border, KPIs, logo)
  → Section light (cards, callouts)
  → Section light (tables, scoring)
  → Section light (timeline, phases)
  → Section light (pricing, ROI)
  → Footer (navy bg, gold border, badges)
```

### B — Neo-Swiss Technical (Spec, AS-IS, Flows)
```
Hero compacto → Sticky TOC (gold active)
  → Sections with numbered headers
  → Data tables (navy headers), scoring matrices
  → Callouts, evidence chips
  → Footer with document ID
```

### C — Neo-Swiss Timeline (Plan, Roadmap, Scenarios)
```
Hero with KPIs → Phase grid
  → Timeline components with gold milestones
  → Gate cards with gold borders
  → Evolution steps
  → Footer
```

### D — Neo-Swiss Commercial (Guia Comercial)
```
Hero with pricing KPIs → Sticky TOC
  → Pricing tables with gold highlight rows
  → ROI cards grid
  → FAQ accordion → CTA
  → Footer
```

## Proceso

1. **Read brand-config** — Load `brand-config-neoswiss.json`
2. **Identificar tipo** — Detectar tipo de deliverable (A/B/C/D) del contenido
3. **Seleccionar formato** — HTML / DOCX / XLSX / PPTX / MD segun $1
4. **Aplicar template** — Cargar estructura base del tipo detectado
5. **Poblar tokens** — Inyectar paleta Neo-Swiss, tipografia, componentes
6. **Renderizar contenido** — Mapear contenido al template con componentes correctos
7. **Validar brand** — Verificar compliance: tokens, accesibilidad, responsive
8. **Producir archivo** — Generar archivo self-contained y production-ready

## Formato HTML — Especificacion

### Estructura Base
```html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{titulo} — MetodologIA</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
  <style>
    /* Embed full neo-swiss-template.css here */
    /* Add document-specific custom components */
  </style>
</head>
<body>
  <a href="#main" class="skip-link">Ir al contenido</a>
  <!-- Hero (navy bg, gold border, SVG logo, KPIs) -->
  <!-- Sticky TOC (gold active underline) -->
  <main class="container" id="main">
    <!-- Sections with navy numbered squares + gold text -->
  </main>
  <!-- Footer (navy bg, gold border, logo, badges) -->
  <script>/* TOC tracking */</script>
</body>
</html>
```

### Reglas Inmutables HTML
1. Self-contained: TODO inline (CSS, SVG, JS). Sin dependencias externas excepto Google Fonts
2. WCAG AA: contraste >= 4.5:1, semantic HTML, aria labels, focus-visible
3. Responsive: mobile-first, breakpoint 768px
4. Print-ready: `@media print` con page-break control
5. Hero siempre tiene navy bg + gold 6px bottom border
6. Section numbers siempre en navy 56px squares con gold text
7. Footer siempre tiene navy bg + gold 4px top border + logo

## Formato DOCX — Especificacion

### Produccion via python-docx
```python
from docx.shared import Pt, Inches, RGBColor
# Read brand-config-neoswiss.json for these values:
styles = {
    'Heading 1': {'font': 'Poppins', 'size': Pt(24), 'color': RGBColor(0x12, 0x25, 0x62), 'bold': True},
    'Heading 2': {'font': 'Poppins', 'size': Pt(18), 'color': RGBColor(0x13, 0x7D, 0xC5), 'bold': True},
    'Heading 3': {'font': 'Poppins', 'size': Pt(14), 'color': RGBColor(0x12, 0x25, 0x62), 'bold': True},
    'Normal': {'font': 'Trebuchet MS', 'size': Pt(11), 'color': RGBColor(0x1F, 0x28, 0x33)},
    'Note': {'font': 'Century Gothic', 'size': Pt(9), 'color': RGBColor(0x80, 0x80, 0x80)},
    'Table Header': {'bg': RGBColor(0x12, 0x25, 0x62), 'font_color': RGBColor(0xFF, 0xFF, 0xFF), 'font': 'Poppins', 'size': Pt(10)},
    'Table Accent': {'bg': RGBColor(0xFF, 0xD7, 0x00), 'font_color': RGBColor(0x12, 0x25, 0x62)},
    'Cover Page': {'bg': RGBColor(0x12, 0x25, 0x62), 'title_color': RGBColor(0xFF, 0xFF, 0xFF), 'accent': RGBColor(0xFF, 0xD7, 0x00)},
}
```

## Formato XLSX — Especificacion

### Branding via openpyxl
```python
from openpyxl.styles import PatternFill, Font, Border, Side
# Read brand-config-neoswiss.json for these values:
styles = {
    'header': {'fill': PatternFill(fgColor='122562'), 'font': Font(color='FFFFFF', name='Poppins', bold=True, size=11)},
    'gold_accent': {'fill': PatternFill(fgColor='FFD700'), 'font': Font(color='122562')},
    'body': {'font': Font(color='1F2833', name='Trebuchet MS', size=10)},
    'positive': {'font': Font(color='137DC5', bold=True)},
    'warning': {'font': Font(color='D97706', bold=True)},
    'critical': {'font': Font(color='DC2626', bold=True)},
    'zebra_light': {'fill': PatternFill(fgColor='F8F9FC')},
    'border': {'border': Border(bottom=Side(color='E8EAF0'))},
}
```

## Formato PPTX — Especificacion

### Slide Types
1. **Title Slide**: Navy gradient bg, titulo gold, subtitulo white, logo
2. **Section Divider**: Navy bg, section number gold (72pt Poppins), titulo white
3. **Content Slide**: White bg, navy title, dark body text
4. **Two-Column**: Comparison, before/after
5. **Full Visual**: Diagram, chart, image full-slide
6. **KPI Slide**: 3-4 metricas grandes, gold values, navy labels
7. **Closing Slide**: CTA, contacto, logo, navy bg

### Branding via python-pptx
```python
from pptx.util import Pt, Inches, Emu
from pptx.dml.color import RGBColor
# Read brand-config-neoswiss.json for these values:
slide_master = {
    'bg_dark': RGBColor(0x12, 0x25, 0x62),     # Navy
    'title_font': 'Poppins',
    'title_size': Pt(36),
    'title_color': RGBColor(0xFF, 0xFF, 0xFF),  # White
    'body_font': 'Trebuchet MS',
    'body_size': Pt(18),
    'body_color': RGBColor(0xF8, 0xF9, 0xFC),  # Off-white
    'accent': RGBColor(0xFF, 0xD7, 0x00),       # Gold
    'primary': RGBColor(0x13, 0x7D, 0xC5),      # Blue
    'content_bg': RGBColor(0xFF, 0xFF, 0xFF),    # White
    'content_title': RGBColor(0x12, 0x25, 0x62), # Navy
    'content_body': RGBColor(0x1F, 0x28, 0x33),  # Dark
}
```

## Formato MD — Especificacion

### Markdown Excellence Standard
1. Frontmatter YAML con metadata
2. TL;DR en primeros 5 bullets
3. Mermaid diagrams embebidos
4. Evidence tags: [CODIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO]
5. Cross-references entre secciones
6. Tables alineadas, codigo fenced
7. Footer con autor, version, timestamp, tagline MetodologIA

## Criterios de Calidad

- [ ] `brand-config-neoswiss.json` was read before generation
- [ ] Tokens coinciden 100% con Neo-Swiss catalog (0 hardcodes fuera de :root)
- [ ] Contraste WCAG AA >= 4.5:1 en todo texto
- [ ] Responsive funcional en mobile (< 768px) para HTML
- [ ] Self-contained: archivo unico sin dependencias rotas
- [ ] Brand compliance: Navy #122562, Gold #FFD700, Poppins, Trebuchet MS
- [ ] Zero legacy tokens: NO #6366F1, NO #22D3EE, NO #1A1A2E, NO Clash Grotesk, NO Inter
- [ ] Shadows navy-tinted: rgba(18,37,98,...) NOT rgba(0,0,0,...)
- [ ] Print-ready: @media print con page-breaks correctos (HTML)
- [ ] Cada formato preserva 100% del contenido sin perdida

## Supuestos y Limites

- Google Fonts (Poppins) requiere conexion a internet en HTML; Trebuchet MS es system font
- Mermaid diagrams en DOCX/PPTX se pre-renderizan como imagen o se describen textualmente
- XLSX no soporta narrativa — solo datos tabulares y matrices
- PPTX limite 20 slides executive, 30 technical para evitar fatiga de audiencia
- PDF se genera desde HTML via browser print o desde DOCX via LibreOffice

## Cross-References

- **metodologia-html-brand:** HTML generation specialist (uses this skill's token catalog)
- **metodologia-output-engineering:** Ghost menu pipeline, orchestration de formatos
- **metodologia-brand-docx:** DOCX production specialist
- **metodologia-brand-pptx:** PPTX production specialist
- **metodologia-brand-xlsx:** XLSX production specialist

---
**Autor:** Javier Montano · Comunidad MetodologIA | **Version:** 2.0.0 Neo-Swiss
