# Body of Knowledge: CSS Architecture

## 1. CSS Cascade Layers (@layer)

CSS Layers give developers explicit control over cascade order, eliminating specificity wars.

### Declaring Layer Order

```css
/* Always declare ALL layers in a single @layer statement at the top of your entry CSS.
   The order here determines cascade priority — last layer wins on equal specificity. */
@layer reset, base, tokens, components, patterns, utilities, overrides;
```

### Importing Into Layers

```css
/* Third-party CSS loses its specificity advantage inside a layer */
@layer reset {
  @import "normalize.css";
}

@layer base {
  *, *::before, *::after { box-sizing: border-box; }
  body { margin: 0; font-family: var(--font-base); }
}

@layer components {
  .card { background: var(--color-surface); border-radius: var(--radius-md); }
}

@layer utilities {
  .sr-only {
    position: absolute; width: 1px; height: 1px;
    padding: 0; margin: -1px; overflow: hidden; clip: rect(0,0,0,0);
    white-space: nowrap; border: 0;
  }
}
```

### Layer Priority Demonstration

```css
/* Without layers: .card.featured wins (higher specificity: 0,2,0) */
.card.featured { background: gold; }
.card { background: white; }  /* loses */

/* With layers: utilities layer wins over components layer
   regardless of specificity */
@layer components { .card.featured { background: gold; } }
@layer utilities  { .card          { background: white; } } /* wins — higher layer */
```

---

## 2. Design Token System

### Three-Tier Token Architecture

```css
/* tokens/primitives.css — Raw values, no semantic meaning */
:root {
  /* Color primitives */
  --color-blue-50: #eff6ff;
  --color-blue-500: #3b82f6;
  --color-blue-900: #1e3a8a;
  --color-neutral-0: #ffffff;
  --color-neutral-900: #111827;

  /* Spacing scale (4px base) */
  --space-1: 0.25rem;   /* 4px */
  --space-2: 0.5rem;    /* 8px */
  --space-4: 1rem;      /* 16px */
  --space-8: 2rem;      /* 32px */
  --space-16: 4rem;     /* 64px */

  /* Type scale */
  --font-size-sm: 0.875rem;
  --font-size-base: 1rem;
  --font-size-lg: 1.125rem;
  --font-size-xl: 1.25rem;

  /* Radius */
  --radius-sm: 0.25rem;
  --radius-md: 0.5rem;
  --radius-full: 9999px;

  /* Shadow */
  --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
  --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1);
}

/* tokens/semantic.css — Meaningful names that map to primitives */
:root {
  /* Surface colors */
  --color-bg: var(--color-neutral-0);
  --color-surface: var(--color-neutral-50);
  --color-surface-raised: var(--color-neutral-0);

  /* Text colors */
  --color-text: var(--color-neutral-900);
  --color-text-muted: var(--color-neutral-600);
  --color-text-inverse: var(--color-neutral-0);

  /* Brand */
  --color-brand-primary: var(--color-blue-500);
  --color-brand-primary-hover: var(--color-blue-600);

  /* Status */
  --color-status-success: var(--color-green-600);
  --color-status-error: var(--color-red-600);
  --color-status-warning: var(--color-amber-500);

  /* Component spacing */
  --space-component-gap: var(--space-4);
  --space-section-gap: var(--space-16);
}
```

### Dark Mode Token Override

```css
/* Method 1: prefers-color-scheme (automatic) */
@media (prefers-color-scheme: dark) {
  :root {
    --color-bg: var(--color-neutral-900);
    --color-surface: var(--color-neutral-800);
    --color-text: var(--color-neutral-0);
    --color-text-muted: var(--color-neutral-400);
  }
}

/* Method 2: data attribute (user-controlled) */
[data-theme="dark"] {
  --color-bg: var(--color-neutral-900);
  --color-surface: var(--color-neutral-800);
  --color-text: var(--color-neutral-0);
}

/* Add color-scheme for native elements (scrollbars, form inputs) */
:root { color-scheme: light; }
[data-theme="dark"] { color-scheme: dark; }
```

---

## 3. CSS @scope

Native CSS scoping without class naming conventions or CSS Modules.

```css
/* Scope styles to .card and its descendants */
@scope (.card) {
  :scope {
    background: var(--color-surface);
    padding: var(--space-4);
    border-radius: var(--radius-md);
  }
  h2 { font-size: var(--font-size-xl); margin-block-end: var(--space-2); }
  p  { color: var(--color-text-muted); }
}

/* Scope with lower boundary — styles stop at .card-content boundary */
@scope (.card) to (.card-content) {
  img { border-radius: var(--radius-sm); width: 100%; }
}
```

