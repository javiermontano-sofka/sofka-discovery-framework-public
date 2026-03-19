---
name: metodologia-output-engineering
author: Javier Montano · Comunidad MetodologIA
argument-hint: "[source-file.md] [format: html|docx|pptx|xlsx|pdf|all] — e.g. './06_Roadmap.md html'"
description: >
  Ghost menu system and multi-format production pipeline — converts markdown source
  of truth into HTML, DOCX, PPTX, XLSX, and PDF outputs while preserving content
  integrity and Neo-Swiss brand compliance. Use when producing format conversions, managing
  the ghost menu workflow, or orchestrating multi-format delivery packages.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Output Engineering — Ghost Menu & Multi-Format Pipeline

Orchestrates the ghost menu system: markdown as source of truth, format conversion on demand, **Neo-Swiss brand compliance across all output formats**, and production quality control. Owns the .md to HTML | DOCX | PPTX | XLSX | PDF pipeline.

## Guiding Principle

**Markdown is the source of truth. Everything else is a projection.** Content lives in markdown following the markdown-excellence standard. Each additional format is an optimization for a specific medium: HTML for digital presentation, DOCX for signatures and editing, PPTX for live presentation, XLSX for data analysis, PDF for archival. Conversion never loses content — it only adapts the form.

### Production Philosophy

1. **Single source of truth.** Markdown is the master. Derived formats are regenerated from the markdown.
2. **Format-optimized, not format-duplicated.** Each format leverages its strengths. A PPTX is not a markdown with slides — it is a visual narrative.
3. **Brand compliance is non-negotiable.** MetodologIA Neo-Swiss Design System v6 in every pixel of every format.
4. **Production-ready means finished.** No "drafts" in derived formats. If it is generated, it is ready for the client.

## CRITICAL: Auto-Brand Protocol

**Every format produced by this pipeline MUST be Neo-Swiss brand-compliant.** Before generating any output:

```
Read ${CLAUDE_SKILL_DIR}/../../references/brand-config-neoswiss.json
```

### Format Routing

| Target Format | Skill to Invoke | Brand Assets Required |
|--------------|----------------|----------------------|
| **HTML** | `metodologia-html-brand` | `brand-config-neoswiss.json` + `neo-swiss-template.css` + `logo-metodologia.svg` |
| **DOCX** | `metodologia-brand-docx` | `brand-config-neoswiss.json` (docx section) |
| **PPTX** | `metodologia-brand-pptx` | `brand-config-neoswiss.json` (pptx section) |
| **XLSX** | `metodologia-brand-xlsx` | `brand-config-neoswiss.json` (xlsx section) |
| **PDF** | Generate from HTML (highest fidelity) | Same as HTML |
| **MD** | markdown-excellence standard | Evidence tags, Mermaid, cross-references |

## Inputs

- `$1` — Source file: path to markdown deliverable (required)
- `$2` — Target format: `html`, `docx`, `pptx`, `xlsx`, `pdf`, `all` (default: `html`)

Parse from `$ARGUMENTS`.

## Ghost Menu Protocol

### Trigger

After ANY deliverable markdown is generated and passes editorial review:

```
📄 Entregable listo: [filename].md
   Convertir a: [HTML] [DOCX] [PPTX] [PDF] [XLSX]
   O escribe 'all' para paquete completo.
```

### Activation Flow

```
1. Deliverable.md created → editorial review passes
2. Ghost menu offered to user
3. User selects format(s)
4. Read brand-config-neoswiss.json
5. Route to format-specific skill (see Format Routing table)
6. Output generated with Neo-Swiss brand compliance
7. Quality check: content integrity + brand + accessibility
8. File delivered to user
```

### Auto-Activation Rules

