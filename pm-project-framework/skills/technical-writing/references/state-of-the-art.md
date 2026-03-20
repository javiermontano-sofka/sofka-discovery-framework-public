# State of the Art — Technical Writing (2024-2026)

> Tendencias, herramientas emergentes y debates abiertos en escritura técnica de precisión para documentación enterprise y consultoría.

---

## 1. Tendencias Dominantes

### 1.1 AI-Assisted Technical Writing — El Copiloto Impreciso

- **Qué está pasando:** LLMs como GPT-4, Claude y Gemini se usan masivamente para generar borradores de documentación técnica. El problema: generan texto fluido pero con baja densidad informativa, filler abundante, terminología inconsistente, y afirmaciones sin evidencia. El ratio señal/ruido es bajo para estándares de documentación enterprise.
- **Impacto en technical writing:** El skill se vuelve más crítico, no menos. El rol evoluciona de "escribir desde cero" a "curar, validar y elevar borradores de IA". La atribución de evidencia es el diferenciador: un LLM puede generar una tabla, pero no puede etiquetar [CÓDIGO] vs [INFERENCIA] sin acceso al codebase real.
- **Herramientas emergentes:** GitHub Copilot for Docs, Mintlify, ReadMe AI, Notion AI, Writer.com (enterprise style enforcement).
- **Riesgo:** Equipos que aceptan output de LLM sin revisión producen documentación con aspecto profesional pero contenido no verificable. El "uncanny valley" de documentación: parece bien escrita pero las afirmaciones son genéricas o incorrectas.
- **Fuentes:** Barr, V. et al. (2025) "AI and Technical Communication: Promise and Peril". *IEEE Transactions on Professional Communication*; Brumberger, E. & Lauer, C. (2025) "Generative AI in Technical Communication Workflows".

### 1.2 Docs-as-Code en Enterprise — De Nicho a Mainstream

- **Qué está pasando:** La práctica de tratar documentación como código (Git, CI/CD, linters, review) pasó de ser exclusiva de startups tech a adoptarse en enterprises. MDX, Docusaurus, MkDocs, y Astro Starlight dominan. Las empresas mantienen documentation pipelines con quality gates automatizados.
- **Impacto en technical writing:** Los entregables de discovery se producen en markdown con calidad de producción. La cadena markdown → HTML → PDF/DOCX permite single-source publishing. Los linters de markdown (markdownlint, vale) automatizan enforcement de estilo.
- **Tendencias específicas:** Componentes interactivos en MDX, diagrams-as-code (Mermaid, D2, PlantUML), API documentation automation (OpenAPI → docs), y content versioning por rama.
- **Fuentes:** Gentle, A. (2024) "State of Docs-as-Code in Enterprise"; Write the Docs community surveys (2025); Splunk, Stripe, GitLab case studies.

### 1.3 Content Design y UX Writing — Convergencia con Technical Writing

- **Qué está pasando:** Las disciplinas de content design (Sarah Richards), UX writing, y technical writing convergen. La documentación enterprise ya no es solo precisa — debe ser diseñada para el usuario: progressive disclosure, scannable layouts, actionable language.
- **Impacto en technical writing:** El skill incorpora principios de content design: cada sección tiene un job-to-be-done claro, los headings son informativos (no solo descriptivos), y las tablas se diseñan para decisión rápida (semáforos 🟢🟡🔴).
- **Evolución:** La documentación de discovery es un producto de información, no un artefacto burocrático. El comité editorial aplica criterios de content design al producir entregables.
- **Fuentes:** Richards, S. (2017) *Content Design*. Content Design London; Podmajersky, T. (2019) *Strategic Writing for UX*. O'Reilly; Kinneret, Y. (2024) "The Convergence of Technical and Content Writing".

### 1.4 Accesibilidad y Lenguaje Inclusivo en Documentación Técnica

