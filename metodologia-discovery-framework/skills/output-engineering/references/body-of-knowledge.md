# Body of Knowledge — Output Engineering

Fuentes fundacionales, estándares de referencia y glosario para el skill de Output Engineering: ghost menu system, multi-format production pipeline, brand compliance y content integrity validation.

---

## Fuentes Primarias

### 1. Mark Bernstein — Hypertext Gardens (1998)

- **Relevancia:** Modelo fundacional para comprender la relación entre contenido estructurado y sus múltiples representaciones. Establece que el contenido es independiente de su presentación.
- **Aporte clave:** El principio de separación contenido/forma que fundamenta el modelo "markdown como fuente de verdad" del skill.
- **Referencia:** Bernstein, M. (1998). *Hypertext Gardens: Delightful Vistas*. Eastgate Systems.

### 2. John Gruber — Markdown Philosophy (2004)

- **Relevancia:** Creador de Markdown. Su filosofía de diseño — legibilidad como prioridad, formato mínimo suficiente, conversión a HTML como derivado — es el fundamento filosófico del skill.
- **Aporte clave:** "A Markdown-formatted document should be publishable as-is, as plain text, without looking like it's been marked up with tags or formatting instructions."
- **Referencia:** Gruber, J. (2004). *Markdown: Syntax*. https://daringfireball.net/projects/markdown/syntax

### 3. CommonMark Specification (2014–presente)

- **Relevancia:** Especificación formal de Markdown que elimina ambigüedades del Markdown original. El skill opera sobre CommonMark + extensiones (tablas, footnotes, callouts).
- **Aporte clave:** Parsing rules determinísticas que garantizan conversión consistente entre formatos.
- **Referencia:** CommonMark. *CommonMark Spec*. https://spec.commonmark.org/

### 4. Pandoc — Universal Document Converter (John MacFarlane, 2006–presente)

- **Relevancia:** El estándar de facto para conversión entre formatos de documentos. Fundamento técnico del pipeline .md → DOCX/PDF/PPTX del skill.
- **Aporte clave:** Abstract Syntax Tree (AST) como representación intermedia universal. Readers y writers modulares. Custom templates y filters.
- **Referencia:** MacFarlane, J. *Pandoc User's Guide*. https://pandoc.org/MANUAL.html

### 5. WCAG 2.1 — Web Content Accessibility Guidelines (W3C, 2018)

- **Relevancia:** Estándar mandatorio para accesibilidad en outputs HTML y PDF. El skill implementa nivel AA en todas las conversiones web.
- **Aporte clave:** Criterios medibles para percepción (contraste 4.5:1), operabilidad (keyboard nav), comprensión (lenguaje claro) y robustez (HTML válido).
- **Referencia:** W3C. (2018). *WCAG 2.1*. https://www.w3.org/TR/WCAG21/

### 6. Edward Tufte — The Visual Display of Quantitative Information (2001)

- **Relevancia:** Principios de integridad visual en la representación de datos. Fundamental para la regla "content integrity validation" — los números y datos deben sobrevivir intactos la conversión de formato.
- **Aporte clave:** Data-ink ratio, chartjunk elimination, y el principio de que la representación visual nunca debe distorsionar los datos subyacentes.
- **Referencia:** Tufte, E.R. (2001). *The Visual Display of Quantitative Information*. 2nd ed. Graphics Press.

### 7. Don Norman — The Design of Everyday Things (2013)

- **Relevancia:** Affordances y signifiers aplicados al ghost menu: el menú debe ser descubrible sin ser intrusivo, sus opciones deben comunicar claramente qué producirán.
- **Aporte clave:** El concepto de "ghost menu" como signifier: aparece en el momento justo (post-editorial review), comunica las acciones posibles, y desaparece sin friction.
- **Referencia:** Norman, D. (2013). *The Design of Everyday Things*. Revised ed. Basic Books.

### 8. Robert C. Martin — Clean Architecture (2017)

- **Relevancia:** El principio de dependencia invertida aplicado a producción de documentos: los formatos de salida dependen de la abstracción (markdown), nunca al revés.
- **Aporte clave:** La regla de dependencia del skill: ningún formato derivado puede alterar el contenido del markdown fuente. La forma cambia, la sustancia no.
- **Referencia:** Martin, R.C. (2017). *Clean Architecture*. Prentice Hall.

### 9. Rachel Andrew — The New CSS Layout (2017) + CSS Grid/Print Standards

- **Relevancia:** Estándares modernos de CSS para layout, print media queries, y responsive design que informan la producción HTML del skill.
- **Aporte clave:** `@media print` como ciudadano de primera clase, CSS Grid para layouts complejos, y container queries para componentes adaptativos.
- **Referencia:** Andrew, R. (2017). *The New CSS Layout*. A Book Apart.

### 10. Mermaid.js Documentation (Knut Sveidqvist, 2014–presente)

