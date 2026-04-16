---
description: Renderizar todos los bloques Mermaid de un entregable a imágenes PNG
user-invocable: true
---

# /sdf:render-diagrams

> Detecta bloques ` ```mermaid ` en un entregable markdown y los renderiza como PNGs en `discovery/assets/`.

## Uso

```
/sdf:render-diagrams <archivo.md>
```

## Proceso

1. **Escanear** — Detectar todos los bloques ` ```mermaid ` en el archivo
2. **Renderizar** — Para cada bloque, generar PNG con Mermaid CLI (`mmdc`) aplicando config Sofka
3. **Nombrar** — Filename determinístico: `mermaid-{sha256first8}.png` (idempotente)
4. **Reportar** — Tabla de diagramas generados con path al PNG

## Dependencias

- `@mermaid-js/mermaid-cli`: `npm install -g @mermaid-js/mermaid-cli`

## Branding

- Background: #EFEAE4 (beige Sofka)
- Primary color: #FF7E08 (orange)
- Text: #1A1A1A
- Width: 1200px
