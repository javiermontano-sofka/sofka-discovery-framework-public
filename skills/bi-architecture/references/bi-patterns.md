---
name: bi-patterns
description: HTML templates and visual patterns for KPI metric trees, dashboard hierarchy cards, semantic layer definitions, and visualization standard guides
---

## BI Architecture Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for BI architecture documentation artifacts.

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

## Template 1: KPI Metric Tree

**Purpose:** Visualize the hierarchy from north star metric down to input metrics with ownership.

**HTML Structure:**
```html
<section class="metric-tree">
  <h3>KPI Metric Tree</h3>
  <div class="tree-level" data-level="north-star">
    <div class="metric-node primary">
      <span class="metric-name">Monthly Recurring Revenue (MRR)</span>
      <span class="metric-owner">Owner: Finance</span>
      <span class="metric-type">North Star</span>
    </div>
  </div>
  <div class="tree-connector">|</div>
  <div class="tree-level" data-level="supporting">
    <div class="metric-node">
      <span class="metric-name">New MRR</span>
      <span class="metric-owner">Owner: Sales</span>
      <span class="metric-type">Leading</span>
    </div>
    <div class="metric-node">
      <span class="metric-name">Expansion MRR</span>
      <span class="metric-owner">Owner: CS</span>
      <span class="metric-type">Leading</span>
    </div>
    <div class="metric-node">
      <span class="metric-name">Churned MRR</span>
      <span class="metric-owner">Owner: CS</span>
      <span class="metric-type">Lagging</span>
    </div>
  </div>
  <div class="tree-connector">|</div>
  <div class="tree-level" data-level="input">
    <div class="metric-node">
      <span class="metric-name">Qualified Leads</span>
      <span class="metric-owner">Owner: Marketing</span>
      <span class="metric-type">Input</span>
    </div>
    <div class="metric-node">
      <span class="metric-name">Win Rate</span>
      <span class="metric-owner">Owner: Sales</span>
      <span class="metric-type">Input</span>
    </div>
    <div class="metric-node">
      <span class="metric-name">NPS Score</span>
      <span class="metric-owner">Owner: Product</span>
      <span class="metric-type">Input</span>
    </div>
  </div>
</section>
```

**CSS Styling:**
```css
.metric-tree {
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  padding: 24px;
  background: var(--color-neutral-light);
}

.tree-level {
  display: flex;
  justify-content: center;
  gap: 16px;
  flex-wrap: wrap;
}

.metric-node {
  padding: 12px 16px;
  background: white;
  border: 1px solid var(--color-neutral-border);
  border-left: 4px solid var(--color-primary);
  border-radius: 4px;
  min-width: 160px;
  text-align: center;
}

.metric-node.primary {
  border-left: 4px solid var(--color-positive);
  background: #FFFDF0;
}

.metric-name {
  display: block;
  font-weight: 600;
  font-size: 13px;
  color: var(--color-neutral-dark);
}

.metric-owner {
  display: block;
  font-size: 11px;
  color: var(--color-warning);
  margin-top: 4px;
}

.metric-type {
  display: inline-block;
  font-size: 10px;
  padding: 2px 6px;
  border-radius: 3px;
  background: var(--color-neutral-light);
  color: var(--color-neutral-dark);
  margin-top: 6px;
  text-transform: uppercase;
}

.tree-connector {
  text-align: center;
  font-size: 24px;
  color: var(--color-neutral-border);
  line-height: 1;
  padding: 4px 0;
}
```

---

## Template 2: Dashboard Hierarchy Card

**Purpose:** Document the dashboard levels from executive to operational with purpose and refresh cadence.

