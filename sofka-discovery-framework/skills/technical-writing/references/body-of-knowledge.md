# Body of Knowledge — Technical Writing: Documentation Precision & Progressive Disclosure

> Fuentes académicas, industriales y prácticas que fundamentan la escritura técnica de precisión para documentación enterprise en contextos de discovery y consultoría.

---

## 1. Fundamentos de Escritura Técnica

### Information Mapping (Robert E. Horn)

- **Relevancia:** Framework fundacional para estructurar información técnica en bloques modulares, clasificados por tipo (principio, procedimiento, proceso, concepto, estructura, hecho). Permite al lector navegar sin lectura lineal.
- **Uso en el skill:** La arquitectura de progressive disclosure (TL;DR → secciones → detalles → apéndice) implementa los principios de Information Mapping: cada bloque es autocontenido, clasificado, y accesible por rol del lector.
- **Fuente:** Horn, R.E. (1989). *Mapping Hypertext: The Analysis, Organization, and Display of Knowledge for the Next Generation of On-Line Text and Graphics*. Lexington Institute.
- **Extensión:** Horn, R.E. (1998). *Visual Language: Global Communication for the 21st Century*. MacroVU Press.

### Minimalism in Technical Communication (John Carroll)

- **Relevancia:** Teoría que demuestra que los usuarios aprenden mejor con documentación orientada a tareas, mínima en extensión, y que permite errores y recuperación. Fundamenta el principio de densidad informativa.
- **Uso en el skill:** La regla "cada frase aporta información nueva" y la eliminación de filler phrases se derivan directamente del minimalismo de Carroll. Los anti-patrones (filler, repetición, pasiva sin agente) son violaciones de este principio.
- **Fuente:** Carroll, J.M. (1990). *The Nurnberg Funnel: Designing Minimalist Instruction for Practical Computer Skill*. MIT Press.
- **Actualización:** van der Meij, H. & Carroll, J.M. (1995). "Principles and heuristics for designing minimalist instruction". *Technical Communication*, 42(2), 243-261.

### Structured Writing (Ann Rockley)

- **Relevancia:** Framework para crear contenido modular, reutilizable y estructurado mediante modelos de información, taxonomías y relaciones semánticas. Fundamenta la consistencia terminológica transversal.
- **Uso en el skill:** El protocolo de consistencia terminológica ("un término = un significado en todo el discovery") implementa los content models de Rockley. La trazabilidad entre entregables (00-09) requiere structured writing.
- **Fuente:** Rockley, A. (2003). *Managing Enterprise Content: A Unified Content Strategy*. New Riders.
- **Actualización:** Rockley, A. & Cooper, C. (2012). *Managing Enterprise Content: A Unified Content Strategy* (2nd Ed). New Riders.

---

## 2. Estándares de Documentación Técnica

### ISO/IEC 26514:2022 — Design and Development of User Documentation

- **Relevancia:** Estándar internacional para diseño, desarrollo y producción de documentación de usuario para sistemas de software. Define requisitos de estructura, contenido, estilo, y accesibilidad.
- **Uso en el skill:** Los templates de sección (TL;DR → body → tabla → insight → cross-ref) siguen la estructura propuesta por ISO 26514 para documentación técnica de calidad. Los criterios de validation gate se alinean con los requisitos de calidad del estándar.
- **Fuente:** ISO/IEC 26514:2022, "Systems and software engineering — Design and development of information for users".

### ASD-STE100 — Simplified Technical English

- **Relevancia:** Especificación de lenguaje controlado originalmente desarrollada para la industria aeroespacial. Define reglas de escritura y un diccionario controlado que reduce ambigüedad y mejora comprensión multilingüe.
- **Uso en el skill:** Los principios de STE informan las reglas anti-patrón: oraciones cortas, voz activa con agente identificado, un término por concepto, verbos específicos en lugar de genéricos. Adaptado al español técnico del contexto de discovery.
- **Fuente:** ASD (2021). *ASD-STE100 Simplified Technical English, Issue 8*. Aerospace and Defence Industries Association of Europe.

