---
name: functional-tools-patterns
description: HTML templates and visual patterns for event storming board, story map, decision table, Given/When/Then card, traceability matrix, anti-pattern detection report
---

# Functional Tools Patterns — HTML Templates

Reference patterns for visualizing and structuring functional analysis artifacts. All templates use design tokens: #6366F1 (orange), #DC2626 (red), #D97706 (amber), #22D3EE (gold), #42D36F (green).

---

## Pattern 1: Event Storming Board (Lightweight)

**Use Case:** Visualize domain events, aggregates, and actors in 90-minute remote session

**HTML Template:**

```html
<div style="
  font-family: 'Segoe UI', sans-serif;
  background: #f9fafb;
  padding: 20px;
  border-radius: 8px;
  border: 2px solid #e5e7eb;
">
  <h2 style="color: #1f2937; margin-top: 0;">Event Storming: Order Fulfillment Flow</h2>

  <!-- Legend -->
  <div style="display: flex; gap: 16px; margin-bottom: 20px; flex-wrap: wrap;">
    <div style="display: flex; align-items: center; gap: 8px;">
      <div style="width: 24px; height: 24px; background: #6366F1; border-radius: 4px;"></div>
      <span style="font-size: 13px; color: #4b5563;">Domain Event</span>
    </div>
    <div style="display: flex; align-items: center; gap: 8px;">
      <div style="width: 24px; height: 24px; background: #D97706; border-radius: 4px;"></div>
      <span style="font-size: 13px; color: #4b5563;">Command</span>
    </div>
    <div style="display: flex; align-items: center; gap: 8px;">
      <div style="width: 24px; height: 24px; background: #3b82f6; border-radius: 4px;"></div>
      <span style="font-size: 13px; color: #4b5563;">Actor</span>
    </div>
    <div style="display: flex; align-items: center; gap: 8px;">
      <div style="width: 24px; height: 24px; background: #6b7280; border-radius: 4px;"></div>
      <span style="font-size: 13px; color: #4b5563;">Aggregate</span>
    </div>
    <div style="display: flex; align-items: center; gap: 8px;">
      <div style="width: 24px; height: 24px; background: #fbbf24; border-radius: 4px;"></div>
      <span style="font-size: 13px; color: #4b5563;">Hot Spot</span>
    </div>
  </div>

  <!-- Timeline -->
  <div style="
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
    gap: 12px;
  ">
    <!-- Card 1: Event -->
    <div style="
      background: white;
      border-left: 4px solid #6366F1;
      padding: 12px;
      border-radius: 4px;
      box-shadow: 0 1px 2px rgba(0,0,0,0.05);
    ">
      <div style="
        font-size: 11px;
        font-weight: 600;
        color: #6366F1;
        margin-bottom: 4px;
        text-transform: uppercase;
      ">Event</div>
      <div style="
        font-size: 14px;
        font-weight: 500;
        color: #1f2937;
        margin-bottom: 8px;
      ">Order Placed</div>
      <div style="
        font-size: 12px;
        color: #6b7280;
        margin-bottom: 6px;
      "><strong>Actor:</strong> Customer</div>
      <div style="
        font-size: 12px;
        color: #6b7280;
      "><strong>Aggregate:</strong> Order</div>
    </div>

    <!-- Card 2: Command -->
    <div style="
      background: white;
      border-left: 4px solid #D97706;
      padding: 12px;
      border-radius: 4px;
      box-shadow: 0 1px 2px rgba(0,0,0,0.05);
    ">
      <div style="
        font-size: 11px;
        font-weight: 600;
        color: #D97706;
        margin-bottom: 4px;
        text-transform: uppercase;
      ">Command</div>
      <div style="
        font-size: 14px;
        font-weight: 500;
        color: #1f2937;
        margin-bottom: 8px;
      ">Verify Inventory</div>
      <div style="
        font-size: 12px;
        color: #6b7280;
        margin-bottom: 6px;
      "><strong>Actor:</strong> Inventory System</div>
      <div style="
        font-size: 12px;
        color: #6b7280;
      "><strong>Outcome:</strong> Inventory Updated</div>
    </div>

    <!-- Card 3: Hot Spot -->
    <div style="
      background: white;
      border-left: 4px solid #fbbf24;
      padding: 12px;
      border-radius: 4px;
      box-shadow: 0 1px 2px rgba(0,0,0,0.05);
    ">
      <div style="
        font-size: 11px;
        font-weight: 600;
        color: #fbbf24;
        margin-bottom: 4px;
        text-transform: uppercase;
      ">Hot Spot (Unclear)</div>
      <div style="
        font-size: 14px;
        font-weight: 500;
        color: #1f2937;
        margin-bottom: 8px;
      ">Partial Order Handling</div>
      <div style="
        font-size: 12px;
        color: #6b7280;
      ">What happens if only 50% of items in stock?</div>
    </div>
  </div>

  <!-- Summary -->
  <div style="
    margin-top: 20px;
    padding: 12px;
    background: #eff6ff;
    border-left: 4px solid #3b82f6;
    border-radius: 4px;
  ">
    <div style="font-size: 13px; color: #1e40af; margin-bottom: 6px;">
      <strong>Findings:</strong>
    </div>
    <ul style="font-size: 12px; color: #1e40af; margin: 0; padding-left: 20px;">
      <li>4 domain events identified; Order and Inventory are primary aggregates</li>
      <li>Hot spot: Partial inventory scenario — requires business decision on backorder vs. rejection</li>
      <li>Bounded context: Order (customer-facing), Inventory (system-facing) — may need separate services</li>
    </ul>
  </div>
</div>
```

