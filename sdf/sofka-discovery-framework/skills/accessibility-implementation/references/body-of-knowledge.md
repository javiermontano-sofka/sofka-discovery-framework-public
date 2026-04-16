# Body of Knowledge: Accessibility Implementation

## 1. WCAG 2.1 AA Criteria — Developer Checklist

### Perceivable

| Criterion | Level | Requirement | HTML Pattern |
|-----------|-------|-------------|-------------|
| 1.1.1 Non-text Content | A | All images have alt text | `<img alt="description">` or `alt=""` for decorative |
| 1.3.1 Info and Relationships | A | Structure conveyed programmatically | Semantic HTML: `<h1>`, `<nav>`, `<table>` with `<th scope>` |
| 1.3.2 Meaningful Sequence | A | Reading order matches visual order | Logical DOM order, no `order` CSS tricks |
| 1.3.3 Sensory Characteristics | A | No instruction by shape/color/location alone | Add text alongside icons |
| 1.4.1 Use of Color | A | Color not only differentiator | Add icons, patterns, or text alongside color |
| 1.4.3 Contrast (Minimum) | AA | 4.5:1 normal text, 3:1 large text | Test all text/background combinations |
| 1.4.4 Resize Text | AA | Text resizable to 200% without loss | No `max-height` on text containers; `rem` units |
| 1.4.5 Images of Text | AA | Use real text, not text in images | — |
| 1.4.10 Reflow | AA | Content reflowable at 320px width | No horizontal scroll; responsive layout |
| 1.4.11 Non-text Contrast | AA | UI components 3:1 vs background | Check button borders, form field outlines, icons |
| 1.4.12 Text Spacing | AA | No content lost with custom spacing | Avoid fixed heights on text elements |
| 1.4.13 Content on Hover/Focus | AA | Hoverable, dismissible, persistent | Tooltips must not disappear when moused over |

### Operable

| Criterion | Level | Requirement | Implementation |
|-----------|-------|-------------|---------------|
| 2.1.1 Keyboard | A | All functionality via keyboard | No mouse-only event handlers |
| 2.1.2 No Keyboard Trap | A | Focus can leave any component | Escape key closes modals/dropdowns |
| 2.4.1 Bypass Blocks | A | Skip to main content link | `<a href="#main">Skip to content</a>` as first link |
| 2.4.2 Page Titled | A | Descriptive page title | `<title>Page Name — Site Name</title>` |
| 2.4.3 Focus Order | A | Focus order preserves meaning | Logical tab order; avoid `tabindex > 0` |
| 2.4.4 Link Purpose | A | Links understandable in context | Meaningful link text; `aria-label` for icon links |
| 2.4.6 Headings and Labels | AA | Descriptive headings and labels | `<label for="id">` or `aria-label` on inputs |
| 2.4.7 Focus Visible | AA | Keyboard focus indicator visible | Never `outline: none` without replacement |
| 2.4.11 Focus Appearance | AA (2.2) | Focus indicator 3:1 contrast | Custom focus ring with sufficient contrast |
| 2.5.3 Label in Name | A | Accessible name contains visible text | `aria-label` should include visible button text |
| 2.5.8 Target Size | AA (2.2) | 24×24px minimum target area | Padding or pseudo-element expansion |

### Understandable

| Criterion | Level | Requirement | Implementation |
|-----------|-------|-------------|---------------|
| 3.1.1 Language of Page | A | Page language set | `<html lang="en">` |
| 3.2.1 On Focus | A | No context change on focus | No auto-submit on focus |
| 3.2.2 On Input | A | No unexpected context change | Warn before auto-navigation |
| 3.3.1 Error Identification | A | Errors described in text | `aria-describedby` linking error message to field |
| 3.3.2 Labels or Instructions | A | Form inputs labeled | `<label>` elements; instructions before forms |

---

## 2. ARIA Reference

### Core ARIA Roles

```html
<!-- Landmark roles (prefer native HTML equivalents) -->
<div role="banner">       <!-- <header> -->
<div role="navigation">   <!-- <nav> -->
<div role="main">         <!-- <main> -->
<div role="contentinfo">  <!-- <footer> -->
<div role="complementary"> <!-- <aside> -->
<div role="search">       <!-- no native equivalent -->
<div role="form">         <!-- <form> when labeled -->

<!-- Widget roles -->
<div role="button">       <!-- use <button> instead -->
<div role="checkbox">     <!-- use <input type="checkbox"> instead -->
<div role="dialog">       <!-- for modal dialogs -->
<div role="alert">        <!-- for live error/success messages -->
<div role="status">       <!-- for non-urgent status updates -->
<div role="tablist">      <!-- tab container -->
<div role="tab">          <!-- individual tab -->
<div role="tabpanel">     <!-- tab content -->
<div role="combobox">     <!-- autocomplete input -->
<div role="listbox">      <!-- options list in combobox -->
<div role="option">       <!-- individual option -->
<div role="progressbar">  <!-- progress indicator -->
<div role="slider">       <!-- range input -->
<div role="spinbutton">   <!-- numeric stepper -->
<div role="tree">         <!-- tree widget (file browser) -->
<div role="treeitem">     <!-- item in tree -->
```

