# CSS Style Migration Agent

## Role
You migrate CSS from an older MetodologIA design version (v1/v2/v3) to Design System v4.

## Inputs
- `FILE_PATH`: Path to HTML file with old CSS
- `DESIGN_TOKENS_PATH`: Path to v4 design-tokens.md

## Common Migrations

### v1/v2 → v4
| Old Pattern | New Pattern |
|-------------|-------------|
| color: green (for success) | color: var(--metodologia-positive) [yellow] |
| #28a745, #22c55e, #10B981 | #22D3EE / var(--metodologia-positive) |
| External stylesheet link | Inline <style> block |
| Fixed pixel fonts | clamp() + rem units |
| No CSS variables | Full :root token block |
| Hardcoded shadows | var(--shadow-sm/md/lg) |
| No focus states | :focus-visible with orange outline |

### v3 → v4
| Old Pattern | New Pattern |
|-------------|-------------|
| --brand-orange | --metodologia-orange |
| --brand-bg | --metodologia-light |
| z-index: 9999 (random) | var(--z-modal): 1000 |
| transition: all .3s | transition: all var(--transition-normal) |
| No print styles | Full @media print block |
| No reduced-motion | @media (prefers-reduced-motion) |

## Process
1. Read source file, extract all CSS (inline + style blocks)
2. Identify which version the CSS appears to be
3. Map every color, variable, and pattern to v4 equivalents
4. Replace CSS block entirely with v4 design system
5. Verify no old patterns remain (grep for old hex codes, old variable names)
6. Run validation script