### DITA (Darwin Information Typing Architecture)

- **Relevancia:** Arquitectura de información XML que define tipos de tópicos (concept, task, reference, troubleshooting) y mecanismos de reutilización (conref, keyref, filtering). Estándar OASIS para documentación técnica modular.
- **Uso en el skill:** Los patrones estructurales por tipo de documento (Analysis, Spec, Handover, Architecture, Assessment) implementan la filosofía DITA de tipificación de contenido, adaptada a markdown. Cada sección tiene un tipo implícito que determina su estructura.
- **Fuente:** OASIS (2015). *Darwin Information Typing Architecture (DITA) Version 1.3*. docs.oasis-open.org/dita.
- **Complemento:** Priestley, M. et al. (2001). "DITA: An XML-based technical documentation authoring and publishing architecture". *IBM Systems Journal*, 40(3).

### Plain Language Standards

- **Relevancia:** Movimiento global hacia documentación gubernamental y corporativa que sea comprensible en primera lectura. La Federal Plain Language Guidelines (US) y la norma ISO 24495-1:2023 definen principios de claridad.
- **Uso en el skill:** La densidad informativa se equilibra con comprensibilidad. Las reglas de plain language informan la redacción de TL;DR y resúmenes ejecutivos — donde el lector es C-level sin background técnico.
- **Fuentes:**
  - ISO 24495-1:2023, "Plain language — Part 1: Governing principles and guidelines".
  - Federal Plain Language Guidelines (2011, actualizado 2023). plainlanguage.gov.
  - Clarity International (2025). "Plain Language for Technical Documentation".

---

## 3. Atribución de Evidencia y Trazabilidad

### Evidence-Based Software Engineering (Kitchenham & Charters)

- **Relevancia:** Framework para la aplicación de evidencia empírica en decisiones de ingeniería de software. Define niveles de evidencia, sesgos comunes, y protocolos de revisión sistemática.
- **Uso en el skill:** El sistema de etiquetas de evidencia ([CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER], [BENCHMARK]) es una adaptación pragmática de la jerarquía de evidencia de Kitchenham al contexto de discovery.
- **Fuente:** Kitchenham, B.A. & Charters, S. (2007). "Guidelines for performing Systematic Literature Reviews in Software Engineering". EBSE Technical Report.
- **Extensión:** Kitchenham, B.A. et al. (2009). "Systematic literature reviews in software engineering — A systematic literature review". *Information and Software Technology*, 51(1), 7-15.

### Architecture Decision Records (ADRs)

- **Relevancia:** Patrón de documentación que captura decisiones arquitectónicas con contexto, opciones consideradas, y razonamiento. Cada ADR es trazable y auditable.
- **Uso en el skill:** La atribución de evidencia en tablas (Finding → Evidence → Impact → Source) sigue la filosofía ADR de decisiones documentadas y trazables. Cada hallazgo es un "micro-ADR" que puede ser auditado.
- **Fuente:** Nygard, M. (2011). "Documenting Architecture Decisions". cognitect.com/blog.
- **Extensión:** Keeling, M. (2017). *Design It! From Programmer to Software Architect*. Pragmatic Bookshelf. Capítulo sobre ADRs.

### Provenance and Lineage in Data Documentation

- **Relevancia:** Conceptos de trazabilidad de datos (data lineage, data provenance) aplicados a documentación técnica. Cada dato en un entregable tiene un origen, una transformación, y un destino.
- **Uso en el skill:** Las reglas de atribución ("cada dato lleva tag de fuente") implementan data provenance a nivel documental. El lector puede trazar cualquier afirmación hasta su fuente original sin preguntar al autor.
- **Fuentes:**
  - Buneman, P. et al. (2001). "Why and where: A characterization of data provenance". *ICDT 2001*.
  - Gebru, T. et al. (2021). "Datasheets for Datasets". *Communications of the ACM*, 64(12).

---

## 4. Progressive Disclosure y Arquitectura de Información

### Progressive Disclosure (Jakob Nielsen)

