---
name: ux-writing-patterns
description: HTML templates for callout box types, section summary card, table with summary header, progressive disclosure accordion, readability scorecard, microcopy examples
---

# UX Writing Patterns — HTML Templates

Reference patterns for applying UX writing standards. All templates use design tokens: #FF7E08 (orange key insight), #DC2626 (red warning), #D97706 (amber decision), #FFD700 (gold success), #42D36F (green positive).

---

## Pattern 1: Callout Box Types (4 Variants)

**Use Case:** Highlight critical information during document scanning phase

### Type 1: Key Insight (Orange)

**When to Use:** Critical finding, decision enabler, headline-worthy news

```html
<div style="
  border-left: 4px solid #FF7E08;
  background: #fff7ed;
  padding: 12px;
  border-radius: 4px;
  margin: 16px 0;
">
  <div style="
    font-weight: 600;
    color: #FF7E08;
    font-size: 12px;
    margin-bottom: 6px;
    text-transform: uppercase;
  ">
    🔑 Key Insight
  </div>
  <div style="
    color: #1f2937;
    font-size: 13px;
    line-height: 1.5;
  ">
    Scenario B is recommended for Phase 4. It meets all constraints (cost, timeline, risk) and is most feasible to execute.
  </div>
</div>
```

### Type 2: Warning (Red)

**When to Use:** Risk, blocker, unresolved issue, critical dependency

```html
<div style="
  border-left: 4px solid #DC2626;
  background: #fee2e2;
  padding: 12px;
  border-radius: 4px;
  margin: 16px 0;
">
  <div style="
    font-weight: 600;
    color: #DC2626;
    font-size: 12px;
    margin-bottom: 6px;
    text-transform: uppercase;
  ">
    ⚠ Warning
  </div>
  <div style="
    color: #1f2937;
    font-size: 13px;
    line-height: 1.5;
  ">
    Vendor certification is critical path. If certification is delayed, entire Phase 4 timeline is at risk. Mitigation: begin negotiations immediately.
  </div>
</div>
```

### Type 3: Decision Required (Amber)

**When to Use:** Awaiting stakeholder approval, unresolved choice, required action

```html
<div style="
  border-left: 4px solid #D97706;
  background: #fef3c7;
  padding: 12px;
  border-radius: 4px;
  margin: 16px 0;
">
  <div style="
    font-weight: 600;
    color: #D97706;
    font-size: 12px;
    margin-bottom: 6px;
    text-transform: uppercase;
  ">
    🔨 Decision Required
  </div>
  <div style="
    color: #1f2937;
    font-size: 13px;
    line-height: 1.5;
    margin-bottom: 10px;
  ">
    Approve expedited vendor certification funding ($150K additional)?
  </div>
  <div style="
    font-size: 12px;
    color: #6b7280;
  ">
    <strong>Timeline:</strong> Decision needed by March 15 to keep Phase 4 on track.
  </div>
</div>
```

### Type 4: Success / Milestone (Gold)

**When to Use:** Positive outcome, milestone reached, approval confirmed

```html
<div style="
  border-left: 4px solid #FFD700;
  background: #fef9e7;
  padding: 12px;
  border-radius: 4px;
  margin: 16px 0;
">
  <div style="
    font-weight: 600;
    color: #FFD700;
    font-size: 12px;
    margin-bottom: 6px;
    text-transform: uppercase;
  ">
    ✓ Success
  </div>
  <div style="
    color: #1f2937;
    font-size: 13px;
    line-height: 1.5;
  ">
    Scenario B approved for Phase 4. Phase 4 architecture design can now begin. Assign architecture team by March 20.
  </div>
</div>
```

---

## Pattern 2: Section Summary Card

**Use Case:** Preview section content for reader in 1 minute

```html
<div style="
  background: #f0fdf4;
  border: 1px solid #dcfce7;
  border-radius: 6px;
  padding: 16px;
  margin: 16px 0;
">
  <div style="
    font-size: 11px;
    font-weight: 600;
    color: #166534;
    margin-bottom: 8px;
    text-transform: uppercase;
  ">
    Section Preview
  </div>
  <div style="
    font-size: 13px;
    color: #1f2937;
    margin-bottom: 12px;
    font-weight: 500;
  ">
    Cost Analysis: Three Scenarios
  </div>
  <div style="
    font-size: 12px;
    color: #4b5563;
    line-height: 1.6;
  ">
    This section compares cost across three scenarios. You'll find detailed breakdowns by phase, unit cost assumptions, and total lifecycle cost. Scenario B has the lowest cost ($2.5M), but read the trade-offs section to understand implications.
  </div>
  <div style="
    margin-top: 10px;
    padding-top: 10px;
    border-top: 1px solid #dcfce7;
    font-size: 11px;
    color: #6b7280;
  ">
    <strong>Key Finding:</strong> Scenario B is 15% under budget and most cost-effective.
  </div>
</div>
```

