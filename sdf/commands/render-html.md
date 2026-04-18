---
description: "Render markdown deliverable to Sofka DS v5 brand HTML"
allowed-tools: [Bash, Read]
---

# /sdf:render-html

Convierte un entregable markdown (por ejemplo de `/sdf:comite`, `/sdf:consulta`, `/sdf:investigar`) a HTML branded Sofka Design System v5.

## Uso

```
/sdf:render-html <input.md> [--style comite|reporte|consultas|specs|discovery] [--meta clave=valor ...]
```

## Estilos disponibles
- `comite` — Deliberación ToT (default)
- `reporte` — Reporte metacognitivo / auditoría
- `consultas` — Respuesta a consulta experta
- `specs` — Especificación funcional/técnica
- `discovery` — Landscape assessment

## Ejemplo

```bash
bash ${CLAUDE_PLUGIN_ROOT}/scripts/render-brand-html.sh \
    .discovery/comite_sap_acme_{WIP}.md \
    --out .discovery/comite_sap_acme_{WIP}.html \
    --style comite \
    --meta "Confianza=0.88" \
    --meta "Comité=5 dinámico"
```

Output: archivo `.html` estático (sin JS), ~60KB típico, usa Google Fonts Inter + CSS DS v5 inline.

## Invocado por

- `@discovery-conductor` al cerrar `/sdf:comite` (ghost-menu)
- `@discovery-conductor` al cerrar `/sdf:consulta` si `--html` fue pasado
- Usuario directo cuando quiere empacar markdown viejo

## Validación

`@quality-guardian` corre `grep var(--o)` y `grep green` sobre el HTML; falla si encuentra colores hardcoded o verde.

---
*Plugin v4.0 — brand-html-render skill.*
