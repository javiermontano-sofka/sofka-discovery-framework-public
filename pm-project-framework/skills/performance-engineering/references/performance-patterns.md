---
name: performance-patterns
description: HTML templates and visual patterns for performance baselines, load test reports, capacity models, caching diagrams, and SLA dashboards
---

## Performance Engineering Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for performance engineering documentation artifacts.

---

## Design Tokens

**Color Palette:**
```css
--color-primary: #6366F1;        /* Orange — primary actions, highlighted elements */
--color-critical: #DC2626;       /* Red — errors, violations, SLA breaches */
--color-warning: #D97706;        /* Amber — warnings, approaching thresholds */
--color-positive: #22D3EE;       /* Gold — targets met, positive outcomes */
--color-decorative: #42D36F;     /* Green — decorative only, not semantic status */
--color-neutral-light: #F3F4F6;  /* Light gray — backgrounds, borders */
--color-neutral-dark: #1F2937;   /* Dark gray — text, strong contrast */
--color-neutral-border: #D1D5DB; /* Medium gray — structural dividers */
```

---

## Template 1: Performance Baseline Card

**Purpose:** Display current performance metrics with threshold status for a service or endpoint.

**HTML Structure:**
```html
<div class="perf-baseline-card" style="border: 2px solid #6366F1; border-radius: 8px; padding: 20px; margin-bottom: 16px; background: white;">
  <div style="display: flex; justify-content: space-between; align-items: center; padding-bottom: 12px; border-bottom: 1px solid #D1D5DB;">
    <h4 style="margin: 0; color: #1F2937; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;">
      [Endpoint / Service Name]
    </h4>
    <span style="font-size: 12px; background: #D1FAE5; color: #065F46; padding: 4px 8px; border-radius: 4px; font-weight: bold;">
      HEALTHY
      <!-- Options: HEALTHY | DEGRADED (bg: #FEF3C7; color: #92400E) | CRITICAL (bg: #FEE2E2; color: #991B1B) -->
    </span>
  </div>
  <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; margin-top: 16px;">
    <div style="text-align: center;">
      <span style="display: block; font-size: 24px; font-weight: 700; color: #1F2937;">[p50]ms</span>
      <span style="font-size: 11px; color: #6B7280; text-transform: uppercase;">p50 Latency</span>
    </div>
    <div style="text-align: center;">
      <span style="display: block; font-size: 24px; font-weight: 700; color: #1F2937;">[p95]ms</span>
      <span style="font-size: 11px; color: #6B7280; text-transform: uppercase;">p95 Latency</span>
    </div>
    <div style="text-align: center;">
      <span style="display: block; font-size: 24px; font-weight: 700; color: #1F2937;">[p99]ms</span>
      <span style="font-size: 11px; color: #6B7280; text-transform: uppercase;">p99 Latency</span>
    </div>
    <div style="text-align: center;">
      <span style="display: block; font-size: 24px; font-weight: 700; color: #1F2937;">[RPS]</span>
      <span style="font-size: 11px; color: #6B7280; text-transform: uppercase;">Throughput</span>
    </div>
  </div>
  <div style="margin-top: 16px; padding-top: 12px; border-top: 1px solid #D1D5DB;">
    <div style="display: flex; gap: 16px; font-size: 12px; color: #6B7280;">
      <span><strong>CPU:</strong> [X]%</span>
      <span><strong>Memory:</strong> [X]%</span>
      <span><strong>Error Rate:</strong> [X]%</span>
      <span><strong>Saturation:</strong> [queue depth / connection pool]</span>
    </div>
  </div>
</div>
```

---

## Template 2: Load Test Result Summary

**Purpose:** Present load test results with pass/fail status against acceptance criteria.

