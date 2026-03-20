---
name: security-frameworks
description: HTML templates and visual patterns for threat models, zero trust diagrams, IAM flows, compliance matrices, and security posture dashboards
---

## Security Architecture Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for security architecture documentation artifacts.

---

## Design Tokens

**Color Palette:**
```css
--color-primary: #6366F1;        /* Orange — primary actions, highlighted elements */
--color-critical: #DC2626;       /* Red — high risk, critical vulnerabilities, non-compliant */
--color-warning: #D97706;        /* Amber — medium risk, partial compliance */
--color-positive: #22D3EE;       /* Gold — compliant, mitigated, secure */
--color-decorative: #42D36F;     /* Green — decorative only, not semantic status */
--color-neutral-light: #F3F4F6;  /* Light gray — backgrounds, borders */
--color-neutral-dark: #1F2937;   /* Dark gray — text, strong contrast */
--color-neutral-border: #D1D5DB; /* Medium gray — structural dividers */
```

---

## Template 1: Threat Model Card (STRIDE)

**Purpose:** Document a threat identified through STRIDE analysis with risk scoring.

**HTML Structure:**
```html
<div class="threat-card" style="border: 2px solid #DC2626; border-radius: 8px; padding: 16px; margin-bottom: 12px; background: white;">
  <div style="display: flex; justify-content: space-between; align-items: center; padding-bottom: 12px; border-bottom: 1px solid #D1D5DB;">
    <h4 style="margin: 0; color: #1F2937; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;">
      [Threat Title]
    </h4>
    <span style="font-size: 12px; padding: 4px 8px; border-radius: 4px; font-weight: bold; background: #FEE2E2; color: #991B1B;">
      HIGH
      <!-- Options: CRITICAL (bg: #991B1B; color: white) | HIGH (bg: #FEE2E2; color: #991B1B) | MEDIUM (bg: #FEF3C7; color: #92400E) | LOW (bg: #D1FAE5; color: #065F46) -->
    </span>
  </div>

  <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 12px; margin-top: 12px;">
    <div>
      <span style="font-weight: 600; font-size: 12px; color: #6B7280; text-transform: uppercase;">STRIDE Category</span>
      <p style="margin: 4px 0; font-size: 13px; color: #1F2937;">[Spoofing / Tampering / Repudiation / Info Disclosure / DoS / Elevation]</p>
    </div>
    <div>
      <span style="font-weight: 600; font-size: 12px; color: #6B7280; text-transform: uppercase;">Affected Component</span>
      <p style="margin: 4px 0; font-size: 13px; color: #1F2937;">[component name]</p>
    </div>
    <div>
      <span style="font-weight: 600; font-size: 12px; color: #6B7280; text-transform: uppercase;">Attack Vector</span>
      <p style="margin: 4px 0; font-size: 13px; color: #1F2937;">[description of how the attack occurs]</p>
    </div>
    <div>
      <span style="font-weight: 600; font-size: 12px; color: #6B7280; text-transform: uppercase;">Mitigation</span>
      <p style="margin: 4px 0; font-size: 13px; color: #1F2937;">[proposed control or countermeasure]</p>
    </div>
  </div>

  <div style="margin-top: 12px; padding-top: 12px; border-top: 1px solid #D1D5DB; display: flex; gap: 16px; font-size: 12px; color: #6B7280;">
    <span><strong>Likelihood:</strong> [1-5]</span>
    <span><strong>Impact:</strong> [1-5]</span>
    <span><strong>Risk Score:</strong> [L x I]</span>
    <span><strong>Status:</strong> [Open / Mitigated / Accepted]</span>
  </div>
</div>
```

---

## Template 2: Zero Trust Maturity Model

**Purpose:** Display current zero trust maturity across key dimensions.