- **Qué está pasando:** Los estándares de accesibilidad (WCAG 2.2, EU Accessibility Act 2025) y las guías de lenguaje inclusivo impactan la documentación técnica. Texto alternativo para diagramas, estructura semántica en HTML, y terminología no excluyente son requisitos crecientes.
- **Impacto en technical writing:** Cada diagrama Mermaid requiere texto descriptivo de accesibilidad (ya implementado en el skill). Las tablas requieren headers semánticos. El lenguaje evita términos excluyentes (master/slave → primary/replica, blacklist/whitelist → allowlist/denylist).
- **Fuentes:** W3C (2023) "WCAG 2.2"; EU (2025) "European Accessibility Act"; Google (2024) "Inclusive Documentation Guidelines".

---

## 2. Herramientas Emergentes (2024-2026)

### 2.1 Producción y Quality Assurance de Documentación

| Herramienta | Propósito | Madurez | Relevancia para Technical Writing |
|---|---|---|---|
| **Vale** | Prose linter configurable (estilo, terminología, anti-patrones) | Estable | Enforcement automatizado de reglas de estilo y anti-patrones |
| **markdownlint** | Linter de estructura markdown | Madura | Validación de heading hierarchy, table format, code blocks |
| **Mermaid v10+** | Diagramas como código en markdown/HTML | Madura | Producción de diagramas integrados en entregables |
| **D2** | Lenguaje declarativo de diagramas (alternativa a Mermaid) | Creciendo | Mayor expresividad para diagramas arquitectónicos complejos |
| **Mintlify** | Documentation platform con AI-assist | Creciendo rápido | Single-source publishing markdown → web |
| **Writer.com** | Enterprise style enforcement con AI | Madura | Terminología consistente, tono corporativo |

### 2.2 Frameworks de Documentación

| Framework | Propósito | Relevancia |
|---|---|---|
| **Diátaxis** | Clasificación de documentación en 4 tipos | Informa estructura de entregables por tipo |
| **Good Docs Project** | Templates open-source de documentación técnica | Modelos de referencia para sección templates |
| **Docs for Developers** | Framework para documentación de APIs y SDKs | Patrones para secciones técnicas con código |
| **ITCQF (Certified Technical Communication)** | Certificación profesional de comunicación técnica | Estándar de competencias para escritores técnicos |

### 2.3 Publicación y Distribución

| Herramienta | Propósito | Relevancia |
|---|---|---|
| **Astro Starlight** | Documentation sites (Astro-based) | Publicación web de alta calidad desde markdown |
| **MkDocs Material** | Documentation sites (Python-based) | Temas profesionales, búsqueda integrada |
| **Docusaurus** | Documentation sites (React-based) | MDX support, versionado, i18n |
| **Pandoc** | Conversión universal de formatos | Cadena markdown → HTML → DOCX → PDF |
| **WeasyPrint** | HTML → PDF con CSS Paged Media | Producción de PDFs con diseño MetodologIA desde HTML |

---

## 3. Debates Abiertos en la Industria

### 3.1 ¿Puede un LLM reemplazar al escritor técnico?

**El problema de 2025-2026:**
- **Posición optimista:** "Los LLMs generan documentación 10x más rápido. El escritor técnico se vuelve un editor/curator."
- **Posición escéptica:** "Los LLMs generan texto que *parece* documentación pero no lo es. Sin acceso al sistema real, sin verificación de evidencia, y sin conocimiento del contexto del proyecto, el output es filler con formato."
- **Posición del skill:** Los LLMs son herramientas de aceleración, no de reemplazo. El valor del technical writer está en: (1) acceso al sistema real para verificar afirmaciones, (2) clasificación de evidencia por confiabilidad, (3) consistencia terminológica transversal, (4) juicio sobre qué incluir y qué omitir. Un LLM puede generar un borrador de tabla; el writer la valida, etiqueta, y conecta con el resto del discovery.

### 3.2 ¿Markdown es suficiente para documentación enterprise?

