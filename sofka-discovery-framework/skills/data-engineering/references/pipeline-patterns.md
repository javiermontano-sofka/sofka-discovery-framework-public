---
name: pipeline-patterns
description: HTML templates and visual patterns for ingestion topology diagrams, DAG architecture views, storage zone maps, quality check cards, and lineage visualization
---

## Data Engineering Pipeline Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for data engineering documentation artifacts.

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

## Template 1: Ingestion Source Inventory

**Purpose:** Document all data sources with ingestion method, freshness SLA, and status.

**HTML Structure:**
```html
<section class="source-inventory">
  <h3>Source Inventory</h3>
  <table class="inventory-table">
    <thead>
      <tr>
        <th>Source</th>
        <th>Type</th>
        <th>Method</th>
        <th>Freshness SLA</th>
        <th>Format</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="source-name">PostgreSQL (Orders)</td>
        <td>Database</td>
        <td><span class="method-badge" data-method="cdc">CDC</span></td>
        <td>5 min</td>
        <td>Avro</td>
        <td><span class="status-indicator active">Active</span></td>
      </tr>
      <tr>
        <td class="source-name">Stripe API</td>
        <td>REST API</td>
        <td><span class="method-badge" data-method="batch">Batch</span></td>
        <td>1 hour</td>
        <td>JSON → Parquet</td>
        <td><span class="status-indicator active">Active</span></td>
      </tr>
      <tr>
        <td class="source-name">Clickstream</td>
        <td>Event Stream</td>
        <td><span class="method-badge" data-method="streaming">Streaming</span></td>
        <td>Real-time</td>
        <td>Avro</td>
        <td><span class="status-indicator active">Active</span></td>
      </tr>
      <tr>
        <td class="source-name">Legacy ERP</td>
        <td>SFTP Files</td>
        <td><span class="method-badge" data-method="batch">Batch</span></td>
        <td>Daily</td>
        <td>CSV → Parquet</td>
        <td><span class="status-indicator planned">Planned</span></td>
      </tr>
    </tbody>
  </table>
</section>
```

**CSS Styling:**
```css
.source-inventory {
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  padding: 16px;
  background: white;
}

.inventory-table {
  width: 100%;
  border-collapse: collapse;
}

.inventory-table th {
  background: var(--color-neutral-light);
  padding: 10px 12px;
  text-align: left;
  font-size: 12px;
  font-weight: 600;
  border-bottom: 2px solid var(--color-neutral-border);
}

.inventory-table td {
  padding: 10px 12px;
  font-size: 13px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.source-name {
  font-weight: 600;
  color: var(--color-neutral-dark);
}

.method-badge {
  font-size: 11px;
  padding: 3px 8px;
  border-radius: 4px;
  font-weight: 600;
  text-transform: uppercase;
}

.method-badge[data-method="cdc"] {
  background: var(--color-primary);
  color: white;
}

.method-badge[data-method="batch"] {
  background: var(--color-neutral-light);
  color: var(--color-neutral-dark);
  border: 1px solid var(--color-neutral-border);
}

.method-badge[data-method="streaming"] {
  background: var(--color-decorative);
  color: white;
}

.status-indicator {
  font-size: 11px;
  font-weight: 600;
}

.status-indicator.active {
  color: var(--color-decorative);
}

.status-indicator.planned {
  color: var(--color-warning);
}

.status-indicator.deprecated {
  color: var(--color-critical);
}
```

---

## Template 2: Storage Zone Map

**Purpose:** Visualize the data lake/lakehouse zone architecture with purpose and access patterns.

**HTML Structure:**
```html
<section class="zone-map">
  <h3>Storage Zone Architecture</h3>
  <div class="zone-stack">
    <div class="zone" data-zone="landing">
      <div class="zone-header">
        <span class="zone-name">Landing / Raw</span>
        <span class="zone-access">Write: Ingestion only | Read: Data Engineering</span>
      </div>
      <div class="zone-details">
        <p><strong>Purpose:</strong> Exact copy of source data. Immutable. Append-only.</p>
        <p><strong>Format:</strong> Source-native (JSON, CSV, Avro) → Parquet on landing</p>
        <p><strong>Retention:</strong> 90 days hot, 1 year archive</p>
      </div>
    </div>
    <div class="zone" data-zone="curated">
      <div class="zone-header">
        <span class="zone-name">Curated / Clean</span>
        <span class="zone-access">Write: Transforms | Read: Analytics, ML</span>
      </div>
      <div class="zone-details">
        <p><strong>Purpose:</strong> Validated, deduplicated, typed data. Schema enforced.</p>
        <p><strong>Format:</strong> Delta Lake / Iceberg tables</p>
        <p><strong>Retention:</strong> 2 years with SCD Type 2 history</p>
      </div>
    </div>
    <div class="zone" data-zone="consumption">
      <div class="zone-header">
        <span class="zone-name">Consumption / Marts</span>
        <span class="zone-access">Write: Analytics Engineering | Read: All business users</span>
      </div>
      <div class="zone-details">
        <p><strong>Purpose:</strong> Business-ready models. Star schema, aggregates, KPIs.</p>
        <p><strong>Format:</strong> Delta Lake / Warehouse tables</p>
        <p><strong>Retention:</strong> Current + 3 years history</p>
      </div>
    </div>
  </div>
</section>
```

