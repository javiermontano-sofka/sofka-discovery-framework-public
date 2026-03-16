---
name: observability-patterns
description: HTML templates and visual patterns for observability dashboards, logging standards, tracing views, alert definitions, and incident timelines
---

## Observability Architecture Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for observability documentation artifacts.

---

## Design Tokens

**Color Palette:**
```css
--color-primary: #6366F1;        /* Orange — primary actions, highlighted elements */
--color-critical: #DC2626;       /* Red — errors, P1 incidents, SLA breaches */
--color-warning: #D97706;        /* Amber — warnings, P2 incidents, degraded */
--color-positive: #22D3EE;       /* Gold — healthy, targets met */
--color-decorative: #42D36F;     /* Green — decorative only, not semantic status */
--color-neutral-light: #F3F4F6;  /* Light gray — backgrounds, borders */
--color-neutral-dark: #1F2937;   /* Dark gray — text, strong contrast */
--color-neutral-border: #D1D5DB; /* Medium gray — structural dividers */
```

---

## Template 1: Three Pillars Maturity Assessment

**Purpose:** Display current observability maturity across logs, traces, and metrics.

**HTML Structure:**
```html
<div class="observability-maturity" style="border: 1px solid #D1D5DB; border-radius: 6px; padding: 24px; background: #F3F4F6; margin-bottom: 16px;">
  <h3 style="margin: 0 0 16px 0; color: #1F2937;">Observability Maturity: [System Name]</h3>

  <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 16px;">
    <div style="background: white; padding: 16px; border-radius: 4px; border-top: 4px solid #6366F1;">
      <h4 style="margin: 0 0 8px; font-size: 14px; color: #1F2937;">Logging</h4>
      <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 8px;">
        <div style="flex: 1; height: 8px; background: #E5E7EB; border-radius: 4px; overflow: hidden;">
          <div style="width: [X]%; height: 100%; background: #6366F1; border-radius: 4px;"></div>
        </div>
        <span style="font-size: 14px; font-weight: 700; color: #1F2937;">[X]%</span>
      </div>
      <ul style="margin: 0; padding-left: 16px; font-size: 12px; color: #6B7280;">
        <li>Structured: [Yes/No]</li>
        <li>Correlation IDs: [Yes/No]</li>
        <li>Centralized: [Yes/No]</li>
        <li>Retention Policy: [Yes/No]</li>
      </ul>
    </div>
    <div style="background: white; padding: 16px; border-radius: 4px; border-top: 4px solid #6366F1;">
      <h4 style="margin: 0 0 8px; font-size: 14px; color: #1F2937;">Tracing</h4>
      <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 8px;">
        <div style="flex: 1; height: 8px; background: #E5E7EB; border-radius: 4px; overflow: hidden;">
          <div style="width: [X]%; height: 100%; background: #6366F1; border-radius: 4px;"></div>
        </div>
        <span style="font-size: 14px; font-weight: 700; color: #1F2937;">[X]%</span>
      </div>
      <ul style="margin: 0; padding-left: 16px; font-size: 12px; color: #6B7280;">
        <li>Distributed: [Yes/No]</li>
        <li>Trace-Log Link: [Yes/No]</li>
        <li>Sampling: [strategy]</li>
        <li>Service Map: [Yes/No]</li>
      </ul>
    </div>
    <div style="background: white; padding: 16px; border-radius: 4px; border-top: 4px solid #6366F1;">
      <h4 style="margin: 0 0 8px; font-size: 14px; color: #1F2937;">Metrics</h4>
      <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 8px;">
        <div style="flex: 1; height: 8px; background: #E5E7EB; border-radius: 4px; overflow: hidden;">
          <div style="width: [X]%; height: 100%; background: #6366F1; border-radius: 4px;"></div>
        </div>
        <span style="font-size: 14px; font-weight: 700; color: #1F2937;">[X]%</span>
      </div>
      <ul style="margin: 0; padding-left: 16px; font-size: 12px; color: #6B7280;">
        <li>RED/USE Methods: [Yes/No]</li>
        <li>Custom Business: [Yes/No]</li>
        <li>Dashboard Hierarchy: [Yes/No]</li>
        <li>Alerting: [Yes/No]</li>
      </ul>
    </div>
  </div>
</div>
```

