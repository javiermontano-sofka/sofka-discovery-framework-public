---
description: Renderizar todos los bloques Mermaid de un entregable a imágenes PNG
user-invocable: true
---

# /mao:render-diagrams

> Detecta bloques ` ```mermaid ` en un entregable markdown y los renderiza como PNGs en `discovery/assets/`.

## Uso

```
/mao:render-diagrams <archivo.md>
```

## Proceso

1. **Escanear** — Detectar todos los bloques ` ```mermaid ` en el archivo
2. **Renderizar** — Para cada bloque, generar PNG con Mermaid CLI (`mmdc`) aplicando config MetodologIA
3. **Nombrar** — Filename determinístico: `mermaid-{sha256first8}.png` (idempotente)
4. **Reportar** — Tabla de diagramas generados con path al PNG

## Dependencias

- `@mermaid-js/mermaid-cli`: `npm install -g @mermaid-js/mermaid-cli`

## Branding

- Background: #0F172A (dark MetodologIA)
- Primary color: #6366F1 (indigo)
- Text: #E2E8F0
- Width: 1200px
