---
name: devsecops-patterns
description: HTML templates for pipeline stage diagrams, security gate checklists, SBOM templates, DORA metrics dashboards, and compliance evidence tables
---

## DevSecOps Architecture Pattern Reference

Reusable HTML templates and patterns for CI/CD and security pipeline documentation.

---

## Design Tokens

```css
--color-primary: #FF7E08;        /* Orange — pipeline stages, progress */
--color-critical: #DC2626;       /* Red — failures, security issues */
--color-warning: #D97706;        /* Amber — warnings, manual approval needed */
--color-positive: #FFD700;       /* Gold — passed gates, success */
--color-decorative: #42D36F;     /* Green — decorative only */
--color-neutral-light: #F3F4F6;  /* Light gray — backgrounds */
--color-neutral-dark: #1F2937;   /* Dark gray — text */
```

---

## Template 1: Pipeline Stage Diagram

**Purpose:** Visualize CI/CD stages, gates, and environment promotion

**HTML Structure:**
```html
<section class="pipeline-diagram">
  <h3>CI/CD Pipeline Architecture</h3>

  <div class="pipeline-flow">
    <!-- Commit Stage -->
    <div class="stage" data-stage="commit">
      <h4>Commit</h4>
      <div class="duration">5-10 min</div>
      <ul class="actions">
        <li>Compile</li>
        <li>Unit Tests</li>
        <li>Lint Check</li>
        <li>Secrets Scan</li>
      </ul>
      <div class="gate" data-status="pass">Gate: All pass</div>
    </div>

    <div class="flow-arrow">→</div>

    <!-- Build Stage -->
    <div class="stage" data-stage="build">
      <h4>Build</h4>
      <div class="duration">5 min</div>
      <ul class="actions">
        <li>Docker Build</li>
        <li>SAST Scan</li>
        <li>SCA Scan</li>
        <li>Image Scan</li>
        <li>Publish Artifact</li>
      </ul>
      <div class="gate" data-status="pass">Gate: No critical vulns</div>
    </div>

    <div class="flow-arrow">→</div>

    <!-- Acceptance Test Stage -->
    <div class="stage" data-stage="acceptance">
      <h4>Acceptance Test</h4>
      <div class="duration">10-30 min</div>
      <ul class="actions">
        <li>Deploy to Staging</li>
        <li>Integration Tests</li>
        <li>Contract Tests</li>
        <li>DAST Scan</li>
      </ul>
      <div class="gate" data-status="pass">Gate: Tests pass</div>
    </div>

    <div class="flow-arrow">→</div>

    <!-- Approval Gate -->
    <div class="stage approval-gate" data-stage="approval">
      <h4>Approval</h4>
      <div class="duration">Variable</div>
      <ul class="actions">
        <li>Human Review</li>
        <li>Risk Assessment</li>
        <li>Approval Decision</li>
      </ul>
      <div class="gate" data-status="conditional">Gate: Depends on risk</div>
    </div>

    <div class="flow-arrow">→</div>

    <!-- Production Stage -->
    <div class="stage" data-stage="production">
      <h4>Production Deploy</h4>
      <div class="duration">< 5 min</div>
      <ul class="actions">
        <li>Canary (5%)</li>
        <li>Monitor Metrics</li>
        <li>Full Rollout</li>
      </ul>
      <div class="gate" data-status="pass">Gate: Health checks pass</div>
    </div>
  </div>

  <div class="environment-promotion">
    <h4>Environment Promotion</h4>
    <div class="promotion-flow">
      <span class="env">Dev</span>
      <span class="arrow">→</span>
      <span class="env">Staging</span>
      <span class="arrow">→</span>
      <span class="env">Production</span>
    </div>
    <p>Same artifact throughout; config injected per environment</p>
  </div>
</section>
```

