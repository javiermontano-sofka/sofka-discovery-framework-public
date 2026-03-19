# DOCX Generation Patterns

## python-docx Core Patterns

### Document Setup

```python
from docx import Document
from docx.shared import Inches, Pt, RGBColor, Cm
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.enum.table import WD_TABLE_ALIGNMENT
from docx.enum.section import WD_ORIENT
from docx.oxml.ns import qn

doc = Document()

# Set default font
style = doc.styles['Normal']
font = style.font
font.name = 'Inter'
font.size = Pt(11)
```

### Cover Page Pattern

```python
def create_cover(doc, title, asignatura, grado, year, brand):
    section = doc.sections[0]
    # Add spacing before title
    for _ in range(6):
        doc.add_paragraph()

    title_para = doc.add_paragraph()
    title_para.alignment = WD_ALIGN_PARAGRAPH.CENTER
    run = title_para.add_run(title)
    run.font.size = Pt(28)
    run.font.color.rgb = RGBColor.from_string(brand['primary'].lstrip('#'))
    run.bold = True

    subtitle = doc.add_paragraph()
    subtitle.alignment = WD_ALIGN_PARAGRAPH.CENTER
    run = subtitle.add_run(f"{asignatura} — {grado}")
    run.font.size = Pt(16)

    doc.add_page_break()
```

### Heading Hierarchy

| Level | Style | Usage |
|-------|-------|-------|
| Heading 1 | Unit title | "Unidad 1: El Mundo Natural" |
| Heading 2 | Section | "Apertura", "Desarrollo", "Cierre", "Evaluacion" |
| Heading 3 | Subsection | "Actividad 1", "Piensa y Reflexiona" |
| Normal | Body text | Content paragraphs |

### Table Formatting Pattern

```python
def create_rubric_table(doc, headers, rows, brand):
    table = doc.add_table(rows=len(rows)+1, cols=len(headers))
    table.alignment = WD_TABLE_ALIGNMENT.CENTER

    # Header row
    for i, header in enumerate(headers):
        cell = table.rows[0].cells[i]
        cell.text = header
        for paragraph in cell.paragraphs:
            for run in paragraph.runs:
                run.font.bold = True
                run.font.color.rgb = RGBColor(0xFF, 0xFF, 0xFF)
        # Background color
        shading = cell._tc.get_or_add_tcPr()
        shading_elem = OxmlElement('w:shd')
        shading_elem.set(qn('w:fill'), brand['primary'].lstrip('#'))
        shading.append(shading_elem)

    # Data rows
    for r, row_data in enumerate(rows):
        for c, cell_data in enumerate(row_data):
            table.rows[r+1].cells[c].text = str(cell_data)
```

### DZ-Ref Tag Formatting

DZ reference tags should appear as small, colored footnote-style annotations:

```python
def add_dz_ref(paragraph, dz_code):
    run = paragraph.add_run(f" [{dz_code}]")
    run.font.size = Pt(7)
    run.font.color.rgb = RGBColor(0x63, 0x66, 0xF1)  # primary color
    run.font.superscript = True
```

### Brand Config Schema

```json
{
  "primary": "#6366F1",
  "accent": "#22D3EE",
  "background": "#EFEAE4",
  "text": "#1E293B",
  "font_heading": "Inter",
  "font_body": "Inter",
  "logo_path": null,
  "editorial_name": "JM Labs"
}
```

## File Naming Convention

```
{asignatura_slug}_{grado_slug}_texto_alumno.docx
{asignatura_slug}_{grado_slug}_guia_docente.docx
```

Examples:
- `ciencias_naturales_5to_egb_texto_alumno.docx`
- `matematicas_3ro_egb_guia_docente.docx`

## Common Issues and Solutions

| Issue | Solution |
|-------|----------|
| Font not available | Use fallback (Calibri on Windows, Arial on Mac) |
| Table too wide | Set column widths proportionally, auto-fit |
| Special characters break | Ensure UTF-8 encoding, escape XML entities |
| File too large | Compress images, limit embedded content |
| TOC not updating | Requires Word to refresh — add instruction note |
