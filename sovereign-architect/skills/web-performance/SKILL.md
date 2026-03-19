---
name: web-performance
author: "Javier Montaño (JM Labs)"
version: "2.0.0"
description: >
  Audit and optimize Core Web Vitals (LCP, INP, CLS), bundle size, loading strategy,
  and rendering pipeline. Use when user asks to "optimize performance", "improve Core Web Vitals",
  "reduce bundle size", or "fix slow page load".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
tags: [core-web-vitals, LCP, INP, CLS, bundle-analysis, lazy-loading, code-splitting]
moat-level: L3
---

# Web Performance

Systematically measure, diagnose, and optimize web application performance across
loading, interactivity, and visual stability dimensions.

## Guiding Principle

> *"Optimize what you measure, measure what matters to users.
> Core Web Vitals are user-experience metrics first, technical metrics second."*

---

## Procedure

### Step 1 — Baseline Measurement [HECHO]

1. Run Chrome Lighthouse (mobile preset, 4x CPU throttle, Slow 4G network) on production URL.
2. Record CWV scores: LCP, INP, CLS — note actual values, not just Pass/Fail.
3. Run `web-vitals` JS library in production with real user monitoring (RUM):
   ```js
   import { onLCP, onINP, onCLS } from 'web-vitals';
   onLCP(console.log); onINP(console.log); onCLS(console.log);
   ```
4. Check PageSpeed Insights for field data (CrUX — real users, 28-day rolling).
5. Profile bundle: `npx webpack-bundle-analyzer dist/stats.json` or Vite's `--analyze`.
6. Tag all measurements as `[HECHO]` with timestamp and test conditions.

**CWV Thresholds (Good / Needs Improvement / Poor):**

| Metric | Good | Needs Improvement | Poor |
|--------|------|-------------------|------|
| LCP (Largest Contentful Paint) | ≤ 2.5s | 2.5–4.0s | > 4.0s |
| INP (Interaction to Next Paint) | ≤ 200ms | 200–500ms | > 500ms |
| CLS (Cumulative Layout Shift) | ≤ 0.1 | 0.1–0.25 | > 0.25 |
| TTFB (Time to First Byte) | ≤ 800ms | 800–1800ms | > 1800ms |
| FCP (First Contentful Paint) | ≤ 1.8s | 1.8–3.0s | > 3.0s |

### Step 2 — LCP Optimization

1. **Identify the LCP element**: Lighthouse "LCP element" row shows which DOM node.
2. **Eliminate render-blocking resources** above the LCP element:
   - Move non-critical CSS to `<link rel="preload" as="style">`
   - Remove render-blocking scripts from `<head>`
3. **Preload the LCP resource**:
   ```html
   <link rel="preload" as="image" href="/hero.webp" fetchpriority="high">
   ```
4. **Remove `loading="lazy"` from LCP image** — it delays discovery.
5. **Optimize LCP image**: compress to WebP/AVIF, serve correct size via `srcset`.
6. **Reduce TTFB**: upgrade hosting, add CDN, enable HTTP/3, implement server-side caching.
7. **Inline critical CSS** for above-fold content (< 14 KB gzipped).

### Step 3 — INP Reduction

1. **Profile interactions**: Chrome DevTools Performance panel → Record → Click/type → look for long tasks.
2. **Break up long tasks**: any task > 50ms blocks the main thread. Use `scheduler.yield()` or `setTimeout(0)`.
3. **Defer non-critical JS**: `<script defer>` or `<script type="module">`.
4. **Reduce JavaScript parse/compile time**: smaller bundles = faster parse.
5. **Virtualize long lists**: use `@tanstack/react-virtual` or similar — never render 1000+ DOM nodes.
6. **Debounce/throttle input handlers**: scroll, resize, mousemove events should never fire sync heavy work.
7. **Move heavy work to Web Workers**: `new Worker('/worker.js')` for CPU-intensive operations.

```js
// Break up long task with scheduler.yield()
async function processLargeDataset(items) {
  for (let i = 0; i < items.length; i++) {
    processItem(items[i]);
    if (i % 50 === 0) await scheduler.yield(); // yield every 50 items
  }
}
```

### Step 4 — CLS Prevention

1. **Set explicit dimensions on images and video**:
   ```html
   <img src="photo.jpg" width="800" height="600" alt="...">
   ```
