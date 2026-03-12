---
name: software-arch-patterns
description: HTML templates and visual patterns for module views, component cards, ADRs, quality attribute scenarios, and pattern comparison matrices
---

## Software Architecture Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for software architecture documentation artifacts.

---

## Design Tokens

**Color Palette:**
```css
--color-primary: #FF7E08;        /* Orange — primary actions, highlighted elements */
--color-critical: #DC2626;       /* Red — errors, violations, high-severity issues */
--color-warning: #D97706;        /* Amber — warnings, caution items, medium severity */
--color-positive: #FFD700;       /* Gold — positive outcomes, recommendations, quality checks */
--color-decorative: #42D36F;     /* Green — decorative only, not semantic status */
--color-neutral-light: #F3F4F6;  /* Light gray — backgrounds, borders */
--color-neutral-dark: #1F2937;   /* Dark gray — text, strong contrast */
--color-neutral-border: #D1D5DB; /* Medium gray — structural dividers */
```

---

## Template 1: Module View Diagram

**Purpose:** Visualize module structure, layer separation, and dependencies

**HTML Structure:**
```html
<section class="module-view">
  <h3>Module View</h3>
  <div class="layer-stack">
    <div class="layer" data-layer="presentation">
      <span class="layer-name">Presentation</span>
      <div class="modules">
        <div class="module">Controllers</div>
        <div class="module">View Models</div>
      </div>
    </div>
    <div class="layer" data-layer="business">
      <span class="layer-name">Business Logic</span>
      <div class="modules">
        <div class="module">Services</div>
        <div class="module">Domain Models</div>
      </div>
    </div>
    <div class="layer" data-layer="persistence">
      <span class="layer-name">Persistence</span>
      <div class="modules">
        <div class="module">Repositories</div>
        <div class="module">ORM Mappers</div>
      </div>
    </div>
    <div class="layer" data-layer="infrastructure">
      <span class="layer-name">Infrastructure</span>
      <div class="modules">
        <div class="module">Cache</div>
        <div class="module">Queue</div>
        <div class="module">Config</div>
      </div>
    </div>
  </div>
  <div class="dependency-arrows">
    <p class="dependency-rule">Dependencies flow downward; upward dependencies are violations.</p>
  </div>
</section>
```

**CSS Styling:**
```css
.module-view {
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  padding: 24px;
  background: var(--color-neutral-light);
}

.layer-stack {
  display: flex;
  flex-direction: column-reverse;
  gap: 16px;
}

.layer {
  padding: 16px;
  border-left: 4px solid var(--color-primary);
  background: white;
  border-radius: 4px;
}

.layer-name {
  display: block;
  font-weight: 600;
  color: var(--color-neutral-dark);
  margin-bottom: 12px;
}

.modules {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.module {
  padding: 8px 12px;
  background: var(--color-neutral-light);
  border: 1px solid var(--color-neutral-border);
  border-radius: 4px;
  font-size: 12px;
  color: var(--color-neutral-dark);
}

.dependency-rule {
  font-size: 12px;
  color: var(--color-neutral-dark);
  margin-top: 12px;
}
```

---

## Template 2: Component Card

**Purpose:** Document individual component responsibility, interfaces, dependencies

**HTML Structure:**
```html
<div class="component-card">
  <div class="card-header">
    <h4>Component: PaymentService</h4>
    <span class="module-badge">Module: Billing</span>
  </div>
  <div class="card-body">
    <div class="section">
      <h5>Responsibility</h5>
      <p>Orchestrates payment processing: validates input, calls payment gateway, updates ledger, publishes events.</p>
    </div>
    <div class="section">
      <h5>Public Interface</h5>
      <code class="interface-block">
        processPayment(request: PaymentRequest): Promise&lt;PaymentResult&gt;
      </code>
    </div>
    <div class="section">
      <h5>Dependencies</h5>
      <ul class="dependency-list">
        <li><strong>Injected:</strong> PaymentGateway, LedgerRepository, EventPublisher</li>
        <li><strong>Internal:</strong> PaymentValidator</li>
        <li><strong>External:</strong> Stripe API (via gateway)</li>
      </ul>
    </div>
    <div class="section">
      <h5>Interaction Pattern</h5>
      <p>Synchronous request-response. Async event publication post-transaction.</p>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.component-card {
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
  color: var(--color-neutral-dark);
}

.module-badge {
  font-size: 12px;
  background: var(--color-primary);
  color: white;
  padding: 4px 8px;
  border-radius: 4px;
}

.section {
  margin-top: 12px;
}

.section h5 {
  margin: 0 0 8px 0;
  font-size: 13px;
  font-weight: 600;
  color: var(--color-neutral-dark);
}

.interface-block {
  display: block;
  padding: 8px 12px;
  background: var(--color-neutral-light);
  border-left: 3px solid var(--color-warning);
  font-family: monospace;
  font-size: 12px;
  color: var(--color-neutral-dark);
  overflow-x: auto;
}

.dependency-list {
  margin: 0;
  padding-left: 20px;
  font-size: 13px;
}

.dependency-list li {
  margin-bottom: 6px;
}
```

