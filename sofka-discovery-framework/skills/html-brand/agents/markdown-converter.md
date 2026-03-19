# Markdown-to-HTML Converter Agent

## Role
Convert one or more markdown files to branded Sofka HTML using the Design System v5 pipeline. This is the production-proven conversion path used for batch deliverable generation.

## Inputs
- `SOURCE_PATH`: Path to .md file or directory containing .md files
- `OUTPUT_DIR`: Directory for generated .html files
- `CLIENT_NAME`: Client name for hero badges and footer
- `SYSTEM_NAME`: System/project name for hero h1 highlight
- `DESIGN_TOKENS_PATH`: Path to design-tokens.md
- `OPERATIONS_GUIDE_PATH`: Path to operations-guide.md

## Pipeline Steps

### Step 1: Read References
- Load design-tokens.md for CSS (root tokens + bridge CSS + evidence badges + Mermaid config)
- Load operations-guide.md for per-deliverable metadata pattern

### Step 2: For Each .md File

1. **Determine metadata** — Match filename against known patterns (see operations-guide.md § Per-Deliverable Metadata). If no match, use filename as title with generic KPIs.

2. **Parse markdown** — Run `npx marked --gfm` on the .md file.

3. **Post-process evidence badges** — Convert `[DOC]`, `[INFERENCIA]`, `[SUPUESTO]`, `[DATOS]`, `[CONFIG]`, `[STAKEHOLDER]`, `[CÓDIGO]`/`[CODIGO]` to styled `<span class="badge">` elements using sed rules from design-tokens.md.

4. **Post-process Mermaid blocks** — Convert `<pre><code class="language-mermaid">` to `<pre class="mermaid">` and strip `</code>` before `</pre>`.

5. **Extract TOC** — Pull h2 text from HTML body using `sed -n 's/.*<h2>\([^<]*\)<\/h2>.*/\1/p'` (macOS-compatible). Limit to 8 entries. Generate slug IDs and inject into h2 elements.

6. **Check for INTERNAL marker** — If filename contains "Revision_Negocio" or similar internal doc pattern, set `internal=yes` for red banner.

7. **Assemble HTML** — Combine:
   - `<head>`: charset, viewport, Google Fonts preconnect + Inter, Fontshare Clash Grotesk, Mermaid CDN + init, inline `<style>` (DS v5 CSS + bridge CSS + evidence badges + Mermaid container)
   - Skip link
   - Optional internal banner
   - Hero with per-deliverable metadata
   - Sticky TOC nav
   - `<main class="container">` with converted body
   - Footer with Sofka tagline
   - TOC tracking JS

8. **Verify** — Check file size (< 500KB), spot-check that body bg is `#FFFFFF`, no white-on-crema.

### Step 3: Report
Output summary:
```
[OK] filename.html (XXkb)
[OK] filename2.html (XXkb)
Done: N files converted with Design System v5
```

## Contrast Rules (NON-NEGOTIABLE)
- Body: `background: #FFFFFF`, `color: var(--sofka-gray-900)`
- Cards: `background: var(--sofka-gray-50)`
- TOC: `background: var(--sofka-gray-50)`, `border-bottom: 2px solid var(--sofka-gray-300)`
- Table headers: `background: var(--sofka-gray-900)`, `color: var(--sofka-white)`
- Table cells: `background: var(--sofka-gray-100)`, `color: var(--sofka-gray-900)`
- Mermaid: `theme: 'base'`, light fills, `#000000` text
- NEVER white text on crema background

## Error Protocol
- If `npx marked` fails → skip file, report error, continue batch
- If evidence badge sed corrupts content → verify digits before/after
- If file > 500KB → warn but still save (not a blocker)
- If no h2 headers found → generate TOC-less document (still valid)
