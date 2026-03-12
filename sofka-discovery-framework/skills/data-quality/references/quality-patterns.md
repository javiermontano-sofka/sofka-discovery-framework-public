---
name: quality-patterns
description: HTML templates and visual patterns for data profiling summaries, validation rule cards, data contract specifications, anomaly detection views, and SLA monitoring dashboards
---

## Data Quality Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for data quality documentation artifacts.

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

## Template 1: Data Profile Summary Card

**Purpose:** Display statistical profile of a dataset with key health indicators.

**HTML Structure:**
```html
<div class="profile-card">
  <div class="card-header">
    <h4>Profile: orders</h4>
    <span class="health-score" data-health="healthy">Score: 94/100</span>
  </div>
  <div class="card-body">
    <div class="profile-grid">
      <div class="profile-stat">
        <span class="stat-label">Row Count</span>
        <span class="stat-value">2,847,391</span>
        <span class="stat-delta positive">+3.2% vs baseline</span>
      </div>
      <div class="profile-stat">
        <span class="stat-label">Column Count</span>
        <span class="stat-value">24</span>
        <span class="stat-delta neutral">No change</span>
      </div>
      <div class="profile-stat">
        <span class="stat-label">Null Rate (avg)</span>
        <span class="stat-value">1.2%</span>
        <span class="stat-delta positive">-0.3% vs baseline</span>
      </div>
      <div class="profile-stat">
        <span class="stat-label">Duplicate Rate</span>
        <span class="stat-value">0.01%</span>
        <span class="stat-delta positive">Within threshold</span>
      </div>
      <div class="profile-stat">
        <span class="stat-label">Freshness</span>
        <span class="stat-value">12 min ago</span>
        <span class="stat-delta positive">Within SLA</span>
      </div>
      <div class="profile-stat">
        <span class="stat-label">Schema Changes</span>
        <span class="stat-value">0</span>
        <span class="stat-delta neutral">Stable</span>
      </div>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.profile-card {
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

.health-score {
  font-size: 13px;
  font-weight: 700;
  padding: 4px 10px;
  border-radius: 4px;
}

.health-score[data-health="healthy"] {
  background: var(--color-decorative);
  color: white;
}

.health-score[data-health="warning"] {
  background: var(--color-warning);
  color: white;
}

.health-score[data-health="critical"] {
  background: var(--color-critical);
  color: white;
}

.profile-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 12px;
  margin-top: 16px;
}

.profile-stat {
  padding: 10px;
  background: var(--color-neutral-light);
  border-radius: 4px;
  text-align: center;
}

.stat-label {
  display: block;
  font-size: 11px;
  text-transform: uppercase;
  color: var(--color-neutral-dark);
  font-weight: 600;
}

.stat-value {
  display: block;
  font-size: 20px;
  font-weight: 700;
  color: var(--color-neutral-dark);
  margin: 4px 0;
}

.stat-delta {
  display: block;
  font-size: 11px;
}

.stat-delta.positive { color: var(--color-decorative); }
.stat-delta.negative { color: var(--color-critical); }
.stat-delta.neutral { color: var(--color-neutral-dark); }
```

---

## Template 2: Validation Rule Card

**Purpose:** Document a validation rule with severity, logic, and failure action.

**HTML Structure:**
```html
<div class="validation-rule">
  <div class="rule-header">
    <h4>Rule: order_amount_positive</h4>
    <span class="severity-badge" data-severity="critical">Critical</span>
  </div>
  <div class="rule-body">
    <div class="section">
      <h5>Logic</h5>
      <code class="rule-code">order_amount > 0 AND order_amount < 1000000</code>
    </div>
    <div class="section">
      <h5>Applied To</h5>
      <p><code>raw.orders.order_amount</code> — checked on every ingestion batch</p>
    </div>
    <div class="section">
      <h5>On Failure</h5>
      <p><strong>Action:</strong> Quarantine record, alert #data-quality Slack channel</p>
      <p><strong>Escalation:</strong> If >1% failure rate, page on-call data engineer</p>
    </div>
    <div class="section">
      <h5>Last 7 Days</h5>
      <p>Pass rate: 99.97% | Failures: 847 records | Trend: stable</p>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.validation-rule {
  border: 1px solid var(--color-neutral-border);
  border-left: 4px solid var(--color-primary);
  border-radius: 6px;
  padding: 16px;
  margin-bottom: 16px;
  background: white;
}

.rule-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 12px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.rule-header h4 {
  margin: 0;
  font-family: monospace;
  font-size: 14px;
}

.severity-badge {
  font-size: 11px;
  padding: 3px 8px;
  border-radius: 4px;
  font-weight: 600;
  text-transform: uppercase;
}

.severity-badge[data-severity="critical"] {
  background: var(--color-critical);
  color: white;
}

.severity-badge[data-severity="major"] {
  background: var(--color-warning);
  color: white;
}

.severity-badge[data-severity="minor"] {
  background: var(--color-neutral-light);
  color: var(--color-neutral-dark);
}

.rule-code {
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

## Template 3: Data Contract Specification

**Purpose:** Document the formal agreement between data producer and consumer.

**HTML Structure:**
```html
<div class="data-contract">
  <div class="contract-header">
    <h4>Contract: orders_v2</h4>
    <span class="version-badge">v2.1.0</span>
  </div>
  <div class="contract-body">
    <div class="contract-parties">
      <div class="party">
        <span class="party-role">Producer</span>
        <span class="party-name">Backend Team (Orders Service)</span>
      </div>
      <div class="party">
        <span class="party-role">Consumer</span>
        <span class="party-name">Analytics Engineering, ML Team</span>
      </div>
    </div>
    <div class="section">
      <h5>Schema Guarantees</h5>
      <ul>
        <li><code>order_id</code> (STRING, NOT NULL, UNIQUE) — stable, never removed</li>
        <li><code>customer_id</code> (STRING, NOT NULL) — FK to customers</li>
        <li><code>order_amount</code> (DECIMAL(10,2), NOT NULL) — always positive</li>
        <li><code>ordered_at</code> (TIMESTAMP, NOT NULL) — UTC, no future dates</li>
      </ul>
    </div>
    <div class="section">
      <h5>SLA Guarantees</h5>
      <p>Freshness: within 5 minutes of source commit. Completeness: 99.9%. Availability: 99.5%.</p>
    </div>
    <div class="section">
      <h5>Breaking Change Policy</h5>
      <p>Column removal or type change requires 30-day deprecation notice. Additive changes (new columns) are non-breaking.</p>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.data-contract {
  border: 2px solid var(--color-primary);
  border-radius: 8px;
  padding: 16px;
  margin-bottom: 16px;
  background: white;
}

