# Body of Knowledge — UX Writing

Fuentes fundacionales, estandares de referencia y glosario para el skill de UX Writing: Information Design & Cognitive Accessibility Standards.

---

## Fuentes Primarias

### 1. Torrey Podmajersky — Strategic Writing for UX (2019)

- **Relevancia:** Marco estrategico para alinear microcopy con objetivos de negocio. Define el concepto de "voice chart" y sistematiza la escritura UX como disciplina de diseno, no de redaccion.
- **Aporte clave:** Voice chart framework (producto, principios, vocabulario, verbosidad, gramatica, puntuacion). Patron de microcopy por tipo de interaccion (titulos, botones, descripciones, estados vacios, errores).
- **Referencia:** Podmajersky, T. (2019). *Strategic Writing for UX*. O'Reilly Media.

### 2. Kinneret Yifrah — Microcopy: The Complete Guide (2017)

- **Relevancia:** Guia exhaustiva de microcopy con patrones validados por testing A/B. Cubre cada punto de contacto textual en interfaces digitales.
- **Aporte clave:** Patrones para formularios, CTAs, mensajes de error, estados vacios, onboarding, confirmaciones, notificaciones. Enfasis en que el microcopy reduce friccion medible.
- **Referencia:** Yifrah, K. (2017). *Microcopy: The Complete Guide*. Nemala.

### 3. Sarah Richards — Content Design (2017)

- **Relevancia:** Fundamento del movimiento Content Design originado en GOV.UK. Posiciona el contenido como un producto disenado, no como texto que se agrega al final.
- **Aporte clave:** Metodologia de pairs writing (disenador + content designer), tecnicas de user research aplicadas a contenido, y el principio de "start with user needs, not government needs" aplicado a cualquier organizacion.
- **Referencia:** Richards, S. (2017). *Content Design*. Content Design London.

### 4. Google Material Design — Writing Guidelines

- **Relevancia:** Estandar de la industria para microcopy en interfaces. Define principios de escritura clara, concisa y util aplicados a componentes especificos.
- **Aporte clave:** Principios: ser conciso, escribir en presente, empezar con el objetivo, usar terminologia consistente. Patrones por componente (snackbars, dialogs, tooltips, buttons, empty states).
- **Referencia:** Google. *Material Design — Writing*. https://m3.material.io/foundations/content-design/overview

### 5. Apple Human Interface Guidelines — Content

- **Relevancia:** Directrices de escritura para el ecosistema Apple. Complementa Material Design con enfasis en tono humano, inclusividad, y accesibilidad linguistica.
- **Aporte clave:** Principios de voz: directo, informal, y amigable sin ser condescendiente. Patrones para alertas, onboarding, y permisos del sistema. Guia de terminologia inclusiva.
- **Referencia:** Apple. *Human Interface Guidelines — Content*. https://developer.apple.com/design/human-interface-guidelines/writing

### 6. Nielsen Norman Group — Writing for the Web (Jakob Nielsen, 1997–presente)

- **Relevancia:** Investigacion pionera sobre como los usuarios leen (escanean) en pantalla. Base empirica para el Standard 3 (Scannability) del skill.
- **Aporte clave:** El 79% de los usuarios escanea, no lee. Principios: texto escaneable, una idea por parrafo, mitad del largo que texto impreso, titulos informativos.
- **Referencia:** Nielsen, J. *How Users Read on the Web*. https://www.nngroup.com/articles/how-users-read-on-the-web/

### 7. Flesch-Kincaid Readability Tests

- **Relevancia:** Metricas estandar de legibilidad usadas en el Standard 5 (Readability Heuristics). Miden complejidad por longitud de oraciones y silabas por palabra.
- **Aporte clave:** Grade Level formula permite definir targets objetivos: ejecutivos (<=12), tecnicos (<=16). Complementado con Flesch Reading Ease Score.
- **Referencia:** Kincaid, J.P. et al. (1975). *Derivation of New Readability Formulas*. US Navy Research.

### 8. Plain Language Guidelines (plainlanguage.gov)

- **Relevancia:** Estandar del gobierno de EE.UU. para escritura clara. Informa los heuristicos de legibilidad y las reglas de voz pasiva del skill.
- **Aporte clave:** Principios: audiencia primero, organizacion logica, palabras simples, oraciones cortas, voz activa, tablas y listas. Directrices de testing con usuarios reales.
- **Referencia:** Federal Plain Language Guidelines. https://www.plainlanguage.gov/guidelines/

---

## Fuentes Complementarias

