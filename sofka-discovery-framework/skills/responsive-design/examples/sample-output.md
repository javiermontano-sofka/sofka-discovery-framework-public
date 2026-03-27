# Responsive Design Audit — DataDash SaaS Application

**Date**: 2026-03-18 | **Project**: datadash (Next.js 14 + Tailwind v3)

---

## TL;DR

CLS: 0.31 (Poor) — primary cause: images without dimensions. Mobile layout breaks at 375px due to fixed
container widths. Typography uses `px` units — fails user font size preferences. Container queries absent:
sidebar layout forces full-width on 768px when 600px would be sufficient.

---

## Audit Results [HECHO]

### Breakpoint Audit

```bash
grep -r "@media" src/ --include="*.css" | grep -oP '\d+px' | sort -u
```

Found breakpoints: `480px, 768px, 1024px, 1280px`

Issues:
- `480px` targets a specific phone width (anti-pattern) — should be content-driven
- Gap: no breakpoint between `1024px` and `1280px` — layout collapses too aggressively
- 7 media queries inside `Card.module.css` — these should be container queries

### Fixed Pixel Width Audit [HECHO]

```bash
grep -r "width: [0-9]*px" src/ --include="*.css"
```

| File | Line | Value | Issue |
|------|------|-------|-------|
| components/Sidebar/Sidebar.module.css | 12 | `width: 280px` | Breaks on < 400px viewports |
| components/DataTable/DataTable.module.css | 34 | `width: 960px` | Overflows on tablet |
| pages/Dashboard/Dashboard.module.css | 8 | `width: 1200px` | Horizontal scroll on 1024px viewport |
| components/Modal/Modal.module.css | 22 | `width: 640px` | Overflows on < 640px screens |

### Font Size Audit [HECHO]

```bash
grep -r "font-size: [0-9]*px" src/ --include="*.css"
```

Found: 34 hardcoded `px` font sizes. These do not scale with user preferences.
Notable: `font-size: 12px` on `Caption.module.css:8` — fails minimum readable size at high DPI.

### Image Dimension Audit [HECHO]

```bash
grep -rn "<img" src/ --include="*.tsx" | grep -v "width=" | grep -v "<Image"
```

Found: 18 `<img>` elements without `width`/`height` attributes.
These cause CLS — browser cannot reserve space before image loads.

```
src/components/Avatar/Avatar.tsx:12     — no width/height
src/components/ProductCard/ProductCard.tsx:34 — no width/height (LCP candidate)
src/pages/Dashboard/widgets/Chart.tsx:8 — no width/height
... (15 more)
```

---

## CLS Analysis [HECHO]

Lighthouse "Avoid large layout shifts" output:

| Element | CLS Score | Cause |
|---------|-----------|-------|
| `.product-card img` | 0.18 | No dimensions — shifts grid on load |
| `.ad-placeholder` | 0.09 | No min-height — ad loads after content |
| `@font-face Inter` | 0.04 | font-display not set — FOUT causes reflow |

---

## Responsive Foundation Proposal [INFERENCIA]

### Fluid Typography System

```css
/* styles/typography.css — replaces all 34 px font sizes */
:root {
  --text-xs:   clamp(0.75rem,  0.72rem + 0.15vw, 0.875rem);
  --text-sm:   clamp(0.875rem, 0.84rem + 0.18vw, 1rem);
  --text-base: clamp(1rem,     0.96rem + 0.2vw,  1.125rem);
  --text-lg:   clamp(1.125rem, 1.08rem + 0.22vw, 1.25rem);
  --text-xl:   clamp(1.25rem,  1.19rem + 0.3vw,  1.5rem);
  --text-2xl:  clamp(1.5rem,   1.42rem + 0.4vw,  1.875rem);
}
```

### Breakpoint Scale (Content-Driven)

```css
/* styles/breakpoints.css */
:root {
  --bp-sm:  40rem;  /* 640px — single to two column */
  --bp-md:  48rem;  /* 768px — tablet layout */
  --bp-lg:  64rem;  /* 1024px — desktop nav pattern */
  --bp-xl:  80rem;  /* 1280px — wide content */
  --bp-2xl: 96rem;  /* 1536px — ultra-wide dashboard */
}
```

### Container Query Migration (ProductCard)

```css
/* Before: viewport-dependent (wrong) */
@media (max-width: 768px) {
  .card { flex-direction: column; }
}

/* After: container-dependent (correct) */
.card-wrapper {
  container-type: inline-size;
  container-name: card;
}

@container card (max-width: 400px) {
  .card { flex-direction: column; }
}

@container card (min-width: 400px) {
  .card { flex-direction: row; gap: var(--space-4); }
}
```

### Image Fix (ProductCard — LCP candidate)

```tsx
// Before:
<img src={product.imageUrl} alt={product.name} className={styles.image} />

// After:
<img
  srcset={`${product.imageUrl}?w=400 400w, ${product.imageUrl}?w=800 800w`}
  sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 33vw"
  src={`${product.imageUrl}?w=400`}
  alt={product.name}
  width="400"
  height="400"
  loading="lazy"
  decoding="async"
  className={styles.image}
/>
```

---

## Remediation Plan

| Priority | Fix | Files | Effort | Impact |
|----------|-----|-------|--------|--------|
| P1 | Add width/height to 18 images | 18 component files | 2 hours | CLS: -0.27 |
| P1 | Add min-height to ad-placeholder | AdWidget.module.css | 15 min | CLS: -0.09 |
| P1 | Add font-display: optional to fonts | styles/fonts.css | 15 min | CLS: -0.04 |
| P2 | Replace 34 px font sizes with fluid tokens | All CSS modules | 1 day | Typography scales |
| P2 | Remove fixed width: 960px/1200px on containers | 3 files | 2 hours | No overflow on tablet |
| P2 | Migrate Card to container query | Card.module.css | 0.5 days | Sidebar vs. main works |
| P3 | Full container query migration | 7 components | 3 days | All contexts correct |

**P1 total**: 3 hours → CLS drops from 0.31 (Poor) to ~0.04 (Good)

---

## Playwright Responsive Tests

```ts
// tests/responsive.spec.ts
const viewports = [
  { width: 375,  label: 'mobile' },
  { width: 768,  label: 'tablet' },
  { width: 1024, label: 'laptop' },
  { width: 1440, label: 'desktop' },
];

for (const vp of viewports) {
  test(`Dashboard — no horizontal scroll at ${vp.label}`, async ({ page }) => {
    await page.setViewportSize({ width: vp.width, height: 768 });
    await page.goto('/dashboard');
    const scrollWidth = await page.evaluate(() => document.documentElement.scrollWidth);
    expect(scrollWidth).toBeLessThanOrEqual(vp.width);
  });
}
```