- **Relevancia:** Principio de UX que muestra solo la información esencial primero, con acceso a detalle bajo demanda. Aplicado a documentación: el ejecutivo lee el TL;DR, el arquitecto lee las secciones, el implementador lee el detalle.
- **Uso en el skill:** La arquitectura de 4 niveles (Level 0: TL;DR → Level 1: Resúmenes → Level 2: Secciones completas → Level 3: Detalle técnico + Apéndice) es la implementación directa de progressive disclosure en documentación técnica.
- **Fuente:** Nielsen, J. (2006). "Progressive Disclosure". Nielsen Norman Group. nngroup.com/articles/progressive-disclosure.
- **Extensión:** Tidwell, J. (2011). *Designing Interfaces* (2nd Ed). O'Reilly. Patrón "Progressive Disclosure".

### Information Architecture (Rosenfeld & Morville)

- **Relevancia:** Disciplina de organización, etiquetado, y navegación de información. Define esquemas de organización (exactos, ambiguos), sistemas de etiquetado, y estructuras de navegación.
- **Uso en el skill:** La estructura de entregables (00-09), las cross-references ("→ See [XX_Deliverable § Section]"), y el sistema de etiquetado (callouts, badges, tags) implementan principios de IA para documentación.
- **Fuente:** Rosenfeld, L., Morville, P. & Arango, J. (2015). *Information Architecture: For the Web and Beyond* (4th Ed). O'Reilly.

### Topic-Based Authoring

- **Relevancia:** Metodología de escritura donde cada unidad de contenido (tópico) es autocontenida, clasificada por tipo, y reutilizable. Fundamento de DITA y de la documentación modular moderna.
- **Uso en el skill:** Cada sección de un entregable de discovery es un tópico autocontenido con su propio TL;DR, evidencia, y cross-references. Permite lectura no lineal y reutilización entre entregables.
- **Fuente:** Baker, M. (2013). *Every Page is Page One: Topic-Based Writing for Technical Communication and the Web*. XML Press.

---

## 5. Escritura para Audiencias Técnicas Enterprise

### Docs as Code

- **Relevancia:** Movimiento que trata la documentación como código: versionada, revisada, automatizada, y integrada en el pipeline. Fundamenta la producción de documentación en markdown con calidad de producción.
- **Uso en el skill:** Los entregables de discovery se producen en markdown con estándar markdown-excellence, versionados con los artefactos del proyecto, y revisables por el comité editorial.
- **Fuentes:**
  - Gentle, A. (2017). *Docs Like Code*. Lulu.com.
  - Procida, D. (2023). *Diátaxis: A Systematic Framework for Technical Documentation*. diataxis.fr.

### Diátaxis Framework (Daniele Procida)

- **Relevancia:** Framework que clasifica documentación técnica en 4 tipos: tutorials (aprender haciendo), how-to guides (lograr un objetivo), explanations (entender por qué), reference (información factual). Cada tipo tiene estructura y propósito distintos.
- **Uso en el skill:** Los tipos de documento del discovery se mapean a Diátaxis: AS-IS → explanation, Spec → reference, Handover → how-to guide. Esto informa las decisiones de estructura y tono.
- **Fuente:** Procida, D. (2023). *Diátaxis: A Systematic Framework for Technical Documentation*. diataxis.fr.

### Writing for Decision Makers (Barbara Minto)

- **Relevancia:** El Principio de la Pirámide de Minto estructura la comunicación top-down: conclusión primero, grupos de argumentos de soporte, evidencia detallada al final. Fundamental para comunicación con C-level.
- **Uso en el skill:** Los TL;DR y resúmenes ejecutivos implementan el principio de pirámide invertida. El Brief Técnico (02) es enteramente una implementación de Minto: conclusión en la primera página, soporte en las siguientes.
- **Fuente:** Minto, B. (2009). *The Pyramid Principle: Logic in Writing and Thinking* (3rd Ed). Pearson Education.

---

## 6. Diagramación Técnica

### C4 Model (Simon Brown)