**CSS:**
```css
.pipeline-diagram {
  padding: 24px;
  background: white;
  border-radius: 8px;
  border: 1px solid var(--color-neutral-border);
}

.pipeline-flow {
  display: flex;
  gap: 12px;
  align-items: center;
  margin: 20px 0;
  overflow-x: auto;
  padding-bottom: 12px;
}

.stage {
  padding: 16px;
  border: 2px solid var(--color-primary);
  border-radius: 6px;
  background: white;
  min-width: 150px;
  text-align: center;
}

.stage h4 {
  margin: 0 0 4px 0;
  color: var(--color-neutral-dark);
  font-size: 13px;
}

.duration {
  font-size: 11px;
  color: #666;
  margin-bottom: 8px;
}

.actions {
  margin: 8px 0;
  padding: 0 0 0 16px;
  font-size: 11px;
  text-align: left;
}

.actions li {
  margin-bottom: 3px;
}

.gate {
  margin-top: 8px;
  padding: 6px;
  border-radius: 3px;
  font-size: 10px;
  font-weight: 600;
}

.gate[data-status="pass"] {
  background: #D1FAE5;
  color: #059669;
}

.gate[data-status="fail"] {
  background: #FEE2E2;
  color: var(--color-critical);
}

.gate[data-status="conditional"] {
  background: var(--color-warning);
  color: white;
}

.flow-arrow {
  font-size: 20px;
  color: var(--color-primary);
  flex-shrink: 0;
}

.approval-gate {
  border-color: var(--color-warning);
}

.environment-promotion {
  margin-top: 20px;
  padding-top: 20px;
  border-top: 1px solid var(--color-neutral-border);
}

.promotion-flow {
  display: flex;
  align-items: center;
  gap: 12px;
  margin: 12px 0;
  font-weight: 600;
}

.env {
  padding: 8px 16px;
  background: var(--color-neutral-light);
  border-radius: 4px;
  font-size: 12px;
}

.promotion-flow .arrow {
  color: var(--color-primary);
  font-size: 18px;
}
```

---

## Template 2: Security Gate Checklist

**Purpose:** Define security controls required at each stage

**HTML Structure:**
```html
<table class="security-gate-checklist">
  <thead>
    <tr>
      <th>Stage</th>
      <th>Control</th>
      <th>Tool</th>
      <th>Pass Criteria</th>
      <th>Severity</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="4" class="stage-name">Commit</td>
      <td>Unit Tests</td>
      <td>JUnit / pytest</td>
      <td>≥ 80% pass rate</td>
      <td class="required">Required</td>
    </tr>
    <tr>
      <td>Lint Check</td>
      <td>ESLint / Pylint</td>
      <td>No errors</td>
      <td class="required">Required</td>
    </tr>
    <tr>
      <td>SAST</td>
      <td>SonarQube</td>
      <td>No critical/high vulns</td>
      <td class="required">Required</td>
    </tr>
    <tr>
      <td>Secrets Scanning</td>
      <td>git-secrets</td>
      <td>No secrets detected</td>
      <td class="required">Required</td>
    </tr>

    <tr>
      <td rowspan="4" class="stage-name">Build</td>
      <td>SCA</td>
      <td>Snyk</td>
      <td>No critical vulns</td>
      <td class="required">Required</td>
    </tr>
    <tr>
      <td>Container Image Scan</td>
      <td>Trivy</td>
      <td>No high-sev OS vulns</td>
      <td class="required">Required</td>
    </tr>
    <tr>
      <td>License Check</td>
      <td>FOSSA</td>
      <td>Approved licenses only</td>
      <td class="recommended">Recommended</td>
    </tr>
    <tr>
      <td>Artifact Signing</td>
      <td>cosign</td>
      <td>Image signed and verified</td>
      <td class="required">Required</td>
    </tr>

    <tr>
      <td rowspan="3" class="stage-name">Acceptance</td>
      <td>Integration Tests</td>
      <td>Integration test suite</td>
      <td>All pass</td>
      <td class="required">Required</td>
    </tr>
    <tr>
      <td>DAST</td>
      <td>OWASP ZAP</td>
      <td>No critical findings</td>
      <td class="recommended">Recommended</td>
    </tr>
    <tr>
      <td>Performance Baseline</td>
      <td>Custom metrics</td>
      <td>No >10% regression</td>
      <td class="recommended">Recommended</td>
    </tr>

    <tr>
      <td rowspan="2" class="stage-name">Production</td>
      <td>Change Approval</td>
      <td>Risk-based workflow</td>
      <td>Approved per risk level</td>
      <td class="required">Required</td>
    </tr>
    <tr>
      <td>Post-Deploy Health</td>
      <td>CloudWatch / Datadog</td>
      <td>Error rate stable</td>
      <td class="required">Required</td>
    </tr>
  </tbody>
</table>
```

