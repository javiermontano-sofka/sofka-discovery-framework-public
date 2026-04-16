# Performance Budget — Use Case Prompts

## Prompt 1: E-Commerce Mobile Performance
> Define performance budgets for our e-commerce mobile web experience. Key pages: homepage, product listing, product detail, cart, checkout. Target users: emerging markets on mid-range Android devices with 3G/4G connections. Include Core Web Vitals targets, bundle size limits per route, image budgets, and the CI gates needed to enforce them. Current state: LCP is 4.8s, total JS is 450KB gzipped.

## Prompt 2: API Latency Budgets
> We run a REST API consumed by both a mobile app and a web frontend. Define latency budgets for our 15 most-used endpoints grouped by criticality. Include: p50, p95, and p99 targets, measurement methodology, CI regression gates, and production monitoring alerts. The checkout endpoint must respond in < 300ms p99 because it directly impacts conversion.

## Prompt 3: Dashboard Application
> Our internal analytics dashboard loads 12 chart widgets, each making its own API call. Current TTI is 8 seconds and total transfer size is 2.1MB. Define a performance budget that gets TTI under 4 seconds. Include: bundle splitting strategy, data loading optimization (parallel vs. waterfall), component lazy loading, and image/chart rendering budgets. Provide specific KB limits for each category.
