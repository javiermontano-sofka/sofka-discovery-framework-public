---
name: mobile-assessment-benchmarks
description: HTML templates and visual patterns for health dashboards, dependency audit tables, compliance checklists, code quality scorecards, UX metric cards, and remediation roadmaps
---

## Mobile Assessment Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for mobile assessment documentation artifacts.

---

## Design Tokens

**Color Palette:**
```css
--color-primary: #FF7E08;        /* Orange — primary actions, highlighted elements */
--color-critical: #DC2626;       /* Red — errors, violations, high-severity issues */
--color-warning: #D97706;        /* Amber — warnings, caution items, medium severity */
--color-positive: #FFD700;       /* Gold — positive outcomes, recommendations */
--color-decorative: #42D36F;     /* Green — decorative only, not semantic status */
--color-neutral-light: #F3F4F6;  /* Light gray — backgrounds, borders */
--color-neutral-dark: #1F2937;   /* Dark gray — text, strong contrast */
--color-neutral-border: #D1D5DB; /* Medium gray — structural dividers */
```

---

## Template 1: App Health Dashboard

**Purpose:** Display key health metrics with status indicators and benchmarks

**HTML Structure:**
```html
<section class="health-dashboard">
  <h3>App Health Profile</h3>
  <div class="metric-grid">
    <div class="metric-card" data-status="healthy">
      <span class="metric-label">Crash-Free Sessions</span>
      <span class="metric-value">99.72%</span>
      <span class="metric-benchmark">Benchmark: >99.5%</span>
      <span class="metric-trend improving">+0.15% vs. last release</span>
    </div>
    <div class="metric-card" data-status="warning">
      <span class="metric-label">ANR Rate</span>
      <span class="metric-value">0.38%</span>
      <span class="metric-benchmark">Benchmark: <0.47%</span>
      <span class="metric-trend flat">No change vs. last release</span>
    </div>
    <div class="metric-card" data-status="critical">
      <span class="metric-label">Cold Start Time</span>
      <span class="metric-value">3.2s</span>
      <span class="metric-benchmark">Target: <2.0s</span>
      <span class="metric-trend worsening">+0.4s vs. last release</span>
    </div>
    <div class="metric-card" data-status="healthy">
      <span class="metric-label">App Size (Download)</span>
      <span class="metric-value">38 MB</span>
      <span class="metric-benchmark">Target: <50 MB</span>
      <span class="metric-trend improving">-2 MB after unused SDK removal</span>
    </div>
    <div class="metric-card" data-status="warning">
      <span class="metric-label">Memory (Peak)</span>
      <span class="metric-value">285 MB</span>
      <span class="metric-benchmark">Target: <200 MB</span>
      <span class="metric-trend worsening">+40 MB (image cache leak suspected)</span>
    </div>
  </div>
</section>
```

**CSS Styling:**
```css
.health-dashboard {
  padding: 24px;
  background: var(--color-neutral-light);
  border-radius: 6px;
}

.metric-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
  gap: 16px;
}

.metric-card {
  background: white;
  border-radius: 8px;
  padding: 16px;
  border-left: 4px solid var(--color-neutral-border);
}

.metric-card[data-status="healthy"] { border-left-color: var(--color-decorative); }
.metric-card[data-status="warning"] { border-left-color: var(--color-warning); }
.metric-card[data-status="critical"] { border-left-color: var(--color-critical); }

.metric-label {
  display: block;
  font-size: 12px;
  font-weight: 600;
  color: var(--color-neutral-dark);
  text-transform: uppercase;
  margin-bottom: 8px;
}

.metric-value {
  display: block;
  font-size: 28px;
  font-weight: 700;
  color: var(--color-neutral-dark);
  margin-bottom: 4px;
}

.metric-benchmark {
  display: block;
  font-size: 11px;
  color: #6B7280;
}

.metric-trend {
  display: block;
  font-size: 12px;
  margin-top: 8px;
}

.metric-trend.improving { color: var(--color-decorative); }
.metric-trend.worsening { color: var(--color-critical); }
.metric-trend.flat { color: var(--color-warning); }
```

---

## Template 2: Dependency Audit Table

**Purpose:** List dependencies with version, CVE status, license, and action required