**HTML Structure:**
```html
<div class="load-test-result" style="border: 1px solid #D1D5DB; border-left: 4px solid #6366F1; padding: 20px; margin-bottom: 24px; background: white; border-radius: 6px;">
  <div style="display: flex; justify-content: space-between; align-items: center; padding-bottom: 12px; border-bottom: 1px solid #D1D5DB;">
    <h3 style="margin: 0; font-size: 18px; color: #1F2937;">[Test Scenario Name]</h3>
    <span style="padding: 4px 8px; border-radius: 4px; font-size: 12px; font-weight: 600; text-transform: uppercase; background: #D1FAE5; color: #065F46;">
      PASS
      <!-- Options: PASS (green) | FAIL (bg: #FEE2E2; color: #991B1B) -->
    </span>
  </div>

  <div style="margin-top: 16px;">
    <table style="width: 100%; border-collapse: collapse; font-size: 13px;">
      <thead>
        <tr style="background: #F3F4F6;">
          <th style="padding: 10px; text-align: left; font-weight: 600; border-bottom: 2px solid #D1D5DB;">Metric</th>
          <th style="padding: 10px; text-align: center; font-weight: 600; border-bottom: 2px solid #D1D5DB;">Target</th>
          <th style="padding: 10px; text-align: center; font-weight: 600; border-bottom: 2px solid #D1D5DB;">Actual</th>
          <th style="padding: 10px; text-align: center; font-weight: 600; border-bottom: 2px solid #D1D5DB;">Status</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td style="padding: 10px; border-bottom: 1px solid #D1D5DB;">p95 Latency</td>
          <td style="padding: 10px; text-align: center; border-bottom: 1px solid #D1D5DB;">&le;200ms</td>
          <td style="padding: 10px; text-align: center; border-bottom: 1px solid #D1D5DB;">[X]ms</td>
          <td style="padding: 10px; text-align: center; border-bottom: 1px solid #D1D5DB; color: #065F46; font-weight: 600;">PASS</td>
        </tr>
        <tr>
          <td style="padding: 10px; border-bottom: 1px solid #D1D5DB;">Error Rate</td>
          <td style="padding: 10px; text-align: center; border-bottom: 1px solid #D1D5DB;">&le;0.1%</td>
          <td style="padding: 10px; text-align: center; border-bottom: 1px solid #D1D5DB;">[X]%</td>
          <td style="padding: 10px; text-align: center; border-bottom: 1px solid #D1D5DB; color: #065F46; font-weight: 600;">PASS</td>
        </tr>
        <tr>
          <td style="padding: 10px; border-bottom: 1px solid #D1D5DB;">Throughput</td>
          <td style="padding: 10px; text-align: center; border-bottom: 1px solid #D1D5DB;">&ge;1000 RPS</td>
          <td style="padding: 10px; text-align: center; border-bottom: 1px solid #D1D5DB;">[X] RPS</td>
          <td style="padding: 10px; text-align: center; border-bottom: 1px solid #D1D5DB; color: #065F46; font-weight: 600;">PASS</td>
        </tr>
      </tbody>
    </table>
  </div>

  <div style="margin-top: 16px; font-size: 12px; color: #6B7280;">
    <p style="margin: 4px 0;"><strong>Duration:</strong> [X] minutes | <strong>Virtual Users:</strong> [X] peak | <strong>Pattern:</strong> [ramp/step/spike/soak]</p>
  </div>
</div>
```

---

## Template 3: Capacity Planning Model

**Purpose:** Visualize current capacity, projected demand, and scaling thresholds.

**HTML Structure:**
```html
<div class="capacity-model" style="border: 1px solid #D1D5DB; border-radius: 6px; padding: 24px; background: #F3F4F6; margin-bottom: 16px;">
  <h3 style="margin: 0 0 16px 0; color: #1F2937;">Capacity Model: [Service Name]</h3>

  <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 16px;">
    <div style="background: white; padding: 16px; border-radius: 4px; border-left: 4px solid #42D36F;">
      <span style="display: block; font-size: 12px; color: #6B7280; text-transform: uppercase; margin-bottom: 8px;">Current Load</span>
      <span style="font-size: 28px; font-weight: 700; color: #1F2937;">[X] RPS</span>
      <span style="display: block; font-size: 12px; color: #6B7280; margin-top: 4px;">[X]% of capacity</span>
    </div>
    <div style="background: white; padding: 16px; border-radius: 4px; border-left: 4px solid #D97706;">
      <span style="display: block; font-size: 12px; color: #6B7280; text-transform: uppercase; margin-bottom: 8px;">Scaling Trigger</span>
      <span style="font-size: 28px; font-weight: 700; color: #1F2937;">[X] RPS</span>
      <span style="display: block; font-size: 12px; color: #6B7280; margin-top: 4px;">CPU &gt;70% or p95 &gt;[X]ms</span>
    </div>
    <div style="background: white; padding: 16px; border-radius: 4px; border-left: 4px solid #DC2626;">
      <span style="display: block; font-size: 12px; color: #6B7280; text-transform: uppercase; margin-bottom: 8px;">Max Capacity</span>
      <span style="font-size: 28px; font-weight: 700; color: #1F2937;">[X] RPS</span>
      <span style="display: block; font-size: 12px; color: #6B7280; margin-top: 4px;">Before degradation</span>
    </div>
  </div>

  <div style="margin-top: 16px; padding: 12px; background: white; border-radius: 4px;">
    <p style="margin: 0; font-size: 13px; color: #1F2937;">
      <strong>Runway:</strong> [X] months at current growth rate ([X]% monthly) before scaling trigger is hit.
    </p>
  </div>
</div>
```

---

## Template 4: Cache Layer Diagram

**Purpose:** Visualize multi-layer caching with hit ratios and TTL configuration.