---

## Pattern 3: Table with Summary Header

**Use Case:** Present data with high-level summary before detailed rows

```html
<div style="margin: 20px 0;">
  <!-- Summary Row (Sticky) -->
  <div style="
    background: #f0fdf4;
    padding: 12px;
    border: 1px solid #dcfce7;
    border-bottom: 2px solid #166534;
    margin-bottom: 0;
    border-radius: 4px 4px 0 0;
  ">
    <div style="font-size: 12px; color: #166534; font-weight: 600;">
      SUMMARY: All three scenarios meet core constraints (≤$3M budget, ≤8 months timeline)
    </div>
  </div>

  <!-- Table -->
  <table style="
    width: 100%;
    border-collapse: collapse;
    font-size: 12px;
    background: white;
    border: 1px solid #e5e7eb;
    border-top: none;
  ">
    <thead>
      <tr style="background: #f3f4f6; border-bottom: 2px solid #d1d5db;">
        <th style="padding: 10px; text-align: left; font-weight: 600; color: #1f2937;">Scenario</th>
        <th style="padding: 10px; text-align: right; font-weight: 600; color: #1f2937;">Cost</th>
        <th style="padding: 10px; text-align: right; font-weight: 600; color: #1f2937;">Timeline</th>
        <th style="padding: 10px; text-align: left; font-weight: 600; color: #1f2937;">Risk</th>
        <th style="padding: 10px; text-align: center; font-weight: 600; color: #1f2937;">Status</th>
      </tr>
    </thead>
    <tbody>
      <tr style="border-bottom: 1px solid #e5e7eb;">
        <td style="padding: 10px;">Option A</td>
        <td style="padding: 10px; text-align: right; color: #666;">$3.2M</td>
        <td style="padding: 10px; text-align: right; color: #666;">8 months</td>
        <td style="padding: 10px;">High</td>
        <td style="padding: 10px; text-align: center;">
          <span style="background: #fee2e2; color: #DC2626; padding: 3px 8px; border-radius: 3px; font-weight: 500; font-size: 11px;">⚠ Risk</span>
        </td>
      </tr>
      <tr style="border-bottom: 1px solid #e5e7eb; background: #f0fdf4;">
        <td style="padding: 10px; font-weight: 600;">Option B</td>
        <td style="padding: 10px; text-align: right; font-weight: 600; color: #166534;">$2.5M</td>
        <td style="padding: 10px; text-align: right; font-weight: 600; color: #166534;">6 months</td>
        <td style="padding: 10px; font-weight: 600;">Medium</td>
        <td style="padding: 10px; text-align: center;">
          <span style="background: #dcfce7; color: #166534; padding: 3px 8px; border-radius: 3px; font-weight: 600; font-size: 11px;">✓ RECOMMENDED</span>
        </td>
      </tr>
      <tr style="border-bottom: 1px solid #e5e7eb;">
        <td style="padding: 10px;">Option C</td>
        <td style="padding: 10px; text-align: right; color: #666;">$2.8M</td>
        <td style="padding: 10px; text-align: right; color: #666;">7 months</td>
        <td style="padding: 10px;">Medium</td>
        <td style="padding: 10px; text-align: center;">
          <span style="background: #f3f4f6; color: #6b7280; padding: 3px 8px; border-radius: 3px; font-weight: 500; font-size: 11px;">○ Alternative</span>
        </td>
      </tr>
    </tbody>
  </table>

  <!-- Footer Summary -->
  <div style="
    background: white;
    padding: 10px 12px;
    border: 1px solid #e5e7eb;
    border-top: none;
    border-radius: 0 0 4px 4px;
    font-size: 11px;
    color: #6b7280;
  ">
    <strong>Cost Savings:</strong> Option B saves $700K vs. A, $300K vs. C. <strong>Timeline Benefit:</strong> Option B completes 2 months earlier than A.
  </div>
</div>
```

---

## Pattern 4: Progressive Disclosure Accordion

**Use Case:** Let reader choose depth (summary → detail → appendix)

