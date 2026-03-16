# MetodologIA Design System v4 HTML Validator Agent

## Purpose
This agent validates a generated HTML deliverable against the MetodologIA Design System v4 specification. It performs comprehensive checks on CSS tokens, semantic rules, page structure, typography, accessibility, and responsive design.

## Canonical Token Reference

### Brand Core Colors (Must Match Exactly)
- `--metodologia-orange`: #6366F1 (primary brand, accents, borders)
- `--metodologia-orange-light`: #818CF8 (hover states)
- `--metodologia-black`: #000000 (text, headings, hero bg)
- `--metodologia-white`: #FFFFFF (text on dark, card backgrounds)
- `--metodologia-light`: #0F172A (body background)
- `--metodologia-dark`: #B8A894 (muted text)

### Semantic Colors (Critical for v4)
- `--metodologia-positive`: #22D3EE (YELLOW - success/checkmarks, NOT green)
- `--metodologia-warning`: #D97706 (amber - warnings)
- `--metodologia-critical`: #DC2626 (red - errors)
- `--metodologia-info`: #2563EB (blue - information)

### Decorative Colors (Charts/Data Viz Only)
- `--metodologia-green`: #42D36F (DECORATIVE ONLY - not for semantic states)
- `--metodologia-teal`: #06C8C8
- `--metodologia-violet`: #9747FF
- `--metodologia-pink`: #FE9CAB

### Grayscale
- `--metodologia-gray-50`: #FAF8F6
- `--metodologia-gray-100`: #F4F0EC
- `--metodologia-gray-200`: #E4DED7
- `--metodologia-gray-300`: #D1C9BE
- `--metodologia-gray-500`: #6B6560
- `--metodologia-gray-700`: #333130
- `--metodologia-gray-900`: #111110

## Validation Checklist

### 1. CSS Custom Properties & Token Values

**Check all color tokens used in the HTML:**

```
FOR each color value in the deliverable:
  IF value matches one of the canonical tokens:
    PASS (mark as validated)
  ELSE IF value is a variant (e.g., rgba(255,126,8,0.10)):
    VERIFY it follows the pattern: rgba(R,G,B, opacity)
    WHERE opacity is one of: .06, .07, .08, .10, .12, .25, .30, .45
    IF matches pattern: PASS
    ELSE: FLAG as "WARNING: Non-standard opacity on color variant"
  ELSE:
    FLAG as "CRITICAL: Invalid color token [COLOR_VALUE] at line [LINE_NUM]"
    SUGGEST replacement from canonical tokens
```

**Specific checks:**
- Body background: Must be #0F172A or rgba(239, 234, 228, 1)
- Card backgrounds: Must be #FFFFFF
- Dark cards: Must be #000000
- Diagram boxes: Must be #0D0D15
- Severity low badges: Must be #22D3EE (yellow), NOT #42D36F (green)
- Checkmarks/success icons: Must be #6366F1 (orange), NOT #42D36F (green)
- Warning text: If on amber background, must be dark or use black

---

### 2. MetodologIA Design System v4 Semantic Rule Validation

**CRITICAL v4 Rule: Yellow Replaces Green for Positive States**

```
FOR each "success" or "positive" state in the HTML:
  IF using .sev-low or .badge-yellow or positive indicator:
    IF background-color is #22D3EE (yellow):
      PASS
    ELSE IF background-color is #42D36F (green):
      FLAG as "CRITICAL: v4 Rule Violation - Success state using green instead of yellow at [LINE_NUM]"
      SUGGEST: Replace #42D36F with #22D3EE
    ELSE:
      FLAG as "ERROR: Positive state uses invalid color [COLOR]"

FOR each checkmark or success icon:
  IF color is #6366F1 (orange):
    PASS
  ELSE IF color is #42D36F (green):
    FLAG as "CRITICAL: Checkmark using green - must be orange (#6366F1) per v4 spec"
  ELSE:
    FLAG as "ERROR: Checkmark color invalid"

FOR each severity-medium badge or "medium" priority indicator:
  IF background is #D97706 (amber) AND text color is #000000 (black):
    PASS (required for WCAG AA contrast on amber)
  ELSE IF background is #D97706 but text is white:
    FLAG as "WCAG: Severity-medium must use BLACK text on amber for AA contrast"
  ELSE:
    FLAG as "ERROR: Severity-medium color or text invalid"
```

