# Examples — Technology Vigilance

> Outputs de referencia (golden samples) para la skill `technology-vigilance`.

---

## Archivos Disponibles

| Archivo | Formato | Descripcion | Caso de Uso |
|---------|---------|-------------|-------------|
| `sample-output.md` | Markdown | Reporte completo de vigilancia tecnologica para RetailCo (modernizacion e-commerce) | Referencia para modo `landscape-scan`, variante `tecnica` |
| `sample-output.html` | HTML Branded | Mismo reporte en formato visual MetodologIA | Referencia para `{FORMATO}=html` |

---

## Guia de Formato

### Markdown (`sample-output.md`)

- **Estructura:** TL;DR → Senales Detectadas → Posicionamiento Multi-Fuente → Senales Sectoriales → Clasificacion → Recomendaciones (MUST/SHOULD/COULD) → Fuentes y Trazabilidad → Conclusiones
- **Tablas:** Senales con urgencia/impacto/relevancia/confianza, posicionamiento cruzado (Gartner/TW/GitHub/CNCF/Forrester/Rogers), referentes por senal
- **Diagramas Mermaid:** quadrantChart (posicionamiento urgencia x impacto)
- **Evidence tags:** [ANALYST], [ACADEMIC], [OPENSOURCE], [REFERENT], [INFERENCIA], [SUPUESTO]
- **Fuentes en 4 tiers:** Analyst Firms, Academic, Open Source, Thought Leaders
- **Recomendaciones:** Clasificadas como MUST (0-3 meses), SHOULD (3-6 meses), COULD (6+ meses)

### HTML (`sample-output.html`)

- **Design System MetodologIA v4:** Primary #6366F1, Dark #1A1A2E, Success #22D3EE
- **Nunca usar verde** para estados de exito — siempre amarillo (#22D3EE)
- **Signal cards:** Tarjetas con indicadores de urgencia (&#128308;/&#128993;/&#128994;) y source badges por tier
- **Recommendation cards:** Codificadas por color (MUST=rojo, SHOULD=amarillo, COULD=dorado)
- **Source badges:** Coloreados por tier (ANALYST=naranja, ACADEMIC=azul, OPENSOURCE=dorado, REFERENT=purpura)
- **Mermaid renderizado:** Via CDN v10 (`<pre class="mermaid">`)
- **Responsive:** Grid layout, tarjetas para senales y recomendaciones
- **Impresion:** CSS `@media print` optimizado para A4

---

## Como Usar Estos Ejemplos

1. **Como referencia de calidad:** Verificar que outputs generados alcancen el nivel de detalle del sample (10 senales, 4 tiers de fuentes, convergencia/divergencia explicita)
2. **Como template:** Copiar estructura de secciones y adaptar al proyecto y sector especifico
3. **Como validacion:** Comparar output generado vs. sample para identificar gaps de cobertura de fuentes
4. **Fuentes minimas:** Todo reporte debe consultar al menos 2 fuentes de Tier 1 (analyst), 1 de Tier 2 (academic), 2 de Tier 3 (open source), y 2 de Tier 4 (thought leaders)

---

## Diferencias con Otros Skills

| Aspecto | technology-vigilance | asis-analysis | scenario-analysis |
|---------|---------------------|---------------|-------------------|
| Foco | Que tecnologias existen y en que estado | Como esta el sistema actual | Que escenarios de solucion son viables |
| Temporalidad | Presente + horizonte 3-5 anos | Presente (AS-IS) | Futuro (TO-BE) |
| Fuentes | Externas (analyst, academic, OSINT) | Internas (codigo, config, stakeholders) | Mixtas (restricciones internas + opciones externas) |
| Output | Mapa de senales + recomendaciones | Diagnostico del estado actual | Escenarios evaluados con Tree-of-Thought |

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
