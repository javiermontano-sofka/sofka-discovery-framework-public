# MetodologIA Design System v5 — Reference Specification

> Extracted from 14 production HTML deliverables (22,378 lines). Canonical source of truth for all branded outputs.

**Version:** 5.0.0
**Date:** 15 de marzo de 2026
**Author:** Javier Montaño · Comunidad MetodologIA
**Source:** `discovery/brand-samples/` (14 production HTML files)

---

## 1. Token Catalog — CSS Custom Properties

### 1.1 Color Palette

```css
:root {
  /* === Core Palette === */
  --mia-navy: #0A122A;          /* Background profundo, hero, secciones dark */
  --mia-navy-light: #111D3A;    /* Superficies elevadas en dark mode */
  --mia-navy-mid: #1e293b;      /* Card backgrounds, gradient endpoint */
  --mia-blue: #137DC5;          /* Accion primaria, links, informacion */
  --mia-blue-light: #38BDF8;    /* Hover states, acentos secundarios */
  --mia-blue-dim: rgba(19,125,197,0.12);  /* Blue background tint */
  --mia-gold: #FFD700;          /* CTA, acento, exito — CANONICAL */
  --mia-gold-dim: rgba(255,215,0,0.12);   /* Gold background tint */
  --mia-gold-dark: #B8860B;     /* Gold variant para secciones claras */

  /* === Neutral Palette === */
  --mia-white: #FFFFFF;         /* Texto sobre dark, fondos puros */
  --mia-offwhite: #F8F9FC;      /* Fondos de secciones claras */
  --mia-light: #E2E8F0;         /* Borders, dividers */
  --mia-text: #C8D1E0;          /* Texto body sobre dark */
  --mia-text-muted: #8892A8;    /* Metadata, captions sobre dark */
  --mia-dark-text: #1F2833;     /* Texto body sobre light */

  /* === Semantic Palette === */
  --mia-positive: #42D36F;      /* Exito, completado */
  --mia-positive-dim: rgba(66,211,111,0.10);
  --mia-warning: #F59E0B;       /* Precaucion, riesgo */
  --mia-warning-dim: rgba(245,158,11,0.10);
  --mia-critical: #EF4444;      /* Peligro, error */
  --mia-critical-dim: rgba(239,68,68,0.10);
  --mia-info: #3B82F6;          /* Informacion, nuevo */
  --mia-info-dim: rgba(59,130,246,0.10);

  /* === Typography === */
  --font-display: 'Poppins', 'Montserrat', 'Trebuchet MS', sans-serif;
  --font-body: 'Poppins', 'Montserrat', 'Trebuchet MS', sans-serif;

  /* === Spacing & Borders === */
  --radius-sm: 8px;             /* Inputs, badges */
  --radius-md: 12px;            /* Cards, callouts */
  --radius-lg: 16px;            /* Modals, sections */
  --radius-xl: 24px;            /* Hero elements, CTAs */

  /* === Shadows === */
  --shadow-sm: 0 1px 3px rgba(0,0,0,0.12);
  --shadow-md: 0 4px 16px rgba(0,0,0,0.15);
  --shadow-lg: 0 12px 40px rgba(0,0,0,0.25);
  --shadow-card: 0 2px 8px rgba(0,0,0,0.08), 0 8px 24px rgba(0,0,0,0.06);
  --shadow-glow-blue: 0 0 30px rgba(19,125,197,0.15);
  --shadow-glow-gold: 0 0 30px rgba(255,215,0,0.10);

  /* === Transitions === */
  --transition-fast: 0.15s ease;
  --transition-normal: 0.25s ease;
  --transition-slow: 0.4s cubic-bezier(0.4,0,0.2,1);

  /* === Z-Index Scale === */
  --z-sticky-nav: 100;
  --z-modal: 1000;
}
```

### 1.2 Brand Rules (Immutable)