---

## Pattern 2: Story Map (Backbone + Walking Skeleton)

**Use Case:** Visualize user activities, tasks, and release priorities

**HTML Template:**

```html
<div style="
  font-family: 'Segoe UI', sans-serif;
  background: #f9fafb;
  padding: 20px;
  border-radius: 8px;
  border: 2px solid #e5e7eb;
">
  <h2 style="color: #1f2937; margin-top: 0;">Story Map: Loan Application</h2>

  <!-- Legend -->
  <div style="display: flex; gap: 16px; margin-bottom: 20px; flex-wrap: wrap; font-size: 12px;">
    <div style="display: flex; align-items: center; gap: 6px;">
      <div style="width: 16px; height: 16px; background: #3b82f6; border-radius: 2px;"></div>
      <span>MVP (Release 1)</span>
    </div>
    <div style="display: flex; align-items: center; gap: 6px;">
      <div style="width: 16px; height: 16px; background: #06b6d4; border-radius: 2px;"></div>
      <span>Phase 2</span>
    </div>
    <div style="display: flex; align-items: center; gap: 6px;">
      <div style="width: 16px; height: 16px; background: #8b5cf6; border-radius: 2px;"></div>
      <span>Phase 3</span>
    </div>
  </div>

  <!-- Backbone (Activities) -->
  <div style="margin-bottom: 20px;">
    <div style="font-size: 13px; font-weight: 600; color: #4b5563; margin-bottom: 12px;">ACTIVITIES (User Goals)</div>
    <div style="
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
      gap: 10px;
    ">
      <div style="
        padding: 12px;
        background: white;
        border: 2px solid #3b82f6;
        border-radius: 4px;
        text-align: center;
      ">
        <div style="font-size: 13px; font-weight: 500; color: #1f2937;">Provide Information</div>
      </div>
      <div style="
        padding: 12px;
        background: white;
        border: 2px solid #3b82f6;
        border-radius: 4px;
        text-align: center;
      ">
        <div style="font-size: 13px; font-weight: 500; color: #1f2937;">Verify Credentials</div>
      </div>
      <div style="
        padding: 12px;
        background: white;
        border: 2px solid #3b82f6;
        border-radius: 4px;
        text-align: center;
      ">
        <div style="font-size: 13px; font-weight: 500; color: #1f2937;">Review Offer</div>
      </div>
      <div style="
        padding: 12px;
        background: white;
        border: 2px solid #06b6d4;
        border-radius: 4px;
        text-align: center;
      ">
        <div style="font-size: 13px; font-weight: 500; color: #1f2937;">Accept & Sign</div>
      </div>
    </div>
  </div>

  <!-- Walking Skeleton (MVP Stories) -->
  <div style="margin-bottom: 20px;">
    <div style="font-size: 13px; font-weight: 600; color: #4b5563; margin-bottom: 12px;">WALKING SKELETON (MVP Release 1)</div>
    <div style="
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
      gap: 10px;
    ">
      <div style="background: white; border: 1px solid #e5e7eb; border-radius: 4px; padding: 10px;">
        <div style="font-size: 11px; color: #6b7280; margin-bottom: 4px;">US-001</div>
        <div style="font-size: 12px; font-weight: 500; color: #1f2937; margin-bottom: 6px;">Enter Loan Amount</div>
        <div style="font-size: 11px; color: #4b5563; line-height: 1.4;">As customer, I want to enter loan amount so bank can assess my need</div>
        <div style="margin-top: 6px; font-size: 10px; color: #6b7280;"><strong>AC:</strong> 3</div>
      </div>
      <div style="background: white; border: 1px solid #e5e7eb; border-radius: 4px; padding: 10px;">
        <div style="font-size: 11px; color: #6b7280; margin-bottom: 4px;">US-002</div>
        <div style="font-size: 12px; font-weight: 500; color: #1f2937; margin-bottom: 6px;">Upload Income Doc</div>
        <div style="font-size: 11px; color: #4b5563; line-height: 1.4;">As customer, I want to upload proof of income so bank can verify my earnings</div>
        <div style="margin-top: 6px; font-size: 10px; color: #6b7280;"><strong>AC:</strong> 4</div>
      </div>
      <div style="background: white; border: 1px solid #e5e7eb; border-radius: 4px; padding: 10px;">
        <div style="font-size: 11px; color: #6b7280; margin-bottom: 4px;">US-003</div>
        <div style="font-size: 12px; font-weight: 500; color: #1f2937; margin-bottom: 6px;">View Loan Offer</div>
        <div style="font-size: 11px; color: #4b5563; line-height: 1.4;">As customer, I want to see offer details (rate, term, payment) before deciding</div>
        <div style="margin-top: 6px; font-size: 10px; color: #6b7280;"><strong>AC:</strong> 2</div>
      </div>
    </div>
  </div>

  <!-- Release Plan Summary -->
  <div style="
    padding: 12px;
    background: #f0fdf4;
    border-left: 4px solid #42D36F;
    border-radius: 4px;
    font-size: 12px;
    color: #166534;
  ">
    <strong>Release Plan:</strong>
    <ul style="margin: 6px 0; padding-left: 20px;">
      <li><strong>Release 1 (MVP):</strong> 9 stories, 28 story points — core loan application flow</li>
      <li><strong>Release 2:</strong> 5 stories, 18 story points — document analytics, rate comparison</li>
      <li><strong>Release 3:</strong> 7 stories, 21 story points — multi-product support, portfolio management</li>
    </ul>
  </div>
</div>
```