**HTML Structure:**
```html
<div class="dashboard-hierarchy">
  <div class="dashboard-level" data-level="L1">
    <div class="level-header">
      <span class="level-badge">L1</span>
      <h4>Executive Dashboard</h4>
    </div>
    <div class="level-body">
      <p><strong>Audience:</strong> C-suite, Board</p>
      <p><strong>Content:</strong> North star KPIs, revenue trends, strategic health</p>
      <p><strong>Refresh:</strong> Daily, 6:00 AM</p>
      <p><strong>Interactivity:</strong> Minimal — static views with monthly drill-down</p>
    </div>
  </div>
  <div class="dashboard-level" data-level="L2">
    <div class="level-header">
      <span class="level-badge">L2</span>
      <h4>Department Dashboard</h4>
    </div>
    <div class="level-body">
      <p><strong>Audience:</strong> VPs, Directors</p>
      <p><strong>Content:</strong> Department KPIs, team performance, pipeline metrics</p>
      <p><strong>Refresh:</strong> Daily, 7:00 AM</p>
      <p><strong>Interactivity:</strong> Date range filters, team selectors</p>
    </div>
  </div>
  <div class="dashboard-level" data-level="L3">
    <div class="level-header">
      <span class="level-badge">L3</span>
      <h4>Operational Dashboard</h4>
    </div>
    <div class="level-body">
      <p><strong>Audience:</strong> Managers, Analysts</p>
      <p><strong>Content:</strong> Detailed metrics, individual records, workflow status</p>
      <p><strong>Refresh:</strong> Hourly or real-time</p>
      <p><strong>Interactivity:</strong> Full filtering, drill-down, cross-filtering</p>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.dashboard-hierarchy {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.dashboard-level {
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  overflow: hidden;
  background: white;
}

.level-header {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px 16px;
  background: var(--color-neutral-light);
  border-bottom: 1px solid var(--color-neutral-border);
}

.level-badge {
  background: var(--color-primary);
  color: white;
  font-size: 12px;
  font-weight: 700;
  padding: 4px 8px;
  border-radius: 4px;
}

.level-header h4 {
  margin: 0;
  font-size: 15px;
  color: var(--color-neutral-dark);
}

.level-body {
  padding: 12px 16px;
}

.level-body p {
  margin: 4px 0;
  font-size: 13px;
  color: var(--color-neutral-dark);
}
```

---

## Template 3: Semantic Layer Metric Definition

**Purpose:** Document a metric definition in the semantic layer with formula, dimensions, and access rules.

**HTML Structure:**
```html
<div class="metric-definition">
  <div class="def-header">
    <h4>Metric: Net Revenue</h4>
    <span class="certified-badge">Certified</span>
  </div>
  <div class="def-body">
    <div class="section">
      <h5>Formula</h5>
      <code class="formula-block">SUM(order_amount) - SUM(refund_amount) - SUM(discount_amount)</code>
    </div>
    <div class="section">
      <h5>Dimensions</h5>
      <ul>
        <li>date (order_date), region, product_category, channel</li>
      </ul>
    </div>
    <div class="section">
      <h5>Grain</h5>
      <p>Per order line item. Aggregates to daily, weekly, monthly.</p>
    </div>
    <div class="section">
      <h5>Access</h5>
      <p>All business users. Row-level security by region for non-executive roles.</p>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.metric-definition {
  border: 2px solid var(--color-primary);
  border-radius: 8px;
  padding: 16px;
  margin-bottom: 16px;
  background: white;
}

.def-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 12px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.certified-badge {
  font-size: 11px;
  background: var(--color-positive);
  color: var(--color-neutral-dark);
  padding: 3px 8px;
  border-radius: 4px;
  font-weight: 600;
}

.formula-block {
  display: block;
  padding: 8px 12px;
  background: var(--color-neutral-light);
  border-left: 3px solid var(--color-warning);
  font-family: monospace;
  font-size: 12px;
  color: var(--color-neutral-dark);
}
```

---

## Template 4: Chart Selection Guide

**Purpose:** Quick reference for when to use each chart type.

**HTML Structure:**
```html
<table class="chart-guide">
  <thead>
    <tr>
      <th>Chart Type</th>
      <th>Best For</th>
      <th>Avoid When</th>
      <th>Max Categories</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="chart-name">Bar Chart</td>
      <td>Comparing categories, ranking</td>
      <td>Time series, continuous data</td>
      <td>12</td>
    </tr>
    <tr>
      <td class="chart-name">Line Chart</td>
      <td>Trends over time, rate of change</td>
      <td>Categorical comparisons</td>
      <td>5 lines</td>
    </tr>
    <tr>
      <td class="chart-name">Scatter Plot</td>
      <td>Correlation, distribution, outliers</td>
      <td>Few data points, categories</td>
      <td>3 series</td>
    </tr>
    <tr>
      <td class="chart-name">Table</td>
      <td>Exact values, lookup, dense data</td>
      <td>Trends, patterns, large audiences</td>
      <td>20 rows visible</td>
    </tr>
  </tbody>
</table>
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Customize content** (metric names, dashboard levels, chart types)
3. **Apply color tokens** for consistency and semantic meaning
4. **Nest templates** (metric tree nodes link to metric definitions; dashboard hierarchy links to specific dashboards)
5. **Ensure accessibility** (color-blind safe palettes, text labels, screen reader support)

All templates follow accessibility best practices (semantic HTML, color + text distinction, adequate contrast).
