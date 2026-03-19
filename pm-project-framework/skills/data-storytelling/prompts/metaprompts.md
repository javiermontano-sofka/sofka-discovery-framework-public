# Metaprompts — Data Storytelling & Visualization

## Metaprompt 1: Selector de Visualización Óptima

**Propósito**: Dado un dataset y un insight, seleccionar la visualización más efectiva.

```
Eres un experto en diseño de información para gestión de proyectos. Dado el siguiente dataset {dataset} y el insight principal "{insight}":

1. Clasifica el tipo de insight: tendencia, comparación, proporción, correlación, distribución, flujo, estado
2. Para cada tipo, evalúa las visualizaciones candidatas (line, bar, pie, scatter, heatmap, Sankey, RAG card)
3. Selecciona la visualización óptima considerando:
   - Efectividad para el tipo de insight
   - Data literacy de la audiencia {audiencia}
   - Formato disponible (Mermaid, HTML, Markdown table)
   - Número de data points
4. Genera la visualización en el formato seleccionado
5. Agrega annotations en los data points clave
6. Incluye alt-text para accesibilidad

Etiqueta: [PLAN] para selecciones basadas en principios de visualización, [INFERENCIA] para adaptaciones de audiencia.
```

## Metaprompt 2: Adaptador Multi-Audiencia

**Propósito**: Tomar una data story y generar versiones adaptadas para diferentes audiencias.

```
Eres un especialista en comunicación adaptativa. Dada la siguiente data story base {data_story}:

1. Analiza la complejidad del contenido y el nivel de data literacy requerido
2. Para cada audiencia en {audiencias}:
   - Ajusta el nivel de detalle (C-Suite: mínimo, Team: máximo)
   - Selecciona las métricas más relevantes para esa audiencia
   - Adapta el vocabulario (ejecutivo: ROI/estrategia, técnico: velocity/debt)
   - Elige formato (1-pager, deck, detailed report, data bite)
   - Ajusta el call to action al nivel de decisión de la audiencia
3. Genera cada versión manteniendo consistencia en los datos core
4. Verifica que ninguna versión contradiga a otra

Etiqueta: [STAKEHOLDER] para adaptaciones de audiencia, [PLAN] para decisiones de formato.
```

## Metaprompt 3: Auditor de Integridad Narrativa

**Propósito**: Verificar que una data story no distorsiona, omite o exagera la evidencia.

```
Eres un auditor de integridad de data storytelling. Revisa la siguiente data story {story}:

1. **Verificación de datos**: ¿Cada número citado tiene fuente verificable? Tag con [METRIC] o [SUPUESTO]
2. **Honestidad visual**: ¿Las visualizaciones representan fielmente los datos? (ejes, escalas, proporciones)
3. **Completitud**: ¿Se omiten datos que contradicen la narrativa? Si sí, flag
4. **Interpretación**: ¿Las inferencias están etiquetadas como [INFERENCIA]?
5. **Balance**: ¿Se presentan escenarios alternativos cuando los datos son ambiguos?
6. **Call to action**: ¿Las recomendaciones se sostienen con la evidencia presentada?
7. Genera Integrity Score (0-100) y lista de correcciones necesarias

Criterio de aprobación: Integrity Score ≥85, zero datos sin fuente, zero visualizaciones engañosas.
```
