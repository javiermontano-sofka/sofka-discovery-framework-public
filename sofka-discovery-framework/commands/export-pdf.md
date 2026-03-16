---
description: Exportar un entregable markdown a PDF profesional con branding Sofka v5
user-invocable: true
---

# /sdf:export-pdf

> Compila un entregable markdown a PDF con branding Sofka: orange headers, beige backgrounds, gold accents, Inter typography. Evidence tags renderizados como badges visuales.

## Uso

```
/sdf:export-pdf <archivo.md> [directorio-salida]
```

## Proceso

1. **Validar fuente** — Verificar que el archivo markdown existe y es un entregable SAGE
2. **Renderizar diagramas** — Ejecutar `scripts/render-mermaid.sh` para convertir bloques Mermaid a PNG
3. **Preprocesar evidence tags** — Convertir `[CÓDIGO]`, `[DOC]`, etc. a badges HTML coloreados
4. **Compilar PDF** — Ejecutar `scripts/export-pdf.sh` con template Sofka v5
5. **Verificar branding** — Confirmar: orange headers, beige bg, gold success, NUNCA verde
6. **Entregar** — PDF guardado en `.discovery/assets/` + ghost menu

## Dependencias

- `pandoc` + `wkhtmltopdf` (recomendado) o `typst` (alternativa)
- `@mermaid-js/mermaid-cli` (opcional, para diagramas PNG)

## Reglas

- NUNCA usar verde (#00FF00) para éxito — siempre gold (#FFD700)
- Inter como tipografía principal (300-700)
- Evidence tags SIEMPRE como badges, nunca como texto plano en PDF
