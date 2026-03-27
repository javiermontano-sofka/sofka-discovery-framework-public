# State of the Art: Accessibility Implementation (2025–2026)

## WCAG 2.2 — Official Since October 2023

WCAG 2.2 is the current normative standard. Key additions over WCAG 2.1:

### New Success Criteria (All Level AA unless noted)

| Criterion | Level | What it Requires |
|-----------|-------|-----------------|
| 2.4.11 Focus Appearance | AA | Focus indicators must have 3:1 contrast ratio vs. adjacent colors AND area of 2px perimeter of unfocused component |
| 2.4.12 Focus Appearance (Enhanced) | AAA | Focus indicator area ≥ unfocused component area |
| 2.5.7 Dragging Movements | AA | All drag operations need a single-pointer alternative |
| 2.5.8 Target Size (Minimum) | AA | 24×24px CSS minimum (exceptions for inline text, browser default, essential) |
| 3.2.6 Consistent Help | A | Help link/mechanism in same relative location across pages |
| 3.3.7 Redundant Entry | A | Information previously entered and still needed is auto-populated or selectable |
| 3.3.8 Accessible Authentication (Minimum) | AA | No cognitive function test (puzzles, transcription) without alternative |
| 3.3.9 Accessible Authentication (Enhanced) | AAA | No cognitive function test at all |

### WCAG 2.2 Focus Appearance Implementation

```css
/* Default browser focus ring — often fails 2.4.11 */
:focus { outline: auto; } /* Not predictable */

/* WCAG 2.2 compliant custom focus indicator */
:focus-visible {
  outline: 3px solid var(--color-brand-primary); /* ≥ 2px */
  outline-offset: 2px;
  border-radius: 2px;
  /* Ensure 3:1 contrast ratio between outline and adjacent colors */
}

/* For dark backgrounds: use a double ring */
:focus-visible {
  outline: 3px solid #005fcc;
  box-shadow: 0 0 0 6px white; /* white halo ensures contrast on any bg */
}
```

### WCAG 2.2 Target Size (2.5.8)

```css
/* 24x24px minimum for interactive elements */
/* WCAG 2.5.5 AAA recommends 44x44px */

/* Solution 1: Add padding */
.action-icon {
  padding: 0.5rem;
  min-width: 24px;
  min-height: 24px;
}

/* Solution 2: Expand hit area with pseudo-element */
.action-icon {
  position: relative;
}
.action-icon::before {
  content: '';
  position: absolute;
  inset: max(0px, (24px - 100%) / 2); /* expand to 24px if smaller */
}
```

---

## ARIA APG (Authoring Practices Guide) — 2024 Updates

The ARIA APG (formerly "best practices") was renamed and restructured in 2024:

### New Pattern Guidance

**Combobox Pattern (updated 2024)**
- Inline autocomplete: `aria-autocomplete="inline"`
- List autocomplete: `aria-autocomplete="list"`
- Required: `aria-expanded`, `aria-activedescendant` on input
- Required: `role="listbox"` with `role="option"` children

**Breadcrumb Pattern**
- Container: `<nav aria-label="Breadcrumb">`
- Current page: `<a aria-current="page">Current</a>`

**Disclosure Pattern (Accordion)**
- Button must be in heading: `<h3><button aria-expanded="false">Title</button></h3>`
- Avoid `role="button"` on non-button elements

---

## Testing Tool Advances (2024–2025)

### axe-core v4.9+ (2024)
- New WCAG 2.2 rules: focus-appearance, target-size checks
- `best-practice` tag for non-normative but important checks
- ACT rules alignment (W3C-standardized automated tests)

### Playwright Accessibility Testing
```ts
// axe-core/playwright v4 — async API
import AxeBuilder from '@axe-core/playwright';

const results = await new AxeBuilder({ page })
  .withTags(['wcag2a', 'wcag2aa', 'wcag21aa', 'wcag22aa'])
  .disableRules(['color-contrast']) // handle manually
  .analyze();
```

### Storybook a11y Addon
- Visual accessibility testing during component development
- axe-core integration in Storybook stories
- Prevents regressions before component reaches app

### AI-assisted accessibility auditing (2025)
- Tools like Deque's Axe Assistant and Microsoft's AccessScan use LLMs to identify issues automated tools miss
- Focus on ARIA description quality, alt text meaningfulness, cognitive load

---

## Screen Reader Evolution

### NVDA 2024 Updates
- Improved virtual browsing mode
- Better support for ARIA live regions in complex SPAs
- Enhanced table navigation

### VoiceOver + iOS 17–18
- Improved support for `aria-details` (links to extended description)
- Better handling of `dialog` and `aria-modal`
- New: VoiceOver can read SSML hints for improved announcement

### JAWS 2024
- ARIA 1.2 support improvements
- Better combobox pattern support
- Graphics labeling improvements

---

## ARIA 1.3 (Draft)

Currently in draft — expect stable version 2025/2026:

- **`aria-braillelabel`** — Custom braille text for braille displays
- **`aria-brailledescription`** — Extended braille description
- **`aria-details` improvements** — Better linking to extended descriptions
- **`aria-colindextext` / `aria-rowindextext`** — Human-readable cell position in large tables
- **`role="suggestion"`, `role="comment"`** — For collaborative editing UIs

---

## Cognitive Accessibility (WCAG 3.0 Preview)

WCAG 3.0 is in development, with cognitive accessibility as a major focus:

- **Plain language** — Reading level appropriate to audience
- **Consistent navigation** — Predictable patterns
- **Clear error recovery** — Specific, actionable error messages
- **Chunking** — Break long processes into steps
- **COGA (Cognitive and Learning Disabilities) Guidelines** — Separate W3C document now informing WCAG 3.0

---

## EU Accessibility Act (June 2025)

The European Accessibility Act requires digital products sold in the EU to meet WCAG 2.1 AA:
- Effective June 28, 2025
- Covers: e-commerce, banking, transport, e-books, streaming media
- Penalties vary by member state
- Organizations must have an Accessibility Statement and a feedback mechanism

---

## What to Implement Now

| Change | Priority | Effort |
|--------|----------|--------|
| WCAG 2.2 Focus Appearance (2.4.11) | High — AA | Low — CSS only |
| WCAG 2.2 Target Size (2.5.8) | High — AA | Low — CSS padding |
| WCAG 2.2 Accessible Auth (3.3.8) | High — AA | Medium — UX redesign if CAPTCHA used |
| axe-core v4.9 with wcag22aa tag | High | Low — update CI test |
| ARIA APG combobox pattern update | Medium | Medium — JS changes |
| EU Accessibility Statement | High for EU products | Low — document |
