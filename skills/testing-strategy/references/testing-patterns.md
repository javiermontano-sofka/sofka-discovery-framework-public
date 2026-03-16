---
name: testing-patterns
description: HTML templates and visual patterns for test pyramids, coverage reports, contract testing flows, quality dashboards, and test execution summaries
---

## Testing Strategy Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for testing strategy documentation artifacts.

---

## Design Tokens

**Color Palette:**
```css
--color-primary: #FF7E08;        /* Orange — primary actions, highlighted elements */
--color-critical: #DC2626;       /* Red — test failures, coverage gaps, flaky */
--color-warning: #D97706;        /* Amber — below target, needs attention */
--color-positive: #FFD700;       /* Gold — passing, targets met */
--color-decorative: #42D36F;     /* Green — decorative only, not semantic status */
--color-neutral-light: #F3F4F6;  /* Light gray — backgrounds, borders */
--color-neutral-dark: #1F2937;   /* Dark gray — text, strong contrast */
--color-neutral-border: #D1D5DB; /* Medium gray — structural dividers */
```

---

## Template 1: Test Pyramid Visualization

**Purpose:** Display the test pyramid with ratio targets and current counts per layer.

**HTML Structure:**
```html
<div class="test-pyramid" style="border: 1px solid #D1D5DB; border-radius: 6px; padding: 24px; background: #F3F4F6; margin-bottom: 16px;">
  <h3 style="margin: 0 0 16px 0; color: #1F2937;">Test Pyramid: [Project Name]</h3>

  <div style="display: flex; flex-direction: column; align-items: center; gap: 8px;">
    <div style="width: 30%; padding: 12px; background: #FEE2E2; border: 2px solid #DC2626; border-radius: 4px; text-align: center;">
      <strong style="font-size: 14px; color: #991B1B;">E2E</strong>
      <p style="margin: 4px 0 0; font-size: 12px; color: #6B7280;">[X] tests | Target: 10%</p>
      <p style="margin: 2px 0 0; font-size: 11px; color: #6B7280;">Slow, high fidelity, expensive to maintain</p>
    </div>
    <div style="width: 55%; padding: 12px; background: #FEF3C7; border: 2px solid #D97706; border-radius: 4px; text-align: center;">
      <strong style="font-size: 14px; color: #92400E;">Integration</strong>
      <p style="margin: 4px 0 0; font-size: 12px; color: #6B7280;">[X] tests | Target: 20%</p>
      <p style="margin: 2px 0 0; font-size: 11px; color: #6B7280;">Medium speed, service boundaries, DB + API contracts</p>
    </div>
    <div style="width: 80%; padding: 12px; background: #D1FAE5; border: 2px solid #42D36F; border-radius: 4px; text-align: center;">
      <strong style="font-size: 14px; color: #065F46;">Unit</strong>
      <p style="margin: 4px 0 0; font-size: 12px; color: #6B7280;">[X] tests | Target: 70%</p>
      <p style="margin: 2px 0 0; font-size: 11px; color: #6B7280;">Fast, isolated, cheap to maintain, high coverage</p>
    </div>
  </div>

  <div style="margin-top: 16px; padding-top: 12px; border-top: 1px solid #D1D5DB; font-size: 12px; color: #6B7280;">
    <strong>Total:</strong> [X] tests | <strong>Run Time:</strong> [X] min (unit: [X]s, integration: [X]s, E2E: [X]m) | <strong>Pass Rate:</strong> [X]%
  </div>
</div>
```

---

## Template 2: Coverage Report Card

**Purpose:** Display code coverage metrics with trend indicators and quality gate status.