| Rule | Specification | Violation Response |
|------|--------------|-------------------|
| Gold = Success/CTA | `#FFD700` for action, accent, success indicators | NEVER use green (`#22C55E`, `#10B981`) for success |
| Navy = Authority | `#0A122A` for primary dark backgrounds | NEVER use pure black (`#000`) |
| Blue = Information | `#137DC5` for links, primary actions, info | Consistent across all formats |
| Self-contained HTML | Single file, all CSS inline, no external stylesheets | Only external: Google Fonts + Mermaid CDN |
| Token compliance | Zero hardcoded colors — all via `--mia-*` tokens | Audit with regex: `/(?<!var\()#[0-9A-Fa-f]{3,8}/` |
| WCAG AA | Contrast ratio >= 4.5:1 for body text | Test all text/background combinations |

---

## 2. Typography

### 2.1 Font Stack

| Role | Primary | Fallback 1 | Fallback 2 | System |
|------|---------|-----------|-----------|--------|
| Display (h1-h3, nav, buttons) | Poppins | Montserrat | Trebuchet MS | sans-serif |
| Body (paragraphs, lists, tables) | Poppins | Montserrat | Trebuchet MS | sans-serif |

### 2.2 Scale

| Element | Size | Weight | Letter-spacing | Line-height |
|---------|------|--------|---------------|-------------|
| Hero title | 3rem (48px) | 800 | -0.02em | 1.1 |
| Section title (h2) | 2rem (32px) | 700 | -0.01em | 1.2 |
| Card title (h3) | 1.3rem (21px) | 600 | 0 | 1.3 |
| Body text | 1.05rem (17px) | 400 | 0 | 1.7 |
| Caption/meta | 0.85rem (14px) | 400 | 0.02em | 1.5 |
| Badge | 0.75rem (12px) | 600 | 0.05em | 1 |

### 2.3 Google Fonts Import

```html
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
```

---

## 3. Component Library (126 classes, 16 categories)

### 3.1 Hero Components (12)

| Class | Usage | Key Styles |
|-------|-------|-----------|
| `.hero` | Full-width hero section | `background: var(--mia-navy)`, radial gradient overlay, min-height: 70vh |
| `.hero-inner` | Content container | max-width: 900px, centered, padding: 4rem 2rem |
| `.hero-content` | Text wrapper | text-align: center |
| `.hero-brand` | Brand identifier | uppercase, letter-spacing: 0.15em, gold accent |
| `.hero-tagline` | Subtitle tagline | font-size: 1.1rem, text-muted |
| `.hero-title` | Main title | font-size: 3rem, weight 800, white |
| `.hero-subtitle` | Supporting text | font-size: 1.15rem, line-height 1.7 |
| `.hero-kpis` | KPI strip container | display: flex, gap: 2rem, justify-content: center |
| `.hero-kpi` | Individual KPI | text-align: center, gold value, white label |
| `.hero-cta-group` | Button group | display: flex, gap: 1rem, justify-content: center |
| `.hero-punchline` | Punchy closing line | italic, gold accent, margin-top: 2rem |
| `.hero-logo` | Inline SVG logo | width: 56px, border-radius: 14px |

### 3.2 Navigation (5)

| Class | Usage |
|-------|-------|
| `.toc-sticky` | Fixed top navigation bar, `backdrop-filter: blur(10px)`, z-index: var(--z-sticky-nav) |
| `.toc-inner` | Nav content container, max-width, horizontal scroll on mobile |
| `.toc-link` | Navigation link, hover: gold underline |
| `.nav-link` | Alternative nav link style |
| `.sticky-nav` | Alias for toc-sticky with same behavior |

### 3.3 Sections (7)

| Class | Usage |
|-------|-------|
| `.section-dark` | Dark background section (`--mia-navy`), white text |
| `.light` | Light background section (`--mia-offwhite`), dark text |
| `.section-header` | Section header group |
| `.section-number` | Circled number, gold border, 48px diameter |
| `.section-title` | Section h2, 2rem, weight 700 |
| `.section-subtitle` | Section description, 1.05rem, muted |
| `.section-content` | Content container, max-width: 1100px |

### 3.4 Cards (12)