```html
<div style="margin: 20px 0;">
  <!-- Level 1: Summary -->
  <div style="
    background: #fff;
    border: 1px solid #e5e7eb;
    border-radius: 6px;
    margin-bottom: 12px;
  ">
    <button style="
      width: 100%;
      padding: 12px;
      background: #f3f4f6;
      border: none;
      text-align: left;
      cursor: pointer;
      font-weight: 600;
      color: #1f2937;
      border-radius: 6px;
      font-size: 13px;
    ">
      ▶ Phase 2 Timeline: 6 Months (Summary)
    </button>
    <div style="padding: 12px; border-top: 1px solid #e5e7eb; display: block;">
      <div style="font-size: 12px; color: #4b5563;">
        Phase 2 takes 6 months from kickoff to go-live. Critical path is vendor certification (4 weeks). All dependencies identified.
      </div>
    </div>
  </div>

  <!-- Level 2: Detail -->
  <div style="
    background: #fff;
    border: 1px solid #e5e7eb;
    border-radius: 6px;
    margin-bottom: 12px;
  ">
    <button style="
      width: 100%;
      padding: 12px;
      background: #f3f4f6;
      border: none;
      text-align: left;
      cursor: pointer;
      font-weight: 600;
      color: #1f2937;
      border-radius: 6px;
      font-size: 13px;
    ">
      ▶ Phase 2 Timeline: Detailed Breakdown (Detail)
    </button>
    <div style="padding: 12px; border-top: 1px solid #e5e7eb; display: none;">
      <table style="width: 100%; font-size: 11px; color: #4b5563;">
        <tr style="border-bottom: 1px solid #e5e7eb;">
          <td style="padding: 6px;">Design & Architecture</td>
          <td style="padding: 6px; text-align: right;">4 weeks</td>
        </tr>
        <tr style="border-bottom: 1px solid #e5e7eb;">
          <td style="padding: 6px;">Vendor Certification (Critical Path)</td>
          <td style="padding: 6px; text-align: right;">4 weeks</td>
        </tr>
        <tr style="border-bottom: 1px solid #e5e7eb;">
          <td style="padding: 6px;">Development & Integration</td>
          <td style="padding: 6px; text-align: right;">6 weeks</td>
        </tr>
        <tr style="border-bottom: 1px solid #e5e7eb;">
          <td style="padding: 6px;">Testing & QA</td>
          <td style="padding: 6px; text-align: right;">4 weeks</td>
        </tr>
        <tr>
          <td style="padding: 6px; font-weight: 600;">Total</td>
          <td style="padding: 6px; text-align: right; font-weight: 600;">24 weeks (6 months)</td>
        </tr>
      </table>
    </div>
  </div>

  <!-- Level 3: Appendix -->
  <div style="
    background: #fff;
    border: 1px solid #e5e7eb;
    border-radius: 6px;
    margin-bottom: 12px;
  ">
    <button style="
      width: 100%;
      padding: 12px;
      background: #f3f4f6;
      border: none;
      text-align: left;
      cursor: pointer;
      font-weight: 600;
      color: #1f2937;
      border-radius: 6px;
      font-size: 13px;
    ">
      ▶ Phase 2 Gantt Chart & Detailed Dependencies (Appendix)
    </button>
    <div style="padding: 12px; border-top: 1px solid #e5e7eb; display: none; font-size: 11px; color: #6b7280;">
      [Full Gantt chart with all tasks, dependencies, resource allocation, and risk mitigations would appear here]
    </div>
  </div>
</div>

<script>
// Toggle accordion visibility
document.querySelectorAll('button').forEach(btn => {
  btn.addEventListener('click', () => {
    const content = btn.nextElementSibling;
    content.style.display = content.style.display === 'none' ? 'block' : 'none';
    btn.textContent = btn.textContent.replace(/[▶◀]/,
      content.style.display === 'none' ? '▶' : '◀');
  });
});
</script>
```

---

## Pattern 5: Readability Scorecard

**Use Case:** Show document readability metrics at-a-glance

