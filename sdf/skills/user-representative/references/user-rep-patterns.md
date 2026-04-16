# User Representative Patterns & HTML Templates
**Part of:** metodologia-user-representative
**Purpose:** Reusable HTML components for clarity reviewer & adoption evaluator deliverables

---

## 1. Readability Scorecard

Used by clarity-reviewer to display 5-dimension evaluation.

```html
<div style="border: 2px solid #6366F1; border-radius: 8px; padding: 24px; background: white; margin: 20px 0; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;">
  <h3 style="margin: 0 0 16px 0; color: #1F2937; font-size: 18px;">📋 Readability Scorecard</h3>

  <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px; margin-bottom: 20px;">
    <!-- Comprehension -->
    <div style="padding: 12px; background: #F9FAFB; border-radius: 4px;">
      <p style="margin: 0 0 8px 0; font-size: 12px; color: #6B7280; font-weight: bold;">Comprehension</p>
      <div style="display: flex; align-items: baseline;">
        <span style="font-size: 28px; font-weight: bold; color: #D97706;">6</span>
        <span style="font-size: 14px; color: #6B7280; margin-left: 4px;">/10</span>
      </div>
      <p style="margin: 4px 0 0 0; font-size: 11px; color: #6B7280;">Unexplained jargon (DDD, CQRS)</p>
    </div>

    <!-- Cognitive Load -->
    <div style="padding: 12px; background: #F9FAFB; border-radius: 4px;">
      <p style="margin: 0 0 8px 0; font-size: 12px; color: #6B7280; font-weight: bold;">Cognitive Load</p>
      <div style="display: flex; align-items: baseline;">
        <span style="font-size: 28px; font-weight: bold; color: #D97706;">6</span>
        <span style="font-size: 14px; color: #6B7280; margin-left: 4px;">/10</span>
      </div>
      <p style="margin: 4px 0 0 0; font-size: 11px; color: #6B7280;">§3 is 2.8 pages (exceeds limit)</p>
    </div>

    <!-- Scannability -->
    <div style="padding: 12px; background: #F9FAFB; border-radius: 4px;">
      <p style="margin: 0 0 8px 0; font-size: 12px; color: #6B7280; font-weight: bold;">Scannability</p>
      <div style="display: flex; align-items: baseline;">
        <span style="font-size: 28px; font-weight: bold; color: #DC2626;">5</span>
        <span style="font-size: 14px; color: #6B7280; margin-left: 4px;">/10</span>
      </div>
      <p style="margin: 4px 0 0 0; font-size: 11px; color: #6B7280;">No TOC; recommendation buried</p>
    </div>

    <!-- Adoption -->
    <div style="padding: 12px; background: #F9FAFB; border-radius: 4px;">
      <p style="margin: 0 0 8px 0; font-size: 12px; color: #6B7280; font-weight: bold;">Adoption Risk</p>
      <div style="display: flex; align-items: baseline;">
        <span style="font-size: 28px; font-weight: bold; color: #DC2626;">4</span>
        <span style="font-size: 14px; color: #6B7280; margin-left: 4px;">/10</span>
      </div>
      <p style="margin: 4px 0 0 0; font-size: 11px; color: #6B7280;">Vague CTA; no deadline</p>
    </div>
  </div>

  <div style="padding: 12px; background: #FEF2F2; border-left: 4px solid #DC2626; border-radius: 4px;">
    <p style="margin: 0; font-size: 12px; color: #4B5563;">
      <strong>Verdict:</strong> <span style="background: #FEE2E2; color: #991B1B; padding: 2px 6px; border-radius: 3px; font-weight: bold;">CONDITIONAL</span>
      — Fixable issues detected. Recommend applying top 5 micro-adjustments before circulation.
    </p>
  </div>
</div>
```

---

## 2. Micro-Adjustment Card

Used by clarity-reviewer to propose specific fixes.