**HTML Structure:**
```html
<div class="zt-maturity" style="border: 1px solid #D1D5DB; border-radius: 6px; padding: 24px; background: #F3F4F6; margin-bottom: 16px;">
  <h3 style="margin: 0 0 16px 0; color: #1F2937;">Zero Trust Maturity: [Organization Name]</h3>

  <div style="display: flex; flex-direction: column; gap: 12px;">
    <div style="background: white; padding: 12px 16px; border-radius: 4px; display: flex; align-items: center; gap: 12px;">
      <span style="font-weight: 600; min-width: 160px; font-size: 13px; color: #1F2937;">Identity</span>
      <div style="flex: 1; height: 8px; background: #E5E7EB; border-radius: 4px; overflow: hidden;">
        <div style="width: [X]%; height: 100%; background: #6366F1; border-radius: 4px;"></div>
      </div>
      <span style="font-size: 12px; font-weight: 600; color: #1F2937; min-width: 80px; text-align: right;">[Level]: [X]%</span>
    </div>
    <div style="background: white; padding: 12px 16px; border-radius: 4px; display: flex; align-items: center; gap: 12px;">
      <span style="font-weight: 600; min-width: 160px; font-size: 13px; color: #1F2937;">Devices</span>
      <div style="flex: 1; height: 8px; background: #E5E7EB; border-radius: 4px; overflow: hidden;">
        <div style="width: [X]%; height: 100%; background: #6366F1; border-radius: 4px;"></div>
      </div>
      <span style="font-size: 12px; font-weight: 600; color: #1F2937; min-width: 80px; text-align: right;">[Level]: [X]%</span>
    </div>
    <div style="background: white; padding: 12px 16px; border-radius: 4px; display: flex; align-items: center; gap: 12px;">
      <span style="font-weight: 600; min-width: 160px; font-size: 13px; color: #1F2937;">Network</span>
      <div style="flex: 1; height: 8px; background: #E5E7EB; border-radius: 4px; overflow: hidden;">
        <div style="width: [X]%; height: 100%; background: #6366F1; border-radius: 4px;"></div>
      </div>
      <span style="font-size: 12px; font-weight: 600; color: #1F2937; min-width: 80px; text-align: right;">[Level]: [X]%</span>
    </div>
    <div style="background: white; padding: 12px 16px; border-radius: 4px; display: flex; align-items: center; gap: 12px;">
      <span style="font-weight: 600; min-width: 160px; font-size: 13px; color: #1F2937;">Applications</span>
      <div style="flex: 1; height: 8px; background: #E5E7EB; border-radius: 4px; overflow: hidden;">
        <div style="width: [X]%; height: 100%; background: #6366F1; border-radius: 4px;"></div>
      </div>
      <span style="font-size: 12px; font-weight: 600; color: #1F2937; min-width: 80px; text-align: right;">[Level]: [X]%</span>
    </div>
    <div style="background: white; padding: 12px 16px; border-radius: 4px; display: flex; align-items: center; gap: 12px;">
      <span style="font-weight: 600; min-width: 160px; font-size: 13px; color: #1F2937;">Data</span>
      <div style="flex: 1; height: 8px; background: #E5E7EB; border-radius: 4px; overflow: hidden;">
        <div style="width: [X]%; height: 100%; background: #6366F1; border-radius: 4px;"></div>
      </div>
      <span style="font-size: 12px; font-weight: 600; color: #1F2937; min-width: 80px; text-align: right;">[Level]: [X]%</span>
    </div>
  </div>

  <div style="margin-top: 16px; font-size: 12px; color: #6B7280;">
    <strong>Levels:</strong> Traditional (0-25%) | Advanced (25-50%) | Optimal (50-75%) | Strategic (75-100%)
  </div>
</div>
```

---

## Template 3: Compliance Control Matrix

**Purpose:** Map framework requirements to technical controls with evidence and status.

**HTML Structure:**
```html
<table class="compliance-matrix" style="width: 100%; border-collapse: collapse; border: 1px solid #D1D5DB; margin-bottom: 16px;">
  <thead>
    <tr style="background: #F3F4F6;">
      <th style="padding: 10px; text-align: left; font-weight: 600; font-size: 12px; border-bottom: 2px solid #D1D5DB;">Control ID</th>
      <th style="padding: 10px; text-align: left; font-weight: 600; font-size: 12px; border-bottom: 2px solid #D1D5DB;">Requirement</th>
      <th style="padding: 10px; text-align: left; font-weight: 600; font-size: 12px; border-bottom: 2px solid #D1D5DB;">Technical Control</th>
      <th style="padding: 10px; text-align: center; font-weight: 600; font-size: 12px; border-bottom: 2px solid #D1D5DB;">Evidence</th>
      <th style="padding: 10px; text-align: center; font-weight: 600; font-size: 12px; border-bottom: 2px solid #D1D5DB;">Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 10px; font-weight: 600; font-size: 12px; border-bottom: 1px solid #D1D5DB;">SOC2-CC6.1</td>
      <td style="padding: 10px; font-size: 12px; border-bottom: 1px solid #D1D5DB;">Logical access controls</td>
      <td style="padding: 10px; font-size: 12px; border-bottom: 1px solid #D1D5DB;">RBAC via [IdP], MFA enforced</td>
      <td style="padding: 10px; text-align: center; font-size: 12px; border-bottom: 1px solid #D1D5DB;">IdP audit logs, access review exports</td>
      <td style="padding: 10px; text-align: center; border-bottom: 1px solid #D1D5DB;">
        <span style="font-size: 11px; padding: 2px 8px; border-radius: 4px; font-weight: bold; background: #D1FAE5; color: #065F46;">COMPLIANT</span>
        <!-- Options: COMPLIANT (green) | PARTIAL (amber) | GAP (red) | N/A (gray) -->
      </td>
    </tr>
  </tbody>
</table>
```

