---
name: solutions-arch-patterns
description: HTML templates for solution diagrams, integration matrices, identity flows, observability dashboards, and transition timelines
---

## Solutions Architecture Pattern Reference

Reusable HTML templates, CSS patterns, and structural components for solutions architecture documentation.

---

## Design Tokens

```css
--color-primary: #FF7E08;        /* Orange — primary components, system boundaries */
--color-critical: #DC2626;       /* Red — security risks, critical failures */
--color-warning: #D97706;        /* Amber — warnings, eventual consistency, caution */
--color-positive: #FFD700;       /* Gold — healthy systems, successful states */
--color-decorative: #42D36F;     /* Green — decorative, not semantic */
--color-neutral-light: #F3F4F6;  /* Light gray — backgrounds */
--color-neutral-dark: #1F2937;   /* Dark gray — text */
```

---

## Template 1: C4 Container Diagram

**Purpose:** Show systems/containers, their responsibilities, and communication

**HTML Structure:**
```html
<section class="c4-container">
  <h3>Solution View (C4 Container Diagram)</h3>

  <div class="container-grid">
    <!-- User Actor -->
    <div class="actor actor-user">
      <span>Customer</span>
    </div>

    <!-- Web Container -->
    <div class="container" data-type="web">
      <h4>Web Application</h4>
      <p>Single-page app; React/Vue; runs in browser</p>
    </div>

    <!-- API Container -->
    <div class="container" data-type="api">
      <h4>API Gateway</h4>
      <p>REST endpoint; authentication, rate limiting, routing</p>
    </div>

    <!-- Service Container -->
    <div class="container" data-type="service">
      <h4>Payment Service</h4>
      <p>Core business logic; processes transactions</p>
    </div>

    <!-- External System -->
    <div class="container" data-type="external">
      <h4>Stripe API</h4>
      <p>Third-party payment processor</p>
    </div>

    <!-- Database -->
    <div class="container" data-type="database">
      <h4>PostgreSQL</h4>
      <p>Transactional data store</p>
    </div>
  </div>

  <!-- Relationships -->
  <div class="relationships">
    <div class="relationship">
      <span class="from">Customer</span>
      <span class="protocol">HTTPS</span>
      <span class="to">Web App</span>
    </div>
    <div class="relationship">
      <span class="from">Web App</span>
      <span class="protocol">REST/JSON</span>
      <span class="to">API Gateway</span>
    </div>
    <div class="relationship">
      <span class="from">API Gateway</span>
      <span class="protocol">gRPC</span>
      <span class="to">Payment Service</span>
    </div>
    <div class="relationship">
      <span class="from">Payment Service</span>
      <span class="protocol">HTTPS</span>
      <span class="to">Stripe API</span>
    </div>
    <div class="relationship">
      <span class="from">Payment Service</span>
      <span class="protocol">SQL</span>
      <span class="to">PostgreSQL</span>
    </div>
  </div>
</section>
```

**CSS:**
```css
.c4-container {
  padding: 24px;
  border: 1px solid var(--color-neutral-border);
  border-radius: 8px;
  background: var(--color-neutral-light);
}

.container-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 16px;
  margin: 20px 0;
}

.container, .actor {
  padding: 16px;
  border-radius: 6px;
  text-align: center;
  border: 2px solid var(--color-primary);
}

.container {
  background: white;
}

.container h4 {
  margin: 0 0 8px 0;
  font-size: 14px;
  color: var(--color-neutral-dark);
}

.container p {
  margin: 0;
  font-size: 12px;
  color: #666;
}

.container[data-type="external"] {
  border-color: var(--color-warning);
}

.container[data-type="database"] {
  border-color: var(--color-critical);
}

.actor {
  background: var(--color-primary);
  color: white;
  border: none;
}

.relationships {
  margin-top: 20px;
  padding-top: 20px;
  border-top: 1px solid var(--color-neutral-border);
}

.relationship {
  display: flex;
  align-items: center;
  gap: 16px;
  margin-bottom: 12px;
  font-size: 12px;
}

.from, .to {
  font-weight: 600;
  min-width: 120px;
}

.protocol {
  padding: 4px 8px;
  background: var(--color-warning);
  color: white;
  border-radius: 4px;
  flex: 1;
  text-align: center;
}
```

---

## Template 2: Integration Matrix

**Purpose:** Show which systems communicate, protocols used, and sync/async patterns