| Fuente | Aporte | URL |
|--------|--------|-----|
| GOV.UK Content Design Manual | Patrones de contenido gubernamental, pair writing, user needs-first | https://www.gov.uk/guidance/content-design |
| Hemingway Editor | Herramienta de scoring de legibilidad en tiempo real, deteccion de voz pasiva | https://hemingwayapp.com/ |
| Grammarly Business Style Guide | Templates de voice & tone para equipos, deteccion automatizada de inconsistencias | https://www.grammarly.com/business |
| Mailchimp Content Style Guide | Voice & tone guide referencia de la industria, adaptacion por contexto emocional | https://styleguide.mailchimp.com/ |
| Microsoft Writing Style Guide | Terminologia tecnica, bias-free communication, globalization guidelines | https://learn.microsoft.com/en-us/style-guide/ |
| Shopify Polaris Content Guidelines | Microcopy para productos SaaS B2B, error messages, action-driven writing | https://polaris.shopify.com/content |
| A List Apart — Writing is Designing | Articulos sobre content-first design y escritura como material de diseno | https://alistapart.com/ |

---

## Glosario

| Termino | Definicion |
|---------|-----------|
| **Microcopy** | Texto breve en interfaces que guia la accion del usuario: botones, labels, tooltips, mensajes de error, estados vacios. No es "texto pequeno" — es texto de alto impacto por su posicion en el flujo de decision. |
| **Voice & Tone** | Voice es la personalidad consistente de la marca en texto (siempre igual). Tone es la adaptacion emocional segun contexto (celebracion vs. error vs. instruccion). Misma voz, diferente tono. |
| **Content Hierarchy** | Organizacion del contenido por niveles de importancia: Key Takeaway > Detail > Evidence > Implication. El lector elige su profundidad de lectura. |
| **Progressive Disclosure** | Patron de diseno de informacion que revela contenido en capas: summary > detail > appendix. Reduce carga cognitiva al no forzar lectura secuencial completa. |
| **Cognitive Load** | Esfuerzo mental requerido para procesar informacion. Tres tipos: intrinseca (complejidad del tema), extrinseca (mala presentacion), relevante (aprendizaje util). El skill reduce la extrinseca. |
| **Scannability** | Capacidad de un documento para comunicar valor a traves de escaneo rapido (headings, bold, callouts, listas). Target: 80% del valor extraible del 20% del contenido. |
| **Flesch-Kincaid Grade Level** | Metrica de legibilidad que indica el nivel educativo requerido para comprender un texto. Formula basada en longitud de oraciones y complejidad de palabras. |
| **CTA (Call to Action)** | Texto que invita al usuario a realizar una accion especifica. Patron correcto: Verbo + Objeto ("Ver Arquitectura", "Descargar Reporte"). Anti-patron: "Click aqui", "Mas info". |
| **Empty State** | Estado de una interfaz cuando no hay datos que mostrar. Microcopy correcto: que falta + como solucionarlo. "No hay escenarios evaluados. Ejecuta la Fase 3 para generarlos." |
| **Error Message** | Texto que comunica un problema al usuario. Patron completo: que paso + por que + como solucionarlo. Nunca culpar al usuario. Nunca ser vago ("Error desconocido"). |
| **Readability Score** | Puntuacion numerica que indica la facilidad de lectura de un texto. Incluye Flesch-Kincaid Grade, Flesch Reading Ease, y metricas complementarias (longitud de oracion, voz pasiva, densidad de jargon). |
| **Jargon Density** | Cantidad de terminos de dominio sin explicacion por parrafo. Target del skill: maximo 2 terminos inexplicados por parrafo. Mas de 2 = barrera de comprension para el lector. |
| **Callout** | Bloque visual destacado en un documento (key insight, warning, decision required, success). Borde izquierdo 4px + fondo tintado. Herramienta primaria de scannability. |
| **Bilingual Support** | Estrategia de escritura Spanish-first con terminos tecnicos en ingles entre parentesis: "tasa de interes anual (APR)". Evita traduccion literal; adapta a expresiones idiomaticas del espanol. |
| **Information Architecture** | Organizacion estructural del contenido: que secciones existen, en que orden, con que peso relativo. No es diseno visual — es diseno de la estructura logica del documento. |
| **Naming Convention** | Regla de nomenclatura consistente para elementos de interfaz. En microcopy: Verbo + Objeto para CTAs, Sustantivo para labels, Oracion completa para mensajes. |

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026 | (c) Comunidad MetodologIA