---

## Template 4: IAM Architecture Flow

**Purpose:** Visualize authentication and authorization flows across system components.

**HTML Structure:**
```html
<div class="iam-flow" style="border: 1px solid #D1D5DB; border-radius: 6px; padding: 24px; background: white; margin-bottom: 16px;">
  <h3 style="margin: 0 0 16px; color: #1F2937;">IAM Architecture: [System Name]</h3>

  <div style="display: flex; flex-direction: column; gap: 12px;">
    <div style="display: flex; align-items: center; gap: 12px;">
      <div style="padding: 12px 16px; background: #F3F4F6; border: 1px solid #D1D5DB; border-radius: 4px; min-width: 120px; text-align: center;">
        <strong style="font-size: 13px; color: #1F2937;">User / Client</strong>
      </div>
      <span style="color: #6B7280; font-size: 20px;">--></span>
      <div style="padding: 12px 16px; background: #FFF8F0; border: 2px solid #6366F1; border-radius: 4px; min-width: 120px; text-align: center;">
        <strong style="font-size: 13px; color: #1F2937;">Identity Provider</strong>
        <p style="margin: 4px 0 0; font-size: 11px; color: #6B7280;">[OAuth 2.0 / OIDC]</p>
      </div>
      <span style="color: #6B7280; font-size: 20px;">--></span>
      <div style="padding: 12px 16px; background: #F3F4F6; border: 1px solid #D1D5DB; border-radius: 4px; min-width: 120px; text-align: center;">
        <strong style="font-size: 13px; color: #1F2937;">API Gateway</strong>
        <p style="margin: 4px 0 0; font-size: 11px; color: #6B7280;">[Token validation]</p>
      </div>
      <span style="color: #6B7280; font-size: 20px;">--></span>
      <div style="padding: 12px 16px; background: #F3F4F6; border: 1px solid #D1D5DB; border-radius: 4px; min-width: 120px; text-align: center;">
        <strong style="font-size: 13px; color: #1F2937;">Service</strong>
        <p style="margin: 4px 0 0; font-size: 11px; color: #6B7280;">[RBAC/ABAC enforcement]</p>
      </div>
    </div>
  </div>

  <div style="margin-top: 16px; padding-top: 12px; border-top: 1px solid #D1D5DB;">
    <table style="width: 100%; border-collapse: collapse; font-size: 12px;">
      <tr>
        <td style="padding: 6px 0; font-weight: 600; width: 140px;">Auth Protocol:</td>
        <td style="padding: 6px 0;">[OAuth 2.0 + OIDC / SAML 2.0]</td>
      </tr>
      <tr>
        <td style="padding: 6px 0; font-weight: 600;">Token Type:</td>
        <td style="padding: 6px 0;">[JWT / Opaque] — Lifetime: [X] minutes</td>
      </tr>
      <tr>
        <td style="padding: 6px 0; font-weight: 600;">MFA:</td>
        <td style="padding: 6px 0;">[TOTP / WebAuthn / SMS fallback]</td>
      </tr>
      <tr>
        <td style="padding: 6px 0; font-weight: 600;">Service Identity:</td>
        <td style="padding: 6px 0;">[mTLS / SPIFFE / Cloud IAM workload identity]</td>
      </tr>
    </table>
  </div>
</div>
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Replace bracketed placeholders** with actual threats, controls, and framework requirements
3. **Apply risk severity colors** based on scoring thresholds
4. **Compose templates** into full report: threat model cards, ZT maturity, compliance matrix, IAM flow
5. **Link to evidence sources** and runbooks for each control

All templates use semantic HTML and maintain color + text distinction for accessibility.