---

## Template 3: ADR (Architecture Decision Record)

**Purpose:** Document architectural decisions with context, decision, consequences, alternatives

**HTML Structure:**
```html
<section class="adr">
  <div class="adr-header">
    <h3>ADR-005: Use Repository Pattern for Data Access</h3>
    <span class="adr-status" data-status="accepted">Accepted</span>
  </div>

  <div class="adr-section">
    <h4>Context</h4>
    <p>We need data access abstraction to enable testing and potential database migration.</p>
  </div>

  <div class="adr-section">
    <h4>Decision</h4>
    <p>All data access code is encapsulated in Repository classes. Services depend on IRepository abstraction, not concrete database implementation.</p>
  </div>

  <div class="adr-section">
    <h4>Consequences</h4>
    <ul class="consequence-list">
      <li class="positive">✓ Services easily testable with mock repositories</li>
      <li class="positive">✓ Database migration requires changes in one place</li>
      <li class="negative">✗ Additional abstraction layer adds indirection</li>
      <li class="negative">✗ Over-use can lead to inefficient queries (N+1 problem)</li>
    </ul>
  </div>

  <div class="adr-section">
    <h4>Alternatives Considered</h4>
    <ul>
      <li><strong>Direct database access:</strong> Simpler initially; tightly couples services to schema</li>
      <li><strong>ORM with lazy loading:</strong> Works for simple cases; can cause N+1 surprises</li>
      <li><strong>CQRS with separate read model:</strong> Overkill for current query patterns; revisit if reporting grows</li>
    </ul>
  </div>

  <div class="adr-section">
    <h4>Related ADRs</h4>
    <p>Depends on: ADR-003 (Dependency Injection Framework). Related to: ADR-007 (Async Event Publishing).</p>
  </div>
</section>
```

**CSS Styling:**
```css
.adr {
  border: 1px solid var(--color-neutral-border);
  border-left: 4px solid var(--color-primary);
  padding: 20px;
  margin-bottom: 24px;
  background: white;
  border-radius: 6px;
}

.adr-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 12px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.adr-header h3 {
  margin: 0;
  font-size: 18px;
  color: var(--color-neutral-dark);
}

.adr-status {
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 12px;
  font-weight: 600;
  text-transform: uppercase;
}

.adr-status[data-status="accepted"] {
  background: var(--color-positive);
  color: var(--color-neutral-dark);
}

.adr-status[data-status="proposed"] {
  background: var(--color-warning);
  color: white;
}

.adr-status[data-status="deprecated"] {
  background: var(--color-critical);
  color: white;
}

.adr-section {
  margin-top: 16px;
}

.adr-section h4 {
  margin: 0 0 8px 0;
  font-size: 14px;
  font-weight: 600;
  color: var(--color-neutral-dark);
}

.consequence-list {
  margin: 8px 0 0 0;
  padding-left: 20px;
}

.consequence-list li {
  margin-bottom: 6px;
  font-size: 13px;
}

.consequence-list .positive::before {
  content: "✓ ";
  color: var(--color-positive);
  font-weight: bold;
}

.consequence-list .negative::before {
  content: "✗ ";
  color: var(--color-critical);
  font-weight: bold;
}
```

---

## Template 4: Quality Attribute Scenario Card

**Purpose:** Document how architecture supports a quality attribute with stimulus-response-measure format