| Deliverable | Auto-Suggest Formats | Reason |
|-------------|---------------------|--------|
| 00 Plan | DOCX | Governance document, may need signature |
| 01-04 Analysis | HTML | Rich presentation, Mermaid rendering |
| 05 Scenarios | HTML + PPTX | Analysis + steering committee presentation |
| 06 Roadmap | HTML + XLSX | Visual + financial data tables |
| 07 Spec | HTML + DOCX | Reference + contractual |
| 08 Pitch | HTML + PPTX | Digital + live presentation |
| 09 Handover | HTML + DOCX | Reference + operations handoff |
| 10 Findings | PPTX + HTML | Executive deck + digital backup |
| 11 Recommendations | PPTX + HTML | Strategy deck + reference |
| 12 AI Opportunities | HTML + PPTX | Innovation showcase |

## Format Production Specifications

### HTML Production

| Element | Standard |
|---------|----------|
| Template | MetodologIA Neo-Swiss Design System v6 |
| Structure | Self-contained single file |
| CSS | Inline (embed `neo-swiss-template.css` + custom components) |
| Mermaid | CDN v10 `<pre class="mermaid">` |
| Colors | Navy #122562, Gold #FFD700, Blue #137DC5 |
| Typography | Poppins (titles), Trebuchet MS (body) |
| Body bg | Off-white #F8F9FC |
| Shadows | Navy-tinted rgba(18,37,98,...) |
| Print | `@media print` styles included |
| Accessibility | WCAG 2.1 AA, semantic HTML5, aria labels |
| Logo | Inline SVG from `logo-metodologia.svg` |
| Footer | Navy bg, gold border, badges, tagline |

### DOCX Production