```html
<div style="border: 1px solid #E5E7EB; border-radius: 8px; padding: 16px; margin: 12px 0; background: white; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;">
  <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 12px;">
    <div>
      <span style="background: #FEF3C7; color: #92400E; padding: 4px 8px; border-radius: 4px; font-size: 11px; font-weight: bold; margin-right: 8px;">
        COPY ADJUSTMENT
      </span>
      <span style="font-size: 11px; color: #6B7280;">Effort: Low</span>
    </div>
    <span style="font-size: 12px; color: #6B7280;">Priority #1</span>
  </div>

  <p style="margin: 0 0 8px 0; font-size: 13px; color: #1F2937;">
    <strong>Location:</strong> §1, Exec Summary, Paragraph 1
  </p>

  <div style="background: #F3F4F6; padding: 12px; border-radius: 4px; margin: 12px 0;">
    <p style="margin: 0 0 8px 0; font-size: 11px; color: #6B7280; font-weight: bold;">CURRENT:</p>
    <p style="margin: 0; font-size: 12px; color: #374151; font-style: italic; line-height: 1.5;">
      "Leverage microservices architecture to decouple payment processing from settlement orchestration, enabling independent scaling and fault isolation."
    </p>
  </div>

  <div style="background: #F0FDF4; padding: 12px; border-radius: 4px; margin: 12px 0;">
    <p style="margin: 0 0 8px 0; font-size: 11px; color: #6B7280; font-weight: bold;">PROPOSED FIX:</p>
    <p style="margin: 0; font-size: 12px; color: #374151; line-height: 1.5;">
      "Break the payment system into two independent parts: one processes transactions, the other handles settlement. This allows each to scale separately and one failure doesn't stop the other."
    </p>
  </div>

  <p style="margin: 12px 0 0 0; font-size: 12px; color: #4B5563; line-height: 1.5;">
    <strong>Why This Matters:</strong> Removes jargon ("leverage", "decouple", "orchestration"). Adds concrete explanation. Executive summary becomes comprehensible to non-technical stakeholders. Improves Comprehension score from 6/10 to 8/10.
  </p>
</div>
```

---

## 3. Adoption Risk Table

Used by adoption-evaluator to identify barriers.

```html
<table style="width: 100%; border-collapse: collapse; margin: 20px 0; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; font-size: 12px;">
  <thead>
    <tr style="background: #1F2937; color: white;">
      <th style="padding: 12px; text-align: left; border: 1px solid #E5E7EB; width: 30%;">Barrier</th>
      <th style="padding: 12px; text-align: center; border: 1px solid #E5E7EB; width: 15%;">Severity</th>
      <th style="padding: 12px; text-align: left; border: 1px solid #E5E7EB; width: 40%;">Issue & Fix</th>
      <th style="padding: 12px; text-align: center; border: 1px solid #E5E7EB; width: 15%;">Stakeholder</th>
    </tr>
  </thead>
  <tbody>
    <tr style="background: #FFFFFF;">
      <td style="padding: 12px; border: 1px solid #E5E7EB; font-weight: bold; color: #1F2937;">
        Authority Ambiguity
      </td>
      <td style="padding: 12px; border: 1px solid #E5E7EB; text-align: center;">
        <span style="background: #FEE2E2; color: #991B1B; padding: 4px 8px; border-radius: 4px; font-weight: bold; font-size: 11px;">
          HIGH
        </span>
      </td>
      <td style="padding: 12px; border: 1px solid #E5E7EB; color: #4B5563;">
        <strong>Issue:</strong> Document says "approval needed" but doesn't say from whom.<br/>
        <strong>Fix:</strong> "CFO approval required (budget >$500K). CTO approval required (technical feasibility)."
      </td>
      <td style="padding: 12px; border: 1px solid #E5E7EB; text-align: center; color: #6B7280; font-size: 11px;">
        CFO, CTO
      </td>
    </tr>

    <tr style="background: #F9FAFB;">
      <td style="padding: 12px; border: 1px solid #E5E7EB; font-weight: bold; color: #1F2937;">
        Unclear Next Steps
      </td>
      <td style="padding: 12px; border: 1px solid #E5E7EB; text-align: center;">
        <span style="background: #FEE2E2; color: #991B1B; padding: 4px 8px; border-radius: 4px; font-weight: bold; font-size: 11px;">
          HIGH
        </span>
      </td>
      <td style="padding: 12px; border: 1px solid #E5E7EB; color: #4B5563;">
        <strong>Issue:</strong> "Further discussion needed" is indefinite.<br/>
        <strong>Fix:</strong> "Week 1: CFO approval of $920K (by Mar 8). Owner: CFO + VP Eng."
      </td>
      <td style="padding: 12px; border: 1px solid #E5E7EB; text-align: center; color: #6B7280; font-size: 11px;">
        All
      </td>
    </tr>

    <tr style="background: #FFFFFF;">
      <td style="padding: 12px; border: 1px solid #E5E7EB; font-weight: bold; color: #1F2937;">
        ROI Ambiguity
      </td>
      <td style="padding: 12px; border: 1px solid #E5E7EB; text-align: center;">
        <span style="background: #FEF3C7; color: #92400E; padding: 4px 8px; border-radius: 4px; font-weight: bold; font-size: 11px;">
          MEDIUM
        </span>
      </td>
      <td style="padding: 12px; border: 1px solid #E5E7EB; color: #4B5563;">
        <strong>Issue:</strong> "Frees up $2-3M daily liquidity" is unclear.<br/>
        <strong>Fix:</strong> "Payback period: 5 days. 3-year NPV: $2.18B. ROI: 237%."
      </td>
      <td style="padding: 12px; border: 1px solid #E5E7EB; text-align: center; color: #6B7280; font-size: 11px;">
        CFO, CEO
      </td>
    </tr>
  </tbody>
</table>
```