**HTML Structure:**
```html
<table class="integration-matrix">
  <thead>
    <tr>
      <th>From System</th>
      <th>To System</th>
      <th>Protocol</th>
      <th>Pattern</th>
      <th>Sync/Async</th>
      <th>Frequency</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Web App</td>
      <td>API Gateway</td>
      <td>REST</td>
      <td>Request-Response</td>
      <td class="sync">Synchronous</td>
      <td>Per user action</td>
    </tr>
    <tr>
      <td>API Gateway</td>
      <td>Payment Service</td>
      <td>gRPC</td>
      <td>Request-Response</td>
      <td class="sync">Synchronous</td>
      <td>Per payment</td>
    </tr>
    <tr>
      <td>Payment Service</td>
      <td>Event Bus</td>
      <td>Kafka</td>
      <td>Publish-Subscribe</td>
      <td class="async">Asynchronous</td>
      <td>Per transaction</td>
    </tr>
    <tr>
      <td>Event Bus</td>
      <td>Notification Service</td>
      <td>Kafka</td>
      <td>Event-Driven</td>
      <td class="async">Asynchronous</td>
      <td>Per event</td>
    </tr>
  </tbody>
</table>
```

**CSS:**
```css
.integration-matrix {
  width: 100%;
  border-collapse: collapse;
  margin: 16px 0;
}

.integration-matrix thead {
  background: var(--color-neutral-light);
}

.integration-matrix th, .integration-matrix td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid var(--color-neutral-border);
  font-size: 12px;
}

.integration-matrix th {
  font-weight: 600;
  color: var(--color-neutral-dark);
}

.integration-matrix .sync {
  color: var(--color-positive);
  font-weight: 600;
}

.integration-matrix .async {
  color: var(--color-warning);
  font-weight: 600;
}
```

---

## Template 3: Identity Flow Diagram

**Purpose:** Show authentication and authorization flow

**HTML Structure:**
```html
<section class="identity-flow">
  <h3>Authentication & Authorization Flow</h3>

  <div class="flow-steps">
    <div class="step" data-step="1">
      <span class="step-number">1</span>
      <div class="step-content">
        <h4>User Login</h4>
        <p>User enters credentials on login page</p>
      </div>
    </div>

    <div class="flow-arrow">→</div>

    <div class="step" data-step="2">
      <span class="step-number">2</span>
      <div class="step-content">
        <h4>Identity Provider</h4>
        <p>Validates credentials, issues JWT token</p>
      </div>
    </div>

    <div class="flow-arrow">→</div>

    <div class="step" data-step="3">
      <span class="step-number">3</span>
      <div class="step-content">
        <h4>Token in Header</h4>
        <p>Client includes JWT in Authorization header</p>
      </div>
    </div>

    <div class="flow-arrow">→</div>

    <div class="step" data-step="4">
      <span class="step-number">4</span>
      <div class="step-content">
        <h4>API Gateway Validation</h4>
        <p>Validates token signature, checks expiry</p>
      </div>
    </div>

    <div class="flow-arrow">→</div>

    <div class="step" data-step="5">
      <span class="step-number">5</span>
      <div class="step-content">
        <h4>Authorization Check</h4>
        <p>Service validates user role/permissions</p>
      </div>
    </div>
  </div>

  <div class="auth-summary">
    <h4>Authentication Method</h4>
    <p><strong>OAuth 2.0 + OpenID Connect</strong> with JWT tokens</p>
    <ul>
      <li>Token expiry: 1 hour</li>
      <li>Refresh token: 7 days</li>
      <li>MFA required for: admin users, sensitive operations</li>
    </ul>
  </div>
</section>
```

**CSS:**
```css
.identity-flow {
  border: 1px solid var(--color-neutral-border);
  padding: 24px;
  border-radius: 8px;
  background: white;
}

.flow-steps {
  display: flex;
  align-items: center;
  gap: 12px;
  margin: 20px 0;
  flex-wrap: wrap;
}

.step {
  display: flex;
  align-items: flex-start;
  gap: 12px;
  padding: 12px;
  border: 1px solid var(--color-primary);
  border-radius: 6px;
  background: var(--color-neutral-light);
  min-width: 150px;
}

.step-number {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 32px;
  height: 32px;
  background: var(--color-primary);
  color: white;
  border-radius: 50%;
  font-weight: 600;
  flex-shrink: 0;
}

.step-content h4 {
  margin: 0 0 4px 0;
  font-size: 13px;
  color: var(--color-neutral-dark);
}

.step-content p {
  margin: 0;
  font-size: 11px;
  color: #666;
}

.flow-arrow {
  font-size: 20px;
  color: var(--color-primary);
  flex-shrink: 0;
}

.auth-summary {
  margin-top: 20px;
  padding: 16px;
  background: var(--color-neutral-light);
  border-radius: 6px;
}

.auth-summary h4 {
  margin: 0 0 8px 0;
  color: var(--color-neutral-dark);
}

.auth-summary ul {
  margin: 8px 0 0 20px;
  padding: 0;
  font-size: 12px;
}
```

