# Performance Budget — Body of Knowledge

## Core Concepts
- **Performance Budget**: A quantitative limit on metrics that affect user experience — load time, bundle size, request count, image weight.
- **Core Web Vitals (CWV)**: Google's user-centric performance metrics — LCP (loading), INP (interactivity), CLS (visual stability).
- **LCP (Largest Contentful Paint)**: Time until the largest visible element renders. Target: < 2.5 seconds.
- **INP (Interaction to Next Paint)**: Responsiveness to user input. Target: < 200ms.
- **CLS (Cumulative Layout Shift)**: Visual stability — how much the page shifts during load. Target: < 0.1.
- **Time to Interactive (TTI)**: When the page is fully interactive and responds to user input within 50ms.
- **Bundle Budget**: Maximum allowed size for JavaScript, CSS, and font bundles — typically measured gzipped.
- **Latency Budget**: Maximum allowed response time for API calls, broken down by percentile (p50, p95, p99).

## Patterns & Practices
- **Budget Allocation**: Divide the total page weight budget among JS, CSS, images, fonts, and third-party scripts.
- **Code Splitting**: Break application code into route-based chunks loaded on demand to stay within per-route budgets.
- **Tree Shaking**: Remove unused code at build time to reduce bundle size.
- **Image Optimization Pipeline**: Automatic format conversion (WebP/AVIF), resizing, lazy loading, and responsive srcsets.
- **Performance Regression Testing**: Automated checks in CI that compare PR builds against baseline metrics.
- **Real User Monitoring (RUM)**: Measure performance from actual user browsers, not just synthetic tests.

## Tools & Technologies
- **Lighthouse CI**: Automated Lighthouse audits in CI pipelines with budget assertions.
- **Bundlesize / Size-limit**: CI checks that fail if bundle size exceeds configured limits.
- **WebPageTest**: Detailed waterfall analysis and filmstrip comparison for page loads.
- **Calibre / SpeedCurve**: Continuous performance monitoring with budget tracking.
- **Chrome DevTools Performance Panel**: Profiling runtime performance, main thread activity, and layout shifts.
- **k6 / Artillery**: API load testing for latency budget validation under realistic traffic.

## References
- web.dev/vitals — Google's Core Web Vitals documentation and thresholds.
- Tim Kadlec, "Implementing Performance Budgets" — Practical budget implementation strategies.
- Addy Osmani, "The Cost of JavaScript" — Bundle size impact on user experience.
- Alex Russell, "Can You Afford It?" — Real-world performance budgeting for mobile web.
