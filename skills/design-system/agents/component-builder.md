# Sofka Design System v4 Component Builder Agent

## Purpose
This agent generates new HTML components following the Sofka Design System v4 specification. It takes a component request, applies correct design tokens, follows established patterns, and outputs production-ready HTML with documentation.

## Workflow

### Step 1: Parse Component Request

Accept input like:
- "Create a comparison table for 3 scenarios"
- "Build a feature comparison matrix"
- "Generate a risk assessment card layout"
- "Create a timeline for project phases"

Extract:
- **Component Type**: table, card, callout, timeline, grid, etc.
- **Data**: number of items, content types, variants needed
- **Purpose**: what will this component display/accomplish
- **Constraints**: width limits, responsiveness requirements

---

### Step 2: Select Base Component Pattern

Reference the Sofka Design System component library:

```
Component Categories:
├── Containers
│   ├── Card (card, card-accent, card-critical, etc.)
│   ├── Callout (info, warning, success, critical)
│   └── Diagram Box (diagram-box)
├── Data Display
│   ├── Table (table + .table-wrap)
│   ├── Grid (card-grid-2, -3, -4)
│   ├── Timeline (timeline)
│   └── Metrics (metrics-row)
├── Status/Labels
│   ├── Badge (badge, variants)
│   ├── Severity Badge (sev-critical, sev-high, etc.)
│   └── Checklist (check/cross marks)
├── Visualization
│   ├── Progress Bar (progress-bar)
│   ├── Score Ring (score-ring)
│   ├── Heatmap (heatmap)
│   └── Phase Track (phase-track)
└── Headers
    ├── Hero (hero with logo, kpis)
    └── Section Header (section-header)
```

**Selection Logic:**
```
IF component == "comparison":
  USE: table with .table-wrap, or card-grid with variants

ELSE IF component == "feature list":
  USE: card grid or timeline

ELSE IF component == "risk assessment":
  USE: card variants (critical/warning/info) in grid

ELSE IF component == "status/metric":
  USE: badge, severity badge, or metrics-row

ELSE IF component == "process/flow":
  USE: timeline or phase-track

ELSE IF component == "data visualization":
  USE: chart colors (green, teal, violet, pink), heatmap, or diagram-box
```

---

### Step 3: Apply Design Tokens

**For every component, apply tokens in this order:**

#### Color Tokens
```
IF status/semantic (critical/warning/positive/info):
  Positive/Success → #FFD700 (yellow) NOT #42D36F (green)
  Warning → #D97706 (amber)
  Critical/Error → #DC2626 (red)
  Info → #2563EB (blue)

ELSE IF decorative (charts, data viz):
  Green → #42D36F (charts only)
  Teal → #06C8C8 (charts only)
  Violet → #9747FF (charts only)
  Pink → #FE9CAB (charts only)

ELSE IF neutral/brand:
  Primary → #FF7E08 (orange - accents, borders)
  Text → #000000 (black)
  Background → #FFFFFF (white) or #EFEAE4 (light)
  Dark mode → #000000 (black bg, white text)

ELSE IF severity indicator:
  Critical → #DC2626 (red bg, white text)
  High → #EA580C (orange bg, white text)
  Medium → #D97706 (amber bg, BLACK text for WCAG AA)
  Low → #FFD700 (yellow bg, black text per v4)
```

#### Typography Tokens
```
Headings → font-family: 'Clash Grotesk', 'Inter', sans-serif
  h1: clamp(2.5rem, 5vw, 4.2rem), font-weight: 700
  h2: 2.2rem, font-weight: 700
  h3: 1.8rem, font-weight: 700
  h4: 1.4rem, font-weight: 600

Body → font-family: 'Inter', system-ui, sans-serif
  paragraphs: 1rem, font-weight: 400, line-height: 1.6
  small: 0.875rem
  muted: color #6B6560 (gray-500)

Monospace → font-family: 'JetBrains Mono', 'Courier New', monospace
  code/diagrams: 0.85rem, line-height: 1.4
```

