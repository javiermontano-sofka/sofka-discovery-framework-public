# State of the Art — Data Visualization Storytelling

Tendencias, avances y dirección del ecosistema de visualización de datos narrativa relevantes para el skill, período 2024–2026.

---

## 1. Mermaid.js v11 y Ecosistema de Diagramación como Código

**Estado:** Mermaid.js consolidó su posición como el estándar de facto para diagramación en markdown y documentation-as-code. La v11 (2025) introdujo mejoras en rendering de C4, soporte mejorado para quadrantChart, y optimización de performance para diagramas complejos. La adopción en GitHub, GitLab, Notion, Confluence, y Obsidian alcanzó masa crítica.

**Impacto en el skill:**
- El skill ya está centrado en Mermaid como herramienta primaria — alineado con la tendencia.
- Oportunidad: explotar nuevos tipos de diagrama (sankey, timeline mejorado, zenuml) para narrativas más ricas.
- Riesgo: la tentación de complejidad. Mermaid v11 permite más nodos y estilos, pero la restricción de 20 nodos / 4 classDefs del skill sigue siendo correcta para legibilidad en consulting.

**Señales:**
- GitHub render de Mermaid en markdown alcanzó >1M repositorios con diagramas Mermaid en 2025.
- PlantUML pierde terreno frente a Mermaid por la barrera de setup (Java runtime vs. CDN).

---

## 2. AI-Generated Visualizations y Chart Recommendation

**Estado:** Herramientas como ChatGPT Canvas, Claude Artifacts, Cursor, y Hex generan visualizaciones directamente desde datos o descripciones naturales. GitHub Copilot sugiere chart types basándose en el shape de los datos. Las chart recommendation engines (VizML, Draco, ShowMe) maduran hacia producción.

**Impacto en el skill:**
- El skill opera como una "chart recommendation engine" basada en reglas (la Chart Selection Matrix) — más predecible y auditable que los modelos estadísticos.
- Oportunidad: complementar la matriz con heurísticas de "data shape detection" para auto-recomendar chart type cuando el contexto es ambiguo.
- Ventaja competitiva: el skill no solo selecciona el chart type sino que diseña la narrativa completa (anotación, secuencia, storytelling) — algo que las herramientas AI aún no hacen bien.

**Señales:**
- Tableau Ask Data y Power BI Copilot generan visualizaciones desde lenguaje natural (2024-2025).
- La calidad de auto-generated charts es aceptable para exploración pero deficiente para comunicación ejecutiva.

---

## 3. Scrollytelling y Narrativas Interactivas

**Estado:** El patrón de "scrollytelling" (narrativa guiada por scroll) se expandió de periodismo de datos (NYT, The Pudding, Reuters Graphics) a reportería empresarial. Observable Framework, Quarto, y Svelte storytelling libraries permiten crear narrativas donde las visualizaciones reaccionan al scroll del lector.

**Impacto en el skill:**
- Los deliverables de discovery son actualmente estáticos (markdown, HTML, PPTX). El scrollytelling es una evolución natural para presentaciones web interactivas.
- Oportunidad: diseñar las secuencias narrativas del skill (headline → context → evidence → action) como blueprint para futuras implementaciones scrollytelling.
- Limitación actual: el skill produce Mermaid estático, no D3/Svelte interactivo. El patrón scrollytelling se implementa como "secuencia de slides" en el formato actual.

**Señales:**
- Observable Framework permite publicar notebooks como sitios estáticos con transiciones narrativas.
- Quarto 1.5 (2025) integró scrollytelling nativo para reportes de datos.

---

## 4. Accesibilidad en Visualización de Datos (WCAG 2.2 + Chartability)

**Estado:** El framework Chartability (creado por Frank Elavsky, 2022-2025) estableció criterios específicos de accesibilidad para visualizaciones de datos, complementando WCAG 2.2. Principios: no depender solo del color, proveer texto alternativo estructurado, soportar navegación por teclado en charts interactivos.

**Impacto en el skill:**
- El skill ya exige "alt-text summary BEFORE every diagram" — alineado con Chartability.
- El uso de classDefs con colores semánticos (orange, red, gold, neutral) combina color con posición y forma — cumple el principio de "no solo color."
- Oportunidad: enriquecer el alt-text con estructura semántica ("Este diagrama C4 muestra 3 contenedores, 1 base de datos compartida marcada como riesgo, y 2 servicios externos").

**Señales:**
- Chartability fue adoptado por Visa Chart Components y Observable Plot en 2024.
- WCAG 2.2 (2023) añadió criterios de "dragging movements" y "target size" relevantes para charts interactivos.

---

## 5. Data Storytelling como Competencia Organizacional

**Estado:** La narrativa de datos ya no es exclusiva de analistas. Organizaciones como Google, Airbnb, y Spotify formalizan "data storytelling" como competencia transversal. Frameworks como el "Data Storytelling Canvas" (Brent Dykes, 2019-2025) estructuran el proceso: audience → context → data → narrative → visuals → call-to-action.

**Impacto en el skill:**
- El skill se posiciona exactamente en el eslabón "visuals" del pipeline de data storytelling.
- La integración con `data-storytelling` (narrativa textual) y `output-engineering` (formato de entrega) crea un pipeline completo.
- Oportunidad: formalizar el "visual brief" como input — un documento de una página que define audience, message, y context antes de seleccionar chart types.

**Señales:**
- Brent Dykes publicó *Effective Data Storytelling* (2019) — ahora referencia estándar en formación corporativa.
- LinkedIn reportó "data storytelling" como skill emergente top-10 en roles de analytics y consulting (2025).

---

## 6. Diagramación C4 Narrativa y Architecture Decision Records Visuales

**Estado:** El modelo C4 evoluciona de "documentación estática" a "narrativa arquitectónica." La comunidad adopta "C4 + ADR" donde cada diagrama C4 incluye el contexto de decisión (por qué esta arquitectura, qué alternativas se descartaron). Structurizr y IcePanel lideran herramientas de C4 interactivo.

**Impacto en el skill:**
- La filosofía "every diagram tells a story" del skill está perfectamente alineada con esta tendencia.
- El ejemplo del skill (pain point: "3 services share 1 database") es exactamente el patrón de C4 narrativo.
- Oportunidad: estandarizar un template de "C4 story card" que combine diagrama + pain point + annotation + recommendation en una unidad reutilizable.

**Señales:**
- Simon Brown actualizó C4 model guidelines con énfasis en "architecture for communication" (2024).
- IcePanel alcanzó >10K equipos con C4 interactivo (zoom, filter, narrative layers) en 2025.

---

## 7. Design Tokens para Visualización (Theming Semántico)

**Estado:** Los design tokens (W3C DTCG spec) se extienden más allá de UI a visualización de datos. Equipos definen "chart tokens" — paletas semánticas para datos (primary series, secondary series, risk, success, neutral) que se resuelven contra el theme activo.

**Impacto en el skill:**
- El skill ya implementa chart tokens via classDefs de Mermaid (primary=#6366F1, risk=#DC3545, success=#22D3EE, neutral=#F8F9FA).
- Oportunidad: formalizar estos como design tokens consumibles por otros skills (output-engineering, design-system) para consistencia transversal.
- El principio "NEVER green for success" es un chart token semántico que evita confusión con "go/positive" en audiencias con daltonismo.

**Señales:**
- Figma Variables permite definir "chart color collections" separadas de UI colors (2024).
- Shopify Polaris y Atlassian Design System publicaron "data visualization color guidelines" formalizadas (2025).
