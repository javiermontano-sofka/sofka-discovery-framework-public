---
name: rendering-engine
description: Motor de renderizado automático para generación de diagramas (PNG) desde Mermaid y exportación de propuestas a PDF con branding MetodologIA.
author: Equipo MetodologIA
version: 1.0.0
license: MIT
category: Herramientas & DX
tags: [rendering, mermaid, pdf, png, export, branding, diagrams]
allowed-tools: [Read, Grep, Glob, Bash, Write, Edit]
---

# rendering-engine

> Motor de renderizado automático: Mermaid → PNG, Markdown → PDF.
> Branding estricto MetodologIA en todos los outputs visuales.

---

## TL;DR

Convierte bloques de código Mermaid en imágenes PNG estáticas y compila entregables completos a PDF profesional con branding MetodologIA. Los evidence tags `[CÓDIGO]`, `[DOC]`, etc. se renderizan como badges visuales en el documento final.

---

## Core Responsibilities

1. **PNG Generation** — Detectar bloques ` ```mermaid ` en entregables, renderizar con Mermaid CLI a `discovery/assets/`
2. **PDF Compilation** — Compilar markdown a PDF con Pandoc + wkhtmltopdf (o Typst como alternativa)
3. **Branding Enforcement** — Paleta MetodologIA (#6366F1, #0F172A), tipografía Poppins/Montserrat
4. **Evidence Badges** — Tags de evidencia renderizados como badges HTML coloreados por tipo

---

## Assigned Skills

| Skill | Rol |
|-------|-----|
| `rendering-engine` (self) | Motor principal de renderizado |
| `design-system` | Tokens canónicos y componentes de branding |
| `mermaid-diagramming` | Validación de sintaxis Mermaid |

---

## Output Configuration

### Output Artifact

**Nombre**: `{fase}_{entregable}_{cliente}_{WIP|Aprobado}.pdf`

### Output Templates

| Formato | Especificación |
|---------|---------------|
| **Markdown** | Source de verdad — contiene bloques Mermaid originales + evidence tags en texto. |
| **HTML** | Self-contained con CSS MetodologIA. Mermaid renderizado inline. Evidence tags como badges. WCAG AA. |
| **DOCX** | python-docx. Poppins/Montserrat font. Imágenes PNG embebidas desde `discovery/assets/`. Header MetodologIA. |
| **XLSX** | openpyxl. Hoja "Rendering Log" con columnas: Diagram ID, Source File, Output PNG, Status. |
| **PPTX** | python-pptx. PNGs de diagramas como imágenes full-slide. Slide master indigo MetodologIA. |

---

## Escalation Triggers

- `mmdc` no instalado → Warning graceful, no bloqueo (diagramas permanecen como código)
- Pandoc/wkhtmltopdf no instalados → Export como HTML en lugar de PDF
- Diagrama Mermaid con sintaxis inválida → Log error, continuar con siguientes bloques

---

## Scripts

| Script | Ubicación | Propósito |
|--------|-----------|----------|
| `render-mermaid.sh` | `scripts/render-mermaid.sh` | Renderizar bloques Mermaid a PNG |
| `export-pdf.sh` | `scripts/export-pdf.sh` | Compilar entregable a PDF con branding |

---

## Branding Rules (Inmutable)

- **Primary**: #6366F1 (indigo) — headers, bordes, acentos
- **Background**: #0F172A (dark) — fondo de tablas alternas, backgrounds
- **Typography**: Poppins/Montserrat (pesos 300-700)
- **Evidence badges**: Coloreados por tipo (CÓDIGO=green bg, CONFIG=blue bg, DOC=indigo bg, INFERENCIA=purple bg, SUPUESTO=red bg)
