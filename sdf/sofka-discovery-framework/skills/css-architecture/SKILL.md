---
name: css-architecture
author: "Javier Montaño (JM Labs)"
version: "2.0.0"
description: >
  Design and implement production-grade CSS architecture: design token systems,
  CSS Layers (@layer), @scope, container queries, Tailwind v4 config, dark mode strategy,
  component scoping. Use when user asks to "design CSS architecture", "set up design tokens",
  "organize styles", or "configure Tailwind".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
tags: [css, design-tokens, tailwind, cascade-layers, container-queries, dark-mode]
moat-level: L3
---

# CSS Architecture

Design scalable, maintainable CSS systems using modern cascade control, design tokens,
and component-scoped styles.

## Guiding Principle

> *"CSS architecture is not about preventing specificity wars — it's about designing
> a cascade that makes the right style always win without fighting."*

---

## Procedure

### Step 1 — Audit Existing Styles [HECHO / INFERENCIA]

1. Run `grep -r "@import\|@use\|require.*css\|import.*\.css" src/` to map all CSS entry points.
2. Identify CSS methodology in use: BEM, SMACSS, utility-first, or none.
3. Detect specificity hotspots: `grep -r "!important" src/ --include="*.css" -l`.
4. Check for existing design tokens: look for CSS custom properties in `:root` blocks.
5. Catalog responsive breakpoints: `grep -r "@media" src/ --include="*.css" | grep -oP '\d+px' | sort -u`.
6. Tag findings: `[HECHO]` for code evidence, `[INFERENCIA]` for patterns inferred from structure.

### Step 2 — Design Token System

1. **Primitives layer** — Raw values: `--color-blue-500: #3b82f6`, `--space-4: 1rem`.
2. **Semantic layer** — Mapped meaning: `--color-brand-primary: var(--color-blue-500)`.
3. **Component layer** — Component-local: `--button-bg: var(--color-brand-primary)`.
4. Define token categories: color, spacing, typography, radius, shadow, motion, z-index.
5. Choose token format: CSS custom properties (universal) vs. JSON (multi-platform).
6. Document token taxonomy in `tokens/README.md`.

**Decision: Token Format**

| Approach | When to Use | Trade-off |
|----------|-------------|-----------|
| Pure CSS custom props | Web-only, no native apps | No build step, live in browser |
| Style Dictionary + CSS output | Multi-platform (web + iOS + Android) | Build step required |
| Tailwind v4 @theme | Tailwind projects | Colocation with utility classes |
| CSS-in-JS (Vanilla Extract) | TypeScript-heavy, SSR projects | Type-safe, zero-runtime |

### Step 3 — Define CSS Layer Strategy

1. Declare all layers upfront in one `@layer` statement to establish order.
2. Layer order (lowest to highest priority):
   ```
   @layer reset, base, tokens, components, patterns, utilities, overrides;
   ```
3. Map existing stylesheets to layers.
4. Move all third-party CSS into `reset` or `base` layer to neutralize specificity.
5. Ensure utilities layer sits above components — utility classes should always win.

### Step 4 — Component Scoping Strategy

1. Choose scoping approach per component type:
   - **CSS Modules**: React/Vue components — zero leakage, build-time hashed classes.
   - **@scope**: Native CSS scoping for web components and framework-agnostic code.
   - **Shadow DOM**: Complete isolation for custom elements / design system primitives.
   - **BEM in layers**: Legacy codebases — combine BEM naming with `@layer components`.
2. For design systems, define scope boundaries explicitly using `@scope (.component-root)`.
3. Document which components use which scoping strategy.

### Step 5 — Responsive Architecture

1. Define breakpoint scale and name semantically (`sm`, `md`, `lg`, `xl`, `2xl`).
2. Use container queries for component-level responsiveness (not viewport-level).
3. Use viewport media queries only for layout-level changes (grid columns, sidebar).
4. Implement fluid typography with `clamp()` to reduce breakpoint-specific overrides.
5. Test with `@container` on key components before committing to approach.

### Step 6 — Dark Mode Strategy

1. **CSS Custom Properties approach** (recommended):
   - Define semantic tokens with light values, override in `[data-theme="dark"]` or `@media (prefers-color-scheme: dark)`.
   - Single source of truth: update the token, all components update.
2. Avoid duplicating component styles for dark mode — only token values should change.
3. Add `color-scheme: light dark` to `:root` for native form element theming.
4. Test: automated (Playwright `prefers-color-scheme`), visual regression, manual QA.

### Step 7 — Tailwind v4 Configuration (if applicable)

1. Use `@theme` directive to define design tokens inside CSS (replaces `tailwind.config.js`).
2. Map custom tokens to Tailwind utilities via `--color-*`, `--spacing-*` conventions.
3. Use `@utility` for one-off custom utilities not worth tokenizing.
4. Use `@layer components` for multi-property component classes.
5. Set `content` paths in CSS with `@source` directive.

### Step 8 — Verification

1. Check specificity: no selectors above `(0,2,0)` outside `overrides` layer.
2. Validate no `!important` outside `utilities` layer.
3. Run build to confirm no layer order surprises.
4. Visual regression test on key components.
5. Check dark mode parity across all components.
6. Measure CSS bundle size: target < 50 KB gzipped for initial load.

---

## Decision Framework

### Which Approach for the Project?

| Signal | Recommended Architecture |
|--------|--------------------------|
| New React/Next.js project | Tailwind v4 + CSS Modules for complex components |
| Existing BEM codebase | Add CSS Layers, wrap BEM in `@layer components` |
| Design system / component library | CSS custom properties + @scope + Style Dictionary |
| Web components | Shadow DOM + CSS custom properties for theming |
| Large legacy app (no build step) | CSS Layers only — zero migration cost |
| Multi-platform (web + native) | Style Dictionary → platform-specific output |

### Token Granularity Decision

| Token Count | Maintenance Cost | Flexibility |
|-------------|-----------------|-------------|
| < 50 tokens | Low | Limited |
| 50–200 tokens (recommended) | Moderate | High |
| > 500 tokens | High | Very High |

---

## Anti-Patterns

1. **`!important` as specificity band-aid** — Signals broken cascade. Fix the layer strategy instead.
2. **Semantic tokens pointing to other semantic tokens** — `--color-cta: var(--color-brand)` creates fragile chains. Point to primitives.
3. **Breakpoints in component files** — Use container queries for component responsiveness; viewport breakpoints belong in layout files.
4. **Global CSS in component scope** — `body {}` or `html {}` inside a component's CSS file causes side effects. Scope everything.
5. **Dark mode via class duplication** — Duplicating `.button` and `.button.dark` doubles maintenance. Use token overrides.
6. **Undeclared @layer order** — Browsers sort unlisted layers in order of first appearance. Always declare the full order upfront.
7. **Tailwind `@apply` in component files** — Reintroduces CSS specificity problems. Prefer utility classes in markup or `@layer components`.
8. **CSS custom properties without fallbacks** — `color: var(--color-text)` fails silently in unsupported contexts. Always provide fallback.

---

## Output Artifacts

- `tokens/primitives.css` — Raw design tokens
- `tokens/semantic.css` — Semantic token mappings
- `styles/layers.css` — Layer declaration and imports
- `styles/base.css` — Reset + base element styles
- `tailwind.config.css` — Tailwind v4 `@theme` block (if applicable)
- `ADR-CSS-001.md` — Architecture Decision Record for CSS strategy
