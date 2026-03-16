---
name: sofka-rendering-engine
description: Motor de renderizado automático para generación de diagramas (PNG) desde Mermaid y exportación de propuestas a PDF con branding Sofka v5.
author: Equipo PreSales Sofka
version: 1.0.0
category: Herramientas & DX
tags: [rendering, mermaid, pdf, png, export, branding, diagrams]
allowed-tools: [Read, Grep, Glob, Bash, Write, Edit]
---

# sofka-rendering-engine

> Motor de renderizado automático: Mermaid → PNG, Markdown → PDF.
> Branding estricto Sofka v5 en todos los outputs visuales.

---

## TL;DR

Convierte bloques de código Mermaid en imágenes PNG estáticas y compila entregables completos a PDF profesional con branding Sofka. Los evidence tags `[CÓDIGO]`, `[DOC]`, etc. se renderizan como badges visuales en el documento final.

---

## Core Responsibilities

1. **PNG Generation** — Detectar bloques ` ```mermaid ` en entregables, renderizar con Mermaid CLI a `.discovery/assets/`
2. **PDF Compilation** — Compilar markdown a PDF con Pandoc + wkhtmltopdf (o Typst como alternativa)
3. **Branding Enforcement** — Paleta Sofka (#FF7E08, #EFEAE4, #FFD700), tipografía Inter, NUNCA verde para éxito
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
| **HTML** | Self-contained con CSS Sofka. Mermaid renderizado inline. Evidence tags como badges. WCAG AA. |
| **DOCX** | python-docx. Inter font. Imágenes PNG embebidas desde `.discovery/assets/`. Header Sofka. |
| **XLSX** | openpyxl. Hoja "Rendering Log" con columnas: Diagram ID, Source File, Output PNG, Status. |
| **PPTX** | python-pptx. PNGs de diagramas como imágenes full-slide. Slide master naranja Sofka. |

---

## Escalation Triggers

- `mmdc` no instalado → Warning graceful, no bloqueo (diagramas permanecen como código)
- Pandoc/wkhtmltopdf no instalados → Export como HTML en lugar de PDF
- Diagrama Mermaid con sintaxis inválida → Log error, continuar con siguientes bloques
- PDF con color verde detectado → BLOQUEO — corregir a gold #FFD700

---

## Scripts

| Script | Ubicación | Propósito |
|--------|-----------|----------|
| `render-mermaid.sh` | `scripts/render-mermaid.sh` | Renderizar bloques Mermaid a PNG |
| `export-pdf.sh` | `scripts/export-pdf.sh` | Compilar entregable a PDF con branding |

---

## Branding Rules (Inmutable)

- **Primary**: #FF7E08 (orange) — headers, bordes, acentos
- **Background**: #EFEAE4 (beige) — fondo de tablas alternas, backgrounds
- **Success/CTA**: #FFD700 (gold) — indicadores de éxito, CTAs. **NUNCA verde.**
- **Typography**: Inter (pesos 300-700)
- **Evidence badges**: Coloreados por tipo (CÓDIGO=green bg, CONFIG=blue bg, DOC=orange bg, INFERENCIA=purple bg, SUPUESTO=red bg)
