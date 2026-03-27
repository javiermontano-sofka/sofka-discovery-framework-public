---
name: responsive-design
author: "Javier Montaño (JM Labs)"
version: "2.0.0"
description: >
  Implement production-grade responsive design: breakpoint strategy, fluid typography
  with clamp(), container queries, responsive images with srcset/sizes, and
  cross-device testing methodology. Use when user asks to "make responsive",
  "implement responsive design", or "fix layout on mobile".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
tags: [responsive, container-queries, fluid-typography, responsive-images, breakpoints, testing]
moat-level: L3
---

# Responsive Design

Implement adaptive, fluid layouts that work correctly across viewports, device classes,
and user preferences using modern CSS techniques.

## Guiding Principle

> *"Good responsive design isn't about making it work on every screen size —
> it's about making the content determine the layout, not the device."*

---

## Procedure

### Step 1 — Audit Current Responsive State [HECHO]

1. Open Chrome DevTools → Device Toolbar, test at 320px, 768px, 1024px, 1440px.
2. Run Lighthouse "Mobile" profile — note CLS, layout shift sources.
3. Scan for fixed-width elements: `grep -r "width: [0-9]*px" src/ --include="*.css"`.
4. Scan for hardcoded font sizes: `grep -r "font-size: [0-9]*px" src/ --include="*.css"`.
5. Identify touch targets below 44×44px minimum.
6. Check `<meta name="viewport">` exists and is correct: `width=device-width, initial-scale=1`.
7. Tag findings with `[HECHO]` for measured issues, `[INFERENCIA]` for patterns.

### Step 2 — Breakpoint Strategy

1. List all content types: text-heavy, image-heavy, data tables, navigation, cards.
2. Let content determine breakpoints — don't target device widths.
3. Define a named scale:

   | Token | Value | Use Case |
   |-------|-------|----------|
   | `--bp-sm` | 640px | Single-column to two-column |
   | `--bp-md` | 768px | Tablet layout inflection |
   | `--bp-lg` | 1024px | Desktop navigation pattern |
   | `--bp-xl` | 1280px | Wide content areas |
   | `--bp-2xl` | 1536px | Ultra-wide / dashboard |

4. Write breakpoints mobile-first: default styles = smallest, `@media (min-width: ...)` for larger.
5. Limit viewport breakpoints to layout changes only. Use container queries for components.

### Step 3 — Fluid Typography System

1. Calculate `clamp()` values for each type step:
   ```
   font-size: clamp(min, preferred, max)
   preferred = calc(Vmin + (Vmax - Vmin) * (100vw - BPmin) / (BPmax - BPmin))
   ```
2. Use the Utopia fluid type calculator (utopia.fyi) or compute manually.
3. Define type scale: `--text-xs` through `--text-6xl` with `clamp()` values.
4. Set `line-height` as unitless ratio: `1.4` for body, `1.1` for headings.
5. Use `rem` for min/max values (respects user font preferences), `vi` for viewport dimension.

**Example fluid type scale:**
```css
:root {
  --text-sm:   clamp(0.8rem,  0.77rem + 0.18vw, 0.875rem);
  --text-base: clamp(1rem,    0.95rem + 0.24vw, 1.125rem);
  --text-lg:   clamp(1.125rem,1.07rem + 0.29vw, 1.25rem);
  --text-xl:   clamp(1.25rem, 1.19rem + 0.31vw, 1.5rem);
  --text-2xl:  clamp(1.5rem,  1.41rem + 0.46vw, 1.875rem);
  --text-3xl:  clamp(1.875rem,1.72rem + 0.78vw, 2.5rem);
}
```

### Step 4 — Container Queries

1. Identify components that need to respond to their container (not viewport):
   - Cards in sidebars vs. main content
   - Navigation in header vs. drawer
   - Media objects in list vs. featured positions
2. Set `container-type` and optionally `container-name`:
   ```css
   .card-wrapper { container-type: inline-size; container-name: card; }
   ```
3. Write container query rules:
   ```css
   @container card (min-width: 400px) {
     .card { flex-direction: row; }
   }
   ```
