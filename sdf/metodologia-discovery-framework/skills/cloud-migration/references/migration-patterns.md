---
name: migration-patterns
description: HTML templates and visual patterns for 7R classification tables, dependency maps, wave timelines, landing zone diagrams, and cutover checklists
---

## Cloud Migration Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for cloud migration documentation artifacts.

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

## Template 1: 7R Classification Table

**Purpose:** Display application-by-application migration strategy with rationale

**HTML Structure:**
```html
<section class="classification-table">
  <h3>7R Application Classification</h3>
  <table class="r7-table">
    <thead>
      <tr><th>Application</th><th>Strategy</th><th>Criticality</th><th>Effort</th><th>Risk</th><th>Wave</th><th>Rationale</th></tr>
    </thead>
    <tbody>
      <tr>
        <td class="app-name">Customer Portal</td>
        <td><span class="strategy-badge replatform">Replatform</span></td>
        <td><span class="criticality tier-1">Tier 1</span></td>
        <td>Medium</td>
        <td>Medium</td>
        <td>Wave 3</td>
        <td>Move to managed DB (RDS), containerize app layer. Moderate modernization benefit.</td>
      </tr>
      <tr>
        <td class="app-name">Legacy Reporting</td>
        <td><span class="strategy-badge retire">Retire</span></td>
        <td><span class="criticality tier-4">Tier 4</span></td>
        <td>Low</td>
        <td>Low</td>
        <td>Wave 1</td>
        <td>Replaced by PowerBI dashboards. 3 remaining users migrated to new tool.</td>
      </tr>
      <tr>
        <td class="app-name">Payment Gateway</td>
        <td><span class="strategy-badge refactor">Refactor</span></td>
        <td><span class="criticality tier-1">Tier 1</span></td>
        <td>High</td>
        <td>High</td>
        <td>Wave 5</td>
        <td>Strategic system, 10-year lifecycle. Redesign for cloud-native, event-driven.</td>
      </tr>
      <tr>
        <td class="app-name">HR System</td>
        <td><span class="strategy-badge repurchase">Repurchase</span></td>
        <td><span class="criticality tier-2">Tier 2</span></td>
        <td>Medium</td>
        <td>Low</td>
        <td>Wave 2</td>
        <td>Replace with Workday SaaS. Custom HR system costly to maintain.</td>
      </tr>
    </tbody>
  </table>
</section>
```

**CSS Styling:**
```css
.r7-table {
  width: 100%;
  border-collapse: collapse;
  font-size: 13px;
}

.r7-table th {
  padding: 12px;
  text-align: left;
  background: var(--color-neutral-light);
  font-weight: 600;
  border-bottom: 2px solid var(--color-neutral-border);
}

.r7-table td {
  padding: 12px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.strategy-badge {
  display: inline-block;
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 11px;
  font-weight: 600;
  text-transform: uppercase;
}

.strategy-badge.rehost { background: #DBEAFE; color: #1E40AF; }
.strategy-badge.replatform { background: #FEF3C7; color: #92400E; }
.strategy-badge.refactor { background: #FCE7F3; color: #9D174D; }
.strategy-badge.repurchase { background: #E0E7FF; color: #3730A3; }
.strategy-badge.retire { background: #FEE2E2; color: #991B1B; }
.strategy-badge.retain { background: var(--color-neutral-light); color: var(--color-neutral-dark); }
.strategy-badge.relocate { background: #D1FAE5; color: #065F46; }

.criticality {
  font-size: 11px;
  font-weight: 600;
  padding: 2px 6px;
  border-radius: 3px;
}

.criticality.tier-1 { background: var(--color-critical); color: white; }
.criticality.tier-2 { background: var(--color-warning); color: white; }
.criticality.tier-3 { background: var(--color-positive); color: var(--color-neutral-dark); }
.criticality.tier-4 { background: var(--color-neutral-light); color: var(--color-neutral-dark); }
```

---

## Template 2: Wave Timeline

**Purpose:** Visualize migration waves with dependencies and milestones

**HTML Structure:**
```html
<section class="wave-timeline">
  <h3>Migration Wave Plan</h3>
  <div class="timeline">
    <div class="wave" data-wave="0">
      <div class="wave-header">
        <span class="wave-label">Wave 0: Foundation</span>
        <span class="wave-dates">Weeks 1-4</span>
      </div>
      <div class="wave-content">
        <ul class="wave-items">
          <li>Landing zone provisioned (accounts, VPCs, IAM)</li>
          <li>VPN connectivity established</li>
          <li>Monitoring and logging deployed</li>
          <li>Migration tooling validated</li>
        </ul>
        <span class="wave-gate">Gate: Security review + connectivity test passed</span>
      </div>
    </div>
    <div class="wave" data-wave="1">
      <div class="wave-header">
        <span class="wave-label">Wave 1: Pilot</span>
        <span class="wave-dates">Weeks 5-8</span>
      </div>
      <div class="wave-content">
        <ul class="wave-items">
          <li>Internal Wiki (rehost) — low risk, isolated</li>
          <li>Legacy Reporting (retire) — decommission</li>
          <li>Dev/Test environments — validate process</li>
        </ul>
        <span class="wave-gate">Gate: Pilot retrospective + process refinement</span>
      </div>
    </div>
    <div class="wave" data-wave="2">
      <div class="wave-header">
        <span class="wave-label">Wave 2: Expansion</span>
        <span class="wave-dates">Weeks 9-14</span>
      </div>
      <div class="wave-content">
        <ul class="wave-items">
          <li>HR System (repurchase → Workday SaaS)</li>
          <li>Marketing Site (rehost)</li>
          <li>Analytics Platform (replatform → managed services)</li>
        </ul>
        <span class="wave-gate">Gate: Performance validation + cost comparison</span>
      </div>
    </div>
  </div>
</section>
```

