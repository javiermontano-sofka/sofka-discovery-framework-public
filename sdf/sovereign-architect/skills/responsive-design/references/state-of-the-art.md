# State of the Art: Responsive Design (2025–2026)

## Baseline 2024 — Universally Available

- CSS Container Queries — Chrome 105, Firefox 110, Safari 16 (Baseline 2023)
- CSS `clamp()` — universal
- CSS `aspect-ratio` — universal
- CSS Grid with `auto-fit`/`auto-fill` — universal
- `srcset` and `sizes` on `<img>` — universal
- `<picture>` element — universal
- `loading="lazy"` on images — universal
- CSS Logical Properties (`margin-inline`, `padding-block`) — universal

---

## Significant 2024–2025 Changes

### INP Replaced FID in Core Web Vitals (March 2024)
- First Input Delay measured only the first interaction
- Interaction to Next Paint measures the worst interaction in the session
- Responsive design affects INP: heavy layouts cause slow rendering during interactions

### Container Query Style Queries
- Chrome 111+, Firefox 129+, Safari 17.2+
- Components react to CSS custom property values of their container:
  ```css
  @container style(--layout: compact) {
    .card { font-size: var(--text-sm); padding: var(--space-2); }
  }
  @container style(--layout: feature) {
    .card { font-size: var(--text-xl); padding: var(--space-8); }
  }
  ```
- Enables "context-aware" components without prop drilling

### Container Query Range Syntax (2024)
- More readable conditions:
  ```css
  @container card (200px <= inline-size <= 600px) { /* ... */ }
  @container card (inline-size > 400px) { /* ... */ }
  ```

### `@media` Range Syntax (Baseline 2023)
- Cleaner than `min-width`/`max-width`:
  ```css
  @media (width >= 640px) { /* ... */ }
  @media (600px <= width <= 1200px) { /* ... */ }
  ```

---

## Responsive Images Evolution

### AVIF Format Adoption
- Browser support: Chrome 85+, Firefox 93+, Safari 16.1+ — Baseline 2022
- 30-50% smaller than WebP at same quality
- Preferred format for 2025 projects:
  ```html
  <picture>
    <source type="image/avif" srcset="image.avif 1x, image-2x.avif 2x">
    <source type="image/webp" srcset="image.webp 1x, image-2x.webp 2x">
    <img src="image.jpg" alt="...">
  </picture>
  ```

### `fetchpriority` Attribute (Baseline 2023)
- `fetchpriority="high"` — critical resource, boost priority
- `fetchpriority="low"` — non-critical, reduce priority
- Key for LCP optimization: mark hero image as high priority

### View Transitions API
- Chrome 111+ (same-document), Chrome 126+ (cross-document)
- Firefox and Safari adding support in 2025
- Smooth transitions between page states:
  ```js
  document.startViewTransition(() => {
    navigateTo('/next-page');
  });
  ```
- Enables app-like transitions on the web

---

## Layout Advances

### CSS Subgrid (Baseline 2023)
- Grid children can participate in parent's grid tracks
- Enables consistent alignment across card grids without JavaScript:
  ```css
  .card-grid { display: grid; grid-template-columns: repeat(3, 1fr); }
  .card {
    display: grid;
    grid-row: span 3;
    grid-template-rows: subgrid; /* inherit parent track sizes */
  }
  .card-title, .card-body, .card-footer { /* align across all cards */ }
  ```

### `text-wrap: balance` and `text-wrap: pretty`
- Chrome 114+, Firefox 121+, Safari 17.5+
- `balance`: equal line lengths in headings (browser-native, no JS)
- `pretty`: avoids orphans in body text
  ```css
  h1, h2, h3 { text-wrap: balance; }
  p { text-wrap: pretty; }
  ```

### CSS `@layer` + `@scope` for Responsive Components
- Combine layers with scope for architecture-level responsiveness:
  ```css
  @layer components {
    @scope (.card) {
      :scope { padding: var(--space-4); }
      @container (min-width: 400px) { :scope { padding: var(--space-8); } }
    }
  }
  ```

---

## Testing Evolution

### Playwright Visual Regression (2025 standard)
- `toHaveScreenshot()` — pixel-perfect cross-browser visual testing
- `--update-snapshots` flag to update baselines
- Integrated with CI/CD

### CSS `:has()` Eliminates Media Query Hacks
- Select parent based on child presence — previously JS-only:
  ```css
  /* Card with image gets different layout */
  .card:has(img) { display: grid; grid-template-columns: auto 1fr; }
  /* Container with many items gets compact spacing */
  .list:has(:nth-child(10)) .list-item { padding-block: var(--space-1); }
  ```

---

## What to Adopt Now

| Technology | Status | Adoption |
|-----------|--------|----------|
| Container queries | Baseline 2023 | All new component-level responsive work |
| `clamp()` typography | Universal | All font sizes |
| CSS Subgrid | Baseline 2023 | Card layouts, form alignment |
| `text-wrap: balance` | Chrome 114+ / Safari 17.5 | All headings |
| AVIF images | Baseline 2022 | Replace WebP as primary format |
| `fetchpriority` | Baseline 2023 | All LCP images |
| View Transitions | Chrome 111+ | SPAs and page navigation |
| Style queries | Chrome 111+ / Firefox 129 | Context-aware components |

---

## What's Fading Out

- JavaScript resize observers for responsive components — use container queries
- Float-based layouts — CSS Grid/Flexbox
- `em`-based breakpoints without token system — use named token values
- `srcset` with only `x` descriptors — use `w` descriptors + `sizes`
- `font-size: 62.5%` hack on html — just use `rem` naturally
