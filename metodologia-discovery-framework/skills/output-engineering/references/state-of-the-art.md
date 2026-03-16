# State of the Art — Output Engineering

Tendencias, avances y dirección del ecosistema de producción multi-formato y document engineering relevantes para el skill, período 2024–2026.

---

## 1. Docs-as-Code y Markdown como Fuente de Verdad Empresarial

**Estado:** El paradigma docs-as-code se consolidó más allá del mundo developer. Empresas de consultoría, firmas legales y equipos de producto adoptan markdown como master format con pipelines automatizados de conversión. GitHub, GitLab y Azure DevOps soportan rendering nativo de Mermaid en markdown desde 2023.

**Impacto en el skill:**
- El modelo "markdown → formatos derivados" del skill está alineado con la tendencia dominante.
- Oportunidad: integrar versionamiento semántico de deliverables (git-based) con auto-regeneración de formatos derivados en cada commit.
- Herramientas como Quarto (2022–presente) unifican markdown + código + output multi-formato en un solo pipeline.

**Señales:**
- Quarto (Posit) alcanzó adopción masiva en academia y data science para documentos reproducibles multi-formato.
- MDX (Markdown + JSX) permite componentes interactivos dentro de markdown — potencial para deliverables interactivos.
- Obsidian, Notion y Confluence adoptaron markdown nativo o compatible como formato base.

---

## 2. AI-Driven Document Generation y Format Conversion

**Estado:** LLMs generan documentos completos desde instrucciones naturales. La frontera se movió de "generar texto" a "generar documentos production-ready con formato, brand compliance y estructura semántica correcta."

**Impacto en el skill:**
- El skill opera en esta frontera exacta: no solo genera contenido sino que garantiza producción multi-formato con calidad profesional.
- Riesgo: LLMs sin constraints generan HTML con inline styles inconsistentes, colores arbitrarios, y accesibilidad deficiente. El skill mitiga con reglas explícitas de brand compliance y WCAG.
- Oportunidad: validación automática post-generación con feedback loop — el LLM genera, el skill valida, itera hasta compliance.

**Señales:**
- Claude, GPT-4 y Gemini generan HTML, LaTeX y Mermaid inline con calidad creciente.
- Herramientas como Gamma.app y Beautiful.ai generan PPTX desde prompts — pero sin control de brand compliance enterprise.
- Enterprise DocOps (Doxel, Templafy) integran AI con templates corporativos para brand-safe document generation.

---

## 3. Design Tokens y Brand-as-Code

**Estado:** Los design systems evolucionaron hacia "brand-as-code": la identidad visual se define en tokens programáticos (JSON/YAML) que alimentan múltiples plataformas. El W3C Design Tokens Community Group avanzó hacia Candidate Recommendation en 2025.

**Impacto en el skill:**
- El skill ya implementa brand compliance vía tokens CSS — alineado con la dirección del estándar.
- Oportunidad: definir `brand-config.json` en formato DTCG para interoperabilidad con Figma, Style Dictionary, y generadores DOCX/PPTX.
- La validación de brand compliance podría automatizarse completamente: parsear output → verificar tokens → reportar desviaciones.

**Señales:**
- Style Dictionary 4.x genera tokens multi-plataforma (CSS, iOS, Android, DOCX template vars) desde un source of truth.
- Tokens Studio superó 500K usuarios con sync nativo a repositorios de código.
- Enterprise branding tools (Frontify, Bynder) exponen APIs de brand assets para integración programática.

---

## 4. PDF Generation de Alta Fidelidad (HTML → PDF)

**Estado:** La generación de PDF desde HTML superó a LaTeX como pipeline preferido para documentos empresariales. Playwright, Puppeteer y herramientas headless producen PDFs pixel-perfect desde HTML con CSS print styles.

**Impacto en el skill:**
- El skill define PDF como "generado desde HTML (highest fidelity)" — alineado con la tendencia.
- Oportunidad: CSS `@page` rules avanzados (named pages, running headers, prince-style footnotes) para PDFs con calidad de imprenta.
- Weasyprint (Python) y Paged.js emergen como alternativas open-source a Prince XML para CSS-to-PDF de alta calidad.

**Señales:**
- Playwright `page.pdf()` soporta custom headers/footers, page ranges, y background graphics desde 2024.
- CSS Paged Media Module Level 3 avanza con soporte para `@page`, `@footnote`, y `@margin` boxes.
- Docraptor y Prince XML siguen como referencia enterprise para CSS-to-PDF production-grade.

---

## 5. Presentaciones Programáticas (PPTX/Slides from Code)

**Estado:** La generación programática de presentaciones maduró significativamente. python-pptx, Slidev (Vue), y Marp (Markdown → slides) permiten crear decks desde código o markdown con control total de layout.

