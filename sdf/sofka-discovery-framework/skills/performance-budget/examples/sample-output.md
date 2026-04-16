# Performance Budget — Sample Output

## Context
Defining performance budgets for a SaaS product with a React frontend, Node.js API, and PostgreSQL database. Target: improve user experience for customers in Latin America on mid-range devices.

## Output

### Core Web Vitals Budget

| Page | LCP Target | INP Target | CLS Target | Current LCP | Status |
|------|-----------|-----------|-----------|-------------|--------|
| Landing | < 2.0s | < 150ms | < 0.05 | 3.2s | Over budget |
| Dashboard | < 2.5s | < 200ms | < 0.1 | 4.1s | Over budget |
| Settings | < 2.0s | < 100ms | < 0.05 | 1.8s | Within budget |
| Reports | < 3.0s | < 200ms | < 0.1 | 5.5s | Over budget |

### Bundle Size Budget

| Category | Budget (gzipped) | Current | Status | Action |
|----------|-----------------|---------|--------|--------|
| Framework (React + Router) | 45 KB | 42 KB | OK | Monitor for upgrades |
| Vendor libraries | 60 KB | 95 KB | OVER | Audit: replace moment.js, lodash |
| Application code (initial) | 40 KB | 38 KB | OK | Enforce code splitting |
| Application code (per-route) | 30 KB max | 52 KB (reports) | OVER | Split report chart library |
| CSS | 15 KB | 22 KB | OVER | Purge unused styles |
| Fonts | 20 KB | 18 KB | OK | Subset fonts, woff2 only |
| **Total initial load** | **180 KB** | **215 KB** | **OVER** | **Target: -35 KB** |

### API Latency Budget

| Endpoint Group | p50 | p95 | p99 | Current p99 | Gate |
|---------------|-----|-----|-----|-------------|------|
| Auth (login, token refresh) | 50ms | 150ms | 300ms | 280ms | CI |
| CRUD (users, projects, tasks) | 30ms | 100ms | 200ms | 180ms | CI |
| Search | 100ms | 300ms | 500ms | 450ms | CI |
| Reports (aggregation) | 200ms | 800ms | 2000ms | 3500ms | Monitor |
| File upload | 100ms | 500ms | 1500ms | 1200ms | Monitor |

### CI Regression Gates

```yaml
# .github/workflows/performance.yml
performance-gates:
  bundle-size:
    tool: size-limit
    limits:
      - path: "dist/main.*.js"
        limit: "180 KB"
        gzip: true
    action: fail_pr  # Block merge if over budget

  lighthouse:
    tool: lighthouse-ci
    assertions:
      largest-contentful-paint: ["error", {"maxNumericValue": 2500}]
      interactive: ["error", {"maxNumericValue": 3500}]
      cumulative-layout-shift: ["error", {"maxNumericValue": 0.1}]
    action: fail_pr

  api-latency:
    tool: k6
    thresholds:
      http_req_duration_p99: ["< 500"]
    action: warn_pr  # Warning, not blocking (baseline still being established)
```

### Optimization Roadmap

| Priority | Action | Expected Impact | Effort |
|----------|--------|----------------|--------|
| P0 | Replace Moment.js with date-fns | -35 KB gzipped | 1 day |
| P0 | Code-split report charts (lazy load) | -22 KB initial, LCP -0.8s | 2 days |
| P1 | Purge unused CSS (PurgeCSS) | -7 KB | 0.5 day |
| P1 | Image optimization pipeline (WebP + lazy) | CLS improvement, -200 KB total | 2 days |
| P2 | Server-side render landing page | LCP -1.2s | 1 week |

### Evidence Tags
- Current metrics: `[CODIGO]` — measured via Lighthouse CI and Datadog APM.
- Targets: `[INFERENCIA]` — based on Google CWV "Good" thresholds and user demographics.
- Optimization estimates: `[SUPUESTO]` — validated against similar projects.