```html
<div style="
  background: white;
  border: 2px solid #e5e7eb;
  border-radius: 8px;
  padding: 20px;
  margin: 20px 0;
">
  <h3 style="margin-top: 0; color: #1f2937; font-size: 16px;">Readability Scorecard</h3>

  <div style="
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
    gap: 12px;
    margin-bottom: 20px;
  ">
    <!-- Metric 1: Sentence Length -->
    <div style="
      background: #f0fdf4;
      padding: 12px;
      border-radius: 6px;
      border-left: 4px solid #42D36F;
    ">
      <div style="font-size: 11px; color: #6b7280; margin-bottom: 4px; font-weight: 600;">SENTENCE LENGTH</div>
      <div style="font-size: 22px; font-weight: 700; color: #1f2937; margin-bottom: 4px;">18 words</div>
      <div style="font-size: 11px; color: #166534;">✓ Target: 15-20</div>
    </div>

    <!-- Metric 2: Passive Voice -->
    <div style="
      background: #fee2e2;
      padding: 12px;
      border-radius: 6px;
      border-left: 4px solid #DC2626;
    ">
      <div style="font-size: 11px; color: #6b7280; margin-bottom: 4px; font-weight: 600;">PASSIVE VOICE</div>
      <div style="font-size: 22px; font-weight: 700; color: #1f2937; margin-bottom: 4px;">24%</div>
      <div style="font-size: 11px; color: #991b1b;">⚠ Target: <15%</div>
    </div>

    <!-- Metric 3: Jargon Density -->
    <div style="
      background: #fef3c7;
      padding: 12px;
      border-radius: 6px;
      border-left: 4px solid #D97706;
    ">
      <div style="font-size: 11px; color: #6b7280; margin-bottom: 4px; font-weight: 600;">JARGON/PARAGRAPH</div>
      <div style="font-size: 22px; font-weight: 700; color: #1f2937; margin-bottom: 4px;">2.1 terms</div>
      <div style="font-size: 11px; color: #92400e;">✓ Target: ≤2</div>
    </div>

    <!-- Metric 4: Grade Level -->
    <div style="
      background: #fee2e2;
      padding: 12px;
      border-radius: 6px;
      border-left: 4px solid #DC2626;
    ">
      <div style="font-size: 11px; color: #6b7280; margin-bottom: 4px; font-weight: 600;">FLESCH-KINCAID</div>
      <div style="font-size: 22px; font-weight: 700; color: #1f2937; margin-bottom: 4px;">13.2</div>
      <div style="font-size: 11px; color: #991b1b;">⚠ Target: ≤12</div>
    </div>
  </div>

  <!-- Overall Assessment -->
  <div style="
    background: #fef3c7;
    border-left: 4px solid #D97706;
    padding: 12px;
    border-radius: 4px;
  ">
    <div style="font-size: 12px; color: #92400e; margin-bottom: 6px;">
      <strong>Overall Assessment:</strong> NEEDS WORK
    </div>
    <div style="font-size: 11px; color: #92400e; line-height: 1.5;">
      Document is slightly above target grade level (13.2 vs. target 12). Primary issues: passive voice (24% vs. target <15%) and sentence length (avg 18 words, but peaks at 35+ words). Recommendation: rewrite high-passive sections, break up sentences >30 words.
    </div>
  </div>

  <!-- Improvement Checklist -->
  <div style="
    margin-top: 12px;
    padding-top: 12px;
    border-top: 1px solid #e5e7eb;
  ">
    <div style="font-size: 12px; font-weight: 600; color: #1f2937; margin-bottom: 8px;">Improvement Checklist:</div>
    <ul style="font-size: 11px; color: #4b5563; margin: 0; padding-left: 20px; line-height: 1.6;">
      <li>☐ Rewrite 8 sentences in Section 2 (passive voice hotspot)</li>
      <li>☐ Break up 3 sentences exceeding 35 words</li>
      <li>☐ Define 2 jargon terms inline (amortization, APR)</li>
      <li>☐ Re-test grade after edits (target: 12.0)</li>
    </ul>
  </div>
</div>
```

---

## Pattern 6: Microcopy Examples Table

**Use Case:** Reference correct vs. incorrect microcopy patterns

