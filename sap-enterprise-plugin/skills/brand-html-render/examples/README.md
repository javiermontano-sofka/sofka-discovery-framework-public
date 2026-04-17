# Examples — brand-html-render

## Basic invocation

```bash
bash scripts/render-brand-html.sh \
    .discovery/comite-sap-acme.md \
    --out .discovery/comite-sap-acme.html \
    --style comite \
    --meta "Confianza=0.88" \
    --meta "Comité=5 (sap-docs-steward, functional-lead, abap-expert, qa-validator, fi-specialist)"
```

## Post-comité automation

`@sap-orchestrator` al final de `/sap:comite` agrega al ghost menu:

```
| Render HTML | `bash scripts/render-brand-html.sh <last-md> --out <same-stem>.html --style comite` |
```

## Output checklist

1. Abrir el `.html` en navegador → debe verse idéntico al anexo `Comite_Expertos_SAP_{WIP}.html`
2. `grep var(--o) *.html` → múltiples matches
3. `grep -E "#(00ff00|2ecc71|green)" *.html` → 0 matches (brand rule)
4. Evidence tags coloreados: naranja (CÓDIGO/CONFIG/DOC), violeta (STAKEHOLDER/NOTEBOOKLM), naranja matte (ADJUNTO), amarillo (INFERENCIA), rojo (SUPUESTO)