**HTML Structure:**
```html
<section class="dependency-audit">
  <h3>Dependency & Security Audit</h3>
  <div class="audit-summary">
    <span class="audit-stat">Total: 84 dependencies</span>
    <span class="audit-stat critical">Critical CVEs: 2</span>
    <span class="audit-stat warning">Outdated: 12</span>
    <span class="audit-stat">License Issues: 1</span>
  </div>
  <table class="audit-table">
    <thead>
      <tr><th>Dependency</th><th>Current</th><th>Latest</th><th>CVEs</th><th>License</th><th>Action</th></tr>
    </thead>
    <tbody>
      <tr class="severity-critical">
        <td>okhttp</td><td>3.14.9</td><td>4.12.0</td>
        <td><span class="cve-badge critical">CVE-2023-0833 (High)</span></td>
        <td>Apache 2.0</td>
        <td class="action">Update immediately — breaking API changes</td>
      </tr>
      <tr class="severity-warning">
        <td>firebase-analytics</td><td>21.2.0</td><td>21.5.1</td>
        <td>None</td>
        <td>Apache 2.0</td>
        <td class="action">Update — minor version, backward compatible</td>
      </tr>
      <tr class="severity-info">
        <td>image-picker</td><td>0.8.7</td><td>1.0.4</td>
        <td>None</td>
        <td>BSD-3</td>
        <td class="action">Major update — test thoroughly, API changes</td>
      </tr>
      <tr class="severity-critical">
        <td>analytics-sdk (proprietary)</td><td>5.2.1</td><td>5.2.1</td>
        <td>None</td>
        <td class="license-warning">Proprietary — data sharing clause</td>
        <td class="action">Review privacy impact — possible ATT violation</td>
      </tr>
    </tbody>
  </table>
</section>
```

**CSS Styling:**
```css
.audit-summary {
  display: flex;
  gap: 16px;
  margin-bottom: 16px;
}

.audit-stat {
  font-size: 13px;
  padding: 6px 12px;
  background: var(--color-neutral-light);
  border-radius: 4px;
}

.audit-stat.critical { background: #FEE2E2; color: var(--color-critical); font-weight: 600; }
.audit-stat.warning { background: #FEF3C7; color: var(--color-warning); font-weight: 600; }

.audit-table {
  width: 100%;
  border-collapse: collapse;
  font-size: 13px;
}

.audit-table th {
  padding: 10px;
  text-align: left;
  background: var(--color-neutral-light);
  font-weight: 600;
  border-bottom: 2px solid var(--color-neutral-border);
}

.audit-table td {
  padding: 10px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.severity-critical { background: #FFF5F5; }
.severity-warning { background: #FFFBEB; }

.cve-badge {
  display: inline-block;
  padding: 2px 6px;
  border-radius: 3px;
  font-size: 11px;
  font-weight: 600;
}

.cve-badge.critical { background: var(--color-critical); color: white; }
.cve-badge.high { background: var(--color-warning); color: white; }

.license-warning {
  color: var(--color-critical);
  font-weight: 600;
}

.action {
  font-size: 12px;
  color: var(--color-primary);
}
```

---

## Template 3: Compliance Checklist

**Purpose:** Track App Store and Google Play policy compliance item by item

**HTML Structure:**
```html
<section class="compliance-checklist">
  <h3>Platform Compliance Status</h3>
  <div class="platform-section">
    <h4>Apple App Store</h4>
    <ul class="compliance-items">
      <li data-status="pass">In-app purchases use StoreKit (no external payment links)</li>
      <li data-status="pass">Privacy nutrition labels match actual data collection</li>
      <li data-status="fail">ATT prompt missing — tracking occurs before user consent</li>
      <li data-status="pass">Minimum iOS 16 deployment target (current - 2)</li>
      <li data-status="warning">Background refresh declared but not actively used</li>
    </ul>
  </div>
  <div class="platform-section">
    <h4>Google Play</h4>
    <ul class="compliance-items">
      <li data-status="pass">Data Safety section submitted and approved</li>
      <li data-status="fail">Target API 33 — requires API 34 by August 2024</li>
      <li data-status="pass">Location permission requested at point of use with rationale</li>
      <li data-status="pass">No background location usage</li>
      <li data-status="warning">QUERY_ALL_PACKAGES permission declared — may require justification</li>
    </ul>
  </div>
</section>
```

