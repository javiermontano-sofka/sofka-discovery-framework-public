---
name: brand-html-render
description: "Use this skill whenever the user asks to 'entregar en HTML', 'render brand HTML', 'convertir a HTML', or wants a /sap:* deliverable packaged with Sofka Design System v5 tokens (--o #FF7E08, --bk #000, --bg #EFEAE4, --pos #FFD700, Inter). Converts markdown deliverables into production-ready HTML that matches the 5 canonical brand samples (Comité, Respuestas, Consultas, Reporte Metacognitivo, Capítulo Specs)."
allowed-tools: [Read, Bash, Write, Glob]
---

# Brand HTML Render — Sofka DS v5 packaging

Convierte cualquier entregable markdown del plugin SAP en HTML branded listo para entrega ejecutiva.

## Triggers

- Usuario dice: "dámelo en HTML", "render brand", "formato HTML", "publicar como HTML"
- Comando `/sap:render-html <file.md>` ejecutado
- `@sap-orchestrator` al final de un comité ofrece ghost-menu "Render HTML"

## Workflow

```bash
bash scripts/render-brand-html.sh <input.md> --out <output.html> \
    --style {comite|reporte|consultas|specs|discovery|generic} \
    [--title "..."] \
    [--lead "..."] \
    [--meta clave=valor]*
```

## Estilos

| `--style` | Uso |
|-----------|-----|
| `comite` | Deliberación de comité ToT (default para `/sap:comite`) |
| `reporte` | Reportes metacognitivos (post-mortem, auditoría) |
| `consultas` | Respuesta a consulta experta (`/sap:consulta`) |
| `specs` | Especificaciones funcionales / técnicas |
| `discovery` | Landscape assessments |
| `generic` | Fallback |

## Qué hace el renderer

1. Parsea el markdown con `python-markdown` (tablas, fenced code, TOC, sane lists).
2. Envuelve cada `<table>` en `<div class="tw">` para overflow horizontal branded.
3. Detecta tags de evidencia (`[CÓDIGO]`, `[ADJUNTO:...]`, `[INFERENCIA]`, etc.) y los envuelve en `<span class="t td|ta|tx|ti|ts">` con color semántico.
4. Inyecta el CSS de Design System v5 completo (variables `--o --bk --bg --pos --info --warn --crit --violet --teal`, componentes `.hero .nav .sh .qb .card .co .tw .verdict .g2 .g3 .ft .meta-box`).
5. Arma hero + pills + nav opcional + body + meta-box + footer.
6. Output estático, sin JS, sin assets externos (salvo Google Fonts Inter).

## Contrato de colores

- **Nunca** colores hardcoded fuera de `:root` en el template base.
- Naranja (`--o #FF7E08`) = acento primario, hero, enfasis
- Negro (`--bk #000`) = hero, footer, verdicts
- Dorado (`--pos #FFD700`) = high confidence / success
- Verde = **PROHIBIDO** (regla brand Sofka)

## Accesibilidad

- Skip link, focus-visible outline naranja, tablas en wrapper scrollable
- Print styles (sin nav, sin sombras, fondo blanco)
- Responsive breakpoint @768px (grids colapsan a 1 col)

## Toolbox

- `scripts/render-brand-html.sh` — wrapper que activa venv
- `scripts/render_brand_html.py` — Python + jinja2 + markdown
- `templates/brand-html-base.html` — template jinja2 con CSS ~700 líneas
- `references/ontology/canonical-tokens.md` — tokens DS v5 para referencia

## Red flags

- HTML rendered sin referencia `var(--o)` → el template está roto, reinstalar
- Colores verdes en output → violación brand, revertir
- `<table>` sin wrapper `.tw` → overflow horizontal roto en mobile
- Tag de evidencia sin span `class="t ..."` → renderer no detectó el patrón

---
*Skill v1.0 — packaging del último entregable. Plugin v4.0.*
