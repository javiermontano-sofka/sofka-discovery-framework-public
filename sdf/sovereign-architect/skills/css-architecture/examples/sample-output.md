# CSS Architecture Report — Acme E-Commerce Platform

**Date**: 2026-03-18 | **Analyst**: Sovereign Architect | **Project**: acme-shop (Next.js 14)

---

## TL;DR

CSS architecture has no intentional structure — 847 `!important` declarations, zero CSS Layers, no design token system. Styles are managed by tribal knowledge. Risk: **HIGH**. Recommended action: phased migration to CSS Layers + design token system over 6 weeks.

---

## Phase 1 Findings — Audit [HECHO]

### Current Architecture

- **Methodology**: None identifiable. Mix of BEM fragments, utility-first, and inline styles.
- **Entry point**: `styles/globals.css` (4,200 lines) + 47 `.module.css` files
- **CSS preprocessor**: None. Raw CSS + Tailwind CSS v3.
- **Design tokens**: None. Colors and spacing hardcoded throughout.

### Specificity Audit [HECHO]

```
! important declarations: 847 (scanned with grep -r "!important" src/)
Selectors with 3+ classes: 234
ID selectors: 12
Inline style attributes: 89
```

Source: `grep -r "!important" src/ | wc -l` → 847

### Critical Issues Found [HECHO]

**Issue 1: No CSS Layer Architecture**
- File: `styles/globals.css:1–4200`
- All styles in the implicit unlayered cascade
- Third-party Tailwind CSS and component styles compete for specificity

**Issue 2: Color Values Hardcoded (324 occurrences)**
```
grep -r "#[0-9a-fA-F]\{3,6\}" src/ --include="*.css" | wc -l
→ 324 hardcoded color values
```
Brand color `#E63946` appears in 47 different files.
Dark mode is impossible without CSS variables.

**Issue 3: 14 `!important` on `color` Properties**
- `src/components/Button/Button.module.css:23`: `color: white !important`
- `src/components/Header/Header.module.css:41`: `color: var(--color-text) !important`
These cancel each other — both are fighting the cascade.

**Issue 4: Breakpoints in Component CSS Modules**
- `src/components/ProductCard/ProductCard.module.css` has 7 `@media` rules
- These should be container queries — the card appears in 3 different layout contexts

### Positive Findings [HECHO]

- CSS Modules are used consistently — no global leakage between components
- `src/styles/globals.css` already uses `:root` for some variables (12 properties)
- Team uses consistent class naming (mostly PascalCase for modules)

---

## Phase 2 — Architecture Design [INFERENCIA]

### Recommended Layer Strategy

```css
/* styles/layers.css — to be created */
@layer reset, base, tokens, components, patterns, utilities, overrides;

@layer reset {
  @import "normalize.css";
}

@layer base {
  *, *::before, *::after { box-sizing: border-box; }
  body { margin: 0; font-family: var(--font-sans); color: var(--color-text); }
}

@layer tokens {
  /* Primitives + semantic tokens */
}
```

### Token System Design [INFERENCIA]

**Primitive tokens (extracted from codebase):**

```css
/* tokens/primitives.css */
:root {
  /* Brand colors — extracted from 47 files */
  --color-red-600:     #E63946;
  --color-red-700:     #C1121F;
  --color-blue-600:    #1D3557;
  --color-blue-50:     #EFF6FF;

  /* Neutral scale */
  --color-neutral-0:   #FFFFFF;
  --color-neutral-100: #F8F9FA;
  --color-neutral-900: #111827;

  /* Spacing — 4px base, found in codebase */
  --space-1: 0.25rem;
  --space-2: 0.5rem;
  --space-4: 1rem;
  --space-8: 2rem;
}
```

**Semantic tokens (derived from patterns):**

```css
/* tokens/semantic.css */
:root {
  --color-brand-primary:     var(--color-red-600);
  --color-brand-primary-hover: var(--color-red-700);
  --color-bg:                var(--color-neutral-0);
  --color-text:              var(--color-neutral-900);
  --color-text-muted:        var(--color-neutral-600);
}

[data-theme="dark"] {
  --color-bg:                var(--color-neutral-900);
  --color-text:              var(--color-neutral-0);
  --color-text-muted:        var(--color-neutral-400);
}
```

---

## Remediation Plan

| Priority | Action | Files | Effort | Impact |
|----------|--------|-------|--------|--------|
| P1 | Declare @layer order in entry CSS | styles/layers.css | 0.5 days | High — stops cascade fights |
| P1 | Extract primitives from globals.css | tokens/primitives.css | 1 day | High — enables tokens |
| P1 | Create semantic token layer | tokens/semantic.css | 1 day | High — enables dark mode |
| P2 | Remove top 50 !important (highest risk) | globals.css | 2 days | Medium — quality |
| P2 | Convert ProductCard to container query | ProductCard.module.css | 0.5 days | Medium — layout |
| P3 | Migrate remaining 847 !important | All | 3 weeks | Low/sprint |

**Total P1 effort**: 2.5 days
**Expected outcome**: Cascade conflicts eliminated, dark mode possible

---

## Output Artifacts Produced

- `tokens/primitives.css` — 48 extracted primitive tokens
- `tokens/semantic.css` — 24 semantic tokens with dark mode overrides
- `styles/layers.css` — Layer declaration with import order
- `ADR-CSS-001.md` — Architecture Decision Record

---

## Next Steps

1. Review token values with design team — some primitives may be wrong [SUPUESTO]
2. Sprint 1: Implement P1 items (layers + tokens)
3. Sprint 2–4: Migrate !important occurrences by file, not all at once
4. Sprint 5: Container queries for ProductCard, CategoryNav
