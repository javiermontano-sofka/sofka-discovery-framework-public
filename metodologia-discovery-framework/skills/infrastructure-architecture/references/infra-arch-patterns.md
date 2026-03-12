---
name: infra-arch-patterns
description: HTML templates for network diagrams, compute comparison matrices, HA/DR runbooks, cost dashboards, and landing zone diagrams
---

## Infrastructure Architecture Pattern Reference

Reusable HTML templates for infrastructure documentation and visualization.

---

## Design Tokens

```css
--color-primary: #FF7E08;        /* Orange — infrastructure components */
--color-critical: #DC2626;       /* Red — failures, critical resources */
--color-warning: #D97706;        /* Amber — warnings, degraded state */
--color-positive: #FFD700;       /* Gold — healthy, optimized */
--color-decorative: #42D36F;     /* Green — decorative, healthy state */
--color-neutral-light: #F3F4F6;  /* Light gray */
--color-neutral-dark: #1F2937;   /* Dark gray */
```

---

## Template 1: Network Topology Diagram

**Purpose:** Visualize VPCs, subnets, security groups, load balancers, and connectivity

**HTML Structure:**
```html
<section class="network-topology">
  <h3>Network Topology (Multi-AZ)</h3>

  <div class="vpc-container">
    <div class="vpc-label">VPC: 10.0.0.0/16</div>

    <div class="availability-zones">
      <div class="az" data-az="us-east-1a">
        <div class="az-label">AZ: us-east-1a</div>

        <div class="subnet" data-tier="public">
          <div class="subnet-label">Public Subnet: 10.0.1.0/24</div>
          <div class="resources">
            <div class="resource" data-type="nlb">NLB</div>
            <div class="resource" data-type="nat">NAT GW</div>
          </div>
        </div>

        <div class="subnet" data-tier="private">
          <div class="subnet-label">Private Subnet: 10.0.11.0/24</div>
          <div class="resources">
            <div class="resource" data-type="instance">EC2 (App)</div>
            <div class="resource" data-type="instance">EC2 (App)</div>
          </div>
        </div>

        <div class="subnet" data-tier="protected">
          <div class="subnet-label">Protected Subnet: 10.0.21.0/24</div>
          <div class="resources">
            <div class="resource" data-type="rds">RDS (Primary)</div>
          </div>
        </div>
      </div>

      <div class="az" data-az="us-east-1b">
        <div class="az-label">AZ: us-east-1b</div>

        <div class="subnet" data-tier="public">
          <div class="subnet-label">Public Subnet: 10.0.2.0/24</div>
          <div class="resources">
            <div class="resource" data-type="nlb">NLB</div>
            <div class="resource" data-type="nat">NAT GW</div>
          </div>
        </div>

        <div class="subnet" data-tier="private">
          <div class="subnet-label">Private Subnet: 10.0.12.0/24</div>
          <div class="resources">
            <div class="resource" data-type="instance">EC2 (App)</div>
            <div class="resource" data-type="instance">EC2 (App)</div>
          </div>
        </div>

        <div class="subnet" data-tier="protected">
          <div class="subnet-label">Protected Subnet: 10.0.22.0/24</div>
          <div class="resources">
            <div class="resource" data-type="rds">RDS (Replica)</div>
          </div>
        </div>
      </div>
    </div>

    <div class="external-connectivity">
      <div class="internet-gateway">IGW</div>
      <div class="vpn">VPN Gateway</div>
      <div class="cdn">CloudFront CDN</div>
    </div>
  </div>

  <div class="topology-legend">
    <h4>Legend</h4>
    <div class="legend-items">
      <span class="legend-item" data-tier="public">Public (internet-accessible)</span>
      <span class="legend-item" data-tier="private">Private (no inbound from internet)</span>
      <span class="legend-item" data-tier="protected">Protected (internal only)</span>
    </div>
  </div>
</section>
```

