---
name: analytics-patterns
description: HTML templates and visual patterns for source-to-target mapping diagrams, data model cards, transformation DAGs, test coverage reports, and cost attribution views
---

## Analytics Engineering Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for analytics engineering documentation artifacts.

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

## Template 1: Layer Architecture Diagram

**Purpose:** Visualize the source-to-target data flow through transformation layers.

**HTML Structure:**
```html
<section class="layer-architecture">
  <h3>Transformation Layer Architecture</h3>
  <div class="layer-flow">
    <div class="data-layer" data-layer="sources">
      <span class="layer-label">Sources</span>
      <div class="layer-items">
        <div class="item">PostgreSQL</div>
        <div class="item">Stripe API</div>
        <div class="item">Salesforce</div>
      </div>
    </div>
    <div class="flow-arrow">→</div>
    <div class="data-layer" data-layer="staging">
      <span class="layer-label">Staging (stg_)</span>
      <div class="layer-items">
        <div class="item">stg_orders</div>
        <div class="item">stg_payments</div>
        <div class="item">stg_customers</div>
      </div>
      <span class="materialization">View</span>
    </div>
    <div class="flow-arrow">→</div>
    <div class="data-layer" data-layer="intermediate">
      <span class="layer-label">Intermediate (int_)</span>
      <div class="layer-items">
        <div class="item">int_orders_pivoted</div>
        <div class="item">int_payments_grouped</div>
      </div>
      <span class="materialization">Ephemeral</span>
    </div>
    <div class="flow-arrow">→</div>
    <div class="data-layer" data-layer="marts">
      <span class="layer-label">Marts (fct_, dim_)</span>
      <div class="layer-items">
        <div class="item">fct_orders</div>
        <div class="item">dim_customers</div>
        <div class="item">mrt_revenue</div>
      </div>
      <span class="materialization">Table / Incremental</span>
    </div>
  </div>
</section>
```

**CSS Styling:**
```css
.layer-architecture {
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  padding: 24px;
  background: var(--color-neutral-light);
}

.layer-flow {
  display: flex;
  align-items: flex-start;
  gap: 8px;
  overflow-x: auto;
  padding: 16px 0;
}

.data-layer {
  padding: 16px;
  border-left: 4px solid var(--color-primary);
  background: white;
  border-radius: 4px;
  min-width: 170px;
  position: relative;
}

.layer-label {
  display: block;
  font-weight: 600;
  color: var(--color-neutral-dark);
  margin-bottom: 12px;
  font-size: 14px;
}

.layer-items {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.item {
  padding: 6px 10px;
  background: var(--color-neutral-light);
  border: 1px solid var(--color-neutral-border);
  border-radius: 4px;
  font-size: 12px;
  font-family: monospace;
  color: var(--color-neutral-dark);
}

.materialization {
  display: block;
  margin-top: 10px;
  font-size: 11px;
  color: var(--color-warning);
  font-weight: 600;
  text-transform: uppercase;
}

.flow-arrow {
  font-size: 24px;
  color: var(--color-primary);
  align-self: center;
  font-weight: bold;
}
```

---

## Template 2: Data Model Card

**Purpose:** Document a specific model with grain, columns, tests, and lineage.

