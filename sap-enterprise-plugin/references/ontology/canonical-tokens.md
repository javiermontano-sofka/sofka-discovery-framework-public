# Canonical Tokens — Sofka Design System v5

Fuente de verdad para cualquier output HTML brand-ready. Copia exactamente estos tokens en `:root` — ningún color puede vivir fuera del bloque `:root{}`.

## Paleta

```css
:root{
  --o:#FF7E08;            /* naranja primario */
  --ol:#FF9E42;           /* naranja claro */
  --od:#CC6506;           /* naranja oscuro (texto) */
  --odm:rgba(255,126,8,.1); /* naranja matte (hover) */
  --bk:#000;              /* negro */
  --wh:#FFF;
  --bg:#EFEAE4;           /* fondo warm gray */
  --pos:#FFD700;          /* dorado success / high confidence */
  --posd:rgba(255,215,0,.12);
  --post:#B8860B;
  --warn:#D97706;
  --warnd:rgba(217,119,6,.08);
  --crit:#DC2626;
  --critd:rgba(220,38,38,.07);
  --info:#2563EB;
  --infod:rgba(37,99,235,.07);
  --infob:rgba(37,99,235,.25);
  --violet:#9747FF;
  --teal:#06C8C8;
  --g50:#FAF8F6;
  --g100:#F4F0EC;
  --g200:#E4DED7;
  --g500:#6B6560;
  --g700:#333130;
  --g900:#111110;
  --r:12px;
  --sh:0 1px 3px rgba(0,0,0,.04),0 6px 16px rgba(0,0,0,.06);
  --f:'Inter',system-ui,sans-serif;
}
```

## Prohibiciones

- ❌ Verde (`#00ff00`, `#2ecc71`, `green`) — brand rule Sofka. Para "success" usar `--pos` (dorado).
- ❌ Hex fuera de `:root{...}`.
- ❌ Familia tipográfica distinta a Inter (salvo fallback `system-ui`).

## Mapping a evidencia

| Tag | Clase pill |
|-----|------------|
| `[CÓDIGO] [CONFIG] [DOC]` | `.t td` (azul info) |
| `[STAKEHOLDER] [NOTEBOOKLM]` | `.t ta` (violeta) |
| `[ADJUNTO]` | `.tx` (naranja matte) |
| `[INFERENCIA]` | `.t ti` (ámbar warn) |
| `[SUPUESTO]` | `.t ts` (rojo crit) |

## Template base

`templates/brand-html-base.html` — jinja2 con los tokens inyectados. Úsalo con `scripts/render_brand_html.py`.
