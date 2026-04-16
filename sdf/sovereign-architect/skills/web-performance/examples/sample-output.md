# Web Performance Audit — BrightCart E-Commerce

**Date**: 2026-03-18 | **URL**: https://brightcart.example.com | **Profile**: Mobile, 4x CPU, Slow 4G

---

## TL;DR

LCP: 5.8s (Poor) | INP: 420ms (Needs Improvement) | CLS: 0.22 (Needs Improvement)

Primary issues: LCP image is lazy-loaded (critical fix), main JS bundle is 1.2 MB (splitting needed),
dynamic ads cause CLS. Estimated post-fix scores: LCP 2.1s, INP 160ms, CLS 0.08.

---

## Baseline Measurements [HECHO]

| Metric | Measured | Target | Status |
|--------|----------|--------|--------|
| LCP | 5.8s | ≤ 2.5s | Poor |
| INP | 420ms | ≤ 200ms | Needs Improvement |
| CLS | 0.22 | ≤ 0.1 | Needs Improvement |
| TTFB | 1.2s | ≤ 0.8s | Needs Improvement |
| FCP | 3.1s | ≤ 1.8s | Needs Improvement |
| Total JS | 1,240 KB | ≤ 500 KB | Exceeds budget |
| Total CSS | 180 KB | ≤ 100 KB | Exceeds budget |

*Source: Lighthouse 12.0, Mobile preset, run 2026-03-18 14:32 UTC*

---

## LCP Analysis [HECHO]

**LCP Element**: `<img class="hero-banner" src="/images/hero-spring.jpg">`

**Root Cause Chain**:
1. Image has `loading="lazy"` — browser preload scanner cannot discover it
2. Image is not in `srcset` — serving 1.8 MB JPEG on mobile
3. No `<link rel="preload">` in `<head>`
4. No `fetchpriority="high"` attribute

**Fix**:

```html
<!-- Before (broken): -->
<img
  src="/images/hero-spring.jpg"
  class="hero-banner"
  loading="lazy"
>

<!-- After (fixed): -->
<img
  srcset="/images/hero-spring-480.webp 480w,
          /images/hero-spring-800.webp 800w,
          /images/hero-spring-1200.webp 1200w"
  sizes="100vw"
  src="/images/hero-spring-800.webp"
  alt="Spring sale — up to 50% off"
  width="1200"
  height="630"
  loading="eager"
  fetchpriority="high"
>
```

```html
<!-- Add to <head>: -->
<link rel="preload" as="image" href="/images/hero-spring-800.webp" fetchpriority="high">
```

**Expected LCP improvement**: 5.8s → ~2.1s [INFERENCIA — based on image size reduction and preload]

---

## INP Analysis [HECHO]

**Long task found**: `ProductFilter.handleFilterChange` — 380ms task on category page filter interaction

**Profiling evidence** (Chrome DevTools Performance panel):
```
Task: 380ms total
  - React re-render: 180ms (1,247 product components)
  - Sort algorithm: 140ms (bubble sort on 1,247 items — O(n²))
  - DOM update: 60ms
```

**Fixes**:

1. **Virtualize the product list** (highest impact):
```tsx
import { useVirtualizer } from '@tanstack/react-virtual';
// Renders only ~20 visible items instead of 1,247
```

2. **Replace sort algorithm**:
```ts
// Before: custom bubble sort O(n²) — 140ms for 1247 items
products.sort(bubbleSort);

// After: native Array.sort O(n log n) — < 5ms for 1247 items
products.sort((a, b) => a.price - b.price);
```

3. **Break up React re-render with scheduler.yield()**:
```ts
import { startTransition } from 'react';
startTransition(() => setFilteredProducts(filtered)); // marks as non-urgent
```

**Expected INP improvement**: 420ms → ~120ms [INFERENCIA]

---

## CLS Analysis [HECHO]

**Shift sources identified**:

1. **Ad slot (score contribution: 0.14)** — `<div class="ad-sidebar">` has no reserved height
2. **Product images (score contribution: 0.06)** — 23 `<img>` without `width`/`height` attributes
3. **Web font swap (score contribution: 0.02)** — Inter font causes 1-frame reflow

**Fixes**:

```css
/* Fix 1: Reserve ad slot space */
.ad-sidebar {
  min-height: 250px; /* Standard banner height */
  min-width: 300px;
}
```

```html
<!-- Fix 2: Add dimensions to all product images -->
<img src="product.jpg" width="400" height="400" alt="Product name">
```

```css
/* Fix 3: Prevent font layout shift */
@font-face {
  font-family: 'Inter';
  src: url('/fonts/inter.woff2') format('woff2');
  font-display: optional; /* Don't use fallback — prevents swap */
}
```

**Expected CLS improvement**: 0.22 → ~0.04 [INFERENCIA]

---

## Bundle Analysis [HECHO]

**Bundle composition** (from webpack-bundle-analyzer):

| Chunk | Size (uncompressed) | Issue |
|-------|---------------------|-------|
| main.js | 680 KB | Contains all routes + components |
| vendor.js | 560 KB | moment.js (67 KB), lodash (71 KB), full react-icons |
| Total | 1,240 KB | 3.2s parse/execute on mobile |

**Dependencies to replace**:

| Current | Replacement | Savings |
|---------|-------------|---------|
| moment.js 67 KB | date-fns named imports ~5 KB | 62 KB |
| lodash 71 KB | native ES2025 | 71 KB |
| react-icons (all) | import only used icons | ~40 KB |

**Code splitting needed**:
- `/dashboard` — 180 KB not needed on landing page
- `/checkout` — 95 KB payment form only needed at checkout
- `<ProductReviews>` — 45 KB only needed when reviews tab is open

**Implementation**:

```tsx
// Before: all routes in main bundle
import Dashboard from './pages/Dashboard';
import Checkout from './pages/Checkout';

// After: code split at route level
const Dashboard = lazy(() => import('./pages/Dashboard'));
const Checkout  = lazy(() => import('./pages/Checkout'));
```

**Expected bundle after fixes**: 1,240 KB → ~340 KB (73% reduction) [INFERENCIA]

---

## Remediation Plan

| Priority | Fix | Effort | CWV Impact |
|----------|-----|--------|-----------|
| P1 | Remove lazy from LCP image + preload | 30 min | LCP: -3.7s |
| P1 | Add image dimensions to 23 product images | 2 hours | CLS: -0.06 |
| P1 | Add min-height to ad slot | 15 min | CLS: -0.14 |
| P2 | Virtualize product list | 1 day | INP: -220ms |
| P2 | Replace moment.js with date-fns | 4 hours | Bundle: -62 KB |
| P2 | Route-based code splitting | 1 day | Bundle: -580 KB |
| P3 | Service worker caching | 2 days | Repeat visit: instant |
| P3 | TTFB reduction via CDN | 0.5 days | TTFB: -0.4s |

**Total P1 effort**: 3 hours → CWV scores reach "Good" for CLS + LCP
**Total P2 effort**: 2.5 days → INP reaches "Good"

---

## Verification Plan

1. Re-run Lighthouse after P1 fixes — verify LCP < 2.5s
2. Re-run DevTools profile after virtualization — verify INP < 200ms
3. Re-run bundle analysis after splits — verify < 400 KB initial JS
4. Add `web-vitals` snippet to production for real user monitoring
5. Set up Lighthouse CI in GitHub Actions with performance budget
