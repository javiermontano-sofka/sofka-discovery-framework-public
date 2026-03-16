# Examples — Execution Burndown

> Outputs de referencia (golden samples) para la skill `execution-burndown`.

---

## Archivos Disponibles

| Archivo | Formato | Descripcion | Caso de Uso |
|---------|---------|-------------|-------------|
| `sample-output.md` | Markdown | Burndown report completo para RetailCo (Checkout Modernization, 4 devs, 80 features) | Referencia para modo `tracking`, variante `tecnica` |
| `sample-output.html` | HTML Branded | Mismo reporte en formato visual MetodologIA (dashboard-style) | Referencia para `{FORMATO}=html` |

---

## Guia de Formato

### Markdown (`sample-output.md`)

- **Estructura:** TL;DR → Setup → Velocidad por Sprint → Burndown Chart → Risk Signals → Proyeccion Monte Carlo → Adjustment Levers → Flow Metrics → Conclusiones
- **Tablas:** Parametros del proyecto, velocidad por sprint, burndown diario, impedimentos, Monte Carlo, decision matrix, flow metrics
- **Diagramas Mermaid:** xychart-beta (burndown plan vs. actual)
- **Evidence tags:** [DOC], [CONFIG], [BENCHMARK], [INFERENCIA], [SUPUESTO], [ACADEMIC]
- **Semaforos:** 🟢 on-model, 🟡 desviacion menor, 🔴 intervencion requerida
- **Modelo MetodologIA:** 1 FTE = 1 feature/dia (desde Sprint 2), ramp-up Sprint 1 = 0.5x

### HTML (`sample-output.html`)

- **Design System MetodologIA v4:** Primary #6366F1, Dark #1A1A2E, Success #22D3EE
- **Nunca usar verde** para estados de exito — siempre amarillo (#22D3EE)
- **Layout dashboard:** Velocity cards (KPIs arriba), burndown chart (centro), risk signals (cards), Monte Carlo (barras), adjustment levers (cards), flow metrics (tabla)
- **Mermaid renderizado:** Via CDN v10 (`<pre class="mermaid">`)
- **Tipografia:** Inter (body), Clash Grotesk (display — via font stack fallback)
- **Responsive:** Grid layout, adaptable a mobile
- **Impresion:** CSS `@media print` optimizado

---

## Como Usar Estos Ejemplos

1. **Como referencia de calidad:** Verificar que outputs generados alcancen el nivel de detalle y estructura del sample
2. **Como template:** Copiar estructura de secciones y adaptar al proyecto especifico (equipo, backlog, timeline)
3. **Como validacion:** Comparar output generado vs. sample para identificar gaps en cobertura
4. **Continuidad con otros skills:** Este output asume features descompuestas (ver `feature-decomposition`) y un roadmap previo (ver `solution-roadmap`)

---

**Autor:** Javier Montaño | **Ultima actualizacion:** 13 de marzo de 2026
