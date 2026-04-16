# MetodologIA Design System v4 — Complete Token Reference

## Table of Contents

1. [CSS Custom Properties](#css-custom-properties) — :root block with all tokens
2. [Typography Scale](#typography-scale) — Font sizes, weights, contrast ratios
3. [Font Loading & Fallback](#font-loading) — Import URLs, system font fallbacks
4. [Color Usage Rules](#color-usage-rules) — Semantic states, decorative colors
5. [Component CSS Classes](#component-css-classes):
   - Skip Link, Hero, TOC, Sections, Cards, Scenario Cards, Callouts, Tables, Badges
   - Constraint Cards, ADR Cards, Risk Cards, Pros/Cons, Score Bars
   - Gains/Risks Cards, Roadmap Links, Decision List, Timeline Steps, Modals, Footer
6. [Responsive Breakpoints](#responsive-breakpoints) — Mobile at 768px
7. [Accessibility: Reduced Motion](#accessibility-reduced-motion)
8. [Dark Mode (Placeholder)](#dark-mode)
9. [Print Stylesheet](#print-stylesheet)
10. [JavaScript Patterns](#javascript-patterns) — TOC tracking, modals, score bars
11. [Z-Index Hierarchy](#z-index-hierarchy)
12. [Implementation Checklist](#implementation-checklist)

---

## CSS Custom Properties

Copy this `:root` block verbatim into every MetodologIA HTML document.

```css
:root {
  /* BRAND CORE */
  --metodologia-orange: #6366F1;
  --metodologia-orange-light: #818CF8;
  --metodologia-orange-dark: #4F46E5;
  --metodologia-orange-dim: rgba(255,126,8,.10);
  --metodologia-black: #000000;
  --metodologia-white: #FFFFFF;
  --metodologia-light: #0F172A;
  --metodologia-dark: #B8A894;

  /* SEMANTIC: POSITIVE (v4: YELLOW, NOT GREEN) */
  --metodologia-positive: #22D3EE;
  --metodologia-positive-dim: rgba(255,215,0,.12);
  --metodologia-positive-border: rgba(255,215,0,.45);
  --metodologia-positive-text: #06B6D4;

  /* SEMANTIC: WARNING */
  --metodologia-warning: #D97706;
  --metodologia-warning-dim: rgba(217,119,6,.08);
  --metodologia-warning-border: rgba(217,119,6,.3);

  /* SEMANTIC: CRITICAL */
  --metodologia-critical: #DC2626;
  --metodologia-critical-dim: rgba(220,38,38,.07);
  --metodologia-critical-border: rgba(220,38,38,.25);

  /* SEMANTIC: INFO */
  --metodologia-info: #2563EB;
  --metodologia-info-dim: rgba(37,99,235,.07);
  --metodologia-info-border: rgba(37,99,235,.25);

  /* DECORATIVE (charts/data-viz ONLY — never for semantic states) */
  --metodologia-green: #42D36F;
  --metodologia-teal: #06C8C8;
  --metodologia-violet: #9747FF;
  --metodologia-pink: #FE9CAB;
  --metodologia-yellow: #22D3EE;

  /* BACKGROUND TINTS */
  --metodologia-red-bg: rgba(220,38,38,0.06);
  --metodologia-amber-bg: rgba(217,119,6,0.06);
  --metodologia-green-bg: rgba(66,211,111,0.08);
  --metodologia-blue-bg: rgba(37,99,235,0.06);
  --metodologia-violet-bg: rgba(151,71,255,0.06);
  --metodologia-teal-bg: rgba(6,200,200,0.06);
  --metodologia-pink-bg: rgba(254,156,171,0.06);

  /* TYPOGRAPHY */
  --font-display: 'Clash Grotesk', 'Inter', sans-serif;
  --font-body: 'Inter', system-ui, sans-serif;

  /* GRAYS */
  --metodologia-gray-50: #FAF8F6;
  --metodologia-gray-100: #F4F0EC;
  --metodologia-gray-200: #E4DED7;
  --metodologia-gray-300: #D1C9BE;
  --metodologia-gray-500: #6B6560;
  --metodologia-gray-700: #333130;
  --metodologia-gray-900: #111110;

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
| h1 | Clash Grotesk | clamp(2.5rem, 5vw, 4.2rem) | 700 | 1.1 | var(--metodologia-white) on black | AA ✓ |
| h2 | Clash Grotesk | 2.2rem | 700 | 1.2 | var(--metodologia-black) on light | AAA ✓ |
| h3 | Clash Grotesk | 1.8rem | 700 | 1.2 | var(--metodologia-gray-900) on white | AAA ✓ |
| h4 | Clash Grotesk | 1.4rem | 600 | 1.3 | var(--metodologia-gray-700) on white | AAA ✓ |
| Body | Inter | 1rem (16px) | 400 | 1.65 | var(--metodologia-gray-700) on white | AAA ✓ |
| Small | Inter | 0.875rem | 400 | 1.5 | var(--metodologia-gray-500) on white | AA ✓ |
| Badge | Inter | 0.7-0.75rem | 600 | — | Varies by type | AA+ ✓ |
| TOC link | Inter | 0.72rem | 600 | — | var(--metodologia-gray-500) on white | AA ✓ |

## Font Loading & Fallback Strategy

```css
/* Font imports at <head> */
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
@import url('https://api.fontshare.com/v2/css?f[]=clash-grotesk@400,500,600,700&display=swap');

/* Fallback stacks — if CDN fails, system fonts take over */
--font-display: 'Clash Grotesk', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
--font-body: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', system-ui, sans-serif;

/* Font-display: swap ensures text visible while fonts load (FOUT instead of FOIT) */
```

## Color Usage Rules

### Semantic States (for status, outcome, health indicators)
| State | Primary | Dim Bg | Border | Text on Dim | WCAG Contrast |
|-------|---------|--------|--------|-------------|---|
| Positive | #22D3EE (yellow) | rgba(255,215,0,.12) | rgba(255,215,0,.45) | #06B6D4 | AA ✓ |
| Warning | #D97706 (amber) | rgba(217,119,6,.08) | rgba(217,119,6,.3) | inherit | AA ✓ |
| Critical | #DC2626 (red) | rgba(220,38,38,.07) | rgba(220,38,38,.25) | inherit | AA ✓ |
| Info | #2563EB (blue) | rgba(37,99,235,.07) | rgba(37,99,235,.25) | inherit | AA ✓ |

### Decorative Colors (ONLY for charts, graphs, data visualization)
- Green: #42D36F
- Teal: #06C8C8
- Violet: #9747FF
- Pink: #FE9CAB

## Component CSS Classes

### Skip Link (Accessibility)
```css
.skip-link { position: absolute; top: -100px; left: 0; background: var(--metodologia-orange); color: #fff; padding: .5rem 1rem; z-index: var(--z-skip-link); border-radius: var(--radius-sm); }
.skip-link:focus { top: 0; }
```

### Hero Header
```css
.hero { background: var(--metodologia-black); position: relative; overflow: hidden; padding: 4rem 2rem; border-bottom: 8px solid var(--metodologia-orange); }
.hero::before { content: ''; position: absolute; top: 0; right: -20%; width: 60%; height: 100%; background: radial-gradient(ellipse at 100% 50%, rgba(255,126,8,0.15) 0%, transparent 70%); pointer-events: none; }
.hero-inner { position: relative; z-index: 2; max-width: 1100px; margin: 0 auto; color: var(--metodologia-white); }
.hero-logo { font-family: var(--font-display); font-size: 1.8rem; font-weight: 700; color: var(--metodologia-orange); margin-bottom: 1.5rem; letter-spacing: -1px; }
.hero-meta-badges { display: flex; gap: .75rem; flex-wrap: wrap; margin-bottom: 1.5rem; }
.hero-meta-badge { background: rgba(255,255,255,.08); border: 1px solid rgba(255,255,255,.15); color: rgba(255,255,255,.85); padding: .35rem .9rem; border-radius: var(--radius-sm); font-size: .75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 1px; }
.hero h1 { color: var(--metodologia-white); margin-bottom: 1rem; }
.hero h1 span { color: var(--metodologia-orange); }
.hero-subtitle { font-size: 1.15rem; color: rgba(255,255,255,.85); margin-bottom: 1.5rem; line-height: 1.7; max-width: 750px; }
.hero-kpis { display: grid; grid-template-columns: repeat(4, 1fr); gap: 1.5rem; margin-top: 2rem; }
.hero-kpi { text-align: center; }
.hero-kpi-value { font-family: var(--font-display); font-size: 2.8rem; font-weight: 700; line-height: 1; }
.hero-kpi-value.orange { color: var(--metodologia-orange); }
.hero-kpi-value.blue { color: #93C5FD; }
.hero-kpi-value.red { color: #FCA5A5; }
.hero-kpi-label { font-size: .78rem; color: rgba(255,255,255,.6); margin-top: .4rem; font-weight: 500; letter-spacing: .5px; }
```

### Sticky TOC Navigation
```css
nav.toc { background: var(--metodologia-white); position: sticky; top: 0; z-index: var(--z-sticky-nav); border-bottom: 1px solid var(--metodologia-gray-200); box-shadow: var(--shadow-sm); }
nav.toc .toc-inner { max-width: 1100px; margin: 0 auto; display: flex; overflow-x: auto; scrollbar-width: none; -ms-overflow-style: none; padding: 0 2rem; }
nav.toc .toc-inner::-webkit-scrollbar { display: none; }
nav.toc a { display: block; padding: 1rem 1.25rem; font-size: .72rem; font-weight: 600; text-transform: uppercase; letter-spacing: 1.5px; color: var(--metodologia-gray-500); white-space: nowrap; text-decoration: none; border-bottom: 3px solid transparent; transition: all var(--transition-normal); }
nav.toc a:hover, nav.toc a.active { color: var(--metodologia-orange); border-bottom-color: var(--metodologia-orange); }
```

### Sections
```css
section.section { scroll-margin-top: 60px; padding: 4rem 0; }
.section-header { display: flex; gap: 1.5rem; align-items: flex-start; margin-bottom: 2.5rem; }
.section-number { width: 60px; height: 60px; min-width: 60px; background: var(--metodologia-black); color: var(--metodologia-orange); font-family: var(--font-display); font-size: 1.5rem; font-weight: 700; display: flex; align-items: center; justify-content: center; border-radius: var(--radius-sm); }
.section-header h2 { margin: 0; }
.section-header .section-subtitle { font-size: .95rem; color: var(--metodologia-gray-500); margin-top: .25rem; }
```

### Cards
```css
.card { background: var(--metodologia-white); border-radius: var(--radius-lg); padding: 2rem; box-shadow: var(--shadow-card); margin-bottom: 1.5rem; }
.card-accent { border-top: 4px solid var(--metodologia-orange); }
.card-info { border-left: 4px solid var(--metodologia-info); background: linear-gradient(135deg, var(--metodologia-info-dim), transparent); }
.card-critical { border-left: 4px solid var(--metodologia-critical); background: linear-gradient(135deg, var(--metodologia-critical-dim), transparent); }
.card-warning { border-left: 4px solid var(--metodologia-warning); background: linear-gradient(135deg, var(--metodologia-warning-dim), transparent); }
.card-highlight { border: 2px solid var(--metodologia-orange); background: linear-gradient(135deg, var(--metodologia-orange-dim), transparent); }
.card-dark { background: var(--metodologia-black); color: var(--metodologia-white); }
.card-dark p, .card-dark li { color: rgba(255,255,255,.85); }
.card-grid-2 { display: grid; grid-template-columns: repeat(2, 1fr); gap: 1.5rem; }
.card-grid-3 { display: grid; grid-template-columns: repeat(3, 1fr); gap: 1.5rem; }
.card-grid-4 { display: grid; grid-template-columns: repeat(4, 1fr); gap: 1.5rem; }
```

### Scenario Cards (for comparison documents)
```css
.scenario-card { background: var(--metodologia-white); border-radius: var(--radius-lg); padding: 2.5rem; margin-bottom: 1.5rem; box-shadow: var(--shadow-card); border-left: 6px solid; position: relative; overflow: visible; }
.scenario-card.a { border-left-color: var(--metodologia-orange); }
.scenario-card.b { border-left-color: var(--metodologia-info); }
.scenario-card.c { border-left-color: var(--metodologia-critical); }
.scenario-card.b.recommended { box-shadow: 0 8px 32px rgba(37,99,235,.15); border: 2px solid var(--metodologia-info); border-left: 6px solid var(--metodologia-info); }
.scenario-label { display: inline-block; padding: .4rem 1rem; border-radius: var(--radius-sm); font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: 1.5px; margin-bottom: 1rem; }
.scenario-label.a { background: rgba(255,126,8,.12); color: var(--metodologia-orange); }
.scenario-label.b { background: rgba(37,99,235,.12); color: var(--metodologia-info); }
.scenario-label.c { background: rgba(220,38,38,.12); color: var(--metodologia-critical); }
.scenario-title { font-size: 1.6rem; font-family: var(--font-display); font-weight: 700; margin-bottom: .5rem; }
.scenario-subtitle { color: var(--metodologia-gray-500); font-size: .95rem; margin-bottom: 1.5rem; }
.recommended-badge { position: absolute; top: -14px; left: 2rem; background: var(--metodologia-info); color: white; padding: .35rem 1rem; border-radius: var(--radius-sm); font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: 1px; box-shadow: 0 4px 12px rgba(37,99,235,.3); }
```

### Callouts
```css
.callout { padding: 1.5rem; border-radius: var(--radius-md); margin: 1.5rem 0; border-left: 4px solid; }
.callout-info { background: var(--metodologia-info-dim); border-color: var(--metodologia-info); }
.callout-warning { background: var(--metodologia-warning-dim); border-color: var(--metodologia-warning); }
.callout-critical { background: var(--metodologia-critical-dim); border-color: var(--metodologia-critical); }
.callout-success { background: var(--metodologia-positive-dim); border-color: var(--metodologia-positive); }
.callout-orange { background: var(--metodologia-orange-dim); border-color: var(--metodologia-orange); }
.callout strong { display: block; margin-bottom: .5rem; }
```

### Tables
```css
.table-wrap { overflow-x: auto; margin: 1.5rem 0; border-radius: var(--radius-md); box-shadow: var(--shadow-card); }
.table-wrap table { width: 100%; border-collapse: collapse; font-size: .9rem; }
.table-wrap th { background: var(--metodologia-gray-900); color: var(--metodologia-white); padding: 1rem 1.25rem; text-align: left; font-weight: 600; font-size: .8rem; text-transform: uppercase; letter-spacing: .5px; }
.table-wrap td { padding: .875rem 1.25rem; border-bottom: 1px solid var(--metodologia-gray-200); background: var(--metodologia-white); }
.table-wrap tr:last-child td { border-bottom: none; }
.table-wrap tr:hover td { background: var(--metodologia-gray-50); }
.table-wrap .check { color: var(--metodologia-positive-text); font-weight: 700; }
.table-wrap .cross { color: var(--metodologia-critical); font-weight: 600; }
.table-wrap .partial { color: var(--metodologia-warning); font-weight: 600; }
```

### Badges
```css
.badge { display: inline-block; padding: .25rem .75rem; border-radius: var(--radius-sm); font-size: .7rem; font-weight: 600; text-transform: uppercase; letter-spacing: .5px; }
.badge-orange { background: var(--metodologia-orange); color: var(--metodologia-white); }
.badge-outline { background: transparent; border: 1.5px solid var(--metodologia-orange); color: var(--metodologia-orange); }
.badge-blue { background: rgba(37,99,235,.12); color: var(--metodologia-info); }
.badge-red { background: rgba(220,38,38,.12); color: var(--metodologia-critical); }
.badge-teal { background: rgba(6,200,200,.12); color: var(--metodologia-teal); }
.sev-critical { background: var(--metodologia-critical); color: white; }
.sev-high { background: #EA580C; color: white; }
.sev-medium { background: var(--metodologia-warning); color: black; }
.sev-low { background: var(--metodologia-positive); color: black; }
```

### Constraint Cards
```css
.constraint-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 1.5rem; margin: 1.5rem 0; }
.constraint-card { background: var(--metodologia-white); border: 1px solid var(--metodologia-gray-200); border-radius: var(--radius-md); padding: 1.5rem; transition: all var(--transition-normal); }
.constraint-card:hover { border-color: var(--metodologia-orange); box-shadow: var(--shadow-md); }
.constraint-id { font-family: var(--font-display); font-size: .7rem; font-weight: 700; color: var(--metodologia-orange); text-transform: uppercase; letter-spacing: 1px; margin-bottom: .5rem; }
.constraint-title { font-size: 1rem; font-weight: 600; color: var(--metodologia-gray-900); margin-bottom: .75rem; }
.constraint-desc { font-size: .85rem; color: var(--metodologia-gray-500); line-height: 1.6; }
```

### ADR Cards (Architectural Decision Records)
```css
.adr-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.5rem; margin: 1.5rem 0; }
.adr-card { background: var(--metodologia-white); border: 1px solid var(--metodologia-gray-200); border-radius: var(--radius-md); padding: 1.5rem; transition: all var(--transition-normal); }
.adr-card:hover { border-color: var(--metodologia-orange); box-shadow: 0 8px 24px rgba(255,126,8,.12); transform: translateY(-2px); }
.adr-id { font-family: var(--font-display); font-size: .7rem; font-weight: 700; color: var(--metodologia-orange); text-transform: uppercase; letter-spacing: 1px; margin-bottom: .5rem; }
.adr-card h4 { margin: 0 0 .75rem 0; font-size: 1.1rem; }
.adr-summary { font-size: .85rem; color: var(--metodologia-gray-500); line-height: 1.6; margin-bottom: 1rem; }
.adr-btn { background: transparent; border: 1.5px solid var(--metodologia-orange); color: var(--metodologia-orange); padding: .4rem .9rem; border-radius: var(--radius-sm); cursor: pointer; font-size: .75rem; font-weight: 600; transition: all var(--transition-normal); }
.adr-btn:hover { background: var(--metodologia-orange); color: var(--metodologia-white); }
```

### Risk Cards
```css
.risk-card { background: var(--metodologia-white); border-radius: var(--radius-md); padding: 1.5rem; margin-bottom: 1rem; border-left: 4px solid var(--metodologia-critical); box-shadow: var(--shadow-sm); }
.risk-card.warning { border-left-color: var(--metodologia-warning); }
.risk-card h4 { color: var(--metodologia-critical); margin: 0 0 .75rem 0; font-size: 1rem; }
.risk-card.warning h4 { color: var(--metodologia-warning); }
.risk-card p { font-size: .9rem; margin-bottom: .5rem; }
.risk-card .mitigation { background: var(--metodologia-gray-50); padding: 1rem; border-radius: var(--radius-sm); margin-top: .75rem; font-size: .85rem; }
```

### Pros/Cons Grid
```css
.pros-cons { display: grid; grid-template-columns: 1fr 1fr; gap: 1.5rem; margin: 1.5rem 0; }
.pros, .cons { padding: 1.5rem; border-radius: var(--radius-md); }
.pros { background: rgba(255,215,0,.08); border-left: 4px solid var(--metodologia-positive); }
.cons { background: var(--metodologia-critical-dim); border-left: 4px solid var(--metodologia-critical); }
.pros h5, .cons h5 { margin-top: 0; margin-bottom: 1rem; font-size: .85rem; text-transform: uppercase; letter-spacing: 1px; }
.pros h5 { color: var(--metodologia-positive-text); }
.cons h5 { color: var(--metodologia-critical); }
.pros-cons ul { list-style: none; padding: 0; margin: 0; }
.pros-cons li { padding: .5rem 0 .5rem 1.5rem; position: relative; font-size: .9rem; }
.pros li::before { content: "✓"; position: absolute; left: 0; color: var(--metodologia-positive-text); font-weight: 700; }
.cons li::before { content: "✕"; position: absolute; left: 0; color: var(--metodologia-critical); font-weight: 700; }
```

### Score Bars (for comparative metrics)
```css
.score-bars { display: flex; flex-direction: column; gap: .75rem; }
.score-row { display: flex; align-items: center; gap: 1rem; }
.score-label { min-width: 140px; font-size: .8rem; font-weight: 600; color: var(--metodologia-gray-700); }
.score-track { flex: 1; height: 28px; background: var(--metodologia-gray-200); border-radius: var(--radius-sm); overflow: hidden; }
.score-fill { height: 100%; border-radius: var(--radius-sm); transition: width var(--transition-slow) ease; }
.score-fill.orange { background: linear-gradient(90deg, var(--metodologia-orange), var(--metodologia-orange-light)); }
.score-fill.blue { background: linear-gradient(90deg, var(--metodologia-info), #60A5FA); }
.score-fill.red { background: linear-gradient(90deg, var(--metodologia-critical), #F87171); }
.score-value { min-width: 40px; font-size: .78rem; font-weight: 700; text-align: right; }
.score-value.orange { color: var(--metodologia-orange); }
.score-value.blue { color: var(--metodologia-info); }
.score-value.red { color: var(--metodologia-critical); }
```

### Gains/Risks Cards
```css
.gain-risk-card { background: var(--metodologia-white); border-radius: var(--radius-md); overflow: hidden; box-shadow: var(--shadow-card); border: 1px solid var(--metodologia-gray-200); }
.gain-risk-card.recommended { border: 2px solid var(--metodologia-info); box-shadow: 0 8px 24px rgba(37,99,235,.15); }
.gain-risk-header { padding: 1rem 1.25rem; font-weight: 700; font-size: .8rem; text-transform: uppercase; letter-spacing: 1px; border-bottom: 1px solid var(--metodologia-gray-200); }
.gain-risk-header.a { background: rgba(255,126,8,.06); color: var(--metodologia-orange); }
.gain-risk-header.b { background: rgba(37,99,235,.08); color: var(--metodologia-info); border-bottom-color: var(--metodologia-info); }
.gain-risk-header.c { background: rgba(220,38,38,.06); color: var(--metodologia-critical); }
.gain-risk-body { padding: 1.25rem; }
.gain-risk-list { list-style: none; padding: 0; margin: 0; }
.gain-risk-list li { padding: .35rem 0 .35rem 1.5rem; position: relative; font-size: .85rem; color: var(--metodologia-gray-700); }
.gain-risk-list li.gain::before { content: "✓"; position: absolute; left: 0; color: var(--metodologia-positive-text); font-weight: 700; }
.gain-risk-list li.risk::before { content: "✕"; position: absolute; left: 0; color: var(--metodologia-critical); font-weight: 700; }
.gain-risk-divider { border-top: 1px solid var(--metodologia-gray-200); margin: 1rem 0; }
```

### Roadmap Links
```css
.roadmap-link { border-radius: var(--radius-md); padding: 1.5rem; margin: 1rem 0; border-left: 4px solid; }
.roadmap-link.a { background: var(--metodologia-orange-dim); border-color: var(--metodologia-orange); }
.roadmap-link.b { background: var(--metodologia-info-dim); border-color: var(--metodologia-info); }
.roadmap-link.c { background: var(--metodologia-critical-dim); border-color: var(--metodologia-critical); }
.roadmap-link h5 { margin: 0 0 .5rem 0; font-size: .9rem; font-weight: 700; }
.roadmap-link p { font-size: .85rem; margin: 0; }
```

### Decision List
```css
.decision-list { list-style: none; padding: 0; margin: 1.5rem 0; }
.decision-list li { padding: 1.25rem 0 1.25rem 2rem; position: relative; font-size: .95rem; border-bottom: 1px solid var(--metodologia-gray-200); }
.decision-list li:last-child { border-bottom: none; }
.decision-list li::before { content: "→"; position: absolute; left: 0; color: var(--metodologia-info); font-weight: 700; font-size: 1.1rem; }
```

### Timeline Steps
```css
.steps { counter-reset: step; list-style: none; padding: 0; margin: 1.5rem 0; }
.steps li { counter-increment: step; padding: 1.25rem 0 1.25rem 3.5rem; position: relative; border-bottom: 1px solid var(--metodologia-gray-200); }
.steps li:last-child { border-bottom: none; }
.steps li::before { content: counter(step); position: absolute; left: 0; top: 1.25rem; width: 2.2rem; height: 2.2rem; background: var(--metodologia-black); color: var(--metodologia-orange); font-family: var(--font-display); font-weight: 700; font-size: .9rem; display: flex; align-items: center; justify-content: center; border-radius: var(--radius-sm); }
```

### Modals
```css
.modal-overlay { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,.65); z-index: var(--z-modal); justify-content: center; align-items: center; overflow-y: auto; padding: 2rem; backdrop-filter: blur(4px); }
.modal-overlay.active { display: flex; }
.modal-content { background: var(--metodologia-white); border-radius: var(--radius-lg); max-width: 700px; width: 100%; max-height: 85vh; overflow-y: auto; padding: 2.5rem; position: relative; box-shadow: var(--shadow-lg); }
.modal-close { position: absolute; top: 1.25rem; right: 1.25rem; background: var(--metodologia-gray-50); border: 1px solid var(--metodologia-gray-200); width: 2rem; height: 2rem; border-radius: 50%; cursor: pointer; font-size: 1rem; display: flex; align-items: center; justify-content: center; color: var(--metodologia-gray-500); transition: all var(--transition-normal); }
.modal-close:hover { background: var(--metodologia-critical); color: var(--metodologia-white); border-color: var(--metodologia-critical); }
.modal-content h3 { margin: 0 0 1.5rem 0; font-size: 1.4rem; padding-right: 2rem; }
.modal-content h4 { margin: 1.5rem 0 .75rem 0; font-size: 1rem; color: var(--metodologia-gray-900); }
.modal-content ul { list-style: none; padding: 0; margin-bottom: 1rem; }
.modal-content li { padding: .4rem 0 .4rem 1.5rem; position: relative; font-size: .9rem; }
.modal-content li::before { content: "▸"; position: absolute; left: 0; color: var(--metodologia-orange); font-weight: 700; }
```

### Footer
```css
footer.site-footer { background: var(--metodologia-black); border-top: 8px solid var(--metodologia-orange); color: var(--metodologia-white); padding: 3.5rem 2rem 2.5rem; }
footer.site-footer .footer-inner { max-width: 1100px; margin: 0 auto; }
.footer-row { display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 1rem; }
.footer-logo { font-family: var(--font-display); font-size: 1.3rem; font-weight: 700; color: var(--metodologia-orange); }
.footer-badges { display: flex; gap: .75rem; flex-wrap: wrap; }
.footer-badge { background: rgba(255,126,8,.15); color: var(--metodologia-orange); padding: .35rem .9rem; border-radius: var(--radius-sm); font-size: .75rem; font-weight: 600; }
.footer-bottom { margin-top: 2rem; padding-top: 1.5rem; border-top: 1px solid rgba(255,255,255,.1); display: flex; justify-content: space-between; flex-wrap: wrap; gap: .5rem; font-size: .78rem; color: rgba(255,255,255,.5); }
```

### Focus States (Accessibility)
```css
:focus-visible { outline: 2px solid var(--metodologia-orange); outline-offset: 2px; }
a:focus-visible, button:focus-visible { outline: 2px solid var(--metodologia-orange); outline-offset: 2px; }
```

## Responsive Breakpoints

```css
@media (max-width: 768px) {
  .hero { padding: 3rem 1rem; }
  .hero-kpis { grid-template-columns: repeat(2, 1fr); gap: 1rem; }
  .hero-kpi-value { font-size: 2rem; }
  main.container { padding: 0 1rem; }
  .section-header { flex-direction: column; gap: .75rem; }
  .section-number { width: 48px; height: 48px; font-size: 1.2rem; }
  .scenario-card { padding: 1.5rem; }
  .pros-cons { grid-template-columns: 1fr; }
  .card-grid-2, .card-grid-3, .card-grid-4 { grid-template-columns: 1fr; }
  .adr-grid, .constraint-grid { grid-template-columns: 1fr; }
  nav.toc .toc-inner { padding: 0 1rem; }
}
```

## Accessibility: Reduced Motion

```css
@media (prefers-reduced-motion: reduce) {
  * { animation-duration: 0.01ms !important; animation-iteration-count: 1 !important; transition-duration: 0.01ms !important; }
  .score-fill { transition: none !important; }
  nav.toc a { transition: none !important; }
  .constraint-card, .adr-card { transition: none !important; }
  .modal-overlay { backdrop-filter: none; }
}
```

## Dark Mode (Future Implementation)

```css
@media (prefers-color-scheme: dark) {
  /* NOTE: Dark mode token mappings not yet finalized in v4 */
  /* Placeholder for future dark theme implementation */
  /* When implemented, create --mao-*-dark variants for semantic colors */
}
```

## Print Stylesheet

```css
@media print {
  /* Remove sticky nav and interactive elements */
  nav.toc, footer.site-footer, .modal-overlay, .skip-link { display: none !important; }

  /* Optimize for black/white printing */
  :root { --shadow-card: none; --shadow-sm: none; }
  .hero { page-break-after: avoid; }
  section.section { page-break-inside: avoid; }
  .card, .scenario-card, .adr-card { page-break-inside: avoid; box-shadow: none; border: 1px solid #000; }

  /* Ensure text readability in print */
  body { color: #000; background: #fff; }
  a { color: inherit; text-decoration: underline; }
  h1, h2, h3, h4 { page-break-after: avoid; }

  /* Hide decorative elements */
  .hero::before { display: none; }
}
```

## JavaScript Patterns

### TOC Scroll Tracking
```javascript
const sections = document.querySelectorAll('section.section');
const tocLinks = document.querySelectorAll('nav.toc a');
window.addEventListener('scroll', () => {
  let current = '';
  sections.forEach(s => {
    /* Use window.scrollY instead of deprecated pageYOffset */
    if (window.scrollY >= s.offsetTop - 200) current = s.id;
  });
  tocLinks.forEach(l => {
    l.classList.toggle('active', l.getAttribute('href') === '#' + current);
  });
});
```

### Modal Open/Close
```javascript
function openModal(id) {
  document.getElementById(id).classList.add('active');
  document.body.style.overflow = 'hidden';
}
function closeModal(id) {
  document.getElementById(id).classList.remove('active');
  document.body.style.overflow = '';
}
/* Close on overlay click */
document.querySelectorAll('.modal-overlay').forEach(m => {
  m.addEventListener('click', e => { if (e.target === m) closeModal(m.id); });
});
/* Close on Escape key */
document.addEventListener('keydown', e => {
  if (e.key === 'Escape') document.querySelectorAll('.modal-overlay.active').forEach(m => closeModal(m.id));
});
```

### Animated Score Bars
```javascript
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const fills = entry.target.querySelectorAll('.score-fill');
      fills.forEach(fill => {
        const width = fill.dataset.width || '75%';
        setTimeout(() => { fill.style.width = width; }, 100);
      });
      observer.unobserve(entry.target);
    }
  });
}, { threshold: 0.3 });

document.querySelectorAll('.score-bars').forEach(bar => observer.observe(bar));
```

## Z-Index Hierarchy

| Layer | z-index | Purpose |
|-------|---------|---------|
| Skip Link | 999 | Always accessible, above everything except modals |
| Sticky TOC | 100 | Stays on top of content, below modals |
| Modal Overlay | 1000 | Blocks interaction, highest stacking context |

Maintain this hierarchy to prevent z-index conflicts across components.

## Implementation Checklist

- [ ] All `:root` tokens copied verbatim to document
- [ ] Hero section uses `::before` radial gradient (not stub comment)
- [ ] Constraint cards implemented with hover state
- [ ] ADR cards with transform on hover
- [ ] Risk cards with mitigation background
- [ ] Score bars have transition animation
- [ ] Timeline steps use CSS counters
- [ ] Modals respect z-index: 1000
- [ ] Print stylesheet included
- [ ] Reduced motion media query included
- [ ] Skip link has z-index: 999
- [ ] Sticky TOC has z-index: 100
- [ ] All color combos meet WCAG AA contrast ratio (noted in table)
- [ ] Font fallback chain includes system fonts
- [ ] JavaScript uses `window.scrollY` not `pageYOffset`