**HTML Structure:**
```html
<div class="cache-architecture" style="border: 1px solid #D1D5DB; border-radius: 6px; padding: 24px; background: white; margin-bottom: 16px;">
  <h3 style="margin: 0 0 16px 0; color: #1F2937;">Cache Architecture</h3>

  <div style="display: flex; flex-direction: column; gap: 12px;">
    <div style="padding: 16px; background: #F3F4F6; border-left: 4px solid #6366F1; border-radius: 4px;">
      <div style="display: flex; justify-content: space-between; align-items: center;">
        <div>
          <strong style="color: #1F2937;">L1: Browser Cache</strong>
          <p style="margin: 4px 0 0; font-size: 12px; color: #6B7280;">Static assets, API responses with Cache-Control</p>
        </div>
        <div style="text-align: right;">
          <span style="font-size: 18px; font-weight: 700; color: #1F2937;">[X]%</span>
          <span style="display: block; font-size: 11px; color: #6B7280;">Hit Ratio</span>
        </div>
      </div>
    </div>
    <div style="padding: 16px; background: #F3F4F6; border-left: 4px solid #6366F1; border-radius: 4px;">
      <div style="display: flex; justify-content: space-between; align-items: center;">
        <div>
          <strong style="color: #1F2937;">L2: CDN Edge</strong>
          <p style="margin: 4px 0 0; font-size: 12px; color: #6B7280;">Static + semi-dynamic content, surrogate keys for purge</p>
        </div>
        <div style="text-align: right;">
          <span style="font-size: 18px; font-weight: 700; color: #1F2937;">[X]%</span>
          <span style="display: block; font-size: 11px; color: #6B7280;">Hit Ratio</span>
        </div>
      </div>
    </div>
    <div style="padding: 16px; background: #F3F4F6; border-left: 4px solid #6366F1; border-radius: 4px;">
      <div style="display: flex; justify-content: space-between; align-items: center;">
        <div>
          <strong style="color: #1F2937;">L3: Application Cache (Redis)</strong>
          <p style="margin: 4px 0 0; font-size: 12px; color: #6B7280;">Session, computed results, DB query cache. Strategy: cache-aside with TTL.</p>
        </div>
        <div style="text-align: right;">
          <span style="font-size: 18px; font-weight: 700; color: #1F2937;">[X]%</span>
          <span style="display: block; font-size: 11px; color: #6B7280;">Hit Ratio</span>
        </div>
      </div>
    </div>
    <div style="padding: 16px; background: #FFF8F0; border-left: 4px solid #D97706; border-radius: 4px;">
      <div style="display: flex; justify-content: space-between; align-items: center;">
        <div>
          <strong style="color: #1F2937;">Origin: Database</strong>
          <p style="margin: 4px 0 0; font-size: 12px; color: #6B7280;">Source of truth. Only reached on cache miss.</p>
        </div>
        <div style="text-align: right;">
          <span style="font-size: 18px; font-weight: 700; color: #D97706;">Miss</span>
          <span style="display: block; font-size: 11px; color: #6B7280;">Target: &lt;[X]%</span>
        </div>
      </div>
    </div>
  </div>
</div>
```

---

## Template 5: SLO Status Dashboard

**Purpose:** Display SLO compliance with error budget consumption.

**HTML Structure:**
```html
<table class="slo-dashboard" style="width: 100%; border-collapse: collapse; border: 1px solid #D1D5DB; margin-bottom: 16px;">
  <thead>
    <tr style="background: #F3F4F6;">
      <th style="padding: 12px; text-align: left; font-weight: 600; font-size: 12px; color: #1F2937; border-bottom: 2px solid #D1D5DB;">Service</th>
      <th style="padding: 12px; text-align: center; font-weight: 600; font-size: 12px; color: #1F2937; border-bottom: 2px solid #D1D5DB;">SLO Target</th>
      <th style="padding: 12px; text-align: center; font-weight: 600; font-size: 12px; color: #1F2937; border-bottom: 2px solid #D1D5DB;">Current</th>
      <th style="padding: 12px; text-align: center; font-weight: 600; font-size: 12px; color: #1F2937; border-bottom: 2px solid #D1D5DB;">Error Budget Used</th>
      <th style="padding: 12px; text-align: center; font-weight: 600; font-size: 12px; color: #1F2937; border-bottom: 2px solid #D1D5DB;">Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 12px; font-weight: 600; color: #1F2937; border-bottom: 1px solid #D1D5DB;">[Service A]</td>
      <td style="padding: 12px; text-align: center; border-bottom: 1px solid #D1D5DB;">99.95%</td>
      <td style="padding: 12px; text-align: center; border-bottom: 1px solid #D1D5DB;">99.97%</td>
      <td style="padding: 12px; text-align: center; border-bottom: 1px solid #D1D5DB;">40%</td>
      <td style="padding: 12px; text-align: center; border-bottom: 1px solid #D1D5DB; color: #065F46; font-weight: 600;">OK</td>
    </tr>
  </tbody>
</table>
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Replace bracketed placeholders** with actual metrics and service names
3. **Apply status colors** based on threshold comparison (healthy/degraded/critical)
4. **Compose templates** into full report: baseline cards per service, load test results, capacity model, cache diagram, SLO dashboard
5. **Link templates** to supporting data (load test scripts, monitoring dashboards, capacity spreadsheets)

All templates use semantic HTML and maintain color + text distinction for accessibility.