**HTML Structure:**
```html
<div class="coverage-report" style="border: 2px solid #FF7E08; border-radius: 8px; padding: 20px; margin-bottom: 16px; background: white;">
  <h4 style="margin: 0 0 16px; color: #1F2937;">Coverage Report: [Module Name]</h4>

  <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px;">
    <div style="text-align: center;">
      <span style="display: block; font-size: 28px; font-weight: 700; color: #1F2937;">[X]%</span>
      <span style="font-size: 11px; color: #6B7280; text-transform: uppercase;">Line Coverage</span>
      <span style="display: block; font-size: 11px; color: #065F46; margin-top: 2px;">+[X]% from last sprint</span>
    </div>
    <div style="text-align: center;">
      <span style="display: block; font-size: 28px; font-weight: 700; color: #1F2937;">[X]%</span>
      <span style="font-size: 11px; color: #6B7280; text-transform: uppercase;">Branch Coverage</span>
      <span style="display: block; font-size: 11px; color: #065F46; margin-top: 2px;">+[X]% from last sprint</span>
    </div>
    <div style="text-align: center;">
      <span style="display: block; font-size: 28px; font-weight: 700; color: #1F2937;">[X]%</span>
      <span style="font-size: 11px; color: #6B7280; text-transform: uppercase;">Mutation Score</span>
      <span style="display: block; font-size: 11px; color: #6B7280; margin-top: 2px;">Critical paths only</span>
    </div>
    <div style="text-align: center;">
      <span style="display: block; font-size: 28px; font-weight: 700; color: #1F2937;">[X]</span>
      <span style="font-size: 11px; color: #6B7280; text-transform: uppercase;">Flaky Tests</span>
      <span style="display: block; font-size: 11px; color: #991B1B; margin-top: 2px;">[X] quarantined</span>
    </div>
  </div>

  <div style="margin-top: 16px; padding-top: 12px; border-top: 1px solid #D1D5DB;">
    <span style="font-size: 12px; font-weight: 600; color: #6B7280;">Quality Gate:</span>
    <span style="font-size: 12px; padding: 2px 8px; border-radius: 4px; font-weight: bold; background: #D1FAE5; color: #065F46;">
      PASS
      <!-- Options: PASS (green) | FAIL (bg: #FEE2E2; color: #991B1B) -->
    </span>
    <span style="font-size: 11px; color: #6B7280; margin-left: 8px;">Requires: line &ge;80%, branch &ge;70%, no new flaky tests</span>
  </div>
</div>
```

---

## Template 3: Contract Testing Status

**Purpose:** Show contract verification status between consumer and provider services.

**HTML Structure:**
```html
<table class="contract-status" style="width: 100%; border-collapse: collapse; border: 1px solid #D1D5DB; margin-bottom: 16px;">
  <thead>
    <tr style="background: #F3F4F6;">
      <th style="padding: 12px; text-align: left; font-weight: 600; font-size: 12px; border-bottom: 2px solid #D1D5DB;">Consumer</th>
      <th style="padding: 12px; text-align: left; font-weight: 600; font-size: 12px; border-bottom: 2px solid #D1D5DB;">Provider</th>
      <th style="padding: 12px; text-align: center; font-weight: 600; font-size: 12px; border-bottom: 2px solid #D1D5DB;">Contract Version</th>
      <th style="padding: 12px; text-align: center; font-weight: 600; font-size: 12px; border-bottom: 2px solid #D1D5DB;">Last Verified</th>
      <th style="padding: 12px; text-align: center; font-weight: 600; font-size: 12px; border-bottom: 2px solid #D1D5DB;">Can Deploy?</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 12px; font-weight: 600; border-bottom: 1px solid #D1D5DB;">[Frontend App]</td>
      <td style="padding: 12px; border-bottom: 1px solid #D1D5DB;">[User Service]</td>
      <td style="padding: 12px; text-align: center; border-bottom: 1px solid #D1D5DB;">v3.2.1</td>
      <td style="padding: 12px; text-align: center; border-bottom: 1px solid #D1D5DB;">[date]</td>
      <td style="padding: 12px; text-align: center; border-bottom: 1px solid #D1D5DB;">
        <span style="font-size: 11px; padding: 2px 8px; border-radius: 4px; font-weight: bold; background: #D1FAE5; color: #065F46;">YES</span>
        <!-- Options: YES (green) | NO (red) | PENDING (amber) -->
      </td>
    </tr>
  </tbody>
</table>
```

---

## Template 4: Test Execution Summary

**Purpose:** Display CI test run results with categorized failures.