---

## Pattern 3: Decision Table

**Use Case:** Formalize business rule logic, validate completeness

**HTML Template:**

```html
<div style="
  font-family: 'Segoe UI', sans-serif;
  background: #f9fafb;
  padding: 20px;
  border-radius: 8px;
  border: 2px solid #e5e7eb;
">
  <h2 style="color: #1f2937; margin-top: 0;">Decision Table: Loan Qualification Rule</h2>

  <div style="margin-bottom: 16px; font-size: 13px; color: #4b5563;">
    <strong>Rule ID:</strong> BR-001 |
    <strong>Type:</strong> Qualification Constraint |
    <strong>Coverage:</strong> 100% (8/8 combinations)
  </div>

  <!-- Table -->
  <div style="
    overflow-x: auto;
    margin-bottom: 20px;
  ">
    <table style="
      width: 100%;
      border-collapse: collapse;
      font-size: 12px;
      background: white;
    ">
      <thead>
        <tr style="background: #f3f4f6; border-bottom: 2px solid #d1d5db;">
          <th style="
            padding: 10px;
            text-align: left;
            font-weight: 600;
            color: #1f2937;
            border-right: 1px solid #e5e7eb;
          ">Income > $50K</th>
          <th style="
            padding: 10px;
            text-align: left;
            font-weight: 600;
            color: #1f2937;
            border-right: 1px solid #e5e7eb;
          ">Savings ≥ $100K</th>
          <th style="
            padding: 10px;
            text-align: left;
            font-weight: 600;
            color: #1f2937;
            border-right: 1px solid #e5e7eb;
          ">Credit Score > 650</th>
          <th style="
            padding: 10px;
            text-align: left;
            font-weight: 600;
            color: #1f2937;
            border-right: 1px solid #e5e7eb;
          ">No Bankruptcy</th>
          <th style="
            padding: 10px;
            text-align: left;
            font-weight: 600;
            color: #1f2937;
          ">ACTION</th>
        </tr>
      </thead>
      <tbody>
        <tr style="border-bottom: 1px solid #e5e7eb;">
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">T</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">-</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">-</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">T</td>
          <td style="padding: 10px; background: #dcfce7;">
            <span style="
              background: #42D36F;
              color: white;
              padding: 4px 8px;
              border-radius: 3px;
              font-weight: 500;
              font-size: 11px;
            ">APPROVED</span>
          </td>
        </tr>
        <tr style="border-bottom: 1px solid #e5e7eb;">
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">F</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">T</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">T</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">T</td>
          <td style="padding: 10px; background: #dcfce7;">
            <span style="
              background: #42D36F;
              color: white;
              padding: 4px 8px;
              border-radius: 3px;
              font-weight: 500;
              font-size: 11px;
            ">APPROVED</span>
          </td>
        </tr>
        <tr style="border-bottom: 1px solid #e5e7eb;">
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">F</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">T</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">F</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">-</td>
          <td style="padding: 10px; background: #fee2e2;">
            <span style="
              background: #DC2626;
              color: white;
              padding: 4px 8px;
              border-radius: 3px;
              font-weight: 500;
              font-size: 11px;
            ">REJECTED</span>
          </td>
        </tr>
        <tr style="border-bottom: 1px solid #e5e7eb;">
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">F</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">F</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">-</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">-</td>
          <td style="padding: 10px; background: #fee2e2;">
            <span style="
              background: #DC2626;
              color: white;
              padding: 4px 8px;
              border-radius: 3px;
              font-weight: 500;
              font-size: 11px;
            ">REJECTED</span>
          </td>
        </tr>
        <tr style="border-bottom: 1px solid #e5e7eb; background: #fff7ed;">
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">-</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">-</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">-</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">F</td>
          <td style="padding: 10px;">
            <span style="
              background: #DC2626;
              color: white;
              padding: 4px 8px;
              border-radius: 3px;
              font-weight: 500;
              font-size: 11px;
            ">REJECTED</span>
            <span style="
              background: #ffd700;
              color: #1f2937;
              padding: 4px 8px;
              border-radius: 3px;
              font-weight: 500;
              font-size: 11px;
              margin-left: 6px;
            ">Override Rule</span>
          </td>
        </tr>
      </tbody>
    </table>
  </div>

  <!-- Validation Summary -->
  <div style="
    padding: 12px;
    background: #f0fdf4;
    border-left: 4px solid #42D36F;
    border-radius: 4px;
  ">
    <div style="font-size: 12px; color: #166534; margin-bottom: 6px;">
      <strong>Validation Results:</strong>
    </div>
    <ul style="font-size: 11px; color: #166534; margin: 0; padding-left: 20px;">
      <li>✓ Completeness: 100% — all 8 condition combinations covered (2^4 = 16 possible, 8 distinct outcomes)</li>
      <li>✓ Determinism: Unique action per row — no conflicting outcomes</li>
      <li>✓ Consistency: No contradictions detected</li>
      <li>✓ Testability: All conditions measurable (income amount, savings amount, credit score, bankruptcy flag)</li>
    </ul>
  </div>
</div>
```

