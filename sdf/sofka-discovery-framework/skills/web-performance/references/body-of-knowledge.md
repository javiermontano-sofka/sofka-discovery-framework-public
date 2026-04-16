# Body of Knowledge: Web Performance

## 1. Core Web Vitals — Deep Reference

### LCP (Largest Contentful Paint)

Measures perceived load speed — when the largest above-fold element is visible.

**What counts as LCP element:**
- `<img>` elements
- `<image>` inside SVG
- `<video>` poster image
- Block-level elements with background images
- Text blocks (`<p>`, `<h1>`, etc.)

**LCP optimization checklist:**
1. Remove `loading="lazy"` from LCP image — lazy loading delays preload scanner discovery.
2. Add `<link rel="preload" as="image" href="..." fetchpriority="high">` in `<head>`.
3. Use `fetchpriority="high"` on the LCP `<img>` itself.
4. Serve LCP image from same domain or preconnect to CDN.
5. Compress image to target < 200 KB for mobile.
6. Use modern formats: WebP saves ~30%, AVIF saves ~50% vs JPEG.
7. Reduce TTFB: CDN, server caching, Edge SSR.

### INP (Interaction to Next Paint) — Replaced FID in March 2024

Measures responsiveness — the delay between user interaction and the next visual update.

**INP = max of: input delay + processing time + presentation delay**

**Long task diagnosis:**
```js
// Observe long tasks in production
const observer = new PerformanceObserver((list) => {
  for (const entry of list.getEntries()) {
    if (entry.duration > 50) {
      console.log('Long task:', entry.duration, entry.attribution);
    }
  }
});
observer.observe({ type: 'longtask', buffered: true });
```

**scheduler.yield() — Break up long tasks:**
```js
async function runHeavyWork(items) {
  for (let i = 0; i < items.length; i++) {
    processItem(items[i]);
    // Yield to browser every 50 items to handle user input
    if (i % 50 === 0) {
      await scheduler.yield(); // Chrome 115+ / polyfillable
    }
  }
}

// Polyfill for older browsers
function yieldToMain() {
  return new Promise(resolve => setTimeout(resolve, 0));
}
```

### CLS (Cumulative Layout Shift)

Measures visual stability — unexpected layout movement that happens after initial render.

**CLS score = sum of (impact fraction × distance fraction) for unexpected shifts**

**Common CLS sources and fixes:**

| Source | Fix |
|--------|-----|
| Images without dimensions | `width` + `height` attributes always |
| Ads/embeds without space reservation | `min-height` on slot containers |
| Dynamically injected content above fold | Avoid; use `position: absolute` for overlay |
| Web fonts causing text reflow | `font-display: optional` or `size-adjust` |
| Animations on layout properties | Use `transform` instead of `top/left/width/height` |

```css
/* Prevent CLS from font swap */
@font-face {
  font-family: 'Inter';
  src: url('/fonts/inter.woff2') format('woff2');
  font-display: optional; /* Don't use fallback if font not loaded in time */
}

/* Or use size-adjust to match fallback metrics */
@font-face {
  font-family: 'Inter-fallback';
  src: local('Arial');
  ascent-override: 90%;
  descent-override: 22%;
  line-gap-override: 0%;
  size-adjust: 107%;
}
```

---

## 2. Critical Rendering Path

```
HTML parse → DOM tree
CSS parse  → CSSOM tree
DOM + CSSOM → Render tree → Layout → Paint → Composite
```

**Render-blocking resources:**
- CSS in `<head>` blocks rendering until parsed
- Synchronous `<script>` in `<head>` blocks HTML parsing AND rendering

**Elimination strategies:**
```html
<!-- Inline critical CSS (above-fold only, < 14 KB) -->
<style>
  /* Critical CSS: base layout, LCP element, above-fold typography */
</style>

<!-- Load remaining CSS asynchronously -->
<link rel="preload" as="style" href="/styles/main.css"
      onload="this.onload=null;this.rel='stylesheet'">
<noscript><link rel="stylesheet" href="/styles/main.css"></noscript>

<!-- Scripts: defer unless needed for rendering -->
<script src="/app.js" defer></script>
<script src="/analytics.js" async></script>
```

