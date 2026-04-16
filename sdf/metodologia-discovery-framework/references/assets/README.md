# MetodologIA Brand Assets

## Inventory

| Asset | File | Usage |
|-------|------|-------|
| SVG Logo | `logo-metodologia.svg` | Inline in HTML hero/footer, embedded in DOCX/PPTX covers |

## Logo Usage Rules

1. Always embed inline (never as external `<img>` reference)
2. Hero size: `width: 44px; height: 44px`
3. Footer size: `width: 32px; height: 32px`
4. Gradient IDs: use `logoBg` for hero, `logoBg2` for footer (avoid SVG ID collisions)
5. Always include `aria-label="MetodologIA logo"` for accessibility

## Brand Config

The canonical brand configuration is at `../brand-config-neoswiss.json`. ALL skills must read tokens from this file.
