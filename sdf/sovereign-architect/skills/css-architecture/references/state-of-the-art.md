# State of the Art: CSS Architecture (2025–2026)

## Baseline 2024 — What's Universally Available

All of the following have achieved "Baseline Widely Available" status (supported for 2.5+ years):
- CSS Container Queries (`container-type`, `@container`) — Chrome 105, Firefox 110, Safari 16
- CSS Cascade Layers (`@layer`) — Chrome 99, Firefox 97, Safari 15.4
- CSS Custom Properties (variables) — universal
- CSS `:has()` pseudo-class — Chrome 105, Firefox 121, Safari 15.4
- CSS `aspect-ratio` — universal
- CSS Grid subgrid — Chrome 117, Firefox 71, Safari 16

---

## Emerging in 2025–2026

### CSS @scope (Scoped Styles)
- Chrome 118+, Firefox 128+, Safari 17.4+
- Enables native scoped styles without CSS Modules or BEM
- Supports lower-boundary `@scope (.a) to (.b)` — styles apply between ancestors
- Polyfill available via `@oddbird/css-scope-inline`

### CSS Nesting (Native)
- Baseline 2024 — Chrome 120, Firefox 117, Safari 17.2
- No preprocessor needed for nested selectors:
  ```css
  .card {
    color: var(--color-text);
    &:hover { color: var(--color-brand); }
    & .title { font-size: var(--text-xl); }
    @media (min-width: 640px) { display: flex; }
  }
  ```

### Tailwind CSS v4 (released 2025)
- No `tailwind.config.js` — all config in CSS via `@theme`
- Rust-based Lightning CSS engine (10x faster builds)
- Native CSS cascade layers integration
- `@utility` and `@variant` directives for extensibility
- `@source` replaces `content` array
- P3 color support with `oklch()` colors by default

### CSS `color-mix()` Function
- Baseline 2024 — universally available
- Mix colors in any color space: `color-mix(in oklch, var(--color-brand) 30%, white)`
- Enables tint/shade generation without preprocessors

### CSS `oklch()` and `oklch` Color Space
- Perceptually uniform — equal lightness steps look equal to human eye
- Better for design tokens than hex/hsl:
  ```css
  :root {
    --color-brand-500: oklch(60% 0.15 250);
    --color-brand-600: oklch(52% 0.15 250); /* just decrease L */
  }
  ```
- Tailwind v4 defaults to oklch for all colors

### CSS `@starting-style`
- Chrome 117+, Firefox 129+, Safari 17.5+
- Defines styles for elements entering the DOM — enables entry animations without JS:
  ```css
  @starting-style {
    .popover { opacity: 0; transform: translateY(-8px); }
  }
  .popover {
    opacity: 1; transform: translateY(0);
    transition: opacity 0.2s, transform 0.2s;
  }
  ```

### CSS `overlay` Property
- Chrome 117+ — part of `@starting-style` + `display: none` transition support
- Allows `display: none` to be transitioned (previously impossible)

### Native CSS Anchor Positioning
- Chrome 125+, partial Firefox/Safari support (2025)
- Position elements relative to any anchor, not just containing block:
  ```css
  .tooltip {
    position-anchor: --button;
    top: anchor(bottom);
    left: anchor(left);
  }
  ```
- Will replace most `popper.js`/`floating-ui` use cases

### CSS `@property` (Registered Custom Properties)
- Baseline 2024 — fully available
- Typed, animatable custom properties:
  ```css
  @property --rotation {
    syntax: '<angle>';
    initial-value: 0deg;
    inherits: false;
  }
  .spinner { animation: spin 1s linear infinite; }
  @keyframes spin { to { --rotation: 360deg; } }
  ```

---

## Design Token Evolution

### Style Dictionary v4 (2025)
- ESM-first, async transforms
- Native TypeScript support
- Platform-agnostic reference resolution
- New parser API for custom token formats

### Token JSON Schema Standardization
- DTCG (Design Token Community Group) format gaining adoption
- `$value`, `$type`, `$description` convention
- Figma, Style Dictionary, Theo all targeting DTCG format:
  ```json
  {
    "color": {
      "brand": {
        "primary": { "$value": "#3b82f6", "$type": "color", "$description": "Primary brand color" }
      }
    }
  }
  ```

---

## What to Adopt Now (Recommended)

| Technology | Adoption Recommendation |
|-----------|------------------------|
| CSS Layers | Use in all new projects — baseline, universal |
| CSS Nesting | Use in all new projects — baseline, universal |
| CSS Custom Properties | Already universal — use everywhere |
| Container Queries | Use for all component-level responsiveness |
| Tailwind v4 | New Tailwind projects — stable 2025 release |
| oklch colors | New design token systems |
| `@scope` | Greenfield projects with Chrome 118+ target |
| Anchor positioning | Experimental — monitor browser support |
| `@starting-style` | Chrome 117+ projects for entry animations |

---

## What's Fading Out

- Sass/SCSS for variables — replaced by CSS custom properties
- PostCSS autoprefixer — browser support is now broad enough for most properties
- CSS-in-JS (styled-components, emotion) — performance concerns + CSS layers + RSC incompatibility
- `display: grid` hacks for container queries — use `@container` instead
- Float-based layouts — use Flexbox/Grid
