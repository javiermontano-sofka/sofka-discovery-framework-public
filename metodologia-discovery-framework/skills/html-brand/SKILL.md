---
name: sofka-html-brand
description: >
  This skill should be used when the user asks to "create a Sofka HTML document",
  "generate a branded report", "build an executive deliverable", "upgrade HTML to
  brand standards", "fix broken Sofka styles", "convert markdown to HTML",
  "batch convert deliverables to HTML", or mentions Sofka HTML, entregable,
  brand deliverable, Design System v5, Dark Authority, or any combination of
  Sofka + document/report/summary/analysis/roadmap. Also use when batch-upgrading
  existing HTML files to Sofka brand compliance, even if the user does not
  explicitly say "brand". Triggers on: convert to HTML, branded HTML, DS v5,
  markdown to HTML pipeline, Mermaid diagrams in HTML.
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

# Sofka HTML Brand — Document Generator

Generate beautiful, accessible, on-brand HTML deliverables following the Sofka Design System v5 ("Dark Authority" for hero/footer, high-contrast light content). Every output is a self-contained single-file HTML document with all CSS inline, no external dependencies beyond font CDNs, and full WCAG AA accessibility.

## Principio Rector

**Un entregable sin identidad de marca es ruido visual disfrazado de documento.** La generación de HTML con marca no es estética — es comunicación estratégica. Cada token de color, cada tipografía, cada componente refuerza la credibilidad y autoridad del mensaje.

### Filosofía de Brand HTML

1. **Brand = Confianza visual.** Cada elemento del Design System existe para transmitir profesionalismo y consistencia. Romper un token de marca es romper la promesa visual al cliente.

2. **Self-contained = Portabilidad garantizada.** Un archivo HTML que depende de recursos externos es un deliverable frágil. La autonomía del archivo es un requisito funcional, no una preferencia técnica.

3. **Accesibilidad = Alcance real.** WCAG AA no es compliance — es la garantía de que el 100% de los stakeholders pueden consumir el entregable sin barreras. Un documento bonito que no se puede leer tiene impacto cero.

4. **Contraste es ley.** La regla #1 aprendida en producción: NUNCA texto claro sobre fondo crema. Body usa `#FFFFFF` como background, todo texto body usa `--sofka-gray-900` (#111110). Hero y footer son negros con texto blanco. No hay gris intermedio.

5. **Markdown-first, HTML-second.** El source of truth es siempre Markdown. HTML es la capa de presentación branded. El pipeline `markdown → npx marked → bridge CSS → DS v5` garantiza fidelidad al contenido.

---

## When to Use

- Creating branded HTML deliverables for client presentations
- Converting markdown deliverables to branded HTML (pipeline mode)
- Upgrading existing HTML documents to Sofka Design System v5
- Batch processing multiple files to brand compliance
- Generating executive, technical, or transformation documents
- Building self-contained HTML reports with WCAG AA accessibility
- Rendering Mermaid diagrams with Sofka high-contrast theme
- Creating **carousel slide-decks** for client-facing executive proposals
- Creating **presentation slides** with arrow navigation for socialization sessions

## When NOT to Use

- Multi-page web applications with routing → use a framework (React, Vue)
- Interactive dashboards with live data → build a dedicated app
- Print-only documents → use PDF generation tools
- Content writing → **sofka-ux-writing** for microcopy and readability
- Dark-theme HTML for web deployment → this skill generates light-content with dark hero/footer

---

## Assumptions & Limits

- Output is single-file HTML with inline CSS; font `<link>` tags are the only external dependency
- Design System v5: orange #FF7E08 primary, Clash Grotesk display, Inter body
- Body background is `#FFFFFF` (white), NOT `#EFEAE4` (crema) — learned from production contrast issues
- Does NOT handle multi-page apps, routing, or state management
- Does NOT embed base64 images (bloat); use relative paths or CDN URLs
- Maximum 15 sections per document; beyond that, split into separate deliverables
- Mermaid diagrams use CDN (`cdn.jsdelivr.net/npm/mermaid`) — only external JS dependency

