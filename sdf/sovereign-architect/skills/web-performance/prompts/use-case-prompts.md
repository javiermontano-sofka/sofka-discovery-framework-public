# Use Case Prompts — Web Performance

## Scenario 1: Core Web Vitals Remediation

```
The production application at {URL} has the following Core Web Vitals scores:
- LCP: 4.2s (Poor — target ≤ 2.5s)
- INP: 380ms (Needs Improvement — target ≤ 200ms)
- CLS: 0.18 (Needs Improvement — target ≤ 0.1)

Conduct a systematic audit and produce a remediation plan.

Step 1 — Run Lighthouse on mobile preset, capture full report.
Step 2 — Identify LCP element and trace its load path.
Step 3 — Profile a click interaction in DevTools Performance panel, identify long tasks.
Step 4 — Identify CLS contributors from Lighthouse "Avoid large layout shifts".

For each metric, deliver:
1. Root cause analysis with evidence [HECHO from Lighthouse/DevTools]
2. Specific code changes required (with diffs if possible)
3. Expected improvement after fix [INFERENCIA with calculation]
4. Verification method

Priority order: LCP → CLS → INP (LCP has highest SEO impact).
```

## Scenario 2: Bundle Size Optimization

```
The React application at {PROJECT_PATH} has a main bundle of 820 KB (uncompressed).
Initial JS parse + execute time is 3.2s on mobile.

Analyze the bundle and produce a code splitting plan.

Step 1 — Generate bundle analysis:
  npm run build -- --analyze  (or npx vite-bundle-visualizer)

Step 2 — From the output, identify:
  - All chunks > 100 KB uncompressed [HECHO]
  - Dependencies appearing in multiple chunks (duplication) [HECHO]
  - Heavy libraries (moment, lodash, chart.js) [HECHO]

Step 3 — Design code splitting strategy:
  - Which routes should be lazy-loaded?
  - Which heavy components should be split to on-demand?
  - Which vendor chunks should be separated?

Step 4 — Implement top 3 highest-impact splits with React.lazy() + Suspense.

Step 5 — Define performance budget in performance-budget.json:
  - Main bundle: max 200 KB
  - Total JS: max 500 KB
  - Route chunks: max 100 KB each

Target: < 200 KB initial JS bundle.
```

## Scenario 3: Service Worker Caching Strategy

```
The Progressive Web App at {PROJECT_PATH} has no service worker.
Users complain about slow repeat visits and no offline capability.

Design and implement a Workbox-based caching strategy.

Step 1 — Audit resource types:
  - Static assets (CSS, JS, fonts) — list with sizes [HECHO]
  - Images — list with sizes and update frequency [HECHO]
  - API endpoints — list with data freshness requirements [INFERENCIA]

Step 2 — Design caching strategy per resource type:
  - Static assets (hashed): Cache-first, 1 year
  - Images: Stale-while-revalidate, 30 days
  - API responses: Network-first, configurable TTL per endpoint
  - HTML pages: Network-first with cache fallback

Step 3 — Implement service worker using Workbox 7:
  - workbox-routing + workbox-strategies
  - ExpirationPlugin for cache size limits
  - BackgroundSyncPlugin for offline form submissions

Step 4 — Add sw registration to main entry:
  - Register only in production
  - Handle update prompts gracefully

Step 5 — Test offline scenario with DevTools → Application → Service Workers → Offline.
```

## Scenario 4: Long Task Elimination (INP Fix)

```
The dashboard at {PROJECT_PATH} has INP = 650ms (Poor).
Users report the app feels sluggish after typing in search fields.

Profile and eliminate the long tasks causing poor INP.

Step 1 — Setup PerformanceObserver to log long tasks in development:
  Add the observer snippet from the body of knowledge to the app entry point.

Step 2 — Profile in Chrome DevTools:
  - Open Performance panel, set 6x CPU throttle
  - Type in the search field
  - Record the interaction
  - Identify tasks > 50ms in the main thread

Step 3 — For the top 3 long tasks identified:
  - What code causes the long task? [HECHO]
  - Can it be moved to a Web Worker? [INFERENCIA]
  - Can it be broken up with scheduler.yield()? [INFERENCIA]

Step 4 — Implement the fix for the longest task.

Step 5 — Re-measure INP after fix using web-vitals library in browser console.

Target: INP ≤ 200ms (Good threshold).
```

## Scenario 5: Performance Budget CI Setup

```
Set up performance budget enforcement in CI for the application at {PROJECT_PATH}.

The team wants to prevent performance regressions from being merged.

Step 1 — Measure current baseline:
  - Run Lighthouse on main branch, record all CWV scores [HECHO]
  - Run bundle analysis, record chunk sizes [HECHO]

Step 2 — Define budgets (conservative: 10% slack from baseline):
  - LCP: current + 10% (but never above 2.5s Good threshold)
  - Bundle sizes: current + 10%
  - Total JS: current + 10%

Step 3 — Implement CI performance gate:
  Option A: Lighthouse CI (free, integrates with GitHub Actions)
  Option B: performance-budget.json + bundlesize npm package
  Recommend based on {PROJECT_PATH} CI setup [INFERENCIA]

Step 4 — Write GitHub Actions workflow:
  - Build production bundle
  - Run Lighthouse CI against preview deployment
  - Fail PR if budgets exceeded

Step 5 — Set up failure notifications:
  - Comment on PR with before/after comparison
  - Block merge if critical metrics regress
```