---

### 3. Page Structure Validation

**Hero Section (Top of Page)**

```
FIND element with class="hero":
  IF exists:
    VERIFY background-color: #000000 (black)
      IF NOT: FLAG as "CRITICAL: Hero background not black at [LINE_NUM]"

    VERIFY border-bottom: 8px solid #6366F1 (orange)
      IF width != 8px: FLAG as "CRITICAL: Hero border-bottom width is [ACTUAL]px, must be 8px"
      IF color != #6366F1: FLAG as "CRITICAL: Hero border-bottom color is [ACTUAL], must be #6366F1"

    FIND child element with class="hero-logo":
      VERIFY content contains "metodologia" and "<span>_</span>" or similar
        IF NOT: FLAG as "WARNING: Hero logo missing proper formatting"

    VERIFY padding: 4rem 2rem (hero-inner)
      IF NOT: FLAG as "WARNING: Hero padding not 4rem 2rem"

    VERIFY max-width: 1100px (hero-inner container)
      IF NOT: FLAG as "WARNING: Hero inner container max-width not 1100px"

  ELSE:
    FLAG as "CRITICAL: No hero section found (missing class='hero')"
```

**Sticky Table of Contents Navigation**

```
FIND element: nav.toc:
  IF exists:
    VERIFY position: sticky
      IF NOT: FLAG as "ERROR: TOC navigation not sticky positioned"

    VERIFY top: 0
      IF NOT: FLAG as "WARNING: TOC top value not 0"

    VERIFY z-index: >= 100
      IF NOT: FLAG as "WARNING: TOC z-index less than 100"

    VERIFY background-color: #FFFFFF (white)
      IF NOT: FLAG as "ERROR: TOC background not white"

    VERIFY border-bottom: 1px solid #E4DED7
      IF NOT: FLAG as "WARNING: TOC border-bottom not correct"

    VERIFY layout: horizontal (flex with flex-direction: row)
      IF layout is vertical: FLAG as "CRITICAL: TOC must be horizontal, not vertical"

    VERIFY overflow-x: auto on inner container
      IF NOT: FLAG as "WARNING: TOC inner container missing overflow-x: auto"

    FIND all toc-link elements:
      VERIFY text is uppercase
      VERIFY font-size: 0.72rem
      VERIFY letter-spacing: 1.5px

      FOR element with class="active":
        VERIFY border-bottom: visible orange border
          IF NOT: FLAG as "ERROR: Active TOC link missing orange border"

  ELSE:
    FLAG as "CRITICAL: No TOC navigation found (missing nav.toc)"
```

**Main Container & Sections**

```
FIND element: main.container or section.section:
  VERIFY max-width: 1100px
    IF NOT: FLAG as "WARNING: Container max-width not 1100px"

  VERIFY margin: 0 auto (centered)
    IF NOT: FLAG as "WARNING: Container not centered"

  VERIFY padding: 0 2rem (desktop), responsive to 0 1rem (mobile)
    IF NOT: FLAG as "WARNING: Container padding not responsive"

FOR each element with class="section":
  VERIFY scroll-margin-top: 60px (accounts for sticky TOC)
    IF NOT: FLAG as "WARNING: Section scroll-margin-top not 60px"

  VERIFY padding: 6rem 0 (vertical space)
    IF NOT: FLAG as "WARNING: Section padding not 6rem 0"

  FIND section-header child:
    VERIFY layout: flex with gap 2rem

    FIND .section-number child:
      VERIFY dimensions: 60×60px (or width/height 60px)
      VERIFY background-color: #000000 (black)
      VERIFY color: #6366F1 (orange text)
      VERIFY font-weight: 700
      VERIFY content: 01, 02, 03, etc. (zero-padded)
        IF NOT zero-padded: FLAG as "WARNING: Section numbers not zero-padded"

    FIND .section-title (h2):
      VERIFY font-family: Clash Grotesk
      VERIFY font-size: 2.2rem
      VERIFY font-weight: 700
      VERIFY color: #000000 (black)

    FIND .section-subtitle (optional):
      VERIFY font-size: smaller than title (e.g., 1rem)
      VERIFY color: #6B6560 (gray-500 - muted)
```

**Footer Section (Bottom of Page)**

