# State of the Art: Web Performance (2025–2026)

## Core Web Vitals — Changes in 2024–2025

### INP Replaced FID (March 12, 2024)
- First Input Delay (FID) measured only delay before first interaction
- Interaction to Next Paint (INP) measures the worst interaction in the whole session
- Target: ≤ 200ms Good, 200–500ms Needs Improvement, > 500ms Poor
- This change raised the bar significantly — many sites that passed CWV now fail

### TTFB Added to CWV Recommendations (2024)
- While not an official CWV metric, Google PageSpeed now prominently features TTFB
- Target ≤ 800ms for Good
- Edge rendering (Vercel, Cloudflare Workers) is the primary solution for slow TTFB

---

## New Browser APIs (2024–2025)

### `scheduler.yield()` — Chrome 115+ (2024)
- Browser-native way to yield main thread to handle input events
- More reliable than `setTimeout(0)` — actually yields between tasks:
  ```js
  // Processes 10,000 items while remaining responsive to user input
  for (let i = 0; i < items.length; i++) {
    processItem(items[i]);
    if (i % 100 === 0) await scheduler.yield();
  }
  ```
- Polyfill: `await new Promise(resolve => setTimeout(resolve, 0))`

### `scheduler.postTask()` — Chrome 94+ (maturing in 2025)
- Prioritized task scheduling with `background`, `user-visible`, `user-blocking`:
  ```js
  // Low priority background work
  await scheduler.postTask(() => indexContent(), { priority: 'background' });

  // High priority user interaction
  await scheduler.postTask(() => handleClick(), { priority: 'user-blocking' });
  ```

### Speculation Rules API (Prerendering) — Chrome 109+
- Prerender entire pages for instant navigation:
  ```html
  <script type="speculationrules">
  {
    "prerender": [
      { "where": { "href_matches": "/dashboard" }, "eagerness": "eager" },
      { "where": { "selector_matches": ".internal-link" }, "eagerness": "moderate" }
    ]
  }
  </script>
  ```
- Eagerness levels: `immediate`, `eager`, `moderate`, `conservative`
- Google reported 37% improvement in LCP on prerendered pages

### Long Animation Frame (LoAF) API — Chrome 123+
- More detailed than Long Tasks API — shows what caused the long frame:
  ```js
  const observer = new PerformanceObserver((list) => {
    for (const entry of list.getEntries()) {
      console.log({
        duration: entry.duration,
        scripts: entry.scripts.map(s => ({ name: s.invokerType, duration: s.duration }))
      });
    }
  });
  observer.observe({ type: 'long-animation-frame', buffered: true });
  ```

### `fetchpriority` Attribute (Baseline 2023)
- `fetchpriority="high"` on LCP `<img>` or `<link rel="preload">` — critical for LCP
- `fetchpriority="low"` for non-critical images

---

## Build Tool Advances

### Vite 5/6 (2024–2025)
- Rolldown (Rust-based bundler) replacing Rollup internally — 10-100x faster builds
- Native TypeScript with `moduleResolution: bundler`
- Environment API for SSR/edge/worker targets

### Rspack / Rsbuild (2024–2025)
- Rust-based webpack-compatible bundler — 5-10x faster than webpack
- Drop-in webpack replacement for existing projects
- Rsbuild: high-level build tool on top of Rspack (like CRA/Vite)

### Turbopack (2025)
- Vercel's Rust bundler — default in Next.js 15
- Incremental computation: only re-builds changed modules
- Cold build + HMR significantly faster than webpack

### Tailwind CSS v4 Lightning CSS Engine
- CSS parsing/transformation in Rust
- ~10x faster than PostCSS-based v3

---

## Image Format Progress

### AVIF Widely Available (Baseline 2022+)
- 30-50% smaller than WebP at same quality
- Chrome 85+, Firefox 93+, Safari 16.1+ — safe to use without WebP fallback for modern apps
- `<picture>` with AVIF + WebP + JPEG fallback for maximum coverage

### WebP Still Relevant
- Baseline universally available
- Better encoding speed than AVIF (for build pipelines)
- Use as fallback layer for AVIF

---

## Edge and Streaming

### Edge Rendering Reduces TTFB
- Vercel Edge Functions, Cloudflare Workers, AWS Lambda@Edge
- HTML generated at CDN node closest to user — < 100ms TTFB achievable
- Trade-off: no Node.js APIs, limited runtime

### React 19 Server Components + Streaming (2025)
- Progressive HTML streaming: users see content before full page renders
- `<Suspense>` boundaries stream in progressively
- Reduces perceived load time without reducing actual data fetching

### HTTP/3 (QUIC) Adoption
- ~35% of web traffic now over HTTP/3 (2025)
- Solves head-of-line blocking from HTTP/2
- CDNs (Cloudflare, Fastly) enable automatically — no code changes needed

---

## Monitoring Evolution

### CrUX API
- Free Google API for real user Core Web Vitals data
- Endpoint: `https://chromeuxreport.googleapis.com/v1/records:queryRecord`
- 28-day rolling window of Chrome user data

### web-vitals Library v4 (2024)
- Attribution build provides detailed breakdown of what caused poor scores
- `onLCP({ attribution: true })` returns element, loadTime, resourceLoadDelay, etc.
- Essential for diagnosing production CWV issues

---

## What to Adopt Now

| Technology | Maturity | Recommendation |
|-----------|----------|---------------|
| `scheduler.yield()` | Chrome 115+ | Use with polyfill for INP |
| Speculation Rules | Chrome 109+ | High-traffic pages with predictable next navigation |
| LoAF API | Chrome 123+ | Replace LongTasks observer |
| AVIF format | Baseline 2022 | Primary image format for new projects |
| Vite/Rspack | Stable | Replace webpack in existing projects |
| Edge rendering | Production-ready | When TTFB > 800ms and data allows |
| HTTP/3 | Via CDN | Enable at CDN level — no code changes |

---

## What's Fading Out

- `document.write()` — blocks parsing, deprecated
- First Input Delay (FID) — replaced by INP
- Unoptimized Google Fonts loading — use `font-display: swap` + self-host
- Loading all lodash — tree-shake or use native ES2025
- Service worker precaching everything — selective caching wins
