---
name: metodologia-brand-docx
description: >
  Generates branded DOCX (Word) documents using the MetodologIA Neo-Swiss
  Design System v6. Uses python-docx to create professional documents with navy
  headers, gold accents, Poppins headings, and Trebuchet MS body text. Use when
  the user requests a Word document, DOCX output, or when the ghost menu routes to DOCX.
argument-hint: "[source-file.md] [output_path.docx]"
author: Javier Montano · Comunidad MetodologIA
model: opus
context: fork
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# MetodologIA Brand DOCX — Neo-Swiss Document Generator

Generates production-ready Word documents following the **MetodologIA Neo-Swiss Clean & Soft Explainer** design system (v6). Every document uses navy-themed headers, gold accents, Poppins headings, Trebuchet MS body text, and branded cover pages.

## CRITICAL: Before Generating ANY DOCX

**ALWAYS read the brand config first:**

```
Read ${CLAUDE_SKILL_DIR}/../../references/brand-config-neoswiss.json
```

Extract the `docx` section for all heading styles, table specs, and cover page design.

## Neo-Swiss DOCX Tokens

All values sourced from `brand-config-neoswiss.json`:

| Element | Font | Size | Color | Bold |
|---------|------|------|-------|------|
| Heading 1 | Poppins | 24pt | #122562 (Navy) | Yes |
| Heading 2 | Poppins | 18pt | #137DC5 (Blue) | Yes |
| Heading 3 | Poppins | 14pt | #122562 (Navy) | Yes |
| Body | Trebuchet MS | 11pt | #1F2833 (Dark) | No |
| Note / Caption | Century Gothic | 9pt | #808080 (Gray) | No |
| Table Header | Poppins | 10pt | #FFFFFF on #122562 | Yes |
| Table Accent | — | — | #122562 on #FFD700 | — |
| Footer | Century Gothic | 8pt | #808080 | No |

### Cover Page
- **Background**: Navy (#122562)
- **Title**: White, Poppins 36pt, bold
- **Subtitle**: Off-white (#F8F9FC), Trebuchet MS 18pt
- **Accent bar**: Gold (#FFD700) horizontal rule
- **Logo**: MetodologIA (described or embedded)
- **Date, version, confidentiality**

## Document Structure

1. **Cover Page** — Navy bg, white title, gold accent, logo
2. **Table of Contents** — Auto-generated from heading hierarchy
3. **Headers** — Logo left, document title right
4. **Content Sections** — Heading styles branded, evidence tags preserved
5. **Tables** — Navy header fills, zebra stripes (#F8F9FC), gold accent rows
6. **Footers** — Page X of Y, MetodologIA tagline, document ID

## python-docx Implementation Template

```python
from docx import Document
from docx.shared import Pt, Inches, RGBColor, Cm
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.oxml.ns import qn
import json

# Load brand config
with open('references/brand-config-neoswiss.json') as f:
    config = json.load(f)

docx_config = config['docx']

doc = Document()

# Set default font
style = doc.styles['Normal']
font = style.font
font.name = 'Trebuchet MS'
font.size = Pt(11)
font.color.rgb = RGBColor(0x1F, 0x28, 0x33)

# Configure Heading 1
h1_style = doc.styles['Heading 1']
h1_font = h1_style.font
h1_font.name = 'Poppins'
h1_font.size = Pt(24)
h1_font.color.rgb = RGBColor(0x12, 0x25, 0x62)
h1_font.bold = True

# Configure Heading 2
h2_style = doc.styles['Heading 2']
h2_font = h2_style.font
h2_font.name = 'Poppins'
h2_font.size = Pt(18)
h2_font.color.rgb = RGBColor(0x13, 0x7D, 0xC5)
h2_font.bold = True

# Configure Heading 3
h3_style = doc.styles['Heading 3']
h3_font = h3_style.font
h3_font.name = 'Poppins'
h3_font.size = Pt(14)
h3_font.color.rgb = RGBColor(0x12, 0x25, 0x62)
h3_font.bold = True

# Table with branded header
table = doc.add_table(rows=1, cols=3)
hdr = table.rows[0]
for cell in hdr.cells:
    # Navy background
    shading = cell._element.get_or_add_tcPr()
    shading_elm = shading.makeelement(qn('w:shd'), {
        qn('w:fill'): '122562',
        qn('w:val'): 'clear'
    })
    shading.append(shading_elm)
    # White text
    for paragraph in cell.paragraphs:
        for run in paragraph.runs:
            run.font.color.rgb = RGBColor(0xFF, 0xFF, 0xFF)
            run.font.name = 'Poppins'
            run.font.bold = True
            run.font.size = Pt(10)

doc.save('output.docx')
```

## Table Styles

| Row Type | Background | Font Color | Font |
|----------|-----------|------------|------|
| Header | #122562 (Navy) | #FFFFFF (White) | Poppins 10pt Bold |
| Accent | #FFD700 (Gold) | #122562 (Navy) | Poppins 10pt Bold |
| Body odd | #FFFFFF (White) | #1F2833 (Dark) | Trebuchet MS 10pt |
| Body even | #F8F9FC (Off-white) | #1F2833 (Dark) | Trebuchet MS 10pt |
| Positive | — | #137DC5 (Blue) | Bold |
| Warning | — | #D97706 (Amber) | Bold |
| Critical | — | #DC2626 (Red) | Bold |

## Evidence Tags in DOCX

Preserve evidence tags as inline formatted text:
- `[DOC]` — Blue (#137DC5) bold
- `[STAKEHOLDER]` — Navy (#122562) bold
- `[INFERENCIA]` — Lavender (#BBA0CC) bold
- `[SUPUESTO]` — Amber (#D97706) bold
- `[CODIGO]` — Gray (#808080) bold

## Validation Gate

- [ ] `brand-config-neoswiss.json` read before generation
- [ ] Heading 1 is Poppins 24pt Navy #122562
- [ ] Heading 2 is Poppins 18pt Blue #137DC5
- [ ] Body is Trebuchet MS 11pt Dark #1F2833
- [ ] Table headers have Navy fill with white text
- [ ] Cover page has Navy bg with gold accent
- [ ] Footer includes MetodologIA tagline
- [ ] NO Inter, NO Clash Grotesk, NO Montserrat fonts
- [ ] NO #6366F1, NO #22D3EE, NO #0A122A colors

---
**Autor:** Javier Montano · Comunidad MetodologIA | **Version:** 1.0.0 Neo-Swiss