---

## 4. Container Queries

```css
/* Define a containment context */
.sidebar { container-type: inline-size; container-name: sidebar; }
.main    { container-type: inline-size; container-name: main; }

/* Component responds to its container, not the viewport */
@container sidebar (max-width: 300px) {
  .widget { flex-direction: column; }
  .widget-icon { display: none; }
}

@container main (min-width: 600px) {
  .widget { display: grid; grid-template-columns: auto 1fr; }
}

/* Container query length units */
.widget-title {
  font-size: clamp(1rem, 3cqi, 1.5rem); /* cqi = container query inline size */
}
```

---

## 5. Tailwind v4 — @theme Configuration

Tailwind v4 replaces `tailwind.config.js` with CSS-based configuration.

```css
/* app.css — All config lives in CSS */
@import "tailwindcss";

@theme {
  /* Override default design tokens */
  --color-brand: #3b82f6;
  --color-brand-dark: #1d4ed8;

  /* Custom spacing */
  --spacing-18: 4.5rem;

  /* Custom font family */
  --font-sans: "Inter", system-ui, sans-serif;

  /* Custom breakpoints */
  --breakpoint-3xl: 1920px;

  /* Custom animation */
  --animate-slide-in: slide-in 0.3s ease-out;

  @keyframes slide-in {
    from { opacity: 0; transform: translateY(-8px); }
    to   { opacity: 1; transform: translateY(0); }
  }
}

/* Custom component classes in Tailwind v4 */
@layer components {
  .btn-primary {
    @apply bg-brand text-white px-4 py-2 rounded-md font-medium;
    @apply hover:bg-brand-dark transition-colors;
  }
}

/* Custom utility not in Tailwind's default set */
@utility text-balance {
  text-wrap: balance;
}
```

---

## 6. CSS Modules Pattern (React/Vue)

```css
/* Button.module.css */
.button {
  background: var(--color-brand-primary);
  color: var(--color-text-inverse);
  padding: var(--space-2) var(--space-4);
  border-radius: var(--radius-md);
  border: none;
  cursor: pointer;
}

.button:hover { background: var(--color-brand-primary-hover); }

/* Compose with other modules */
.buttonLarge { composes: button; padding: var(--space-3) var(--space-6); }
```

```jsx
// Button.tsx
import styles from './Button.module.css';
export const Button = ({ children, size }) => (
  <button className={size === 'large' ? styles.buttonLarge : styles.button}>
    {children}
  </button>
);
```

---

## 7. Specificity Reference

| Selector Type | Specificity |
|---------------|-------------|
| Element (`div`, `p`) | (0,0,1) |
| Class (`.card`) | (0,1,0) |
| ID (`#header`) | (1,0,0) |
| Inline style | (1,0,0,0) |
| `:where()` | (0,0,0) — always zero |
| `:is()` | Takes specificity of most specific argument |
| `@layer` override | Layer order, not specificity |

### :where() for Zero-Specificity Base Styles

```css
/* These styles have zero specificity — anything overrides them */
:where(h1, h2, h3, h4, h5, h6) {
  font-weight: 600;
  line-height: 1.2;
  margin-block: 0;
}
```

---

## 8. Style Dictionary — Multi-Platform Tokens

```json
// tokens/tokens.json
{
  "color": {
    "brand": {
      "primary": { "value": "#3b82f6", "type": "color" },
      "primary-dark": { "value": "#1d4ed8", "type": "color" }
    }
  },
  "spacing": {
    "4": { "value": "16px", "type": "spacing" },
    "8": { "value": "32px", "type": "spacing" }
  }
}
```

```js
// style-dictionary.config.js
module.exports = {
  source: ['tokens/**/*.json'],
  platforms: {
    css: {
      transformGroup: 'css',
      files: [{ destination: 'tokens/output.css', format: 'css/variables' }]
    },
    ios: {
      transformGroup: 'ios-swift',
      files: [{ destination: 'ios/StyleTokens.swift', format: 'ios-swift/class.swift' }]
    }
  }
};
```

---

## 9. Known Anti-Pattern Fixes

### !important → Layer Fix

```css
/* Before: specificity war */
.nav .nav-item a { color: blue !important; }

/* After: put overrides in their own layer */
@layer overrides {
  .nav-item a { color: var(--color-brand-primary); }
}
```

### Global Leak → @scope Fix

```css
/* Before: this h2 style leaks everywhere */
.hero h2 { font-size: 3rem; }

/* After: scoped — only h2 inside .hero is affected */
@scope (.hero) { h2 { font-size: 3rem; } }
```