---

## Template 4: Observability Dashboard Layout

**Purpose:** Show structure of monitoring dashboard

**HTML Structure:**
```html
<section class="observability-dashboard">
  <h3>Observability Dashboard</h3>

  <div class="dashboard-grid">
    <div class="metric-card" data-severity="ok">
      <h4>API Latency (p95)</h4>
      <div class="metric-value">145ms</div>
      <span class="threshold">Target: &lt;200ms</span>
    </div>

    <div class="metric-card" data-severity="warning">
      <h4>Error Rate</h4>
      <div class="metric-value">1.2%</div>
      <span class="threshold">Alert threshold: &gt;5%</span>
    </div>

    <div class="metric-card" data-severity="critical">
      <h4>Service Availability</h4>
      <div class="metric-value">99.87%</div>
      <span class="threshold">SLO: 99.95%</span>
    </div>

    <div class="metric-card" data-severity="ok">
      <h4>Database Connections</h4>
      <div class="metric-value">42 / 100</div>
      <span class="threshold">Pool: 100 max</span>
    </div>
  </div>

  <div class="alerts-section">
    <h4>Active Alerts</h4>
    <ul class="alerts">
      <li class="alert-item" data-severity="critical">
        <span class="severity-badge">CRITICAL</span>
        Payment Service: 5+ errors in 5min (Check logs)
      </li>
      <li class="alert-item" data-severity="warning">
        <span class="severity-badge">WARNING</span>
        Database: Slow query detected (>2sec)
      </li>
    </ul>
  </div>
</section>
```

**CSS:**
```css
.observability-dashboard {
  padding: 24px;
  background: white;
  border-radius: 8px;
  border: 1px solid var(--color-neutral-border);
}

.dashboard-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 16px;
  margin: 20px 0;
}

.metric-card {
  padding: 16px;
  border-radius: 6px;
  border: 2px solid var(--color-neutral-border);
}

.metric-card[data-severity="ok"] {
  border-color: var(--color-positive);
  background: #FFFBF0;
}

.metric-card[data-severity="warning"] {
  border-color: var(--color-warning);
  background: #FFFAF0;
}

.metric-card[data-severity="critical"] {
  border-color: var(--color-critical);
  background: #FEF2F2;
}

.metric-card h4 {
  margin: 0 0 8px 0;
  font-size: 13px;
  color: var(--color-neutral-dark);
}

.metric-value {
  font-size: 28px;
  font-weight: bold;
  color: var(--color-neutral-dark);
  margin: 8px 0;
}

.threshold {
  display: block;
  font-size: 11px;
  color: #999;
  margin-top: 8px;
}

.alerts-section {
  margin-top: 20px;
  padding-top: 20px;
  border-top: 1px solid var(--color-neutral-border);
}

.alerts {
  margin: 12px 0 0 0;
  padding: 0;
  list-style: none;
}

.alert-item {
  padding: 12px;
  margin-bottom: 8px;
  border-radius: 4px;
  display: flex;
  align-items: center;
  gap: 12px;
  font-size: 12px;
}

.alert-item[data-severity="critical"] {
  background: #FEE2E2;
}

.alert-item[data-severity="warning"] {
  background: #FEF3C7;
}

.severity-badge {
  padding: 2px 8px;
  border-radius: 3px;
  font-size: 10px;
  font-weight: 600;
  white-space: nowrap;
}

.alert-item[data-severity="critical"] .severity-badge {
  background: var(--color-critical);
  color: white;
}

.alert-item[data-severity="warning"] .severity-badge {
  background: var(--color-warning);
  color: white;
}
```

---

## Template 5: Transition Timeline

**Purpose:** Visualize phased rollout and migration milestones