**CSS:**
```css
.network-topology {
  padding: 24px;
  background: white;
  border-radius: 8px;
  border: 1px solid var(--color-neutral-border);
}

.vpc-container {
  border: 3px solid var(--color-primary);
  border-radius: 8px;
  padding: 16px;
  background: var(--color-neutral-light);
  margin: 20px 0;
}

.vpc-label {
  font-weight: 600;
  color: var(--color-primary);
  margin-bottom: 12px;
}

.availability-zones {
  display: flex;
  gap: 16px;
  margin-bottom: 16px;
}

.az {
  flex: 1;
  border: 2px solid var(--color-warning);
  border-radius: 6px;
  padding: 12px;
  background: white;
}

.az-label {
  font-weight: 600;
  color: var(--color-warning);
  margin-bottom: 12px;
  font-size: 12px;
}

.subnet {
  margin-bottom: 12px;
  padding: 8px;
  border-radius: 4px;
  border-left: 3px solid;
}

.subnet[data-tier="public"] {
  border-left-color: var(--color-primary);
  background: #FFF8F0;
}

.subnet[data-tier="private"] {
  border-left-color: #93C5FD;
  background: #F0F9FF;
}

.subnet[data-tier="protected"] {
  border-left-color: var(--color-critical);
  background: #FEF2F2;
}

.subnet-label {
  font-size: 11px;
  font-weight: 600;
  margin-bottom: 6px;
}

.resources {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
}

.resource {
  padding: 4px 8px;
  background: white;
  border: 1px solid var(--color-neutral-border);
  border-radius: 3px;
  font-size: 10px;
}

.external-connectivity {
  display: flex;
  gap: 16px;
  justify-content: flex-end;
  margin-top: 12px;
  padding-top: 12px;
  border-top: 1px solid var(--color-neutral-border);
}

.internet-gateway, .vpn, .cdn {
  padding: 8px 12px;
  background: var(--color-primary);
  color: white;
  border-radius: 4px;
  font-size: 11px;
  font-weight: 600;
}

.topology-legend {
  margin-top: 16px;
  padding-top: 16px;
  border-top: 1px solid var(--color-neutral-border);
}

.legend-items {
  display: flex;
  gap: 16px;
  flex-wrap: wrap;
  font-size: 11px;
}

.legend-item {
  padding: 4px 8px;
  border-radius: 3px;
}

.legend-item[data-tier="public"] {
  background: #FFF8F0;
  border-left: 3px solid var(--color-primary);
  padding-left: 8px;
}

.legend-item[data-tier="private"] {
  background: #F0F9FF;
  border-left: 3px solid #93C5FD;
  padding-left: 8px;
}

.legend-item[data-tier="protected"] {
  background: #FEF2F2;
  border-left: 3px solid var(--color-critical);
  padding-left: 8px;
}
```

---

## Template 2: Compute Comparison Matrix

**Purpose:** Compare VM, container, serverless options for workload selection

**HTML Structure:**
```html
<table class="compute-matrix">
  <thead>
    <tr>
      <th>Aspect</th>
      <th>Virtual Machines (EC2)</th>
      <th>Containers (Kubernetes)</th>
      <th>Serverless (Lambda)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="aspect">Control Level</td>
      <td>Full</td>
      <td>High</td>
      <td>Limited</td>
    </tr>
    <tr>
      <td class="aspect">Management Overhead</td>
      <td class="high-effort">High</td>
      <td class="medium-effort">Medium</td>
      <td class="low-effort">Low</td>
    </tr>
    <tr>
      <td class="aspect">Scaling Speed</td>
      <td>Minutes</td>
      <td>Seconds</td>
      <td>Milliseconds</td>
    </tr>
    <tr>
      <td class="aspect">Cost per Unit</td>
      <td>Medium</td>
      <td>Medium</td>
      <td>Varies (per invocation)</td>
    </tr>
    <tr>
      <td class="aspect">Best For</td>
      <td>Legacy, stateful, compliance</td>
      <td>Microservices, polyglot</td>
      <td>Event-driven, bursty load</td>
    </tr>
  </tbody>
</table>
```

**CSS:**
```css
.compute-matrix {
  width: 100%;
  border-collapse: collapse;
  margin: 16px 0;
  border: 1px solid var(--color-neutral-border);
}

.compute-matrix thead {
  background: var(--color-neutral-light);
}

.compute-matrix th, .compute-matrix td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid var(--color-neutral-border);
  font-size: 12px;
}

.compute-matrix th {
  font-weight: 600;
  color: var(--color-neutral-dark);
}

.aspect {
  font-weight: 600;
  min-width: 150px;
}

.high-effort {
  color: var(--color-critical);
  font-weight: 600;
}

.medium-effort {
  color: var(--color-warning);
  font-weight: 600;
}

.low-effort {
  color: var(--color-positive);
  font-weight: 600;
}
```

---

## Template 3: HA/DR Runbook Template

**Purpose:** Document recovery procedures for common failure scenarios

