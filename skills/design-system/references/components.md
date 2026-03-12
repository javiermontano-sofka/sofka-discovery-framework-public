# Sofka Design System v4 Components Reference

Complete, copy-paste HTML snippets for all Sofka design system components. Each includes purpose, exact markup from real deliverables, CSS classes, variants, edge cases, accessibility, and composition patterns.

---

## 1. Hero Header

**Purpose:** Main page header with logo, meta badges, title, subtitle, and optional KPI metrics. Sets the tone and context for the entire document.

**When to Use:**
- Always at the top of a Deep HTML document
- Single hero per page
- Include key document metadata and purpose

**HTML Snippet:**

```html
<header class="hero">
  <div class="hero-inner">
    <div class="hero-logo">sofka<span>_</span></div>
    <div class="hero-meta">
      <span class="badge">§N · DOCUMENT</span>
      <span class="badge badge-outline">ACTIVE HITL</span>
    </div>
    <h1>Document <span>Title</span> for Analysis</h1>
    <p class="hero-subtitle">Comprehensive assessment covering scope, methodology, findings, and recommendations for stakeholder review.</p>
    <div class="hero-kpis">
      <div class="hero-kpi">
        <div class="hero-kpi-val">147</div>
        <div class="hero-kpi-lbl">Total Items</div>
      </div>
      <div class="hero-kpi">
        <div class="hero-kpi-val">94%</div>
        <div class="hero-kpi-lbl">Coverage</div>
      </div>
      <div class="hero-kpi">
        <div class="hero-kpi-val">12</div>
        <div class="hero-kpi-lbl">Risk Areas</div>
      </div>
    </div>
  </div>
</header>
```

