---
name: metodologia-brand-pptx
description: >
  Generates branded PPTX (PowerPoint) presentations using the MetodologIA Neo-Swiss
  Design System v6. Uses python-pptx to create slide decks with navy backgrounds,
  gold accents, Poppins titles, and Trebuchet MS body text. Use when the user requests
  a presentation, slide deck, PPTX output, or when the ghost menu routes to PPTX format.
argument-hint: "[executive|technical] [source-file.md] [output_path.pptx]"
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

# MetodologIA Brand PPTX — Neo-Swiss Presentation Generator

Generates production-ready PowerPoint presentations following the **MetodologIA Neo-Swiss Clean & Soft Explainer** design system (v6). Every deck uses navy backgrounds, gold accents, Poppins typography, and professional slide layouts optimized for executive and technical audiences.

## CRITICAL: Before Generating ANY PPTX

**ALWAYS read the brand config first:**

```
Read ${CLAUDE_SKILL_DIR}/../../references/brand-config-neoswiss.json
```

Extract the `pptx` section for all slide master specs, colors, fonts, and limits.

## Neo-Swiss PPTX Tokens

All values sourced from `brand-config-neoswiss.json`:

| Token | Value | Usage |
|-------|-------|-------|
| Slide Master BG | `#122562` (Navy) | Title slides, dividers, closing |
| Title Font | Poppins | All headings and slide titles |
| Title Size | 36pt | Slide titles |
| Title Color | `#FFFFFF` (White) | On navy backgrounds |
| Body Font | Trebuchet MS | All body text, bullets, notes |
| Body Size | 18pt | Standard body |
| Body Color | `#F8F9FC` (Off-white) | On navy backgrounds |
| Accent | `#FFD700` (Gold) | KPI values, divider numbers, emphasis |
| Primary | `#137DC5` (Blue) | Links, positive indicators |
| Content BG | `#FFFFFF` (White) | Content slides |
| Content Title | `#122562` (Navy) | Titles on white backgrounds |
| Content Body | `#1F2833` (Dark) | Body text on white backgrounds |
| Max Slides (Executive) | 20 | — |
| Max Slides (Technical) | 30 | — |

## Slide Types (7)

### 1. Title Slide
- **Background**: Navy gradient (#122562)
- **Logo**: MetodologIA SVG rendered as image (top-left or centered)
- **Title**: Poppins 36pt, white, bold
- **Subtitle**: Trebuchet MS 18pt, off-white
- **Accent bar**: Gold 4px line below title
- **Badges**: Date, version, document type

### 2. Section Divider
- **Background**: Navy (#122562)
- **Section number**: Poppins 72pt, gold (#FFD700), bold
- **Title**: Poppins 36pt, white
- **Subtitle**: Trebuchet MS 18pt, off-white (optional)

### 3. Content Slide
- **Background**: White (#FFFFFF)
- **Title**: Poppins 28pt, navy (#122562)
- **Body**: Trebuchet MS 18pt, dark (#1F2833)
- **Bullets**: Navy dot markers
- **One key message per slide**

### 4. Two-Column Slide
- **Background**: White
- **Title**: Poppins 28pt, navy
- **Left column**: Current state / before
- **Right column**: Target state / after
- **Divider**: Gold vertical line

### 5. Full Visual Slide
- **Background**: White or navy
- **Single diagram, chart, or image**
- **Minimal text**: Title + caption only
- **Source credit**: Century Gothic 9pt, gray

### 6. KPI Slide
- **Background**: Navy (#122562)
- **3-4 KPI cards**: Gold values (Poppins 48pt), white labels
- **Grid layout**: 2x2 or 1x4
- **Minimal text below values**

### 7. Closing Slide
- **Background**: Navy (#122562)
- **Logo**: Centered, larger
- **Tagline**: Gold, Poppins 18pt
- **Contact info**: White, Trebuchet MS 14pt
- **CTA**: Gold accent button style

## python-pptx Implementation Template

```python
from pptx import Presentation
from pptx.util import Inches, Pt, Emu
from pptx.dml.color import RGBColor
from pptx.enum.text import PP_ALIGN
import json

# Load brand config
with open('references/brand-config-neoswiss.json') as f:
    config = json.load(f)

pptx_config = config['pptx']

# Color constants
NAVY = RGBColor(0x12, 0x25, 0x62)
GOLD = RGBColor(0xFF, 0xD7, 0x00)
BLUE = RGBColor(0x13, 0x7D, 0xC5)
WHITE = RGBColor(0xFF, 0xFF, 0xFF)
OFF_WHITE = RGBColor(0xF8, 0xF9, 0xFC)
DARK = RGBColor(0x1F, 0x28, 0x33)

# Font constants
TITLE_FONT = 'Poppins'
BODY_FONT = 'Trebuchet MS'
NOTE_FONT = 'Century Gothic'

prs = Presentation()
prs.slide_width = Inches(13.333)  # 16:9
prs.slide_height = Inches(7.5)

# Title slide
slide = prs.slides.add_slide(prs.slide_layouts[6])  # Blank
bg = slide.background
fill = bg.fill
fill.solid()
fill.fore_color.rgb = NAVY

# Add title
txBox = slide.shapes.add_textbox(Inches(1), Inches(2), Inches(11), Inches(2))
tf = txBox.text_frame
p = tf.paragraphs[0]
p.text = "Titulo del Deliverable"
p.font.name = TITLE_FONT
p.font.size = Pt(36)
p.font.color.rgb = WHITE
p.font.bold = True
p.alignment = PP_ALIGN.LEFT

# Save
prs.save('output.pptx')
```

## Narrative Arc

Every PPTX follows this structure:

1. **Title** — What this is, who it's for
2. **Agenda/TOC** — 4-6 sections max
3. **Context** — Why we're here (1-2 slides)
4. **Findings** — What we discovered (3-6 slides)
5. **Implications** — So what? (2-3 slides)
6. **Recommendations** — Now what? (2-3 slides)
7. **Next Steps** — Action items with owners and dates
8. **Closing** — CTA + contact

## Rules

1. **One message per slide** — NO wall of text
2. **Max 6 bullets per slide** — Each bullet max 2 lines
3. **KPIs use gold values** — Numbers are the hero
4. **Every slide has speaker notes** — Evidence references + talking points
5. **Diagrams are simplified** — Complex Mermaid → simplified visual
6. **Max 20 slides (executive)** / 30 slides (technical)
7. **NO animations** — Clean transitions only (if any)

## Validation Gate

- [ ] `brand-config-neoswiss.json` read before generation
- [ ] All navy backgrounds use #122562 (NOT #1A1A2E, NOT #0A122A)
- [ ] Title font is Poppins (NOT Inter, NOT Clash Grotesk)
- [ ] Body font is Trebuchet MS (NOT Montserrat, NOT Inter)
- [ ] Gold accent is #FFD700
- [ ] Slide count within limits (20 exec / 30 tech)
- [ ] Every slide has speaker notes
- [ ] One key message per slide
- [ ] Logo on title and closing slides

---
**Autor:** Javier Montano · Comunidad MetodologIA | **Version:** 1.0.0 Neo-Swiss
