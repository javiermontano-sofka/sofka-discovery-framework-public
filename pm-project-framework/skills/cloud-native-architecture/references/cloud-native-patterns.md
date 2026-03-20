---
name: cloud-native-patterns
description: HTML templates and visual patterns for 12-factor checklists, container architecture diagrams, service mesh topologies, serverless decision matrices, and FinOps dashboards
---

## Cloud-Native Architecture Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for cloud-native architecture documentation artifacts.

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

## Template 1: 12-Factor Compliance Checklist

**Purpose:** Audit application compliance against the 12-factor methodology

**HTML Structure:**
```html
<section class="twelve-factor-audit">
  <h3>12-Factor Compliance Audit</h3>
  <div class="factor-list">
    <div class="factor" data-compliance="compliant">
      <div class="factor-header">
        <span class="factor-number">I</span>
        <h4>Codebase</h4>
        <span class="compliance-badge compliant">Compliant</span>
      </div>
      <p class="factor-description">One codebase tracked in revision control, many deploys.</p>
      <p class="factor-evidence">Single Git repository, branch-per-environment deploys via CI/CD.</p>
    </div>
    <div class="factor" data-compliance="partial">
      <div class="factor-header">
        <span class="factor-number">III</span>
        <h4>Config</h4>
        <span class="compliance-badge partial">Partial</span>
      </div>
      <p class="factor-description">Store config in the environment.</p>
      <p class="factor-evidence">Database URLs use env vars; some feature flags hard-coded in constants file.</p>
      <p class="factor-remediation">Move feature flags to environment variables or remote config service.</p>
    </div>
    <div class="factor" data-compliance="non-compliant">
      <div class="factor-header">
        <span class="factor-number">VI</span>
        <h4>Processes</h4>
        <span class="compliance-badge non-compliant">Non-Compliant</span>
      </div>
      <p class="factor-description">Execute the app as one or more stateless processes.</p>
      <p class="factor-evidence">Session data stored in local memory; file uploads saved to local disk.</p>
      <p class="factor-remediation">Migrate sessions to Redis. Move file storage to S3. Effort: Medium.</p>
    </div>
  </div>
</section>
```

**CSS Styling:**
```css
.twelve-factor-audit {
  border: 1px solid var(--color-neutral-border);
  border-radius: 6px;
  padding: 24px;
  background: var(--color-neutral-light);
}

.factor {
  padding: 16px;
  margin-bottom: 12px;
  background: white;
  border-radius: 4px;
  border-left: 4px solid var(--color-neutral-border);
}

.factor[data-compliance="compliant"] { border-left-color: var(--color-decorative); }
.factor[data-compliance="partial"] { border-left-color: var(--color-warning); }
.factor[data-compliance="non-compliant"] { border-left-color: var(--color-critical); }

.factor-header {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 8px;
}

.factor-number {
  font-weight: 700;
  font-size: 14px;
  color: var(--color-primary);
  min-width: 24px;
}

.compliance-badge {
  font-size: 11px;
  padding: 2px 8px;
  border-radius: 4px;
  font-weight: 600;
  text-transform: uppercase;
}

.compliance-badge.compliant { background: var(--color-decorative); color: var(--color-neutral-dark); }
.compliance-badge.partial { background: var(--color-warning); color: white; }
.compliance-badge.non-compliant { background: var(--color-critical); color: white; }

.factor-remediation {
  font-size: 13px;
  color: var(--color-primary);
  font-style: italic;
  margin-top: 4px;
}
```

---

## Template 2: Kubernetes Architecture Diagram

**Purpose:** Visualize cluster topology with namespaces, deployments, and services

