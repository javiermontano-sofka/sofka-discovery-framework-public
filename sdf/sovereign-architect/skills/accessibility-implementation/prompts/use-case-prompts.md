# Use Case Prompts — Accessibility Implementation

## Scenario 1: WCAG 2.2 AA Compliance Audit

```
Conduct a WCAG 2.2 AA compliance audit of the application at {PROJECT_PATH}.

The client has EU Accessibility Act obligations (June 2025 deadline) and
needs a compliance report with remediation roadmap.

Step 1 — Automated scan:
  Run axe-core against all main routes using Playwright
  npx axe-core-cli {URL} --tags wcag2a,wcag2aa,wcag21aa,wcag22aa

Step 2 — Manual checklist (automated tools catch only 30-40%):
  For each of the 5 key pages:
  □ Heading hierarchy (one h1, no skipped levels)
  □ All interactive elements keyboard accessible
  □ Focus indicator visible and 3:1 contrast (WCAG 2.2 — 2.4.11)
  □ Touch targets ≥ 24×24px (WCAG 2.2 — 2.5.8)
  □ Color contrast 4.5:1 for normal text
  □ Images have meaningful alt text
  □ Form fields labeled and error messages programmatic

Step 3 — Output findings report:
  - Severity: P1 (blocks release) / P2 (this sprint) / P3 (this quarter)
  - WCAG criterion (e.g. 1.4.3 Contrast Minimum)
  - Evidence [HECHO] with screenshot reference
  - Recommended fix

Step 4 — Remediation roadmap with effort estimates [SUPUESTO — labeled].
```

## Scenario 2: Custom Widget Accessibility Fix

```
The application at {PROJECT_PATH} has several custom UI widgets that fail accessibility:
- Custom dropdown (implemented as div + click handler)
- Custom date picker (no keyboard support)
- Custom file upload (div with background image)
- Tab component (div-based, no arrow key navigation)

For each widget:
1. Document the current implementation [HECHO]
2. Identify the correct ARIA APG pattern for this widget
3. List required ARIA roles, states, and properties
4. List required keyboard interactions (Enter/Space/Arrow/Escape)
5. Implement the fix using the pattern from the body of knowledge

Constraint: do not change the visual design — only HTML/JS/ARIA.

After implementation, provide a manual testing script:
- How to test with keyboard only
- What screen reader should announce at each step
- How to test in NVDA+Firefox and VoiceOver+Safari
```

## Scenario 3: Accessible Form Redesign

```
The registration form at {PROJECT_PATH}/src/components/RegistrationForm.tsx
has multiple accessibility issues reported by users with disabilities.

Audit the form for:
1. All inputs have visible, programmatically associated labels [HECHO]
2. Required fields are indicated (not just with red asterisk — color alone fails 1.4.1) [HECHO]
3. Error messages are programmatically linked to their fields (aria-describedby) [HECHO]
4. Errors are announced to screen readers (aria-live or role="alert") [HECHO]
5. Form is navigable by keyboard in logical order [HECHO]
6. Date inputs: browser-native or accessible custom pattern? [INFERENCIA]
7. Password strength indicator: is it accessible? [HECHO]

Deliver:
1. Findings with WCAG criteria [HECHO]
2. Corrected form component with all accessibility fixes applied
3. Test script: how to verify form accessibility with NVDA+Firefox
4. axe-core Playwright test that prevents future regressions
```

## Scenario 4: Focus Management in SPA

```
The React SPA at {PROJECT_PATH} has focus management problems:
- After navigation, focus stays on the previous route's content
- Modal dialogs don't trap focus
- Dynamically loaded content isn't announced to screen readers

Diagnose and fix:
1. Audit current navigation: where does focus go after route change? [HECHO]
2. Audit modals: is there a focus trap? What happens when you Tab inside? [HECHO]
3. Audit dynamic content: are live regions used for updates? [HECHO]

Implement:
4. Route change focus management: move focus to h1 or main content after navigation
5. Screen reader announcer: aria-live region that announces page title changes
6. Modal focus trap: focus enters on open, trapped inside, returns on close
7. Dynamic content announcements: aria-live="polite" for search results, notifications

Provide Playwright tests for each focus management scenario.
```

## Scenario 5: Color Contrast and Visual Design Audit

```
The design system at {PROJECT_PATH} needs a color contrast audit before v2.0 release.

The design team has provided a new color palette. Verify it meets WCAG 2.1 AA.

Step 1 — Extract all color token pairs used for text:
  Scan tokens/semantic.css for --color-text-* on --color-bg-* combinations [HECHO]

Step 2 — Calculate contrast ratios for each pair:
  Use the formula in the body of knowledge OR report tool measurements

Step 3 — Test each combination against thresholds:
  - Normal text (< 18pt): 4.5:1 minimum
  - Large text (≥ 18pt): 3:1 minimum
  - UI components (buttons, borders, icons): 3:1 minimum
  - Focus indicators (WCAG 2.2 — 2.4.11): 3:1 minimum

Step 4 — Flag failures:
  [HECHO] for each pair that fails, with measured ratio

Step 5 — Propose fixes:
  Adjusted color values that pass, maintaining brand identity [SUPUESTO — requires designer approval]

Step 6 — Verify dark mode: repeat for dark mode token overrides
```