---

## 3. Resource Hints

```html
<!-- Establish early connection (DNS + TCP + TLS) to third-party origins -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://cdn.yourdomain.com" crossorigin>

<!-- DNS prefetch only (lower priority, less invasive) -->
<link rel="dns-prefetch" href="https://analytics.provider.com">

<!-- Preload: fetch critical resource immediately, high priority -->
<!-- Use for: LCP image, critical font, critical CSS, hero JS chunk -->
<link rel="preload" as="image" href="/hero.webp" fetchpriority="high">
<link rel="preload" as="font" href="/fonts/inter.woff2" type="font/woff2" crossorigin>
<link rel="preload" as="script" href="/critical.js">

<!-- Prefetch: low-priority fetch for next navigation -->
<link rel="prefetch" href="/dashboard/bundle.js">

<!-- Modulepreload: prefetch + parse ES module -->
<link rel="modulepreload" href="/src/dashboard.js">
```

---

## 4. Code Splitting Patterns

### Route-Based Splitting (React)

```jsx
import { lazy, Suspense } from 'react';
import { Routes, Route } from 'react-router-dom';

const Dashboard = lazy(() => import('./pages/Dashboard'));
const Settings   = lazy(() => import('./pages/Settings'));
const Reports    = lazy(() => import('./pages/Reports'));

export function App() {
  return (
    <Suspense fallback={<PageSkeleton />}>
      <Routes>
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/settings"  element={<Settings />} />
        <Route path="/reports"   element={<Reports />} />
      </Routes>
    </Suspense>
  );
}
```

### Component-Level Splitting

```jsx
// Split out heavy component (e.g., chart library)
const HeavyChart = lazy(() => import('./components/HeavyChart'));

function ReportPage() {
  const [showChart, setShowChart] = useState(false);
  return (
    <div>
      <button onClick={() => setShowChart(true)}>Show Chart</button>
      {showChart && (
        <Suspense fallback={<ChartSkeleton />}>
          <HeavyChart />
        </Suspense>
      )}
    </div>
  );
}
```

### Vite Dynamic Import with Hint

```js
// Preload on hover for instant-feel navigation
function NavLink({ to, children }) {
  const handleMouseEnter = () => {
    import(/* @vite-prefetch */ `./pages/${to}`);
  };
  return <a href={to} onMouseEnter={handleMouseEnter}>{children}</a>;
}
```

---

## 5. Bundle Optimization

### Tree-Shaking Requirements

```js
// Named exports — tree-shakeable
export function formatDate(date) { /* ... */ }
export function formatCurrency(value) { /* ... */ }

// Default export object — NOT tree-shakeable
export default { formatDate, formatCurrency }; // bundler keeps all
```

### Dependency Replacement Reference

| Heavy | Lightweight Alternative | Size Savings |
|-------|------------------------|-------------|
| moment.js (67 KB gz) | date-fns (tree-shakeable) | ~85% |
| lodash (71 KB gz) | lodash-es or native | ~70-100% |
| axios (13 KB gz) | native fetch | 100% |
| jquery (32 KB gz) | vanilla JS | 100% |
| chart.js (63 KB gz) | uPlot (15 KB) | ~75% |

### Vite Bundle Analysis

```bash
npm i -D rollup-plugin-visualizer
```

```ts
// vite.config.ts
import { visualizer } from 'rollup-plugin-visualizer';
export default {
  plugins: [visualizer({ open: true, gzipSize: true, brotliSize: true })]
};
```

---

## 6. Image Optimization Pipeline

### Sharp (Node.js) — Build-Time Image Processing

```js
import sharp from 'sharp';

async function optimizeImage(input, outputDir) {
  const name = path.basename(input, path.extname(input));

  for (const width of [400, 800, 1200, 1600]) {
    await sharp(input)
      .resize(width)
      .webp({ quality: 80 })
      .toFile(`${outputDir}/${name}-${width}.webp`);
  }

  await sharp(input)
    .resize(800)
    .avif({ quality: 65 })
    .toFile(`${outputDir}/${name}-800.avif`);
}
```

### Next.js Image Component (Built-in Optimization)

