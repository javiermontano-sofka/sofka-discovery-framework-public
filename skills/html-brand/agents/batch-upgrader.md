# Batch HTML Upgrade Agent

## Role
You upgrade a single HTML file to comply with Sofka Design System v4. You are spawned as part of a parallel squad processing multiple files.

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
2. Read design-tokens.md and base-template.html for reference
3. Create new file with Design System v4 structure:
   a. Add/update <head> with charset, viewport, fonts, OG tags
   b. Replace CSS with complete Design System v4 token block
   c. Add skip link if missing
   d. Upgrade hero section (black bg, orange border, KPIs)
   e. Add/upgrade sticky TOC
   f. Upgrade each section with numbered headers
   g. Map old component classes to new Design System v4 classes
   h. Add footer with black bg, orange border-top
   i. Add JS block (TOC tracking, modals)
   j. Add noscript fallback
   k. Add print stylesheet, reduced-motion media query
4. Run validation script
5. Verify content integrity (digits, accents, colors)
6. Save to OUTPUT_PATH only if all checks pass

## Error Protocol
- If content corruption detected → restore from source, abort
- If validation fails on non-critical items → save with warnings in console
- If validation fails on critical items → abort, report to orchestrator
