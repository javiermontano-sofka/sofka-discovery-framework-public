---
name: database-patterns
description: HTML templates and visual patterns for schema diagrams, index analysis cards, partition maps, replication topologies, and migration timelines
---

## Database Architecture Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for database architecture documentation artifacts.

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

## Template 1: Entity-Relationship Card

**Purpose:** Document entity with attributes, constraints, and relationships

**HTML Structure:**
```html
<div class="entity-card">
  <div class="card-header">
    <h4>Entity: orders</h4>
    <span class="entity-badge">Schema: public</span>
  </div>
  <div class="card-body">
    <div class="section">
      <h5>Columns</h5>
      <table class="column-table">
        <thead>
          <tr><th>Name</th><th>Type</th><th>Constraints</th><th>Notes</th></tr>
        </thead>
        <tbody>
          <tr><td>id</td><td>UUID</td><td>PK, DEFAULT gen_random_uuid()</td><td>Surrogate key</td></tr>
          <tr><td>customer_id</td><td>UUID</td><td>FK → customers(id), NOT NULL</td><td>Indexed</td></tr>
          <tr><td>status</td><td>VARCHAR(20)</td><td>CHECK IN ('pending','confirmed','shipped')</td><td>Enumerated</td></tr>
          <tr><td>total_amount</td><td>NUMERIC(12,2)</td><td>NOT NULL, CHECK >= 0</td><td>Denormalized sum</td></tr>
          <tr><td>created_at</td><td>TIMESTAMPTZ</td><td>NOT NULL, DEFAULT now()</td><td>Partition key</td></tr>
        </tbody>
      </table>
    </div>
    <div class="section">
      <h5>Indexes</h5>
      <ul class="index-list">
        <li><strong>pk_orders:</strong> B-tree on (id) — primary key</li>
        <li><strong>idx_orders_customer:</strong> B-tree on (customer_id) — FK lookup</li>
        <li><strong>idx_orders_created:</strong> B-tree on (created_at) — range queries, partition pruning</li>
        <li><strong>idx_orders_status_partial:</strong> B-tree on (status) WHERE status = 'pending' — partial index</li>
      </ul>
    </div>
    <div class="section">
      <h5>Relationships</h5>
      <ul>
        <li><strong>belongs_to:</strong> customers (customer_id → customers.id)</li>
        <li><strong>has_many:</strong> order_items (orders.id ← order_items.order_id)</li>
        <li><strong>has_one:</strong> shipments (orders.id ← shipments.order_id)</li>
      </ul>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.entity-card {
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

.entity-badge {
  font-size: 12px;
  background: var(--color-primary);
  color: white;
  padding: 4px 8px;
  border-radius: 4px;
}

.column-table {
  width: 100%;
  border-collapse: collapse;
  font-size: 13px;
}

.column-table th {
  text-align: left;
  padding: 8px;
  background: var(--color-neutral-light);
  font-weight: 600;
  border-bottom: 2px solid var(--color-neutral-border);
}

.column-table td {
  padding: 8px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.index-list li {
  margin-bottom: 6px;
  font-size: 13px;
}
```

---

## Template 2: Index Analysis Card

**Purpose:** Evaluate an index against query patterns with performance impact

**HTML Structure:**
```html
<div class="index-analysis">
  <div class="analysis-header">
    <h4>Index: idx_orders_customer_created</h4>
    <span class="index-type">Composite B-tree</span>
  </div>
  <div class="analysis-body">
    <div class="metric-row">
      <span class="label">Definition:</span>
      <code>CREATE INDEX ON orders (customer_id, created_at DESC)</code>
    </div>
    <div class="metric-row">
      <span class="label">Serves Query:</span>
      <code>SELECT * FROM orders WHERE customer_id = ? ORDER BY created_at DESC LIMIT 20</code>
    </div>
    <div class="metric-row">
      <span class="label">Scan Type:</span>
      <p>Index Only Scan (if INCLUDE covers selected columns)</p>
    </div>
    <div class="metric-row">
      <span class="label">Estimated Size:</span>
      <p>~240MB for 50M rows</p>
    </div>
    <div class="metric-row">
      <span class="label">Write Impact:</span>
      <p class="impact-medium">Medium — updated on every INSERT; no impact on UPDATE (non-indexed columns)</p>
    </div>
  </div>
</div>
```