.contract-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 12px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.version-badge {
  font-size: 12px;
  background: var(--color-primary);
  color: white;
  padding: 3px 8px;
  border-radius: 4px;
  font-weight: 600;
  font-family: monospace;
}

.contract-parties {
  display: flex;
  gap: 24px;
  margin: 12px 0;
  padding: 12px;
  background: var(--color-neutral-light);
  border-radius: 4px;
}

.party {
  flex: 1;
}

.party-role {
  display: block;
  font-size: 11px;
  text-transform: uppercase;
  font-weight: 600;
  color: var(--color-primary);
}

.party-name {
  display: block;
  font-size: 13px;
  color: var(--color-neutral-dark);
  margin-top: 4px;
}
```

---

## Template 4: SLA Monitoring Dashboard View

**Purpose:** Display quality SLA compliance across datasets.

**HTML Structure:**
```html
<table class="sla-dashboard">
  <thead>
    <tr>
      <th>Dataset</th>
      <th>Freshness SLA</th>
      <th>Completeness</th>
      <th>Accuracy</th>
      <th>Quality Score</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="dataset-name">orders</td>
      <td class="score" data-score="good">4 min (SLA: 5 min)</td>
      <td class="score" data-score="excellent">99.97%</td>
      <td class="score" data-score="good">99.8%</td>
      <td class="quality-score">94</td>
      <td><span class="sla-status met">Met</span></td>
    </tr>
    <tr>
      <td class="dataset-name">customers</td>
      <td class="score" data-score="good">8 min (SLA: 15 min)</td>
      <td class="score" data-score="good">99.5%</td>
      <td class="score" data-score="fair">98.2%</td>
      <td class="quality-score">87</td>
      <td><span class="sla-status met">Met</span></td>
    </tr>
    <tr>
      <td class="dataset-name">payments</td>
      <td class="score" data-score="poor">32 min (SLA: 10 min)</td>
      <td class="score" data-score="good">99.9%</td>
      <td class="score" data-score="good">99.5%</td>
      <td class="quality-score">72</td>
      <td><span class="sla-status breached">Breached</span></td>
    </tr>
  </tbody>
</table>
```

**CSS Styling:**
```css
.sla-dashboard {
  width: 100%;
  border-collapse: collapse;
  border: 1px solid var(--color-neutral-border);
}

.sla-dashboard thead {
  background: var(--color-neutral-light);
}

.sla-dashboard th {
  padding: 12px;
  text-align: left;
  font-size: 12px;
  font-weight: 600;
  border-bottom: 2px solid var(--color-neutral-border);
}

.sla-dashboard td {
  padding: 12px;
  font-size: 13px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.dataset-name {
  font-weight: 600;
  font-family: monospace;
}

.quality-score {
  font-weight: 700;
  font-size: 16px;
  color: var(--color-primary);
}

.sla-status {
  padding: 3px 8px;
  border-radius: 4px;
  font-size: 11px;
  font-weight: 600;
}

.sla-status.met {
  background: var(--color-decorative);
  color: white;
}

.sla-status.breached {
  background: var(--color-critical);
  color: white;
}

.sla-status.at-risk {
  background: var(--color-warning);
  color: white;
}

.score[data-score="excellent"] { color: var(--color-positive); font-weight: 600; }
.score[data-score="good"] { color: #10B981; }
.score[data-score="fair"] { color: var(--color-warning); }
.score[data-score="poor"] { color: var(--color-critical); font-weight: 600; }
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Customize content** (dataset names, rule definitions, contract details, SLA thresholds)
3. **Apply color tokens** for consistency and semantic meaning
4. **Link templates** (profile cards → validation rules → contracts → SLA dashboard)
5. **Ensure accessibility** (severity communicated via text + color, not color alone)

All templates follow accessibility best practices (semantic HTML, color + text distinction, adequate contrast).
