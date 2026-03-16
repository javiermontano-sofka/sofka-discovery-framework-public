---
name: metodologia-design-system
description: >
  Configurable design system for HTML deliverables with tokens, page structure, and component library.
  Use when the user asks to "apply design system", "generate styled HTML", "set up brand tokens",
  "configure brand colors", or mentions "design system", "design tokens", "component library",
  "brand config", "page template".
argument-hint: "[action] [brand-config-path]"
author: Javier Montano · Comunidad MetodologIA
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Design System v4 (Brand-Configurable)

Foundation system for building styled HTML documents. All colors, typography, layout patterns, and component specs. **CRITICAL:** All brand tokens are configurable via `brand-config.json` — no hardcoded brand colors. Works for ANY brand.

## Principio Rector

**Un deliverable sin marca es un documento genérico. Un deliverable con marca es una experiencia profesional.** El design system convierte documentos técnicos en artefactos de marca que transmiten confianza, profesionalismo, y atención al detalle. Cada color, cada tipografía, cada espaciado tiene un propósito.

### Filosofía de Design System

1. **Tokens, no hardcode.** Todo configurable via brand-config.json. Cambiar de marca = cambiar un archivo, no reescribir CSS.
2. **Consistencia > creatividad.** Dentro de un engagement, todos los deliverables se ven como parte del mismo sistema. Sin sorpresas visuales.
3. **Responsive y accessible.** Print-ready layout, alto contraste para legibilidad, semántica HTML para screen readers.

## $ARGUMENTS

```
$ARGUMENTS format: [action] [brand-config-path]
Examples:
  "generate template with ./brand-config.json"  → load config, produce HTML template
  "apply tokens to report.html"                 → apply design tokens to existing file
  "show component library"                      → list all available components
  "validate colors in dashboard.html"           → check all colors match token reference
```

- If no brand-config.json exists → use neutral defaults (shown below)
- If action missing → show available actions: template, apply, components, validate

### Parámetros de Pipeline

| Parámetro | Valores | Default | Efecto |
|-----------|---------|---------|--------|
| `MODO` | `piloto-auto`, `desatendido`, `supervisado`, `paso-a-paso` | `piloto-auto` | Nivel de intervención humana durante generación |
| `FORMATO` | `html`, `markdown`, `dual` | `html` | Formato de salida del deliverable |
| `VARIANTE` | `ejecutiva`, `técnica` | `técnica` | Ejecutiva (~40% contenido, visual-first) vs técnica (full token docs + snippets) |

- `MODO=desatendido` → genera sin pausas, valida al final
- `FORMATO=dual` → produce .html + .md con tokens documentados
- `VARIANTE=ejecutiva` → solo component quick reference + brand config, sin CSS raw

## Output Format Protocol

| FORMATO | Estructura | Uso Principal |
|---------|-----------|---------------|
| `html` | HTML completo con tokens inyectados en :root, componentes renderizados | Deliverables finales, presentaciones a cliente |
| `markdown` | Token tables en MD, snippets en code blocks, sin HTML renderizado | Documentación interna, wikis, READMEs |
| `dual` | Ambos archivos generados en paralelo | Cuando el consumidor necesita ambos formatos |

- HTML siempre incluye Google Fonts link, print stylesheet, y skip-to-content
- Markdown incluye front-matter YAML con metadata del brand-config

## Brand Configuration Schema

All brand identity lives in `brand-config.json`. No brand values hardcoded in skill or templates.

```json
{
  "brand": {
    "name": "Acme Corp",
    "logo_text": "acme_",
    "primary": "#3B82F6",
    "primary_light": "#60A5FA",
    "primary_dark": "#2563EB",
    "primary_dim": "rgba(59,130,246,0.10)",
    "black": "#000000",
    "white": "#FFFFFF",
    "background": "#F5F5F5",
    "muted": "#9CA3AF"
  },
  "fonts": {
    "display": "'Inter', system-ui, sans-serif",
    "body": "'Inter', system-ui, sans-serif",
    "google_fonts_url": "https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
  }
}
```

### Neutral Defaults (when no brand-config.json provided)