---

## Template 3: Replication Topology Diagram

**Purpose:** Visualize primary-replica topology with lag and failover indicators

**HTML Structure:**
```html
<section class="replication-topology">
  <h3>Replication Topology</h3>
  <div class="node-cluster">
    <div class="node primary">
      <span class="node-role">Primary</span>
      <span class="node-name">db-primary-us-east-1a</span>
      <span class="node-metric">Writes: 2,400 TPS</span>
    </div>
    <div class="replication-arrow sync">
      <span>Sync Replication</span>
      <span class="lag">Lag: 0ms</span>
    </div>
    <div class="node replica">
      <span class="node-role">Sync Replica</span>
      <span class="node-name">db-replica-us-east-1b</span>
      <span class="node-metric">Failover: automatic (30s)</span>
    </div>
    <div class="replication-arrow async">
      <span>Async Replication</span>
      <span class="lag">Lag: 50-200ms</span>
    </div>
    <div class="node replica">
      <span class="node-role">Async Replica (Read)</span>
      <span class="node-name">db-read-us-west-2a</span>
      <span class="node-metric">Reads: 8,000 QPS</span>
    </div>
  </div>
</section>
```

---

## Template 4: Migration Timeline

**Purpose:** Document schema migration sequence with zero-downtime phases

**HTML Structure:**
```html
<div class="migration-timeline">
  <div class="phase" data-phase="expand">
    <span class="phase-label">Phase 1: Expand</span>
    <p>Add new column <code>email_normalized</code> (nullable). Deploy code that writes to both columns.</p>
    <span class="phase-duration">Duration: 1 deploy</span>
  </div>
  <div class="phase" data-phase="backfill">
    <span class="phase-label">Phase 2: Backfill</span>
    <p>Batch update existing rows: <code>UPDATE users SET email_normalized = lower(email) WHERE email_normalized IS NULL LIMIT 10000</code></p>
    <span class="phase-duration">Duration: ~2 hours (50M rows)</span>
  </div>
  <div class="phase" data-phase="switch">
    <span class="phase-label">Phase 3: Switch Reads</span>
    <p>Deploy code that reads from <code>email_normalized</code>. Old column still written for rollback safety.</p>
    <span class="phase-duration">Duration: 1 deploy + validation</span>
  </div>
  <div class="phase" data-phase="contract">
    <span class="phase-label">Phase 4: Contract</span>
    <p>Stop writing to old column. Add NOT NULL constraint to new column. Drop old column after grace period.</p>
    <span class="phase-duration">Duration: 1 deploy + 1 week grace</span>
  </div>
</div>
```

**CSS Styling:**
```css
.migration-timeline {
  border-left: 3px solid var(--color-primary);
  padding-left: 24px;
  margin: 16px 0;
}

.phase {
  position: relative;
  margin-bottom: 24px;
  padding: 16px;
  background: white;
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
}

.phase::before {
  content: '';
  position: absolute;
  left: -32px;
  top: 20px;
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background: var(--color-primary);
  border: 2px solid white;
}

.phase-label {
  display: block;
  font-weight: 600;
  font-size: 14px;
  color: var(--color-neutral-dark);
  margin-bottom: 8px;
}

.phase-duration {
  display: block;
  font-size: 12px;
  color: var(--color-warning);
  margin-top: 8px;
}

.phase[data-phase="expand"] { border-left: 4px solid var(--color-positive); }
.phase[data-phase="backfill"] { border-left: 4px solid var(--color-warning); }
.phase[data-phase="switch"] { border-left: 4px solid var(--color-primary); }
.phase[data-phase="contract"] { border-left: 4px solid var(--color-critical); }
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Customize content** (entity names, column definitions, index details, replication nodes)
3. **Apply color tokens** for consistency and semantic meaning
4. **Link templates together** (entity cards reference indexes; replication topology links to HA section)

All templates follow accessibility best practices (semantic HTML, color + text distinction, adequate contrast).
