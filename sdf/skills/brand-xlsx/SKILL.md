---
name: metodologia-brand-xlsx
description: >
  Generates branded XLSX (Excel) spreadsheets using the MetodologIA Neo-Swiss
  Design System v6. Uses openpyxl to create professional spreadsheets with navy
  headers, gold accent rows, and semantic conditional formatting. Use when the user
  requests a spreadsheet, XLSX output, or when the ghost menu routes to XLSX.
argument-hint: "[source-file.md] [output_path.xlsx]"
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

# MetodologIA Brand XLSX — Neo-Swiss Spreadsheet Generator

Generates production-ready Excel spreadsheets following the **MetodologIA Neo-Swiss Clean & Soft Explainer** design system (v6). Every spreadsheet uses navy header fills, gold accent rows, Poppins header text, Trebuchet MS body text, and semantic conditional formatting.

## CRITICAL: Before Generating ANY XLSX

**ALWAYS read the brand config first:**

```
Read ${CLAUDE_SKILL_DIR}/../../references/brand-config-neoswiss.json
```

Extract the `xlsx` section for all fill colors, font specs, and formatting rules.

## Neo-Swiss XLSX Tokens

All values sourced from `brand-config-neoswiss.json`:

| Element | Fill | Font Color | Font Family | Size |
|---------|------|-----------|-------------|------|
| Header | #122562 (Navy) | #FFFFFF (White) | Poppins | 11pt |
| Accent Row | #FFD700 (Gold) | #122562 (Navy) | Poppins | 11pt |
| Body | — | #1F2833 (Dark) | Trebuchet MS | 10pt |
| Zebra Light | #F8F9FC | #1F2833 (Dark) | Trebuchet MS | 10pt |
| Zebra Dark | #FFFFFF | #1F2833 (Dark) | Trebuchet MS | 10pt |
| Positive | #137DC5 fill | #FFFFFF (White) | Bold | — |
| Warning | #D97706 fill | #FFFFFF (White) | Bold | — |
| Critical | #DC2626 fill | #FFFFFF (White) | Bold | — |
| Border | #E8EAF0 (Light gray) | — | — | — |

## Sheet Structure

1. **Sheet "Resumen"** — KPIs, metricas clave, dashboard-ready summary
2. **Sheet "Datos"** — Main data table with auto-filters
3. **Sheet "Analisis"** — Scoring matrices, evaluation grids
4. **Additional sheets** — As needed per domain

## openpyxl Implementation Template

```python
from openpyxl import Workbook
from openpyxl.styles import (
    PatternFill, Font, Border, Side, Alignment, NamedStyle
)
import json

# Load brand config
with open('references/brand-config-neoswiss.json') as f:
    config = json.load(f)

xlsx_config = config['xlsx']

wb = Workbook()

# Define Neo-Swiss styles
header_fill = PatternFill(start_color='122562', end_color='122562', fill_type='solid')
header_font = Font(color='FFFFFF', name='Poppins', bold=True, size=11)
header_alignment = Alignment(horizontal='left', vertical='center', wrap_text=True)

gold_fill = PatternFill(start_color='FFD700', end_color='FFD700', fill_type='solid')
gold_font = Font(color='122562', name='Poppins', bold=True, size=11)

body_font = Font(color='1F2833', name='Trebuchet MS', size=10)
zebra_fill = PatternFill(start_color='F8F9FC', end_color='F8F9FC', fill_type='solid')

positive_fill = PatternFill(start_color='137DC5', end_color='137DC5', fill_type='solid')
positive_font = Font(color='FFFFFF', bold=True)

warning_fill = PatternFill(start_color='D97706', end_color='D97706', fill_type='solid')
warning_font = Font(color='FFFFFF', bold=True)

critical_fill = PatternFill(start_color='DC2626', end_color='DC2626', fill_type='solid')
critical_font = Font(color='FFFFFF', bold=True)

thin_border = Border(
    bottom=Side(style='thin', color='E8EAF0')
)

# Create summary sheet
ws = wb.active
ws.title = 'Resumen'

# Apply header row
for col_idx, header in enumerate(['Dimension', 'Valor', 'Estado'], 1):
    cell = ws.cell(row=1, column=col_idx, value=header)
    cell.fill = header_fill
    cell.font = header_font
    cell.alignment = header_alignment

# Apply body rows with zebra striping
for row_idx in range(2, 20):
    for col_idx in range(1, 4):
        cell = ws.cell(row=row_idx, column=col_idx)
        cell.font = body_font
        cell.border = thin_border
        if row_idx % 2 == 0:
            cell.fill = zebra_fill

# Auto-filter
ws.auto_filter.ref = ws.dimensions

# Column widths
ws.column_dimensions['A'].width = 30
ws.column_dimensions['B'].width = 20
ws.column_dimensions['C'].width = 15

# Freeze header row
ws.freeze_panes = 'A2'

wb.save('output.xlsx')
```

## Conditional Formatting Rules

| Condition | Cell Fill | Font |
|-----------|----------|------|
| Value contains "Alto" or "High" or score >= 8 | Blue #137DC5 | White bold |
| Value contains "Medio" or "Medium" or score 5-7 | Amber #D97706 | White bold |
| Value contains "Bajo" or "Low" or "Critico" or score < 5 | Red #DC2626 | White bold |
| Gold accent row (totals, highlights) | Gold #FFD700 | Navy #122562 bold |

## Best Practices

1. **Values only** — NO formulas (formula-free for portability)
2. **Auto-filters** on every data table
3. **Freeze panes** on header row
4. **Column widths** auto-fit or manual minimum
5. **Summary sheet first**, detail sheets after
6. **Pivot-compatible** structure (flat tables)
7. **No merged cells** in data ranges (breaks sorting/filtering)

## Validation Gate

- [ ] `brand-config-neoswiss.json` read before generation
- [ ] Header row has Navy fill (#122562) with white Poppins text
- [ ] Body text is Trebuchet MS 10pt Dark (#1F2833)
- [ ] Zebra striping uses Off-white (#F8F9FC)
- [ ] Borders use Light gray (#E8EAF0)
- [ ] Conditional formatting uses Blue/Amber/Red (NOT green for positive)
- [ ] Auto-filters enabled
- [ ] Freeze panes on header row
- [ ] NO #6366F1, NO #22D3EE, NO #0A122A, NO Inter font

---
**Autor:** Javier Montano · Comunidad MetodologIA | **Version:** 1.0.0 Neo-Swiss