| Token | Default Value | Usage |
|-------|--------------|-------|
| `--brand-primary` | #3B82F6 (blue) | Accents, borders, active states |
| `--brand-primary-light` | #60A5FA | Hover states |
| `--brand-primary-dark` | #2563EB | Pressed states, dark mode |
| `--brand-primary-dim` | rgba(59,130,246,0.10) | Light backgrounds |
| `--brand-black` | #000000 | Text, headings, hero bg |
| `--brand-white` | #FFFFFF | Text on dark, card backgrounds |
| `--brand-background` | #F5F5F5 | Body background |
| `--brand-muted` | #9CA3AF | Secondary text |

### Mapping Rule

In ALL templates and components, reference `var(--brand-primary)` never a hex literal. The CSS custom properties are set from brand-config.json at generation time:

```css
:root {
  --brand-primary: var(--from-config, #3B82F6);
  --brand-primary-light: var(--from-config, #60A5FA);
  --brand-primary-dark: var(--from-config, #2563EB);
  --brand-primary-dim: var(--from-config, rgba(59,130,246,0.10));
  --brand-black: var(--from-config, #000000);
  --brand-white: var(--from-config, #FFFFFF);
  --brand-background: var(--from-config, #F5F5F5);
  --brand-muted: var(--from-config, #9CA3AF);
}
```

## Semantic Colors (Brand-Independent)

These are universal and do NOT change per brand:

| Token | Value | Usage |
|-------|-------|-------|
| `--semantic-positive` | #22D3EE | Success state (yellow, not green — v4 rule) |
| `--semantic-positive-dim` | rgba(255,215,0,0.12) | Positive background tint |
| `--semantic-positive-border` | rgba(255,215,0,0.45) | Positive border |
| `--semantic-positive-text` | #06B6D4 | Text on positive backgrounds |
| `--semantic-warning` | #D97706 | Warning state |
| `--semantic-warning-dim` | rgba(217,119,6,0.08) | Warning background |
| `--semantic-critical` | #DC2626 | Error/critical state |
| `--semantic-critical-dim` | rgba(220,38,38,0.07) | Critical background |
| `--semantic-info` | #2563EB | Information state |
| `--semantic-info-dim` | rgba(37,99,235,0.07) | Info background |

### Decorative Colors (Charts/Data Visualization Only)

| Token | Value |
|-------|-------|
| `--chart-green` | #42D36F |
| `--chart-teal` | #06C8C8 |
| `--chart-violet` | #9747FF |
| `--chart-pink` | #FE9CAB |
| `--chart-yellow` | #22D3EE |

## Typography

| Element | Font | Size | Weight | Line Height |
|---------|------|------|--------|-------------|
| h1 | var(--font-display) | clamp(2.5rem, 5vw, 4.2rem) | 700 | 1.1 |
| h2 | var(--font-display) | 2.2rem | 700 | 1.2 |
| h3 | var(--font-display) | 1.8rem | 700 | 1.2 |
| h4 | var(--font-display) | 1.4rem | 600 | 1.3 |
| Body | var(--font-body) | 1rem | 400 | 1.6 |
| Small | var(--font-body) | 0.875rem | 400 | 1.5 |
| Mono | Menlo, Monaco, monospace | 0.85rem | 400 | 1.4 |

## Spacing & Radius

| Token | Value | Usage |
|-------|-------|-------|
| `--radius-sm` | 6px | Small buttons |
| `--radius-md` | 12px | Callouts, medium elements |
| `--radius-lg` | 16px | Cards, panels |
| `--radius-xl` | 24px | Large containers |
| `--shadow-sm` | 0 1px 2px rgba(0,0,0,0.05) | Subtle elevation |
| `--shadow-md` | 0 4px 12px rgba(0,0,0,0.08) | Medium elevation |
| `--shadow-lg` | 0 12px 40px rgba(0,0,0,0.12) | Modals |
| `--shadow-card` | 0 1px 3px rgba(0,0,0,0.04), 0 6px 16px rgba(0,0,0,0.06) | Cards |

## Page Structure

### Layout Grid
- Max-width: 1100px, margin: 0 auto, padding: 0 2rem (1rem on mobile)
- Body background: var(--brand-background)

### Standard Sections

1. **Hero Header** — bg: var(--brand-black), border-bottom: 8px solid var(--brand-primary), radial gradient glow. Contains: logo, meta badges, h1 with brand-primary highlight, subtitle.