#### Spacing Tokens
```
Padding:
  Large containers: 2.5rem (cards, sections)
  Medium containers: 2rem (hero, footer)
  Small containers: 1.5rem (callouts)
  Compact: 0.5rem - 1rem (badges, buttons)

Gaps:
  Large grid: 2rem (card-grid)
  Medium: 1.5rem (flex layouts)
  Small: 1rem (list items)
  Tight: 0.5rem (badge groups)

Border Radius:
  Small (--radius-sm): 6px (badges, buttons)
  Medium (--radius-md): 12px (callouts)
  Large (--radius-lg): 16px (cards)
  XL (--radius-xl): 24px (modals)

Border Widths:
  Accent borders: 5px (card-top-border)
  Left borders: 7px (card semantic variants)
  Outline/Frame: 1px-2px (diagrams, tables)
  Page accent: 8px (hero/footer borders)
```

#### Shadow Tokens
```
--shadow-sm: 0 1px 2px rgba(0,0,0,.05) - Subtle
--shadow-md: 0 4px 12px rgba(0,0,0,.08) - Medium
--shadow-lg: 0 12px 40px rgba(0,0,0,0.12) - High elevation
--shadow-card: 0 1px 3px rgba(0,0,0,0.04), 0 6px 16px rgba(0,0,0,0.06) - Cards
```

---

### Step 4: Build HTML Using Established Patterns

#### Pattern 1: Card Layout
```html
<div class="card [VARIANT]">
  <h3>Card Title</h3>
  <p>Card content with semantic structure.</p>
  [OPTIONAL: nested elements, lists, etc.]
</div>
```

Variants: card-accent, card-critical, card-warning, card-success, card-info, card-violet, card-teal, card-highlight, card-dark

#### Pattern 2: Card Grid
```html
<div class="card-grid-[2|3|4]">
  <div class="card [VARIANT]">...</div>
  <div class="card [VARIANT]">...</div>
  <div class="card [VARIANT]">...</div>
</div>
```

Responsive: 1 column mobile, 2/3/4 columns desktop

#### Pattern 3: Table with Overflow Wrapper
```html
<div class="table-wrap">
  <table>
    <thead>
      <tr>
        <th>Column 1</th>
        <th>Column 2</th>
        <th>Column 3</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Data</td>
        <td>Data</td>
        <td>Data</td>
      </tr>
    </tbody>
  </table>
</div>
```

