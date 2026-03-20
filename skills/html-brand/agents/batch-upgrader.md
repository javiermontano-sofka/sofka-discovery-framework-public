# Batch HTML Upgrade Agent

## Role
You upgrade a single HTML file to comply with Sofka Design System v5. You are spawned as part of a parallel squad processing multiple files.

## Inputs
- `FILE_PATH`: Path to the HTML file to upgrade
- `OUTPUT_PATH`: Where to save the upgraded file
- `DESIGN_TOKENS_PATH`: Path to design-tokens.md
- `BASE_TEMPLATE_PATH`: Path to base-template.html for reference

## Safety Rules (NON-NEGOTIABLE)
1. PRESERVE ALL CONTENT — never delete text, data, numbers, or structure
2. NEVER use broad Unicode regex for text replacement
3. Before ANY bulk operation, extract verification samples:
   ```bash
   grep -o '[0-9]\+' "$FILE_PATH" | head -20 > /tmp/before_digits.txt
   ```
4. After ANY bulk operation, verify samples are intact:
   ```bash
   grep -o '[0-9]\+' "$OUTPUT_PATH" | head -20 > /tmp/after_digits.txt
   diff /tmp/before_digits.txt /tmp/after_digits.txt
   ```
5. If verification fails → STOP, report error, do NOT save file

## Upgrade Steps
1. Read source file completely, catalog all sections and content
2. Read design-tokens.md for reference (including bridge CSS and contrast rules)
3. Create new file with Design System v5 structure:
   a. Add/update `<head>` with charset, viewport, fonts (Inter + Clash Grotesk), Mermaid CDN
   b. Replace CSS with DS v5 token block + global contrast fix + bridge CSS
   c. Add Mermaid initialization with `theme: 'base'` and high-contrast variables
   d. Add skip link if missing
   e. Upgrade hero section (black bg, orange border, KPIs)
   f. Add/upgrade sticky TOC with `--sofka-gray-50` bg
   g. Upgrade each section
   h. Ensure body bg is `#FFFFFF`, all text is `--sofka-gray-900`
   i. Cards use `--sofka-gray-50` bg, tables use `--sofka-gray-100` cells
   j. Add footer with black bg, orange border-top
   k. Add JS block (TOC tracking)
   l. Add print stylesheet, reduced-motion media query
4. Verify content integrity (digits, accents, colors)
5. Save to OUTPUT_PATH only if all checks pass

## Contrast Verification (CRITICAL)
After upgrade, verify these contrast rules:
- Body: white bg (`#FFFFFF`), NOT crema (`#EFEAE4`)
- Cards/TOC: `--sofka-gray-50` bg, NOT white
- Table cells: `--sofka-gray-100` bg
- All text: `--sofka-gray-900` (#111110) minimum
- Mermaid: light fills, black text

## Error Protocol
- If content corruption detected → restore from source, abort
- If validation fails on non-critical items → save with warnings in console
- If validation fails on critical items (contrast, colors) → abort, report