---

## Template 2: Structured Log Standard

**Purpose:** Document the required log format with field definitions.

**HTML Structure:**
```html
<div class="log-standard" style="border: 1px solid #D1D5DB; border-left: 4px solid #6366F1; padding: 20px; margin-bottom: 24px; background: white; border-radius: 6px;">
  <h3 style="margin: 0 0 12px; font-size: 18px; color: #1F2937;">Structured Log Standard</h3>

  <pre style="background: #1F2937; color: #E5E7EB; padding: 16px; border-radius: 4px; font-size: 12px; overflow-x: auto; line-height: 1.6;">
{
  "timestamp": "2026-03-11T14:30:00.123Z",
  "level": "INFO",
  "service": "payment-service",
  "version": "2.4.1",
  "traceId": "abc123def456",
  "spanId": "span789",
  "requestId": "req-001",
  "userId": "[REDACTED]",
  "message": "Payment processed successfully",
  "duration_ms": 145,
  "metadata": {
    "payment_method": "card",
    "amount_cents": 5000,
    "currency": "USD"
  }
}</pre>

  <table style="width: 100%; border-collapse: collapse; margin-top: 16px; font-size: 13px;">
    <thead>
      <tr style="background: #F3F4F6;">
        <th style="padding: 8px 12px; text-align: left; font-weight: 600; border-bottom: 2px solid #D1D5DB;">Field</th>
        <th style="padding: 8px 12px; text-align: left; font-weight: 600; border-bottom: 2px solid #D1D5DB;">Required</th>
        <th style="padding: 8px 12px; text-align: left; font-weight: 600; border-bottom: 2px solid #D1D5DB;">Purpose</th>
      </tr>
    </thead>
    <tbody>
      <tr><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">timestamp</td><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">Yes</td><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">ISO 8601 with milliseconds, UTC</td></tr>
      <tr><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">level</td><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">Yes</td><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">ERROR, WARN, INFO, DEBUG</td></tr>
      <tr><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">service</td><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">Yes</td><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">Service name for filtering</td></tr>
      <tr><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">traceId</td><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">Yes</td><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">Links log to distributed trace</td></tr>
      <tr><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">spanId</td><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">Yes</td><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">Links log to specific span</td></tr>
      <tr><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">message</td><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">Yes</td><td style="padding: 8px 12px; border-bottom: 1px solid #D1D5DB;">Human-readable event description</td></tr>
    </tbody>
  </table>
</div>
```

---

## Template 3: Alert Definition Card

**Purpose:** Document an alert rule with SLO linkage, burn rate, and runbook reference.

**HTML Structure:**
```html
<div class="alert-card" style="border: 2px solid #D97706; border-radius: 8px; padding: 16px; margin-bottom: 16px; background: white;">
  <div style="display: flex; justify-content: space-between; align-items: center; padding-bottom: 12px; border-bottom: 1px solid #D1D5DB;">
    <h4 style="margin: 0; color: #1F2937;">[Alert Name]</h4>
    <span style="font-size: 12px; background: #FEF3C7; color: #92400E; padding: 4px 8px; border-radius: 4px; font-weight: bold;">
      P2
      <!-- Options: P1 (bg: #FEE2E2; color: #991B1B) | P2 (bg: #FEF3C7; color: #92400E) | P3 (bg: #F3F4F6; color: #1F2937) -->
    </span>
  </div>
  <div style="margin-top: 12px;">
    <div style="margin-bottom: 8px;">
      <span style="font-weight: 600; font-size: 12px; color: #6B7280; text-transform: uppercase;">SLO:</span>
      <span style="font-size: 13px; color: #1F2937;">[Service] availability &ge; 99.9%</span>
    </div>
    <div style="margin-bottom: 8px;">
      <span style="font-weight: 600; font-size: 12px; color: #6B7280; text-transform: uppercase;">Condition:</span>
      <span style="font-size: 13px; color: #1F2937;">Error budget burn rate &gt; [X]x over [window]</span>
    </div>
    <div style="margin-bottom: 8px;">
      <span style="font-weight: 600; font-size: 12px; color: #6B7280; text-transform: uppercase;">Action:</span>
      <span style="font-size: 13px; color: #1F2937;">[Page on-call / Create ticket / Notify Slack]</span>
    </div>
    <div>
      <span style="font-weight: 600; font-size: 12px; color: #6B7280; text-transform: uppercase;">Runbook:</span>
      <a href="#" style="font-size: 13px; color: #6366F1;">[link to runbook]</a>
    </div>
  </div>
</div>
```

