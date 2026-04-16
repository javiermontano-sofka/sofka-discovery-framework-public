# Body of Knowledge — Data Visualization Storytelling

Fuentes fundacionales, estándares de referencia y glosario para el skill de Data Visualization Storytelling aplicado a discovery consulting.

---

## Fuentes Primarias

### 1. Edward Tufte — The Visual Display of Quantitative Information (1983, 2001)

- **Relevancia:** Obra fundacional sobre integridad gráfica, data-ink ratio, y la eliminación de chartjunk. Establece los principios de que cada elemento visual debe transmitir información.
- **Aporte clave:** El concepto de "data-ink ratio" — maximizar la tinta dedicada a datos reales, minimizar la decoración. Directamente informa la regla del skill: "una visualización que requiere explicación ha fallado."
- **Referencia:** Tufte, E. (1983/2001). *The Visual Display of Quantitative Information*. Graphics Press.

### 2. Stephen Few — Show Me the Numbers (2012) & Now You See It (2009)

- **Relevancia:** Guías prácticas de selección de gráficos y diseño de dashboards. Clasificación de relaciones de datos (comparación, composición, distribución, relación) mapeada directamente a tipos de gráfico.
- **Aporte clave:** La "Chart Selection Matrix" del skill se basa en la taxonomía de Few: comparison → bars, trend → line, composition → stacked, relationship → scatter.
- **Referencia:** Few, S. (2012). *Show Me the Numbers*. Analytics Press. / Few, S. (2009). *Now You See It*. Analytics Press.

### 3. Cole Nussbaumer Knaflic — Storytelling with Data (2015)

- **Relevancia:** Conecta visualización con narrativa. Introduce el concepto de "contexto → datos → visualización → historia" como pipeline comunicativo.
- **Aporte clave:** Los principios de "eliminar el clutter", "atraer la atención del lector", y "contar una historia" fundamentan la estrategia de anotación selectiva y la secuencia narrativa del skill.
- **Referencia:** Knaflic, C. N. (2015). *Storytelling with Data*. Wiley.

### 4. Alberto Cairo — The Truthful Art (2016)

- **Relevancia:** Ética en visualización de datos — cómo las visualizaciones pueden engañar y cómo diseñar con integridad. Principios de proporcionalidad, contexto y completitud.
- **Aporte clave:** Los cinco principios de Cairo (truthful, functional, beautiful, insightful, enlightening) informan la validation gate del skill.
- **Referencia:** Cairo, A. (2016). *The Truthful Art*. New Riders.

### 5. Mermaid.js — Official Documentation (2019–presente)

- **Relevancia:** Herramienta primaria de diagramación del skill. Documentación oficial de sintaxis para flowcharts, sequence diagrams, C4, state diagrams, Gantt, pie, quadrant, y mindmaps.
- **Aporte clave:** Constrainsts de renderizado (max complejidad por tipo), classDef styling, subgraph nesting, y edge labeling. Base para las Mermaid Standards del skill.
- **Referencia:** Mermaid.js. *Official Documentation*. https://mermaid.js.org/

### 6. Simon Brown — C4 Model for Software Architecture (2018)

- **Relevancia:** Modelo de diagramación arquitectónica en 4 niveles (Context, Container, Component, Code). Adoptado como estándar para diagramas de arquitectura en discovery.
- **Aporte clave:** El principio de "abstractions first" — cada nivel de zoom cuenta una historia diferente. C4 Context muestra el ecosistema, Container muestra la estructura técnica, Component muestra las piezas internas.
- **Referencia:** Brown, S. (2018). *The C4 Model for Visualising Software Architecture*. https://c4model.com/

### 7. Jacques Bertin — Semiology of Graphics (1967, traducción 1983)

- **Relevancia:** Teoría fundacional de las variables visuales (posición, tamaño, forma, valor, color, orientación, textura) y su capacidad para representar datos.
- **Aporte clave:** La jerarquía de efectividad de las variables visuales (posición > longitud > ángulo > área > color) informa la selección de chart type del skill.
- **Referencia:** Bertin, J. (1967/1983). *Semiology of Graphics*. University of Wisconsin Press.

### 8. Mike Bostock — D3.js & Observable (2011–presente)