2. **Sticky Nav** — bg: var(--brand-white), sticky top:0 z-100, border-bottom 1px solid gray-200. Links: uppercase 0.72rem, active = brand-primary border-bottom.

3. **Main Container** — max-width 1100px, margin 0 auto, padding 0 2rem.

4. **Sections** — scroll-margin-top 60px, padding 6rem 0. Section header: 60x60px black box with brand-primary number + title.

5. **Footer** — bg: var(--brand-black), border-top: 8px solid var(--brand-primary), white text. Two-row: (logo + badges) above (confidentiality + doc ref).

## Component Quick Reference

| Component | Class | Notes |
|-----------|-------|-------|
| Card Base | `.card` | White, padded, rounded |
| Card Accent | `.card-accent` | Brand-primary top border |
| Card Critical | `.card-critical` | Red left border + red tint |
| Card Warning | `.card-warning` | Amber left border + amber tint |
| Card Success | `.card-success` | Yellow (v4) left border + yellow tint |
| Card Info | `.card-info` | Blue left border + blue tint |
| Card Dark | `.card-dark` | Black bg, white text |
| Card Grid | `.card-grid-2/3/4` | Multi-column layout |
| Badge | `.badge` | Brand-primary bg, white text |
| Badge Outline | `.badge-outline` | Brand-primary border, transparent bg |
| Severity Critical | `.sev-critical` | Red bg, white text |
| Severity High | `.sev-high` | #EA580C bg, white text |
| Severity Medium | `.sev-medium` | Amber bg, BLACK text (WCAG) |
| Severity Low | `.sev-low` | Yellow bg, black text (v4) |
| Callout Info | `.callout-info` | Blue bg + blue border |
| Callout Warning | `.callout-warning` | Amber bg + amber border |
| Callout Success | `.callout-success` | Yellow bg + yellow border |
| Callout Critical | `.callout-critical` | Red bg + red border |
| Table Wrapper | `.table-wrap` | Overflow container |
| Diagram Box | `.diagram-box` | Dark monospace block |
| Progress Bar | `.progress-bar` | Horizontal indicator |
| Timeline | `.timeline` | Vertical with markers |
| Score Ring | `.score-ring` | Circular visualization |

For full component HTML snippets, read: `${CLAUDE_SKILL_DIR}/references/component-snippets.md`

## Generation Workflow

1. **Load Config** — Read brand-config.json (or use neutral defaults)
2. **Plan** — Define sections, required components, color usage, TOC structure
3. **Generate HTML** — Apply base template with brand tokens injected into :root
4. **Build Hero** — Logo from config, meta badges, h1 with brand-primary span, subtitle
5. **Build Nav** — Auto-generate from section IDs
6. **Build Sections** — Section headers with brand-primary numbers, content with semantic components
7. **Validate** — All colors match tokens (no hex literals outside :root). Severity low = yellow. Hero/footer borders = brand-primary. TOC is horizontal sticky. Semantic HTML used. WCAG AA contrast met.
8. **Export** — Save .html, test responsive, verify font loading, check keyboard nav

## Color Usage Rules

- **Brand colors** (primary, black, white, background): from brand-config.json via CSS custom properties
- **Semantic states** (positive=yellow, warning=amber, critical=red, info=blue): universal, never change per brand
- **Decorative** (green, teal, violet, pink, yellow): charts and data visualization ONLY
- **NEVER** use hex literals in component HTML — always reference var(--token-name)

## Responsive Breakpoints

- Mobile: < 768px (1rem padding)
- Tablet: 768-1024px (1.5rem padding)
- Desktop: > 1024px (2rem padding)

## Accessibility

- Skip link: href="#main"
- Focus-visible: outline 2px solid var(--brand-primary)
- Contrast: WCAG AA (4.5:1 body text, 3:1 large text)
- Semantic HTML: header, nav, main, section, footer
- Alt text required on all images
- Severity medium: BLACK text on yellow bg (WCAG AA compliance)

## Trade-off Matrix

