---
name: event-patterns
description: HTML templates and visual patterns for event catalog cards, saga flow diagrams, CQRS projections, schema evolution tables, and operational health dashboards
---

## Event Architecture Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for event-driven architecture documentation artifacts.

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

## Template 1: Event Catalog Card

**Purpose:** Document individual events with schema, ownership, and consumer information

**HTML Structure:**
```html
<div class="event-card">
  <div class="card-header">
    <h4>Order.Payment.Completed</h4>
    <div class="header-meta">
      <span class="event-type" data-type="domain">Domain Event</span>
      <span class="version-badge">v2.1.0</span>
    </div>
  </div>
  <div class="card-body">
    <div class="section">
      <h5>Description</h5>
      <p>Emitted when a payment is successfully processed for an order. Triggers fulfillment and notification workflows.</p>
    </div>
    <div class="section">
      <h5>Ownership</h5>
      <p><strong>Producer:</strong> Payment Service (payments-team@company.com)</p>
      <p><strong>Topic:</strong> payments.order.completed</p>
    </div>
    <div class="section">
      <h5>Schema (Avro)</h5>
      <pre class="schema-block">{
  "type": "record",
  "name": "OrderPaymentCompleted",
  "namespace": "com.company.payments",
  "fields": [
    {"name": "eventId", "type": "string"},
    {"name": "timestamp", "type": "long", "logicalType": "timestamp-millis"},
    {"name": "correlationId", "type": "string"},
    {"name": "orderId", "type": "string"},
    {"name": "amount", "type": {"type": "bytes", "logicalType": "decimal", "precision": 10, "scale": 2}},
    {"name": "currency", "type": "string"},
    {"name": "paymentMethod", "type": "string"}
  ]
}</pre>
    </div>
    <div class="section">
      <h5>Consumers</h5>
      <div class="consumer-list">
        <div class="consumer">
          <span class="consumer-name">Fulfillment Service</span>
          <span class="consumer-group">fulfillment-payment-handler</span>
        </div>
        <div class="consumer">
          <span class="consumer-name">Notification Service</span>
          <span class="consumer-group">notifications-payment-handler</span>
        </div>
        <div class="consumer">
          <span class="consumer-name">Analytics Pipeline</span>
          <span class="consumer-group">analytics-payments-ingestion</span>
        </div>
      </div>
    </div>
    <div class="section">
      <h5>Compatibility</h5>
      <p><strong>Mode:</strong> Backward compatible. <strong>Breaking changes:</strong> None since v1.0.0.</p>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.event-card {
  border: 2px solid var(--color-primary);
  border-radius: 8px;
  margin-bottom: 16px;
  overflow: hidden;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px 16px;
  background: var(--color-neutral-light);
  border-bottom: 1px solid var(--color-neutral-border);
}

.card-header h4 {
  margin: 0;
  font-family: monospace;
  font-size: 15px;
  color: var(--color-neutral-dark);
}

.header-meta {
  display: flex;
  gap: 8px;
}

.event-type {
  font-size: 11px;
  font-weight: 600;
  padding: 3px 8px;
  border-radius: 3px;
  text-transform: uppercase;
}

.event-type[data-type="domain"] { background: var(--color-primary); color: white; }
.event-type[data-type="integration"] { background: #2196F3; color: white; }
.event-type[data-type="system"] { background: #6B7280; color: white; }

.version-badge {
  font-size: 11px;
  font-weight: 600;
  padding: 3px 8px;
  border-radius: 3px;
  background: var(--color-neutral-dark);
  color: white;
}

.card-body {
  padding: 16px;
}

.schema-block {
  background: var(--color-neutral-dark);
  color: #E5E7EB;
  padding: 12px 16px;
  border-radius: 4px;
  font-size: 11px;
  font-family: monospace;
  overflow-x: auto;
  line-height: 1.4;
}

.consumer-list {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.consumer {
  display: flex;
  justify-content: space-between;
  padding: 6px 10px;
  background: var(--color-neutral-light);
  border-radius: 4px;
  font-size: 12px;
}

.consumer-name { font-weight: 600; color: var(--color-neutral-dark); }
.consumer-group { font-family: monospace; color: #6B7280; font-size: 11px; }
```

---

## Template 2: Saga Flow Diagram

**Purpose:** Visualize orchestrated saga steps with compensating transactions