**CSS Classes:**
- `.hero`: Main header container (background: #000000, border-bottom: 8px solid #FF7E08)
- `.hero-inner`: Inner container (max-width: 1100px, padding: 4rem 2rem)
- `.hero-logo`: Logo display ("sofka_" with orange underscore)
- `.hero-meta`: Meta badges row (flex, gap 1rem, margin-bottom 2rem)
- `.badge`: Orange status badge (background: #FF7E08, white text)
- `.badge-outline`: Outline variant (border: 1px solid #FF7E08, transparent bg)
- `.hero-kpis`: KPI grid (3-4 items, centered)
- `.hero-kpi`: Individual KPI card
- `.hero-kpi-val`: Large metric value (2rem, white, bold)
- `.hero-kpi-lbl`: Metric label (0.875rem, muted white)

**Accessibility:**
- Logo span has color: #FF7E08 (orange)
- All text white on black background (21:1 contrast)
- h1 uses semantic heading tag
- KPI values are actual numbers (not decorative)
- Focus: outline 2px solid #FF7E08 on badges

**Variants:**
- With KPIs (shown above)
- Without KPIs (remove .hero-kpis div)
- Single badge (just one .badge)
- Multiple badges (2-3 in .hero-meta)

**Edge Cases:**
- **No KPIs**: Remove .hero-kpis section entirely
- **Long title**: h1 uses clamp(2.5rem, 5vw, 4.2rem) for responsive scaling
- **Many badges**: Flex wraps, gap 1rem maintains spacing
- **Mobile**: Padding reduced to 1rem, logo and title scale down

**Responsive:**
- Desktop: 4rem padding, full KPI grid
- Tablet: 2rem padding, KPIs may stack to 2 columns
- Mobile: 1rem padding, KPIs stack to 1 column, font scales

**Composition:**
- Always first element in document
- Followed by `nav.toc` (sticky table of contents)
- Followed by main content sections
- Pairs with footer (inverse: black bg, orange border-top)

---

## 2. Sticky Table of Contents

**Purpose:** Horizontal sticky navigation with section links. Auto-generates from section IDs for quick navigation.

**When to Use:**
- Every page with 3+ sections
- Below hero, before main content
- Links to all major sections

**HTML Snippet:**

```html
<nav class="toc">
  <div class="toc-inner">
    <a href="#section-1" class="toc-link active">1. Overview</a>
    <a href="#section-2" class="toc-link">2. Analysis</a>
    <a href="#section-3" class="toc-link">3. Findings</a>
    <a href="#section-4" class="toc-link">4. Recommendations</a>
    <a href="#section-5" class="toc-link">5. Conclusion</a>
  </div>
</nav>
```

**CSS Classes:**
- `nav.toc`: Main nav container (position: sticky, top: 0, z-index: 100, background: #FFFFFF)
- `.toc-inner`: Inner flex container (overflow-x: auto, scrollbar hidden on mobile)
- `.toc-link`: Individual link (uppercase, 0.72rem, letter-spacing: 1.5px, color: #333)
- `.toc-link.active`: Active state (border-bottom: 3px solid #FF7E08)
- `.toc-link:hover`: Hover state (border-bottom: 2px solid #FF7E08, opacity 0.8)

**Accessibility:**
- Semantic `<nav>` tag
- Links have href attributes pointing to section IDs
- Keyboard navigable: Tab, Enter to follow links
- Focus visible: outline 2px solid #FF7E08
- ARIA: `aria-label="Table of contents"` (optional)
- Current section marked with `.active` class

**Variants:**
- Standard (5 sections shown)
- Extended (8+ sections, wraps on mobile)
- Minimal (3 sections)
- Custom styling: active link color customizable

**Edge Cases:**
- **Many sections**: Overflow-x: auto, horizontal scroll on mobile
- **Long section names**: Text truncates or wraps
- **Mobile**: Hidden scrollbar (overflow-x: auto, scrollbar-width: none)
- **Anchor missing**: Link target may not exist (handle gracefully)

**Responsive:**
- Desktop: All links visible, horizontal layout
- Tablet: All links visible with scroll if needed
- Mobile: Horizontal scroll, active link always visible

**Composition:**
- Sticky positioning keeps it visible while scrolling
- Links correspond to section IDs in main content
- Uses progressive scroll reveal pattern
- Pairs with section elements (`.section` class)

---

## 3. Section Header with Number

**Purpose:** Section title with number, heading, and optional subtitle. Provides visual hierarchy and quick reference.

**When to Use:**
- Start of every major section
- Zero-padded numbers (01, 02, etc.)
- Optional descriptive subtitle

**HTML Snippet:**

```html
<section class="section" id="section-1" data-section="overview">
  <div class="section-header">
    <div class="section-number">01</div>
    <div>
      <h2 class="section-title">Document Overview</h2>
      <p class="section-subtitle">Scope, methodology, and key findings from the comprehensive analysis</p>
    </div>
  </div>

  <!-- Section content here -->

</section>
```

**CSS Classes:**
- `.section`: Section container (padding: 6rem 0, scroll-margin-top: 60px)
- `.section-header`: Flex header row (gap: 2rem, align-items: flex-start)
- `.section-number`: Number box (60×60px, background: #000000, color: #FF7E08, font-weight: 700, border-radius: 8px)
- `.section-title`: h2 heading (2.2rem, Clash Grotesk, color: #000000, font-weight: 700)
- `.section-subtitle`: Optional subtitle (1rem, color: #6B6560, font-weight: 400)

**Accessibility:**
- Proper heading hierarchy: h2 for section titles
- Section ID unique and meaningful (data-section attribute)
- Number is decorative but aids scannability
- Subtitle provides context
- Focus on heading: outline 2px solid #FF7E08

**Variants:**
- With subtitle (standard)
- Without subtitle (remove .section-subtitle)
- Custom number styling (01-99 supported)
- Numbered sections auto-generate from data-section

**Edge Cases:**
- **No subtitle**: Still include div wrapper for proper flex
- **Long title**: Line breaks naturally, no truncation
- **Many sections**: Numbers increment 01, 02, 03, etc.
- **Mobile**: Number and title stack or adjust spacing

**Responsive:**
- Desktop: Flex row, 2rem gap, number on left
- Tablet: Reduces gap to 1.5rem
- Mobile: May stack vertically, number remains 60×60px

**Composition:**
- Every major section starts with this
- Content follows directly after header
- Used within `<section class="section">` tag
- Corresponds to TOC links

---

## 4. Card — Base

**Purpose:** Standard white container for content blocks. Foundation for all card variants.

**When to Use:**
- Group related content
- Create visual separation between concepts
- Flexible container for any content type

**HTML Snippet:**

```html
<div class="card">
  <h3>Card Title</h3>
  <p>This is the main content of the card. Add paragraphs, lists, nested elements as needed. The card provides consistent padding, rounded corners, and subtle shadow.</p>
  <ul>
    <li>List item 1</li>
    <li>List item 2</li>
  </ul>
</div>
```

**CSS Classes:**
- `.card`: Base card (background: #FFFFFF, border-radius: 16px, padding: 2.5rem, box-shadow: var(--shadow-card))

**Accessibility:**
- Proper semantic headings (h3, h4)
- Good color contrast: black text on white (21:1)
- Focus on interactive elements: outline 2px solid #FF7E08
- Nested lists use `<ul>`, `<ol>`, `<li>`

**Variants:**
- `.card-accent`: Orange top border (border-top: 5px solid #FF7E08)
- `.card-critical`: Red left border + red tint (border-left: 7px solid #DC2626, bg: rgba(220,38,38,0.06))
- `.card-warning`: Amber left border + amber tint (border-left: 7px solid #D97706, bg: rgba(217,119,6,0.06))
- `.card-success`: Green left border (decorative only)
- `.card-info`: Blue left border + blue tint (border-left: 7px solid #2563EB, bg: rgba(37,99,235,0.06))
- `.card-violet`: Violet left border + violet tint
- `.card-teal`: Teal left border + teal tint
- `.card-highlight`: Orange border + subtle gradient (border: 2px solid #FF7E08, gradient bg)
- `.card-dark`: Black background with white text (background: #000000, color: #FFFFFF)

**Edge Cases:**
- **Empty card**: Shows empty white box (use placeholder or remove)
- **Very long content**: Overflow handled by parent container
- **No title**: Still use semantic heading for accessibility
- **Nested cards**: Use with caution, padding compounds

**Responsive:**
- Desktop: 2.5rem padding, full width in container
- Tablet: 2rem padding
- Mobile: 1.5rem padding, maintains 16px border-radius

**Composition:**
- Single card: standalone content
- Multiple cards: use with `.card-grid-2`, `.card-grid-3`, or `.card-grid-4`
- In sections: place after section header
- With badges: add `.badge` inside card header

---

## 5. Card Grid (2 Columns)

**Purpose:** Responsive grid layout for 2 columns of cards.

**HTML Snippet:**

```html
<div class="card-grid-2">
  <div class="card card-accent">
    <h3>Feature 1</h3>
    <p>Description of first feature or comparison point.</p>
  </div>
  <div class="card card-accent">
    <h3>Feature 2</h3>
    <p>Description of second feature or comparison point.</p>
  </div>
</div>
```

**CSS Classes:**
- `.card-grid-2`: 2-column responsive grid (display: grid, grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)), gap: 2rem)

**Variants:**
- `.card-grid-3`: 3-column grid (minmax(280px, 1fr))
- `.card-grid-4`: 4-column grid (minmax(240px, 1fr))

**Responsive:**
- Mobile (<768px): 1 column
- Tablet (768px): May show 2 columns if space allows
- Desktop (>1024px): Full 2 columns with 2rem gap

**Composition:**
- Each child should be `.card` or `.card-[variant]`
- Wrap multiple grid sections for different layouts
- Use consistent card variants within grid for coherence

---

## 6. Card — Accent (Orange Top Border)

**Purpose:** Card with orange accent border. Draws attention to important information.

**HTML Snippet:**

```html
<div class="card card-accent">
  <h3>Key Finding</h3>
  <p>This card uses an orange top border to emphasize important content sections.</p>
</div>
```

**CSS Classes:**
- `.card` + `.card-accent`: border-top: 5px solid #FF7E08

**Accessibility:** Same as base card

**Edge Cases:**
- Multiple accent cards in sequence: visual rhythm maintained by gap
- Nested with other elements: border remains visible

---

## 7. Card — Critical (Red Left Border)

**Purpose:** High-visibility card for errors, critical issues, or failures.

**HTML Snippet:**

```html
<div class="card card-critical">
  <h3>Critical Issue</h3>
  <p>This indicates an error or critical status requiring immediate attention.</p>
  <span class="sev-critical">Critical</span>
</div>
```

**CSS Classes:**
- `.card` + `.card-critical`: border-left: 7px solid #DC2626, background: rgba(220,38,38,0.06)

**Accessibility:**
- Red-only indicator is insufficient; use text "Critical" or icon
- Contrast verified: black text on red tint passes AA

**Variants:**
- With severity badge: `.sev-critical` inside card
- Without badge: card alone signals criticality

---

## 8. Card — Warning (Amber Left Border)

**Purpose:** Alert or warning card. Less severe than critical.

**HTML Snippet:**

```html
<div class="card card-warning">
  <h3>Important Notice</h3>
  <p>This requires attention but is not immediately critical.</p>
  <span class="sev-medium">Medium Priority</span>
</div>
```

**CSS Classes:**
- `.card` + `.card-warning`: border-left: 7px solid #D97706, background: rgba(217,119,6,0.06)

---

## 9. Card — Success (Green Left Border)

**Purpose:** Positive outcome or success state. (Note: Green is decorative in v4; prefer yellow for actual success states.)

**HTML Snippet:**

```html
<div class="card card-success">
  <h3>Success Scenario</h3>
  <p>Describes a successful execution path or positive outcome in a chart or decorative context.</p>
</div>
```

**CSS Classes:**
- `.card` + `.card-success`: border-left: 7px solid #42D36F, background: rgba(66,211,111,0.08)

**Note:** Use `.sev-low` with yellow (#FFD700) for actual success/positive semantic states.

---

## 10. Card — Info (Blue Left Border)

**Purpose:** Informational or contextual content card.

**HTML Snippet:**

```html
<div class="card card-info">
  <h3>Information</h3>
  <p>This provides additional context, notes, or supplementary information.</p>
</div>
```

**CSS Classes:**
- `.card` + `.card-info`: border-left: 7px solid #2563EB, background: rgba(37,99,235,0.06)

---

## 11. Card — Violet

**Purpose:** Special content with violet accent for decorative emphasis.

**HTML Snippet:**

```html
<div class="card card-violet">
  <h3>Special Section</h3>
  <p>Violet cards are used for data visualization, special categories, or decorative grouping.</p>
</div>
```

**CSS Classes:**
- `.card` + `.card-violet`: border-left: 7px solid #9747FF, background: rgba(151,71,255,0.06)

---

## 12. Card — Teal

**Purpose:** Special content with teal accent for decorative emphasis.

**HTML Snippet:**

```html
<div class="card card-teal">
  <h3>Alternative Focus</h3>
  <p>Teal cards provide visual distinction for alternative scenarios or secondary content.</p>
</div>
```

**CSS Classes:**
- `.card` + `.card-teal`: border-left: 7px solid #06C8C8, background: rgba(6,200,200,0.06)

---

## 13. Card — Highlight (Orange Border)

**Purpose:** Featured or emphasized content with prominent orange border.

**HTML Snippet:**

```html
<div class="card card-highlight">
  <h3>Featured Content</h3>
  <p>This card has a prominent orange border and subtle gradient background for emphasis.</p>
</div>
```

**CSS Classes:**
- `.card` + `.card-highlight`: border: 2px solid #FF7E08, background: subtle orange gradient (optional)

---

## 14. Card — Dark (Black Background)

**Purpose:** High-contrast dark card with white text for visual variety or dark mode content.

**HTML Snippet:**

```html
<div class="card card-dark">
  <h3>Dark Context</h3>
  <p>White text on black background provides strong contrast and visual distinction.</p>
</div>
```

**CSS Classes:**
- `.card` + `.card-dark`: background: #000000, color: #FFFFFF

**Accessibility:**
- Contrast: white on black = 21:1 (excellent)
- Links inside: must have color (#FF7E08 for consistency)
- Focus: outline 2px solid #FF7E08

---

## 15. Badge — Default (Orange)

**Purpose:** Small label with orange background for status, category, or metadata.

**HTML Snippet:**

```html
<span class="badge">Active</span>
```

**CSS Classes:**
- `.badge`: background: #FF7E08, color: #FFFFFF, padding: 0.5rem 1rem, border-radius: 6px, font-weight: 600

**Variants:**
- `.badge-outline`: transparent bg, orange border: 1px solid #FF7E08, orange text
- `.badge-teal`: background: #06C8C8, white text
- `.badge-green`: background: #42D36F, white text (decorative)
- `.badge-violet`: background: #9747FF, white text
- `.badge-pink`: background: #FE9CAB, white text
- `.badge-yellow`: background: #FFD700, black text (v4 success state)

**Accessibility:**
- Color not only means: include text or icon
- Contrast: orange on white background (4.5:1)
- Focus: outline 2px solid current text color

---

## 16. Badge — Outline

**Purpose:** Badge with border and transparent background.

**HTML Snippet:**

```html
<span class="badge badge-outline">Document Reference</span>
```

**CSS Classes:**
- `.badge` + `.badge-outline`: border: 1px solid #FF7E08, background: transparent, color: #FF7E08

---

## 17. Severity Badge — Critical

**Purpose:** High-visibility status indicator for critical priority.

**HTML Snippet:**

```html
<span class="sev-critical">Critical</span>
```

**CSS Classes:**
- `.sev-critical`: background: #DC2626 (red), color: #FFFFFF, padding: 0.5rem 1rem, border-radius: 6px, font-weight: 600

**Accessibility:**
- Red-only: supplement with text (shown above)
- Contrast: white on red = 5.3:1 (exceeds AA)

---

## 18. Severity Badge — High

**Purpose:** High-priority status indicator.

**HTML Snippet:**

```html
<span class="sev-high">High</span>
```

**CSS Classes:**
- `.sev-high`: background: #EA580C, color: #FFFFFF, padding: 0.5rem 1rem, border-radius: 6px, font-weight: 600

---

## 19. Severity Badge — Medium

**Purpose:** Medium-priority status. (Critical: Must use BLACK text on amber for WCAG AA compliance.)

**HTML Snippet:**

```html
<span class="sev-medium">Medium</span>
```

**CSS Classes:**
- `.sev-medium`: background: #D97706 (amber), color: #000000 (BLACK - required), padding: 0.5rem 1rem, border-radius: 6px, font-weight: 600

**Accessibility:**
- CRITICAL: Black text on amber background = 13.5:1 (passes AA)
- White text on amber = 1.0 (fails AA - DO NOT USE)

---

## 20. Severity Badge — Low

**Purpose:** Low-priority status. (v4 Rule: Yellow replaces green for positive states.)

**HTML Snippet:**

```html
<span class="sev-low">Low</span>
```

**CSS Classes:**
- `.sev-low`: background: #FFD700 (YELLOW per v4), color: #000000 (black), padding: 0.5rem 1rem, border-radius: 6px, font-weight: 600

**Note:** NOT green (#42D36F). Green is decorative only in Sofka v4.

---

## 21. Table with Overflow Wrapper

**Purpose:** Responsive table container that handles horizontal overflow on mobile.

**HTML Snippet:**

```html
<div class="table-wrap">
  <table>
    <thead>
      <tr>
        <th>Metric</th>
        <th>Baseline</th>
        <th>Current</th>
        <th>Target</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><strong>Performance</strong></td>
        <td>4.2s</td>
        <td>2.1s</td>
        <td>1.5s</td>
      </tr>
      <tr>
        <td><strong>Uptime</strong></td>
        <td>98%</td>
        <td>99.5%</td>
        <td>99.9%</td>
      </tr>
      <tr>
        <td><strong>Users</strong></td>
        <td>1,200</td>
        <td>3,500</td>
        <td>10,000</td>
      </tr>
    </tbody>
  </table>
</div>
```

**CSS Classes:**
- `.table-wrap`: overflow-x: auto, margin: 0, padding: 0 (allows table to scroll on mobile)
- `table`: width: 100%, border-collapse: collapse
- `thead`: background: #000000, color: #FFFFFF
- `th`: padding: 1rem 1.5rem, text-transform: uppercase, font-size: 0.75rem, font-weight: 600
- `tbody td`: padding: 1.3rem 1.5rem, border-bottom: 1px solid #E4DED7
- `tbody tr:nth-child(even)`: background: #F4F0EC (alternating rows, optional)

**Accessibility:**
- `<thead>` and `<tbody>` semantic structure
- Header cells marked with `<th>` not `<td>`
- Scope attribute on headers: `<th scope="col">` (optional but recommended)
- High contrast: black headers on white body
- Focus on table: outline 2px solid #FF7E08

**Edge Cases:**
- **Long cell content**: Text wraps naturally within cell
- **Mobile overflow**: .table-wrap enables horizontal scroll
- **Many columns**: Reduce padding on mobile: `@media (max-width: 768px) { td { padding: 0.8rem 1rem; } }`
- **Empty cells**: Use `—` (em dash) or `N/A` for clarity

**Responsive:**
- Desktop: Full table, no scroll
- Tablet: May need horizontal scroll if many columns
- Mobile: Horizontal scroll enabled via .table-wrap

---

## 22. Diagram Box (Code/Monospace)

**Purpose:** Dark container for ASCII diagrams, code, or structured text content.

**HTML Snippet:**

```html
<div class="diagram-box">
  <span class="diagram-label">SYSTEM ARCHITECTURE</span>
  <pre>
┌─────────────────────────────────────────┐
│ <span class="hl-orange">Client Application</span>                   │
└────────────────┬────────────────────────┘
                 │ <span class="hl-blue">HTTP Requests</span>
                 ▼
┌─────────────────────────────────────────┐
│ <span class="hl-violet">API Gateway</span>                         │
├─────────────────────────────────────────┤
│ • Authentication                        │
│ • Rate Limiting                         │
│ • Request Routing                       │
└────────────────┬────────────────────────┘
                 │
    ┌────────────┼────────────┐
    ▼            ▼            ▼
┌────────────────────────────────────────┐
│ <span class="hl-green">Microservices</span>                       │
│ ├─ User Service                         │
│ ├─ Data Service                         │
│ └─ Analytics Service                    │
└────────────────┬────────────────────────┘
                 │ <span class="hl-teal">Database</span>
                 ▼
┌─────────────────────────────────────────┐
│ PostgreSQL (Primary)                    │
│ Redis (Cache)                           │
└─────────────────────────────────────────┘
  </pre>
</div>
```

**CSS Classes:**
- `.diagram-box`: background: #0D0D15 (very dark), color: #E2E8F0 (light gray), padding: 2rem, border: 1px solid rgba(255,126,8,0.25) (subtle orange border), border-radius: 12px, overflow-x: auto
- `.diagram-label`: display: block, color: #FF7E08 (orange), font-weight: 600, font-size: 0.85rem, margin-bottom: 1rem, text-transform: uppercase, letter-spacing: 0.5px
- `pre`: font-family: 'JetBrains Mono', 'Courier New', monospace, font-size: 0.85rem, line-height: 1.4, white-space: pre-wrap
- `.hl-orange`: color: #FF7E08
- `.hl-green`: color: #42D36F
- `.hl-blue`: color: #2563EB
- `.hl-teal`: color: #06C8C8
- `.hl-violet`: color: #9747FF
- `.hl-muted`: color: #6B6560

**Accessibility:**
- Semantic `<pre>` tag preserves formatting
- Color highlights aid visual scanning but don't convey meaning alone
- Keyboard: overflow handled by browser scrolling
- Focus: outline 2px solid #FF7E08
- Text alternatives: consider alt text for complex diagrams

**Edge Cases:**
- **Long lines**: Overflow-x: auto enables horizontal scroll
- **Unicode/special chars**: Renders correctly in monospace
- **Empty diagram**: Shows empty dark box (use placeholder)
- **Mobile**: Horizontal scroll required for wide diagrams

**Responsive:**
- Desktop: Full width within container, no scroll
- Mobile: Horizontal scroll via overflow-x: auto

---

## 23. Callout — Info (Blue)

**Purpose:** Blue-tinted callout for informational messages.

**HTML Snippet:**

```html
<div class="callout callout-info">
  <strong>ℹ️ Note:</strong> This section provides additional context about the analysis methodology and assumptions.
</div>
```

**CSS Classes:**
- `.callout`: display: flex, gap: 1.2rem, padding: 1.8rem, border-radius: 12px, border: 1px solid rgba(37,99,235,0.25), border-left: 4px solid #2563EB
- `.callout-info`: background: rgba(37,99,235,0.06)

**Accessibility:**
- Color plus text conveys meaning
- Contrast: dark text on light blue = 9:1 (exceeds AA)
- Focus: outline 2px solid #2563EB
- Emoji is optional (supplementary)

---

## 24. Callout — Warning (Amber)

**Purpose:** Amber-tinted callout for warnings and cautions.

**HTML Snippet:**

```html
<div class="callout callout-warning">
  <strong>⚠️ Warning:</strong> This configuration change may impact performance. Test in staging first.
</div>
```

**CSS Classes:**
- `.callout` + `.callout-warning`: background: rgba(217,119,6,0.06), border: 1px solid rgba(217,119,6,0.3), border-left: 4px solid #D97706

---

## 25. Callout — Success (Green)

**Purpose:** Green-tinted callout for positive outcomes. (Green is decorative in v4.)

**HTML Snippet:**

```html
<div class="callout callout-success">
  <strong>✓ Success:</strong> All validation checks passed. Ready for deployment.
</div>
```

**CSS Classes:**
- `.callout` + `.callout-success`: background: rgba(66,211,111,0.08), border: 1px solid rgba(66,211,111,0.3), border-left: 4px solid #42D36F

**Note:** For semantic success states, use `.sev-low` with yellow (#FFD700).

---

## 26. Callout — Critical (Red)

**Purpose:** Red-tinted callout for critical issues and errors.

**HTML Snippet:**

```html
<div class="callout callout-critical">
  <strong>✕ Critical:</strong> This issue requires immediate remediation. Do not proceed.
</div>
```

**CSS Classes:**
- `.callout` + `.callout-critical`: background: rgba(220,38,38,0.07), border: 1px solid rgba(220,38,38,0.25), border-left: 4px solid #DC2626

---

## 27. Checklist with Check/Cross Marks

**Purpose:** Itemized list showing completion status with colored checkmarks and crosses.

**HTML Snippet:**

```html
<div class="checklist">
  <div class="checklist-item">
    <span class="check">✓</span> Requirement 1 completed
  </div>
  <div class="checklist-item">
    <span class="check">✓</span> Requirement 2 completed
  </div>
  <div class="checklist-item">
    <span class="cross">✕</span> Requirement 3 pending
  </div>
  <div class="checklist-item">
    <span class="check">✓</span> Requirement 4 completed
  </div>
</div>
```

**CSS Classes:**
- `.checklist`: display: flex, flex-direction: column, gap: 1rem
- `.checklist-item`: display: flex, align-items: center, gap: 0.8rem, font-weight: 500
- `.check`: color: #FF7E08 (orange - v4 standard for checkmarks), font-weight: 700
- `.cross`: color: #DC2626 (red), font-weight: 700

**Accessibility:**
- Icons plus text convey status
- Contrast: orange on white = 4.5:1 (meets AA)
- Focus: outline 2px solid #FF7E08
- Screen readers: text reads naturally

---

## 28. Metrics Row

**Purpose:** Horizontal display of key performance indicators with large numbers.

**HTML Snippet:**

```html
<div class="metrics-row">
  <div class="metric">
    <div class="metric-value">2,847</div>
    <div class="metric-label">Total Users</div>
  </div>
  <div class="metric">
    <div class="metric-value">94%</div>
    <div class="metric-label">Uptime</div>
  </div>
  <div class="metric">
    <div class="metric-value">12ms</div>
    <div class="metric-label">Avg Response</div>
  </div>
</div>
```

**CSS Classes:**
- `.metrics-row`: display: flex, justify-content: space-around, gap: 2rem, padding: 2rem
- `.metric`: text-align: center, flex: 1
- `.metric-value`: font-size: 1.8rem, font-weight: 700, color: #000000, margin-bottom: 0.5rem
- `.metric-label`: font-size: 0.875rem, color: #6B6560 (muted), font-weight: 400

**Responsive:**
- Desktop: 3+ metrics in row
- Tablet: 2 metrics per row
- Mobile: Stack to 1 metric per row

---

## 29. Progress Bar

**Purpose:** Visual progress indicator for completion percentage.

**HTML Snippet:**

```html
<div class="progress-bar">
  <div class="progress-fill" style="width: 65%;"></div>
</div>
```

**CSS Classes:**
- `.progress-bar`: background: #E4DED7 (light gray), height: 8px, border-radius: 4px, overflow: hidden
- `.progress-fill`: background: #FF7E08 (orange), height: 100%, transition: width 0.3s ease

**Accessibility:**
- Use with accompanying text: "65% complete"
- ARIA: `aria-valuenow="65"` on outer div
- Color not only means: include numeric text

---

## 30. Timeline

**Purpose:** Vertical timeline showing phases, milestones, or chronological events.

**HTML Snippet:**

```html
<div class="timeline">
  <div class="timeline-item">
    <div class="timeline-dot"></div>
    <div class="timeline-content">
      <h4>Phase 1: Discovery</h4>
      <p>Requirements gathering and stakeholder interviews. Duration: 2 weeks.</p>
    </div>
  </div>
  <div class="timeline-item">
    <div class="timeline-dot"></div>
    <div class="timeline-content">
      <h4>Phase 2: Design</h4>
      <p>Create wireframes and design system. Duration: 3 weeks.</p>
    </div>
  </div>
  <div class="timeline-item">
    <div class="timeline-dot"></div>
    <div class="timeline-content">
      <h4>Phase 3: Development</h4>
      <p>Build and test implementation. Duration: 5 weeks.</p>
    </div>
  </div>
</div>
```

**CSS Classes:**
- `.timeline`: display: flex, flex-direction: column, position: relative
- `.timeline-item`: display: flex, gap: 1.5rem, padding-left: 2rem, position: relative, margin-bottom: 2rem
- `.timeline-dot`: width: 16px, height: 16px, background: #FF7E08, border-radius: 50%, position: absolute, left: 0, top: 0, border: 2px solid #FFFFFF
- `.timeline-content`: flex: 1
- `.timeline-item::before` (connecting line): content: '', position: absolute, left: 7px, top: 24px, bottom: -24px, width: 2px, background: #E4DED7

**Accessibility:**
- Proper heading hierarchy (h4)
- Semantic structure with content
- Focus: outline 2px solid #FF7E08 on dots

---

## 31. Phase Track

**Purpose:** Horizontal phase indicator showing project progression.

**HTML Snippet:**

```html
<div class="phase-track">
  <div class="phase phase-active">
    <div class="phase-dot"></div>
    <div class="phase-label">Phase 1</div>
  </div>
  <div class="phase phase-active">
    <div class="phase-dot"></div>
    <div class="phase-label">Phase 2</div>
  </div>
  <div class="phase">
    <div class="phase-dot"></div>
    <div class="phase-label">Phase 3</div>
  </div>
  <div class="phase">
    <div class="phase-dot"></div>
    <div class="phase-label">Phase 4</div>
  </div>
</div>
```

**CSS Classes:**
- `.phase-track`: display: flex, align-items: center, gap: 0.5rem, position: relative
- `.phase`: display: flex, flex-direction: column, align-items: center, gap: 0.5rem, flex: 1, position: relative
- `.phase-dot`: width: 12px, height: 12px, border-radius: 50%
- `.phase.phase-active .phase-dot`: background: #FF7E08
- `.phase:not(.phase-active) .phase-dot`: background: #E4DED7
- `.phase::after` (connecting line): content: '', position: absolute, top: 6px, left: calc(50% + 12px), right: -50%, height: 2px, background: #E4DED7
- `.phase.phase-active::after`: background: #FF7E08
- `.phase-label`: font-size: 0.875rem, text-align: center, color: #000000

---

## 32. Grounding Reference (Citation Box)

**Purpose:** Citation or reference box linking to evidence and source materials.

**HTML Snippet:**

```html
<div class="grounding-ref">
  <strong>📂 Evidence:</strong> <a href="/docs/analysis-report.pdf">Analysis Report v2.3</a> — Comprehensive findings from the stakeholder interview sessions (pages 12-34).
</div>
```

**CSS Classes:**
- `.grounding-ref`: background: #F4F0EC (gray-100), border-left: 4px solid #FF7E08, padding: 1.5rem, border-radius: 6px, font-size: 0.875rem, color: #333130

**Accessibility:**
- Links have underline or color change
- Contrast: dark text on light gray = 9.5:1 (exceeds AA)
- Focus on links: outline 2px solid #FF7E08

---

## 33. Score Ring (Circular Progress)

**Purpose:** Circular progress indicator for scores, ratings, or percentages.

**HTML Snippet:**

```html
<div class="score-ring">
  <svg viewBox="0 0 100 100" style="width: 120px; height: 120px;">
    <circle cx="50" cy="50" r="40" class="score-ring-bg"></circle>
    <circle cx="50" cy="50" r="40" class="score-ring-fill" style="stroke-dasharray: 75, 100;"></circle>
  </svg>
  <div class="score-value">75%</div>
  <div class="score-label">Score</div>
</div>
```

**CSS Classes:**
- `.score-ring`: display: flex, flex-direction: column, align-items: center, gap: 1rem
- `.score-ring-bg`: fill: none, stroke: #E4DED7, stroke-width: 3
- `.score-ring-fill`: fill: none, stroke: #FF7E08, stroke-width: 3, stroke-linecap: round, transform: rotate(-90deg), transform-origin: 50% 50%
- `.score-value`: font-size: 1.5rem, font-weight: 700, color: #000000
- `.score-label`: font-size: 0.875rem, color: #6B6560

**Accessibility:**
- Percentage text visible (not just circle)
- ARIA: `role="img"` with `aria-label="75 percent score"`
- High contrast: orange on white

---

## 34. Heatmap (Intensity Grid)

**Purpose:** Grid visualization showing intensity or frequency using color gradients.

**HTML Snippet:**

```html
<div class="heatmap">
  <div class="heatmap-cell intensity-1"></div>
  <div class="heatmap-cell intensity-2"></div>
  <div class="heatmap-cell intensity-3"></div>
  <div class="heatmap-cell intensity-4"></div>
  <div class="heatmap-cell intensity-5"></div>
</div>
```

**CSS Classes:**
- `.heatmap`: display: grid, grid-template-columns: repeat(auto-fit, minmax(20px, 1fr)), gap: 4px
- `.heatmap-cell`: width: 20px, height: 20px, border-radius: 4px
- `.intensity-1`: background: #FFE8D6 (light orange)
- `.intensity-2`: background: #FFD4B3
- `.intensity-3`: background: #FFC090
- `.intensity-4`: background: #FFAD6D
- `.intensity-5`: background: #FF7E08 (dark orange)

**Accessibility:**
- Color-only visualization: supplement with legend
- Include numeric values in tooltip or table
- Contrast verified for each intensity level

---

## 35. Footer

**Purpose:** Page footer with branding, status badges, and confidentiality notice.

**HTML Snippet:**

```html
<footer>
  <div style="max-width:1100px;margin:0 auto;padding:3.5rem 2rem 2.5rem;">
    <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:2rem;border-bottom:1px solid rgba(255,255,255,0.1);padding-bottom:2rem;">
      <div>
        <div style="font-size:1.2rem;font-weight:700;margin-bottom:0.5rem;color:#FFFFFF;">sofka<span style="color:#FF7E08;">_</span></div>
        <p style="color:rgba(255,255,255,0.7);font-size:0.875rem;margin:0;">Your technology companion</p>
      </div>
      <div style="text-align:right;color:#FFFFFF;">
        <p style="font-size:0.875rem;margin-bottom:0.5rem;">Documento en proceso · HITL activo</p>
        <p style="font-size:0.875rem;color:rgba(255,255,255,0.7);margin:0;">Confidencial · Solo uso interno</p>
      </div>
    </div>
    <div style="display:flex;justify-content:space-between;align-items:flex-end;">
      <div>
        <p style="font-size:0.75rem;color:rgba(255,255,255,0.6);margin:0;">Confidentiality notice: This document contains proprietary information. Unauthorized access, distribution, or use is strictly prohibited.</p>
      </div>
      <div style="text-align:right;color:#FFFFFF;">
        <p style="font-size:0.875rem;font-weight:600;margin:0.25rem 0;">§N Document Title</p>
        <p style="font-size:0.75rem;color:rgba(255,255,255,0.6);margin:0;">© 2026 Sofka Technologies</p>
      </div>
    </div>
  </div>
</footer>
```

**CSS Classes:**
- `footer`: background: #000000 (black), color: #FFFFFF (white), padding: 3.5rem 2rem 2.5rem, border-top: 8px solid #FF7E08 (orange)
- Inner container: max-width: 1100px, margin: 0 auto, display: flex, flex-direction: column

**Accessibility:**
- Semantic `<footer>` tag
- High contrast: white text on black = 21:1
- Links have underline and color
- Focus: outline 2px solid #FF7E08

**Edge Cases:**
- **Mobile**: Padding reduced to 1.5rem, 2-row layout stacks
- **Long text**: Wraps naturally
- **No status badges**: Adjust flex layout

**Composition:**
- Always at bottom of page
- Paired with hero at top (black bg, orange borders)
- Confidentiality notice required for legal documents

---

## Quick Component Selection Guide

| Need | Component | CSS Class |
|------|-----------|-----------|
| Group content | Card | `.card` |
| Highlight info | Card Accent | `.card-accent` |
| Error/Critical | Card Critical | `.card-critical` |
| Warning | Card Warning | `.card-warning` |
| Success/Positive | Badge Yellow | `.badge-yellow` |
| 2 columns | Card Grid | `.card-grid-2` |
| 3 columns | Card Grid | `.card-grid-3` |
| Table data | Table Wrap | `.table-wrap` |
| Code/Diagram | Diagram Box | `.diagram-box` |
| Info callout | Callout Info | `.callout-info` |
| Status label | Severity Badge | `.sev-low/medium/high/critical` |
| Timeline | Timeline | `.timeline` |
| Progress | Progress Bar | `.progress-bar` |
| Metrics | Metrics Row | `.metrics-row` |

---

## Accessibility Checklist for All Components

- Color contrasts meet WCAG AA (4.5:1 for normal, 3:1 for large)
- Text alternatives for icons/images
- Semantic HTML tags (header, nav, main, section, footer, article)
- Keyboard navigation support (Tab, Enter, arrow keys)
- Focus visible outline: 2px solid #FF7E08
- Proper heading hierarchy (h1 > h2 > h3, no skipping)
- Form labels associated with inputs
- ARIA attributes where needed (aria-label, aria-describedby, role)
- Skip links to main content (#main)