**HTML Structure:**
```html
<div class="test-execution" style="border: 1px solid #D1D5DB; border-left: 4px solid #FF7E08; padding: 20px; margin-bottom: 24px; background: white; border-radius: 6px;">
  <div style="display: flex; justify-content: space-between; align-items: center; padding-bottom: 12px; border-bottom: 1px solid #D1D5DB;">
    <h3 style="margin: 0; font-size: 18px; color: #1F2937;">Test Run: [Build #XXXX]</h3>
    <span style="padding: 4px 8px; border-radius: 4px; font-size: 12px; font-weight: 600; text-transform: uppercase; background: #D1FAE5; color: #065F46;">
      PASS
    </span>
  </div>

  <div style="display: grid; grid-template-columns: repeat(5, 1fr); gap: 12px; margin-top: 16px; text-align: center;">
    <div>
      <span style="display: block; font-size: 24px; font-weight: 700; color: #1F2937;">[X]</span>
      <span style="font-size: 11px; color: #6B7280;">Total</span>
    </div>
    <div>
      <span style="display: block; font-size: 24px; font-weight: 700; color: #065F46;">[X]</span>
      <span style="font-size: 11px; color: #6B7280;">Passed</span>
    </div>
    <div>
      <span style="display: block; font-size: 24px; font-weight: 700; color: #991B1B;">[X]</span>
      <span style="font-size: 11px; color: #6B7280;">Failed</span>
    </div>
    <div>
      <span style="display: block; font-size: 24px; font-weight: 700; color: #92400E;">[X]</span>
      <span style="font-size: 11px; color: #6B7280;">Flaky</span>
    </div>
    <div>
      <span style="display: block; font-size: 24px; font-weight: 700; color: #6B7280;">[X]</span>
      <span style="font-size: 11px; color: #6B7280;">Skipped</span>
    </div>
  </div>

  <div style="margin-top: 16px; padding-top: 12px; border-top: 1px solid #D1D5DB; font-size: 12px; color: #6B7280;">
    <strong>Duration:</strong> [X]m [X]s | <strong>Parallelism:</strong> [X] workers | <strong>Trigger:</strong> [push / PR / merge]
  </div>
</div>
```

---

## Template 5: Quality Metrics Dashboard

**Purpose:** Show quality health indicators with trend arrows.

**HTML Structure:**
```html
<div class="quality-dashboard" style="border: 1px solid #D1D5DB; border-radius: 6px; padding: 24px; background: #F3F4F6; margin-bottom: 16px;">
  <h3 style="margin: 0 0 16px 0; color: #1F2937;">Quality Health: [Project Name]</h3>

  <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 16px;">
    <div style="background: white; padding: 16px; border-radius: 4px; border-top: 4px solid #42D36F;">
      <span style="font-size: 12px; color: #6B7280; text-transform: uppercase;">Defect Escape Rate</span>
      <span style="display: block; font-size: 28px; font-weight: 700; color: #1F2937; margin: 8px 0;">[X]%</span>
      <span style="font-size: 12px; color: #065F46;">Improving (was [X]%)</span>
    </div>
    <div style="background: white; padding: 16px; border-radius: 4px; border-top: 4px solid #D97706;">
      <span style="font-size: 12px; color: #6B7280; text-transform: uppercase;">Flaky Test Rate</span>
      <span style="display: block; font-size: 28px; font-weight: 700; color: #1F2937; margin: 8px 0;">[X]%</span>
      <span style="font-size: 12px; color: #92400E;">Needs attention (target: &lt;2%)</span>
    </div>
    <div style="background: white; padding: 16px; border-radius: 4px; border-top: 4px solid #42D36F;">
      <span style="font-size: 12px; color: #6B7280; text-transform: uppercase;">CI Pass Rate</span>
      <span style="display: block; font-size: 28px; font-weight: 700; color: #1F2937; margin: 8px 0;">[X]%</span>
      <span style="font-size: 12px; color: #065F46;">Stable (target: &gt;95%)</span>
    </div>
  </div>
</div>
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Replace bracketed placeholders** with actual test counts, coverage percentages, and project names
3. **Apply status colors** based on quality gate thresholds (pass/fail/needs attention)
4. **Compose templates** into full report: pyramid, coverage, contract status, execution summary, quality dashboard
5. **Link to CI/CD dashboards** for real-time data alongside documented strategy

All templates use semantic HTML and maintain color + text distinction for accessibility.