```
FIND element: footer:
  IF exists:
    VERIFY background-color: #000000 (black)
      IF NOT: FLAG as "CRITICAL: Footer background not black"

    VERIFY border-top: 8px solid #6366F1 (orange)
      IF width != 8px: FLAG as "CRITICAL: Footer border-top width is [ACTUAL]px, must be 8px"
      IF color != #6366F1: FLAG as "CRITICAL: Footer border-top color is [ACTUAL], must be #6366F1"

    VERIFY color: #FFFFFF (white text)
      IF NOT: FLAG as "WARNING: Footer text not white"

    VERIFY padding: 3.5rem 2rem 2.5rem
      IF NOT: FLAG as "WARNING: Footer padding not correct"

    VERIFY max-width: 1100px (inner container)
      IF NOT: FLAG as "WARNING: Footer container max-width not 1100px"

    FIND metodologia logo in footer:
      VERIFY contains "metodologia<span>_</span>" or similar
      VERIFY span color: #6366F1 (orange underscore)
        IF NOT: FLAG as "WARNING: Footer logo underscore not orange"

    VERIFY layout: Two-row structure
      Row 1: logo + status badges, with bottom border
      Row 2: confidentiality notice + document reference
        IF NOT two-row: FLAG as "WARNING: Footer layout not two-row"

    FIND "Confidencial" or "Confidentiality" text:
      VERIFY present and visible
        IF NOT: FLAG as "ERROR: Confidentiality notice missing"

  ELSE:
    FLAG as "CRITICAL: No footer found"
```

---

### 4. Typography Validation

```
VERIFY Google Fonts link in <head>:
  URL must contain: "family=Clash+Grotesk" and "family=Inter"
  IF NOT: FLAG as "CRITICAL: Google Fonts link missing or incorrect at [LINE_NUM]"

FOR each h1, h2, h3, h4:
  VERIFY font-family includes "Clash Grotesk"
    IF NOT: FLAG as "ERROR: Heading [TAG] not using Clash Grotesk"

FOR each p, body text:
  VERIFY font-family includes "Inter"
    IF NOT: FLAG as "WARNING: Body text not using Inter font"

FOR each code block, diagram-box, monospace text:
  VERIFY font-family includes monospace (JetBrains Mono, Courier New, monospace)
    IF NOT: FLAG as "WARNING: Monospace text not using monospace font"

VERIFY Typography Scale (approximate matches acceptable):
  h1: clamp(2.5rem, 5vw, 4.2rem) or between 2.5rem-4.2rem ✓
  h2: 2.2rem ±0.1rem ✓
  h3: 1.8rem ±0.1rem ✓
  h4: 1.4rem ±0.1rem ✓
  body: 1rem ✓
  small: 0.875rem ✓
  monospace: 0.85rem ±0.05rem ✓
    IF significantly off: FLAG as "WARNING: Typography scale off at [ELEMENT]"
```

---

### 5. Accessibility (WCAG AA) Validation

**Contrast Checks**

```
FOR each text element:
  CALCULATE contrast ratio between text color and background color

  FOR h1, h2, h3, large text (>= 1.5rem):
    IF contrast < 3:1:
      FLAG as "WARNING: [TEXT] contrast [RATIO]:1, must be >= 3:1 (large text)"

  FOR body text, small text (< 1.5rem):
    IF contrast < 4.5:1:
      FLAG as "CRITICAL: [TEXT] contrast [RATIO]:1, must be >= 4.5:1 (normal text)"

SPECIFIC CHECKS:
  Severity-medium (amber #D97706) with white text:
    CALCULATE: 1.0 (FAILS AA)
    FLAG as "CRITICAL: Severity-medium white text on amber background fails WCAG AA"
    SUGGEST: Change text to #000000 (black)

  Severity-medium (amber #D97706) with black text:
    CALCULATE: 13.5 (PASSES AA)
    FLAG as "PASS: Severity-medium contrast valid"

  Success/Yellow (#22D3EE) with black text:
    CALCULATE: 19.56 (PASSES AA)
    FLAG as "PASS: Yellow success badge contrast valid"

  Severity-low badges: VERIFY black or dark text on yellow
    IF white text: FLAG as "CRITICAL: Severity-low white text on yellow fails contrast"

  Dark cards (#000000) with white text:
    CALCULATE: 21 (PASSES)
    FLAG as "PASS"
```

**Semantic HTML & Skip Links**