## Usage

```
/sofka-html-brand executive ./output/brief.html
/sofka-html-brand technical                       # outputs to current directory
/sofka-html-brand --batch ./legacy-docs/          # upgrade 3+ files in parallel
/sofka-html-brand --pipeline ./outputs/           # convert all .md files to branded HTML
```

Parse `$1` as document type (`executive`, `technical`, `transformation`, `--batch`, `--pipeline`) or path. Parse `$2` as output path.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para generación rutinaria, HITL para decisiones de marca y accesibilidad.
  - **desatendido**: Cero interrupciones. Supuestos documentados.
  - **supervisado**: Autónomo con reportes en milestones. Preguntas solo en decisiones de marca.
  - **paso-a-paso**: Confirma antes de cada componente y decisión de diseño.
- `{FORMATO}`: `html` (default) | `markdown` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `técnica` (full, default)

## Before Generating

Load reference materials:

```
Read ${CLAUDE_SKILL_DIR}/references/design-tokens.md
```

For batch operations, markdown pipeline, or edge cases:

```
Read ${CLAUDE_SKILL_DIR}/references/operations-guide.md
```

## Document Type Decision Tree

```
Is the primary audience C-level / board / stakeholders?
├─ YES → Is it a short, visual, self-navigable piece?
│   ├─ YES → CAROUSEL (8-10 horizontal slides, dot nav, swipe)
│   │   Goal: invite to action in 3 min
│   │   Slides: 8–10, visual-first, CTA final
│   │
│   └─ NO → EXECUTIVE
│       Goal: decision support in 15 min
│       Sections: 8–12, KPI-dense, lead with metrics
│
└─ NO → Is it for a live presentation / socialization session?
    ├─ YES → PRESENTATION SLIDES (20-25 full-screen, ← → nav)
    │   Goal: structured walkthrough in 45-60 min
    │   Slides: 20–25, speaker notes, progress bar, F for fullscreen
    │
    └─ NO → Is it about architecture, APIs, or technical decisions?
        ├─ YES → TECHNICAL DEEP-DIVE
        │   Goal: engineer/architect understanding
        │   Sections: 10–15, diagrams, ADRs, code
        │
        └─ NO → Multi-year roadmap or business transformation?
            ├─ YES → TRANSFORMATION DIGITAL
            │   Goal: rally business + tech
            │   Sections: 8–10, "why" first, timeline + ROI
            │
            └─ NO → Is it a markdown pipeline conversion?
                ├─ YES → PIPELINE MODE
                │   Goal: faithful branded rendering of existing .md
                │   Sections: auto-detected from h2 headers
                │
                └─ NO → Default to EXECUTIVE (safest for mixed audiences)
```

## Document Structure

Every Sofka HTML deliverable follows this skeleton:

```html
<!DOCTYPE html>
<html lang="es">
<head>
  <!-- charset, viewport, OG tags, fonts, Mermaid CDN, inline <style> -->
  <script>mermaid.initialize({...Sofka high-contrast theme...})</script>
</head>
<body>
  <a href="#main" class="skip-link">Ir al contenido principal</a>
  <!-- optional: internal-banner for INTERNAL docs -->
  <header class="hero">         <!-- black bg, orange bottom border -->
    <div class="hero-inner">
      <div class="hero-logo">sofka_</div>
      <div class="hero-meta-badges">...</div>
      <h1>Title <span>Highlight</span></h1>
      <p class="hero-subtitle">...</p>
      <div class="hero-kpis">...</div>  <!-- 3-4 KPIs -->
    </div>
  </header>
  <nav class="toc" aria-label="Navegación del documento">
    <div class="toc-inner">...</div>  <!-- sticky, horizontal scroll -->
  </nav>
  <main class="container" id="main">
    <!-- content: markdown-converted or hand-built sections -->
  </main>
  <footer class="site-footer">...</footer>
  <script>/* TOC tracking */</script>
</body>
</html>
```

## Two Generation Modes

### Mode 1: Hand-Built HTML (from scratch)