- **Relevancia:** Sistema de diagramación basado en texto usado en todos los deliverables. El skill debe garantizar que los diagramas Mermaid sobrevivan la conversión a cada formato.
- **Aporte clave:** Sintaxis declarativa para flowcharts, sequence diagrams, Gantt, C4, etc. Rendering via CDN en HTML, pre-rendering para formatos estáticos.
- **Referencia:** Mermaid. *Mermaid Documentation*. https://mermaid.js.org/

---

## Fuentes Complementarias

| Fuente | Aporte | URL |
|--------|--------|-----|
| OOXML (Office Open XML) | Especificación de formatos DOCX/PPTX/XLSX — estructura ZIP, XML interno | https://docs.microsoft.com/en-us/openspecs/office_standards |
| PDF/A (ISO 19005) | Estándar de archivado PDF — fonts embebidos, sin dependencias externas | https://www.pdfa.org/ |
| Reveal.js | Framework de presentaciones HTML que informa principios de narrativa visual PPTX | https://revealjs.com/ |
| MetodologIA Brand Manual (interno) | Paleta oficial (#6366F1, #1A1A2E, #22D3EE), tipografía, uso de logo | Documentación interna Comunidad MetodologIA |
| markdown-lint (DavidAnson) | Reglas de linting para markdown-excellence standard | https://github.com/DavidAnson/markdownlint |
| Puppeteer/Playwright | Herramientas de rendering headless para PDF generation desde HTML | https://playwright.dev/ |
| Apache POI / python-pptx | Bibliotecas de generación programática PPTX/XLSX | https://python-pptx.readthedocs.io/ |

---

## Glosario

| Término | Definición |
|---------|-----------|
| **Ghost Menu** | Menú contextual que aparece automáticamente tras la aprobación editorial de un deliverable markdown. Ofrece conversión a formatos derivados sin ser intrusivo — el usuario decide, el sistema no auto-convierte. |
| **Source of Truth** | El archivo markdown original que contiene todo el contenido del deliverable. Es el master del cual se derivan todos los formatos. Nunca se modifica como resultado de una conversión. |
| **Format Pipeline** | Cadena de transformación que convierte markdown a un formato específico (.md → HTML, .md → DOCX, etc.) aplicando optimizaciones propias del medio destino. |
| **Content Integrity** | Propiedad que garantiza que todo el contenido del markdown fuente está presente y sin alteración en el formato derivado: secciones, tablas, números, diagramas, referencias. |
| **Brand Compliance** | Adherencia a los 7 elementos del MetodologIA Design System: color primario, color oscuro, color éxito (gold, nunca verde), logo, footer, tipografía, disclaimer. |
| **markdown-excellence** | Estándar de calidad para markdown: TL;DR, prosa densa, tablas con semáforos, diagramas Mermaid, callouts, footnotes, cross-references. |
| **Editorial Review** | Proceso de validación que precede al ghost menu. El comité editorial (editorial-director, content-strategist, format-specialist) revisa y aprueba el markdown antes de ofrecer conversión. |
| **Delivery Package** | Conjunto completo de formatos derivados de un mismo deliverable: .md + .html + .docx + .pptx + .xlsx + .pdf + README.md. Se genera cuando el usuario solicita `all`. |
| **Format Specialist** | Agente del comité editorial especializado en producción multi-formato y brand compliance. Principal consumidor del skill output-engineering. |
| **Auto-Suggest** | Regla que mapea cada tipo de deliverable a los formatos más útiles (ej: 05_Escenarios → HTML + PPTX). Sugiere pero nunca impone. |
| **Semaphore Colors** | Sistema de indicadores visuales (verde/amarillo/rojo) que en el contexto MetodologIA usa gold (#22D3EE) para positivo, nunca verde. |
| **Production-Ready** | Calidad de output que no requiere edición adicional. Si se genera un formato derivado, está listo para envío al cliente. |
| **Content Parity** | Validación cuantitativa entre markdown y formato derivado: mismo número de secciones, filas de tabla, diagramas, y cifras financieras. |

---

## Principios Fundacionales

### 1. Markdown es la fuente de verdad
Todo contenido vive en markdown. Los formatos derivados son proyecciones optimizadas para medios específicos. El markdown nunca se modifica como resultado de una conversión.

### 2. La forma cambia, la sustancia no
La conversión de formato adapta presentación (layout, tipografía, interactividad) pero NUNCA altera contenido (datos, conclusiones, recomendaciones).

### 3. Cada formato tiene fortalezas únicas
HTML para interactividad y Mermaid rendering. DOCX para edición y firma. PPTX para narrativa visual ejecutiva. XLSX para análisis de datos. PDF para archivo. El pipeline optimiza para el medio.

### 4. El ghost menu es un signifier, no un mandato
Aparece en el momento justo, comunica opciones claras, y respeta la decisión del usuario. Nunca auto-convierte.

### 5. Production-ready o nada
No existen "borradores" en formatos derivados. Si el pipeline genera un output, está listo para el cliente.