**HTML Structure:**
```html
<div class="saga-diagram">
  <h3>Order Fulfillment Saga (Orchestrated)</h3>
  <div class="saga-flow">
    <div class="saga-step" data-status="success">
      <div class="step-header">
        <span class="step-number">1</span>
        <h4>Create Order</h4>
      </div>
      <div class="step-detail">
        <p><strong>Action:</strong> Reserve order in PENDING state</p>
        <p><strong>Compensate:</strong> Cancel order, release reservation</p>
      </div>
    </div>
    <div class="saga-connector">→</div>
    <div class="saga-step" data-status="success">
      <div class="step-header">
        <span class="step-number">2</span>
        <h4>Reserve Inventory</h4>
      </div>
      <div class="step-detail">
        <p><strong>Action:</strong> Decrement available stock</p>
        <p><strong>Compensate:</strong> Release reserved stock</p>
      </div>
    </div>
    <div class="saga-connector">→</div>
    <div class="saga-step" data-status="success">
      <div class="step-header">
        <span class="step-number">3</span>
        <h4>Process Payment</h4>
      </div>
      <div class="step-detail">
        <p><strong>Action:</strong> Charge payment method</p>
        <p><strong>Compensate:</strong> Issue refund</p>
      </div>
    </div>
    <div class="saga-connector">→</div>
    <div class="saga-step" data-status="pending">
      <div class="step-header">
        <span class="step-number">4</span>
        <h4>Ship Order</h4>
      </div>
      <div class="step-detail">
        <p><strong>Action:</strong> Create shipment, update tracking</p>
        <p><strong>Compensate:</strong> Cancel shipment (if not dispatched)</p>
      </div>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.saga-diagram {
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  padding: 24px;
  background: white;
}

.saga-flow {
  display: flex;
  align-items: flex-start;
  gap: 0;
  overflow-x: auto;
}

.saga-step {
  min-width: 180px;
  border: 2px solid var(--color-neutral-border);
  border-radius: 8px;
  overflow: hidden;
}

.saga-step[data-status="success"] { border-color: var(--color-decorative); }
.saga-step[data-status="pending"] { border-color: var(--color-warning); border-style: dashed; }
.saga-step[data-status="failed"] { border-color: var(--color-critical); }

.step-header {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px 12px;
  background: var(--color-neutral-light);
  border-bottom: 1px solid var(--color-neutral-border);
}

.step-number {
  display: inline-block;
  width: 22px;
  height: 22px;
  line-height: 22px;
  text-align: center;
  background: var(--color-primary);
  color: white;
  border-radius: 50%;
  font-size: 11px;
  font-weight: 700;
}

.step-header h4 {
  margin: 0;
  font-size: 13px;
  color: var(--color-neutral-dark);
}

.step-detail {
  padding: 10px 12px;
}

.step-detail p {
  margin: 0 0 6px 0;
  font-size: 11px;
  color: var(--color-neutral-dark);
}

.step-detail p:last-child { margin-bottom: 0; }

.saga-connector {
  display: flex;
  align-items: center;
  padding: 0 8px;
  font-size: 18px;
  color: var(--color-primary);
  font-weight: bold;
  min-height: 80px;
}
```

---

## Template 3: Consumer Lag Dashboard

**Purpose:** Monitor consumer group lag and health across topics

**HTML Structure:**
```html
<div class="lag-dashboard">
  <h3>Consumer Lag Monitor</h3>
  <table class="lag-table">
    <thead>
      <tr>
        <th>Consumer Group</th>
        <th>Topic</th>
        <th>Partitions</th>
        <th>Current Lag</th>
        <th>Lag Trend</th>
        <th>Health</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="group-name">fulfillment-handler</td>
        <td><code>orders.placed</code></td>
        <td>6</td>
        <td>42</td>
        <td class="trend decreasing">Decreasing</td>
        <td><span class="health-dot" data-health="healthy"></span> Healthy</td>
      </tr>
      <tr>
        <td class="group-name">analytics-ingestion</td>
        <td><code>payments.completed</code></td>
        <td>12</td>
        <td>8,547</td>
        <td class="trend increasing">Increasing</td>
        <td><span class="health-dot" data-health="warning"></span> Warning</td>
      </tr>
      <tr>
        <td class="group-name">notification-sender</td>
        <td><code>orders.shipped</code></td>
        <td>3</td>
        <td>0</td>
        <td class="trend stable">Stable</td>
        <td><span class="health-dot" data-health="healthy"></span> Healthy</td>
      </tr>
    </tbody>
  </table>
  <div class="dlq-summary">
    <h4>Dead Letter Queues</h4>
    <div class="dlq-items">
      <div class="dlq-item">
        <span class="dlq-name">fulfillment-handler.dlq</span>
        <span class="dlq-count" data-severity="low">3 messages</span>
        <span class="dlq-age">Oldest: 2h ago</span>
      </div>
      <div class="dlq-item">
        <span class="dlq-name">analytics-ingestion.dlq</span>
        <span class="dlq-count" data-severity="high">127 messages</span>
        <span class="dlq-age">Oldest: 18h ago</span>
      </div>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.lag-dashboard {
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  padding: 24px;
  background: white;
}

.lag-table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

.lag-table th {
  padding: 10px;
  text-align: left;
  font-weight: 600;
  font-size: 12px;
  background: var(--color-neutral-light);
  border-bottom: 2px solid var(--color-neutral-border);
}

.lag-table td {
  padding: 10px;
  font-size: 13px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.group-name { font-weight: 600; font-family: monospace; }

.trend { font-size: 12px; font-weight: 600; }
.trend.decreasing { color: var(--color-decorative); }
.trend.increasing { color: var(--color-critical); }
.trend.stable { color: #6B7280; }

.health-dot {
  display: inline-block;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  margin-right: 4px;
}

.health-dot[data-health="healthy"] { background: var(--color-decorative); }
.health-dot[data-health="warning"] { background: var(--color-warning); }
.health-dot[data-health="critical"] { background: var(--color-critical); }

.dlq-summary {
  border-top: 1px solid var(--color-neutral-border);
  padding-top: 16px;
}

.dlq-summary h4 {
  margin: 0 0 12px 0;
  font-size: 14px;
  color: var(--color-neutral-dark);
}

.dlq-items {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.dlq-item {
  display: flex;
  align-items: center;
  gap: 16px;
  padding: 8px 12px;
  background: var(--color-neutral-light);
  border-radius: 4px;
  font-size: 12px;
}

.dlq-name { font-family: monospace; font-weight: 600; flex: 1; }
.dlq-count[data-severity="low"] { color: var(--color-warning); font-weight: 600; }
.dlq-count[data-severity="high"] { color: var(--color-critical); font-weight: 600; }
.dlq-age { color: #6B7280; }
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Customize content** (event names, schemas, saga steps, consumer groups, lag metrics)
3. **Apply color tokens** for consistency and semantic meaning
4. **Ensure responsive design** by nesting flexbox/grid appropriately
5. **Link templates together** (event catalog → saga flow → consumer lag dashboard)

All templates follow accessibility best practices (semantic HTML, color + text distinction, adequate contrast).