| Class | Usage |
|-------|-------|
| `.card` | Base card, `--radius-md`, `--shadow-card`, padding 2rem |
| `.card-dark` | Dark variant, navy-light background |
| `.card-clickable` | Hover: translateY(-4px), cursor pointer, glow shadow |
| `.card-gold` | Gold accent border-top |
| `.card-accent` | Blue accent variant |
| `.card-icon` | Card icon container, 48px, centered |
| `.card-title` | Card heading, 1.3rem, weight 600 |
| `.card-description` | Card body text |
| `.card-meta` | Card metadata, muted, small |
| `.card-click-hint` | "Click para detalles" indicator |
| `.card-grid-2` | 2-column grid, gap 1.5rem |
| `.card-grid-3` | 3-column grid, gap 1.5rem |

### 3.5 Modals (8)

| Class | Usage |
|-------|-------|
| `.modal-overlay` | Full-screen overlay, z-index: var(--z-modal), backdrop-filter: blur(8px) |
| `.modal-box` | Modal content container, max-width: 700px, `--radius-lg` |
| `.modal-close` | Close button, top-right, 40px |
| `.modal-section` | Content section within modal |
| `.modal-section.anticipation` | Blue-dim background section (problem context) |
| `.modal-section.resolution` | Default background (solution details) |
| `.modal-section.success` | Gold-dim background (outcomes/benefits) |
| `.modal-badge-row` | Badge container within modal |

### 3.6 Badges & Callouts (10)

| Class | Usage |
|-------|-------|
| `.badge` | Base badge, inline-block, small caps, rounded |
| `.badge-blue` | Blue variant (`--mia-blue-dim` bg, `--mia-blue` text) |
| `.badge-gold` | Gold variant (`--mia-gold-dim` bg, `--mia-gold` text) |
| `.badge-green` | Positive variant (`--mia-positive-dim` bg) |
| `.badge-red` | Critical variant (`--mia-critical-dim` bg) |
| `.badge-warning` | Warning variant (`--mia-warning-dim` bg) |
| `.callout` | Base callout box, left border 4px, padding 1.5rem |
| `.callout-blue` | Blue callout (info) |
| `.callout-gold` | Gold callout (highlight/important) |
| `.punchline` | Standalone punchy text, gold, italic, larger font |

### 3.7 Data Components (5)

| Class | Usage |
|-------|-------|
| `.pricing-table` | Full-width pricing table with header row |
| `.pricing-pair` | Side-by-side pricing comparison cards |
| `.pricing-card` | Individual pricing card with header, body, footer |
| `.scoring-table` | Evaluation matrix with color-coded scores |
| `.table-wrapper` | Responsive table container with overflow-x |

### 3.8 Interactive Components (12)

| Class | Usage |
|-------|-------|
| `.contrast-row` | Before/after comparison container |
| `.contrast-box.today` | "Current state" box, critical-tinted |
| `.contrast-box.future` | "Future state" box, positive-tinted |
| `.micro-commit` | Small commitment/action item card |
| `.evolution-steps` | Step progression visualization |
| `.phase-grid` | Multi-phase grid layout |
| `.phase-block` | Individual phase within grid |
| `.timeline` | Vertical timeline container |
| `.timeline-item` | Individual timeline entry |
| `.faq-item` | FAQ accordion item |
| `.faq-question` | Clickable question header |
| `.faq-answer` | Collapsible answer body |

### 3.9 Buttons (5)

| Class | Styles |
|-------|--------|
| `.btn` | Base button: padding 12px 28px, `--radius-sm`, weight 600 |
| `.btn-primary` | `--mia-blue` bg, white text, hover: darken |
| `.btn-secondary` | Transparent, white border, hover: white bg + dark text |
| `.cta-button` | Large CTA: padding 16px 40px, `--radius-xl`, weight 700 |
| `.cta-button.gold` | `--mia-gold` bg, navy text, glow shadow on hover |

### 3.10 KPI Components (5)

| Class | Usage |
|-------|-------|
| `.kpi-card` | Standalone KPI display card |
| `.kpi-box` | Compact KPI within a strip |
| `.kpi-value` | Large number, 2.5rem, weight 800, gold |
| `.kpi-label` | KPI description, small, muted |
| `.kpi-strip` | Horizontal KPI container, flex, centered |

### 3.11 Footer (7)