---

## 4. Bias Flag Callout

Used by adoption-evaluator to identify resistance-creating assumptions.

```html
<div style="border-left: 4px solid #DC2626; padding: 16px; background: #FEF2F2; margin: 16px 0; border-radius: 4px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;">
  <div style="display: flex; align-items: flex-start;">
    <span style="font-size: 20px; margin-right: 12px;">🚨</span>
    <div style="flex: 1;">
      <h4 style="margin: 0 0 8px 0; color: #7F1D1D; font-size: 13px;">
        Optimism Bias — "Implementation will be smooth"
      </h4>
      <p style="margin: 8px 0; font-size: 12px; color: #4B5563; line-height: 1.5;">
        <strong>Assumption:</strong> No unforeseen issues will occur during migration.<br/>
        <strong>Resistance Trigger:</strong> CTO reads this, thinks "Naive estimate; implementation is always messier." Becomes skeptical of entire proposal.<br/>
        <strong>Affected Stakeholder:</strong> CTO (technical risk aversion)
      </p>
      <div style="background: white; padding: 10px; border-radius: 4px; margin-top: 8px; border-left: 3px solid #22D3EE;">
        <p style="margin: 0; font-size: 12px; color: #4B5563;">
          <strong>Fix:</strong> "Implementation will proceed smoothly IF prerequisites are met (vendor capability verified, team trained). We plan 2-week buffer for unforeseen issues (vendor API incompatibility, data reconciliation delays). Contingency: rollback to legacy gateway in <4 hours if critical issues emerge."
        </p>
      </div>
    </div>
  </div>
</div>
```

---

## 5. CTA Strength Badge

Used by adoption-evaluator to show call-to-action clarity.