### ARIA States and Properties

```html
<!-- Boolean states -->
<button aria-pressed="true">Bold</button>
<button aria-expanded="false" aria-controls="menu-id">Menu</button>
<input  aria-required="true">
<input  aria-invalid="true" aria-describedby="error-id">
<div    aria-hidden="true"><!-- decorative, hide from AT --></div>
<div    aria-disabled="true">Disabled item</div>
<div    aria-checked="mixed">Indeterminate checkbox</div>
<div    aria-selected="true">Selected option</div>

<!-- ID references -->
<h2 id="dialog-title">Delete Item</h2>
<div role="dialog" aria-labelledby="dialog-title" aria-modal="true">

<p id="hint-text">Must be at least 8 characters</p>
<input aria-describedby="hint-text error-text">
<p id="error-text" role="alert">Password is too short</p>

<!-- Value properties -->
<div role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" aria-valuetext="60 percent complete">
<div role="slider" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" aria-label="Volume">

<!-- Live regions -->
<div aria-live="polite">Search returned 42 results</div>
<div aria-live="assertive" role="alert">Form submission failed</div>
<div aria-live="polite" aria-atomic="true">Timer: 4:32</div>
```

---

## 3. Keyboard Interaction Patterns (ARIA APG)

### Modal Dialog

```js
class ModalManager {
  open(modal) {
    modal.removeAttribute('hidden');
    modal.setAttribute('aria-modal', 'true');

    // Save reference to trigger
    this.triggerElement = document.activeElement;

    // Move focus to first focusable element
    const focusable = this.getFocusable(modal);
    focusable[0]?.focus();

    // Set up focus trap
    modal.addEventListener('keydown', this.trapFocus.bind(this));
    document.addEventListener('keydown', this.handleEscape.bind(this));
  }

  close(modal) {
    modal.setAttribute('hidden', '');
    modal.removeEventListener('keydown', this.trapFocus);
    document.removeEventListener('keydown', this.handleEscape);

    // Return focus to trigger
    this.triggerElement?.focus();
  }

  trapFocus(e) {
    const focusable = this.getFocusable(e.currentTarget);
    const first = focusable[0];
    const last = focusable[focusable.length - 1];

    if (e.key === 'Tab') {
      if (e.shiftKey && document.activeElement === first) {
        e.preventDefault(); last.focus();
      } else if (!e.shiftKey && document.activeElement === last) {
        e.preventDefault(); first.focus();
      }
    }
  }

  handleEscape(e) {
    if (e.key === 'Escape') this.close(document.querySelector('[role="dialog"]'));
  }

  getFocusable(container) {
    return [...container.querySelectorAll(
      'a[href], button:not([disabled]), input:not([disabled]), select, textarea, [tabindex="0"]'
    )];
  }
}
```

### Custom Tabs Widget

```html
<div>
  <div role="tablist" aria-label="Account settings">
    <button role="tab" id="tab-profile"   aria-selected="true"  aria-controls="panel-profile">Profile</button>
    <button role="tab" id="tab-security"  aria-selected="false" aria-controls="panel-security" tabindex="-1">Security</button>
    <button role="tab" id="tab-billing"   aria-selected="false" aria-controls="panel-billing"  tabindex="-1">Billing</button>
  </div>
  <div role="tabpanel" id="panel-profile"  aria-labelledby="tab-profile">...</div>
  <div role="tabpanel" id="panel-security" aria-labelledby="tab-security" hidden>...</div>
  <div role="tabpanel" id="panel-billing"  aria-labelledby="tab-billing"  hidden>...</div>
</div>
```

