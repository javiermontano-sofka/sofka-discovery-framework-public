---
name: enterprise-arch-patterns
description: HTML templates for capability heatmaps, domain context maps, technology radar visualization, initiative portfolio matrix, and governance checklists
---

## Enterprise Architecture Pattern Reference

Reusable HTML templates and visual patterns for enterprise architecture documentation.

---

## Design Tokens

```css
--color-primary: #6366F1;        /* Orange — enterprise strategy, governance */
--color-critical: #DC2626;       /* Red — high-risk, critical gaps */
--color-warning: #D97706;        /* Amber — medium priority, caution areas */
--color-positive: #22D3EE;       /* Gold — mature capabilities, strategic wins */
--color-decorative: #42D36F;     /* Green — decorative only */
--color-neutral-light: #F3F4F6;  /* Light gray — backgrounds */
--color-neutral-dark: #1F2937;   /* Dark gray — text */
```

---

## Template 1: Capability Heatmap

**Purpose:** Show capability maturity (current vs. target) and identify investment gaps

**HTML Structure:**
```html
<section class="capability-heatmap">
  <h3>Capability Maturity Heatmap</h3>

  <table class="heatmap-table">
    <thead>
      <tr>
        <th>Capability</th>
        <th>Current</th>
        <th>Target</th>
        <th>Gap</th>
        <th>Effort</th>
        <th>Priority</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="capability-name">Acquire Customers</td>
        <td><span class="maturity-badge" data-level="2">2: Defined</span></td>
        <td><span class="maturity-badge" data-level="4">4: Optimized</span></td>
        <td><span class="gap-indicator" data-gap="large">Large</span></td>
        <td>6-9 months</td>
        <td><span class="priority-badge" data-priority="high">High</span></td>
      </tr>
      <tr>
        <td class="capability-name">Customer Identity</td>
        <td><span class="maturity-badge" data-level="3">3: Managed</span></td>
        <td><span class="maturity-badge" data-level="4">4: Optimized</span></td>
        <td><span class="gap-indicator" data-gap="small">Small</span></td>
        <td>2-3 months</td>
        <td><span class="priority-badge" data-priority="medium">Medium</span></td>
      </tr>
      <tr>
        <td class="capability-name">Fraud Detection</td>
        <td><span class="maturity-badge" data-level="1">1: Ad-hoc</span></td>
        <td><span class="maturity-badge" data-level="3">3: Managed</span></td>
        <td><span class="gap-indicator" data-gap="medium">Medium</span></td>
        <td>3-6 months</td>
        <td><span class="priority-badge" data-priority="high">High</span></td>
      </tr>
      <tr>
        <td class="capability-name">Payment Processing</td>
        <td><span class="maturity-badge" data-level="3">3: Managed</span></td>
        <td><span class="maturity-badge" data-level="3">3: Managed</span></td>
        <td><span class="gap-indicator" data-gap="none">None</span></td>
        <td>0 months</td>
        <td><span class="priority-badge" data-priority="low">Maintain</span></td>
      </tr>
    </tbody>
  </table>

  <div class="maturity-scale">
    <h4>Maturity Scale</h4>
    <div class="scale-items">
      <span class="scale-item" data-level="1">1: Ad-hoc — Inconsistent, not documented</span>
      <span class="scale-item" data-level="2">2: Defined — Documented, inconsistent execution</span>
      <span class="scale-item" data-level="3">3: Managed — Standardized, measured, controlled</span>
      <span class="scale-item" data-level="4">4: Optimized — Continuous improvement, automated</span>
      <span class="scale-item" data-level="5">5: Strategic — Competitive advantage</span>
    </div>
  </div>
</section>
```

