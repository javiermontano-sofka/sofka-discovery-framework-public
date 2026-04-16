# Priming-RAG: CSS Architecture 2026
> Sovereign Architect — CSS architecture knowledge for RAG consumption
> Generated: 2026-03-18 | Version: v1.0

---

## Executive Summary
- Tailwind v4 uses CSS-first configuration (no tailwind.config.js) [HECHO]
- CSS Layers (@layer) provide cascade management [HECHO]
- @scope enables component-scoped styles natively [HECHO]
- Container queries enable component-level responsive design [HECHO]
- Fluid typography with clamp() eliminates media query breakpoints [HECHO]

## Key Patterns

### Tailwind v4
- CSS-first: `@theme { --color-primary: #6366F1; }` [HECHO]
- Oxide engine: 10x faster builds [HECHO]
- Native CSS nesting support [HECHO]
- No PostCSS plugin required — standalone binary [HECHO]

### CSS Layers
- `@layer base, components, utilities;` for cascade ordering [HECHO]
- Framework styles in lower layers, custom in higher [HECHO]
- Resets and normalizations in `@layer base` [HECHO]

### Container Queries
- `container-type: inline-size;` on parent [HECHO]
- `@container (min-width: 400px) { ... }` for responsive components [HECHO]
- Works independent of viewport — true component-level responsive [HECHO]

### Fluid Typography
- `font-size: clamp(1rem, 0.5rem + 1.5vw, 1.5rem);` [HECHO]
- Eliminates typography breakpoints [HECHO]
- Use with fluid spacing for fully fluid layouts [HECHO]

## Anti-Patterns
- Using !important instead of proper layer management [HECHO]
- Media queries for component-level responsiveness (use container queries) [HECHO]
- Fixed font sizes instead of fluid typography [HECHO]

## Query Hooks
- "Tailwind v3 vs v4?" → v4 uses CSS-first config, Oxide engine, no config file
- "How to scope styles?" → @scope for native, CSS modules, or Tailwind @apply