**CSS Styling:**
```css
.wave-timeline {
  padding: 24px;
  background: var(--color-neutral-light);
  border-radius: 6px;
}

.timeline {
  border-left: 3px solid var(--color-primary);
  padding-left: 24px;
}

.wave {
  margin-bottom: 24px;
  background: white;
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  overflow: hidden;
}

.wave-header {
  display: flex;
  justify-content: space-between;
  padding: 12px 16px;
  background: var(--color-neutral-light);
  border-bottom: 1px solid var(--color-neutral-border);
}

.wave-label {
  font-weight: 600;
  color: var(--color-neutral-dark);
}

.wave-dates {
  font-size: 12px;
  color: var(--color-primary);
  font-weight: 600;
}

.wave-content {
  padding: 16px;
}

.wave-items {
  margin: 0 0 12px 0;
  padding-left: 20px;
  font-size: 13px;
}

.wave-gate {
  display: block;
  font-size: 12px;
  font-weight: 600;
  color: var(--color-warning);
  border-top: 1px solid var(--color-neutral-border);
  padding-top: 8px;
  margin-top: 8px;
}
```

---

## Template 3: Landing Zone Diagram

**Purpose:** Visualize cloud account structure and networking

**HTML Structure:**
```html
<section class="landing-zone">
  <h3>Landing Zone Architecture</h3>
  <div class="account-tree">
    <div class="account management">
      <span class="account-type">Management Account</span>
      <span class="account-name">org-management</span>
      <ul class="account-services">
        <li>AWS Organizations</li>
        <li>Billing & Cost Explorer</li>
        <li>SCPs (Service Control Policies)</li>
      </ul>
    </div>
    <div class="account-group">
      <div class="account shared">
        <span class="account-type">Shared Services</span>
        <span class="account-name">shared-security</span>
        <ul class="account-services">
          <li>GuardDuty, Security Hub</li>
          <li>Centralized logging (S3 + Athena)</li>
          <li>VPN / Direct Connect hub</li>
        </ul>
      </div>
      <div class="account workload">
        <span class="account-type">Workload — Production</span>
        <span class="account-name">app-production</span>
        <ul class="account-services">
          <li>VPC: 10.1.0.0/16</li>
          <li>EKS cluster, RDS, ElastiCache</li>
          <li>Transit Gateway peering</li>
        </ul>
      </div>
      <div class="account workload">
        <span class="account-type">Workload — Non-Prod</span>
        <span class="account-name">app-nonprod</span>
        <ul class="account-services">
          <li>VPC: 10.2.0.0/16</li>
          <li>Dev + Staging environments</li>
          <li>Reduced capacity, spot nodes</li>
        </ul>
      </div>
    </div>
  </div>
</section>
```

---

## Template 4: Cutover Checklist

**Purpose:** Step-by-step cutover execution with status tracking

**HTML Structure:**
```html
<div class="cutover-checklist">
  <h4>Cutover Checklist: Customer Portal (Wave 3)</h4>
  <div class="checklist-phase">
    <h5>Pre-Cutover (T-24h)</h5>
    <ul class="checklist">
      <li data-status="complete">Final data sync initiated</li>
      <li data-status="complete">DNS TTL lowered to 300s</li>
      <li data-status="complete">Rollback procedure tested</li>
      <li data-status="complete">War room scheduled, team notified</li>
    </ul>
  </div>
  <div class="checklist-phase">
    <h5>Cutover (T-0)</h5>
    <ul class="checklist">
      <li data-status="in-progress">Stop writes to source database</li>
      <li data-status="pending">Verify final replication sync</li>
      <li data-status="pending">Switch DNS to cloud endpoint</li>
      <li data-status="pending">Smoke test critical user flows</li>
    </ul>
  </div>
  <div class="checklist-phase">
    <h5>Post-Cutover (T+1h to T+7d)</h5>
    <ul class="checklist">
      <li data-status="pending">Performance baseline comparison</li>
      <li data-status="pending">Error rate monitoring (24h)</li>
      <li data-status="pending">User acceptance sign-off</li>
      <li data-status="pending">Source environment decommission scheduled</li>
    </ul>
  </div>
</div>
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Customize content** (application names, wave assignments, dates, checklist items)
3. **Apply color tokens** for consistency and semantic meaning
4. **Link templates together** (7R table drives wave plan; wave plan references landing zone; cutover checklist per wave)

All templates follow accessibility best practices (semantic HTML, color + text distinction, adequate contrast).
