# Use Case Prompts — Responsive Design

## Scenario 1: New Project Responsive Foundation

```
Design the responsive design system for a new SaaS dashboard application.

Requirements:
- Complex data tables that must work on tablet (768px)
- Navigation: sidebar on desktop, bottom nav on mobile
- Card grid: 4 cols desktop, 2 cols tablet, 1 col mobile
- No device-specific breakpoints — content-driven only
- Support: modern browsers only (Chrome 110+, Safari 16+, Firefox 110+)

Deliver:
1. Breakpoint token scale (named, content-driven, rem-based)
2. Fluid typography system using clamp() for all 9 type steps
3. Container query strategy: which components use @container
4. Layout pattern library: grid, sidebar, stack, center, cover patterns
5. Test plan: Playwright viewports + manual device testing matrix

Output files: styles/breakpoints.css, styles/typography.css, styles/layout.css
```

## Scenario 2: Mobile Responsiveness Audit

```
The application at {PROJECT_PATH} has reported mobile layout issues.
Users report text too small on mobile, horizontal scrolling, and broken forms.

Before diagnosing, scan:
- All @media queries and their breakpoints [grep -r "@media" src/]
- All fixed pixel widths [grep -r "width: [0-9]*px"]
- All hardcoded font sizes [grep -r "font-size: [0-9]*px"]

Deliver:
1. Breakpoint audit: current breakpoints, gaps in coverage [HECHO]
2. Fixed value audit: list of fixed widths causing overflow [HECHO]
3. Typography audit: font sizes that fail below 640px [HECHO]
4. Priority fix list: sorted by user impact
5. Quick fixes: changes that can be made without architectural changes
6. Long-term fixes: what needs architectural changes

All findings must be tagged [HECHO] with file path and line number.
```

## Scenario 3: Container Queries Migration

```
The component library at {PROJECT_PATH} uses viewport media queries inside component CSS files.
This means a card component has different behavior based on screen size, not its container.

Problem: the same .card component renders incorrectly when placed in a sidebar vs. main content.

Deliver:
1. Identify all components with @media rules inside their CSS [HECHO]
2. For each: is it viewport-dependent (correct) or container-dependent (should be @container)?
3. Design containment hierarchy: which wrappers need container-type declarations
4. Migrate top 5 highest-impact components to @container
5. Write Playwright tests that verify component at container widths, not viewport widths

Browser support note: confirm target browsers support container queries before migrating [HECHO from package.json].
```

## Scenario 4: CLS Investigation

```
The marketing site at {PROJECT_PATH} has a CLS score of 0.28 (Poor).
Google PageSpeed field data shows 65% of sessions experience layout shift.

Investigate:
1. Run Lighthouse on production URL, capture "Avoid large layout shifts" section [HECHO]
2. Identify top 3 CLS contributors from Lighthouse output [HECHO]
3. Scan codebase for images without width/height attributes [HECHO]
4. Scan for dynamically injected content above the fold [HECHO]
5. Check font loading strategy — web fonts without font-display [HECHO]

For each finding, provide:
- Specific element causing shift
- Code change required
- Expected CLS improvement (estimated) [INFERENCIA]

Target: CLS ≤ 0.1 (Good threshold).
```

## Scenario 5: Responsive Image Audit

```
Audit all images in the Next.js application at {PROJECT_PATH}.

Check for:
1. Images using <img> instead of Next.js <Image> component [HECHO]
2. Images without width/height attributes [HECHO]
3. Images with loading="lazy" that are likely above the fold [HECHO]
4. Images without srcset or using only 1x srcset [HECHO]
5. Large images being served (check public/ directory file sizes) [HECHO]

For each image:
- File path
- Current implementation
- Issue found
- Recommended fix

Then:
6. Identify the most likely LCP image on the homepage
7. Verify it has fetchpriority="high" and no lazy loading
8. Provide the corrected <Image> component implementation
```
