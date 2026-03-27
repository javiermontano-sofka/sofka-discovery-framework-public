---
name: accessibility-implementation
author: "Javier Montaño (JM Labs)"
version: "2.0.0"
description: >
  Implement WCAG 2.1 AA / 2.2 accessibility: semantic HTML audit, ARIA implementation,
  keyboard navigation, screen reader testing, color contrast. Use when user asks to
  "implement accessibility", "fix a11y issues", "make WCAG compliant", or "audit for accessibility".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
tags: [accessibility, WCAG, ARIA, keyboard-navigation, screen-readers, color-contrast, a11y]
moat-level: L3
---

# Accessibility Implementation

Implement web accessibility to WCAG 2.1 AA standard (with WCAG 2.2 additions)
through semantic HTML, correct ARIA usage, keyboard operability, and screen reader compatibility.

## Guiding Principle

> *"ARIA is a repair tool, not a building material. Use semantic HTML first.
> Add ARIA only where HTML semantics are insufficient."*

---

## Procedure

### Step 1 — Automated Audit [HECHO]

1. Run axe DevTools browser extension on key pages — record all violations by impact level.
2. Run `npx axe-core` in CI against Playwright-rendered pages:
   ```js
   const { axe } = require('@axe-core/playwright');
   const results = await axe(page);
   expect(results.violations).toHaveLength(0);
   ```
3. Run Lighthouse Accessibility audit — note score and failing criteria.
4. Run `npx eslint-plugin-jsx-a11y` if React project — catches compile-time issues.
5. **Important**: Automated tools catch ~30-40% of WCAG failures. Manual testing is required.
6. Tag all findings with `[HECHO]` + tool name and severity (critical/serious/moderate/minor).

### Step 2 — Semantic HTML Audit

1. Check heading hierarchy: one `<h1>` per page, no skipped levels (h1→h3 without h2).
2. Verify landmark regions: `<header>`, `<nav>`, `<main>`, `<footer>`, `<aside>`, `<section>` with labels.
3. Ensure interactive elements use correct tags:
   - Click actions → `<button>` (not `<div onclick>`)
   - Navigation → `<a href>` (not `<button>` or `<div>`)
   - Form inputs → `<input>`, `<select>`, `<textarea>` (not custom styled divs)
4. Check that tables use `<th scope="col/row">` and `<caption>`.
5. Verify lists use `<ul>/<ol>/<li>` not styled `<div>` elements.
6. Check that `<img>` has meaningful `alt` text (not "" for informative images, "" only for decorative).

### Step 3 — ARIA Implementation

1. **Use ARIA only when HTML is insufficient.** Rule: first try to use the native HTML element.
2. For custom widgets, implement the correct ARIA role + required states + keyboard pattern:

   | Widget | Role | Key States | Keyboard Pattern |
   |--------|------|------------|-----------------|
   | Custom checkbox | `checkbox` | `aria-checked` | Space to toggle |
   | Accordion | `button` in `<h3>` | `aria-expanded` | Enter/Space |
   | Tab panel | `tablist/tab/tabpanel` | `aria-selected` | Arrow keys navigate tabs |
   | Modal dialog | `dialog` | `aria-modal`, `aria-labelledby` | Trap focus inside |
   | Combobox | `combobox` | `aria-expanded`, `aria-activedescendant` | Arrow keys, Escape |
   | Alert | `alert` | — (live region) | Auto-announced |

3. Add `aria-label` or `aria-labelledby` to landmark regions with multiple of same type.
4. Use `aria-describedby` for error messages linked to form fields.
5. Use `aria-live="polite"` for dynamic content updates (status messages, search results count).
6. Use `aria-live="assertive"` sparingly — only for critical, time-sensitive alerts.

### Step 4 — Keyboard Navigation

1. Verify all interactive elements are reachable via Tab key.
2. Check Tab order matches visual order (avoid `tabindex > 0`).
3. Verify `tabindex="-1"` is used only for programmatically focused elements.
4. Implement focus trap for modal dialogs:
   ```js
   // Focus trap: keep focus inside modal
   const focusable = modal.querySelectorAll(
     'a[href], button:not([disabled]), input, select, textarea, [tabindex="0"]'
   );
   const first = focusable[0];
   const last = focusable[focusable.length - 1];
   last.addEventListener('keydown', (e) => {
     if (e.key === 'Tab' && !e.shiftKey) { e.preventDefault(); first.focus(); }
   });
   ```
5. Ensure custom dropdowns/menus implement correct arrow key navigation.
6. Verify Escape closes modals, popovers, and drawers.
7. Check that skip-to-content link exists and is the first focusable element.