2. **Reserve space for dynamic content** (ads, embeds, lazy-loaded content):
   ```css
   .ad-slot { min-height: 250px; }
   ```
3. **Avoid inserting content above existing content** except on user interaction.
4. **Use `transform` for animations** instead of `top/left/width/height` — transforms don't trigger layout.
5. **Web fonts**: use `font-display: optional` or `size-adjust` to prevent layout shift from font swap.
6. **Measure CLS by element**: Lighthouse shows contributing elements with their score contribution.

### Step 5 — Bundle Analysis and Code Splitting

1. Generate bundle stats: `vite build --analyze` or `webpack --profile --json > stats.json`.
2. Identify chunks > 100 KB (uncompressed). Investigate each.
3. Implement route-based code splitting:
   ```js
   // React Router / Next.js
   const Dashboard = lazy(() => import('./pages/Dashboard'));
   ```
4. Tree-shake unused exports — ensure all imports use named exports, not `import *`.
5. Replace heavy dependencies with lighter alternatives:
   - `moment.js` → `date-fns` (modular, tree-shakeable)
   - `lodash` → native ES2025 or `lodash-es`
   - `axios` → `fetch` + `ky` for interceptors
6. Implement `modulepreload` for next-likely routes.

### Step 6 — Loading Strategy

1. **Critical path**: HTML → Critical CSS (inline) → Render. Nothing else before first paint.
2. **Resource hints**:
   - `<link rel="preconnect">` for third-party origins (fonts, APIs, CDN)
   - `<link rel="dns-prefetch">` for domains you'll need later
   - `<link rel="preload">` for critical resources needed in < 3 seconds
   - `<link rel="prefetch">` for resources needed on next navigation
3. **Script loading strategy**:
   - `type="module"` — deferred, modern browsers only
   - `defer` — deferred, good for legacy support
   - `async` — for analytics, ads (not render-critical)
4. **Service Worker caching strategy**: Cache-first for static assets, Network-first for API.

### Step 7 — Verification

1. Re-run Lighthouse — compare before/after scores.
2. Check CWV with PageSpeed Insights (field data takes 28 days to update).
3. Run performance budget check in CI: fail build if bundle exceeds threshold.
4. Add `web-vitals` reporting to production monitoring dashboard.

---

## Decision Framework

### What to Optimize First

| LCP > 4s | Fix TTFB, preload LCP image, eliminate render-blocking resources |
|----------|----------------------------------------------------------------|
| INP > 500ms | Profile long tasks, defer JS, virtualize lists |
| CLS > 0.25 | Add dimensions to images, reserve space for dynamic content |
| Bundle > 500KB | Code splitting, tree shaking, dependency audit |
| TTFB > 1800ms | CDN, server caching, Edge rendering, database query optimization |

### Caching Strategy by Resource Type

| Resource | Cache Strategy | Max-Age |
|----------|---------------|---------|
| HTML | No-cache (revalidate) | 0 |
| CSS/JS with hash | Cache-first | 1 year |
| Images | Cache-first | 30 days |
| API responses | Stale-while-revalidate | Per endpoint |
| Fonts | Cache-first | 1 year |

---

## Anti-Patterns

1. **`loading="lazy"` on LCP image** — Delays discovery by the browser's preload scanner. LCP images must be eager.
2. **Inlining all CSS to avoid render-blocking** — Bloats HTML, kills CDN caching. Only inline critical CSS (above-fold).
3. **`preload` everything** — Creates bandwidth contention. Preload only 1-3 critical resources per page.
4. **Synchronous localStorage access in render path** — Blocks the main thread. Move to async storage (IndexedDB) or cache in memory.
5. **`requestAnimationFrame` for non-visual work** — rAF fires at 60fps = every 16ms. Use `setTimeout` or Workers for non-visual tasks.
6. **Optimizing lab score, ignoring field data** — Lighthouse is synthetic. CrUX field data represents real users. Both matter.
7. **Ignoring third-party script impact** — Tag managers, chat widgets, and ads regularly contribute 1-2s to LCP. Audit and lazy-load.

---

## Output Artifacts

- `performance-audit-{date}.md` — Baseline measurement report
- `performance-budget.json` — Bundle size and CWV thresholds for CI
- `src/workers/heavy-task.worker.ts` — Web Worker for CPU-intensive work
- `ADR-PERF-001.md` — Performance architecture decisions