**CSS:**
```css
.capability-heatmap {
  padding: 24px;
  background: white;
  border-radius: 8px;
  border: 1px solid var(--color-neutral-border);
}

.heatmap-table {
  width: 100%;
  border-collapse: collapse;
  margin: 20px 0;
}

.heatmap-table thead {
  background: var(--color-neutral-light);
}

.heatmap-table th, .heatmap-table td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid var(--color-neutral-border);
  font-size: 12px;
}

.capability-name {
  font-weight: 600;
  color: var(--color-neutral-dark);
}

.maturity-badge {
  display: inline-block;
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 11px;
  font-weight: 600;
}

.maturity-badge[data-level="1"] {
  background: #FEE2E2;
  color: var(--color-critical);
}

.maturity-badge[data-level="2"] {
  background: #FEF3C7;
  color: var(--color-warning);
}

.maturity-badge[data-level="3"] {
  background: #D1FAE5;
  color: #059669;
}

.maturity-badge[data-level="4"], .maturity-badge[data-level="5"] {
  background: var(--color-positive);
  color: var(--color-neutral-dark);
}

.gap-indicator {
  display: inline-block;
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 11px;
  font-weight: 600;
}

.gap-indicator[data-gap="large"] {
  background: #FEE2E2;
  color: var(--color-critical);
}

.gap-indicator[data-gap="medium"] {
  background: #FEF3C7;
  color: var(--color-warning);
}

.gap-indicator[data-gap="small"] {
  background: #D1FAE5;
  color: #059669;
}

.gap-indicator[data-gap="none"] {
  background: var(--color-neutral-light);
  color: var(--color-neutral-dark);
}

.priority-badge {
  display: inline-block;
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 11px;
  font-weight: 600;
  text-transform: uppercase;
}

.priority-badge[data-priority="high"] {
  background: var(--color-critical);
  color: white;
}

.priority-badge[data-priority="medium"] {
  background: var(--color-warning);
  color: white;
}

.priority-badge[data-priority="low"] {
  background: var(--color-neutral-light);
  color: var(--color-neutral-dark);
}

.maturity-scale {
  margin-top: 20px;
  padding-top: 20px;
  border-top: 1px solid var(--color-neutral-border);
}

.scale-items {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.scale-item {
  padding: 8px 12px;
  background: var(--color-neutral-light);
  border-radius: 4px;
  font-size: 12px;
}
```

---

## Template 2: Domain Context Map

**Purpose:** Show bounded contexts and their relationships (DDD)

**HTML Structure:**
```html
<section class="domain-context">
  <h3>Domain Model — Bounded Contexts</h3>

  <div class="context-grid">
    <div class="bounded-context" data-domain="core">
      <h4>Payment Processing</h4>
      <span class="domain-type">Core Domain</span>
      <p>Differentiator; process transactions, manage risk</p>
      <ul class="ubiquitous-language">
        <li>Transaction</li>
        <li>Payment Method</li>
        <li>Risk Score</li>
        <li>Ledger Entry</li>
      </ul>
      <div class="team-ownership">Owned by: Payments Team</div>
    </div>

    <div class="relationship-arrow" data-direction="upstream">
      <span>Upstream</span>
    </div>

    <div class="bounded-context" data-domain="supporting">
      <h4>Customer Identity</h4>
      <span class="domain-type">Supporting Domain</span>
      <p>Necessary; authenticate users, manage identity</p>
      <ul class="ubiquitous-language">
        <li>User</li>
        <li>Identity Provider</li>
        <li>Role</li>
        <li>Permission</li>
      </ul>
      <div class="team-ownership">Owned by: Identity Team</div>
    </div>

    <div class="relationship-arrow" data-direction="downstream">
      <span>Downstream</span>
    </div>

    <div class="bounded-context" data-domain="generic">
      <h4>Email Notifications</h4>
      <span class="domain-type">Generic Domain</span>
      <p>Commoditized; send transactional emails</p>
      <ul class="ubiquitous-language">
        <li>Email</li>
        <li>Template</li>
        <li>Recipient</li>
      </ul>
      <div class="team-ownership">Buy: SendGrid / AWS SES</div>
    </div>
  </div>

  <div class="context-relationships">
    <h4>Relationships</h4>
    <ul>
      <li><strong>Payment Processing ←→ Customer Identity:</strong> Shared Kernel (User, Role)</li>
      <li><strong>Payment Processing → Email Notifications:</strong> Downstream (publish events)</li>
      <li><strong>Customer Identity ←→ Fraud Detection:</strong> ACL (Fraud context sees simplified User)</li>
    </ul>
  </div>
</section>
```

**CSS:**
```css
.domain-context {
  padding: 24px;
  background: white;
  border-radius: 8px;
  border: 1px solid var(--color-neutral-border);
}

.context-grid {
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  gap: 16px;
  margin: 20px 0;
  align-items: center;
}

.bounded-context {
  padding: 16px;
  border: 2px solid var(--color-primary);
  border-radius: 6px;
  background: white;
}

.bounded-context h4 {
  margin: 0 0 8px 0;
  color: var(--color-neutral-dark);
}

.domain-type {
  display: inline-block;
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 11px;
  font-weight: 600;
  text-transform: uppercase;
  margin-bottom: 8px;
}

.bounded-context[data-domain="core"] .domain-type {
  background: #FEE2E2;
  color: var(--color-critical);
}

.bounded-context[data-domain="supporting"] .domain-type {
  background: #FEF3C7;
  color: var(--color-warning);
}

.bounded-context[data-domain="generic"] .domain-type {
  background: var(--color-neutral-light);
  color: var(--color-neutral-dark);
}

.ubiquitous-language {
  margin: 8px 0 12px 0;
  padding-left: 16px;
  font-size: 12px;
}

.team-ownership {
  font-size: 11px;
  color: #666;
  margin-top: 8px;
  padding-top: 8px;
  border-top: 1px solid var(--color-neutral-border);
}

.relationship-arrow {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.relationship-arrow span {
  font-size: 11px;
  font-weight: 600;
  color: var(--color-primary);
}

.context-relationships {
  margin-top: 20px;
  padding-top: 20px;
  border-top: 1px solid var(--color-neutral-border);
}

.context-relationships ul {
  margin: 8px 0 0 20px;
  padding: 0;
  font-size: 12px;
}
```