- **Posición pro-markdown:** "Markdown es universal, versionable, liviano, y con herramientas de conversión (Pandoc) genera cualquier formato. Single-source of truth."
- **Posición pro-herramientas:** "Enterprise requiere WYSIWYG para revisión por stakeholders no-técnicos. Confluence, Notion, Google Docs permiten colaboración real-time."
- **Posición del skill:** Markdown es el formato de producción (source of truth). HTML, DOCX, PDF son formatos de distribución generados desde markdown. El comité editorial produce markdown world-class; el ghost menu ofrece conversión. El stakeholder nunca edita el markdown directamente — revisa el formato distribuido y provee feedback que se incorpora al source.

### 3.3 ¿Cuánta evidencia es suficiente?

- **Riesgo de sub-atribución:** Afirmaciones sin fuente generan desconfianza y son inauditables.
- **Riesgo de sobre-atribución:** Cada frase con 3 tags es ilegible. El documento parece una bibliografía comentada.
- **Posición del skill:** Evidencia en claims cuantitativos y afirmaciones causales (obligatorio). Evidencia en observaciones descriptivas (opcional, pero recomendado). Nunca evidencia en frases conectoras o transiciones. El balance: el lector debe poder verificar cualquier afirmación que influya en una decisión, pero el documento debe ser legible como prosa.

### 3.4 ¿Progressive disclosure o completitud?

- **Problema:** El ejecutivo quiere 2 páginas. El arquitecto quiere 20. El implementador quiere 50. Un solo documento no puede servir a los tres.
- **Posición del skill:** Progressive disclosure resuelve este problema sin documentos separados. Level 0 (TL;DR) es el "ejecutivo doc". Level 1-2 (secciones con evidencia) es el "técnico doc". Level 3 + Apéndice es el "implementador doc". Un documento, tres lecturas. La clave: cada nivel debe ser autocontenido — no "lea la sección X para entender esto."

---

## 4. Evolución de la Disciplina (2024-2026)

### 4.1 Caso de Éxito: Stripe — Documentation as Product

- **Contexto:** Stripe trata su documentación como un producto con su propio equipo de producto, métricas de éxito (time-to-first-successful-API-call), y pipelines de quality assurance. El resultado: documentación que es referencia de la industria.
- **Relevancia:** Demuestra que la documentación enterprise de calidad requiere inversión, proceso, y métricas — no solo "alguien que escribe bien". El skill de technical-writing aplica esta filosofía al discovery.

### 4.2 Caso de Éxito: Gov.uk — Content Design at Scale

- **Contexto:** El gobierno británico rediseñó toda su documentación pública usando content design: plain language, progressive disclosure, user needs. Redujo el contenido de 75,000 a 3,000 páginas manteniendo cobertura completa.
- **Relevancia:** Demuestra que la densidad informativa (más información en menos texto) es alcanzable a escala. El principio "each sentence earns its place" aplicado a miles de documentos.

### 4.3 Tendencia Emergente: Documentation Observability

- **Qué es:** Aplicar principios de observabilidad de software a documentación: métricas de uso (qué secciones se leen), métricas de calidad (errores reportados, preguntas generadas), y métricas de freshness (cuándo se actualizó por última vez).
- **Impacto:** Permite medir si la documentación cumple su propósito. Si nadie lee el apéndice, quizás el contenido debería estar en la sección principal. Si la sección 3 genera muchas preguntas, necesita reescritura.

---

## 5. Evolución Esperada (2026-2028)

| Tendencia | Probabilidad | Impacto en Technical Writing |
|---|---|---|
| **AI-assisted evidence verification** | Alta | LLMs con acceso a codebase verifican claims automáticamente |
| **Automated terminology consistency** | Alta | Linters semánticos detectan sinónimos y inconsistencias automáticamente |
| **Adaptive documentation** | Media | Documentos que ajustan nivel de detalle al perfil del lector |
| **Real-time documentation** | Media | Documentación generada y actualizada desde código en tiempo real |
| **Multimedia documentation** | Media-Alta | Video, audio, y documentos interactivos como formatos primarios |
| **Documentation as API** | Media | Documentación consultable programáticamente, no solo legible |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