- **Relevancia:** Aunque el skill usa Mermaid (no D3), los patrones narrativos de Observable notebooks — donde texto y visualización se intercalan — informan la filosofía de "texto complementa, no reemplaza" del skill.
- **Aporte clave:** El concepto de "explorable explanations" y narrativas de datos interactivas como patrón comunicativo.
- **Referencia:** Bostock, M. *Observable*. https://observablehq.com/

---

## Fuentes Secundarias

### 9. Andy Kirk — Data Visualisation: A Handbook (2019)

- **Relevancia:** Proceso práctico de diseño: purpose → data → visualisation → annotation → presentation. Taxonomía de 50+ tipos de gráfico organizados por función comunicativa.
- **Aporte clave:** Framework de decisión para chart selection que complementa la matriz del skill con opciones especializadas (slope charts, bullet charts, waffle charts).

### 10. Dona Wong — The Wall Street Journal Guide to Information Graphics (2013)

- **Relevancia:** Estándares editoriales de visualización: ejes legibles, colores distinguibles, anotaciones precisas, y chart types apropiados para audiencia ejecutiva.
- **Aporte clave:** Reglas prácticas de anotación (qué anotar, dónde posicionar, cuándo es excesivo) directamente aplicables a deliverables de consulting.

### 11. IBCS — International Business Communication Standards (2017)

- **Relevancia:** Estándar para comunicación de datos en contexto empresarial. Notación uniforme para reportes, presentaciones y dashboards.
- **Aporte clave:** Conceptos de "semantic notation" (actual vs plan, variance highlighting) aplicables a dashboards de discovery (AS-IS vs TO-BE, gap analysis).

---

## Glosario del Dominio

| Término | Definición |
|---------|-----------|
| **Chart selection matrix** | Tabla de decisión que mapea patrones de datos (comparación, tendencia, composición, flujo) a tipos de gráfico óptimos |
| **Data-ink ratio** | Proporción de tinta dedicada a datos reales vs. decoración; maximizarla mejora la comunicación (Tufte) |
| **Annotation strategy** | Criterios para decidir qué data points anotar y cómo; selectividad > exhaustividad |
| **Visual hierarchy** | Organización de elementos visuales por importancia; guía el ojo del lector hacia el mensaje principal |
| **Dashboard sequence** | Orden narrativo de visualizaciones en un documento/presentación; cada visual construye el argumento |
| **Narrative arc** | Estructura de storytelling (contexto → tensión → resolución) aplicada a la secuencia de visualizaciones |
| **C4 storytelling** | Aplicación de técnicas narrativas a diagramas C4; cada nivel de zoom cuenta una historia diferente |
| **classDef** | Definición de estilo en Mermaid para colorear nodos según su rol semántico (primary, risk, success, neutral) |
| **Diagram budget** | Número recomendado de diagramas por deliverable; controla densidad visual |
| **Headline visual** | La primera visualización de una secuencia; captura atención y comunica el mensaje principal |
| **Evidence visual** | Visualización de soporte que proporciona detalle y datos comparativos |
| **Action visual** | Visualización final de una secuencia que indica next steps, roadmap, o decisiones |
| **Chartjunk** | Elementos decorativos que no transmiten información; deben eliminarse (Tufte) |
| **Pre-attentive attributes** | Propiedades visuales procesadas antes de la atención consciente: color, tamaño, orientación, forma |
| **Exploratory vs. explanatory** | Dos modos de visualización: explorar datos (análisis) vs. explicar hallazgos (comunicación); el skill se centra en explanatory |

---

## Relación con Otros Skills

| Skill | Relación |
|-------|----------|
| `data-storytelling` | Complementario — data-storytelling interpreta métricas y construye la narrativa textual; data-viz-storytelling diseña la representación visual |
| `output-engineering` | Downstream — output-engineering produce el formato final (HTML, PPTX); data-viz-storytelling define el contenido visual |
| `design-system` | Upstream — design-system provee tokens, componentes, y brand guidelines que data-viz-storytelling consume para colores y estilos |
| `copywriting` | Complementario — copywriting refina el texto que acompaña las visualizaciones; data-viz-storytelling define qué visualizar |
| `asis-analysis` | Consumidor — AS-IS produce hallazgos que data-viz-storytelling representa visualmente en diagramas C4 y comparativos |