---

## Template 3: Technology Radar Visualization

**Purpose:** Show technology adoption status (Adopt, Trial, Assess, Hold)

**HTML Structure:**
```html
<section class="tech-radar">
  <h3>Technology Radar</h3>

  <div class="radar-grid">
    <div class="radar-quadrant" data-status="adopt">
      <h4>Adopt</h4>
      <p>Proven; invest in new projects</p>
      <ul class="tech-items">
        <li>
          <strong>Kubernetes</strong>
          <span class="tech-note">Orchestration standard</span>
        </li>
        <li>
          <strong>PostgreSQL</strong>
          <span class="tech-note">Primary RDBMS</span>
        </li>
        <li>
          <strong>React</strong>
          <span class="tech-note">Web frontend</span>
        </li>
        <li>
          <strong>AWS</strong>
          <span class="tech-note">Cloud platform</span>
        </li>
      </ul>
    </div>

    <div class="radar-quadrant" data-status="trial">
      <h4>Trial</h4>
      <p>Being evaluated; limited use</p>
      <ul class="tech-items">
        <li>
          <strong>Kafka</strong>
          <span class="tech-note">Event streaming (pilot)</span>
        </li>
        <li>
          <strong>GraphQL</strong>
          <span class="tech-note">API alternative (2 projects)</span>
        </li>
      </ul>
    </div>

    <div class="radar-quadrant" data-status="assess">
      <h4>Assess</h4>
      <p>Interesting; no production use</p>
      <ul class="tech-items">
        <li>
          <strong>CQRS Pattern</strong>
          <span class="tech-note">Evaluating for analytics</span>
        </li>
        <li>
          <strong>Rust</strong>
          <span class="tech-note">Performance-critical components</span>
        </li>
      </ul>
    </div>

    <div class="radar-quadrant" data-status="hold">
      <h4>Hold</h4>
      <p>Avoid in new projects; migrate existing</p>
      <ul class="tech-items">
        <li>
          <strong>Oracle</strong>
          <span class="tech-note">Migrate to PostgreSQL (EOL 2025)</span>
        </li>
        <li>
          <strong>jQuery</strong>
          <span class="tech-note">Phase out; use React</span>
        </li>
      </ul>
    </div>
  </div>

  <div class="tech-governance">
    <h4>Technology Governance</h4>
    <p>Decisions reviewed by Architecture Review Board quarterly. New technologies require business justification and pilot approval.</p>
  </div>
</section>
```

**CSS:**
```css
.tech-radar {
  padding: 24px;
  background: white;
  border-radius: 8px;
  border: 1px solid var(--color-neutral-border);
}

.radar-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
  margin: 20px 0;
}

.radar-quadrant {
  padding: 16px;
  border-radius: 6px;
  border: 2px solid var(--color-neutral-border);
}

.radar-quadrant[data-status="adopt"] {
  border-color: var(--color-positive);
  background: #FFFBF0;
}

.radar-quadrant[data-status="trial"] {
  border-color: var(--color-warning);
  background: #FFFAF0;
}

.radar-quadrant[data-status="assess"] {
  border-color: #93C5FD;
  background: #F0F9FF;
}

.radar-quadrant[data-status="hold"] {
  border-color: var(--color-critical);
  background: #FEF2F2;
}

.radar-quadrant h4 {
  margin: 0 0 4px 0;
  color: var(--color-neutral-dark);
}

.radar-quadrant p {
  margin: 0 0 12px 0;
  font-size: 12px;
  color: #666;
}

.tech-items {
  margin: 0;
  padding: 0;
  list-style: none;
}

.tech-items li {
  margin-bottom: 12px;
  padding-bottom: 12px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.tech-items li:last-child {
  margin-bottom: 0;
  padding-bottom: 0;
  border-bottom: none;
}

.tech-items strong {
  display: block;
  color: var(--color-neutral-dark);
  font-size: 13px;
}

.tech-note {
  display: block;
  font-size: 11px;
  color: #666;
  margin-top: 4px;
}

.tech-governance {
  margin-top: 20px;
  padding: 16px;
  background: var(--color-neutral-light);
  border-radius: 6px;
}

.tech-governance h4 {
  margin: 0 0 8px 0;
  color: var(--color-neutral-dark);
}

.tech-governance p {
  margin: 0;
  font-size: 12px;
  color: #666;
}
```

