---
name: governance-frameworks
description: HTML templates and visual patterns for data catalog cards, classification matrices, retention policies, RACI matrices, and compliance mapping tables
---

## Data Governance Framework Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for data governance documentation artifacts.

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

## Template 1: Data Asset Catalog Card

**Purpose:** Document individual data assets with metadata, classification, ownership, and lineage

**HTML Structure:**
```html
<div class="data-asset-card">
  <div class="card-header">
    <h4>Asset: customer_profiles</h4>
    <span class="classification-badge" data-tier="confidential">Confidential</span>
  </div>
  <div class="card-body">
    <div class="section">
      <h5>Location & Type</h5>
      <p><strong>Source:</strong> PostgreSQL / production-db / public.customer_profiles</p>
      <p><strong>Format:</strong> Relational table — 2.4M rows, 47 columns</p>
    </div>
    <div class="section">
      <h5>Ownership</h5>
      <ul class="ownership-list">
        <li><strong>Domain Owner:</strong> Customer Experience Team</li>
        <li><strong>Data Steward:</strong> Maria Gonzalez (customer-data@company.com)</li>
        <li><strong>Technical Contact:</strong> Platform Engineering</li>
      </ul>
    </div>
    <div class="section">
      <h5>Sensitive Fields</h5>
      <div class="field-tags">
        <span class="field-tag pii">email (PII)</span>
        <span class="field-tag pii">phone_number (PII)</span>
        <span class="field-tag pii">date_of_birth (PII)</span>
        <span class="field-tag internal">account_status (Internal)</span>
      </div>
    </div>
    <div class="section">
      <h5>Retention</h5>
      <p><strong>Policy:</strong> 7 years post-account-closure (regulatory), then hard purge</p>
      <p><strong>Legal Hold:</strong> None active</p>
    </div>
    <div class="section">
      <h5>Lineage</h5>
      <p><strong>Sources:</strong> CRM API, Registration Form, Customer Support System</p>
      <p><strong>Consumers:</strong> Analytics Dashboard, Marketing Automation, Billing System</p>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.data-asset-card {
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

.classification-badge {
  font-size: 11px;
  font-weight: 600;
  padding: 4px 10px;
  border-radius: 4px;
  text-transform: uppercase;
}

.classification-badge[data-tier="public"] {
  background: var(--color-decorative);
  color: var(--color-neutral-dark);
}

.classification-badge[data-tier="internal"] {
  background: var(--color-warning);
  color: white;
}

.classification-badge[data-tier="confidential"] {
  background: var(--color-primary);
  color: white;
}

.classification-badge[data-tier="restricted"] {
  background: var(--color-critical);
  color: white;
}

.field-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
}

.field-tag {
  font-size: 11px;
  padding: 3px 8px;
  border-radius: 3px;
  border: 1px solid var(--color-neutral-border);
}

.field-tag.pii {
  background: #FEE2E2;
  border-color: var(--color-critical);
  color: var(--color-critical);
}

.field-tag.internal {
  background: #FEF3C7;
  border-color: var(--color-warning);
  color: var(--color-warning);
}
```

---

## Template 2: Classification Taxonomy Matrix

**Purpose:** Define data classification tiers with handling requirements

**HTML Structure:**
```html
<table class="classification-matrix">
  <thead>
    <tr>
      <th>Classification Tier</th>
      <th>Definition</th>
      <th>Examples</th>
      <th>Encryption</th>
      <th>Access Control</th>
      <th>Audit Logging</th>
      <th>Retention</th>
    </tr>
  </thead>
  <tbody>
    <tr data-tier="public">
      <td class="tier-name">Public</td>
      <td>Information intended for public disclosure</td>
      <td>Marketing content, public APIs, press releases</td>
      <td>Optional (TLS in transit)</td>
      <td>Open access</td>
      <td>Not required</td>
      <td>Indefinite</td>
    </tr>
    <tr data-tier="internal">
      <td class="tier-name">Internal</td>
      <td>Business information not for external sharing</td>
      <td>Internal docs, org charts, project plans</td>
      <td>TLS in transit</td>
      <td>Authenticated employees</td>
      <td>Access logs</td>
      <td>3 years</td>
    </tr>
    <tr data-tier="confidential">
      <td class="tier-name">Confidential</td>
      <td>Sensitive business or personal data</td>
      <td>Customer PII, financial records, contracts</td>
      <td>At rest + in transit</td>
      <td>Role-based, need-to-know</td>
      <td>Full audit trail</td>
      <td>Per regulation</td>
    </tr>
    <tr data-tier="restricted">
      <td class="tier-name">Restricted</td>
      <td>Highly sensitive data with severe impact if breached</td>
      <td>SSN, payment cards, health records, credentials</td>
      <td>At rest + in transit + field-level</td>
      <td>Explicit approval, MFA required</td>
      <td>Immutable audit + alerts</td>
      <td>Minimum viable</td>
    </tr>
  </tbody>
</table>
```