### Step 5 — Color Contrast

1. Test all text against WCAG 1.4.3:
   - Normal text (< 18pt / < 14pt bold): minimum contrast ratio 4.5:1
   - Large text (≥ 18pt / ≥ 14pt bold): minimum contrast ratio 3:1
2. Test UI components and graphical objects (WCAG 1.4.11): 3:1 minimum.
3. Test focus indicators (WCAG 2.4.11 — new in 2.2): focus ring must have 3:1 contrast vs. adjacent colors.
4. Tools: `color-contrast-checker.app`, `coolors.co/contrast-checker`, browser DevTools.
5. Check design tokens: if `--color-text-muted` fails on `--color-bg-surface`, fix at token level.
6. Verify contrast in both light and dark mode.

### Step 6 — Screen Reader Testing

1. **NVDA + Firefox** (Windows) — most common screen reader/browser combo.
2. **JAWS + Chrome** (Windows) — enterprise/government standard.
3. **VoiceOver + Safari** (macOS/iOS) — WebKit-based, different behaviors.
4. **TalkBack + Chrome** (Android) — mobile screen reader.
5. Test script for each page:
   - Land on page: what is announced?
   - Navigate by headings (H key in NVDA/JAWS): logical structure?
   - Navigate by landmarks (D key): all sections accessible?
   - Tab through interactive elements: all labeled correctly?
   - Activate each interactive element: correct action + feedback?
   - Submit form with errors: error messages announced?
6. Record findings with screen reader name, browser, OS, and exact announcement.

### Step 7 — Focus Management

1. When opening a modal: move focus to first interactive element inside.
2. When closing a modal: return focus to the trigger element.
3. After page navigation (SPA): move focus to `<h1>` or new content heading.
4. After form submission: announce success/error and move focus to message.
5. For infinite scroll: announce new content loaded, do not move focus unexpectedly.

---

## Decision Framework

### ARIA Role Selection

| Need | Correct ARIA | Wrong Approach |
|------|-------------|----------------|
| Toggle button | `<button aria-pressed>` | `<div role="button">` with click handler |
| Navigation | `<nav>` (no ARIA needed) | `<div role="navigation">` |
| Progress | `role="progressbar" aria-valuenow aria-valuemin aria-valuemax` | Text "Loading..." only |
| Error message | `role="alert"` or `aria-describedby` on field | Red text with no ARIA connection |
| Dynamic update | `aria-live="polite"` | No announcement |

### WCAG 2.2 New Criteria

| Criterion | Level | What Changed |
|-----------|-------|-------------|
| 2.4.11 Focus Appearance | AA | Focus indicators must have 3:1 contrast |
| 2.4.12 Focus Appearance (Enhanced) | AAA | Larger focus indicator requirements |
| 2.5.7 Dragging Movements | AA | Draggable operations need non-drag alternative |
| 2.5.8 Target Size (Minimum) | AA | 24×24px minimum (up from 44×44 as guideline) |
| 3.2.6 Consistent Help | A | Help mechanism in same location across pages |
| 3.3.7 Redundant Entry | A | Don't ask users to re-enter data already provided |
| 3.3.8 Accessible Authentication | AA | No cognitive tests unless alternative provided |

---

## Anti-Patterns

1. **ARIA role without keyboard support** — `role="button"` on a `<div>` without `keydown` handler for Enter/Space is broken. Use `<button>`.
2. **`aria-label` on non-interactive elements** — Labels are for interactive elements and landmarks. Adding them to paragraphs confuses screen readers.
3. **Empty `alt=""` on informative images** — Screen readers skip empty alt. Decorative images get `alt=""`, informative images get descriptive alt text.
4. **`tabindex="1"` (or any positive value)** — Creates a separate, confusing tab order. Use `tabindex="0"` or `-1` only.
5. **Focus trap without escape route** — Modals must have an Escape key listener that closes and returns focus.
6. **Color as only differentiator** — WCAG 1.4.1: don't convey information by color alone. Add icon, pattern, or text.
7. **`display: none` for skip links** — They become unfocusable. Use `position: absolute; left: -9999px` and reveal on focus.
8. **Generic `aria-label="icon"`** — Icon buttons must describe action, not appearance: `aria-label="Close dialog"` not `aria-label="X"`.

---

## Output Artifacts

- `accessibility-audit-{date}.md` — Findings with severity and WCAG criterion
- `tests/accessibility.spec.ts` — axe-core automated test suite
- `docs/keyboard-navigation-map.md` — Keyboard interaction documentation
- `ADR-A11Y-001.md` — Accessibility architecture decisions