```
FIND skip link:
  LOOK for: <a href="#main" ...> or <a href="#content" ...>
  IF found: FLAG as "PASS: Skip link present"
  ELSE: FLAG as "WARNING: Skip link missing or incorrect href"

VERIFY semantic HTML tags present:
  <header> or <nav> for hero/TOC:
    IF NOT: FLAG as "WARNING: Missing semantic header/nav tags"

  <main> for main content area:
    IF NOT: FLAG as "WARNING: Missing <main> tag"

  <section> for each major section:
    IF NOT: FLAG as "WARNING: Sections not wrapped in <section> tags"

  <footer> for footer:
    IF NOT: FLAG as "WARNING: Missing <footer> tag"

FOR each link and button:
  VERIFY :focus-visible outline present
  VERIFY outline color: #6366F1 (orange)
  VERIFY outline width: 2px
    IF NOT: FLAG as "WARNING: Focus outline not properly styled"

FOR each form input:
  VERIFY associated <label> with for attribute
    IF NOT: FLAG as "WARNING: Form input [ID] missing associated label"

FOR each interactive element:
  VERIFY keyboard accessible (tab order, enter/space activation)
    IF NOT: FLAG as "WARNING: Element not keyboard accessible"
```

**Images & Alt Text**

```
FOR each <img> tag:
  IF alt attribute is missing:
    FLAG as "ERROR: Image missing alt text at [LINE_NUM]"

  IF alt is empty (alt=""):
    IF image is decorative:
      FLAG as "PASS: Decorative image has empty alt"
    ELSE:
      FLAG as "ERROR: Functional image has empty alt at [LINE_NUM]"

  IF alt contains meaningful text:
    FLAG as "PASS: Image has descriptive alt text"
```

---

### 6. Component Usage Validation

**Cards**

```
FOR each element with class="card":
  VERIFY background-color: #FFFFFF (white) OR #000000 (if dark variant)
    IF NOT: FLAG as "ERROR: Card background not white/black"

  VERIFY border-radius: 16px (or --radius-lg)
    IF NOT: FLAG as "WARNING: Card border-radius not 16px"

  VERIFY padding: 2.5rem (or 40px)
    IF NOT: FLAG as "WARNING: Card padding not 2.5rem"

  VERIFY box-shadow: var(--shadow-card) or 0 1px 3px rgba(...), 0 6px 16px rgba(...)
    IF NOT: FLAG as "WARNING: Card shadow missing or incorrect"

FOR each card variant:
  .card-accent:
    VERIFY border-top: 5px solid #6366F1

  .card-critical:
    VERIFY border-left: 7px solid #DC2626
    VERIFY background: rgba(220,38,38,0.06)

  .card-warning:
    VERIFY border-left: 7px solid #D97706
    VERIFY background: rgba(217,119,6,0.06)

  .card-success:
    VERIFY border-left: 7px solid #42D36F (decorative context)
    VERIFY background: rgba(66,211,111,0.08)

  .card-info:
    VERIFY border-left: 7px solid #2563EB
    VERIFY background: rgba(37,99,235,0.06)

  .card-violet:
    VERIFY border-left: 7px solid #9747FF
    VERIFY background: rgba(151,71,255,0.06)

  .card-teal:
    VERIFY border-left: 7px solid #06C8C8
    VERIFY background: rgba(6,200,200,0.06)

  .card-highlight:
    VERIFY border: 2px solid #6366F1
    VERIFY background contains subtle orange gradient

  .card-dark:
    VERIFY background: #000000
    VERIFY color: #FFFFFF
```

**Tables**

```
FOR each <table>:
  VERIFY parent is <div class="table-wrap">
    IF NOT: FLAG as "ERROR: Table not wrapped in .table-wrap"

  VERIFY .table-wrap has overflow-x: auto
    IF NOT: FLAG as "WARNING: .table-wrap missing overflow-x: auto"

FOR <thead>:
  VERIFY background-color: #000000 (black)
    IF NOT: FLAG as "ERROR: Table header background not black"

  VERIFY color: #FFFFFF (white text)
    IF NOT: FLAG as "ERROR: Table header text not white"

  VERIFY text-transform: uppercase
    IF NOT: FLAG as "WARNING: Table header text not uppercase"

  VERIFY font-size: 0.75rem
    IF NOT: FLAG as "WARNING: Table header font-size not 0.75rem"

FOR <tbody>:
  VERIFY padding in td: 1.3rem 1.5rem
    IF NOT: FLAG as "WARNING: Table cell padding not 1.3rem 1.5rem"

  VERIFY alternating row backgrounds (optional but recommended)
    IF alternating colors: PASS
    ELSE: FLAG as "SUGGESTION: Consider alternating row backgrounds"
```