---

## Pattern 4: Given/When/Then Acceptance Criteria Card

**Use Case:** Display single scenario in readable format for development/testing

**HTML Template:**

```html
<div style="
  font-family: 'Segoe UI', sans-serif;
  background: white;
  border: 1px solid #e5e7eb;
  border-radius: 6px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
  padding: 16px;
  max-width: 600px;
">
  <!-- Header -->
  <div style="margin-bottom: 16px; padding-bottom: 12px; border-bottom: 2px solid #f3f4f6;">
    <div style="font-size: 11px; color: #6b7280; margin-bottom: 4px; font-weight: 600; text-transform: uppercase;">AC-002</div>
    <h3 style="margin: 0; font-size: 16px; color: #1f2937; font-weight: 600;">
      Customer attempts loan amount exceeding income limit
    </h3>
    <div style="margin-top: 8px; font-size: 12px; color: #4b5563;">
      <strong>Type:</strong> Negative | <strong>Priority:</strong> P0 (Blocker) | <strong>Test:</strong> TC-002
    </div>
  </div>

  <!-- Given -->
  <div style="margin-bottom: 16px;">
    <div style="
      font-size: 13px;
      font-weight: 600;
      color: #1f2937;
      margin-bottom: 8px;
      display: flex;
      align-items: center;
      gap: 8px;
    ">
      <span style="
        display: inline-block;
        width: 20px;
        height: 20px;
        background: #3b82f6;
        border-radius: 50%;
        color: white;
        text-align: center;
        line-height: 20px;
        font-size: 12px;
        font-weight: 700;
      ">1</span>
      Given (Preconditions)
    </div>
    <ul style="
      margin: 0;
      padding-left: 32px;
      font-size: 12px;
      color: #374151;
      line-height: 1.6;
    ">
      <li>Customer "john@example.com" is logged in</li>
      <li>Customer annual income is $75,000 (verified)</li>
      <li>Maximum allowed loan = 10× annual income = $750,000</li>
      <li>Account status is "active"</li>
    </ul>
  </div>

  <!-- When -->
  <div style="margin-bottom: 16px;">
    <div style="
      font-size: 13px;
      font-weight: 600;
      color: #1f2937;
      margin-bottom: 8px;
      display: flex;
      align-items: center;
      gap: 8px;
    ">
      <span style="
        display: inline-block;
        width: 20px;
        height: 20px;
        background: #D97706;
        border-radius: 50%;
        color: white;
        text-align: center;
        line-height: 20px;
        font-size: 12px;
        font-weight: 700;
      ">2</span>
      When (Action)
    </div>
    <ul style="
      margin: 0;
      padding-left: 32px;
      font-size: 12px;
      color: #374151;
      line-height: 1.6;
    ">
      <li>Customer enters loan amount of $800,000</li>
      <li>Customer proceeds to next step</li>
    </ul>
  </div>

  <!-- Then -->
  <div style="margin-bottom: 16px;">
    <div style="
      font-size: 13px;
      font-weight: 600;
      color: #1f2937;
      margin-bottom: 8px;
      display: flex;
      align-items: center;
      gap: 8px;
    ">
      <span style="
        display: inline-block;
        width: 20px;
        height: 20px;
        background: #DC2626;
        border-radius: 50%;
        color: white;
        text-align: center;
        line-height: 20px;
        font-size: 12px;
        font-weight: 700;
      ">3</span>
      Then (Expected Result)
    </div>
    <ul style="
      margin: 0;
      padding-left: 32px;
      font-size: 12px;
      color: #374151;
      line-height: 1.6;
    ">
      <li>Validation error appears: "Loan amount exceeds limit of $750,000"</li>
      <li>Error message displays maximum eligible amount: $750,000</li>
      <li>Customer can edit amount and retry</li>
      <li>Application is NOT created</li>
    </ul>
  </div>

  <!-- Footer -->
  <div style="
    padding: 12px;
    background: #f9fafb;
    border-radius: 4px;
    font-size: 11px;
    color: #6b7280;
  ">
    <strong>Notes:</strong> Boundary condition test. Ensure error message displays max eligible amount to prevent confusion.
  </div>
</div>
```

