# Operations Guide — Advanced Workflows & Edge Cases

Read this file when doing batch processing, handling edge cases, or performing safe text operations on MetodologIA HTML deliverables.

## Table of Contents

1. [Batch Processing with Agentic Squads](#batch-processing)
2. [Safe Text Replacement](#safe-text-replacement)
3. [Edge Cases](#edge-cases)
4. [Acceptance Criteria Checklist](#acceptance-criteria)
5. [Extending with New Components](#extending-components)

---

## Batch Processing with Agentic Squads {#batch-processing}

When processing more than 3 files, spawn parallel sub-agents (one per file) to avoid sequential bottlenecks. The key insight from production experience: broad regex patterns on HTML files corrupt digits, accented characters, and hex color codes silently — so every agent must verify content integrity before saving.

### Squad Pattern

```
For each file in target_files:
  Spawn sub-agent with:
  ├─ Source file + design-tokens.md reference
  ├─ Steps:
  │   ├─ Parse HTML structure (log sections, components)
  │   ├─ Map old CSS → Design System v4 tokens
  │   ├─ Rewrite inline CSS in <style> block
  │   ├─ Fix component class names
  │   ├─ Preserve all content (no deletion, no reordering)
  │   ├─ Update charset, fonts, meta tags
  │   ├─ Add accessibility (skip link, focus states)
  │   ├─ Run validate_html.sh
  │   ├─ Post-verify: spot-check 3 sections for intact digits/accents/hex
  │   └─ Save only if all checks pass
  │
  └─ Concurrency limit: max 4 agents (prevents resource exhaustion)
```

### Error Handling & Rollback

- Validation fails → agent stops, logs error, does NOT save
- Content corruption detected → restore from backup, re-run with safer approach
- More than 1 file fails → stop squad, report failures, require manual review

See `agents/batch-upgrader.md` for the full agent prompt.

---

## Safe Text Replacement {#safe-text-replacement}

These rules exist because a previous production incident corrupted dozens of files when a broad Unicode regex (`[\x{1F000}-\x{1FFFF}]`) accidentally matched digits and accented characters. The damage was silent and only discovered during final review.

### Rule 1: No broad Unicode regex for emoji removal

```bash
# BAD — catches digits and accented chars in some locales
sed -i 's/[\x{1F000}-\x{1FFFF}]//g' file.html

# GOOD — explicit emoji ranges only
perl -CSD -pe 's/[\x{1F300}-\x{1F9FF}\x{2600}-\x{26FF}\x{2700}-\x{27BF}\x{FE00}-\x{FE0F}\x{1F000}-\x{1F02F}\x{1F0A0}-\x{1F0FF}\x{200D}\x{20E3}]//g' file.html
```

### Rule 2: Use fixed strings, not regex, for literal replacements

```bash
# SAFE — fixed string substitution
sed -i 's/Batallas/Big Rocks/g' file.html

# DANGEROUS — regex metacharacters can match unintended content
sed -i 's/[a-z]{2,}/REPLACEMENT/g' file.html
```

### Rule 3: Always verify after bulk operations

```bash
# Before the operation
grep -o '[0-9]\+' file.html | head -20 > /tmp/before.txt
# After the operation
grep -o '[0-9]\+' file.html | head -20 > /tmp/after.txt
diff /tmp/before.txt /tmp/after.txt  # Must be empty
```

---

## Edge Cases {#edge-cases}

### Very Long Titles (>65 chars)
Split with `<br>` in h1, reduce font-size to 36px:
```html
<h1>Strategic<br>Transformation<br><span>Roadmap</span></h1>
```

### 15+ Sections
Do not exceed 15 — breaks TOC usability. Split into "Part 1" and "Part 2" with next/prev links in footer.

### RTL Languages (Arabic, Hebrew)
Add `dir="rtl"` to `<html>`, swap left/right padding in media queries, test hero and TOC spacing.

### Bilingual Documents (ES + EN)
Use `lang="es"` default, wrap English in `<span lang="en">`. TOC lists both titles.

### Many Modals (>3)
Each modal adds event listeners. Limit to 3 per document — use scrollable cards for additional detail.

### Long Tables (>8 rows)
Make scrollable with `max-height: 400px` on `.table-wrap`, add sticky header on `<thead>`.

---

## Acceptance Criteria Checklist {#acceptance-criteria}

A "complete" deliverable passes all of these. Run through them as a final quality gate.

### Structure
- Valid HTML5 with `<!DOCTYPE html>`, charset UTF-8, `lang="es"`
- Hero section: black background, `border-bottom: 8px solid var(--metodologia-orange)`
- Footer: black background, `border-top: 8px solid var(--metodologia-orange)`
- Sticky TOC nav that tracks active section on scroll
- All sections numbered (01, 02, 03...)

### Content
- Hero title contains `<span>` with orange highlight on key term
- Hero has 3–4 KPI items with value + label
- Content density matches document type guidelines
- No unreplaced `{{PLACEHOLDER}}` text
- All tables have styled header rows
- All links have descriptive text (not "click here")

### Brand
- Only brand colors + semantic colors used
- Positive/success states use yellow (#22D3EE), never green
- All text meets WCAG AA contrast (4.5:1 body, 3:1 large)
- Clash Grotesk from Fontshare + Inter from Google Fonts
- All CSS inline in `<style>` block

### Accessibility
- Skip link present and functional
- Single `<h1>`, sections use `<h2>`
- Focus states visible (orange outline)
- ARIA labels on buttons and modals

### Validation
- `validate_html.sh` passes with 0 errors
- Responsive: works at 1440px, 768px, 375px
- Print stylesheet renders correctly
- Digits, accented chars, hex codes intact after any bulk operations

---

## Extending with New Components {#extending-components}

To add a component beyond the standard library:

1. Define CSS in `references/design-tokens.md` — class, variables, responsive behavior
2. Add usage example in `assets/base-template.html`
3. Test with all three document types — verify density guidelines aren't broken
4. Add to component usage table in SKILL.md
5. Document anti-patterns if the component is easy to misuse

Example: "Risk Matrix" → `.risk-matrix { display: grid; grid-template-columns: repeat(3, 1fr); }`, add to table as `Risk Matrix | Optional | Medium | Required`, anti-pattern: "3x3 max"