**HTML Structure:**
```html
<section class="k8s-architecture">
  <h3>Kubernetes Cluster Architecture</h3>
  <div class="cluster">
    <div class="cluster-header">
      <h4>production-cluster (EKS, us-east-1)</h4>
      <span class="node-count">Nodes: 3 control plane, 12 workers (auto-scale 6-20)</span>
    </div>
    <div class="namespace-grid">
      <div class="namespace">
        <span class="ns-name">app-production</span>
        <div class="workloads">
          <div class="workload deployment">
            <span class="workload-type">Deployment</span>
            <span class="workload-name">api-gateway</span>
            <span class="workload-replicas">Replicas: 3 (HPA: 3-10)</span>
            <span class="workload-resources">CPU: 500m-1000m | Memory: 512Mi-1Gi</span>
          </div>
          <div class="workload deployment">
            <span class="workload-type">Deployment</span>
            <span class="workload-name">order-service</span>
            <span class="workload-replicas">Replicas: 2 (HPA: 2-8)</span>
            <span class="workload-resources">CPU: 250m-500m | Memory: 256Mi-512Mi</span>
          </div>
        </div>
      </div>
      <div class="namespace">
        <span class="ns-name">istio-system</span>
        <div class="workloads">
          <div class="workload daemonset">
            <span class="workload-type">DaemonSet</span>
            <span class="workload-name">istio-proxy (sidecar)</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
```

---

## Template 3: Serverless Decision Card

**Purpose:** Document serverless vs. container decision for a specific workload

**HTML Structure:**
```html
<div class="serverless-decision">
  <div class="decision-header">
    <h4>Workload: Image Processing Pipeline</h4>
    <span class="decision-badge" data-decision="serverless">Serverless</span>
  </div>
  <div class="decision-body">
    <div class="criteria-grid">
      <div class="criterion">
        <span class="criterion-label">Traffic Pattern</span>
        <span class="criterion-value">Spiky — 0-500 invocations/min</span>
        <span class="criterion-verdict favor-serverless">Favors Serverless</span>
      </div>
      <div class="criterion">
        <span class="criterion-label">Execution Time</span>
        <span class="criterion-value">30-90 seconds per image</span>
        <span class="criterion-verdict favor-serverless">Favors Serverless</span>
      </div>
      <div class="criterion">
        <span class="criterion-label">Cold Start Tolerance</span>
        <span class="criterion-value">Acceptable — async pipeline</span>
        <span class="criterion-verdict favor-serverless">Favors Serverless</span>
      </div>
      <div class="criterion">
        <span class="criterion-label">State Requirements</span>
        <span class="criterion-value">Stateless — S3 input/output</span>
        <span class="criterion-verdict favor-serverless">Favors Serverless</span>
      </div>
      <div class="criterion">
        <span class="criterion-label">Cost at Scale</span>
        <span class="criterion-value">~$45/month at current volume</span>
        <span class="criterion-verdict favor-serverless">Favors Serverless</span>
      </div>
    </div>
    <div class="decision-rationale">
      <h5>Rationale</h5>
      <p>Event-driven, spiky traffic with no cold start sensitivity. Lambda with S3 triggers. Provisioned concurrency not needed. Container alternative would cost 3x due to idle time.</p>
    </div>
  </div>
</div>
```

---

## Template 4: FinOps Cost Dashboard

**Purpose:** Display cost allocation per team/service/environment

**HTML Structure:**
```html
<section class="finops-dashboard">
  <h3>Monthly Cloud Cost Allocation</h3>
  <div class="cost-summary">
    <div class="cost-card total">
      <span class="cost-label">Total Monthly</span>
      <span class="cost-value">$24,580</span>
      <span class="cost-trend up">+8% vs. last month</span>
    </div>
    <div class="cost-card">
      <span class="cost-label">Cost per User</span>
      <span class="cost-value">$0.12</span>
      <span class="cost-trend down">-3% (efficiency gain)</span>
    </div>
  </div>
  <table class="cost-table">
    <thead>
      <tr><th>Service</th><th>Team</th><th>Compute</th><th>Storage</th><th>Network</th><th>Total</th><th>Optimization</th></tr>
    </thead>
    <tbody>
      <tr>
        <td>order-service</td><td>Orders</td>
        <td>$3,200</td><td>$800</td><td>$150</td><td>$4,150</td>
        <td class="optimization">Rightsize: save $600/mo</td>
      </tr>
      <tr>
        <td>search-service</td><td>Discovery</td>
        <td>$5,100</td><td>$2,400</td><td>$300</td><td>$7,800</td>
        <td class="optimization">Spot nodes: save $2,500/mo</td>
      </tr>
    </tbody>
  </table>
</section>
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Customize content** (factor compliance, workload names, cost figures)
3. **Apply color tokens** for consistency and semantic meaning
4. **Link templates together** (12-factor audit informs container strategy; serverless decisions feed FinOps dashboard)

All templates follow accessibility best practices (semantic HTML, color + text distinction, adequate contrast).
