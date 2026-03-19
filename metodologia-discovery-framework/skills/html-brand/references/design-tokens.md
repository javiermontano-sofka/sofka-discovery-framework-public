# MetodologIA Design System — Neo-Swiss Token Reference
> Fuente de verdad unica para tokens CSS en todos los entregables HTML de MetodologIA.
> Estetica: Neo-Swiss Clean & Soft Explainer
> Version: v6.0 Neo-Swiss
> Actualizado: 2026-03-17

---

## IMPORTANT: Single Source of Truth

The canonical token source is `references/brand-config-neoswiss.json`.
This file documents the CSS implementation of those tokens.
If there is a conflict, `brand-config-neoswiss.json` wins.

---

## Token `:root` canonico

Copiar este bloque exacto en todo HTML generado por el plugin:

```css
:root {
  /* ── Brand Core (Neo-Swiss) ── */
  --navy: #122562;
  --gold: #FFD700;
  --blue: #137DC5;
  --dark: #1F2833;
  --lavender: #BBA0CC;
  --gray: #808080;
  --white: #FFFFFF;
  --off-white: #F8F9FC;
  --light-gray: #E8EAF0;

  /* ── Semantic States ── */
  --positive: #137DC5;
  --warning: #D97706;
  --critical: #DC2626;

  /* ── Typography ── */
  --font-title: 'Poppins', 'Segoe UI', sans-serif;
  --font-body: 'Trebuchet MS', 'Lucida Sans', sans-serif;
  --font-note: 'Futura', 'Century Gothic', 'Trebuchet MS', sans-serif;

  /* ── Spacing (Swiss 8px grid) ── */
  --sp-1: 8px;
  --sp-2: 16px;
  --sp-3: 24px;
  --sp-4: 32px;
  --sp-5: 40px;
  --sp-6: 48px;
  --sp-8: 64px;
  --sp-10: 80px;

  /* ── Shadows (navy-tinted, NOT black) ── */
  --shadow-sm: 0 1px 3px rgba(18,37,98,.06);
  --shadow-md: 0 4px 16px rgba(18,37,98,.08);
  --shadow-lg: 0 8px 32px rgba(18,37,98,.10);
  --shadow-card: 0 2px 8px rgba(18,37,98,.05), 0 8px 24px rgba(18,37,98,.06);

  /* ── Border Radius ── */
  --radius-sm: 8px;
  --radius-md: 12px;
  --radius-lg: 16px;
  --radius-xl: 24px;

  /* ── Animations ── */
  --transition-fast: 0.15s ease;
  --transition-normal: 0.2s ease;
  --transition-slow: 0.3s ease;

  /* ── Z-Index Hierarchy ── */
  --z-skip-link: 999;
  --z-sticky-nav: 100;
  --z-modal: 1000;
}
```

---

## Reglas de uso

### Colores de status

| Status | Token | Color | Regla |
|--------|-------|-------|-------|
| Exito/positivo | `--positive` / `--blue` | #137DC5 (blue) | **NUNCA verde para exito** |
| Advertencia | `--warning` | #D97706 (amber) | — |
| Critico/error | `--critical` | #DC2626 (rojo) | — |
| Acento/CTA | `--gold` | #FFD700 (gold) | Hero highlights, badges, emphasis |

### Contraste

