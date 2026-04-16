---
description: "Create full-branded document in any format (HTML, DOCX, XLSX, PPTX, PDF) using MetodologIA Design System v5 — 27 tokens, 126 components, 4 page types"
user-invocable: true
---

# METODOLOGIA · BRAND PUBLISH · Full-Fidelity Branded Output

## ROLE

Editorial Publisher — activates `metodologia-design-system-brand` as primary skill.
Support skills: `metodologia-output-engineering` (ghost menu), `metodologia-html-brand` (HTML legacy), `metodologia-brand-docx` (DOCX), `metodologia-brand-xlsx` (XLSX).
Agent: `editorial-publisher`.

## OBJECTIVE

Create a production-ready, full-branded document from markdown source or raw content. Applies the MetodologIA Design System v5 with complete token compliance, WCAG AA accessibility, responsive layout, and print readiness.

## USAGE

```
/mao:brand-publish <format> [source] [page-type]
```

### Arguments

| Argument | Values | Default | Description |
|----------|--------|---------|-------------|
| `format` | `html` `docx` `xlsx` `pptx` `pdf` `all` | Required | Target output format |
| `source` | Path to `.md` file or deliverable name | Auto-detect | Content source |
| `page-type` | `dark-executive` `light-technical` `timeline` `commercial` | Auto-detect | Page template to apply |

### Examples

```
/mao:brand-publish html                          # HTML from last deliverable
/mao:brand-publish docx 03_Analisis_ASIS.md      # DOCX from specific file
/mao:brand-publish all                            # All 5 formats from last deliverable
/mao:brand-publish pptx dark-executive            # PPTX with executive template
/mao:brand-publish xlsx 06_Roadmap.md             # XLSX data tables from roadmap
```

## AUTO-DETECTION PROTOCOL

When invoked without explicit source:

1. **Last deliverable**: Scan `discovery/` and cwd for most recent `.md` deliverable (00-14 pattern).
2. **Page type inference**: Detect from deliverable type:
   - `08_Pitch`, `09_Handover` → Dark-First Executive (Type A)
   - `03_ASIS`, `07_Spec`, `04_Flujos` → Light-First Technical (Type B)
   - `00_Plan`, `06_Roadmap`, `05_Escenarios` → Timeline/Roadmap (Type C)
   - `04b_Guia_Comercial` → Commercial (Type D)
3. **Companion files**: Load brand config from `references/design-system-metodologia.md`.
4. **If no source found**: Ask user to specify the content or provide a markdown file.

## PROCESS

### Step 1 — Validate Source

Read the markdown source. Verify it has:
- [ ] Title (h1)
- [ ] Structured sections (h2/h3)
- [ ] Content sufficient for the target format

### Step 2 — Select Page Type

Auto-detect or use explicit `page-type` argument:

| Type | Template | Best For |
|------|----------|----------|
| **A** Dark-First Executive | Hero + alternating dark/light + modals + CTA | Pitch, Handover, Executive Summary |
| **B** Light-First Technical | Compact hero + sticky TOC + data tables + callouts | Spec, AS-IS, Architecture, Flows |
| **C** Timeline/Roadmap | Hero + phase grid + timeline + evolution steps | Plan, Roadmap, Scenarios |
| **D** Commercial | Hero + pricing tables + ROI grid + FAQ accordion | Commercial Guide, Proposals |

### Step 3 — Apply Design System v5

Inject the canonical token catalog:

```
--mia-navy: #0A122A       --mia-blue: #137DC5
--mia-gold: #FFD700       --mia-white: #FFFFFF
--mia-text: #C8D1E0       --mia-dark-text: #1F2833
```

**Immutable rules:**
- Gold `#FFD700` for success/CTA — NEVER green
- Navy `#0A122A` for authority — NEVER pure black
- Zero hardcoded colors — all via `--mia-*` tokens
- WCAG AA >= 4.5:1 contrast on all text

### Step 4 — Render Format

| Format | Engine | Key Features |
|--------|--------|-------------|
| **HTML** | Inline CSS + JS | Self-contained, Mermaid CDN, modals, scroll animations, responsive, print-ready |
| **DOCX** | python-docx | Cover page, auto TOC, Poppins headings, Montserrat body, zebra tables |
| **XLSX** | openpyxl | Branded headers, conditional formatting, filters, formula-free values |
| **PPTX** | python-pptx | Navy gradient slides, gold accents, max 20 exec / 30 tech, speaker notes |
| **PDF** | HTML → print | High-contrast, embedded fonts, archival quality |

### Step 5 — Brand Compliance Check

Validate before delivery:
- [ ] Token compliance: zero hardcoded colors
- [ ] WCAG AA: contrast >= 4.5:1
- [ ] Self-contained (HTML): no broken external deps
- [ ] Responsive (HTML): mobile + desktop
- [ ] Print-ready: @media print with page-break control
- [ ] Document ID in footer: `MTIA-{NN}-{TIPO}-{CLIENTE}-SE`
- [ ] Filename convention: `{fase}_{entregable}_{cliente}_{WIP}.{ext}`

### Step 6 — Deliver + Ghost Menu

Output the file and offer conversion:

```
📄 Entregable listo: {filename}.{ext}
────────────────────────────────
  Convertir a: [HTML] [DOCX] [PPTX] [XLSX] [PDF]
  Escriba 'all' para paquete completo.
```

## OUTPUT

- **Primary**: The requested format file, production-ready
- **Secondary**: Ghost menu for additional format conversions
- **Naming**: `{fase}_{entregable}_{cliente}_{WIP|Aprobado}.{ext}`
- **Location**: Current working directory or `discovery/outputs/`

## GUARDRAILS

- NEVER output without brand compliance validation
- NEVER use green for success indicators — gold only
- NEVER hardcode colors — use Design System v5 tokens
- NEVER exceed 20 slides (executive) or 30 slides (technical) in PPTX
- NEVER ship HTML with external CSS dependencies (except Google Fonts + Mermaid CDN)
- If format cannot preserve critical content (e.g., Mermaid in DOCX), warn and offer alternative
