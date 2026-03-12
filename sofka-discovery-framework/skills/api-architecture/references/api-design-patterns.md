---
name: api-design-patterns
description: HTML templates and visual patterns for API style comparison matrices, endpoint documentation cards, versioning timelines, security flow diagrams, and governance dashboards
---

## API Architecture Design Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for API architecture documentation artifacts.

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

## Template 1: API Style Comparison Matrix

**Purpose:** Compare API styles against key criteria to justify selection

**HTML Structure:**
```html
<table class="api-style-matrix">
  <thead>
    <tr>
      <th>Criteria</th>
      <th>REST</th>
      <th>GraphQL</th>
      <th>gRPC</th>
      <th>AsyncAPI / Events</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="criteria-name">Data Fetching</td>
      <td>Fixed endpoints, potential over-fetching</td>
      <td class="highlight">Client-defined queries, precise data</td>
      <td>Defined in .proto, strong typing</td>
      <td>Push-based, event payloads</td>
    </tr>
    <tr>
      <td class="criteria-name">Performance</td>
      <td>HTTP/1.1 or HTTP/2, JSON, caching</td>
      <td>Single endpoint, batched queries</td>
      <td class="highlight">Binary (protobuf), HTTP/2, streaming</td>
      <td>Async, no request/response overhead</td>
    </tr>
    <tr>
      <td class="criteria-name">Tooling</td>
      <td class="highlight">Broadest ecosystem, OpenAPI</td>
      <td>Growing ecosystem, GraphiQL</td>
      <td>Code gen, reflection, strong typing</td>
      <td>AsyncAPI, broker-specific tools</td>
    </tr>
    <tr>
      <td class="criteria-name">Browser Support</td>
      <td class="highlight">Native fetch, universal</td>
      <td class="highlight">HTTP POST, universal</td>
      <td>Requires grpc-web proxy</td>
      <td>WebSocket, SSE</td>
    </tr>
    <tr>
      <td class="criteria-name">Best Fit</td>
      <td>Public APIs, CRUD, simple domains</td>
      <td>Complex UIs, mobile, varied queries</td>
      <td>Internal services, high throughput</td>
      <td>Real-time, notifications, decoupled</td>
    </tr>
  </tbody>
</table>
```

**CSS Styling:**
```css
.api-style-matrix {
  width: 100%;
  border-collapse: collapse;
  border: 1px solid var(--color-neutral-border);
  margin-bottom: 16px;
}

.api-style-matrix thead {
  background: var(--color-neutral-light);
}

.api-style-matrix th {
  padding: 12px;
  text-align: left;
  font-weight: 600;
  font-size: 12px;
  border-bottom: 2px solid var(--color-neutral-border);
}

.api-style-matrix td {
  padding: 10px 12px;
  font-size: 13px;
  border-bottom: 1px solid var(--color-neutral-border);
  vertical-align: top;
}

.criteria-name {
  font-weight: 600;
  color: var(--color-neutral-dark);
  min-width: 120px;
}

.highlight {
  background: #FFFBEB;
  font-weight: 500;
}
```

---

## Template 2: API Endpoint Documentation Card

**Purpose:** Document individual API endpoints with request/response examples

**HTML Structure:**
```html
<div class="endpoint-card">
  <div class="endpoint-header">
    <span class="method" data-method="POST">POST</span>
    <code class="path">/api/v1/orders</code>
    <span class="auth-badge">OAuth 2.0</span>
  </div>
  <div class="endpoint-body">
    <div class="section">
      <h5>Description</h5>
      <p>Creates a new order. Validates inventory availability, calculates total, and returns order confirmation.</p>
    </div>
    <div class="section">
      <h5>Request Body</h5>
      <pre class="code-block">{
  "customer_id": "cust_12345",
  "items": [
    { "sku": "WIDGET-001", "quantity": 2 }
  ],
  "shipping_address": {
    "street": "123 Main St",
    "city": "Austin",
    "state": "TX",
    "zip": "78701"
  }
}</pre>
    </div>
    <div class="section">
      <h5>Response (201 Created)</h5>
      <pre class="code-block">{
  "order_id": "ord_98765",
  "status": "confirmed",
  "total": 49.98,
  "estimated_delivery": "2026-03-18"
}</pre>
    </div>
    <div class="section">
      <h5>Error Responses</h5>
      <div class="error-list">
        <div class="error-item"><code>400</code> Invalid request body — missing required fields</div>
        <div class="error-item"><code>401</code> Authentication required</div>
        <div class="error-item"><code>422</code> Insufficient inventory for requested items</div>
        <div class="error-item"><code>429</code> Rate limit exceeded — retry after header provided</div>
      </div>
    </div>
    <div class="section">
      <h5>Rate Limits</h5>
      <p>100 requests/minute per API key. Burst: 20 requests/second.</p>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.endpoint-card {
  border: 2px solid var(--color-neutral-border);
  border-radius: 8px;
  margin-bottom: 16px;
  overflow: hidden;
}

.endpoint-header {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px 16px;
  background: var(--color-neutral-light);
  border-bottom: 1px solid var(--color-neutral-border);
}

.method {
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 11px;
  font-weight: 700;
  text-transform: uppercase;
}

.method[data-method="GET"] { background: var(--color-decorative); color: var(--color-neutral-dark); }
.method[data-method="POST"] { background: var(--color-primary); color: white; }
.method[data-method="PUT"] { background: #2196F3; color: white; }
.method[data-method="PATCH"] { background: var(--color-warning); color: white; }
.method[data-method="DELETE"] { background: var(--color-critical); color: white; }

.path {
  font-family: monospace;
  font-size: 14px;
  font-weight: 600;
  color: var(--color-neutral-dark);
}

.auth-badge {
  margin-left: auto;
  font-size: 11px;
  padding: 3px 8px;
  border-radius: 3px;
  background: #EDE9FE;
  color: #7C3AED;
  font-weight: 600;
}

.endpoint-body {
  padding: 16px;
}

.code-block {
  background: var(--color-neutral-dark);
  color: #E5E7EB;
  padding: 12px 16px;
  border-radius: 4px;
  font-size: 12px;
  font-family: monospace;
  overflow-x: auto;
  line-height: 1.5;
}

.error-list {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.error-item {
  font-size: 12px;
  color: var(--color-neutral-dark);
}

.error-item code {
  display: inline-block;
  min-width: 32px;
  text-align: center;
  padding: 2px 6px;
  background: var(--color-neutral-light);
  border-radius: 3px;
  font-size: 11px;
  font-weight: 600;
  margin-right: 8px;
}
```

