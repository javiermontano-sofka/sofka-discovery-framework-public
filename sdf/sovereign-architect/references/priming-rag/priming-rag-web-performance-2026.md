# Priming-RAG: Web Performance 2026
> Sovereign Architect — Web performance knowledge for RAG consumption
> Generated: 2026-03-18 | Version: v1.0

---

## Executive Summary
- Core Web Vitals: LCP < 2.5s, INP < 200ms, CLS < 0.1 [HECHO]
- INP (Interaction to Next Paint) replaced FID in March 2024 [HECHO]
- Speculation Rules API for instant page transitions [HECHO]
- View Transitions API for smooth SPA-like navigation [HECHO]
- Partytown for offloading third-party scripts to web workers [HECHO]

## Key Patterns

### LCP Optimization
- Preload critical images: `<link rel="preload" as="image">` [HECHO]
- Serve responsive images with srcset and sizes [HECHO]
- Minimize render-blocking CSS (inline critical path) [HECHO]
- Use CDN for static assets [HECHO]

### INP Optimization
- Break long tasks with `scheduler.yield()` [HECHO]
- Use `requestIdleCallback` for non-critical work [HECHO]
- Virtualize long lists (react-window, tanstack-virtual) [HECHO]
- Debounce rapid input handlers [HECHO]

### Bundle Optimization
- Code splitting with dynamic import() [HECHO]
- Tree-shaking requires ESM (no CommonJS barrel exports) [HECHO]
- Analyze with `npx vite-bundle-visualizer` or webpack-bundle-analyzer [HECHO]
- Target: main bundle < 150KB gzipped [INFERENCIA]

### Speculation Rules
- `<script type="speculationrules">` for prerendering [HECHO]
- Prerender visible links on hover or viewport entry [HECHO]
- Near-instant page loads for anticipated navigation [HECHO]

## Anti-Patterns
- Loading all JavaScript upfront (no code splitting) [HECHO]
- Barrel exports causing tree-shaking failures [HECHO]
- Unoptimized images (no lazy loading, no responsive) [HECHO]
- Third-party scripts blocking main thread [HECHO]

## Query Hooks
- "How to improve LCP?" → Preload hero image, inline critical CSS, use CDN
- "How to optimize INP?" → Break long tasks, yield to main thread, virtualize lists