For new documents where you compose the HTML directly. Use numbered sections with `class="section"`, component classes from design-tokens.md, and the full component library.

### Mode 2: Markdown Pipeline (convert .md → branded HTML)

For converting existing markdown deliverables. This is the **production-proven** path used to generate 18+ deliverables at once.

**Pipeline:**
1. Parse markdown with `npx marked --gfm`
2. Apply bridge CSS (in design-tokens.md § "Markdown Bridge CSS") that maps bare HTML elements to DS v5 styles
3. Post-process: convert evidence tags `[DOC]` → `<span class="badge badge-doc">DOC</span>`
4. Post-process: convert mermaid code blocks to `<pre class="mermaid">` elements
5. Extract h2 headers for TOC generation
6. Wrap in DS v5 shell (hero, TOC, footer) with per-deliverable metadata

**Key insight:** In pipeline mode, the markdown produces bare `<h2>`, `<table>`, `<p>`, etc. The bridge CSS maps these to DS v5 styles without requiring class names. This is what makes batch conversion possible.

## Color Rules

Design System v5 uses yellow for success states because it maintains brand coherence with the warm Sofka palette — green introduces a cold tone that clashes.

| Semantic State | Color | Variable | Usage |
|---------------|-------|----------|-------|
| Positive/Success | Yellow #FFD700 | `--sofka-positive` | Health indicators, wins, checkmarks |
| Warning | Amber #D97706 | `--sofka-warning` | Caution states, medium severity |
| Critical/Error | Red #DC2626 | `--sofka-critical` | Failures, blockers, high severity |
| Info | Blue #2563EB | `--sofka-info` | Neutral informational, recommended |