| Class | Usage |
|-------|-------|
| `.footer` | Full-width footer, navy background |
| `.footer-inner` | Content container, max-width, centered |
| `.footer-brand` | Brand name/logo area |
| `.footer-logo` | Footer logo image/SVG |
| `.footer-id` | Document ID display |
| `.footer-code` | Monospace document code: `MTIA-{NN}-{TIPO}-{CLIENTE}-SE` |
| `.footer-cta` | Footer call-to-action link |

### 3.12-3.16 Additional Categories

| Category | Count | Key Classes |
|----------|-------|------------|
| **ROI/Value** | 8 | `.roi-grid`, `.roi-card`, `.roi-value`, `.roi-label`, `.value-prop`, `.value-grid`, `.benefit-card`, `.benefit-icon` |
| **Progress/Status** | 6 | `.progress-bar`, `.progress-fill`, `.status-indicator`, `.status-dot`, `.milestone`, `.milestone-active` |
| **Layout** | 10 | `.container`, `.grid-2`, `.grid-3`, `.grid-4`, `.flex-center`, `.flex-between`, `.gap-1`, `.gap-2`, `.text-center`, `.text-left` |
| **Animation** | 6 | `.animate-on-scroll`, `.fade-in`, `.slide-up`, `.scale-in`, `.stagger-1` through `.stagger-4` |
| **Print** | 5 | `.no-print`, `.print-only`, `.page-break`, `.page-break-avoid`, `.print-compact` |

---

## 4. Page Type Templates

### Type A — Dark-First Executive

**Use for:** Pitch, Handover, Executive Summaries

```
┌─────────────────────────────────┐
│ HERO (full dark, radial gradient)│
│ Brand + Title + KPIs + CTAs     │
├─────────────────────────────────┤
│ STICKY NAV (blur backdrop)      │
├─────────────────────────────────┤
│ SECTION DARK (clickable cards   │
│   with modals for detail)       │
├─────────────────────────────────┤
│ SECTION LIGHT (business case,   │
│   dream team, value props)      │
├─────────────────────────────────┤
│ SECTION DARK (timeline, phases, │
│   evolution steps)              │
├─────────────────────────────────┤
│ SECTION LIGHT (pricing, ROI,    │
│   comparison tables)            │
├─────────────────────────────────┤
│ SECTION DARK (FAQ modals)       │
├─────────────────────────────────┤
│ CTA FINAL + FOOTER              │
└─────────────────────────────────┘
```

### Type B — Light-First Technical

**Use for:** Spec, AS-IS, Flow Mapping, Architecture

```
┌─────────────────────────────────┐
│ HERO COMPACT (minimal KPIs)     │
├─────────────────────────────────┤
│ STICKY TOC (section links)      │
├─────────────────────────────────┤
│ SECTION LIGHT (data tables,     │
│   scoring matrices, callouts)   │
├─────────────────────────────────┤
│ SECTION DARK (diagrams,         │
│   architecture views)           │
├─────────────────────────────────┤
│ ... alternating light/dark ...  │
├─────────────────────────────────┤
│ FAQ ACCORDION                   │
├─────────────────────────────────┤
│ FOOTER with DOCUMENT ID         │
└─────────────────────────────────┘
```

### Type C — Timeline/Roadmap

**Use for:** Plan, Roadmap, Scenarios

```
┌─────────────────────────────────┐
│ HERO with KPI STRIP             │
├─────────────────────────────────┤
│ PHASE GRID (phase blocks)       │
├─────────────────────────────────┤
│ TIMELINE (vertical, milestones) │
├─────────────────────────────────┤
│ EVOLUTION STEPS (progression)   │
├─────────────────────────────────┤
│ MILESTONE MARKERS               │
├─────────────────────────────────┤
│ FOOTER                          │
└─────────────────────────────────┘
```

### Type D — Commercial

**Use for:** Commercial Guide, Pricing, Proposals