| Dimension | Opción A | Opción B | Regla de Decisión |
|-----------|----------|----------|-------------------|
| Tokens vs Inline | CSS custom properties (tokens) | Inline styles | Siempre tokens. Inline solo para overrides puntuales en email templates |
| System fonts vs Web fonts | Rápido, sin dependencia CDN | Marca consistente, carga adicional | Web fonts para deliverables cliente; system fonts para uso interno |
| Full component lib vs Minimal | 25+ componentes, flexible | 8-10 core, rápido de aprender | Full para engagement largo; minimal para one-shot deliverables |
| Print-first vs Screen-first | Optimizado para PDF/impresión | Optimizado para pantalla interactiva | Screen-first por defecto; print-first si deliverable es para board/comité |

## Assumptions & Limits

- Requires brand-config.json for branded output; without it, uses neutral blue defaults
- Font loading depends on Google Fonts CDN availability; fallback to system fonts
- Component library covers 90% of deliverable needs; custom components follow same token system
- Responsive design targets 3 breakpoints; complex dashboards may need additional breakpoints
- WCAG AA compliance assumed; AAA requires additional contrast verification
- Mermaid diagrams render client-side via CDN; offline environments need pre-rendered SVGs
- Design system assumes single-brand per engagement; multi-brand requires separate config files

## Casos Borde