**HTML Structure:**
```html
<div class="model-card">
  <div class="card-header">
    <h4>fct_orders</h4>
    <span class="materialization-badge" data-type="incremental">Incremental</span>
  </div>
  <div class="card-body">
    <div class="section">
      <h5>Grain</h5>
      <p>One row per order line item (order_id + product_id)</p>
    </div>
    <div class="section">
      <h5>Key Columns</h5>
      <table class="column-table">
        <tr>
          <td><code>order_id</code></td>
          <td>Surrogate key</td>
          <td class="test-badge">unique, not_null</td>
        </tr>
        <tr>
          <td><code>customer_id</code></td>
          <td>FK to dim_customers</td>
          <td class="test-badge">relationships</td>
        </tr>
        <tr>
          <td><code>order_amount</code></td>
          <td>Net amount in USD</td>
          <td class="test-badge">not_null</td>
        </tr>
        <tr>
          <td><code>ordered_at</code></td>
          <td>Timestamp UTC</td>
          <td class="test-badge">not_null</td>
        </tr>
      </table>
    </div>
    <div class="section">
      <h5>Upstream Dependencies</h5>
      <p><code>stg_orders</code> → <code>int_orders_pivoted</code> → <code>fct_orders</code></p>
    </div>
    <div class="section">
      <h5>Incremental Strategy</h5>
      <p>Merge on <code>order_id</code>. Lookback window: 3 days. Full refresh monthly.</p>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.model-card {
  border: 2px solid var(--color-primary);
  border-radius: 8px;
  padding: 16px;
  margin-bottom: 16px;
  background: white;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 12px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.card-header h4 {
  margin: 0;
  font-family: monospace;
  font-size: 16px;
  color: var(--color-neutral-dark);
}

.materialization-badge {
  font-size: 11px;
  padding: 3px 8px;
  border-radius: 4px;
  font-weight: 600;
  text-transform: uppercase;
}

.materialization-badge[data-type="incremental"] {
  background: var(--color-primary);
  color: white;
}

.materialization-badge[data-type="table"] {
  background: var(--color-decorative);
  color: white;
}

.materialization-badge[data-type="view"] {
  background: var(--color-neutral-light);
  color: var(--color-neutral-dark);
}

.column-table {
  width: 100%;
  border-collapse: collapse;
}

.column-table td {
  padding: 6px 8px;
  font-size: 12px;
  border-bottom: 1px solid var(--color-neutral-light);
}

.column-table code {
  background: var(--color-neutral-light);
  padding: 2px 6px;
  border-radius: 3px;
}

.test-badge {
  font-size: 11px;
  color: var(--color-decorative);
  font-weight: 600;
}
```

---

## Template 3: Test Coverage Summary

**Purpose:** Show test coverage across models with pass/fail status.

**HTML Structure:**
```html
<div class="test-coverage">
  <h4>Test Coverage Report</h4>
  <table class="coverage-table">
    <thead>
      <tr>
        <th>Model</th>
        <th>Schema Tests</th>
        <th>Custom Tests</th>
        <th>Freshness</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="model-name">fct_orders</td>
        <td>4/4</td>
        <td>2/2</td>
        <td class="score" data-score="good">Fresh</td>
        <td><span class="status-badge pass">Pass</span></td>
      </tr>
      <tr>
        <td class="model-name">dim_customers</td>
        <td>3/3</td>
        <td>1/1</td>
        <td class="score" data-score="good">Fresh</td>
        <td><span class="status-badge pass">Pass</span></td>
      </tr>
      <tr>
        <td class="model-name">stg_payments</td>
        <td>2/3</td>
        <td>0/0</td>
        <td class="score" data-score="poor">Stale</td>
        <td><span class="status-badge fail">Fail</span></td>
      </tr>
    </tbody>
  </table>
</div>
```

**CSS Styling:**
```css
.test-coverage {
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  padding: 16px;
}

.coverage-table {
  width: 100%;
  border-collapse: collapse;
}

.coverage-table th {
  background: var(--color-neutral-light);
  padding: 10px;
  text-align: left;
  font-size: 12px;
  font-weight: 600;
  border-bottom: 2px solid var(--color-neutral-border);
}

.coverage-table td {
  padding: 10px;
  font-size: 13px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.model-name {
  font-family: monospace;
  font-weight: 600;
}

.status-badge {
  padding: 3px 8px;
  border-radius: 4px;
  font-size: 11px;
  font-weight: 600;
}

.status-badge.pass {
  background: var(--color-decorative);
  color: white;
}

.status-badge.fail {
  background: var(--color-critical);
  color: white;
}
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Customize content** (model names, column descriptions, test results)
3. **Apply color tokens** for consistency and semantic meaning
4. **Link templates** (layer diagram → model cards → test coverage)
5. **Ensure responsive design** for wide layer diagrams and tables

All templates follow accessibility best practices (semantic HTML, color + text distinction, adequate contrast).
