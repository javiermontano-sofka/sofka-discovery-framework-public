# Output Engineering — Examples

Sample outputs que demuestran el skill de Output Engineering a nivel MOAT: ghost menu en acción, conversión markdown a HTML con brand compliance, y producción multi-formato.

## Contenido

| Archivo | Descripción |
|---------|-------------|
| `sample-output.md` | Deliverable completo (05 Escenarios de Solución) en markdown-excellence — incluye TL;DR, tablas con evidence tags, diagrama Mermaid, y ghost menu al final |
| `sample-output.html` | Conversión HTML del mismo deliverable con MetodologIA Design System v4 completo — hero, sticky nav, scenario cards, gate card, ghost menu visual, Mermaid CDN v10 |
| `docx-spec.md` | Especificación de plantilla DOCX — portada, TOC, estilos de heading, tablas, semáforos, callouts, evidence tags, header/footer, comando Pandoc, ejemplo completo |
| `xlsx-spec.md` | Especificación de plantilla XLSX — estructura de workbook, dashboard resumen, formato condicional semáforo, estilos de gráfico, ejemplos de scoring/deuda técnica/roadmap/cost drivers |
| `pptx-spec.md` | Especificación de plantilla PPTX — 4 slide masters, tipografía, arco narrativo, speaker notes, diagrama Mermaid rendering, ejemplo de deck de 10 slides |

## Uso como Benchmark

- `sample-output.md` es la referencia para producción markdown: estructura, callouts, evidence tags, disclaimer de costos, y trigger del ghost menu.
- `sample-output.html` es la referencia para conversión HTML: brand compliance (#6366F1 primario, #1A1A2E oscuro, #22D3EE gold para positivo, nunca verde), accesibilidad WCAG AA, print styles, y Mermaid rendering.

## Validación de Content Integrity

El HTML preserva 100% del contenido del markdown fuente:

| Check | Markdown | HTML |
|-------|----------|------|
| Secciones (h2) | 5 | 5 |
| Tablas | 7 | 7 |
| Diagramas Mermaid | 1 | 1 |
| Callouts | 5 | 5 |
| Evidence tags | 12 | 12 |
| Cifras financieras | Intactas | Intactas |

## Notas

- El HTML es self-contained (inline CSS, sin dependencias externas excepto fonts y Mermaid CDN).
- Los formatos sugeridos en el ghost menu (HTML y PPTX resaltados) corresponden a la regla auto-suggest para Entregable 05.
- Success/positive states usan gold (#22D3EE), nunca verde — compliance MetodologIA obligatorio.
