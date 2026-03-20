---
name: ml-system-patterns
description: HTML templates and visual patterns for ML system topology diagrams, feature store cards, experiment tracking tables, model serving architecture, and MLOps pipeline views
---

## ML System Architecture Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for ML/AI system architecture documentation artifacts.

---

## Design Tokens

**Color Palette:**
```css
--color-primary: #6366F1;        /* Orange — primary actions, highlighted elements */
--color-critical: #DC2626;       /* Red — errors, violations, high-severity issues */
--color-warning: #D97706;        /* Amber — warnings, caution items, medium severity */
--color-positive: #22D3EE;       /* Gold — positive outcomes, recommendations */
--color-decorative: #42D36F;     /* Green — decorative only, not semantic status */
--color-neutral-light: #F3F4F6;  /* Light gray — backgrounds, borders */
--color-neutral-dark: #1F2937;   /* Dark gray — text, strong contrast */
--color-neutral-border: #D1D5DB; /* Medium gray — structural dividers */
```

---

## Template 1: ML System Topology Diagram

**Purpose:** Visualize the end-to-end ML system — data flow from sources through feature engineering, training, registry, and serving.

**HTML Structure:**
```html
<section class="ml-topology">
  <h3>ML System Topology</h3>
  <div class="pipeline-flow">
    <div class="pipeline-stage" data-stage="ingestion">
      <span class="stage-name">Data Ingestion</span>
      <div class="components">
        <div class="component">CDC Streams</div>
        <div class="component">Batch Extracts</div>
        <div class="component">Event Bus</div>
      </div>
    </div>
    <div class="flow-arrow">→</div>
    <div class="pipeline-stage" data-stage="features">
      <span class="stage-name">Feature Engineering</span>
      <div class="components">
        <div class="component">Batch Transforms</div>
        <div class="component">Stream Aggregations</div>
        <div class="component">Feature Store</div>
      </div>
    </div>
    <div class="flow-arrow">→</div>
    <div class="pipeline-stage" data-stage="training">
      <span class="stage-name">Training Pipeline</span>
      <div class="components">
        <div class="component">Experiment Tracker</div>
        <div class="component">Training Jobs</div>
        <div class="component">Model Registry</div>
      </div>
    </div>
    <div class="flow-arrow">→</div>
    <div class="pipeline-stage" data-stage="serving">
      <span class="stage-name">Model Serving</span>
      <div class="components">
        <div class="component">REST/gRPC Endpoints</div>
        <div class="component">Batch Scoring</div>
        <div class="component">A/B Router</div>
      </div>
    </div>
    <div class="flow-arrow">→</div>
    <div class="pipeline-stage" data-stage="monitoring">
      <span class="stage-name">Monitoring</span>
      <div class="components">
        <div class="component">Drift Detection</div>
        <div class="component">Performance Metrics</div>
        <div class="component">Retrain Triggers</div>
      </div>
    </div>
  </div>
</section>
```

**CSS Styling:**
```css
.ml-topology {
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  padding: 24px;
  background: var(--color-neutral-light);
}

.pipeline-flow {
  display: flex;
  align-items: flex-start;
  gap: 8px;
  overflow-x: auto;
  padding: 16px 0;
}

.pipeline-stage {
  padding: 16px;
  border-left: 4px solid var(--color-primary);
  background: white;
  border-radius: 4px;
  min-width: 180px;
}

.stage-name {
  display: block;
  font-weight: 600;
  color: var(--color-neutral-dark);
  margin-bottom: 12px;
  font-size: 14px;
}

.flow-arrow {
  font-size: 24px;
  color: var(--color-primary);
  align-self: center;
  font-weight: bold;
}

.components {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.component {
  padding: 6px 10px;
  background: var(--color-neutral-light);
  border: 1px solid var(--color-neutral-border);
  border-radius: 4px;
  font-size: 12px;
  color: var(--color-neutral-dark);
}
```

---

## Template 2: Feature Store Card

**Purpose:** Document a feature group with its computation method, freshness, and consumers.