---

## Template 4: Initiative Portfolio Matrix

**Purpose:** Plot initiatives by business value and effort, identify priorities

**HTML Structure:**
```html
<section class="initiative-portfolio">
  <h3>Strategic Initiative Portfolio</h3>

  <div class="portfolio-matrix">
    <div class="matrix-section" data-quadrant="high-value-low-effort">
      <h4>Quick Wins</h4>
      <ul class="initiative-list">
        <li class="initiative-item" data-status="in-progress">
          <span class="initiative-name">API Rate Limiting</span>
          <span class="status-badge">In Progress</span>
        </li>
        <li class="initiative-item" data-status="planned">
          <span class="initiative-name">Feature Flags Framework</span>
          <span class="status-badge">Planned Q2</span>
        </li>
      </ul>
    </div>

    <div class="matrix-section" data-quadrant="high-value-high-effort">
      <h4>Strategic Bets</h4>
      <ul class="initiative-list">
        <li class="initiative-item" data-status="in-progress">
          <span class="initiative-name">Fraud Detection ML</span>
          <span class="status-badge">In Progress</span>
        </li>
        <li class="initiative-item" data-status="planned">
          <span class="initiative-name">Microservices Migration</span>
          <span class="status-badge">Q3 Start</span>
        </li>
      </ul>
    </div>

    <div class="matrix-section" data-quadrant="low-value-low-effort">
      <h4>Fill-Ins</h4>
      <ul class="initiative-list">
        <li class="initiative-item" data-status="backlog">
          <span class="initiative-name">Logging Refactor</span>
          <span class="status-badge">Backlog</span>
        </li>
      </ul>
    </div>

    <div class="matrix-section" data-quadrant="low-value-high-effort">
      <h4>Avoid</h4>
      <ul class="initiative-list">
        <li class="initiative-item" data-status="rejected">
          <span class="initiative-name">Full Rewrite (Legacy)</span>
          <span class="status-badge">Rejected</span>
        </li>
      </ul>
    </div>
  </div>

  <div class="portfolio-summary">
    <p><strong>Portfolio Overview:</strong> 12 total initiatives, 4 in progress, $4.2M investment, expected ROI 2.5x in 18 months</p>
  </div>
</section>
```

**CSS:**
```css
.initiative-portfolio {
  padding: 24px;
  background: white;
  border-radius: 8px;
  border: 1px solid var(--color-neutral-border);
}

.portfolio-matrix {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
  margin: 20px 0;
}

.matrix-section {
  padding: 16px;
  border-radius: 6px;
  border: 2px solid var(--color-neutral-border);
}

.matrix-section[data-quadrant="high-value-low-effort"] {
  border-color: var(--color-positive);
  background: #FFFBF0;
}

.matrix-section[data-quadrant="high-value-high-effort"] {
  border-color: var(--color-primary);
  background: #FFF8F0;
}

.matrix-section[data-quadrant="low-value-low-effort"] {
  border-color: var(--color-warning);
  background: #FFFAF0;
}

.matrix-section[data-quadrant="low-value-high-effort"] {
  border-color: var(--color-critical);
  background: #FEF2F2;
}

.matrix-section h4 {
  margin: 0 0 12px 0;
  font-size: 14px;
  color: var(--color-neutral-dark);
}

.initiative-list {
  margin: 0;
  padding: 0;
  list-style: none;
}

.initiative-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 8px 0;
  border-bottom: 1px solid var(--color-neutral-border);
  font-size: 12px;
}

.initiative-item:last-child {
  border-bottom: none;
}

.initiative-name {
  font-weight: 500;
  color: var(--color-neutral-dark);
}

.status-badge {
  padding: 2px 8px;
  border-radius: 3px;
  font-size: 10px;
  font-weight: 600;
  text-transform: uppercase;
}

.initiative-item[data-status="in-progress"] .status-badge {
  background: var(--color-primary);
  color: white;
}

.initiative-item[data-status="planned"] .status-badge {
  background: var(--color-warning);
  color: white;
}

.initiative-item[data-status="backlog"] .status-badge {
  background: var(--color-neutral-light);
  color: var(--color-neutral-dark);
}

.initiative-item[data-status="rejected"] .status-badge {
  background: var(--color-critical);
  color: white;
}

.portfolio-summary {
  margin-top: 20px;
  padding: 16px;
  background: var(--color-neutral-light);
  border-radius: 6px;
  font-size: 12px;
}
```

---

All templates use consistent design tokens, semantic HTML, and responsive grid layouts. Mix and match to build comprehensive enterprise architecture documents.