| Fondo | Color de texto requerido | Ratio |
|-------|-------------------------|-------|
| `--navy` (#122562) | `--white` (#FFFFFF) | 12.4:1 ✓ |
| `--navy` (#122562) | `--gold` (#FFD700) | 8.9:1 ✓ |
| `--off-white` (#F8F9FC) | `--dark` (#1F2833) | 11.2:1 ✓ |
| `--off-white` (#F8F9FC) | `--navy` (#122562) | 11.8:1 ✓ |
| `--white` (#FFFFFF) | `--dark` (#1F2833) | 12.5:1 ✓ |

### Tipografia

| Uso | Font | Weight | Size |
|-----|------|--------|------|
| H1 (hero) | Poppins | 800 | clamp(2rem, 5vw, 3rem) |
| H2 (section) | Poppins | 700 | 1.6rem |
| H3 (subsection) | Poppins | 600 | 1.2rem |
| Body | Trebuchet MS | 400 | 1rem (16px) |
| Small / note | Futura / Century Gothic | 400 | 0.82rem |
| Badge | Poppins | 600 | 0.7rem |
| TOC link | Futura / Century Gothic | 600 | 0.72rem |
| Section number | Poppins | 700 | 1.5rem |

**Google Fonts import:**
```html
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
```

### Layout

- `max-width: 1100px` para contenido principal
- `body { background: var(--off-white); }` — fondo off-white, NUNCA oscuro
- Hero: `background: var(--navy); border-bottom: 6px solid var(--gold);`
- Cards: `box-shadow: var(--shadow-card); border-radius: var(--radius-md);`
- Swiss 8px grid for all spacing

---

## Estructura del Documento

### Hero
```css
.hero {
  background: var(--navy);
  padding: var(--sp-8) var(--sp-4);
  border-bottom: 6px solid var(--gold);
  color: var(--white);
}
.hero-logo { /* Inline SVG from logo-metodologia.svg, height: 44px */ }
.hero h1 { font-family: var(--font-title); font-weight: 800; color: var(--white); }
.hero h1 em { color: var(--gold); font-style: normal; }
.hero-kpis { display: grid; grid-template-columns: repeat(4, 1fr); gap: var(--sp-3); }
.hero-kpi-value { font-family: var(--font-title); font-size: 2.4rem; font-weight: 700; color: var(--gold); }
.hero-kpi-label { font-family: var(--font-note); font-size: 0.78rem; color: rgba(255,255,255,.7); text-transform: uppercase; letter-spacing: 1.5px; }
```

### Sticky TOC
```css
nav.toc {
  background: var(--white);
  position: sticky; top: 0; z-index: var(--z-sticky-nav);
  border-bottom: 1px solid var(--light-gray);
  box-shadow: var(--shadow-sm);
}
nav.toc a {
  font-family: var(--font-note);
  font-size: 0.72rem; font-weight: 600;
  text-transform: uppercase; letter-spacing: 1.5px;
  color: var(--gray);
  border-bottom: 3px solid transparent;
}
nav.toc a:hover, nav.toc a.active {
  color: var(--navy);
  border-bottom-color: var(--gold);
}
```

### Sections
```css
.section-number {
  width: 56px; height: 56px;
  background: var(--navy);
  color: var(--gold);
  font-family: var(--font-title);
  font-size: 1.5rem; font-weight: 700;
  display: flex; align-items: center; justify-content: center;
  border-radius: var(--radius-sm);
}
.section-header h2 {
  font-family: var(--font-title);
  font-weight: 700; font-size: 1.6rem;
  color: var(--navy);
}
```

### Cards
```css
.card {
  background: var(--white);
  border-radius: var(--radius-md);
  padding: var(--sp-4);
  box-shadow: var(--shadow-card);
}
.card-accent { border-top: 4px solid var(--gold); }
.card-info { border-left: 4px solid var(--blue); }
.card-critical { border-left: 4px solid var(--critical); }
.card-warning { border-left: 4px solid var(--warning); }
```

### Tables
```css
.table-wrap table { width: 100%; border-collapse: collapse; }
.table-wrap th {
  background: var(--navy);
  color: var(--white);
  font-family: var(--font-title);
  font-size: 0.8rem; font-weight: 600;
  text-transform: uppercase; letter-spacing: 0.5px;
  padding: 1rem 1.25rem;
}
.table-wrap td {
  padding: 0.875rem 1.25rem;
  border-bottom: 1px solid var(--light-gray);
  font-family: var(--font-body);
}
.table-wrap tr:nth-child(even) td { background: var(--off-white); }
```

### Badges
```css
.badge { font-family: var(--font-title); font-size: 0.7rem; font-weight: 600; padding: 0.25rem 0.75rem; border-radius: var(--radius-sm); text-transform: uppercase; }
.badge-gold { background: rgba(255,215,0,.15); color: #B8860B; }
.badge-blue { background: rgba(19,125,197,.12); color: var(--blue); }
.badge-navy { background: var(--navy); color: var(--white); }
.badge-red { background: rgba(220,38,38,.12); color: var(--critical); }
```

### Evidence Chips
```css
.chip { display: inline-block; padding: 2px 10px; border-radius: 20px; font-size: 0.65rem; font-weight: 600; font-family: var(--font-note); letter-spacing: 0.5px; }
.chip-doc { background: rgba(19,125,197,.12); color: var(--blue); }
.chip-stakeholder { background: rgba(18,37,98,.10); color: var(--navy); }
.chip-inference { background: rgba(187,160,204,.20); color: #7C5C91; }
.chip-assumption { background: rgba(217,119,6,.12); color: var(--warning); }
```

### Footer
```css
footer.site-footer {
  background: var(--navy);
  border-top: 4px solid var(--gold);
  color: var(--white);
  padding: var(--sp-6) var(--sp-4) var(--sp-4);
}
.footer-logo { /* Inline SVG from logo-metodologia.svg, height: 32px */ }
.footer-badge { background: rgba(255,215,0,.15); color: var(--gold); padding: 0.35rem 0.9rem; border-radius: var(--radius-sm); font-size: 0.75rem; font-weight: 600; }
```

---

## Responsive

```css
@media (max-width: 768px) {
  .hero { padding: var(--sp-5) var(--sp-2); }
  .hero-kpis { grid-template-columns: repeat(2, 1fr); }
  .section-header { flex-direction: column; }
  .card-grid-2, .card-grid-3, .card-grid-4 { grid-template-columns: 1fr; }
}
```

## Print

```css
@media print {
  nav.toc, footer.site-footer, .skip-link { display: none !important; }
  .hero { page-break-after: avoid; }
  section.section { page-break-inside: avoid; }
  body { color: #000; background: #fff; }
}
```

## Reduced Motion

```css
@media (prefers-reduced-motion: reduce) {
  * { animation-duration: 0.01ms !important; transition-duration: 0.01ms !important; }
}
```

## JavaScript: TOC Tracking

```javascript
const sections = document.querySelectorAll('section[id]');
const tocLinks = document.querySelectorAll('nav.toc a');
window.addEventListener('scroll', () => {
  let current = '';
  sections.forEach(s => {
    if (window.scrollY >= s.offsetTop - 200) current = s.id;
  });
  tocLinks.forEach(l => {
    l.classList.toggle('active', l.getAttribute('href') === '#' + current);
  });
});
```

---

## Migracion desde tokens legacy

| Token legacy | Token Neo-Swiss |
|-------------|-----------------|
| `--metodologia-orange` (#6366F1) | `--navy` (#122562) or `--gold` (#FFD700) |
| `--metodologia-positive` (#22D3EE) | `--positive` (#137DC5) |
| `--metodologia-black` (#000000) | `--navy` (#122562) |
| `--metodologia-light` (#0F172A) | `--off-white` (#F8F9FC) |
| `--font-display` (Clash Grotesk) | `--font-title` (Poppins) |
| `--font-body` (Inter) | `--font-body` (Trebuchet MS) |
| `rgba(0,0,0,...)` shadows | `rgba(18,37,98,...)` shadows |
| `--dark-surface` (#16213E) | `--white` (#FFFFFF) |
| `#1A1A2E` body background | `#F8F9FC` body background |

---

## Keywords

`#tokens` `#design-system` `#css` `#brand` `#metodologia` `#canonical` `#neo-swiss` `#v6`