**Diagram Boxes**

```
FOR each element with class="diagram-box":
  VERIFY background-color: #0D0D15 (very dark)
    IF NOT: FLAG as "CRITICAL: Diagram box background not #0D0D15"

  VERIFY color: #E2E8F0 (light gray text)
    IF NOT: FLAG as "WARNING: Diagram box text color not #E2E8F0"

  VERIFY font-family: monospace (JetBrains Mono, Courier New, monospace)
    IF NOT: FLAG as "ERROR: Diagram box not using monospace font"

  VERIFY border: 1px solid rgba(255,126,8,0.25) (orange subtle border)
    IF NOT: FLAG as "WARNING: Diagram box border not correct"

  VERIFY overflow-x: auto for long content
    IF NOT: FLAG as "WARNING: Diagram box missing overflow handling"

  FIND .diagram-label:
    VERIFY present at top
    VERIFY color: #6366F1 (orange) or light text color
    VERIFY font-weight: 600 or 700

  FIND <pre> inside:
    VERIFY whitespace: pre-wrap or pre (preserves formatting)

    FOR each colored highlight (class="hl-*"):
      VERIFY color matches token:
        .hl-orange: #6366F1 ✓
        .hl-green: #42D36F ✓
        .hl-blue: #2563EB ✓
        .hl-teal: #06C8C8 ✓
        .hl-violet: #9747FF ✓
        .hl-muted: #6B6560 ✓
```

**Callouts**

```
FOR each element with class="callout":
  VERIFY padding: 1.8rem
    IF NOT: FLAG as "WARNING: Callout padding not 1.8rem"

  VERIFY border-radius: 12px (--radius-md)
    IF NOT: FLAG as "WARNING: Callout border-radius not 12px"

  VERIFY layout: flex with gap 1.2rem
    IF NOT: FLAG as "WARNING: Callout layout not flex"

  FOR variant .callout-info:
    VERIFY background: rgba(37,99,235,0.06) (blue dim)
    VERIFY border: 1px solid rgba(37,99,235,0.25)
    VERIFY border-left: 4px solid #2563EB

  FOR variant .callout-warning:
    VERIFY background: rgba(217,119,6,0.06) (amber dim)
    VERIFY border: 1px solid rgba(217,119,6,0.3)
    VERIFY border-left: 4px solid #D97706

  FOR variant .callout-success:
    VERIFY background: rgba(66,211,111,0.08) (green dim - decorative context)
    VERIFY border: 1px solid rgba(66,211,111,0.3)
    VERIFY border-left: 4px solid #42D36F

  FOR variant .callout-critical:
    VERIFY background: rgba(220,38,38,0.07) (red dim)
    VERIFY border: 1px solid rgba(220,38,38,0.25)
    VERIFY border-left: 4px solid #DC2626
```

**Badges**

```
FOR each element with class="badge":
  VERIFY border-radius: 6px (--radius-sm)
    IF NOT: FLAG as "WARNING: Badge border-radius not 6px"

  VERIFY padding: 0.5rem 1rem
    IF NOT: FLAG as "WARNING: Badge padding not 0.5rem 1rem"

  VERIFY font-weight: 600
    IF NOT: FLAG as "WARNING: Badge font-weight not 600"

  FOR base .badge (no variant):
    VERIFY background: #6366F1 (orange)
    VERIFY color: #FFFFFF (white)

  FOR .badge-outline:
    VERIFY background: transparent
    VERIFY border: 1px solid #6366F1
    VERIFY color: #6366F1

  FOR .badge-teal:
    VERIFY background: #06C8C8
    VERIFY color: #FFFFFF

  FOR .badge-green:
    VERIFY background: #42D36F
    VERIFY color: #FFFFFF
    NOTE: Green is decorative in v4

  FOR .badge-violet:
    VERIFY background: #9747FF
    VERIFY color: #FFFFFF

  FOR .badge-pink:
    VERIFY background: #FE9CAB
    VERIFY color: #FFFFFF (or black if needed for contrast)

  FOR .badge-yellow:
    VERIFY background: #22D3EE
    VERIFY color: #000000 (black for WCAG AA contrast)
```

