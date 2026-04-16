# Use Case Prompts — CSS Architecture

## Scenario 1: Greenfield Project — Design Token + Layer System

```
Design the complete CSS architecture for a new React + Next.js e-commerce platform.

Requirements:
- Multi-brand theming (B2B and B2C variants from same codebase)
- Dark mode (user-controlled, persisted in localStorage)
- Tailwind CSS v4 as utility foundation
- Design tokens must be exportable to iOS and Android (React Native + Swift)
- Team: 8 frontend engineers, mix of senior/mid levels

Scan the project root first, then:
1. Design the three-tier token system (primitives → semantic → component)
2. Define CSS layer order and layer mapping strategy
3. Write Tailwind v4 @theme configuration
4. Provide Style Dictionary config for multi-platform export
5. Output: tokens/primitives.css, tokens/semantic.css, styles/layers.css
6. Output: ADR-CSS-001.md documenting all decisions

Tag all findings [HECHO] / [INFERENCIA] / [SUPUESTO].
```

## Scenario 2: Legacy CSS Audit — Specificity Crisis

```
Audit the CSS architecture of the existing application at {PROJECT_PATH}.

The team reports:
- Styles randomly override each other
- Adding new styles breaks existing ones
- !important is everywhere
- No one understands the cascade

Deliver:
1. Specificity audit: grep for !important, high-specificity selectors, count occurrences [HECHO]
2. Architecture assessment: what methodology (if any) is in use? [INFERENCIA]
3. Layer migration plan: how to introduce @layer without rewriting everything
4. Priority-sorted fix list: which !important uses are most dangerous
5. Quick wins: 3 changes that will have immediate impact

Be explicit about what you found vs. what you inferred.
```

## Scenario 3: Dark Mode Implementation

```
Implement dark mode for the existing design system at {PROJECT_PATH}.

Current state:
- Uses CSS custom properties in :root
- No dark mode exists
- Components have hardcoded color values in some places

Requirements:
- Support both prefers-color-scheme (automatic) and data-theme="dark" (user toggle)
- All 47 components must work in both modes
- No JavaScript required for initial render (SSR-safe)
- No visible flicker on page load

Deliver:
1. Audit: list all hardcoded color values in components [HECHO]
2. Token architecture: which tokens need dark mode variants
3. Implementation: dark mode override CSS (add to tokens/semantic.css)
4. SSR strategy: how to avoid flash of wrong theme
5. Testing checklist: how to verify every component in dark mode
```

## Scenario 4: Component Scoping Decision

```
The design system at {PROJECT_PATH} has a CSS specificity problem:
styles from one component leak into nested components.

Example: .card h2 styles affect h2 inside .card .badge unintentionally.

The team is considering:
A) CSS Modules (.module.css) — requires build step changes
B) @scope (native CSS) — requires Chrome 118+, Firefox 128+
C) BEM with double-underscore convention — no tooling changes

Analyze the codebase and recommend:
1. Current browser support requirements [HECHO from package.json/browserslist]
2. Build setup assessment [HECHO]
3. Recommended approach with rationale
4. Migration path for all 47 existing components
5. Estimated effort in component-days [SUPUESTO — clearly labeled]
```

## Scenario 5: Tailwind v4 Migration

```
Migrate the existing Tailwind CSS v3 project at {PROJECT_PATH} to Tailwind v4.

Before doing anything:
1. Read tailwind.config.js completely
2. Read the package.json to confirm current Tailwind version
3. Scan for all @apply directives and custom utilities

Then deliver:
1. Migration risk assessment: which v3 patterns break in v4
2. @theme block: convert tailwind.config.js theme section to @theme CSS
3. @utility blocks: convert custom utilities
4. @source directive: replace content array
5. Breaking changes checklist: JIT removal, plugin API changes, etc.
6. Test plan: how to verify visual parity after migration

Only propose changes after reading the actual config [HECHO].
```