**CSS Styling:**
```css
.zone-map {
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  padding: 24px;
  background: var(--color-neutral-light);
}

.zone-stack {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.zone {
  background: white;
  border-radius: 4px;
  overflow: hidden;
}

.zone-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px 16px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.zone[data-zone="landing"] .zone-header {
  border-left: 4px solid var(--color-warning);
}

.zone[data-zone="curated"] .zone-header {
  border-left: 4px solid var(--color-primary);
}

.zone[data-zone="consumption"] .zone-header {
  border-left: 4px solid var(--color-positive);
}

.zone-name {
  font-weight: 600;
  font-size: 14px;
  color: var(--color-neutral-dark);
}

.zone-access {
  font-size: 11px;
  color: var(--color-neutral-dark);
}

.zone-details {
  padding: 12px 16px;
}

.zone-details p {
  margin: 4px 0;
  font-size: 13px;
  color: var(--color-neutral-dark);
}
```

---

## Template 3: DAG Architecture View

**Purpose:** Document orchestration DAG structure with tasks, dependencies, and SLAs.

**HTML Structure:**
```html
<div class="dag-view">
  <div class="dag-header">
    <h4>DAG: daily_data_pipeline</h4>
    <span class="sla-badge">SLA: Complete by 06:00 UTC</span>
  </div>
  <div class="dag-body">
    <div class="task-chain">
      <div class="task" data-status="success">
        <span class="task-name">extract_orders</span>
        <span class="task-duration">2m 15s</span>
      </div>
      <div class="task-arrow">→</div>
      <div class="task" data-status="success">
        <span class="task-name">validate_orders</span>
        <span class="task-duration">45s</span>
      </div>
      <div class="task-arrow">→</div>
      <div class="task" data-status="running">
        <span class="task-name">transform_orders</span>
        <span class="task-duration">running...</span>
      </div>
      <div class="task-arrow">→</div>
      <div class="task" data-status="pending">
        <span class="task-name">load_marts</span>
        <span class="task-duration">pending</span>
      </div>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.dag-view {
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  overflow: hidden;
  margin-bottom: 16px;
}

.dag-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px 16px;
  background: var(--color-neutral-light);
  border-bottom: 1px solid var(--color-neutral-border);
}

.dag-header h4 {
  margin: 0;
  font-family: monospace;
  font-size: 14px;
}

.sla-badge {
  font-size: 11px;
  background: var(--color-warning);
  color: white;
  padding: 3px 8px;
  border-radius: 4px;
  font-weight: 600;
}

.dag-body {
  padding: 16px;
}

.task-chain {
  display: flex;
  align-items: center;
  gap: 8px;
  overflow-x: auto;
}

.task {
  padding: 10px 14px;
  border-radius: 4px;
  border: 1px solid var(--color-neutral-border);
  min-width: 130px;
  text-align: center;
}

.task[data-status="success"] {
  border-left: 4px solid var(--color-decorative);
  background: #F0FFF4;
}

.task[data-status="running"] {
  border-left: 4px solid var(--color-primary);
  background: #FFF7ED;
}

.task[data-status="pending"] {
  border-left: 4px solid var(--color-neutral-border);
  background: white;
}

.task[data-status="failed"] {
  border-left: 4px solid var(--color-critical);
  background: #FEF2F2;
}

.task-name {
  display: block;
  font-family: monospace;
  font-size: 12px;
  font-weight: 600;
  color: var(--color-neutral-dark);
}

.task-duration {
  display: block;
  font-size: 11px;
  color: var(--color-neutral-dark);
  margin-top: 4px;
}

.task-arrow {
  font-size: 18px;
  color: var(--color-primary);
  font-weight: bold;
}
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Customize content** (source names, zone details, DAG task names)
3. **Apply color tokens** for consistency and semantic meaning
4. **Link templates** (source inventory → zone map → DAG architecture)
5. **Ensure responsive design** for horizontal scrolling on DAG views

All templates follow accessibility best practices (semantic HTML, color + text distinction, adequate contrast).