---

## Template 4: Incident Timeline

**Purpose:** Document incident progression from detection to resolution.

**HTML Structure:**
```html
<div class="incident-timeline" style="border: 1px solid #D1D5DB; border-radius: 6px; padding: 24px; background: white; margin-bottom: 16px;">
  <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px;">
    <h3 style="margin: 0; color: #1F2937;">Incident: [INC-XXXX]</h3>
    <span style="font-size: 12px; background: #D1FAE5; color: #065F46; padding: 4px 8px; border-radius: 4px; font-weight: bold;">RESOLVED</span>
  </div>

  <div style="border-left: 3px solid #D1D5DB; padding-left: 20px; margin-left: 8px;">
    <div style="position: relative; margin-bottom: 20px;">
      <div style="position: absolute; left: -28px; top: 2px; width: 12px; height: 12px; background: #DC2626; border-radius: 50%;"></div>
      <p style="margin: 0; font-size: 13px;"><strong style="color: #1F2937;">[HH:MM] Alert Fired</strong></p>
      <p style="margin: 4px 0 0; font-size: 12px; color: #6B7280;">[Alert name triggered. Error budget burn rate exceeded threshold.]</p>
    </div>
    <div style="position: relative; margin-bottom: 20px;">
      <div style="position: absolute; left: -28px; top: 2px; width: 12px; height: 12px; background: #D97706; border-radius: 50%;"></div>
      <p style="margin: 0; font-size: 13px;"><strong style="color: #1F2937;">[HH:MM] Investigation Started</strong></p>
      <p style="margin: 4px 0 0; font-size: 12px; color: #6B7280;">[On-call engineer acknowledged. Began trace analysis.]</p>
    </div>
    <div style="position: relative; margin-bottom: 20px;">
      <div style="position: absolute; left: -28px; top: 2px; width: 12px; height: 12px; background: #6366F1; border-radius: 50%;"></div>
      <p style="margin: 0; font-size: 13px;"><strong style="color: #1F2937;">[HH:MM] Root Cause Identified</strong></p>
      <p style="margin: 4px 0 0; font-size: 12px; color: #6B7280;">[Description of root cause]</p>
    </div>
    <div style="position: relative;">
      <div style="position: absolute; left: -28px; top: 2px; width: 12px; height: 12px; background: #42D36F; border-radius: 50%;"></div>
      <p style="margin: 0; font-size: 13px;"><strong style="color: #1F2937;">[HH:MM] Resolved</strong></p>
      <p style="margin: 4px 0 0; font-size: 12px; color: #6B7280;">[Mitigation applied. Metrics returned to normal.]</p>
    </div>
  </div>

  <div style="margin-top: 16px; padding-top: 12px; border-top: 1px solid #D1D5DB; font-size: 12px; color: #6B7280;">
    <strong>Duration:</strong> [X] minutes | <strong>Impact:</strong> [X]% of requests affected | <strong>Severity:</strong> P[X]
  </div>
</div>
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Replace bracketed placeholders** with actual system names, metrics, and timestamps
3. **Apply status colors** based on severity and health thresholds
4. **Compose templates** into full report: maturity assessment, log standard, alert definitions, incident timelines
5. **Link to live dashboards** where possible for real-time data alongside documented architecture

All templates use semantic HTML and maintain color + text distinction for accessibility.
