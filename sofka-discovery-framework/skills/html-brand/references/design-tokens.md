# Sofka Design System v5 — Complete Token Reference

## Table of Contents

1. [CSS Custom Properties](#css-custom-properties) — :root block with all tokens
2. [Typography Scale](#typography-scale) — Font sizes, weights, contrast ratios
3. [Font Loading & Fallback](#font-loading) — Import URLs, system font fallbacks
4. [Color Usage Rules](#color-usage-rules) — Semantic states, decorative colors
5. [Contrast Rules (Production-Learned)](#contrast-rules) — WCAG compliance matrix
6. [Component CSS Classes](#component-css-classes) — All DS v5 components
7. [Markdown Bridge CSS](#markdown-bridge-css) — Pipeline mode: bare HTML → DS v5
8. [Evidence Badge CSS](#evidence-badge-css) — Tag-to-badge conversion
9. [Mermaid Theme Configuration](#mermaid-theme-configuration) — High-contrast diagrams
10. [Responsive Breakpoints](#responsive-breakpoints) — Mobile at 768px
11. [Accessibility](#accessibility) — Reduced motion, print, focus states
12. [JavaScript Patterns](#javascript-patterns) — TOC tracking, modals
13. [Z-Index Hierarchy](#z-index-hierarchy)
14. [Implementation Checklist](#implementation-checklist)

---

## CSS Custom Properties

Copy this `:root` block verbatim into every Sofka HTML document.

```css
:root {
  /* BRAND CORE */
  --sofka-orange: #FF7E08;
  --sofka-orange-light: #FF9E42;
  --sofka-orange-dark: #CC6506;
  --sofka-orange-dim: rgba(255,126,8,.10);
  --sofka-black: #000000;
  --sofka-white: #FFFFFF;
  --sofka-light: #EFEAE4;
  --sofka-dark: #B8A894;

  /* SEMANTIC: POSITIVE (v5: YELLOW, NOT GREEN) */
  --sofka-positive: #FFD700;
  --sofka-positive-dim: rgba(255,215,0,.12);
  --sofka-positive-border: rgba(255,215,0,.45);
  --sofka-positive-text: #B8860B;

  /* SEMANTIC: WARNING */
  --sofka-warning: #D97706;
  --sofka-warning-dim: rgba(217,119,6,.08);
  --sofka-warning-border: rgba(217,119,6,.3);

  /* SEMANTIC: CRITICAL */
  --sofka-critical: #DC2626;
  --sofka-critical-dim: rgba(220,38,38,.07);
  --sofka-critical-border: rgba(220,38,38,.25);

  /* SEMANTIC: INFO */
  --sofka-info: #2563EB;
  --sofka-info-dim: rgba(37,99,235,.07);
  --sofka-info-border: rgba(37,99,235,.25);

  /* DECORATIVE (charts/data-viz ONLY — never for semantic states) */
  --sofka-green: #42D36F;
  --sofka-teal: #06C8C8;
  --sofka-violet: #9747FF;
  --sofka-pink: #FE9CAB;
  --sofka-yellow: #FFD700;

  /* BACKGROUND TINTS */
  --sofka-red-bg: rgba(220,38,38,0.06);
  --sofka-amber-bg: rgba(217,119,6,0.06);
  --sofka-green-bg: rgba(66,211,111,0.08);
  --sofka-blue-bg: rgba(37,99,235,0.06);
  --sofka-violet-bg: rgba(151,71,255,0.06);
  --sofka-teal-bg: rgba(6,200,200,0.06);
  --sofka-pink-bg: rgba(254,156,171,0.06);

  /* TYPOGRAPHY */
  --font-display: 'Clash Grotesk', 'Inter', sans-serif;
  --font-body: 'Inter', system-ui, sans-serif;

  /* GRAYS */
  --sofka-gray-50: #FAF8F6;
  --sofka-gray-100: #F4F0EC;
  --sofka-gray-200: #E4DED7;
  --sofka-gray-300: #D1C9BE;
  --sofka-gray-500: #6B6560;
  --sofka-gray-700: #333130;
  --sofka-gray-900: #111110;

  /* SPACING & RADIUS */
  --radius-sm: 6px;
  --radius-md: 12px;
  --radius-lg: 16px;
  --radius-xl: 24px;

  /* SHADOWS */
  --shadow-sm: 0 1px 2px rgba(0,0,0,.05);
  --shadow-md: 0 4px 12px rgba(0,0,0,.08);
  --shadow-lg: 0 12px 40px rgba(0,0,0,0.12);
  --shadow-card: 0 1px 3px rgba(0,0,0,0.04), 0 6px 16px rgba(0,0,0,0.06);

  /* ANIMATIONS */
  --transition-fast: 0.15s ease;
  --transition-normal: 0.2s ease;
  --transition-slow: 0.3s ease;

  /* Z-INDEX HIERARCHY */
  --z-skip-link: 999;
  --z-sticky-nav: 100;
  --z-modal: 1000;
}
```

## Typography Scale & Color Assignments

| Element | Font | Size | Weight | Line Height | Color | Contrast Ratio |
|---------|------|------|--------|-------------|-------|---|
| h1 | Clash Grotesk | clamp(2.5rem, 5vw, 4.2rem) | 700 | 1.1 | var(--sofka-white) on black | AAA |
| h2 | Clash Grotesk | 2.2rem | 700 | 1.2 | var(--sofka-black) on white | AAA |
| h3 | Clash Grotesk | 1.8rem | 700 | 1.2 | var(--sofka-orange-dark) on white | AA+ |
| h4 | Clash Grotesk | 1.4rem | 600 | 1.3 | var(--sofka-gray-900) on white | AAA |
| Body | Inter | 1rem (16px) | 400 | 1.65 | var(--sofka-gray-900) on white | AAA |
| Small | Inter | 0.875rem | 400 | 1.5 | var(--sofka-gray-500) on white | AA |
| Badge | Inter | 0.7-0.75rem | 600 | — | Varies by type | AA+ |
| TOC link | Inter | 0.72rem | 600 | — | var(--sofka-gray-500) on gray-50 | AA |

## Font Loading & Fallback Strategy

```html
<!-- In <head> — these are the ONLY external dependencies allowed -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link href="https://api.fontshare.com/v2/css?f[]=clash-grotesk@400,500,600,700&display=swap" rel="stylesheet">
```

Fallback stacks — if CDN fails, system fonts take over:
```css
--font-display: 'Clash Grotesk', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
--font-body: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', system-ui, sans-serif;
```

## Color Usage Rules

### Semantic States (for status, outcome, health indicators)
| State | Primary | Dim Bg | Border | Text on Dim | WCAG |
|-------|---------|--------|--------|-------------|------|
| Positive | #FFD700 (yellow) | rgba(255,215,0,.12) | rgba(255,215,0,.45) | #B8860B | AA |
| Warning | #D97706 (amber) | rgba(217,119,6,.08) | rgba(217,119,6,.3) | inherit | AA |
| Critical | #DC2626 (red) | rgba(220,38,38,.07) | rgba(220,38,38,.25) | inherit | AA |
| Info | #2563EB (blue) | rgba(37,99,235,.07) | rgba(37,99,235,.25) | inherit | AA |

### Decorative Colors (ONLY for charts, graphs, data visualization)
- Green: #42D36F — Teal: #06C8C8 — Violet: #9747FF — Pink: #FE9CAB

## Contrast Rules (Production-Learned) {#contrast-rules}

These rules were established after three rounds of production feedback fixing contrast issues. They are **non-negotiable**.

### Global Override Block

This CSS block MUST be present to override any DS v5 base defaults that create contrast issues:

```css
/* ═══ GLOBAL CONTRAST FIX: eliminate white-on-crema everywhere ═══ */
body { background: #FFFFFF !important; color: var(--sofka-gray-900); }
nav.toc { background: var(--sofka-gray-50) !important; border-bottom: 2px solid var(--sofka-gray-300) !important; }
.card { background: var(--sofka-gray-50) !important; border: 1px solid var(--sofka-gray-300); }
.modal-content { background: var(--sofka-gray-50) !important; }
.callout { background: var(--sofka-gray-50); }
```

### Contrast Matrix

| Element | Background | Text | Ratio | Pass |
|---------|-----------|------|-------|------|
| Body | `#FFFFFF` | `#111110` | 19.5:1 | AAA |
| Hero | `#000000` | `#FFFFFF` | 21:1 | AAA |
| Hero highlight | `#000000` | `#FF7E08` | 4.6:1 | AA |
| Footer | `#000000` | `#FFFFFF` / `#FF7E08` | 21:1 / 4.6:1 | AA+ |
| Cards | `#FAF8F6` | `#111110` | 17.5:1 | AAA |
| Table headers | `#111110` | `#FFFFFF` | 19.5:1 | AAA |
| Table cells | `#F4F0EC` | `#111110` | 15.8:1 | AAA |
| TOC links | `#FAF8F6` | `#6B6560` | 4.6:1 | AA |
| TOC active | `#FAF8F6` | `#FF7E08` | 3.4:1 | AA (large) |
| Mermaid nodes | `#FFF3E0` | `#000000` | 18.1:1 | AAA |
| Code inline | `#E4DED7` | `#111110` | 12.8:1 | AAA |
| Blockquotes | `rgba(255,126,8,.08)` | `#111110` | ~18:1 | AAA |

**PROHIBITION:** `#FFFFFF` text on `#EFEAE4` bg = 1.16:1 ratio. INVISIBLE. Never use.

## Component CSS Classes

### Skip Link (Accessibility)
```css
.skip-link { position: absolute; top: -100px; left: 0; background: var(--sofka-orange); color: #fff; padding: .5rem 1rem; z-index: var(--z-skip-link); border-radius: var(--radius-sm); }
.skip-link:focus { top: 0; }
```

### Hero Header
```css
.hero { background: var(--sofka-black); position: relative; overflow: hidden; padding: 4rem 2rem; border-bottom: 8px solid var(--sofka-orange); }
.hero::before { content: ''; position: absolute; top: 0; right: -20%; width: 60%; height: 100%; background: radial-gradient(ellipse at 100% 50%, rgba(255,126,8,0.15) 0%, transparent 70%); pointer-events: none; }
.hero-inner { position: relative; z-index: 2; max-width: 1100px; margin: 0 auto; color: var(--sofka-white); }
.hero-logo { font-family: var(--font-display); font-size: 1.8rem; font-weight: 700; color: var(--sofka-orange); margin-bottom: 1.5rem; letter-spacing: -1px; }
.hero-meta-badges { display: flex; gap: .75rem; flex-wrap: wrap; margin-bottom: 1.5rem; }
.hero-meta-badge { background: rgba(255,255,255,.08); border: 1px solid rgba(255,255,255,.15); color: rgba(255,255,255,.85); padding: .35rem .9rem; border-radius: var(--radius-sm); font-size: .75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 1px; }
.hero h1 { color: var(--sofka-white); margin-bottom: 1rem; }
.hero h1 span { color: var(--sofka-orange); }
.hero-subtitle { font-size: 1.15rem; color: rgba(255,255,255,.85); margin-bottom: 1.5rem; line-height: 1.7; max-width: 750px; }
.hero-kpis { display: grid; grid-template-columns: repeat(4, 1fr); gap: 1.5rem; margin-top: 2rem; }
.hero-kpi { text-align: center; }
.hero-kpi-value { font-family: var(--font-display); font-size: 2.8rem; font-weight: 700; line-height: 1; }
.hero-kpi-value.orange { color: var(--sofka-orange); }
.hero-kpi-value.blue { color: #93C5FD; }
.hero-kpi-value.red { color: #FCA5A5; }
.hero-kpi-label { font-size: .78rem; color: rgba(255,255,255,.6); margin-top: .4rem; font-weight: 500; letter-spacing: .5px; }
```

### Sticky TOC Navigation
```css
nav.toc { background: var(--sofka-gray-50); position: sticky; top: 0; z-index: var(--z-sticky-nav); border-bottom: 2px solid var(--sofka-gray-300); box-shadow: var(--shadow-sm); }
nav.toc .toc-inner { max-width: 1100px; margin: 0 auto; display: flex; overflow-x: auto; scrollbar-width: none; -ms-overflow-style: none; padding: 0 2rem; }
nav.toc .toc-inner::-webkit-scrollbar { display: none; }
nav.toc a { display: block; padding: 1rem 1.25rem; font-size: .72rem; font-weight: 600; text-transform: uppercase; letter-spacing: 1.5px; color: var(--sofka-gray-500); white-space: nowrap; text-decoration: none; border-bottom: 3px solid transparent; transition: all var(--transition-normal); }
nav.toc a:hover, nav.toc a.active { color: var(--sofka-orange); border-bottom-color: var(--sofka-orange); }
```

### Sections
```css
section.section { scroll-margin-top: 60px; padding: 4rem 0; }
.section-header { display: flex; gap: 1.5rem; align-items: flex-start; margin-bottom: 2.5rem; }
.section-number { width: 60px; height: 60px; min-width: 60px; background: var(--sofka-black); color: var(--sofka-orange); font-family: var(--font-display); font-size: 1.5rem; font-weight: 700; display: flex; align-items: center; justify-content: center; border-radius: var(--radius-sm); }
.section-header h2 { margin: 0; }
.section-header .section-subtitle { font-size: .95rem; color: var(--sofka-gray-500); margin-top: .25rem; }
```

### Cards
```css
.card { background: var(--sofka-gray-50); border-radius: var(--radius-lg); padding: 2rem; box-shadow: var(--shadow-card); margin-bottom: 1.5rem; border: 1px solid var(--sofka-gray-300); }
.card-accent { border-top: 4px solid var(--sofka-orange); }
.card-info { border-left: 4px solid var(--sofka-info); background: linear-gradient(135deg, var(--sofka-info-dim), transparent); }
.card-critical { border-left: 4px solid var(--sofka-critical); background: linear-gradient(135deg, var(--sofka-critical-dim), transparent); }
.card-warning { border-left: 4px solid var(--sofka-warning); background: linear-gradient(135deg, var(--sofka-warning-dim), transparent); }
.card-highlight { border: 2px solid var(--sofka-orange); background: linear-gradient(135deg, var(--sofka-orange-dim), transparent); }
.card-dark { background: var(--sofka-black); color: var(--sofka-white); }
.card-dark p, .card-dark li { color: rgba(255,255,255,.85); }
.card-grid-2 { display: grid; grid-template-columns: repeat(2, 1fr); gap: 1.5rem; }
.card-grid-3 { display: grid; grid-template-columns: repeat(3, 1fr); gap: 1.5rem; }
.card-grid-4 { display: grid; grid-template-columns: repeat(4, 1fr); gap: 1.5rem; }
```

### Scenario Cards, Callouts, Tables, Badges, etc.

*(All remaining component classes are identical to DS v5 base — see `assets/sofka-design-system.css` for the complete 1,739-line reference. The classes below are the most commonly used.)*

### Callouts
```css
.callout { padding: 1.5rem; border-radius: var(--radius-md); margin: 1.5rem 0; border-left: 4px solid; background: var(--sofka-gray-50); }
.callout-info { background: var(--sofka-info-dim); border-color: var(--sofka-info); }
.callout-warning { background: var(--sofka-warning-dim); border-color: var(--sofka-warning); }
.callout-critical { background: var(--sofka-critical-dim); border-color: var(--sofka-critical); }
.callout-success { background: var(--sofka-positive-dim); border-color: var(--sofka-positive); }
.callout-orange { background: var(--sofka-orange-dim); border-color: var(--sofka-orange); }
.callout strong { display: block; margin-bottom: .5rem; }
```

### Tables
```css
.table-wrap { overflow-x: auto; margin: 1.5rem 0; border-radius: var(--radius-md); box-shadow: var(--shadow-card); }
.table-wrap table { width: 100%; border-collapse: collapse; font-size: .9rem; }
.table-wrap th { background: var(--sofka-gray-900); color: var(--sofka-white); padding: 1rem 1.25rem; text-align: left; font-weight: 600; font-size: .8rem; text-transform: uppercase; letter-spacing: .5px; }
.table-wrap td { padding: .875rem 1.25rem; border-bottom: 1px solid var(--sofka-gray-200); background: var(--sofka-gray-100); color: var(--sofka-gray-900); }
.table-wrap tr:last-child td { border-bottom: none; }
.table-wrap tr:hover td { background: var(--sofka-gray-200); }
```

### Badges
```css
.badge { display: inline-block; padding: .25rem .75rem; border-radius: var(--radius-sm); font-size: .7rem; font-weight: 600; text-transform: uppercase; letter-spacing: .5px; }
.badge-orange { background: var(--sofka-orange); color: var(--sofka-white); }
.badge-outline { background: transparent; border: 1.5px solid var(--sofka-orange); color: var(--sofka-orange); }
.badge-blue { background: rgba(37,99,235,.12); color: var(--sofka-info); }
.badge-red { background: rgba(220,38,38,.12); color: var(--sofka-critical); }
.badge-teal { background: rgba(6,200,200,.12); color: var(--sofka-teal); }
.sev-critical { background: var(--sofka-critical); color: white; }
.sev-high { background: #EA580C; color: white; }
.sev-medium { background: var(--sofka-warning); color: black; }
.sev-low { background: var(--sofka-positive); color: black; }
```

### Footer
```css
footer.site-footer { background: var(--sofka-black); border-top: 8px solid var(--sofka-orange); color: var(--sofka-white); padding: 3.5rem 2rem 2.5rem; }
footer.site-footer .footer-inner { max-width: 1100px; margin: 0 auto; }
.footer-row { display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 1rem; }
.footer-logo { font-family: var(--font-display); font-size: 1.3rem; font-weight: 700; color: var(--sofka-orange); }
.footer-badges { display: flex; gap: .75rem; flex-wrap: wrap; }
.footer-badge { background: rgba(255,126,8,.15); color: var(--sofka-orange); padding: .35rem .9rem; border-radius: var(--radius-sm); font-size: .75rem; font-weight: 600; }
.footer-bottom { margin-top: 2rem; padding-top: 1.5rem; border-top: 1px solid rgba(255,255,255,.1); display: flex; justify-content: space-between; flex-wrap: wrap; gap: .5rem; font-size: .78rem; color: rgba(255,255,255,.5); }
```

### Focus States (Accessibility)
```css
:focus-visible { outline: 2px solid var(--sofka-orange); outline-offset: 2px; }
a:focus-visible, button:focus-visible { outline: 2px solid var(--sofka-orange); outline-offset: 2px; }
```

---

## Markdown Bridge CSS {#markdown-bridge-css}

**Purpose:** When converting markdown to HTML via `npx marked --gfm`, the output contains bare HTML elements (`<h2>`, `<table>`, `<p>`, etc.) without DS v5 classes. This bridge CSS maps those bare elements to DS v5 styles when nested inside `main.container`.

**This is what makes batch markdown→HTML conversion possible without class annotations.**

```css
/* ═══ MARKDOWN BRIDGE: npx marked output → DS v5 ═══ */
/* CONTRAST: All text uses near-black (#111110) on white (#FFF) for WCAG AAA */

main.container p { color: var(--sofka-gray-900); }
main.container h2 {
  margin-top: 3rem; padding-top: 2rem;
  border-top: 2px solid var(--sofka-gray-300);
  color: var(--sofka-black);
}
main.container h2:first-child { margin-top: 0; border-top: none; padding-top: 0; }
main.container h3 { font-size: 1.4rem; color: var(--sofka-orange-dark); margin-top: 2rem; }
main.container h4 { font-size: 1.1rem; margin-top: 1.5rem; color: var(--sofka-gray-900); }

main.container table {
  width: 100%; border-collapse: collapse; font-size: .9rem;
  margin: 1.5rem 0; border-radius: var(--radius-md);
  overflow: hidden; box-shadow: var(--shadow-md);
  border: 1px solid var(--sofka-gray-300);
}
main.container th {
  background: var(--sofka-gray-900); color: var(--sofka-white);
  padding: 1rem 1.25rem; text-align: left;
  font-weight: 600; font-size: .8rem;
  text-transform: uppercase; letter-spacing: .5px;
}
main.container td {
  padding: .875rem 1.25rem;
  border-bottom: 1px solid var(--sofka-gray-200);
  background: var(--sofka-gray-100);
  color: var(--sofka-gray-900);
}
main.container tr:last-child td { border-bottom: none; }
main.container tr:hover td { background: var(--sofka-gray-200); }

main.container blockquote {
  padding: 1.5rem; border-radius: var(--radius-md);
  margin: 1.5rem 0;
  border-left: 4px solid var(--sofka-orange);
  background: rgba(255,126,8,.08);
  border: 1px solid rgba(255,126,8,.2);
  border-left: 4px solid var(--sofka-orange);
}
main.container blockquote p { color: var(--sofka-gray-900); margin: 0.25rem 0; }
main.container blockquote strong { color: var(--sofka-orange-dark); }

main.container pre {
  background: #0D0D15; color: #E2E8F0;
  border: 1px solid rgba(255,126,8,.25);
  border-radius: var(--radius-lg); padding: 1.5rem;
  margin: 1.5rem 0; overflow-x: auto;
  font-family: 'Menlo','Monaco',monospace;
  font-size: .82rem; line-height: 1.6;
}
main.container code {
  background: var(--sofka-gray-200); color: var(--sofka-gray-900);
  padding: .15rem .4rem; border-radius: 4px;
  font-size: .88em; font-family: 'Menlo','Monaco',monospace;
  border: 1px solid var(--sofka-gray-300);
}
main.container pre code {
  background: none; color: inherit; padding: 0;
  font-size: inherit; border: none;
}

main.container hr { border: none; border-top: 2px solid var(--sofka-gray-300); margin: 3rem 0; }
main.container ul, main.container ol { padding-left: 1.5rem; margin: 1rem 0; }
main.container li { margin-bottom: .5rem; color: var(--sofka-gray-900); line-height: 1.7; }
main.container a { color: var(--sofka-orange-dark); font-weight: 600; }
main.container a:hover { text-decoration: underline; color: var(--sofka-orange); }
main.container img { max-width: 100%; border-radius: var(--radius-md); }
main.container strong { color: var(--sofka-black); font-weight: 700; }
main.container td:first-child { white-space: nowrap; }
```

---

## Evidence Badge CSS {#evidence-badge-css}

Used in pipeline mode to convert markdown evidence tags to colored badges.

### CSS Classes
```css
.badge-doc { background: var(--sofka-orange); color: var(--sofka-white); }
.badge-inf { background: var(--sofka-positive); color: var(--sofka-black); }
.badge-sup { background: var(--sofka-violet); color: var(--sofka-white); }
.badge-dat { background: var(--sofka-info); color: var(--sofka-white); }
.badge-cfg { background: var(--sofka-teal); color: var(--sofka-white); }
.badge-stk { background: var(--sofka-pink); color: var(--sofka-black); }
.badge-cod { background: var(--sofka-green); color: var(--sofka-black); }
```

### Sed Conversion Rules (for pipeline scripts)
```bash
sed \
  -e 's/\[DOC\]/<span class="badge badge-doc">DOC<\/span>/g' \
  -e 's/\[INFERENCIA\]/<span class="badge badge-inf">INFERENCIA<\/span>/g' \
  -e 's/\[SUPUESTO\]/<span class="badge badge-sup">SUPUESTO<\/span>/g' \
  -e 's/\[DATOS\]/<span class="badge badge-dat">DATOS<\/span>/g' \
  -e 's/\[CONFIG\]/<span class="badge badge-cfg">CONFIG<\/span>/g' \
  -e 's/\[STAKEHOLDER\]/<span class="badge badge-stk">STAKEHOLDER<\/span>/g' \
  -e 's/\[CODIGO\]/<span class="badge badge-cod">CÓDIGO<\/span>/g' \
  -e 's/\[CÓDIGO\]/<span class="badge badge-cod">CÓDIGO<\/span>/g'
```

---

## Mermaid Theme Configuration {#mermaid-theme-configuration}

All Mermaid diagrams MUST use `theme: 'base'` with explicit high-contrast variables. The default theme creates dark fills with dark text, making diagrams illegible.

### JavaScript Initialization (place in `<head>` after Mermaid CDN)

```javascript
mermaid.initialize({
    startOnLoad: true,
    theme: 'base',
    themeVariables: {
        primaryColor: '#FFF3E0',
        primaryTextColor: '#000000',
        primaryBorderColor: '#FF7E08',
        lineColor: '#333130',
        secondaryColor: '#FFFFFF',
        secondaryTextColor: '#000000',
        secondaryBorderColor: '#D1C9BE',
        tertiaryColor: '#F4F0EC',
        tertiaryTextColor: '#000000',
        tertiaryBorderColor: '#B8A894',
        noteBkgColor: '#FFF8E1',
        noteTextColor: '#000000',
        noteBorderColor: '#FF7E08',
        edgeLabelBackground: '#FFFFFF',
        clusterBkg: '#F4F0EC',
        clusterBorder: '#FF7E08',
        titleColor: '#000000',
        nodeTextColor: '#000000',
        fontFamily: 'Inter, system-ui, sans-serif',
        fontSize: '14px'
    }
});
```

### Mermaid Container CSS
```css
pre.mermaid {
  background: var(--sofka-gray-50);
  border: 2px solid var(--sofka-gray-300);
  border-radius: var(--radius-lg);
  padding: 2rem;
  text-align: center;
  color: var(--sofka-gray-900);
  box-shadow: var(--shadow-md);
}
```

### Mermaid Code Block Conversion (for pipeline scripts)
```bash
# Convert marked output: <pre><code class="language-mermaid">...</code></pre>
# To Mermaid-compatible: <pre class="mermaid">...</pre>
sed -E 's/<pre><code class="language-mermaid">/<pre class="mermaid">/g; s/<\/code><\/pre>/<\/pre>/g'
```

---

## Special Components

### Internal Document Banner
```css
.internal-banner {
  background: var(--sofka-critical); color: var(--sofka-white);
  text-align: center; padding: 1rem;
  font-weight: 700; font-size: .85rem;
  letter-spacing: 2px; text-transform: uppercase;
  margin-bottom: 0;
}
```

### TL;DR Callout
```css
.tldr {
  background: var(--sofka-orange-dim);
  border-left: 4px solid var(--sofka-orange);
  border-radius: 0 var(--radius-md) var(--radius-md) 0;
  padding: 1.5rem 2rem; margin: 1.5rem 0;
}
.tldr strong { color: var(--sofka-orange); }
```

### Gate Box (for pipeline governance gates)
```css
.gate-box {
  background: var(--sofka-black);
  border: 2px solid var(--sofka-positive);
  border-radius: var(--radius-md);
  padding: 1.5rem; margin: 1.5rem 0;
  font-family: 'Menlo','Monaco',monospace;
  white-space: pre-wrap;
  color: var(--sofka-positive); font-size: .82rem;
}
```

---

## Responsive Breakpoints

```css
@media (max-width: 768px) {
  .hero { padding: 3rem 1rem; }
  .hero-kpis { grid-template-columns: repeat(2, 1fr); gap: 1rem; }
  .hero-kpi-value { font-size: 2rem; }
  main.container { padding: 0 1rem; }
  .section-header { flex-direction: column; gap: .75rem; }
  .section-number { width: 48px; height: 48px; font-size: 1.2rem; }
  .card-grid-2, .card-grid-3, .card-grid-4 { grid-template-columns: 1fr; }
  nav.toc .toc-inner { padding: 0 1rem; }
}
```

## Accessibility

### Reduced Motion
```css
@media (prefers-reduced-motion: reduce) {
  * { animation-duration: 0.01ms !important; animation-iteration-count: 1 !important; transition-duration: 0.01ms !important; }
  nav.toc a { transition: none !important; }
  .modal-overlay { backdrop-filter: none; }
}
```

### Print Stylesheet
```css
@media print {
  nav.toc, footer.site-footer, .modal-overlay, .skip-link { display: none !important; }
  :root { --shadow-card: none; --shadow-sm: none; }
  .hero { page-break-after: avoid; }
  section.section { page-break-inside: avoid; }
  .card { page-break-inside: avoid; box-shadow: none; border: 1px solid #000; }
  body { color: #000; background: #fff; }
  a { color: inherit; text-decoration: underline; }
  .hero::before { display: none; }
}
```

## JavaScript Patterns

### TOC Scroll Tracking
```javascript
(function() {
  'use strict';
  const sections = document.querySelectorAll('main h2[id]');
  const tocLinks = document.querySelectorAll('nav.toc a');
  function updateActiveTOC() {
    const scrollPos = window.scrollY || window.pageYOffset;
    let current = '';
    sections.forEach(function(section) {
      if (scrollPos >= section.offsetTop - 200) {
        current = section.id;
      }
    });
    tocLinks.forEach(function(link) {
      var href = link.getAttribute('href');
      link.classList.toggle('active', href === '#' + current);
    });
  }
  window.addEventListener('scroll', updateActiveTOC);
  updateActiveTOC();
})();
```

## Z-Index Hierarchy

| Layer | z-index | Purpose |
|-------|---------|---------|
| Skip Link | 999 | Always accessible, above everything except modals |
| Sticky TOC | 100 | Stays on top of content, below modals |
| Modal Overlay | 1000 | Blocks interaction, highest stacking context |

## Implementation Checklist

- [ ] `:root` tokens copied verbatim
- [ ] Global contrast fix block present
- [ ] Body bg `#FFFFFF`, text `--sofka-gray-900`
- [ ] Hero section: black bg, 8px orange border-bottom, radial gradient `::before`
- [ ] TOC: `--sofka-gray-50` bg, `--sofka-gray-300` border
- [ ] Cards: `--sofka-gray-50` bg, `--sofka-gray-300` border
- [ ] Tables: dark headers, `--sofka-gray-100` cells, `--sofka-gray-900` text
- [ ] Mermaid: `theme: 'base'`, light fills, black text
- [ ] Bridge CSS present (if pipeline mode)
- [ ] Evidence badges CSS present (if pipeline mode)
- [ ] Font fallback chain includes system fonts
- [ ] Print stylesheet included
- [ ] Reduced motion media query included
- [ ] Skip link has z-index: 999
- [ ] JavaScript uses `window.scrollY`
- [ ] All color combos meet WCAG AA contrast

---

**Design System:** v5 "Dark Authority" | **Last Updated:** 2026-03-16
