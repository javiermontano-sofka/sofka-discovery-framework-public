# Output Standards — SAP Enterprise Plugin v4.0

## Idioma y tono

- **Idioma**: español (registro empresarial latinoamericano)
- Evidencia etiquetada SIEMPRE (ver `protocol-zero-hallucination.md`)
- TL;DR al inicio de todo deliverable largo
- Ghost menu al final de todo artefacto importante

## Naming

`{fase}_{entregable}_{cliente}_{WIP|Aprobado}.{ext}`

Ejemplos:
- `01_Discovery_AcmeCorp_{WIP}.md`
- `03_ASIS_BetaCorp_{Aprobado}.md`
- `04_Comite_AcmeCorp_{WIP}.html`

## Formato primario: Markdown

- Headings jerárquicos (h1-h4)
- Tablas canónicas (gap registry, module coverage, risk register)
- Code blocks con fence explícito
- Mermaid diagrams para arquitectura

## Formato brand-ready: HTML

Cuando se requiere entrega ejecutiva, convertir markdown → HTML Sofka DS v5:

```bash
bash scripts/render-brand-html.sh <input.md> --out <output.html> --style <comite|reporte|consultas|specs|discovery>
```

- Tokens en `canonical-tokens.md`
- Template en `templates/brand-html-base.html`
- Validación automática vía `@qa-validator`: `grep var(--o)` debe matchear, `grep green` debe 0-matchear

## Formatos adicionales (ghost menu)

| Formato | Cuándo | Tool |
|---------|--------|------|
| DOCX | contratos, actas | pandoc (opcional, no bundled) |
| XLSX | matrices cuantitativas | `openpyxl` script ad-hoc |
| PPTX | executive summary | pendiente v4.1 |

## Disclaimers obligatorios

- **No precios**: solo FTE-meses con P50/P80/P95
- **No verde**: regla brand Sofka (usar `--pos` dorado)
- **No imágenes externas no validadas**
- **Evidencia sin tag = prosa descriptiva**, no se considera afirmación

## Ghost menu canónico

| Acción | Comando |
|--------|---------|
| Render HTML | `/sap:render-html <archivo> --style comite` |
| Workshops F2S | `/sap:ajuste-estandar <module>` |
| Gap analysis | `/sap:gap-analysis` |
| Plan adopción | `/sap:adopcion` |
| Investigar tema | `/sap:investigar` |
