# How to render a deliverable to branded HTML

**When you need this**: Markdown deliverable needs to be sent as a branded HTML file to a client.

**Prerequisites**: Markdown source in `.discovery/` or repo; styles understood ([ADR-0010](../adr/0010-brand-html-deterministic.md)).

**Time**: <1 min per file.

## Steps

1. Identify the style (from [sap-enterprise-plugin/skills/brand-html-render/SKILL.md](../../../sap-enterprise-plugin/skills/brand-html-render/SKILL.md)):

   | `--style` | Use |
   |-----------|-----|
   | `discovery` | Discovery / landscape assessments (SDF default) |
   | `comite` | Committee deliberations |
   | `reporte` | Metacognitive / post-mortem reports |
   | `consultas` | Expert consultation responses |
   | `specs` | Spec Funcional / technical specs |
   | `generic` | Fallback |

2. Invoke the renderer:

   ```bash
   bash scripts/render-brand-html.sh \
       <input.md> \
       --out <output.html> \
       --style discovery \
       --title "AS-IS — Bancoomeva" \
       --lead "Análisis del estado actual del core legacy" \
       --meta cliente="Bancoomeva" fecha="2026-04-17"
   ```

3. Or via command:

   ```
   /sdf:render-html <input.md> --style discovery
   ```

## Verification

- `<output.html>` opens standalone (double-click in Finder).
- Colors: orange, black, gold, cream — no green.
- Evidence tags are colour-highlighted.
- Tables have `.tw` wrappers (scroll on mobile).

## Common pitfalls

- Output contains green → template broken; reinstall `render-brand-html.sh`.
- `<table>` without `.tw` wrapper → overflow broken on narrow screens.
- Tag not highlighted → regex in `render_brand_html.py` didn't match; inspect tag format.
- Forgot `--meta` fields → fine, optional; header will be sparse.

## See also

- [ADR-0010](../adr/0010-brand-html-deterministic.md)
- [`../explanation/why-brand-html-is-deterministic.md`](../explanation/why-brand-html-is-deterministic.md)
- `references/ontology/canonical-tokens.md`