```js
// Arrow key navigation for tablist
tablist.addEventListener('keydown', (e) => {
  const tabs = [...tablist.querySelectorAll('[role="tab"]')];
  const index = tabs.indexOf(document.activeElement);

  if (e.key === 'ArrowRight') {
    const next = tabs[(index + 1) % tabs.length];
    activateTab(next);
  } else if (e.key === 'ArrowLeft') {
    const prev = tabs[(index - 1 + tabs.length) % tabs.length];
    activateTab(prev);
  } else if (e.key === 'Home') {
    activateTab(tabs[0]);
  } else if (e.key === 'End') {
    activateTab(tabs[tabs.length - 1]);
  }
});
```

---

## 4. Accessible Forms

```html
<form>
  <!-- Group related fields -->
  <fieldset>
    <legend>Billing address</legend>

    <!-- Label always associated with input -->
    <div>
      <label for="street">Street address <span aria-hidden="true">*</span></label>
      <span id="street-required" class="sr-only">required</span>
      <input
        type="text"
        id="street"
        name="street"
        autocomplete="street-address"
        aria-required="true"
        aria-describedby="street-required street-error"
      >
      <!-- Error: hidden until validation fails -->
      <p id="street-error" role="alert" aria-live="polite" hidden>
        Street address is required
      </p>
    </div>
  </fieldset>

  <!-- Inline error after failed submit -->
  <div role="alert" aria-live="assertive" id="form-error" hidden>
    Please fix the 3 errors below before submitting.
  </div>

  <button type="submit">Save address</button>
</form>
```

---

## 5. Color Contrast Calculation

```js
// Calculate relative luminance (WCAG formula)
function getLuminance(hex) {
  const rgb = hex.match(/\w\w/g).map(x => parseInt(x, 16) / 255);
  const [r, g, b] = rgb.map(c =>
    c <= 0.03928 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4)
  );
  return 0.2126 * r + 0.7152 * g + 0.0722 * b;
}

function getContrastRatio(hex1, hex2) {
  const l1 = getLuminance(hex1);
  const l2 = getLuminance(hex2);
  const lighter = Math.max(l1, l2);
  const darker  = Math.min(l1, l2);
  return (lighter + 0.05) / (darker + 0.05);
}

// Usage
const ratio = getContrastRatio('#ffffff', '#767676');
// ratio = 4.54 → passes AA for normal text (4.5:1)
```

---

## 6. Automated Testing Integration

```ts
// tests/accessibility.spec.ts — axe-core + Playwright
import { test, expect } from '@playwright/test';
import AxeBuilder from '@axe-core/playwright';

test.describe('Accessibility', () => {
  const pages = ['/', '/about', '/contact', '/dashboard'];

  for (const path of pages) {
    test(`${path} has no critical a11y violations`, async ({ page }) => {
      await page.goto(path);
      await page.waitForLoadState('networkidle');

      const results = await new AxeBuilder({ page })
        .withTags(['wcag2a', 'wcag2aa', 'wcag21aa'])
        .analyze();

      const critical = results.violations.filter(v => v.impact === 'critical');
      expect(critical, JSON.stringify(critical, null, 2)).toHaveLength(0);
    });
  }

  test('modal dialog traps focus', async ({ page }) => {
    await page.goto('/');
    await page.click('[data-testid="open-modal"]');
    await expect(page.locator('[role="dialog"]')).toBeVisible();

    // Tab should cycle within modal
    await page.keyboard.press('Tab');
    const focusedInModal = await page.evaluate(() => {
      const modal = document.querySelector('[role="dialog"]');
      return modal?.contains(document.activeElement);
    });
    expect(focusedInModal).toBe(true);

    // Escape closes modal
    await page.keyboard.press('Escape');
    await expect(page.locator('[role="dialog"]')).not.toBeVisible();
  });
});
```

---

## 7. Skip Links and Focus Management (SPA)

```html
<!-- First element in <body> — visible only on focus -->
<a href="#main-content" class="skip-link">Skip to main content</a>

<style>
.skip-link {
  position: absolute;
  left: -9999px;
  top: 1rem;
  z-index: 9999;
  background: var(--color-brand-primary);
  color: white;
  padding: 0.5rem 1rem;
  border-radius: 0.25rem;
  text-decoration: none;
}
.skip-link:focus { left: 1rem; }
</style>
```

```ts
// SPA route change: announce and move focus
function announceRouteChange(pageTitle: string) {
  // Announce to screen readers
  const announcer = document.getElementById('route-announcer');
  if (announcer) {
    announcer.textContent = '';
    // Timeout required for announcement to fire
    setTimeout(() => { announcer.textContent = `Navigated to ${pageTitle}`; }, 100);
  }

  // Move focus to page heading
  const h1 = document.querySelector('h1');
  if (h1) {
    h1.tabIndex = -1;
    h1.focus();
  }
}
```