```html
<div style="display: flex; gap: 12px; margin: 20px 0; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;">
  <!-- Current CTA (Weak) -->
  <div style="flex: 1; border: 2px solid #DC2626; border-radius: 8px; padding: 16px; background: #FEF2F2;">
    <h4 style="margin: 0 0 12px 0; color: #7F1D1D; font-size: 13px;">📍 Current CTA Strength: 5/10</h4>
    <p style="margin: 0; font-size: 12px; color: #4B5563; line-height: 1.5;">
      <strong>Current Text:</strong> "We recommend a phased upgrade approach. Further discussion with stakeholders is needed."
    </p>
    <ul style="margin: 8px 0 0 0; padding-left: 16px; font-size: 11px; color: #4B5563;">
      <li>❌ No deadline (indefinite)</li>
      <li>❌ No owner named (unclear who acts)</li>
      <li>❌ "Further discussion" invites endless debate</li>
      <li>✓ Recommendation is clear (phased approach)</li>
    </ul>
    <p style="margin: 8px 0 0 0; font-size: 11px; color: #7F1D1D; font-weight: bold;">
      → Likelihood of action: 20%
    </p>
  </div>

  <!-- Proposed CTA (Strong) -->
  <div style="flex: 1; border: 2px solid #42D36F; border-radius: 8px; padding: 16px; background: #F0FDF4;">
    <h4 style="margin: 0 0 12px 0; color: #166534; font-size: 13px;">📍 Proposed CTA Strength: 9/10</h4>
    <p style="margin: 0; font-size: 12px; color: #4B5563; line-height: 1.5;">
      <strong>Proposed Text:</strong> "CFO approval of $920K required by EOW March 8. Owner: [Name]. Escalate to CEO if delayed."
    </p>
    <ul style="margin: 8px 0 0 0; padding-left: 16px; font-size: 11px; color: #4B5563;">
      <li>✅ Clear deadline (Mar 8)</li>
      <li>✅ Owner named + responsibility clear</li>
      <li>✅ Escalation path defined (if delayed)</li>
      <li>✅ Urgency stated (regulatory deadline)</li>
    </ul>
    <p style="margin: 8px 0 0 0; font-size: 11px; color: #166534; font-weight: bold;">
      → Likelihood of action: 85%
    </p>
  </div>
</div>
```

---

## 6. Multi-Audience Navigation Menu

Used in mixed-audience deliverables to help readers choose their path.

```html
<div style="background: #F9FAFB; border: 1px solid #E5E7EB; border-radius: 8px; padding: 20px; margin: 20px 0; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;">
  <h3 style="margin: 0 0 16px 0; color: #1F2937; font-size: 14px;">🗺️ Navigation Menu — Choose Your Path</h3>

  <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 12px;">
    <!-- Executive Path -->
    <div style="padding: 16px; background: white; border-radius: 4px; border: 2px solid #6366F1; cursor: pointer;">
      <p style="margin: 0 0 8px 0; font-size: 12px; font-weight: bold; color: #6366F1;">
        👔 FOR EXECUTIVES (5 min)
      </p>
      <ul style="margin: 0; padding-left: 16px; font-size: 11px; color: #4B5563;">
        <li><a href="#exec-summary" style="color: #6366F1; text-decoration: none;">Executive Summary</a></li>
        <li><a href="#metrics" style="color: #6366F1; text-decoration: none;">Key Metrics & ROI</a></li>
        <li><a href="#recommendation" style="color: #6366F1; text-decoration: none;">Recommendation</a></li>
        <li><a href="#approval" style="color: #6366F1; text-decoration: none;">Approval Needed</a></li>
      </ul>
    </div>

    <!-- Technical Lead Path -->
    <div style="padding: 16px; background: white; border-radius: 4px; border: 2px solid #D97706; cursor: pointer;">
      <p style="margin: 0 0 8px 0; font-size: 12px; font-weight: bold; color: #D97706;">
        🏗️ FOR TECH LEADS (15 min)
      </p>
      <ul style="margin: 0; padding-left: 16px; font-size: 11px; color: #4B5563;">
        <li><a href="#architecture" style="color: #D97706; text-decoration: none;">Architecture Design</a></li>
        <li><a href="#risks" style="color: #D97706; text-decoration: none;">Risks & Mitigations</a></li>
        <li><a href="#timeline" style="color: #D97706; text-decoration: none;">Implementation Timeline</a></li>
        <li><a href="#vendor" style="color: #D97706; text-decoration: none;">Vendor Evaluation</a></li>
      </ul>
    </div>

    <!-- Developer Path -->
    <div style="padding: 16px; background: white; border-radius: 4px; border: 2px solid #3B82F6; cursor: pointer;">
      <p style="margin: 0 0 8px 0; font-size: 12px; font-weight: bold; color: #3B82F6;">
        🔧 FOR DEVELOPERS (20 min)
      </p>
      <ul style="margin: 0; padding-left: 16px; font-size: 11px; color: #4B5563;">
        <li><a href="#api-spec" style="color: #3B82F6; text-decoration: none;">API Specifications</a></li>
        <li><a href="#data-model" style="color: #3B82F6; text-decoration: none;">Data Model</a></li>
        <li><a href="#implementation" style="color: #3B82F6; text-decoration: none;">Implementation Details</a></li>
        <li><a href="#testing" style="color: #3B82F6; text-decoration: none;">Testing Strategy</a></li>
      </ul>
    </div>

    <!-- Business Analyst Path -->
    <div style="padding: 16px; background: white; border-radius: 4px; border: 2px solid #8B5CF6; cursor: pointer;">
      <p style="margin: 0 0 8px 0; font-size: 12px; font-weight: bold; color: #8B5CF6;">
        📊 FOR BAs (15 min)
      </p>
      <ul style="margin: 0; padding-left: 16px; font-size: 11px; color: #4B5563;">
        <li><a href="#business-case" style="color: #8B5CF6; text-decoration: none;">Business Case</a></li>
        <li><a href="#scenarios" style="color: #8B5CF6; text-decoration: none;">Scenarios & Use Cases</a></li>
        <li><a href="#success-criteria" style="color: #8B5CF6; text-decoration: none;">Success Criteria</a></li>
        <li><a href="#stakeholders" style="color: #8B5CF6; text-decoration: none;">Stakeholder Actions</a></li>
      </ul>
    </div>
  </div>

  <p style="margin: 16px 0 0 0; font-size: 11px; color: #6B7280;">
    💡 Tip: Pick your path and skip to your section. All audiences will converge on the Recommendation (you're deciding together).
  </p>
</div>
```