**Impacto en el skill:**
- El pipeline .md → PPTX del skill puede beneficiarse de Marp como paso intermedio: markdown → Marp slides → export PPTX.
- La regla "one key message per slide" del skill se alinea con la tendencia de narrative-first presentations (vs. bullet-point dumps).
- Oportunidad: templates PPTX paramétricos con MetodologIA brand master, inyectables programáticamente.

**Señales:**
- Marp (Markdown Presentation Ecosystem) alcanzó >5K GitHub stars y soporta temas custom + export multi-formato.
- Slidev (Vue-powered) permite componentes interactivos en presentaciones — potencial para deliverables internos.
- AI presentation tools (Gamma, Tome, Beautiful.ai) priorizan narrativa sobre bullet points — validación del enfoque del skill.

---

## 6. Mermaid.js Ecosystem y Diagram-as-Code

**Estado:** Mermaid.js se consolidó como el estándar de facto para diagramas embebidos en documentos. GitHub, GitLab, Notion, Confluence y VS Code renderizan Mermaid nativamente. La versión 10.x introdujo mejoras significativas en temas, accesibilidad y tipos de diagrama.

**Impacto en el skill:**
- El skill debe garantizar que diagramas Mermaid sobrevivan la conversión a cada formato: rendering nativo en HTML, descripción textual o imagen pre-renderizada en DOCX/PPTX.
- Mermaid 10.x soporta `%%{init: {'theme': 'base', 'themeVariables': {...}}}%%` para brand-aligned diagrams.
- Oportunidad: pre-rendering de Mermaid a SVG para formatos estáticos, preservando escalabilidad y accesibilidad.

**Señales:**
- mermaid-cli (`mmdc`) genera SVG/PNG/PDF desde la línea de comandos — integrable en pipelines CI/CD.
- D2 y PlantUML como alternativas, pero Mermaid domina en ecosistema markdown.
- Kroki.io como servicio unificado de rendering para múltiples lenguajes de diagramas.

---

## 7. Content Integrity y Document Validation Automatizada

**Estado:** La validación automatizada de documentos evolucionó de spell-check a validación semántica: estructura, completitud, consistencia de datos, y compliance regulatorio. Herramientas de contract analysis y document QA usan NLP para verificar integridad.

**Impacto en el skill:**
- La validación de content integrity del skill (secciones, tablas, números, diagramas) se alinea con la tendencia de document QA automatizado.
- Oportunidad: implementar diff semántico entre markdown source y formato derivado — no solo contar secciones, sino verificar que el contenido semántico es idéntico.
- LLM-as-judge para validar que la conversión no introdujo distorsiones, omisiones o alteraciones.

**Señales:**
- Vale.sh (prose linter) soporta reglas custom para estilo, terminología y estructura de documentos.
- Document AI (Google) y Azure Form Recognizer extraen y validan datos estructurados de documentos.
- Redocly y Spectral validan OpenAPI specs — patrón aplicable a validación de deliverables.

---

## 8. Accesibilidad como Requisito Legal (European Accessibility Act 2025)

**Estado:** La European Accessibility Act (EAA) entró en vigor en junio 2025, haciendo accesibilidad digital un requisito legal en la UE. WCAG 2.2 se adoptó como referencia. Estados Unidos refuerza ADA compliance con precedentes judiciales crecientes.

**Impacto en el skill:**
- Accesibilidad en outputs HTML y PDF no es opcional — es un requisito legal para clientes con operaciones en EU.
- El skill ya implementa WCAG 2.1 AA. Oportunidad: migrar a WCAG 2.2 (focus appearance, dragging alternatives, target size).
- WCAG 3.0 (Silver) en desarrollo: modelo de scoring continuo vs. pass/fail binario.

**Señales:**
- axe-core 4.x + Playwright = testing de accesibilidad automatizado end-to-end.
- APCA (Advanced Perceptual Contrast Algorithm) como alternativa al ratio de contraste clásico.
- Deque, Level Access y AudioEye dominan el mercado de accesibilidad automatizada enterprise.

---

## Síntesis: Dirección del Skill

| Tendencia | Alineación Actual | Oportunidad de Evolución |
|-----------|-------------------|--------------------------|
| Docs-as-Code | Alta — markdown como source of truth | Versionamiento semántico + auto-rebuild |
| AI Document Gen | Alta — LLM + brand constraints | Validation feedback loop automatizado |
| Brand-as-Code | Media — tokens CSS inline | Migrar a DTCG format + multi-platform |
| HTML → PDF | Alta — pipeline definido | CSS Paged Media avanzado |
| PPTX from Code | Media — reglas definidas | Marp como paso intermedio |
| Mermaid Ecosystem | Alta — CDN v10 en HTML | Pre-rendering SVG para formatos estáticos |
| Content Validation | Media — checklist manual | Diff semántico + LLM-as-judge |
| Accessibility Legal | Alta — WCAG 2.1 AA | Migrar a WCAG 2.2 + APCA |