| Element | Standard |
|---------|----------|
| Conversion | python-docx with Neo-Swiss brand styles |
| Cover page | Navy bg, white title, gold accent, logo |
| TOC | Auto-generated from heading hierarchy |
| Headers/Footers | Branded with page numbers |
| Typography | Poppins headings, Trebuchet MS body, Century Gothic notes |
| Tables | Navy header fill (#122562), zebra stripes (#F8F9FC) |
| Diagrams | Pre-rendered or described (Mermaid to description) |

### PPTX Production

| Element | Standard |
|---------|----------|
| Slide master | Navy bg (#122562), Poppins titles, Trebuchet MS body |
| Accent | Gold #FFD700 for highlights, KPI values, divider numbers |
| Layouts | Title, Section Divider, Content, Two-Column, Full-Image, KPI, Closing |
| Narrative arc | Hook -> Context -> Findings -> Implications -> Action |
| Density | One key message per slide (NO wall-of-text) |
| Speaker notes | Evidence references + talking points |
| Limit | 20 slides max executive, 30 max technical |

### XLSX Production

| Element | Standard |
|---------|----------|
| Headers | Navy fill (#122562), white Poppins text |
| Accent rows | Gold fill (#FFD700), navy text |
| Body | Trebuchet MS, dark text (#1F2833) |
| Borders | Light gray (#E8EAF0) |
| Zebra | Off-white (#F8F9FC) alternating |
| Conditional formatting | Blue positive, amber warning, red critical |
| Structure | Summary sheet first, detail sheets after, filters auto |

### PDF Production

| Element | Standard |
|---------|----------|
| Source | Generated from HTML (highest fidelity) |
| Layout | Print-optimized margins, orphan/widow control |
| Contrast | High contrast for readability |
| Quality | Embed fonts, flatten transparency |

## Brand Compliance Checklist (ALL Formats)

Every output format MUST pass:

| Element | Neo-Swiss Standard |
|---------|-------------------|
| Primary color | Navy #122562 |
| Accent color | Gold #FFD700 |
| Action color | Blue #137DC5 |
| Body text | Dark #1F2833 |
| Title font | Poppins |
| Body font | Trebuchet MS |
| Note font | Futura / Century Gothic |
| Logo | MetodologIA SVG (squircle + 3 pillars + gold circle) |
| Footer | MetodologIA tagline + badges |
| Shadows | Navy-tinted rgba(18,37,98,...) — NOT black |
| Success color | Blue #137DC5 — **NEVER green, NEVER cyan** |

### Legacy Token Blocklist

These tokens are BANNED. If any appear in output, the deliverable FAILS brand compliance:

| Banned Token | Was Used In | Replaced By |
|-------------|------------|-------------|
| `#6366F1` (indigo) | DS v4/v5 primary | `#122562` (navy) |
| `#22D3EE` (cyan) | DS v4/v5 success | `#137DC5` (blue) |
| `#1A1A2E` (dark) | DS v4/v5 bg | `#F8F9FC` (off-white) or `#122562` (navy) |
| `#0F172A` (slate) | DS v4/v5 body bg | `#F8F9FC` (off-white) |
| `#0A122A` (deep navy) | DS brand v1 | `#122562` (navy) |
| Clash Grotesk | DS v4/v5 display | Poppins |
| Inter | DS v4/v5 body | Trebuchet MS |
| Montserrat | DS brand v1 body | Trebuchet MS |
| `rgba(0,0,0,...)` shadows | DS v4/v5 | `rgba(18,37,98,...)` |

## Content Integrity Validation

After format conversion, verify:

| Check | Method |
|-------|--------|
| All sections present | Compare heading count md vs output |
| Tables complete | Row/column count matches |
| Diagrams rendered | Mermaid visible or described |
| Evidence tags preserved | [CODIGO] etc. visible in output |
| Cross-references working | Links/references intact |
| Semantic colors correct | Blue positive, amber warning, red critical |
| Numbers match | Financial figures identical to source |

## Multi-Format Delivery Package

When user requests `all`:

```
{project_name}/
├── {deliverable}.md          ← Source of truth
├── {deliverable}.html        ← Digital presentation (Neo-Swiss)
├── {deliverable}.docx        ← Editable/signable (Neo-Swiss)
├── {deliverable}.pptx        ← Live presentation (Neo-Swiss) — if applicable
├── {deliverable}.xlsx        ← Data tables (Neo-Swiss) — if applicable
├── {deliverable}.pdf         ← Archival
└── README.md                 ← Package contents + generation metadata
```

## Output Configuration

- **Language**: Spanish (Latin American, business register — simple, clear, concise, direct)
- **Attribution**: Expert committee of the MetodologIA Discovery Framework
- **Tagline**: *"Construido por profesionales, potenciado por la red agentica de MetodologIA."*
- **Brand**: Neo-Swiss Clean & Soft Explainer v6

## Edge Cases

- **Mermaid in DOCX/PPTX**: Pre-render as description or embed as image. Never leave raw Mermaid syntax.
- **Very long deliverables**: PPTX should summarize, not transcribe. XLSX extracts data tables only.
- **No tabular data**: Skip XLSX suggestion in ghost menu.
- **Client without MetodologIA brand permission**: Degrade gracefully to neutral styling.
- **Legacy HTML with DS v4/v5 tokens**: Migrate to Neo-Swiss. Replace all banned tokens.

## Limits

- This skill owns **format production and the ghost menu pipeline**. It does NOT own content quality (that is editorial-director + content-strategist) or individual format expertise (that is format-specific skills).
- NEVER modify content during format conversion. Form changes, substance does not.
- NEVER produce formats not requested. Ghost menu suggests — user decides.

## Evaluacion

| Dimension | Peso | Criterio |
|-----------|------|----------|
| Trigger Accuracy | 10% | Descripcion activa triggers correctos sin falsos positivos |
| Completeness | 25% | Todos los entregables cubren el dominio sin huecos |
| Clarity | 20% | Instrucciones ejecutables sin ambiguedad |
| Robustness | 20% | Maneja edge cases y variantes de input |
| Efficiency | 10% | Proceso no tiene pasos redundantes |
| Value Density | 15% | Cada seccion aporta valor practico directo |

**Umbral minimo**: 7/10 en cada dimension para considerar el skill production-ready.

---
**Autor:** Javier Montano · Comunidad MetodologIA | **Version:** 2.0.0 Neo-Swiss
