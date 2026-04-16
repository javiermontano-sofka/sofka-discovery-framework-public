# Accessibility Audit Report — HealthTrack Web Application

**Date**: 2026-03-18 | **Standard**: WCAG 2.2 AA | **Scope**: Core patient-facing flows

---

## TL;DR

**Accessibility Score**: Lighthouse 62/100 | axe-core: 23 violations (4 critical, 8 serious, 11 moderate)

Critical gaps: form error messages not programmatically linked, custom dropdown not keyboard accessible,
color contrast failures on muted text. EU Accessibility Act compliance at risk.
Estimated remediation: 8–12 developer-days to reach AA compliance.

---

## Automated Scan Results [HECHO]

*Source: axe-core v4.9, Playwright, pages: /, /dashboard, /appointments, /profile, /messages*

### Critical Violations (P1 — Fix Before Release)

**1. Form fields without labels — `/appointments` (14 inputs)**
- Rule: `label` | WCAG: 1.3.1 Info and Relationships (A)
- Element: `<input type="text" class="search-input">` — no label association
- Impact: Screen reader announces "edit text" with no context
- Fix:
  ```html
  <!-- Before: -->
  <input type="text" class="search-input" placeholder="Search doctors">

  <!-- After: -->
  <label for="doctor-search">Search doctors</label>
  <input type="text" id="doctor-search" class="search-input">
  ```

**2. Error messages not linked to fields — `/profile` (all 8 form fields)**
- Rule: `aria-describedby` | WCAG: 3.3.1 Error Identification (A)
- Pattern: Error messages exist visually but have no programmatic connection to fields
- Impact: Screen reader users do not hear errors when navigating between fields
- Fix:
  ```html
  <!-- Before: -->
  <input type="email" class="field">
  <p class="error">Invalid email address</p>

  <!-- After: -->
  <input type="email" id="email" aria-describedby="email-error" aria-invalid="true">
  <p id="email-error" role="alert">Invalid email address</p>
  ```

**3. Custom dropdown not keyboard accessible — `/appointments`**
- Rule: `button-name`, keyboard trap | WCAG: 2.1.1 Keyboard (A)
- Element: `<div class="specialty-dropdown">` — click-only, no `role`, no keyboard support
- Impact: Keyboard-only users cannot select appointment specialty
- Current implementation: div with `onclick` handler
- Fix: Implement `role="combobox"` pattern with arrow key navigation

**4. Images missing alt text — `/dashboard` (7 images)**
- Rule: `image-alt` | WCAG: 1.1.1 Non-text Content (A)
- Files: `<img src="doctor-photo-*.jpg">` — all using `alt=""`
- Impact: Photos of doctors are announced as blank — likely informative, not decorative
- Fix: Add descriptive alt text: `alt="Dr. Sarah Chen, Cardiologist"`

---

### Serious Violations (P1)

**5. Color contrast — muted text (22 occurrences)**
- Rule: `color-contrast` | WCAG: 1.4.3 Contrast Minimum (AA)
- Token: `--color-text-muted: #9CA3AF` on `--color-bg: #FFFFFF` = **2.53:1** (requires 4.5:1)
- Affected elements: timestamps, helper text, secondary labels throughout
- Fix: Darken `--color-text-muted` to `#6B7280` = 4.64:1 (passes)

**6. Focus indicator removed globally**
- WCAG: 2.4.7 Focus Visible (AA), 2.4.11 Focus Appearance (AA — 2.2)
- In `styles/globals.css:47`: `*:focus { outline: none; }`
- Impact: Keyboard users have no visual indication of focused element
- Fix:
  ```css
  /* Remove global outline: none */
  *:focus-visible {
    outline: 3px solid var(--color-brand-primary);
    outline-offset: 2px;
    border-radius: 2px;
  }
  ```

**7. Tab panel missing keyboard support**
- WCAG: 2.1.1 Keyboard (A)
- Component: `<TabGroup>` in `/appointments` — Tab key moves into tabpanel content, not between tabs
- Fix: Implement APG tablist keyboard pattern (arrow keys for tabs, Tab for content)

**8. Modal dialog does not trap focus**
- WCAG: 2.1.2 No Keyboard Trap (A) — inverted: focus SHOULD be trapped in modal
- Component: `<AppointmentModal>` — Tab navigates outside the modal into background page
- Fix: Implement focus trap (see body of knowledge)

---

### Moderate Violations (P2)

| ID | Location | Issue | WCAG | Fix |
|----|----------|-------|------|-----|
| M1 | /dashboard | Heading skips h1 → h3 | 1.3.1 | Add h2 for section |
| M2 | All pages | `<nav>` not labeled | 1.3.1 | `aria-label="Main"` |
| M3 | /messages | Time displayed but not announced | 1.3.1 | `<time datetime="2026-03-18">` |
| M4 | /profile | Password strength bar — no text | 1.3.3 | Add text: "Strength: Strong" |
| M5 | All pages | Icon buttons lack accessible names | 4.1.2 | `aria-label="Close"` on × buttons |

---

## Manual Testing Results [HECHO]

### Keyboard Navigation Test (Desktop Chrome)

- `/appointments`: Cannot access specialty dropdown, cannot submit form
- `/dashboard`: Can reach all content, logical tab order
- `/profile`: All fields reachable, but no focus indicator visible
- Modal: Cannot be closed by keyboard (no Escape handler)

### Screen Reader Test — NVDA 2024.2 + Firefox 124 [HECHO]

| Test | Expected | Actual |
|------|----------|--------|
| Page load — home | Announces "HealthTrack Dashboard, heading level 1" | Announces only "HealthTrack" — no heading |
| Tab to search input | Announces "Search appointments, edit text, required" | Announces "edit text" — no label |
| Form validation error | Error announced when field is left | Error not announced — only visible |
| Open modal | Announces "Schedule Appointment, dialog, modal" | Announces nothing — not a dialog element |

---

## WCAG 2.2 Specific Issues [HECHO]

| Criterion | Status | Finding |
|-----------|--------|---------|
| 2.4.11 Focus Appearance | FAIL | No focus indicator (`outline: none`) |
| 2.5.8 Target Size (24px) | PARTIAL | 6 icon buttons are 16×16px — below 24×24px minimum |
| 3.3.8 Accessible Auth | PASS | No CAPTCHA in login flow |

---

## Remediation Roadmap

| Sprint | Items | Effort | Compliance Impact |
|--------|-------|--------|-------------------|
| Sprint 1 | P1: labels, errors, focus indicator, alt text | 4 dev-days | WCAG A compliance |
| Sprint 2 | P1: keyboard dropdown, focus trap, tab keyboard | 4 dev-days | WCAG AA compliance |
| Sprint 3 | P2: heading hierarchy, nav labels, icon buttons | 3 dev-days | Full AA + 2.2 |

**Total**: 11 dev-days to WCAG 2.2 AA compliance

---

## CI Integration

```ts
// tests/accessibility.spec.ts — prevents regression
import AxeBuilder from '@axe-core/playwright';

test('no critical a11y violations on /appointments', async ({ page }) => {
  await page.goto('/appointments');
  const results = await new AxeBuilder({ page })
    .withTags(['wcag2a', 'wcag2aa', 'wcag22aa'])
    .analyze();
  const critical = results.violations.filter(v => ['critical','serious'].includes(v.impact));
  expect(critical).toHaveLength(0);
});
```