```html
<div style="
  background: white;
  border: 1px solid #e5e7eb;
  border-radius: 6px;
  overflow: hidden;
  margin: 20px 0;
">
  <table style="width: 100%; border-collapse: collapse; font-size: 12px;">
    <thead>
      <tr style="background: #f3f4f6; border-bottom: 2px solid #d1d5db;">
        <th style="padding: 12px; text-align: left; color: #1f2937; font-weight: 600;">Context</th>
        <th style="padding: 12px; text-align: left; color: #1f2937; font-weight: 600;">❌ Don't</th>
        <th style="padding: 12px; text-align: left; color: #1f2937; font-weight: 600;">✓ Do</th>
      </tr>
    </thead>
    <tbody>
      <!-- Button Copy -->
      <tr style="border-bottom: 1px solid #e5e7eb;">
        <td style="padding: 12px; font-weight: 600; background: #f9fafb;">Button Text</td>
        <td style="padding: 12px; background: #fee2e2;">
          <code style="background: #fecaca; padding: 2px 6px; border-radius: 3px; font-size: 11px;">Click Here</code><br>
          <span style="font-size: 11px; color: #6b7280; margin-top: 4px;">No context of outcome</span>
        </td>
        <td style="padding: 12px; background: #dcfce7;">
          <code style="background: #c7f0d8; padding: 2px 6px; border-radius: 3px; font-size: 11px;">View Architecture</code><br>
          <span style="font-size: 11px; color: #6b7280; margin-top: 4px;">Verb + object (clear outcome)</span>
        </td>
      </tr>

      <!-- Error Message -->
      <tr style="border-bottom: 1px solid #e5e7eb;">
        <td style="padding: 12px; font-weight: 600; background: #f9fafb;">Error Message</td>
        <td style="padding: 12px; background: #fee2e2;">
          <code style="background: #fecaca; padding: 2px 6px; border-radius: 3px; font-size: 11px;">Invalid amount</code><br>
          <span style="font-size: 11px; color: #6b7280; margin-top: 4px;">No explanation or action</span>
        </td>
        <td style="padding: 12px; background: #dcfce7;">
          <code style="background: #c7f0d8; padding: 2px 6px; border-radius: 3px; font-size: 11px;">Amount exceeds limit ($800K > $750K). Enter ≤$750,000.</code><br>
          <span style="font-size: 11px; color: #6b7280; margin-top: 4px;">What, why, how to fix</span>
        </td>
      </tr>

      <!-- Empty State -->
      <tr style="border-bottom: 1px solid #e5e7eb;">
        <td style="padding: 12px; font-weight: 600; background: #f9fafb;">Empty State</td>
        <td style="padding: 12px; background: #fee2e2;">
          <code style="background: #fecaca; padding: 2px 6px; border-radius: 3px; font-size: 11px;">No data available</code><br>
          <span style="font-size: 11px; color: #6b7280; margin-top: 4px;">User doesn't know what to do</span>
        </td>
        <td style="padding: 12px; background: #dcfce7;">
          <code style="background: #c7f0d8; padding: 2px 6px; border-radius: 3px; font-size: 11px;">No scenarios evaluated yet. Run Phase 3 to generate options.</code><br>
          <span style="font-size: 11px; color: #6b7280; margin-top: 4px;">What's missing + how to fix</span>
        </td>
      </tr>

      <!-- Confirmation -->
      <tr style="border-bottom: 1px solid #e5e7eb;">
        <td style="padding: 12px; font-weight: 600; background: #f9fafb;">Confirmation Message</td>
        <td style="padding: 12px; background: #fee2e2;">
          <code style="background: #fecaca; padding: 2px 6px; border-radius: 3px; font-size: 11px;">Success</code><br>
          <span style="font-size: 11px; color: #6b7280; margin-top: 4px;">Too vague</span>
        </td>
        <td style="padding: 12px; background: #dcfce7;">
          <code style="background: #c7f0d8; padding: 2px 6px; border-radius: 3px; font-size: 11px;">Scenario B approved. Phase 4 design can now begin.</code><br>
          <span style="font-size: 11px; color: #6b7280; margin-top: 4px;">What done + what happens next</span>
        </td>
      </tr>

      <!-- Help Text -->
      <tr>
        <td style="padding: 12px; font-weight: 600; background: #f9fafb;">Help Text</td>
        <td style="padding: 12px; background: #fee2e2;">
          <code style="background: #fecaca; padding: 2px 6px; border-radius: 3px; font-size: 11px;">Income</code><br>
          <span style="font-size: 11px; color: #6b7280; margin-top: 4px;">Unclear (gross? net?)</span>
        </td>
        <td style="padding: 12px; background: #dcfce7;">
          <code style="background: #c7f0d8; padding: 2px 6px; border-radius: 3px; font-size: 11px;">Annual income: Total earnings before taxes (W-2 or tax return)</code><br>
          <span style="font-size: 11px; color: #6b7280; margin-top: 4px;">Definition + source + example</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
```

---

## Usage Notes

- All templates use semantic color coding (Green = positive/success, Red = warning/critical, Orange = key insight, Amber = decision required, Gold = milestone)
- Templates are responsive (grid with minmax for mobile)
- Copy HTML directly into Sofka deliverable documents or render via markdown-to-HTML conversion
- Customize colors, text, and structure per document needs
- Use accessibility-friendly colors (contrast ratio ≥4.5:1 for text)
- Combine templates (e.g., callout + table for emphasized data presentation)