```jsx
import Image from 'next/image';

<Image
  src="/hero.jpg"
  width={1200}
  height={630}
  alt="Hero"
  priority
  quality={80}
  sizes="(max-width: 768px) 100vw, 1200px"
/>
```

---

## 7. Service Worker Caching Strategies

```js
// sw.js — Workbox-based caching strategies

import { registerRoute } from 'workbox-routing';
import { CacheFirst, StaleWhileRevalidate, NetworkFirst } from 'workbox-strategies';
import { ExpirationPlugin } from 'workbox-expiration';

// Static assets: Cache-first (versioned URLs)
registerRoute(
  ({ request }) => ['script', 'style', 'font'].includes(request.destination),
  new CacheFirst({
    cacheName: 'static-assets',
    plugins: [new ExpirationPlugin({ maxAgeSeconds: 365 * 24 * 60 * 60 })]
  })
);

// Images: Stale-while-revalidate
registerRoute(
  ({ request }) => request.destination === 'image',
  new StaleWhileRevalidate({
    cacheName: 'images',
    plugins: [new ExpirationPlugin({ maxEntries: 100, maxAgeSeconds: 30 * 24 * 60 * 60 })]
  })
);

// API: Network-first (freshness critical)
registerRoute(
  ({ url }) => url.pathname.startsWith('/api/'),
  new NetworkFirst({
    cacheName: 'api-cache',
    plugins: [new ExpirationPlugin({ maxAgeSeconds: 5 * 60 })]
  })
);
```

---

## 8. Performance Budget Configuration

```json
{
  "budgets": [
    {
      "resourceSizes": [
        { "resourceType": "script",     "budget": 300 },
        { "resourceType": "total",      "budget": 1000 },
        { "resourceType": "image",      "budget": 500 },
        { "resourceType": "stylesheet", "budget": 100 }
      ],
      "resourceCounts": [
        { "resourceType": "third-party", "budget": 10 }
      ],
      "timings": [
        { "metric": "interactive",            "budget": 3000 },
        { "metric": "first-contentful-paint", "budget": 1800 },
        { "metric": "largest-contentful-paint", "budget": 2500 }
      ]
    }
  ]
}
```

---

## 9. Web Workers for CPU-Intensive Work

```ts
// worker.ts
self.addEventListener('message', ({ data }) => {
  const result = heavyComputation(data.input);
  self.postMessage({ result });
});

// main.ts
const worker = new Worker(new URL('./worker.ts', import.meta.url));
worker.postMessage({ input: largeDataset });
worker.onmessage = ({ data }) => updateUI(data.result);
```

---

## 10. Real User Monitoring (RUM)

```ts
// report-vitals.ts
import { onLCP, onINP, onCLS, onFCP, onTTFB } from 'web-vitals';

function sendToAnalytics({ name, value, rating, id, navigationType }) {
  fetch('/analytics', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ metric: name, value, rating, id, navigationType }),
    keepalive: true, // ensures delivery even on page unload
  });
}

onLCP(sendToAnalytics);
onINP(sendToAnalytics);
onCLS(sendToAnalytics);
onFCP(sendToAnalytics);
onTTFB(sendToAnalytics);
```

---

## 11. Virtualization for Long Lists

```tsx
// @tanstack/react-virtual — render only visible rows
import { useVirtualizer } from '@tanstack/react-virtual';

function VirtualList({ items }) {
  const parentRef = useRef(null);

  const virtualizer = useVirtualizer({
    count: items.length,
    getScrollElement: () => parentRef.current,
    estimateSize: () => 50, // estimated row height in px
  });

  return (
    <div ref={parentRef} style={{ height: '600px', overflow: 'auto' }}>
      <div style={{ height: `${virtualizer.getTotalSize()}px`, position: 'relative' }}>
        {virtualizer.getVirtualItems().map(virtualRow => (
          <div
            key={virtualRow.index}
            style={{
              position: 'absolute',
              top: `${virtualRow.start}px`,
              width: '100%',
              height: `${virtualRow.size}px`,
            }}
          >
            {items[virtualRow.index].name}
          </div>
        ))}
      </div>
    </div>
  );
}
```