4. Use `cqi` (container query inline) units for font sizes inside containers.
5. Avoid container queries on root-level layout — use viewport media queries there.

### Step 5 — Responsive Images

1. **`srcset` + `sizes` for art-direction-free responsive images:**
   ```html
   <img
     srcset="hero-400.webp 400w, hero-800.webp 800w, hero-1200.webp 1200w"
     sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 800px"
     src="hero-800.webp"
     alt="Hero image"
     loading="lazy"
     decoding="async"
   >
   ```
2. **`<picture>` for art direction** (different crops at different viewports).
3. Use modern formats: WebP with JPEG fallback, AVIF for supported browsers.
4. Set explicit `width` and `height` attributes to prevent layout shift (CLS).
5. Use `loading="lazy"` for below-fold images; `loading="eager"` + `fetchpriority="high"` for LCP image.
6. Generate image variants via build pipeline (sharp, Imagemin, Next.js Image).

### Step 6 — Layout Patterns

1. **Intrinsic grid** — `grid-template-columns: repeat(auto-fit, minmax(min(300px, 100%), 1fr))` — no breakpoints needed.
2. **Stack** — `display: flex; flex-direction: column; gap: var(--space-4)` — vertical rhythm.
3. **Sidebar** — CSS Grid with named lines; sidebar collapses to full-width below threshold.
4. **Center** — `max-width` + `margin-inline: auto` + `padding-inline: var(--space-4)`.
5. **Cover** — Full-viewport-height layout with centered content.
6. Test each pattern at 320px minimum width.

### Step 7 — Cross-Device Testing

1. **Automated**: Playwright viewport tests at standard breakpoints + resize events.
2. **DevTools**: Chrome Device Toolbar, throttle CPU 6x, throttle network to 3G.
3. **Real devices**: iOS Safari (WebKit), Android Chrome, Samsung Internet.
4. **Accessibility modes**: iOS VoiceOver, Windows High Contrast mode.
5. **User preferences**: Test with OS `prefers-reduced-motion: reduce`.
6. **Emulation tools**: BrowserStack, LambdaTest for cross-browser coverage.

---

## Decision Framework

### Viewport vs. Container Query

| Use Case | Use This |
|----------|----------|
| Page layout (grid, columns, sidebar) | Viewport media query |
| Component internal layout (card, widget) | Container query |
| Typography scaling | `clamp()` fluid values |
| Image serving | `srcset` + `sizes` |
| Navigation menu collapse | Viewport media query |
| Card layout inside sidebar vs. main | Container query |

### Fixed vs. Fluid Values

| Situation | Fixed px | Fluid clamp() | % / fr |
|-----------|----------|---------------|--------|
| Border widths | Yes | No | No |
| Font sizes | No | Yes | No |
| Spacing | No | Yes (large) | No |
| Grid columns | No | No | Yes |
| Max widths | Yes (ch/rem) | No | No |

---

## Anti-Patterns

1. **Device-specific breakpoints** — Targeting `320px` (iPhone 5) or `375px` (iPhone X) creates a maintenance trap. Let content dictate breakpoints.
2. **Viewport units for font sizes without clamp** — `font-size: 4vw` causes extreme sizes at large/small viewports. Always use `clamp()`.
3. **Fixed pixel widths on containers** — `width: 960px` breaks on smaller screens. Use `max-width` + fluid padding.
4. **Neglecting touch targets** — Buttons and links below 44×44px fail WCAG 2.5.8 (Target Size). Especially harmful on mobile.
5. **Overusing `!important` for mobile overrides** — Sign of desktop-first gone wrong. Rewrite mobile-first.
6. **Images without explicit dimensions** — CLS killer. Always set `width` and `height` even for responsive images.
7. **Container queries without container context** — `@container` rules silently fail if no ancestor has `container-type`. Always verify the containment tree.

---

## Output Artifacts

- `styles/breakpoints.css` — Named breakpoint tokens
- `styles/typography.css` — Fluid type scale
- `styles/layout.css` — Layout patterns (grid, stack, sidebar, center)
- Playwright test file: `tests/responsive.spec.ts`
- `ADR-RESPONSIVE-001.md` — Architecture Decision Record