**HTML Structure:**
```html
<div class="feature-card">
  <div class="card-header">
    <h4>Feature Group: user_purchase_behavior</h4>
    <span class="freshness-badge" data-freshness="realtime">Real-time</span>
  </div>
  <div class="card-body">
    <div class="section">
      <h5>Features</h5>
      <ul class="feature-list">
        <li><code>purchase_count_7d</code> — Rolling 7-day purchase count</li>
        <li><code>avg_order_value_30d</code> — Average order value over 30 days</li>
        <li><code>days_since_last_purchase</code> — Recency metric</li>
      </ul>
    </div>
    <div class="section">
      <h5>Computation</h5>
      <p>Streaming aggregation from order_events topic. Batch backfill from orders table daily.</p>
    </div>
    <div class="section">
      <h5>Consumers</h5>
      <ul class="consumer-list">
        <li><strong>Recommendation Model v3</strong> — online serving</li>
        <li><strong>Churn Prediction Model</strong> — batch training</li>
      </ul>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.feature-card {
  border: 2px solid var(--color-primary);
  border-radius: 8px;
  padding: 16px;
  margin-bottom: 16px;
  background: white;
}

.freshness-badge {
  font-size: 11px;
  padding: 3px 8px;
  border-radius: 4px;
  font-weight: 600;
  text-transform: uppercase;
}

.freshness-badge[data-freshness="realtime"] {
  background: var(--color-decorative);
  color: white;
}

.freshness-badge[data-freshness="daily"] {
  background: var(--color-warning);
  color: white;
}

.freshness-badge[data-freshness="hourly"] {
  background: var(--color-primary);
  color: white;
}

.feature-list {
  margin: 0;
  padding-left: 20px;
  font-size: 13px;
}

.feature-list code {
  background: var(--color-neutral-light);
  padding: 2px 6px;
  border-radius: 3px;
  font-size: 12px;
}
```

---

## Template 3: Model Serving Comparison Matrix

**Purpose:** Compare serving strategies across latency, cost, complexity, and use cases.

**HTML Structure:**
```html
<table class="serving-matrix">
  <thead>
    <tr>
      <th>Serving Pattern</th>
      <th>Latency</th>
      <th>Cost</th>
      <th>Complexity</th>
      <th>Use Case</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="pattern-name">Real-Time Endpoint</td>
      <td class="score" data-score="excellent">&lt;100ms</td>
      <td class="score" data-score="poor">High</td>
      <td class="score" data-score="fair">Moderate</td>
      <td>User-facing predictions, search ranking</td>
    </tr>
    <tr>
      <td class="pattern-name">Batch Scoring</td>
      <td class="score" data-score="poor">Hours</td>
      <td class="score" data-score="excellent">Low</td>
      <td class="score" data-score="excellent">Simple</td>
      <td>Recommendations, risk scoring, reports</td>
    </tr>
    <tr>
      <td class="pattern-name">Streaming Inference</td>
      <td class="score" data-score="good">Seconds</td>
      <td class="score" data-score="fair">Medium</td>
      <td class="score" data-score="poor">High</td>
      <td>Fraud detection, real-time personalization</td>
    </tr>
  </tbody>
</table>
```

---

## Template 4: Experiment Tracking Summary

**Purpose:** Display experiment runs with parameters, metrics, and status for comparison.

**HTML Structure:**
```html
<div class="experiment-tracker">
  <h4>Experiment: churn_prediction_v2</h4>
  <table class="experiment-table">
    <thead>
      <tr>
        <th>Run ID</th>
        <th>Algorithm</th>
        <th>Key Params</th>
        <th>AUC-ROC</th>
        <th>F1</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>run-042</td>
        <td>XGBoost</td>
        <td>depth=6, lr=0.1</td>
        <td class="metric-highlight">0.892</td>
        <td>0.847</td>
        <td><span class="run-status" data-status="champion">Champion</span></td>
      </tr>
      <tr>
        <td>run-041</td>
        <td>LightGBM</td>
        <td>leaves=31, lr=0.05</td>
        <td>0.885</td>
        <td class="metric-highlight">0.851</td>
        <td><span class="run-status" data-status="challenger">Challenger</span></td>
      </tr>
    </tbody>
  </table>
</div>
```

**CSS Styling:**
```css
.experiment-tracker {
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  padding: 16px;
  margin-bottom: 16px;
}

.experiment-table {
  width: 100%;
  border-collapse: collapse;
}

.experiment-table th {
  background: var(--color-neutral-light);
  padding: 10px;
  text-align: left;
  font-size: 12px;
  font-weight: 600;
  border-bottom: 2px solid var(--color-neutral-border);
}

.experiment-table td {
  padding: 10px;
  font-size: 13px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.metric-highlight {
  font-weight: 700;
  color: var(--color-primary);
}

.run-status {
  padding: 3px 8px;
  border-radius: 4px;
  font-size: 11px;
  font-weight: 600;
}

.run-status[data-status="champion"] {
  background: var(--color-positive);
  color: var(--color-neutral-dark);
}

.run-status[data-status="challenger"] {
  background: var(--color-warning);
  color: white;
}

.run-status[data-status="retired"] {
  background: var(--color-neutral-light);
  color: var(--color-neutral-dark);
}
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Customize content** (feature names, model names, experiment results)
3. **Apply color tokens** for consistency and semantic meaning
4. **Ensure responsive design** with horizontal scroll for wide pipeline diagrams
5. **Link templates together** (topology → feature cards → experiment tracking → serving matrix)

All templates follow accessibility best practices (semantic HTML, color + text distinction, adequate contrast).
