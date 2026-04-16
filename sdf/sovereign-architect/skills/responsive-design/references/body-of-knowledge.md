# Body of Knowledge: Responsive Design

## 1. Fluid Typography with clamp()

The `clamp(min, preferred, max)` function creates typography that scales
linearly between viewport sizes without breakpoints.

### Formula

```
preferred = calc(Vmin + (Vmax - Vmin) * ((100vw - BPmin) / (BPmax - BPmin)))

Where:
  Vmin = font size at minimum viewport (BPmin)
  Vmax = font size at maximum viewport (BPmax)
  BPmin = minimum viewport (e.g. 320px)
  BPmax = maximum viewport (e.g. 1280px)
```

### Production Type Scale

```css
:root {
  /* Fluid type scale — scales linearly 320px to 1280px viewport */
  --text-xs:   clamp(0.75rem,  0.71rem + 0.18vw, 0.875rem);
  --text-sm:   clamp(0.875rem, 0.83rem + 0.22vw, 1rem);
  --text-base: clamp(1rem,     0.95rem + 0.24vw, 1.125rem);
  --text-lg:   clamp(1.125rem, 1.07rem + 0.29vw, 1.25rem);
  --text-xl:   clamp(1.25rem,  1.19rem + 0.31vw, 1.5rem);
  --text-2xl:  clamp(1.5rem,   1.41rem + 0.46vw, 1.875rem);
  --text-3xl:  clamp(1.875rem, 1.72rem + 0.78vw, 2.5rem);
  --text-4xl:  clamp(2.25rem,  2.02rem + 1.14vw, 3.375rem);
  --text-5xl:  clamp(3rem,     2.7rem  + 1.5vw,  4.5rem);
}
```

### Line Height and Measure

```css
/* Unitless line-height prevents inheritance issues */
body    { line-height: 1.6; }
h1, h2  { line-height: 1.1; }
h3, h4  { line-height: 1.3; }

/* Optimal reading width: 60-75 characters */
.prose { max-width: 68ch; }
```

---

## 2. Container Queries — Complete Reference

Browser support: Chrome 105+, Firefox 110+, Safari 16+ (baseline 2023).

### Container Types

```css
.wrapper {
  /* inline-size: responds to width changes (most common) */
  container-type: inline-size;

  /* size: responds to both width and height */
  container-type: size;

  /* style: responds to CSS custom property values (newer) */
  container-type: style;
}
```

### Named Containers

```css
/* Name enables targeting specific ancestor */
.sidebar { container-type: inline-size; container-name: sidebar; }
.article { container-type: inline-size; container-name: article; }

@container sidebar (max-width: 280px) {
  .card { font-size: var(--text-sm); }
}

@container article (min-width: 700px) {
  .card { display: grid; grid-template-columns: 200px 1fr; }
}
```

### Container Query Units

| Unit | Meaning |
|------|---------|
| `cqw` | 1% of container width |
| `cqh` | 1% of container height |
| `cqi` | 1% of container inline size |
| `cqb` | 1% of container block size |
| `cqmin` | Smaller of cqi or cqb |
| `cqmax` | Larger of cqi or cqb |

```css
.card-title {
  /* Scales with container, not viewport */
  font-size: clamp(1rem, 4cqi, 1.5rem);
}
```

### Style Container Queries

```css
/* Component reacts to token values set by parent context */
@container style(--variant: compact) {
  .card { padding: var(--space-2); }
}

@container style(--variant: expanded) {
  .card { padding: var(--space-8); }
}
```

---

## 3. Breakpoint Strategy

### Mobile-First Implementation

```css
/* DEFAULT: Mobile styles (320px+) */
.grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: var(--space-4);
}

/* sm: 640px+ */
@media (min-width: 40rem) {
  .grid { grid-template-columns: repeat(2, 1fr); }
}

/* lg: 1024px+ */
@media (min-width: 64rem) {
  .grid { grid-template-columns: repeat(3, 1fr); }
}

/* xl: 1280px+ */
@media (min-width: 80rem) {
  .grid { grid-template-columns: repeat(4, 1fr); }
}
```

### Content-Driven Breakpoint (No Specific Pixel Value)

```css
/* Grid that needs no breakpoints at all */
.auto-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(min(300px, 100%), 1fr));
  gap: var(--space-4);
}
/* Items are min 300px wide. When container < 300px, single column.
   No breakpoints. Works in any context. */
```

---

## 4. Responsive Images

### `srcset` + `sizes` Pattern

```html
<!-- Standard responsive image -->
<img
  srcset="
    /img/hero-480.webp   480w,
    /img/hero-800.webp   800w,
    /img/hero-1200.webp 1200w,
    /img/hero-1600.webp 1600w
  "
  sizes="
    (max-width: 480px) 100vw,
    (max-width: 768px) 100vw,
    (max-width: 1200px) 50vw,
    800px
  "
  src="/img/hero-800.webp"
  alt="Descriptive text"
  width="800"
  height="600"
  loading="lazy"
  decoding="async"
>

<!-- LCP image: eager, high priority, no lazy -->
<img
  srcset="/img/hero-800.webp 800w, /img/hero-1600.webp 1600w"
  sizes="100vw"
  src="/img/hero-800.webp"
  alt="Hero"
  width="1600"
  height="900"
  loading="eager"
  fetchpriority="high"
>
```