Green (#42D36F), teal, violet, and pink exist only for charts and data visualization — never for semantic states.

### Contrast Rules (Production-Learned)

| Context | Background | Text Color | Ratio | Rule |
|---------|-----------|------------|-------|------|
| Body content | `#FFFFFF` | `--sofka-gray-900` (#111110) | 19.5:1 | WCAG AAA |
| Hero section | `--sofka-black` (#000) | `--sofka-white` (#FFF) | 21:1 | WCAG AAA |
| Footer | `--sofka-black` (#000) | `--sofka-white` / `--sofka-orange` | 21:1 / 4.5:1+ | WCAG AA+ |
| Cards | `--sofka-gray-50` (#FAF8F6) | `--sofka-gray-900` (#111110) | 17.5:1 | WCAG AAA |
| Table cells | `--sofka-gray-100` (#F4F0EC) | `--sofka-gray-900` (#111110) | 15.8:1 | WCAG AAA |
| Table headers | `--sofka-gray-900` (#111110) | `--sofka-white` (#FFF) | 19.5:1 | WCAG AAA |
| TOC nav | `--sofka-gray-50` (#FAF8F6) | `--sofka-gray-500` (#6B6560) | 4.6:1 | WCAG AA |
| Mermaid nodes | `#FFF3E0` (light peach) | `#000000` (black) | 18.1:1 | WCAG AAA |

**ABSOLUTE PROHIBITION:** Never white (#FFFFFF) text on crema (#EFEAE4) background. Contrast ratio is only 1.16:1 — invisible.

See `references/design-tokens.md` for the complete CSS variable system.

## Mermaid Diagram Configuration

All Mermaid diagrams use the `base` theme with Sofka high-contrast variables. This ensures:
- Light-colored node fills (`#FFF3E0`, `#FFFFFF`, `#F4F0EC`) with black text
- Orange borders on primary nodes
- Gray borders on secondary/tertiary nodes
- White edge label backgrounds
- Inter font family

The complete Mermaid config is in `references/design-tokens.md` § "Mermaid Theme Configuration".

## Evidence Badge System

Markdown evidence tags are converted to colored badges in HTML:

| Tag | CSS Class | Background | Text Color | Domain |
|-----|-----------|-----------|------------|--------|
| `[DOC]` | `.badge-doc` | `--sofka-orange` | white | Documentation source |
| `[INFERENCIA]` | `.badge-inf` | `--sofka-positive` | black | Analytical inference |
| `[SUPUESTO]` | `.badge-sup` | `--sofka-violet` | white | Assumption |
| `[DATOS]` | `.badge-dat` | `--sofka-info` | white | Data source |
| `[CONFIG]` | `.badge-cfg` | `--sofka-teal` | white | Configuration |
| `[STAKEHOLDER]` | `.badge-stk` | `--sofka-pink` | black | Stakeholder input |
| `[CÓDIGO]` / `[CODIGO]` | `.badge-cod` | `--sofka-green` | black | Code source |

## Content Density by Document Type

| Dimension | Executive | Technical | Transformation | Pipeline |
|-----------|-----------|-----------|----------------|----------|
| Sections | 8–12 | 10–15 | 8–10 | Auto (from h2) |
| Words/section | 60–100 | 150–250 | 100–180 | Preserved |
| KPIs/section | 3–4 | 1–2 | 2–3 | 4 hero only |
| Paragraphs/section | Max 2 | Up to 5 | Max 3 | Preserved |
| Visuals/section | 1 | 1 diagram | 1 | Preserved |

## Component Usage by Document Type

| Component | Executive | Technical | Transformation | Pipeline | Notes |
|-----------|-----------|-----------|----------------|----------|-------|
| Hero KPI strip | Required | Optional | Required | Required | 4 KPIs max |
| Score bars | Heavy | Light | Medium | N/A | Progress/maturity |
| Callout cards | Heavy | Medium | Heavy | Auto | Via blockquotes |
| Diagram boxes | Light | Heavy | Light | Auto | Via Mermaid |
| Data tables | Light | Medium | Light | Auto | Styled via bridge CSS |
| Timeline (.steps) | None | None | Required | N/A | 4–6 milestones |
| Modal overlays | 1–2 max | 2–3 max | 1 max | None | Avoid on mobile |
| Evidence badges | Optional | Required | Optional | Auto | Converted from [TAG] |

## Generation Workflow

### Phase 1: Plan
1. Determine document type (decision tree above) or pipeline mode
2. List sections with IDs
3. Assign components per section using the type table
4. Draft hero metadata: title, phase badge, version, subtitle, 4 KPIs

### Phase 2: Build
1. Load design-tokens.md for complete CSS
2. For pipeline mode: run markdown through `npx marked --gfm`, apply bridge CSS, post-process evidence tags and Mermaid blocks, extract TOC from h2 headers
3. For hand-built: compose sections with numbered headers and DS v5 components
4. Assemble: head (fonts, Mermaid init, CSS) → skip-link → hero → TOC → main → footer → JS

### Phase 3: Quality Gate
1. Read top to bottom: any placeholder text remaining?
2. Contrast audit: ALL text on ALL backgrounds meets WCAG AA (4.5:1 body, 3:1 large)?
3. Color audit: only brand + semantic colors? No green for success?
4. Mermaid check: all nodes have light fills with black text?
5. File size check: under 500KB?

## Anti-Patterns

| Anti-Pattern | Why It Breaks | Fix |
|-------------|--------------|-----|
| Green for success | Cold tone clashes with warm Sofka palette | Use yellow `--sofka-positive` (#FFD700) |
| White text on crema bg | 1.16:1 contrast — invisible | Use `--sofka-gray-900` on white or `--sofka-gray-50` |
| Dark text on dark Mermaid nodes | Illegible diagrams | Use `theme: 'base'` with light fills + `#000000` text |
| External stylesheets | Breaks self-contained guarantee | Inline all CSS in `<style>` block |
| Base64 inline images | Bloats file past 500KB limit | Use relative paths or CDN URLs |
| >4 hero KPIs | Visual overload, metrics lose impact | Move extras to content section |
| Sections without numbers | Breaks core brand identity pattern | Always use 01, 02... numbered headers |
| Mixed card variants | Semantic confusion on same element | One semantic state per card |
| Wrong font pairing | Hierarchy collapse | Clash Grotesk 600-700 display, Inter 400-500 body |
| Body bg `#EFEAE4` (crema) | Creates contrast trap for all content | Always `#FFFFFF` for body background |
| Mermaid `theme: 'default'` | Dark fills with dark text | Always `theme: 'base'` with explicit variables |
| `nav.toc` white background | Blends with body, no visual separation | Use `--sofka-gray-50` with `--sofka-gray-300` border |

## Constraints

| Constraint | Limit | Reason |
|-----------|-------|--------|
| File size | 500 KB max | Browser performance |
| Sections | 15 max | TOC usability |
| Table rows | 8 visible | Use modal/scroll for more |
| Title length | 65 chars max | SEO + readability |
| Hero KPIs | 4 max | Visual balance |
| Modals per doc | 3 max | Event listener overhead |
| Contrast ratio | 4.5:1 body, 3:1 large | WCAG AA |
| TOC links | 8 max | Horizontal scroll UX |
| External JS | Mermaid CDN only | Self-contained principle |

## Trade-offs

| Dimension | Option A | Option B | Decision Rule |
|-----------|----------|----------|---------------|
| Depth vs speed | Full DS v5 compliance (45 min) | Quick template fill (15 min) | Full compliance for client-facing; quick for internal |
| Single file vs components | Self-contained HTML (portable) | Modular CSS+JS (maintainable) | Always single-file for deliverables; modular only for dev |
| Brand strictness vs flexibility | Strict token-only colors | Allow complementary palette | Strict for sections; complementary only in charts |
| Hand-built vs pipeline | Custom HTML per section | Markdown → bridge CSS | Pipeline for batch (3+); hand-built for 1-2 key docs |
| Inline JS vs no JS | Interactive TOC, modals | Static HTML, zero JS | Include JS for 5+ sections; omit for short docs |
| Body bg white vs crema | White (#FFF) — maximum contrast | Crema (#EFEAE4) — warmer tone | **Always white.** Crema causes contrast failures. |

## Edge Cases

| Scenario | Response |
|----------|----------|
| RTL language (Arabic, Hebrew) | Add `dir="rtl"` to `<html>`, mirror layout |
| Bilingual document | Use `lang` per section, consistent layout |
| 15+ sections requested | Split into 2 deliverables; link with navigation footer |
| Missing design-tokens.md | Fall back to hardcoded DS v5 values; flag as degraded |
| Corrupted existing HTML | Parse salvageable content, rebuild from template |
| INTERNAL document | Add red banner: `class="internal-banner"` above hero |
| Markdown with Mermaid blocks | Convert `language-mermaid` code blocks to `pre.mermaid` |
| Evidence tags in markdown | Sed-replace `[DOC]` → `<span class="badge badge-doc">` |
| Very large tables (50+ rows) | Add `max-height: 400px; overflow-y: auto` to table wrapper |
| Print output | `@media print` hides TOC, footer, forces white bg |

## Example: Good vs Bad

**Good hero section:**
```html
<header class="hero" style="background: var(--sofka-black); border-bottom: 8px solid var(--sofka-orange);">
  <div class="hero-inner">
    <div class="hero-logo">sofka_</div>
    <h1>Core Banking <span>Modernization</span></h1>
    <div class="hero-kpis"><!-- 4 KPIs --></div>
  </div>
</header>
```

**Bad hero section:**
```html
<!-- WRONG: hardcoded colors, green for success, no brand font, 6 KPIs -->
<header style="background: #333; border: 1px solid gray;">
  <div style="font-family: Arial; color: white;">Sofka</div>
  <h1 style="color: #00ff00;">CORE BANKING MODERNIZATION</h1>
  <div><!-- 6 KPIs crammed together --></div>
</header>
```

**Good Mermaid config:**
```javascript
mermaid.initialize({
  startOnLoad: true, theme: 'base',
  themeVariables: { primaryColor: '#FFF3E0', primaryTextColor: '#000000', ... }
});
```

**Bad Mermaid config:**
```javascript
// WRONG: default theme creates dark fills with unreadable text
mermaid.initialize({ startOnLoad: true, theme: 'default' });
```

## Validation Gate

Before delivering any HTML document, verify:

- [ ] Document type matches audience (executive/technical/transformation/pipeline)
- [ ] All colors use CSS variables from Design System v5 (no hardcoded hex outside tokens)
- [ ] Typography: Clash Grotesk for display, Inter for body (no substitutions)
- [ ] Hero has 3-4 KPIs maximum with orange highlight span
- [ ] Body background is `#FFFFFF`, NOT `#EFEAE4`
- [ ] All body text uses `--sofka-gray-900` (#111110) — never white on light bg
- [ ] Cards/TOC use `--sofka-gray-50` background, not `--sofka-white`
- [ ] Table cells use `--sofka-gray-100` background with `--sofka-gray-900` text
- [ ] Mermaid uses `theme: 'base'` with light fills and `#000000` text
- [ ] Semantic states use correct colors (yellow=success, NOT green)
- [ ] WCAG AA contrast ratio met on all text (4.5:1 body, 3:1 large)
- [ ] Evidence badges converted from `[TAG]` to colored spans
- [ ] File size under 500KB
- [ ] Skip-link present: `<a href="#main" class="skip-link">`
- [ ] Single-file HTML with no external deps (except font + Mermaid CDN)
- [ ] `lang="es"` (or appropriate language) on `<html>` element
- [ ] No placeholder text remaining in output
- [ ] TOC links match h2 section IDs (max 8)
- [ ] Footer has Sofka tagline: "Construido por profesionales, potenciado por la red agéntica de Sofka."

## Batch Processing

When upgrading 3+ files at once, use parallel sub-agents. Read `references/operations-guide.md` for the squad pattern, pipeline script approach, and error handling.

## Reference Files

| File | When to Read | What It Contains |
|------|-------------|-----------------|
| `references/design-tokens.md` | Before building any document | Complete CSS system, bridge CSS, Mermaid config, evidence badges |
| `references/operations-guide.md` | For batch/pipeline, edge cases | Pipeline script, squad pattern, safe text ops, checklist |
| `assets/base-template.html` | Starting a new hand-built document | Boilerplate with all components |
| `assets/sofka-design-system.css` | Need standalone CSS file | Complete CSS extracted from DS v5 |

## Agent Prompts

| Agent | File | When to Use |
|-------|------|-------------|
| HTML Builder | `agents/html-builder.md` | Build any HTML doc type (executive, technical, carousel, slides) from scratch or markdown |
| Brand Auditor | `agents/brand-auditor.md` | Audit deliverable for full brand compliance |
| Batch Upgrader | `agents/batch-upgrader.md` | Upgrade a single file in parallel batch |
| Markdown Converter | `agents/markdown-converter.md` | Convert .md to branded HTML via pipeline |
| Content Optimizer | `agents/content-optimizer.md` | Optimize content density and evidence tags |
| Accessibility Checker | `agents/accessibility-checker.md` | WCAG AA contrast and structure audit |
| Style Migrator | `agents/style-migrator.md` | Migrate HTML from older DS versions to v5.1 |

## Cross-References

- **sofka-ux-writing:** UX writing standards for microcopy and readability
- **sofka-design-system:** Design system component library that HTML Brand implements
- **sofka-executive-pitch:** Executive-facing deliverables that use HTML Brand
- **sofka-mermaid-diagramming:** Mermaid diagram patterns (uses same high-contrast theme)

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `html` | Yes | Self-contained branded HTML (Design System v5). Always the primary output. |
| `dual` | On demand | HTML + Markdown source for version control. |

Default output is self-contained HTML. This skill always produces HTML — it is the brand rendering engine.

## Output Artifact

**Primary:** `{NN}_{Deliverable}_{Client}.html` — Brand-compliant HTML deliverable with Design System v5 tokens, WCAG AA accessibility, hero KPIs, sticky TOC, evidence badges, Mermaid diagrams.

**Secondary:** Brand audit report, contrast validation, component usage audit.

---

**Design System:** v5 "Dark Authority" | **Last Updated:** 2026-03-16

---
**Autor:** Javier Montaño | **Última actualización:** 16 de marzo de 2026