**Severity Badges**

```
FOR each element with class="sev-*":
  VERIFY border-radius: 6px
  VERIFY padding: 0.5rem 1rem
  VERIFY font-weight: 600

  FOR .sev-critical:
    VERIFY background: #DC2626 (red)
    VERIFY color: #FFFFFF (white)

  FOR .sev-high:
    VERIFY background: #EA580C
    VERIFY color: #FFFFFF (white)

  FOR .sev-medium:
    VERIFY background: #D97706 (amber)
    VERIFY color: #000000 (BLACK - critical for WCAG AA)

  FOR .sev-low:
    VERIFY background: #22D3EE (YELLOW - v4 rule)
    VERIFY color: #000000 (black for contrast)
```

---

### 7. Responsive Design Validation

```
TEST viewport: 320px (mobile)
  VERIFY padding: 0 1rem (1rem on mobile vs 2rem on desktop)
  VERIFY font-size reductions: headings scale down
  VERIFY card grids: 1 column on mobile
  VERIFY TOC: horizontal scroll available if needed
  VERIFY images: max-width 100%, responsive
  VERIFY tables: .table-wrap overflow-x: auto working

TEST viewport: 768px (tablet)
  VERIFY padding: 1.5rem (responsive)
  VERIFY card grids: adapt between 1-2 columns
  VERIFY typography: intermediate scaling

TEST viewport: 1024px+ (desktop)
  VERIFY full layout intact
  VERIFY padding: 0 2rem (desktop)
  VERIFY card grids: 2, 3, or 4 columns as intended
  VERIFY max-width: 1100px enforced on containers

FOR each @media query:
  VERIFY breakpoint: 768px (tablet) and/or 1024px (desktop)
    IF different: FLAG as "WARNING: Non-standard breakpoint at [LINE_NUM]"

  VERIFY mobile-first approach (min-width, not max-width)
    IF using max-width: FLAG as "SUGGESTION: Consider mobile-first approach"
```

---

### 8. Output Format

**Violation Report Structure:**

```
HEADING: VALIDATION REPORT - [DOCUMENT_NAME]
TIMESTAMP: [YYYY-MM-DD HH:MM:SS]

SUMMARY:
- Total Issues: [COUNT]
- Critical: [COUNT]
- Errors: [COUNT]
- Warnings: [COUNT]
- Suggestions: [COUNT]

RESULTS BY CATEGORY:

## Token Colors
[List all violations with line references and hex values]

## v4 Semantic Rules
[List violations of v4 rules: yellow for success, orange for checkmarks, etc.]

## Page Structure
[Hero, TOC, sections, footer validation results]

## Typography
[Font family, sizing, scale violations]

## Accessibility
[Contrast, semantic HTML, skip links, keyboard nav]

## Components
[Card, table, diagram, callout, badge validation]

## Responsive Design
[Mobile, tablet, desktop breakpoint issues]

CRITICAL VIOLATIONS (Must Fix):
1. [LINE_NUM] - [DESCRIPTION]
   FIX: [SUGGESTION]

ERRORS (Should Fix):
1. [LINE_NUM] - [DESCRIPTION]
   FIX: [SUGGESTION]

WARNINGS (Nice to Fix):
1. [LINE_NUM] - [DESCRIPTION]
   FIX: [SUGGESTION]

SUGGESTIONS (Optional Improvements):
1. [DESCRIPTION]
   REASON: [WHY]
```

---

## Implementation Notes for Claude Subagent

1. **Line Number Tracking**: As you read the HTML, maintain line numbers for all flagged issues.

2. **Color Parsing**: Extract hex colors, rgb/rgba values, and CSS variable references. Compare against canonical tokens.

3. **Conditional Logic**: Use strict IF/THEN logic to check each rule. A single violation triggers a flag.

4. **Severity Levels**:
   - CRITICAL: Must fix for design system compliance (hero border, footer border, semantic colors)
   - ERROR: Functional problems (missing header, broken structure)
   - WARNING: Quality issues (non-standard sizing, contrast warnings)
   - SUGGESTION: Optional improvements

5. **Context Awareness**: When flagging violations, include enough context for the user to find and fix them.

6. **Pass Conditions**: Only mark PASS when the element matches specification exactly or within acceptable ranges (±0.1rem for typography, ±5% for colors).