**HTML Structure:**
```html
<div class="qa-scenario">
  <div class="scenario-header">
    <h4 data-attribute="performance">Performance: API Response Time</h4>
  </div>
  <div class="scenario-body">
    <div class="scenario-row">
      <span class="label">Stimulus:</span>
      <p>1000 concurrent users request product list</p>
    </div>
    <div class="scenario-row">
      <span class="label">Architecture Response:</span>
      <p>Request routed to load-balanced service cluster. Caching layer (Redis) short-circuits database queries. Response streamed via CDN.</p>
    </div>
    <div class="scenario-row">
      <span class="label">Measure:</span>
      <p>Response completes in ≤200ms (p95) with zero timeouts</p>
    </div>
    <div class="scenario-row">
      <span class="label">Evidence:</span>
      <p>Load test on 3-node cluster achieves target under sustained 1500 RPS.</p>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.qa-scenario {
  border: 1px solid var(--color-neutral-border);
  margin-bottom: 16px;
  border-radius: 6px;
  overflow: hidden;
}

.scenario-header {
  background: var(--color-neutral-light);
  padding: 12px 16px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.scenario-header h4 {
  margin: 0;
  font-size: 14px;
  font-weight: 600;
}

.scenario-header[data-attribute="performance"]::before {
  content: "⚡ ";
  color: var(--color-warning);
}

.scenario-header[data-attribute="security"]::before {
  content: "🔒 ";
  color: var(--color-critical);
}

.scenario-header[data-attribute="availability"]::before {
  content: "📡 ";
  color: var(--color-positive);
}

.scenario-body {
  padding: 16px;
}

.scenario-row {
  display: flex;
  margin-bottom: 12px;
}

.scenario-row:last-child {
  margin-bottom: 0;
}

.label {
  font-weight: 600;
  min-width: 140px;
  color: var(--color-neutral-dark);
  font-size: 12px;
  text-transform: uppercase;
}

.scenario-row p {
  margin: 0;
  font-size: 13px;
  color: var(--color-neutral-dark);
  flex: 1;
}
```

---

## Template 5: Pattern Comparison Matrix

**Purpose:** Compare architectural patterns against quality attributes and constraints

**HTML Structure:**
```html
<table class="pattern-matrix">
  <thead>
    <tr>
      <th>Pattern</th>
      <th>Performance</th>
      <th>Testability</th>
      <th>Deployment Complexity</th>
      <th>Team Size Fit</th>
      <th>Recommendation</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="pattern-name">Layered</td>
      <td class="score" data-score="good">Good</td>
      <td class="score" data-score="fair">Fair</td>
      <td class="score" data-score="good">Simple</td>
      <td class="score" data-score="good">1-10 people</td>
      <td class="recommendation">For traditional business apps</td>
    </tr>
    <tr>
      <td class="pattern-name">Hexagonal</td>
      <td class="score" data-score="good">Good</td>
      <td class="score" data-score="excellent">Excellent</td>
      <td class="score" data-score="fair">Moderate</td>
      <td class="score" data-score="fair">5-20 people</td>
      <td class="recommendation">For integration-heavy systems</td>
    </tr>
    <tr>
      <td class="pattern-name">CQRS</td>
      <td class="score" data-score="excellent">Excellent</td>
      <td class="score" data-score="good">Good</td>
      <td class="score" data-score="poor">Complex</td>
      <td class="score" data-score="fair">10+ people</td>
      <td class="recommendation">For high-scale read-heavy workloads</td>
    </tr>
  </tbody>
</table>
```

**CSS Styling:**
```css
.pattern-matrix {
  width: 100%;
  border-collapse: collapse;
  border: 1px solid var(--color-neutral-border);
  margin-bottom: 16px;
}

.pattern-matrix thead {
  background: var(--color-neutral-light);
}

.pattern-matrix th {
  padding: 12px;
  text-align: left;
  font-weight: 600;
  font-size: 12px;
  color: var(--color-neutral-dark);
  border-bottom: 2px solid var(--color-neutral-border);
}

.pattern-matrix td {
  padding: 12px;
  font-size: 13px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.pattern-name {
  font-weight: 600;
  color: var(--color-neutral-dark);
}

.score {
  text-align: center;
}

.score[data-score="excellent"] {
  color: var(--color-positive);
  font-weight: 600;
}

.score[data-score="good"] {
  color: #10B981;
}

.score[data-score="fair"] {
  color: var(--color-warning);
}

.score[data-score="poor"] {
  color: var(--color-critical);
}

.recommendation {
  font-size: 12px;
  color: var(--color-neutral-dark);
}
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Customize content** (module names, component descriptions, ADR titles)
3. **Apply color tokens** for consistency and semantic meaning
4. **Ensure responsive design** by nesting flexbox/grid appropriately
5. **Link templates together** (module view → component cards → ADRs for decisions affecting those components)

All templates follow accessibility best practices (semantic HTML, color + text distinction, adequate contrast).