### `<picture>` for Art Direction

```html
<picture>
  <!-- Mobile: square crop -->
  <source
    media="(max-width: 640px)"
    srcset="/img/hero-mobile-400.webp 400w, /img/hero-mobile-800.webp 800w"
    sizes="100vw"
  >
  <!-- Desktop: wide crop -->
  <source
    media="(min-width: 641px)"
    srcset="/img/hero-desktop-800.webp 800w, /img/hero-desktop-1600.webp 1600w"
    sizes="(max-width: 1280px) 100vw, 1280px"
  >
  <img src="/img/hero-desktop-800.webp" alt="Hero" width="1600" height="900">
</picture>
```

### Image Aspect Ratio — Prevent CLS

```css
/* Always reserve space before image loads */
.card-image-wrapper {
  aspect-ratio: 16 / 9;
  overflow: hidden;
}

.card-image-wrapper img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
```

---

## 5. Layout Patterns (No-Breakpoint Techniques)

### RAM Pattern (Repeat, Auto, Minmax)

```css
.ram-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(min(250px, 100%), 1fr));
}
/* min(250px, 100%) prevents overflow on very small containers */
```

### Intrinsic Sidebar Layout

```css
.with-sidebar {
  display: flex;
  flex-wrap: wrap;
  gap: var(--space-4);
}

.sidebar { flex-basis: 20rem; flex-grow: 1; }
.main-content { flex-basis: 0; flex-grow: 999; min-width: 50%; }
/* When total < threshold, sidebar wraps below main — no media query needed */
```

### Full-Bleed Layout

```css
/* Grid-based full-bleed: allows some elements to break out of content column */
.page-layout {
  display: grid;
  grid-template-columns:
    [full-start] minmax(var(--space-4), 1fr)
    [content-start] min(65ch, 100% - var(--space-8))
    [content-end] minmax(var(--space-4), 1fr) [full-end];
}

.page-layout > * { grid-column: content; }
.full-bleed     { grid-column: full; }
```

---

## 6. CSS Logical Properties

Use logical properties for better RTL/LTR support and future-proofing.

```css
/* Instead of: */
margin-left: auto; margin-right: auto; padding-left: 1rem; padding-right: 1rem;

/* Use: */
margin-inline: auto;
padding-inline: 1rem;

/* Mapping: */
/* top/bottom → block-start / block-end */
/* left/right → inline-start / inline-end */

.component {
  margin-block: var(--space-4);   /* top + bottom */
  padding-inline: var(--space-6); /* left + right */
  border-block-end: 1px solid var(--color-border); /* bottom border */
  inset-inline-start: 0; /* left in LTR, right in RTL */
}
```

---

## 7. Testing Responsive Designs

### Playwright Viewport Test

```ts
import { test, expect } from '@playwright/test';

const viewports = [
  { width: 320,  height: 568,  label: 'mobile-xs' },
  { width: 375,  height: 812,  label: 'mobile-md' },
  { width: 768,  height: 1024, label: 'tablet' },
  { width: 1024, height: 768,  label: 'laptop' },
  { width: 1440, height: 900,  label: 'desktop' },
];

for (const viewport of viewports) {
  test(`homepage renders correctly at ${viewport.label}`, async ({ page }) => {
    await page.setViewportSize({ width: viewport.width, height: viewport.height });
    await page.goto('/');
    await expect(page).toHaveScreenshot(`homepage-${viewport.label}.png`);

    // No horizontal scroll
    const scrollWidth = await page.evaluate(() => document.documentElement.scrollWidth);
    expect(scrollWidth).toBeLessThanOrEqual(viewport.width);
  });
}
```

---

## 8. User Preference Media Queries

```css
/* Reduce motion for vestibular disorders */
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}

/* High contrast mode (Windows) */
@media (forced-colors: active) {
  .badge {
    /* forced-colors removes background colors — add a border fallback */
    border: 2px solid ButtonText;
  }
}

/* Print styles */
@media print {
  nav, .sidebar, .ads { display: none; }
  a::after { content: " (" attr(href) ")"; }
  body { font-size: 12pt; }
}
```

---

## 9. Touch Target Guidelines

```css
/* WCAG 2.5.8: minimum 24x24px target area */
/* WCAG 2.5.5 (AAA): minimum 44x44px */
.touch-target {
  min-width: 44px;
  min-height: 44px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
}

/* For icon-only buttons: expand click area without visual change */
.icon-button {
  position: relative;
  padding: 0.5rem; /* adds visible padding */
}

/* Or use pseudo-element to expand hit area */
.icon-button::before {
  content: '';
  position: absolute;
  inset: -8px; /* expands hit area by 8px on all sides */
}
```