- **Relevancia:** Modelo de diagramación arquitectónica en 4 niveles de abstracción: System Context, Container, Component, Code. Proporciona vocabulario visual y notación consistente para comunicar arquitectura.
- **Uso en el skill:** Los diagramas Mermaid en entregables de discovery siguen la filosofía C4 de niveles de abstracción. El presupuesto de diagramas por entregable (2-4) incluye al menos un diagrama de contexto o contenedores.
- **Fuente:** Brown, S. (2018). *The C4 Model for Visualising Software Architecture*. c4model.com.
- **Extensión:** Brown, S. (2024). *Software Architecture for Developers, Vol. 2* (actualizado). leanpub.com.

### Mermaid.js y Diagramas como Código

- **Relevancia:** Herramienta de diagramación basada en texto que permite crear diagramas versionables, revisables, y embebidos en markdown. Soporta flowchart, sequence, state, ER, Gantt, C4 (vía flowchart con classDef).
- **Uso en el skill:** Todos los diagramas en entregables de discovery se producen como bloques Mermaid: accesibles (texto descriptivo antes), versionables (texto plano), y renderizables tanto en markdown como en HTML.
- **Fuente:** Mermaid.js (2025). *Mermaid Documentation v10*. mermaid.js.org.

---

## 7. Bibliografía Práctica

| Categoría | Libro/Recurso | Autor | Relevancia |
|---|---|---|---|
| Fundacional | *The Elements of Style* | Strunk & White (2000, 4th Ed) | Claridad, brevedad, precisión — aplicable a español técnico |
| Fundacional | *On Writing Well* | William Zinsser (2006) | Escritura no-ficción de calidad: simplicidad, humanidad, rewriting |
| Técnico | *Developing Quality Technical Information* | Hargis, G. et al. (2004, IBM) | Estándar IBM de calidad documental: accuracy, completeness, clarity |
| Técnico | *Docs for Developers* | Bhatti, J. et al. (2021) | Documentación moderna para desarrolladores: API docs, tutorials, guides |
| Estructura | *The Pyramid Principle* | Barbara Minto (2009) | Comunicación top-down para decision makers |
| IA & Docs | *Diátaxis* | Daniele Procida (2023) | Framework de 4 tipos de documentación técnica |
| Datos | *Storytelling with Data* | Cole Nussbaumer Knaflic (2015) | Visualización y narrativa de datos — fundamenta tablas y diagramas |
| Estilo | *Microsoft Writing Style Guide* | Microsoft (2024) | Guía de estilo moderna para documentación técnica |

---

## 8. Glosario de Términos

| Término | Definición |
|---|---|
| **Progressive Disclosure** | Patrón de presentación que muestra información esencial primero y detalle bajo demanda |
| **Evidence Tag** | Etiqueta que identifica la fuente y confiabilidad de una afirmación: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER] |
| **Filler** | Frase que no aporta información nueva ("cabe señalar", "es importante destacar") |
| **Callout** | Bloque destacado que señala insight, trade-off, riesgo o evidencia |
| **Cross-reference** | Referencia cruzada entre secciones o entregables: "→ See [XX § Sección]" |
| **TL;DR** | "Too Long; Didn't Read" — resumen de 3-5 bullets al inicio de cada documento |
| **Densidad informativa** | Ratio de información nueva por frase. Objetivo: 100% (cada frase aporta) |
| **Terminología como contrato** | Principio de usar un único término para cada concepto en todo el discovery |
| **Anti-patrón** | Patrón de escritura que se identifica y bloquea: filler, pasiva sin agente, scores sin justificación |
| **Validation Gate** | Checklist de 8 criterios que todo entregable debe pasar antes de entrega |
| **Markdown-excellence** | Estándar MetodologIA de calidad para documentación markdown en entregables de discovery |
| **Topic-based authoring** | Escritura modular donde cada unidad (tópico) es autocontenida y tipificada |
| **DITA** | Darwin Information Typing Architecture — estándar OASIS para documentación modular XML |
| **Information Mapping** | Método de estructuración de información en bloques clasificados por tipo |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