```
┌─────────────────────────────────┐
│ HERO with pricing KPIs          │
├─────────────────────────────────┤
│ STICKY TOC                      │
├─────────────────────────────────┤
│ PRICING TABLES (highlight rows) │
├─────────────────────────────────┤
│ ROI CARD GRID                   │
├─────────────────────────────────┤
│ RESELLER COMPARISON             │
├─────────────────────────────────┤
│ FAQ ACCORDION → CTA             │
├─────────────────────────────────┤
│ FOOTER                          │
└─────────────────────────────────┘
```

---

## 5. Logo SVG (Inline)

```html
<svg width="56" height="56" viewBox="0 0 36 36" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="heroLogo" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#0A122A"/>
      <stop offset="100%" stop-color="#1E293B"/>
    </linearGradient>
  </defs>
  <rect width="36" height="36" rx="10" fill="url(#heroLogo)"/>
  <path d="M10 12h3v12h-3V12zm6 0h3v8h-3v-8zm0 10h3v2h-3v-2zm6-10h3v6h-3v-6zm0 8h3v4h-3v-4z" fill="white"/>
  <circle cx="18" cy="8" r="2" fill="#FFD700"/>
</svg>
```

> **Note:** The logo dot uses canonical gold `#FFD700` (not `#E5A100` from Pitch v1).

---

## 6. JavaScript Patterns

### 6.1 IntersectionObserver (Scroll Animations)

```javascript
document.addEventListener('DOMContentLoaded', () => {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.style.opacity = '1';
        entry.target.style.transform = 'translateY(0)';
      }
    });
  }, { threshold: 0.1 });

  document.querySelectorAll('.animate-on-scroll').forEach(el => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(30px)';
    el.style.transition = 'var(--transition-slow)';
    observer.observe(el);
  });
});
```

### 6.2 Modal Handlers

```javascript
function openModal(id) {
  document.getElementById(id).style.display = 'flex';
  document.body.style.overflow = 'hidden';
}
function closeModal(id) {
  document.getElementById(id).style.display = 'none';
  document.body.style.overflow = '';
}
// Close on overlay click
document.querySelectorAll('.modal-overlay').forEach(m => {
  m.addEventListener('click', e => {
    if (e.target === m) closeModal(m.id);
  });
});
// Close on Escape
document.addEventListener('keydown', e => {
  if (e.key === 'Escape') {
    document.querySelectorAll('.modal-overlay').forEach(m => {
      m.style.display = 'none';
    });
    document.body.style.overflow = '';
  }
});
```

### 6.3 FAQ Accordion

```javascript
document.querySelectorAll('.faq-question').forEach(q => {
  q.addEventListener('click', () => {
    const answer = q.nextElementSibling;
    const isOpen = answer.style.maxHeight;
    // Close all
    document.querySelectorAll('.faq-answer').forEach(a => {
      a.style.maxHeight = null;
    });
    // Toggle current
    if (!isOpen) {
      answer.style.maxHeight = answer.scrollHeight + 'px';
    }
  });
});
```

### 6.4 TOC Active Tracking

```javascript
const sections = document.querySelectorAll('[id]');
const tocLinks = document.querySelectorAll('.toc-link');

const sectionObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      tocLinks.forEach(link => link.classList.remove('active'));
      const activeLink = document.querySelector(`.toc-link[href="#${entry.target.id}"]`);
      if (activeLink) activeLink.classList.add('active');
    }
  });
}, { threshold: 0.3, rootMargin: '-80px 0px 0px 0px' });

sections.forEach(s => sectionObserver.observe(s));
```

---

## 7. Responsive Strategy

### Breakpoints

| Breakpoint | Width | Changes |
|-----------|-------|---------|
| Mobile | < 768px | Single column, stacked cards, compact hero, horizontal scroll TOC |
| Tablet | 768px - 1024px | 2-column grids, reduced margins |
| Desktop | > 1024px | Full layout, 3-4 column grids, side-by-side pricing |

### Key Media Queries

```css
@media (max-width: 768px) {
  .hero-title { font-size: 2rem; }
  .hero-kpis { flex-direction: column; gap: 1rem; }
  .card-grid-2, .card-grid-3 { grid-template-columns: 1fr; }
  .pricing-pair { flex-direction: column; }
  .toc-inner { overflow-x: auto; white-space: nowrap; }
  .contrast-row { flex-direction: column; }
}
```

