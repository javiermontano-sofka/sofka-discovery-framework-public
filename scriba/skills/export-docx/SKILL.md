---
name: export-docx
author: JM Labs
description: >
  Export editorial content to branded Word document (.docx) using python-docx. Generates texto alumno and guia docente as separate files ready for layout team. Trigger on: exportar docx, export word, generar word, documento word, maquetacion, docx, enviar a diagramacion.
allowed-tools:
  - Read
  - Write
  - Bash
  - Glob
---

# Exportar a DOCX

> The Word document bridges AI-generated content with human layout workflows. It must be clean, well-structured, and immediately usable by diagramadores.

## Purpose

Generate branded Word documents from editorial content using python-docx, producing separate files for texto alumno and guia docente.

## Procedure

1. Read brand-config.json for color tokens and typography settings.
   Fallback: JM Labs defaults (#6366F1 primary, #22D3EE accent, #EFEAE4 background, Inter font).

2. Collect all generated units (read from units/ directory or session state).

3. Generate texto alumno DOCX:
   - Cover page: Title, asignatura, grado, editorial branding, year
   - Table of contents (auto-generated from headings)
   - Per unit: Heading 1 (unit title), then sections as Heading 2 (Apertura, Desarrollo, Cierre, Evaluacion)
   - Activities formatted with numbered lists
   - Key vocabulary in bold
   - DZ-ref tags as small footnotes or marginalia
   - Tables for rubricas with header row styled
   - Page breaks between units

4. Generate guia docente DOCX:
   - Same cover page format but marked "Guia Docente"
   - Per unit: weekly planning table, methodological orientations, DUA adaptations (highlighted boxes), rubrics
   - Indicators linked to destrezas

5. Write DOCX files using python-docx script:
   ```python
   from docx import Document
   from docx.shared import Inches, Pt, RGBColor
   from docx.enum.text import WD_ALIGN_PARAGRAPH
   ```

6. Save to exports/ directory.

## Inputs

| Name | Source | Required |
|------|--------|----------|
| Generated units | units/ directory | Yes |
| Generated guides | guides/ directory | For guia docente |
| brand-config.json | references/ | Recommended |

## Outputs

| Artifact | Format | Destination |
|----------|--------|-------------|
| Texto alumno | .docx | exports/ |
| Guia docente | .docx | exports/ |

## Acceptance Criteria

- DOCX opens correctly in Word/LibreOffice
- All units present with correct heading hierarchy
- Branding applied (colors, fonts where possible)
- Tables properly formatted (no broken cells)
- Page breaks between units
- DZ-ref tags preserved in document
- File size reasonable (<10MB per document)

## Output Format

```markdown
# Export DOCX — Report

## Archivos Generados
| Archivo | Tamano | Unidades | Estado |
|---------|--------|----------|--------|
| exports/{asig}_{grado}_texto_alumno.docx | N KB | N | OK |
| exports/{asig}_{grado}_guia_docente.docx | N KB | N | OK |

## Estructura del Documento
- Portada: {present/absent}
- Tabla de contenidos: {present/absent}
- Unidades: N/N incluidas
- Tablas de rubrica: N formateadas
- Saltos de pagina: {correct/issues}

## Branding
- Colores: {applied from brand-config / JM Labs defaults}
- Fuente: {Inter / fallback}
```

## Error Handling

- python-docx not installed: Run `pip install python-docx` automatically
- No units generated: Error message suggesting `/scriba:unit` first
- Brand config missing: Use JM Labs defaults with warning
- Table content too wide: Auto-adjust column widths, warn if truncation occurs
- Special characters in content: Ensure UTF-8 encoding throughout

## Anti-Patterns

- Don't embed images as base64 in DOCX — use proper image insertion via python-docx
- Don't generate a single DOCX with both texto alumno and guia docente — always separate files
- Don't hardcode styles — always read from brand-config.json first
- Don't skip the table of contents — it's critical for navigation in printed documents

## References

- `references/docx-generation-patterns.md` — python-docx patterns and style templates
