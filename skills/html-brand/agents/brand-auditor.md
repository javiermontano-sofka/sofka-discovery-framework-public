# Brand Auditor Agent

## Role

Audit a Sofka HTML deliverable for Design System v4 compliance. Produce a structured report with specific issues and remediation guidance.

## Inputs

- `FILE_PATH`: Path to the HTML file to audit
- `DESIGN_TOKENS_PATH`: Path to `references/design-tokens.md`
- `DOC_TYPE` (optional): "executive", "technical", or "transformation"

## Process

1. Read the target HTML file completely
2. Read design-tokens.md for reference
3. Audit each dimension below
4. Produce the structured report (see Output Format)

### 1. Color Compliance

Sofka v4 uses yellow for positive states because it maintains warmth within the orange-black palette. Green introduces a cold tone.

- Verify semantic colors: `--sofka-positive` = #FFD700 (yellow), `--sofka-critical` = #DC2626, `--sofka-warning` = #D97706, `--sofka-info` = #2563EB
- Flag any green (#28a745, #22c55e, #10B981, #42D36F) used for success states
- Check for hardcoded hex codes that should be CSS variables
- Verify WCAG AA contrast (4.5:1 body text, 3:1 large text)
- Count distinct colors used — should be under 6 in main palette

### 2. Typography

- Display headings (h1-h4): Clash Grotesk, weights 600-700
- Body text: Inter, weights 400-500
- Font loading: Google Fonts for Inter, Fontshare API for Clash Grotesk
- No reversed pairings (Inter for headings or Clash Grotesk for body)

### 3. Structure

- `<header class="hero">`: black background, `border-bottom: 8px solid` orange
- `<nav class="toc">`: sticky, horizontal scrollable
- `<main class="container">` with `id="main"`
- Numbered sections with `class="section"`: 01, 02, 03...
- `<footer class="site-footer">`: black background, `border-top: 8px solid` orange
- Skip link: `<a href="#main" class="skip-link">`
- `<div class="hero-logo">sofka_</div>` in hero

### 4. Component Usage

- Cards use `.card` base + single variant (not multiple)
- Score bars use correct fill colors from design tokens
- Callouts use correct semantic variant (.callout-info, .callout-warning, etc.)
- Tables wrapped in `.table-wrap`
- Scenario cards use .a/.b/.c variants with correct border colors

### 5. Accessibility

- `<html lang="es">` (or appropriate language)
- `<meta charset="UTF-8">`
- Skip link present and functional
- `:focus-visible` styles defined (orange outline)
- ARIA labels on buttons and modals
- `@media (prefers-reduced-motion: reduce)` present
- `@media print` stylesheet present

### 6. Content Integrity

- No unreplaced `{{PLACEHOLDER}}` text
- Digits intact (expect >50 numeric characters)
- Accented characters present (Spanish: áéíóúñ)
- No duplicate element IDs

## Output Format

```markdown
# Brand Audit: [Filename]
Date: [YYYY-MM-DD]

## Summary
- Overall Score: [X/6] dimensions passing
- Status: Ship / Fix & Re-audit / Major Rework
- Critical Issues: [N]

## Dimension Breakdown

| Dimension | Status | Issues | Severity |
|-----------|--------|--------|----------|
| Color | PASS/FAIL | ... | Critical/Warning |
| Typography | PASS/FAIL | ... | Critical/Warning |
| Structure | PASS/FAIL | ... | Critical/Warning |
| Components | PASS/FAIL | ... | Critical/Warning |
| Accessibility | PASS/FAIL | ... | Critical/Warning |
| Content | PASS/FAIL | ... | Critical/Warning |

## Issues with Fixes

| Issue | Location | Severity | Fix | Est. Time |
|-------|----------|----------|-----|-----------|
| ... | ... | CRITICAL/HIGH/LOW | ... | 5min |

## Strengths
- [2-3 things the deliverable does well]
```
