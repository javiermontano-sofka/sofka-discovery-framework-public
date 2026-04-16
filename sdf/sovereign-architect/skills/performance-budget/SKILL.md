---
name: performance-budget
author: JM Labs (Javier Montaño)
description: >
  Defines Core Web Vitals targets, latency budgets, bundle size limits, and performance regression gates.
  Trigger: "performance budget", "core web vitals", "bundle size", "latency budget", "performance targets".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Performance Budget

Establishes quantitative performance targets for frontend and backend systems — including Core Web Vitals, API latency budgets, bundle size limits, and CI gates that prevent performance regression.

## Guiding Principle

> *"Performance is a feature. A budget is a commitment. A regression gate is a guarantee."*

## Procedure

### Step 1 — Baseline Current Performance
1. Measure current Core Web Vitals: LCP, FID/INP, CLS for key pages.
2. Profile API latency at p50, p95, p99 for critical endpoints.
3. Audit frontend bundle sizes: total, per-route, vendor vs. application code.
4. Measure Time to Interactive (TTI) and Total Blocking Time (TBT) on target devices.
5. Establish baseline metrics in a shared dashboard for ongoing tracking.

### Step 2 — Define Performance Budgets
1. **Core Web Vitals**: LCP < 2.5s, INP < 200ms, CLS < 0.1 (Google "Good" thresholds as minimum).
2. **API Latency**: Define per-endpoint p99 budgets based on user experience requirements.
3. **Bundle Size**: Total JS < 200KB gzipped for initial load; per-route chunks < 50KB.
4. **Time to Interactive**: < 3.5s on mid-range mobile (Moto G4 equivalent) over 4G.
5. **Image Budgets**: Total image weight per page, format requirements (WebP/AVIF), lazy loading policy.

### Step 3 — Implement Regression Gates
1. Add bundle size checks to CI: fail PR if total bundle exceeds budget by > 5%.
2. Integrate Lighthouse CI for automated Core Web Vitals checks on PRs.
3. Set up API latency regression tests: fail if p99 increases by > 20% from baseline.
4. Configure performance monitoring alerts for production regressions.
5. Create a performance budget dashboard showing trend lines and budget utilization.

### Step 4 — Optimize and Maintain
1. Conduct quarterly performance audits with updated baselines.
2. Review and adjust budgets based on business needs and user demographics.
3. Document optimization techniques applied and their measured impact.
4. Create a performance optimization backlog prioritized by user impact.
5. Tag all budget decisions with evidence and rationale.

## Quality Criteria
- Every critical page has defined Core Web Vitals budgets with measurement methodology.
- Bundle size budgets are enforced in CI with clear pass/fail criteria.
- API latency budgets are per-endpoint with p99 targets.
- Performance regression is detected before code reaches production.

## Anti-Patterns
- Setting performance budgets without measuring the current baseline.
- Measuring only on fast developer machines instead of target user devices.
- Bundle size limits that are never enforced in CI.
- Optimizing for Lighthouse score instead of real user experience.