| Caso | Estrategia de Manejo |
|---|---|
| Brand primary extremadamente claro (#FFE0B2) que no pasa WCAG AA como texto | Auto-darken para texto usando HSL shift (-30% lightness). Usar brand-dark para borders y accents visibles. Validar contraste con herramienta automatizada antes de entregar. |
| Documento bilingue (es + en) con diferentes longitudes de texto | Usar `lang` attribute por seccion. Layout flexible con min-width en cards. Testear que texto largo no rompe grid en ambos idiomas. |
| Brand config con un solo color (sin secondary, sin light/dark variants) | Derivar primary-light (HSL +15% lightness) y primary-dark (HSL -15% lightness) programaticamente. Documentar colores derivados en el output para validacion del cliente. |
| Entorno offline sin acceso a Google Fonts CDN | Fallback a system-ui, -apple-system, sans-serif. Documentar degradacion visual. Ofrecer alternativa con fonts embebidas en base64 si tamano < 500KB. |

## Decisiones y Trade-offs

| Decision | Alternativa Descartada | Justificacion |
|---|---|---|
| CSS custom properties (tokens) sobre inline styles | Inline styles para cada elemento | Tokens permiten cambio de marca con un solo archivo. Inline requiere reescribir todo el documento. Mantenibilidad > velocidad de generacion. |
| Single-file HTML con CSS inline sobre CSS externo | CSS en archivo separado | Self-contained HTML garantiza portabilidad. El deliverable se abre en cualquier browser sin dependencias. Peso adicional (~20KB CSS) es aceptable vs. riesgo de archivo faltante. |
| Yellow para success states sobre green convencional | Green (#22C55E) para estados positivos | Green introduce tono frio que choca con paleta calida MetodologIA (indigo/dark). Yellow mantiene coherencia de marca. Diferenciador visual vs. competidores. |

## Knowledge Graph

```mermaid
graph TD
    subgraph Core
        DS[design-system]
    end
    subgraph Inputs
        BC[brand-config.json] --> DS
        CT[Content & Section Plan] --> DS
        DT[Document Type Decision] --> DS
    end
    subgraph Outputs
        DS --> HTML[Styled HTML Deliverable]
        DS --> TOK[Token Documentation]
        DS --> COMP[Component Library Reference]
    end
    subgraph Related Skills
        DS -.-> HB[html-brand]
        DS -.-> BV[brand-voice]
        DS -.-> ME[markdown-excellence]
        DS -.-> UW[ux-writing]
    end
```

## Output Templates

**Formato MD (default):**
```
# Design System: {brand_name}
## Token Reference
  - Brand colors (primary, light, dark, dim)
  - Semantic colors (positive, warning, critical, info)
  - Typography scale
  - Spacing & radius
## Component Quick Reference
  - Cards, badges, callouts, tables
  - Usage guidelines per component
## Validation Checklist
```

**Formato HTML (primary):**
- Filename: `D-01_Design_System_{project}_{WIP}.html`
- Documento HTML self-contained con tokens inyectados en `:root`, branded (Design System MetodologIA v5). Incluye componentes renderizados con ejemplos interactivos, paleta de tokens visual y checklist de validación WCAG. Print stylesheet incluido, skip-to-content y WCAG AA compliance.

**Formato DOCX (circulación formal):**
- Filename: `{fase}_{entregable}_{cliente}_{WIP}.docx`
- Generado via python-docx con MetodologIA Design System v5. Portada con metadata del engagement, TOC automático, encabezados/pies de página con marca. Tablas con zebra striping, tipografía Poppins en headings (navy), Montserrat en cuerpo, acentos dorados. Para circulación formal y auditoría.

**Formato XLSX (bajo demanda):**
- Filename: `{fase}_{entregable}_{cliente}_{WIP}.xlsx`
- Via openpyxl con MetodologIA Design System v5. Headers con fondo navy y tipografía Poppins en blanco, conditional formatting por token type y estado de validación WCAG, auto-filters en todas las columnas, valores directos sin fórmulas.

**Formato PPTX (bajo demanda):**
- Filename: `{fase}_{entregable}_{cliente}_{WIP}.pptx`
- Via python-pptx con MetodologIA Design System v5. Navy gradient slide master, Poppins titles, Montserrat body, gold accents. Máx 20 slides ejecutivo / 30 técnico. Speaker notes con referencias de evidencia.

## Evaluacion

| Dimension | Peso | Criterio | Umbral Minimo |
|---|---|---|---|
| Trigger Accuracy | 10% | El skill se activa correctamente ante menciones de design system, tokens, brand config, styled HTML | 7/10 |
| Completeness | 25% | Todos los tokens documentados, componentes con snippets, responsive y accessibility cubiertos | 7/10 |
| Clarity | 20% | Mapping rules sin ambiguedad, cada token con uso definido, anti-patterns documentados | 7/10 |
| Robustness | 20% | Edge cases de color, RTL, print, dark mode cubiertos con fallbacks funcionales | 7/10 |
| Efficiency | 10% | Output generado sin tokens duplicados, CSS optimizado, single-file bajo 500KB | 7/10 |
| Value Density | 15% | Cada componente entrega snippet listo para copiar, no solo descripcion teorica | 7/10 |

**Umbral minimo global:** 7/10. Deliverables por debajo requieren re-work antes de entrega.

## Edge Cases

| Scenario | Adaptation |
|----------|-----------|
| No brand-config.json | Use neutral defaults (blue primary, gray background) |
| Brand primary is very light (e.g., #FFE0B2) | Auto-darken for text; use brand-dark for borders |
| Brand primary is very dark (e.g., #1A1A2E) | Use brand-light for hover states; ensure contrast on dark hero |
| Print/PDF output | Remove sticky nav, reduce shadows, use high-contrast borders |
| Dark mode requested | Invert background tokens; keep semantic colors unchanged |
| RTL language brand | Mirror layout, flip border-left to border-right on accent cards |
| Brand with no secondary color | Derive primary-light and primary-dark programmatically from primary |
| Multiple brand configs in one project | Namespace tokens per brand; generate separate CSS bundles |

## Validation Gate

Before delivering design system output:
- [ ] All brand colors sourced from brand-config.json (no hardcoded hex in components)
- [ ] Semantic colors applied correctly (positive=yellow, not green)
- [ ] Hero and footer use brand-primary for 8px borders
- [ ] All text meets WCAG AA contrast ratios
- [ ] Responsive at all 3 breakpoints
- [ ] No hex literals in component HTML (only var() references)
- [ ] Font fallbacks specified for display and body
- [ ] MODO/FORMATO/VARIANTE params respected in output
- [ ] Print stylesheet present when FORMATO=html
- [ ] Mermaid diagrams render correctly if included

## Cross-References

- `brand-html` — applies this design system to generate full HTML deliverables
- `brand-voice` — brand tone and messaging (complements visual system)
- `markdown-excellence` — writing standard for markdown output format

## Output Artifact

**Primary:** `D-01_Design_System_{project}.md` (o `.html` si `{FORMATO}=html|dual`) — Design tokens, component library, usage guidelines, accessibility standards.

**Diagramas incluidos:**
- Component hierarchy diagram
- Token inheritance flowchart
- Responsive breakpoint matrix

---
**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026