---

## 7. Verdict Badge

Used by clarity-reviewer to show final assessment.

```html
<div style="display: inline-block; padding: 12px 20px; border-radius: 8px; font-weight: bold; font-size: 13px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;">
  <!-- PASS -->
  <div style="background: #D1FAE5; color: #065F46; border: 2px solid #10B981;">
    ✅ PASS — All readability scores ≥7/10. Ready for circulation.
  </div>

  <!-- CONDITIONAL -->
  <div style="background: #FEF3C7; color: #92400E; border: 2px solid #F59E0B; margin-top: 8px;">
    ⚠️ CONDITIONAL — 1-2 scores 5-6/10. Apply top 5 micro-adjustments before circulation.
  </div>

  <!-- FAIL -->
  <div style="background: #FEE2E2; color: #991B1B; border: 2px solid #EF4444; margin-top: 8px;">
    ❌ FAIL — Multiple scores <5/10. Recommend rework before circulation. Critical issues: [list top 2]
  </div>
</div>
```

---

## Color Reference

| Color | Hex | Usage |
|-------|-----|-------|
| Primary Accent | #6366F1 | Executive/user-centric content, buttons |
| Warning | #D97706 | Medium-priority issues, micro-adjustments |
| Alert | #DC2626 | High-priority issues, adoption barriers |
| Positive | #22D3EE | Fixes, recommended actions, green checkmarks |
| Decorative (Tech) | #3B82F6 | Developer/technical content |
| Decorative (BA) | #8B5CF6 | Business Analyst content |

---

## Responsive Design Notes

All templates use:
- System fonts for readability: `font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif`
- Readable sizes: `13px` for body, `12px` for footnotes, `28px` for scores
- Grid layouts that stack on mobile (<768px): `grid-template-columns: repeat(auto-fit, minmax(200px, 1fr))`
- Semantic color coding (no red for success, no green for errors)

For print: All inline styles are preserved. No media queries needed for basic responsive behavior.
