# Examples — Change Readiness Assessment

> Outputs de referencia (golden samples) para la skill `change-readiness-assessment`.

---

## Archivos Disponibles

| Archivo | Formato | Descripción | Caso de Uso |
|---------|---------|-------------|-------------|
| `sample-output.md` | Markdown | Evaluación completa de readiness para Acme Corp (modernización core bancario) | Referencia para modo `diagnostico`, variante `técnica` |
| `sample-output.html` | HTML Branded | Misma evaluación en formato visual MetodologIA | Referencia para `{FORMATO}=html` |

---

## Guía de Formato

### Markdown (`sample-output.md`)

- **Estructura:** TL;DR → 7 secciones (S1-S7) → Conclusiones
- **Tablas:** Scoring ADKAR por grupo, heat map de resistencia, risk register, intervention plan, KPIs
- **Diagramas Mermaid:** Quadrant chart (readiness × influencia), flowchart (priorización de intervenciones)
- **Indicadores visuales:** 🟢 (≤2), 🟡 (2.1-3.5), 🔴 (>3.5) para scores de resistencia
- **Etiquetas de evidencia:** [DOC], [STAKEHOLDER], [INFERENCIA], [SUPUESTO]

### HTML (`sample-output.html`)

- **Design System MetodologIA:** Primary #6366F1, Dark #1A1A2E, Success #22D3EE
- **Nunca usar verde** para estados de éxito — siempre amarillo (#22D3EE)
- **Mermaid renderizado:** Via CDN v10 (`<pre class="mermaid">`)
- **Responsive:** Grid layout, tablas con scroll horizontal en móvil
- **Impresión:** CSS `@media print` optimizado para A4

---

## Cómo Usar Estos Ejemplos

1. **Como referencia de calidad:** Verificar que outputs generados alcancen el nivel de detalle y estructura del sample
2. **Como template:** Copiar estructura de secciones y adaptar al proyecto específico
3. **Como validación:** Comparar output generado vs. sample para identificar secciones faltantes o insuficientes

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