---

## Pattern 5: Traceability Matrix

**Use Case:** Track linkage from requirements to tests, validate coverage

**HTML Template:**

```html
<div style="
  font-family: 'Segoe UI', sans-serif;
  background: #f9fafb;
  padding: 20px;
  border-radius: 8px;
  border: 2px solid #e5e7eb;
">
  <h2 style="color: #1f2937; margin-top: 0;">Traceability Matrix: Loan Application</h2>

  <!-- Coverage Summary -->
  <div style="
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
    gap: 12px;
    margin-bottom: 20px;
  ">
    <div style="
      background: white;
      padding: 12px;
      border-radius: 4px;
      border-left: 4px solid #3b82f6;
    ">
      <div style="font-size: 11px; color: #6b7280; margin-bottom: 4px;">Requirements Traced</div>
      <div style="font-size: 22px; font-weight: 700; color: #1f2937;">8/8</div>
      <div style="font-size: 11px; color: #4b5563;">100%</div>
    </div>
    <div style="
      background: white;
      padding: 12px;
      border-radius: 4px;
      border-left: 4px solid #3b82f6;
    ">
      <div style="font-size: 11px; color: #6b7280; margin-bottom: 4px;">ACs with Tests</div>
      <div style="font-size: 22px; font-weight: 700; color: #1f2937;">14/14</div>
      <div style="font-size: 11px; color: #4b5563;">100%</div>
    </div>
    <div style="
      background: white;
      padding: 12px;
      border-radius: 4px;
      border-left: 4px solid #42D36F;
    ">
      <div style="font-size: 11px; color: #6b7280; margin-bottom: 4px;">Orphan Tests</div>
      <div style="font-size: 22px; font-weight: 700; color: #42D36F;">0</div>
      <div style="font-size: 11px; color: #4b5563;">Clean</div>
    </div>
  </div>

  <!-- Traceability Table -->
  <div style="overflow-x: auto;">
    <table style="
      width: 100%;
      border-collapse: collapse;
      font-size: 11px;
      background: white;
    ">
      <thead>
        <tr style="background: #f3f4f6; border-bottom: 2px solid #d1d5db;">
          <th style="padding: 10px; text-align: left; font-weight: 600; color: #1f2937; border-right: 1px solid #e5e7eb;">Req ID</th>
          <th style="padding: 10px; text-align: left; font-weight: 600; color: #1f2937; border-right: 1px solid #e5e7eb;">Requirement</th>
          <th style="padding: 10px; text-align: left; font-weight: 600; color: #1f2937; border-right: 1px solid #e5e7eb;">AC Count</th>
          <th style="padding: 10px; text-align: left; font-weight: 600; color: #1f2937; border-right: 1px solid #e5e7eb;">Test Cases</th>
          <th style="padding: 10px; text-align: left; font-weight: 600; color: #1f2937;">Status</th>
        </tr>
      </thead>
      <tbody>
        <tr style="border-bottom: 1px solid #e5e7eb;">
          <td style="padding: 10px; border-right: 1px solid #e5e7eb; color: #6b7280;">REQ-001</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb; color: #374151;">Customer can enter loan amount</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb; text-align: center;">3</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">TC-001, TC-002, TC-003</td>
          <td style="padding: 10px;">
            <span style="background: #dcfce7; color: #166534; padding: 3px 8px; border-radius: 3px; font-weight: 500; font-size: 10px;">TRACED</span>
          </td>
        </tr>
        <tr style="border-bottom: 1px solid #e5e7eb;">
          <td style="padding: 10px; border-right: 1px solid #e5e7eb; color: #6b7280;">REQ-002</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb; color: #374151;">System validates loan amount against income</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb; text-align: center;">2</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">TC-002, TC-004</td>
          <td style="padding: 10px;">
            <span style="background: #dcfce7; color: #166534; padding: 3px 8px; border-radius: 3px; font-weight: 500; font-size: 10px;">TRACED</span>
          </td>
        </tr>
        <tr style="border-bottom: 1px solid #e5e7eb;">
          <td style="padding: 10px; border-right: 1px solid #e5e7eb; color: #6b7280;">REQ-003</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb; color: #374151;">Customer can upload income documents</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb; text-align: center;">4</td>
          <td style="padding: 10px; border-right: 1px solid #e5e7eb;">TC-005, TC-006, TC-007, TC-008</td>
          <td style="padding: 10px;">
            <span style="background: #dcfce7; color: #166534; padding: 3px 8px; border-radius: 3px; font-weight: 500; font-size: 10px;">TRACED</span>
          </td>
        </tr>
      </tbody>
    </table>
  </div>

  <!-- Gap Analysis -->
  <div style="
    margin-top: 20px;
    padding: 12px;
    background: #dcfce7;
    border-left: 4px solid #42D36F;
    border-radius: 4px;
  ">
    <div style="font-size: 12px; color: #166534; margin-bottom: 6px;">
      <strong>Gap Analysis:</strong> No gaps detected. All requirements traced.
    </div>
  </div>
</div>
```