---

## 8. Print Styles

```css
@media print {
  .toc-sticky, .modal-overlay, .no-print { display: none !important; }
  .hero { min-height: auto; padding: 2rem; page-break-after: always; }
  body { font-size: 10pt; color: #000; }
  .card { break-inside: avoid; border: 1px solid #ddd; }
  a { color: #000; text-decoration: none; }
  a[href]::after { content: " (" attr(href) ")"; font-size: 8pt; }
}
```

---

## 9. Accessibility Checklist

| Requirement | Implementation |
|------------|---------------|
| Contrast >= 4.5:1 | All text/background combos tested. Navy (#0A122A) + white (#FFF) = 16.7:1 |
| Semantic HTML5 | `<header>`, `<main>`, `<section>`, `<nav>`, `<footer>`, `<article>` |
| Aria labels | Modals: `role="dialog" aria-modal="true" aria-label="..."` |
| Focus visible | `:focus-visible { outline: 2px solid var(--mia-gold); outline-offset: 2px; }` |
| Keyboard navigation | Modals close on Escape, TOC links focusable, skip-to-content link |
| Alt text | All SVG/images have `aria-label` or `alt` attributes |
| Heading hierarchy | h1 → h2 → h3, no level skips |
| Link purpose | Descriptive link text, no "click here" |

---

## 10. Format Mapping — Token Translation Across Formats

| CSS Token | HTML | DOCX (python-docx) | XLSX (openpyxl) | PPTX (python-pptx) |
|-----------|------|-------------------|-----------------|-------------------|
| `--mia-navy` | `#0A122A` | `RGBColor(0x0A, 0x12, 0x2A)` | `PatternFill(fgColor='0A122A')` | `RGBColor(0x0A, 0x12, 0x2A)` |
| `--mia-blue` | `#137DC5` | `RGBColor(0x13, 0x7D, 0xC5)` | `Font(color='137DC5')` | `RGBColor(0x13, 0x7D, 0xC5)` |
| `--mia-gold` | `#FFD700` | `RGBColor(0xFF, 0xD7, 0x00)` | `PatternFill(fgColor='FFD700')` | `RGBColor(0xFF, 0xD7, 0x00)` |
| `--mia-white` | `#FFFFFF` | `RGBColor(0xFF, 0xFF, 0xFF)` | `Font(color='FFFFFF')` | `RGBColor(0xFF, 0xFF, 0xFF)` |
| `--mia-positive` | `#42D36F` | `RGBColor(0x42, 0xD3, 0x6F)` | `Font(color='42D36F')` | `RGBColor(0x42, 0xD3, 0x6F)` |
| `--mia-warning` | `#F59E0B` | `RGBColor(0xF5, 0x9E, 0x0B)` | `Font(color='F59E0B')` | `RGBColor(0xF5, 0x9E, 0x0B)` |
| `--mia-critical` | `#EF4444` | `RGBColor(0xEF, 0x44, 0x44)` | `Font(color='EF4444')` | `RGBColor(0xEF, 0x44, 0x44)` |
| Poppins | `font-family` | `Font(name='Poppins')` | `Font(name='Poppins')` | `font.name = 'Poppins'` |
| Montserrat | `font-family` | `Font(name='Montserrat')` | `Font(name='Montserrat')` | `font.name = 'Montserrat'` |

---

## 11. Document ID Convention

```
MTIA-{NN}-{TIPO}-{CLIENTE}-SE

Where:
  MTIA    = MetodologIA prefix
  NN      = Deliverable number (00-14)
  TIPO    = Deliverable type abbreviation
  CLIENTE = Client code (3-6 chars uppercase)
  SE      = Sofka Edition marker
```

**Examples:**
- `MTIA-08-PITCH-DANI-SE` — Pitch Ejecutivo for client Dani
- `MTIA-07-SPEC-DANI-SE` — Especificacion Funcional for client Dani
- `MTIA-03-ASIS-ACME-SE` — AS-IS Analysis for client ACME

---

*Construido por profesionales, potenciado por la red agentica de MetodologIA.*
