# Operations Guide — Pipelines, Batch Processing & Edge Cases

Read this file when doing markdown-to-HTML pipeline conversion, batch processing, handling edge cases, or performing safe text operations on Sofka HTML deliverables.

## Table of Contents

1. [Markdown-to-HTML Pipeline](#markdown-pipeline) — Production-proven conversion flow
2. [Per-Deliverable Metadata](#per-deliverable-metadata) — Hero customization per document
3. [Batch Processing with Agentic Squads](#batch-processing) — Parallel file upgrades
4. [Safe Text Replacement](#safe-text-replacement) — Regex safety rules
5. [Edge Cases](#edge-cases) — RTL, bilingual, large tables, etc.
6. [Acceptance Criteria Checklist](#acceptance-criteria) — Final quality gate
7. [Extending with New Components](#extending-components)

---

## Markdown-to-HTML Pipeline {#markdown-pipeline}

This is the production-proven conversion flow used to generate 18+ branded HTML deliverables from markdown source in a single batch run. The pipeline was refined over three iterations to resolve contrast issues.

### Pipeline Architecture

```
.md source → npx marked --gfm → post-process → assemble → .html output
                                     │
                                     ├─ evidence badges: [DOC] → <span class="badge">
                                     ├─ mermaid blocks: language-mermaid → pre.mermaid
                                     └─ TOC extraction: h2 headers → nav links
```

### Shell Script Pattern

The canonical conversion script follows this structure:

```bash
#!/bin/bash
# Convert .md deliverables to branded Sofka HTML — Design System v5

OUTDIR="./outputs"
HTMLDIR="./outputs/html"
CSSFILE="path/to/sofka-design-system.css"

mkdir -p "$HTMLDIR"

# Read CSS once (performance: avoid re-reading per file)
CSS=$(cat "$CSSFILE")

# Bridge CSS for markdown → DS v5 mapping
read -r -d '' EXTRA_CSS << 'EXTRACSS'
# ... (see design-tokens.md § "Markdown Bridge CSS" + "Evidence Badge CSS")
EXTRACSS

convert_file() {
    local mdfile="$1"
    local basename=$(basename "$mdfile" .md)
    local htmlfile="$HTMLDIR/${basename}.html"

    # 1. Determine per-deliverable metadata (see section below)
    # 2. Convert markdown: npx marked --gfm < "$mdfile"
    # 3. Post-process evidence badges (sed)
    # 4. Post-process mermaid blocks (sed)
    # 5. Extract h2 headers for TOC (sed, max 8)
    # 6. Add IDs to h2 elements for TOC linking
    # 7. Assemble: head + hero + TOC + body + footer + JS
    # 8. Save to $htmlfile
}

for mdfile in "$OUTDIR"/*.md; do
    convert_file "$mdfile"
done
```

### Key Implementation Details

**Markdown parsing:**
```bash
body=$(npx marked --gfm < "$mdfile" 2>/dev/null)
```

**Evidence badge conversion:**
```bash
body=$(echo "$body" | sed \
    -e 's/\[DOC\]/<span class="badge badge-doc">DOC<\/span>/g' \
    -e 's/\[INFERENCIA\]/<span class="badge badge-inf">INFERENCIA<\/span>/g' \
    -e 's/\[SUPUESTO\]/<span class="badge badge-sup">SUPUESTO<\/span>/g' \
    -e 's/\[DATOS\]/<span class="badge badge-dat">DATOS<\/span>/g' \
    -e 's/\[CONFIG\]/<span class="badge badge-cfg">CONFIG<\/span>/g' \
    -e 's/\[STAKEHOLDER\]/<span class="badge badge-stk">STAKEHOLDER<\/span>/g' \
    -e 's/\[CODIGO\]/<span class="badge badge-cod">CÓDIGO<\/span>/g' \
    -e 's/\[CÓDIGO\]/<span class="badge badge-cod">CÓDIGO<\/span>/g' \
)
```

**Mermaid block conversion:**
```bash
body=$(echo "$body" | sed -E \
    's/<pre><code class="language-mermaid">/<pre class="mermaid">/g; s/<\/code><\/pre>/<\/pre>/g')
```

**TOC extraction (macOS-compatible — NO `grep -P`):**
```bash
# IMPORTANT: macOS grep does not support -P (Perl regex)
# Use sed instead of grep -oP for h2 extraction
local toc_links=""
local counter=0
while IFS= read -r h2text; do
    counter=$((counter + 1))
    local slug=$(echo "$h2text" | tr '[:upper:]' '[:lower:]' | \
        sed -E 's/[^a-záéíóúñü0-9]+/-/g; s/^-+|-+$//g')
    toc_links="${toc_links}<a href=\"#${slug}\">${h2text}</a>"
    # Add id to h2 in body
    local escaped_h2=$(echo "$h2text" | sed 's/[&/\]/\\&/g')
    body=$(echo "$body" | sed "s|<h2>${escaped_h2}</h2>|<h2 id=\"${slug}\">${escaped_h2}</h2>|" \
        2>/dev/null || echo "$body")
done < <(echo "$body" | sed -n 's/.*<h2>\([^<]*\)<\/h2>.*/\1/p' | head -8)
```

---

## Per-Deliverable Metadata {#per-deliverable-metadata}

Each deliverable gets unique hero content. Use a case statement on the filename basename:

```bash
case "$basename" in
    00_Discovery_Plan*)
        title="Discovery Plan"; phase="Fase 0"; version="v3.0"
        subtitle="Plan maestro del engagement de discovery"
        kpi1v="16"; kpi1l="Deliverables"
        kpi2v="4"; kpi2l="Gates"
        kpi3v="25"; kpi3l="RAG Files"
        kpi4v="8"; kpi4l="RF Cubiertos" ;;
    # ... more cases ...
    *)
        title="$basename"; phase=""
        subtitle="Deliverable del Discovery"
        kpi1v="—"; kpi1l="—"
        kpi2v="—"; kpi2l="—"
        kpi3v="—"; kpi3l="—"
        kpi4v="—"; kpi4l="—" ;;
esac
```

### Metadata Fields

| Field | Purpose | Example |
|-------|---------|---------|
| `title` | Hero h1 text | "Discovery Plan" |
| `phase` | Meta badge | "Fase 0" |
| `version` | Meta badge | "v3.0" |
| `subtitle` | Hero subtitle paragraph | "Plan maestro del engagement..." |
| `kpi1v`..`kpi4v` | KPI values | "16", "4", "25", "8" |
| `kpi1l`..`kpi4l` | KPI labels | "Deliverables", "Gates", "RAG Files", "RF Cubiertos" |
| `internal` | If "yes", adds red INTERNAL banner | "yes" or "" |

### Hero Assembly

```html
<header class="hero">
  <div class="hero-inner">
    <div class="hero-logo">sofka_</div>
    <div class="hero-meta-badges">
      <span class="hero-meta-badge">${phase}</span>
      <span class="hero-meta-badge">${version}</span>
      <span class="hero-meta-badge">Client Name</span>
    </div>
    <h1>${title} — <span>System Name</span></h1>
    <p class="hero-subtitle">${subtitle}</p>
    <div class="hero-kpis">
      <div class="hero-kpi"><div class="hero-kpi-value orange">${kpi1v}</div><div class="hero-kpi-label">${kpi1l}</div></div>
      <div class="hero-kpi"><div class="hero-kpi-value blue">${kpi2v}</div><div class="hero-kpi-label">${kpi2l}</div></div>
      <div class="hero-kpi"><div class="hero-kpi-value orange">${kpi3v}</div><div class="hero-kpi-label">${kpi3l}</div></div>
      <div class="hero-kpi"><div class="hero-kpi-value blue">${kpi4v}</div><div class="hero-kpi-label">${kpi4l}</div></div>
    </div>
  </div>
</header>
```

---

## Batch Processing with Agentic Squads {#batch-processing}

When processing more than 3 files, spawn parallel sub-agents (one per file). Broad regex patterns on HTML files corrupt digits, accented characters, and hex color codes silently — every agent must verify content integrity before saving.

### Squad Pattern

```
For each file in target_files:
  Spawn sub-agent with:
  ├─ Source file + design-tokens.md reference
  ├─ Steps:
  │   ├─ Parse HTML structure
  │   ├─ Map old CSS → DS v5 tokens
  │   ├─ Rewrite inline CSS
  │   ├─ Preserve all content (no deletion)
  │   ├─ Update charset, fonts, meta tags
  │   ├─ Add accessibility (skip link, focus states)
  │   ├─ Post-verify: spot-check 3 sections for intact digits/accents/hex
  │   └─ Save only if all checks pass
  │
  └─ Concurrency limit: max 4 agents
```

### Error Handling & Rollback

- Validation fails → agent stops, logs error, does NOT save
- Content corruption detected → restore from backup, re-run with safer approach
- More than 1 file fails → stop squad, report failures, require manual review

---

## Safe Text Replacement {#safe-text-replacement}

These rules exist because a previous production incident corrupted dozens of files when a broad Unicode regex accidentally matched digits and accented characters.

### Rule 1: No broad Unicode regex for emoji removal
```bash
# BAD — catches digits and accented chars in some locales
sed -i 's/[\x{1F000}-\x{1FFFF}]//g' file.html

# GOOD — explicit emoji ranges only
perl -CSD -pe 's/[\x{1F300}-\x{1F9FF}\x{2600}-\x{26FF}\x{2700}-\x{27BF}]//g' file.html
```

### Rule 2: Use fixed strings for literal replacements
```bash
# SAFE
sed -i 's/Batallas/Big Rocks/g' file.html

# DANGEROUS
sed -i 's/[a-z]{2,}/REPLACEMENT/g' file.html
```

### Rule 3: Always verify after bulk operations
```bash
grep -o '[0-9]\+' file.html | head -20 > /tmp/before.txt
# ... operation ...
grep -o '[0-9]\+' file.html | head -20 > /tmp/after.txt
diff /tmp/before.txt /tmp/after.txt  # Must be empty
```

### Rule 4: macOS compatibility
```bash
# macOS grep does NOT support -P (Perl regex)
# BAD:  grep -oP '(?<=<h2>)[^<]+' file.html
# GOOD: sed -n 's/.*<h2>\([^<]*\)<\/h2>.*/\1/p' file.html
```

---

## Edge Cases {#edge-cases}

| Scenario | Response |
|----------|----------|
| Very Long Titles (>65 chars) | Split with `<br>` in h1, reduce font-size |
| 15+ Sections | Split into "Part 1" and "Part 2" with navigation links |
| RTL Languages | Add `dir="rtl"` to `<html>`, mirror padding |
| Bilingual (ES + EN) | `lang="es"` default, wrap English in `<span lang="en">` |
| >3 Modals | Limit to 3; use scrollable cards for additional detail |
| >8 Table Rows | `max-height: 400px; overflow-y: auto` on wrapper, sticky `<thead>` |
| INTERNAL documents | Add `class="internal-banner"` div above hero with red background |
| No Mermaid diagrams | Omit Mermaid CDN `<script>` tag from head for smaller file |
| Mermaid with `:::` annotations | Ensure `themeVariables` override works with all node types |

---

## Acceptance Criteria Checklist {#acceptance-criteria}

### Structure
- [ ] Valid HTML5 with `<!DOCTYPE html>`, charset UTF-8, `lang="es"`
- [ ] Hero: black bg, `border-bottom: 8px solid var(--sofka-orange)`
- [ ] Footer: black bg, `border-top: 8px solid var(--sofka-orange)`
- [ ] Sticky TOC with `--sofka-gray-50` bg and `--sofka-gray-300` border
- [ ] Skip-link present: `<a href="#main" class="skip-link">`

### Content
- [ ] Hero title with `<span>` orange highlight
- [ ] Hero has 3–4 KPI items with value + label
- [ ] No unreplaced `{{PLACEHOLDER}}` text
- [ ] All tables styled (dark headers, light cells)
- [ ] Evidence badges converted from `[TAG]` format

### Brand & Contrast
- [ ] Body bg `#FFFFFF`, NOT `#EFEAE4`
- [ ] All body text `--sofka-gray-900` (#111110)
- [ ] Cards/TOC bg `--sofka-gray-50`, NOT `--sofka-white`
- [ ] Positive/success = yellow (#FFD700), never green
- [ ] All text meets WCAG AA contrast (4.5:1 body, 3:1 large)
- [ ] Mermaid: `theme: 'base'`, light fills, black text

### Accessibility
- [ ] Single `<h1>`, sections use `<h2>`
- [ ] Focus states visible (orange outline)
- [ ] `@media (prefers-reduced-motion: reduce)` present
- [ ] `@media print` stylesheet present

### Validation
- [ ] File size under 500KB
- [ ] Responsive at 1440px, 768px, 375px
- [ ] Digits, accented chars, hex codes intact after bulk operations
- [ ] TOC links match h2 section IDs (max 8)
- [ ] Footer tagline: "Construido por profesionales, potenciado por la red agéntica de Sofka."

---

## Extending with New Components {#extending-components}

1. Define CSS in `references/design-tokens.md` — class, variables, responsive behavior
2. Add usage example in `assets/base-template.html`
3. Test with all document types — verify density guidelines aren't broken
4. Add to component usage table in SKILL.md
5. Document anti-patterns if the component is easy to misuse
6. If used in pipeline mode, add bridge CSS rule in the Markdown Bridge section