---

## Pattern 6: Anti-Pattern Detection Report

**Use Case:** Flag requirement quality issues, guide remediation

**HTML Template:**

```html
<div style="
  font-family: 'Segoe UI', sans-serif;
  background: #f9fafb;
  padding: 20px;
  border-radius: 8px;
  border: 2px solid #e5e7eb;
">
  <h2 style="color: #1f2937; margin-top: 0;">Anti-Pattern Detection Report</h2>

  <!-- Summary -->
  <div style="
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
    gap: 12px;
    margin-bottom: 20px;
  ">
    <div style="background: white; padding: 12px; border-radius: 4px; border-left: 4px solid #DC2626;">
      <div style="font-size: 11px; color: #6b7280;">Critical</div>
      <div style="font-size: 20px; font-weight: 700; color: #DC2626;">2</div>
    </div>
    <div style="background: white; padding: 12px; border-radius: 4px; border-left: 4px solid #D97706;">
      <div style="font-size: 11px; color: #6b7280;">High</div>
      <div style="font-size: 20px; font-weight: 700; color: #D97706;">4</div>
    </div>
    <div style="background: white; padding: 12px; border-radius: 4px; border-left: 4px solid #22D3EE;">
      <div style="font-size: 11px; color: #6b7280;">Medium</div>
      <div style="font-size: 20px; font-weight: 700; color: #22D3EE;">3</div>
    </div>
  </div>

  <!-- Issues -->
  <div style="space: 12px 0;">
    <!-- Critical Issue 1 -->
    <div style="
      background: white;
      border: 1px solid #fecaca;
      border-left: 4px solid #DC2626;
      padding: 12px;
      margin-bottom: 12px;
      border-radius: 4px;
    ">
      <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 8px;">
        <div style="font-weight: 600; color: #991b1b; font-size: 12px;">
          CRITICAL: Untestable Acceptance Criteria
        </div>
        <span style="
          background: #DC2626;
          color: white;
          padding: 2px 8px;
          border-radius: 3px;
          font-size: 10px;
          font-weight: 600;
        ">AC-005</span>
      </div>
      <div style="font-size: 11px; color: #374151; margin-bottom: 8px;">
        <strong>Issue:</strong> "Then system should handle payment failures appropriately"
      </div>
      <div style="font-size: 11px; color: #4b5563; margin-bottom: 8px;">
        <strong>Why:</strong> "Appropriately" is unmeasurable. What does "handle" mean? Retry? Queue? Notify? No timeline.
      </div>
      <div style="font-size: 11px; color: #4b5563;">
        <strong>Fix:</strong> Replace with "Then system retries payment up to 3 times within 24 hours, then escalates to manual review if final attempt fails"
      </div>
    </div>

    <!-- Critical Issue 2 -->
    <div style="
      background: white;
      border: 1px solid #fecaca;
      border-left: 4px solid #DC2626;
      padding: 12px;
      margin-bottom: 12px;
      border-radius: 4px;
    ">
      <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 8px;">
        <div style="font-weight: 600; color: #991b1b; font-size: 12px;">
          CRITICAL: Missing Negative Scenario
        </div>
        <span style="
          background: #DC2626;
          color: white;
          padding: 2px 8px;
          border-radius: 3px;
          font-size: 10px;
          font-weight: 600;
        ">AC-003</span>
      </div>
      <div style="font-size: 11px; color: #374151; margin-bottom: 8px;">
        <strong>Issue:</strong> "When customer submits form, Then application created"
      </div>
      <div style="font-size: 11px; color: #4b5563; margin-bottom: 8px;">
        <strong>Why:</strong> No failure scenario (missing fields, validation error, timeout). Production will fail unpredictably.
      </div>
      <div style="font-size: 11px; color: #4b5563;">
        <strong>Fix:</strong> Add scenarios for: validation error (missing income), document upload failure, external service timeout.
      </div>
    </div>

    <!-- High Issue 1 -->
    <div style="
      background: white;
      border: 1px solid #fed7aa;
      border-left: 4px solid #D97706;
      padding: 12px;
      margin-bottom: 12px;
      border-radius: 4px;
    ">
      <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 8px;">
        <div style="font-weight: 600; color: #92400e; font-size: 12px;">
          HIGH: Ambiguous Condition
        </div>
        <span style="
          background: #D97706;
          color: white;
          padding: 2px 8px;
          border-radius: 3px;
          font-size: 10px;
          font-weight: 600;
        ">BR-002</span>
      </div>
      <div style="font-size: 11px; color: #374151; margin-bottom: 8px;">
        <strong>Issue:</strong> "Recent bankruptcy disqualifies applicant"
      </div>
      <div style="font-size: 11px; color: #4b5563; margin-bottom: 8px;">
        <strong>Why:</strong> "Recent" undefined. Last 3 years? 7 years? Jurisdiction-dependent.
      </div>
      <div style="font-size: 11px; color: #4b5563;">
        <strong>Fix:</strong> "Bankruptcy filed within last 7 years (per FCRA guidelines) disqualifies applicant"
      </div>
    </div>
  </div>

  <!-- Remediation Checklist -->
  <div style="
    margin-top: 20px;
    padding: 12px;
    background: #f0fdf4;
    border-left: 4px solid #42D36F;
    border-radius: 4px;
  ">
    <div style="font-size: 12px; color: #166534; margin-bottom: 8px;">
      <strong>Remediation Checklist:</strong>
    </div>
    <ul style="font-size: 11px; color: #166534; margin: 0; padding-left: 20px;">
      <li>☐ Fix 2 critical issues before phase gate</li>
      <li>☐ Resolve 4 high-severity issues within sprint 1</li>
      <li>☐ Backlog 3 medium-severity issues for refinement</li>
      <li>☐ Validate fixes with product owner</li>
      <li>☐ Re-run anti-pattern detection to confirm</li>
    </ul>
  </div>
</div>
```

---

## Usage Notes

- All templates use semantic color coding: Green (#42D36F) for positive outcomes, Red (#DC2626) for rejection/critical, Orange (#6366F1, #D97706) for attention, Gold (#22D3EE) for decorative/boundaries
- Templates are responsive (use `grid` with `minmax` for mobile compatibility)
- Copy HTML directly into MetodologIA deliverable documents or render via markdown-to-HTML conversion
- All values in templates are examples; replace with actual data from your project