**HTML Structure:**
```html
<section class="transition-timeline">
  <h3>Migration Timeline</h3>

  <div class="timeline">
    <div class="phase" data-phase="build">
      <div class="phase-marker"></div>
      <div class="phase-content">
        <h4>Phase 0: Build & Test</h4>
        <p>Week 1-4: Develop, unit test, integration test</p>
        <ul>
          <li>New system development (4 weeks)</li>
          <li>Integration testing with legacy (2 weeks)</li>
          <li>Performance testing (1 week)</li>
        </ul>
        <span class="phase-status">In Progress</span>
      </div>
    </div>

    <div class="timeline-connector"></div>

    <div class="phase" data-phase="pilot">
      <div class="phase-marker"></div>
      <div class="phase-content">
        <h4>Phase 1: Pilot</h4>
        <p>Week 5-6: Dark launch, internal testing</p>
        <ul>
          <li>Deploy to production (feature flag disabled)</li>
          <li>Internal staff testing</li>
          <li>Smoke tests validation</li>
        </ul>
        <span class="phase-status">Pending</span>
      </div>
    </div>

    <div class="timeline-connector"></div>

    <div class="phase" data-phase="canary">
      <div class="phase-marker"></div>
      <div class="phase-content">
        <h4>Phase 2: Canary (5%)</h4>
        <p>Week 7: 5% of traffic</p>
        <ul>
          <li>Enable for 5% of users</li>
          <li>Monitor error rate, latency</li>
          <li>Rollback if issues detected</li>
        </ul>
        <span class="phase-status">Pending</span>
      </div>
    </div>

    <div class="timeline-connector"></div>

    <div class="phase" data-phase="full">
      <div class="phase-marker"></div>
      <div class="phase-content">
        <h4>Phase 3: Full Rollout</h4>
        <p>Week 8: 100% of traffic</p>
        <ul>
          <li>Expand to 25%, 50%, 100% (based on confidence)</li>
          <li>Decommission legacy system</li>
          <li>Cleanup and documentation</li>
        </ul>
        <span class="phase-status">Pending</span>
      </div>
    </div>
  </div>
</section>
```

**CSS:**
```css
.transition-timeline {
  padding: 24px;
  background: white;
  border-radius: 8px;
  border: 1px solid var(--color-neutral-border);
}

.timeline {
  margin: 20px 0;
  position: relative;
  padding-left: 40px;
}

.phase {
  margin-bottom: 40px;
  position: relative;
}

.phase-marker {
  position: absolute;
  left: -48px;
  top: 0;
  width: 24px;
  height: 24px;
  background: var(--color-primary);
  border: 3px solid white;
  border-radius: 50%;
  z-index: 2;
}

.phase[data-phase="pilot"] .phase-marker,
.phase[data-phase="canary"] .phase-marker,
.phase[data-phase="full"] .phase-marker {
  background: var(--color-neutral-border);
}

.phase[data-phase="build"] .phase-marker {
  background: var(--color-positive);
}

.timeline-connector {
  position: absolute;
  left: -36px;
  width: 2px;
  height: 40px;
  background: var(--color-neutral-border);
  z-index: 1;
}

.phase-content {
  padding: 16px;
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  background: var(--color-neutral-light);
}

.phase-content h4 {
  margin: 0 0 4px 0;
  font-size: 14px;
  color: var(--color-neutral-dark);
}

.phase-content p {
  margin: 0 0 8px 0;
  font-size: 12px;
  color: #666;
}

.phase-content ul {
  margin: 8px 0 12px 20px;
  padding: 0;
  font-size: 12px;
}

.phase-status {
  display: inline-block;
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 11px;
  font-weight: 600;
  text-transform: uppercase;
}

.phase[data-phase="build"] .phase-status {
  background: var(--color-positive);
  color: white;
}

.phase[data-phase="pilot"] .phase-status,
.phase[data-phase="canary"] .phase-status,
.phase[data-phase="full"] .phase-status {
  background: var(--color-warning);
  color: white;
}
```

---

## Using These Templates

1. **C4 Container Diagram:** Start here to show system boundaries and external dependencies
2. **Integration Matrix:** Detail which systems talk to which, protocols, sync/async patterns
3. **Identity Flow:** Show authentication and authorization flows for security review
4. **Observability Dashboard:** Show monitoring and alerting strategy to ops teams
5. **Transition Timeline:** Visualize go-live plan and phased rollout to stakeholders

All templates use consistent color coding and semantic HTML for accessibility.