**HTML Structure:**
```html
<section class="ha-dr-runbook">
  <h3>High Availability & Disaster Recovery Runbook</h3>

  <div class="runbook-entry">
    <div class="runbook-header">
      <h4>Scenario: Single EC2 Instance Failure</h4>
      <div class="rto-rpo">
        <span class="rto">RTO: <strong>5 minutes</strong></span>
        <span class="rpo">RPO: <strong>Negligible</strong></span>
      </div>
    </div>

    <div class="runbook-body">
      <div class="section">
        <h5>Detection</h5>
        <ul>
          <li>Application Load Balancer health check fails (2 consecutive failed checks, 10 sec interval)</li>
          <li>CloudWatch alarm triggers</li>
          <li>On-call engineer notified</li>
        </ul>
      </div>

      <div class="section">
        <h5>Automatic Recovery (No Manual Action Required)</h5>
        <ul>
          <li>ALB marks instance unhealthy</li>
          <li>Auto Scaling Group replaces instance (launches new EC2)</li>
          <li>New instance boots (~2 minutes)</li>
          <li>Health checks pass; instance joins load balancer</li>
        </ul>
      </div>

      <div class="section">
        <h5>If Automatic Recovery Fails</h5>
        <ol>
          <li>SSH to bastion host</li>
          <li>Investigate EC2 instance logs: <code>aws logs get-log-events --log-group /app/ec2 --log-stream i-xxx</code></li>
          <li>Check Auto Scaling Group: <code>aws autoscaling describe-auto-scaling-groups</code></li>
          <li>If ASG not responding: manually launch replacement instance</li>
        </ol>
      </div>

      <div class="section">
        <h5>Validation</h5>
        <ul>
          <li>New instance shows in load balancer targets (healthy)</li>
          <li>Application responding on health check endpoint</li>
          <li>Error rate returned to baseline</li>
        </ul>
      </div>
    </div>
  </div>

  <div class="runbook-entry">
    <div class="runbook-header">
      <h4>Scenario: Full Region Outage</h4>
      <div class="rto-rpo">
        <span class="rto">RTO: <strong>30 minutes</strong></span>
        <span class="rpo">RPO: <strong>15 minutes</strong></span>
      </div>
    </div>

    <div class="runbook-body">
      <div class="section">
        <h5>Detection</h5>
        <ul>
          <li>All health checks in primary region fail</li>
          <li>Route 53 failover alarm triggers</li>
          <li>Incident commander called</li>
        </ul>
      </div>

      <div class="section">
        <h5>Failover (Manual Decision Required)</h5>
        <ol>
          <li>Confirm region truly unreachable (AWS status page, independent verification)</li>
          <li>Incident commander authorizes failover to secondary region</li>
          <li>Update Route 53 weighted routing (shift 100% to secondary region)</li>
          <li>Verify secondary region handles traffic (monitor metrics, errors)</li>
        </ol>
      </div>

      <div class="section">
        <h5>Restore From Backup</h5>
        <ol>
          <li>Database: restore from last backup (available in S3 cross-region bucket)</li>
          <li>Configuration: pull from version control</li>
          <li>Secrets: pull from AWS Secrets Manager (replicated to secondary region)</li>
          <li>Launch application stack in secondary region</li>
        </ol>
      </div>

      <div class="section">
        <h5>Post-Incident</h5>
        <ul>
          <li>Once primary region recovers: verify RTO met, data loss acceptable (RPO)</li>
          <li>Failback plan (if needed): coordinate with incident commander</li>
          <li>Post-mortem: analyze what failed, improve detection/automation</li>
        </ul>
      </div>
    </div>
  </div>
</section>
```

**CSS:**
```css
.ha-dr-runbook {
  padding: 24px;
  background: white;
  border-radius: 8px;
  border: 1px solid var(--color-neutral-border);
}

.runbook-entry {
  margin-bottom: 24px;
  padding: 16px;
  border: 2px solid var(--color-neutral-border);
  border-radius: 6px;
}

.runbook-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 12px;
  border-bottom: 1px solid var(--color-neutral-border);
}

.runbook-header h4 {
  margin: 0;
  color: var(--color-neutral-dark);
}

.rto-rpo {
  display: flex;
  gap: 16px;
  font-size: 11px;
  font-weight: 600;
}

.rto, .rpo {
  padding: 4px 8px;
  background: var(--color-neutral-light);
  border-radius: 3px;
}

.runbook-body {
  margin-top: 12px;
}

.section {
  margin-bottom: 12px;
}

.section h5 {
  margin: 0 0 6px 0;
  font-size: 12px;
  color: var(--color-neutral-dark);
}

.section ul, .section ol {
  margin: 4px 0 0 20px;
  padding: 0;
  font-size: 12px;
}

.section li {
  margin-bottom: 4px;
}

.section code {
  background: var(--color-neutral-light);
  padding: 2px 4px;
  border-radius: 2px;
  font-family: monospace;
  font-size: 11px;
}
```

---

All templates use consistent design tokens, responsive layouts, and accessibility best practices.