**CSS:**
```css
.security-gate-checklist {
  width: 100%;
  border-collapse: collapse;
  margin: 16px 0;
  border: 1px solid var(--color-neutral-border);
}

.security-gate-checklist thead {
  background: var(--color-neutral-light);
}

.security-gate-checklist th, .security-gate-checklist td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid var(--color-neutral-border);
  font-size: 12px;
}

.security-gate-checklist th {
  font-weight: 600;
  color: var(--color-neutral-dark);
}

.stage-name {
  font-weight: 600;
  color: var(--color-neutral-dark);
  background: #F9FAFB;
}

.required {
  padding: 4px 8px;
  background: #FEE2E2;
  color: var(--color-critical);
  border-radius: 3px;
  font-size: 10px;
  font-weight: 600;
  text-align: center;
}

.recommended {
  padding: 4px 8px;
  background: #FEF3C7;
  color: var(--color-warning);
  border-radius: 3px;
  font-size: 10px;
  font-weight: 600;
  text-align: center;
}
```

---

## Template 3: DORA Metrics Dashboard

**Purpose:** Track deployment frequency, lead time, failure rate, recovery time

**HTML Structure:**
```html
<section class="dora-dashboard">
  <h3>DORA Metrics Dashboard</h3>

  <div class="metrics-grid">
    <div class="metric-card" data-metric="frequency">
      <h4>Deployment Frequency</h4>
      <div class="metric-value">8.3 / day</div>
      <div class="metric-target">Target: ≥ 1 / day</div>
      <div class="status" data-status="excellent">Excellent</div>
    </div>

    <div class="metric-card" data-metric="lead-time">
      <h4>Lead Time for Changes</h4>
      <div class="metric-value">28 minutes</div>
      <div class="metric-target">Target: &lt; 1 hour</div>
      <div class="status" data-status="excellent">Excellent</div>
    </div>

    <div class="metric-card" data-metric="failure-rate">
      <h4>Change Failure Rate</h4>
      <div class="metric-value">8%</div>
      <div class="metric-target">Target: &lt; 15%</div>
      <div class="status" data-status="good">Good</div>
    </div>

    <div class="metric-card" data-metric="mttr">
      <h4>Mean Time to Recovery</h4>
      <div class="metric-value">23 minutes</div>
      <div class="metric-target">Target: &lt; 1 hour</div>
      <div class="status" data-status="excellent">Excellent</div>
    </div>
  </div>

  <div class="metric-trend">
    <h4>30-Day Trend</h4>
    <div class="chart-placeholder">
      [Deployment frequency trending up] ↑
      [Lead time trending down] ↓
      [Failure rate stable] →
      [MTTR improving] ↓
    </div>
  </div>

  <div class="dora-interpretation">
    <h4>Performance Level</h4>
    <p><strong>Elite Performer:</strong> Daily deployments, < 1 hour lead time, < 15% failure rate, < 1 hour recovery. This team is achieving elite DevOps maturity.</p>
  </div>
</section>
```

**CSS:**
```css
.dora-dashboard {
  padding: 24px;
  background: white;
  border-radius: 8px;
  border: 1px solid var(--color-neutral-border);
}

.metrics-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 16px;
  margin: 20px 0;
}

.metric-card {
  padding: 16px;
  border: 2px solid var(--color-neutral-border);
  border-radius: 6px;
  text-align: center;
}

.metric-card h4 {
  margin: 0 0 8px 0;
  color: var(--color-neutral-dark);
  font-size: 13px;
}

.metric-value {
  font-size: 28px;
  font-weight: bold;
  color: var(--color-primary);
  margin: 8px 0;
}

.metric-target {
  font-size: 11px;
  color: #666;
  margin: 8px 0;
}

.status {
  display: inline-block;
  padding: 4px 8px;
  border-radius: 3px;
  font-size: 10px;
  font-weight: 600;
  text-transform: uppercase;
}

.status[data-status="excellent"] {
  background: #D1FAE5;
  color: #059669;
}

.status[data-status="good"] {
  background: #FEF3C7;
  color: var(--color-warning);
}

.status[data-status="poor"] {
  background: #FEE2E2;
  color: var(--color-critical);
}

.metric-trend {
  margin-top: 20px;
  padding: 16px;
  background: var(--color-neutral-light);
  border-radius: 6px;
}

.metric-trend h4 {
  margin: 0 0 8px 0;
  color: var(--color-neutral-dark);
}

.chart-placeholder {
  font-size: 12px;
  color: #666;
  font-family: monospace;
}

.dora-interpretation {
  margin-top: 16px;
  padding: 16px;
  background: #D1FAE5;
  border-left: 4px solid #10B981;
  border-radius: 4px;
}

.dora-interpretation p {
  margin: 0;
  font-size: 12px;
  color: #047857;
}
```

---

All templates provide consistent visualization for CI/CD and security pipeline documentation.