---

## Template 3: API Version Lifecycle Timeline

**Purpose:** Visualize API version lifecycle stages and sunset schedule

**HTML Structure:**
```html
<div class="version-timeline">
  <h3>API Version Lifecycle</h3>
  <div class="timeline">
    <div class="version-row">
      <span class="version-label">v1</span>
      <div class="lifecycle-bar">
        <div class="phase" data-phase="stable" style="width: 40%;">Stable</div>
        <div class="phase" data-phase="deprecated" style="width: 30%;">Deprecated</div>
        <div class="phase" data-phase="sunset" style="width: 30%;">Sunset</div>
      </div>
      <span class="date-range">Jan 2024 — Jun 2026</span>
    </div>
    <div class="version-row">
      <span class="version-label">v2</span>
      <div class="lifecycle-bar">
        <div class="phase" data-phase="beta" style="width: 15%;">Beta</div>
        <div class="phase" data-phase="stable" style="width: 85%;">Stable (current)</div>
      </div>
      <span class="date-range">Sep 2025 — Active</span>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.version-timeline {
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  padding: 24px;
  background: white;
}

.version-row {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 12px;
}

.version-label {
  min-width: 40px;
  font-weight: 700;
  font-size: 14px;
  color: var(--color-neutral-dark);
}

.lifecycle-bar {
  flex: 1;
  display: flex;
  height: 28px;
  border-radius: 4px;
  overflow: hidden;
}

.phase {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 11px;
  font-weight: 600;
  color: white;
}

.phase[data-phase="beta"] { background: #8B5CF6; }
.phase[data-phase="stable"] { background: var(--color-decorative); color: var(--color-neutral-dark); }
.phase[data-phase="deprecated"] { background: var(--color-warning); }
.phase[data-phase="sunset"] { background: var(--color-critical); }

.date-range {
  min-width: 140px;
  font-size: 11px;
  color: #6B7280;
  text-align: right;
}
```

---

## Template 4: API Governance Scorecard

**Purpose:** Score APIs on design quality, documentation, adoption, and operational health

**HTML Structure:**
```html
<div class="api-scorecard">
  <h3>API Health Scorecard: Orders API v2</h3>
  <div class="score-grid">
    <div class="score-item">
      <h4>Design Quality</h4>
      <span class="score-value" data-health="good">92%</span>
      <p>Passes 23/25 linting rules. 2 warnings: missing examples on 2 endpoints.</p>
    </div>
    <div class="score-item">
      <h4>Documentation</h4>
      <span class="score-value" data-health="good">88%</span>
      <p>All endpoints documented. Getting-started guide available. Missing: SDK examples.</p>
    </div>
    <div class="score-item">
      <h4>Adoption</h4>
      <span class="score-value" data-health="good">15 consumers</span>
      <p>12 internal services, 3 partner integrations. 45K requests/day average.</p>
    </div>
    <div class="score-item">
      <h4>Error Rate</h4>
      <span class="score-value" data-health="warning">2.3%</span>
      <p>Above target (1%). Primarily 422 errors from legacy partner integration.</p>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.api-scorecard {
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  padding: 24px;
  background: white;
}

.score-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
}

.score-item {
  padding: 16px;
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
}

.score-item h4 {
  margin: 0 0 8px 0;
  font-size: 13px;
  color: var(--color-neutral-dark);
}

.score-value {
  display: block;
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 8px;
}

.score-value[data-health="good"] { color: var(--color-decorative); }
.score-value[data-health="warning"] { color: var(--color-warning); }
.score-value[data-health="critical"] { color: var(--color-critical); }

.score-item p {
  margin: 0;
  font-size: 12px;
  color: #6B7280;
}
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Customize content** (API names, endpoints, versions, scores)
3. **Apply color tokens** for consistency and semantic meaning
4. **Ensure responsive design** by nesting flexbox/grid appropriately
5. **Link templates together** (style matrix → endpoint cards → version timeline → governance scorecard)

All templates follow accessibility best practices (semantic HTML, color + text distinction, adequate contrast).