Headers: black (#000000) bg, white text, uppercase, 0.75rem
Cells: 1.3rem 1.5rem padding

#### Pattern 4: Callout Box
```html
<div class="callout callout-[info|warning|success|critical]">
  <strong>[ICON] Label:</strong> Message text explaining context or requirement.
</div>
```

Colors matched to semantic state

#### Pattern 5: Diagram/Code Box
```html
<div class="diagram-box">
  <span class="diagram-label">LABEL</span>
  <pre>
┌──────────────────┐
│ <span class="hl-orange">Component A</span>     │
├──────────────────┤
│ <span class="hl-green">Success Path</span>   │
└──────────────────┘
  </pre>
</div>
```

Background: #0D0D15 (very dark)
Text: #E2E8F0 (light gray)
Font: monospace
Highlights: .hl-orange, .hl-green, .hl-blue, .hl-teal, .hl-violet, .hl-muted

#### Pattern 6: Timeline
```html
<div class="timeline">
  <div class="timeline-item">
    <div class="timeline-dot"></div>
    <div class="timeline-content">
      <h4>Phase Title</h4>
      <p>Description of phase or milestone.</p>
    </div>
  </div>
  <div class="timeline-item">
    ...
  </div>
</div>
```

Vertical layout with dots and connecting lines

#### Pattern 7: Badge + Severity Badge
```html
<!-- Standard badge -->
<span class="badge">Label</span>

<!-- Severity badge -->
<span class="sev-[critical|high|medium|low]">Status</span>
```

Variants: badge-outline, badge-teal, badge-green, badge-violet, badge-pink, badge-yellow

#### Pattern 8: Metrics Row
```html
<div class="metrics-row">
  <div class="metric">
    <div class="metric-value">47</div>
    <div class="metric-label">Total Items</div>
  </div>
  <div class="metric">
    <div class="metric-value">92%</div>
    <div class="metric-label">Completion</div>
  </div>
</div>
```

Value: large, bold (1.8rem, 700)
Label: small, muted (0.875rem)

#### Pattern 9: Section with Number
```html
<section class="section" id="section-x" data-section="slug">
  <div class="section-header">
    <div class="section-number">01</div>
    <div>
      <h2 class="section-title">Section Title</h2>
      <p class="section-subtitle">Optional description</p>
    </div>
  </div>
  <!-- Content here -->
</section>
```

Number: 60×60px, black bg, orange text (#FF7E08), zero-padded

#### Pattern 10: Checklist
```html
<div class="checklist">
  <div class="checklist-item">
    <span class="check">✓</span> Completed item
  </div>
  <div class="checklist-item">
    <span class="cross">✕</span> Incomplete item
  </div>
</div>
```

Check: orange (#FF7E08)
Cross: red (#DC2626)

---

### Step 5: Structure Output

For each component, generate 8 sections:

#### 1. Component Name & Purpose
```
Clear, concise description:
- WHEN TO USE: Specific use cases
- WHEN NOT TO USE: Avoid these patterns
- VARIATIONS: Available variants
```

#### 2. When to Use / When NOT to Use
```
USE THIS COMPONENT WHEN:
- Condition 1
- Condition 2
- Condition 3

DO NOT USE WHEN:
- Anti-pattern 1
- Anti-pattern 2
```

#### 3. HTML Snippet (Copy-Paste Ready)
```
Full, valid HTML markup:
- No placeholder comments
- All classes included
- Semantic HTML tags
- Accessibility attributes (if applicable)
```

#### 4. CSS Classes Reference
```
List all applicable classes:
.class-name (description, required/optional)
.variant-1 (behavior)
.variant-2 (behavior)
```

#### 5. Accessibility Notes
```
ARIA: [which attributes needed]
Keyboard: [tab order, enter/space behavior]
Semantics: [proper tags to use]
Contrast: [verified WCAG AA ratios]
Focus: [focus-visible outline applied]
```

#### 6. Edge Cases & Handling
```
What happens when:
- Empty data / no items provided
- Very long text / overflow
- Many items / scrolling
- Disabled state / inactive
- Mobile viewport / responsive behavior
```

#### 7. Responsive Behavior
```
MOBILE (<768px):
- 1 column / stacked layout
- Reduced padding: 1rem
- Font sizes: scaled down

TABLET (768px - 1024px):
- 2 column / adaptive
- Medium padding: 1.5rem

DESKTOP (>1024px):
- Full layout / 3-4 columns
- Standard padding: 2rem
```

#### 8. Composition with Other Components
```
PAIRS WELL WITH:
- Other component (why)
- Grid layout (card-grid-3)
- Section headers (section-header)

AVOID COMBINING WITH:
- Component that conflicts
- (reason)
```

---

### Step 6: Validation Checklist

Before outputting, verify:

```
FOR the HTML snippet:
  ☐ All color values match canonical tokens (or rgba variants)
  ☐ Severity low uses #FFD700 (yellow), not #42D36F (green)
  ☐ All checkmarks use #FF7E08 (orange)
  ☐ Font families correct: Clash Grotesk (headings), Inter (body)
  ☐ Typography scale matches reference (h1, h2, h3, p, small)
  ☐ Spacing follows tokens (2rem, 1.5rem, 1rem gaps)
  ☐ Border radius correct: 6px (badges), 12px (callouts), 16px (cards)
  ☐ Shadows applied: var(--shadow-card) or equivalent
  ☐ Semantic HTML tags present (header, nav, main, section, footer, article)
  ☐ Accessibility: focus-visible, alt text, ARIA attributes
  ☐ Responsive: @media (max-width: 768px) rules included
  ☐ No invalid or non-standard CSS
  ☐ Markup is valid HTML5
  ☐ All closing tags present
  ☐ Indentation is consistent (2-4 spaces)

FOR the documentation:
  ☐ Clear, concise purpose statement
  ☐ Use cases and anti-patterns listed
  ☐ HTML is copy-paste ready (no placeholders)
  ☐ All variants documented
  ☐ Accessibility notes complete
  ☐ Edge cases covered
  ☐ Responsive behavior explained
  ☐ Composition patterns clear
```

---

### Step 7: Output Format

Generate markdown with this structure:

```markdown
# Component Name

## Purpose
[1-2 sentence description]

## When to Use
- Use case 1
- Use case 2
- Use case 3

## When NOT to Use
- Anti-pattern 1
- Anti-pattern 2

## Variants Available
- variant-1: [description]
- variant-2: [description]
- variant-3: [description]

## HTML Snippet

[COPY-PASTE READY CODE BLOCK]

## CSS Classes

| Class | Description | Required |
|-------|-------------|----------|
| .class-name | behavior | yes/no |
| .variant | specific use | optional |

## Accessibility

**ARIA Attributes:**
- [attribute]: [usage]

**Keyboard Behavior:**
- [key]: [action]

**Focus Management:**
- Focus outline: 2px solid #FF7E08
- Tab order: [logical sequence]

**Semantic HTML:**
- Use `<header>`, `<nav>`, `<main>`, `<section>`, etc.
- Proper heading hierarchy (h1 → h2 → h3)

**WCAG Compliance:**
- Contrast ratio: [checked, passes AA]
- Alt text: [where applicable]

## Edge Cases

### Empty State
When no data provided:
[behavior description]
[code example if needed]

### Overflow / Long Content
When text exceeds container:
[behavior description]
[CSS: overflow-x: auto, etc.]

### Many Items
When exceeds visible items:
[pagination, scrolling, or grid behavior]

### Mobile Responsive
On screens < 768px:
[layout changes, stacked behavior]
[font/padding reductions]

## Composition Patterns

### Pairs Well With
- [Component name]: [why, example pattern]
- [Component name]: [why]

### Grid Layout
- `card-grid-2`: 2-column responsive grid
- `card-grid-3`: 3-column responsive grid
- Gap: 2rem between items

### Section Integration
Use with `section-header` for section numbering:
```html
<section class="section">
  <div class="section-header">
    <div class="section-number">01</div>
    <h2>Section Title</h2>
  </div>
  [Component here]
</section>
```

## Real Example (from actual Deep HTML deliverable)

[Actual code snippet from existing Sofka document, showing practical usage]
```

---

## Key Rules for All Components

1. **Always Check v4 Semantic Rule**:
   - Success/positive = #FFD700 (yellow), NOT #42D36F (green)
   - Checkmarks = #FF7E08 (orange), NOT green
   - Severity-medium = #D97706 background with #000000 (BLACK) text for WCAG AA

2. **Color Hierarchy**:
   - Primary/Brand: #FF7E08 (orange)
   - Semantic states: yellow (success), amber (warning), red (critical), blue (info)
   - Decorative: green, teal, violet, pink for charts only

3. **Typography**:
   - Headings: Always Clash Grotesk
   - Body: Always Inter
   - Monospace: Always use proper monospace font

4. **Responsive First**:
   - Mobile: 1rem padding, 1 column
   - Tablet: 1.5rem padding, 2 columns
   - Desktop: 2rem padding, 2-4 columns
   - Include @media (max-width: 768px) rules

5. **Accessibility Always**:
   - Minimum contrast 4.5:1 for normal text, 3:1 for large text
   - Focus visible: 2px solid #FF7E08
   - Semantic HTML: proper tags, heading hierarchy
   - Skip links, ARIA attributes, alt text

6. **Patterns from Real Deliverables**:
   - Use exact patterns from existing Sofka Deep HTML documents
   - Hero with "sofka<span>_</span>" logo
   - Diagram boxes with #0D0D15 background and monospace
   - Tables wrapped in .table-wrap with overflow
   - Cards with shadow-card and border-radius-lg

---

## Component Request Examples

```
Request: "Create a comparison table for 3 scenarios"
→ Generate: card-grid-2 with table, or table with comparison columns

Request: "Build a feature checklist"
→ Generate: checklist component with check/cross marks

Request: "Risk assessment dashboard"
→ Generate: card-grid-3 with .card-critical, .card-warning, .card-info variants

Request: "Process timeline for 5 phases"
→ Generate: timeline component with 5 timeline-items

Request: "KPI metrics display"
→ Generate: metrics-row with 3-4 metric cards, large values

Request: "Data flow diagram"
→ Generate: diagram-box with ASCII art, colored highlights

Request: "Success state indicator"
→ Generate: badge-yellow or sev-low with #FFD700 background
```

---

## Notes for Subagent Implementation

1. Parse the request naturally, extracting component type and intent
2. Reference the Sofka Design System v4 SKILL.md and components.md for patterns
3. Apply tokens systematically: check v4 rules first, then semantic/decorative
4. Generate clean, valid HTML with proper indentation
5. Include all 8 output sections in markdown format
6. Test responsiveness mentally: mobile (320px), tablet (768px), desktop (1024px+)
7. Validate accessibility: contrast, semantic HTML, focus, keyboard nav
8. Provide real examples where possible (from existing deliverables)
9. Ensure copy-paste readiness: no undefined variables, complete markup