---

## Template 4: Remediation Roadmap

**Purpose:** Prioritized list of findings organized by severity and effort

**HTML Structure:**
```html
<section class="remediation-roadmap">
  <h3>Remediation Roadmap</h3>
  <div class="remediation-tier" data-tier="quick-wins">
    <h4>Quick Wins (1-3 days each)</h4>
    <div class="finding-list">
      <div class="finding" data-severity="critical">
        <span class="finding-id">F-001</span>
        <span class="finding-severity">Critical</span>
        <span class="finding-title">Update okhttp to fix CVE-2023-0833</span>
        <span class="finding-effort">1 day</span>
        <span class="finding-impact">Eliminates known security vulnerability</span>
      </div>
      <div class="finding" data-severity="critical">
        <span class="finding-id">F-002</span>
        <span class="finding-severity">Critical</span>
        <span class="finding-title">Add ATT prompt before analytics initialization</span>
        <span class="finding-effort">2 days</span>
        <span class="finding-impact">Prevents App Store rejection</span>
      </div>
      <div class="finding" data-severity="high">
        <span class="finding-id">F-003</span>
        <span class="finding-severity">High</span>
        <span class="finding-title">Remove unused analytics-sdk (proprietary data sharing)</span>
        <span class="finding-effort">1 day</span>
        <span class="finding-impact">Reduces app size by 3MB, eliminates privacy risk</span>
      </div>
    </div>
  </div>
  <div class="remediation-tier" data-tier="strategic">
    <h4>Strategic Fixes (1-4 weeks each)</h4>
    <div class="finding-list">
      <div class="finding" data-severity="high">
        <span class="finding-id">F-010</span>
        <span class="finding-severity">High</span>
        <span class="finding-title">Optimize cold start (3.2s to <2.0s)</span>
        <span class="finding-effort">2 weeks</span>
        <span class="finding-impact">Reduces user abandonment, improves store rating</span>
      </div>
      <div class="finding" data-severity="medium">
        <span class="finding-id">F-011</span>
        <span class="finding-severity">Medium</span>
        <span class="finding-title">Fix image cache memory leak (285MB peak)</span>
        <span class="finding-effort">1 week</span>
        <span class="finding-impact">Reduces OOM crashes on low-end devices</span>
      </div>
    </div>
  </div>
</section>
```

**CSS Styling:**
```css
.remediation-tier {
  margin-bottom: 24px;
}

.remediation-tier h4 {
  margin: 0 0 12px 0;
  padding: 8px 12px;
  background: var(--color-neutral-light);
  border-radius: 4px;
}

.finding {
  display: grid;
  grid-template-columns: 60px 80px 1fr 80px;
  gap: 12px;
  align-items: center;
  padding: 12px;
  border-bottom: 1px solid var(--color-neutral-border);
  font-size: 13px;
}

.finding[data-severity="critical"] { border-left: 4px solid var(--color-critical); }
.finding[data-severity="high"] { border-left: 4px solid var(--color-warning); }
.finding[data-severity="medium"] { border-left: 4px solid var(--color-positive); }

.finding-id { font-weight: 600; color: var(--color-neutral-dark); }

.finding-severity {
  font-size: 11px;
  font-weight: 600;
  text-transform: uppercase;
  padding: 2px 6px;
  border-radius: 3px;
}

.finding[data-severity="critical"] .finding-severity { background: var(--color-critical); color: white; }
.finding[data-severity="high"] .finding-severity { background: var(--color-warning); color: white; }
.finding[data-severity="medium"] .finding-severity { background: var(--color-positive); color: var(--color-neutral-dark); }

.finding-effort { font-size: 12px; color: #6B7280; }

.finding-impact {
  grid-column: 3 / 5;
  font-size: 12px;
  color: var(--color-primary);
  font-style: italic;
}
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Customize content** (metric values, dependency names, compliance items, finding descriptions)
3. **Apply color tokens** for consistency and semantic meaning
4. **Link templates together** (health dashboard findings feed remediation roadmap; dependency audit items become quick wins)

All templates follow accessibility best practices (semantic HTML, color + text distinction, adequate contrast).