**CSS Styling:**
```css
.classification-matrix {
  width: 100%;
  border-collapse: collapse;
  border: 1px solid var(--color-neutral-border);
  margin-bottom: 16px;
  font-size: 13px;
}

.classification-matrix thead {
  background: var(--color-neutral-light);
}

.classification-matrix th {
  padding: 12px;
  text-align: left;
  font-weight: 600;
  font-size: 12px;
  color: var(--color-neutral-dark);
  border-bottom: 2px solid var(--color-neutral-border);
}

.classification-matrix td {
  padding: 10px 12px;
  border-bottom: 1px solid var(--color-neutral-border);
  vertical-align: top;
}

.tier-name {
  font-weight: 600;
  color: var(--color-neutral-dark);
}

tr[data-tier="restricted"] .tier-name {
  color: var(--color-critical);
}

tr[data-tier="confidential"] .tier-name {
  color: var(--color-primary);
}
```

---

## Template 3: Retention Policy Matrix

**Purpose:** Map data types to retention periods with regulatory justification

**HTML Structure:**
```html
<table class="retention-matrix">
  <thead>
    <tr>
      <th>Data Category</th>
      <th>Regulation</th>
      <th>Retention Period</th>
      <th>Archive After</th>
      <th>Purge Method</th>
      <th>Legal Hold</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Customer PII</td>
      <td>GDPR Art. 17, CCPA</td>
      <td>Duration of relationship + 3 years</td>
      <td>1 year post-relationship</td>
      <td>Hard delete + backup purge</td>
      <td>Subject to litigation hold</td>
    </tr>
    <tr>
      <td>Financial Records</td>
      <td>SOX, Tax Code</td>
      <td>7 years from creation</td>
      <td>2 years from creation</td>
      <td>Hard delete after audit clearance</td>
      <td>Automatic hold during audit</td>
    </tr>
    <tr>
      <td>Access Logs</td>
      <td>SOC 2, ISO 27001</td>
      <td>1 year minimum</td>
      <td>6 months</td>
      <td>Automated expiry</td>
      <td>Retained during investigation</td>
    </tr>
  </tbody>
</table>
```

---

## Template 4: DSAR Workflow

**Purpose:** Visualize Data Subject Access Request processing steps

**HTML Structure:**
```html
<div class="workflow-diagram">
  <h3>DSAR Processing Workflow</h3>
  <div class="workflow-steps">
    <div class="step" data-step="1">
      <span class="step-number">1</span>
      <h4>Request Intake</h4>
      <p>Receive request via portal, email, or support. Verify identity. Log in DSAR tracker.</p>
      <span class="sla">SLA: 2 business days</span>
    </div>
    <div class="step-connector"></div>
    <div class="step" data-step="2">
      <span class="step-number">2</span>
      <h4>Data Discovery</h4>
      <p>Search catalog for all data linked to subject. Query all systems with subject identifiers.</p>
      <span class="sla">SLA: 5 business days</span>
    </div>
    <div class="step-connector"></div>
    <div class="step" data-step="3">
      <span class="step-number">3</span>
      <h4>Review & Redact</h4>
      <p>Review discovered data. Redact third-party PII. Apply legal exemptions if applicable.</p>
      <span class="sla">SLA: 5 business days</span>
    </div>
    <div class="step-connector"></div>
    <div class="step" data-step="4">
      <span class="step-number">4</span>
      <h4>Deliver & Close</h4>
      <p>Package data in portable format. Deliver securely. Log completion. Close request.</p>
      <span class="sla">SLA: 30 days total (GDPR)</span>
    </div>
  </div>
</div>
```

**CSS Styling:**
```css
.workflow-diagram {
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  padding: 24px;
  background: var(--color-neutral-light);
}

.workflow-steps {
  display: flex;
  align-items: stretch;
  gap: 0;
}

.step {
  flex: 1;
  padding: 16px;
  background: white;
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  position: relative;
}

.step-number {
  display: inline-block;
  width: 24px;
  height: 24px;
  line-height: 24px;
  text-align: center;
  background: var(--color-primary);
  color: white;
  border-radius: 50%;
  font-size: 12px;
  font-weight: 600;
  margin-bottom: 8px;
}

.step h4 {
  margin: 8px 0 4px 0;
  font-size: 14px;
  color: var(--color-neutral-dark);
}

.step p {
  margin: 0;
  font-size: 12px;
  color: #6B7280;
}

.sla {
  display: block;
  margin-top: 8px;
  font-size: 11px;
  font-weight: 600;
  color: var(--color-warning);
}

.step-connector {
  width: 24px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--color-neutral-border);
  font-size: 18px;
}

.step-connector::after {
  content: "→";
  color: var(--color-primary);
  font-weight: bold;
}
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Customize content** (asset names, classification tiers, retention periods, workflow steps)
3. **Apply color tokens** for consistency and semantic meaning
4. **Ensure responsive design** by nesting flexbox/grid appropriately
5. **Link templates together** (catalog card → classification tier → retention policy → DSAR workflow)

All templates follow accessibility best practices (semantic HTML, color + text distinction, adequate contrast).
