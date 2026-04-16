---
description: Exportar un entregable markdown a PDF profesional con branding MetodologIA
user-invocable: true
---

# /mao:export-pdf

> Compila un entregable markdown a PDF con branding MetodologIA: indigo headers, dark backgrounds, Poppins/Montserrat typography. Evidence tags renderizados como badges visuales.

## Uso

```
/mao:export-pdf <archivo.md> [directorio-salida]
```

## Proceso

1. **Validar fuente** — Verificar que el archivo markdown existe y es un entregable MetodologIA
2. **Renderizar diagramas** — Ejecutar `scripts/render-mermaid.sh` para convertir bloques Mermaid a PNG
3. **Preprocesar evidence tags** — Convertir `[CÓDIGO]`, `[DOC]`, etc. a badges HTML coloreados
4. **Compilar PDF** — Ejecutar `scripts/export-pdf.sh` con template MetodologIA
5. **Verificar branding** — Confirmar: indigo headers (#6366F1), dark bg (#0F172A), Poppins/Montserrat typography
6. **Entregar** — PDF guardado en `discovery/assets/` + ghost menu

## Dependencias

- `pandoc` + `wkhtmltopdf` (recomendado) o `typst` (alternativa)
- `@mermaid-js/mermaid-cli` (opcional, para diagramas PNG)

## Reglas

- Branding MetodologIA: indigo (#6366F1) primary, dark (#0F172A) background
- Poppins/Montserrat como tipografía principal (300-700)
- Evidence tags SIEMPRE como badges, nunca como texto plano en PDF
