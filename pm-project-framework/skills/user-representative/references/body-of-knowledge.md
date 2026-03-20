# Body of Knowledge — User Representative

> Fuentes academicas, industriales y practicas que fundamentan la representacion del usuario: usabilidad, carga cognitiva, accesibilidad, investigacion de usuarios, y riesgo de adopcion.

---

## 1. Usabilidad y Experiencia de Usuario

### Don't Make Me Think — Steve Krug (New Riders, 3rd Edition, 2014)
- **Relevancia:** Texto fundacional de usabilidad web que establece el principio de que la mejor interfaz es la que no requiere explicacion. El titulo mismo encapsula el principio rector del skill: "si el usuario necesita un manual para entender el deliverable, el deliverable fallo."
- **Conceptos clave:** Self-evident over self-explanatory, the trunk test (navigation clarity), mobile-first usability, krug's first law of usability ("don't make me think"), krug's second law ("it doesn't matter how many times I have to click, as long as each click is mindless"), usability testing with 3-5 users.
- **Uso en el skill:** D2 (Cognitive Load) aplica directamente el principio de Krug: cada concepto sin explicar, cada acronimo sin definir multiplica la carga cognitiva. Los micro-ajustes de simplificacion siguen sus recomendaciones de eliminar palabras innecesarias.
- **Fuente:** Krug, S. (2014). *Don't Make Me Think, Revisited*, 3rd Ed. New Riders.

### About Face — Alan Cooper, Robert Reimann, David Cronin, Christopher Noessel (Wiley, 4th Edition, 2014)
- **Relevancia:** Texto comprehensivo de interaction design que introduce Goal-Directed Design y el concepto de personas como herramienta de diseno. Define el framework para pensar en usuarios como personas con objetivos, no como abstracciones.
- **Conceptos clave:** Goal-Directed Design, personas, scenarios, cognitive framework for design, interaction design principles, behavior patterns, designing for different postures (sovereign, transient, daemonic).
- **Uso en el skill:** Las Reader Personas del skill (Executive, Technical Lead, Developer, Business Analyst) se fundamentan en la metodologia de personas de Cooper. Cada persona tiene un "time budget" y "tolerance for jargon" que determina como se evalua el deliverable.
- **Fuente:** Cooper, A., Reimann, R., Cronin, D., & Noessel, C. (2014). *About Face: The Essentials of Interaction Design*, 4th Ed. Wiley.

### The Design of Everyday Things — Don Norman (Basic Books, Revised Edition, 2013)
- **Relevancia:** Texto clasico que introduce los conceptos de affordances, signifiers, mapping, y feedback. Aplicado a documentos, los affordances son las pistas visuales que guian al lector (headers, bold, callouts).
- **Conceptos clave:** Affordances, signifiers, conceptual models, feedback, constraints, discoverability, mapping, human-centered design.
- **Uso en el skill:** D3 (Accessibility/Scannability) aplica los principios de signifiers y affordances a documentos: headers como signifiers de contenido, callout boxes como affordances de informacion clave, TOC como mapping de la estructura.
- **Fuente:** Norman, D. (2013). *The Design of Everyday Things*, Revised Ed. Basic Books.

---

## 2. Heuristicas de Usabilidad

### Nielsen Norman Group — 10 Heuristics for User Interface Design
- **Relevancia:** Las 10 heuristicas de usabilidad de Jakob Nielsen son el estandar de la industria para evaluacion heuristica. Aunque disenadas para interfaces, se aplican directamente a documentos y deliverables.
- **Heuristicas mas relevantes para el skill:**
  1. *Visibility of system status* → D3: el lector sabe donde esta en el documento (TOC, breadcrumbs, section numbers)
  2. *Match between system and real world* → D1: usar lenguaje del dominio del lector, no jerga tecnica interna
  3. *Recognition rather than recall* → D2: no forzar al lector a recordar terminos definidos 20 paginas atras
  4. *Aesthetic and minimalist design* → D2: cada seccion sin informacion relevante es ruido que aumenta carga cognitiva
  5. *Help and documentation* → D1: glosarios, notas al pie, acronimos expandidos
- **Uso en el skill:** D1 (Comprehension) y D2 (Cognitive Load) se evaluan aplicando estas heuristicas a la estructura y contenido del deliverable. La evaluacion heuristica es el metodo primario del skill.
- **Fuente:** Nielsen, J. (1994). "10 Usability Heuristics for User Interface Design". nngroup.com. Actualizado 2024.
- **Complemento:** Nielsen, J. & Budiu, R. (2022). *Mobile Usability*. New Riders.

### Nielsen Norman Group — How Users Read on the Web
- **Relevancia:** Investigacion seminal que demuestra que los usuarios no leen — escanean. El patron de lectura en F confirma que la informacion clave debe estar al inicio de parrafos y secciones.
- **Uso en el skill:** D3 (Scannability) se fundamenta en esta investigacion. Las recomendaciones de TL;DR por seccion, key findings highlighted, y informacion clave al inicio del parrafo derivan directamente de los patrones de escaneo documentados.
- **Fuente:** Nielsen, J. (1997-2024). "How Users Read on the Web". nngroup.com. Serie de estudios actualizada periodicamente.

---

## 3. Accesibilidad

### WCAG 2.1 AA — Web Content Accessibility Guidelines
- **Relevancia:** Estandar W3C para accesibilidad web. Nivel AA es el estandar de la industria y requisito legal en muchas jurisdicciones (ADA, European Accessibility Act). Aplicado a documentos, los principios POUR (Perceivable, Operable, Understandable, Robust) son universales.
- **Principios clave para documentos:**
  - *Perceivable:* Contraste de color suficiente (4.5:1 para texto normal), texto alternativo para imagenes, no depender solo de color para transmitir informacion
  - *Operable:* Navegacion por teclado en HTML, links descriptivos (no "click aqui")
  - *Understandable:* Lenguaje claro, comportamiento predecible, ayuda contextual
  - *Robust:* Estructura semantica (headings jerarquicos, listas, tablas con headers)
- **Uso en el skill:** D3 (Accessibility) evalua deliverables HTML contra WCAG 2.1 AA. Para deliverables markdown, se evalua estructura semantica, contraste en diagramas Mermaid, y lenguaje claro.
- **Fuente:** W3C (2018). *Web Content Accessibility Guidelines (WCAG) 2.1*. w3.org/WAI/WCAG21
- **Complemento:** W3C (2023). *WCAG 2.2*. Agrega criterios de focus appearance, dragging movements, y accessible authentication.

### Inclusive Design Principles — Microsoft
- **Relevancia:** Framework de diseno inclusivo que va mas alla de compliance para considerar diversidad funcional permanente, temporal y situacional. "Designing for one benefits many."
- **Uso en el skill:** D3 considera no solo accesibilidad tecnica (WCAG) sino inclusion: un ejecutivo leyendo en el telefono tiene discapacidad situacional (pantalla pequena, tiempo limitado, distracciones).
- **Fuente:** Microsoft (2024). *Inclusive Design Principles*. inclusive.microsoft.design

---

## 4. Jobs-to-Be-Done y Adopcion

### Competing Against Luck — Clayton Christensen (Harper Business, 2016)
- **Relevancia:** Introduce el framework Jobs-to-Be-Done (JTBD): los clientes no compran productos — contratan soluciones para un "job" que necesitan resolver. Aplicado a deliverables: el lector no lee un documento — busca resolver un problema (tomar una decision, implementar algo, aprobar un presupuesto).
- **Conceptos clave:** Functional job (que necesita lograr), emotional job (como quiere sentirse), social job (como quiere ser percibido), hiring and firing products/solutions, progress-making forces.
- **Uso en el skill:** D4 (Adoption Risks) evalua si el deliverable ayuda al lector a completar su "job". Un ejecutivo contrata el deliverable para "tomar una decision informada en 5 minutos". Si no puede, el deliverable no fue contratado — fue despedido.
- **Fuente:** Christensen, C., Hall, T., Dillon, K., & Duncan, D. (2016). *Competing Against Luck*. Harper Business.

### Diffusion of Innovations — Everett Rogers (Free Press, 5th Edition, 2003)
- **Relevancia:** Teoria clasica de adopcion de innovaciones. Define las categorias de adoptantes (innovators, early adopters, early majority, late majority, laggards) y los factores que aceleran o frenan la adopcion.
- **Factores de adopcion relevantes:** Relative advantage (es mejor que lo actual?), compatibility (encaja con practicas existentes?), complexity (es facil de entender?), trialability (se puede probar sin riesgo?), observability (se pueden ver resultados).
- **Uso en el skill:** D4 (Adoption Risks) evalua barreras de adopcion usando los factores de Rogers. Si el deliverable recomienda un cambio que es complejo, incompatible con practicas existentes, y no se puede probar incrementalmente, el riesgo de adopcion es alto.
- **Fuente:** Rogers, E. (2003). *Diffusion of Innovations*, 5th Ed. Free Press.

---

## 5. Carga Cognitiva y Lenguaje Claro

### Cognitive Load Theory — John Sweller
- **Relevancia:** Teoria de carga cognitiva que fundamenta el principio de que la memoria de trabajo tiene capacidad limitada (~4 chunks). El diseno instruccional (y por extension, de documentos) debe minimizar extraneous cognitive load y gestionar intrinsic cognitive load.
- **Tipos de carga cognitiva:**
  - *Intrinsic:* Complejidad inherente del contenido (no se puede reducir, solo gestionar con scaffolding)
  - *Extraneous:* Complejidad agregada por mal diseno (se puede y debe eliminar)
  - *Germane:* Esfuerzo productivo de aprender y crear mental models (se debe facilitar)
- **Uso en el skill:** D2 (Cognitive Load) distingue entre complejidad necesaria (intrinsic — el tema es complejo) y complejidad evitable (extraneous — la presentacion es confusa). Los micro-ajustes del skill eliminan extraneous load: simplificar tablas, agregar resumen antes de detalle, definir acronimos.
- **Fuente:** Sweller, J., Ayres, P., & Kalyuga, S. (2011). *Cognitive Load Theory*. Springer.
- **Complemento:** Mayer, R. (2009). *Multimedia Learning*, 2nd Ed. Cambridge University Press.

### Plain Language Guidelines — Federal Plain Language Guidelines (USA)
- **Relevancia:** Guias gubernamentales para escritura en lenguaje claro. Establecen principios practicos: oraciones cortas, voz activa, verbos en lugar de nominalizaciones, listas en lugar de parrafos densos.
- **Uso en el skill:** D1 (Comprehension) evalua si el deliverable sigue principios de plain language. Los micro-ajustes de copy aplican estas guias: "Change 'leveraging microservices architecture' to 'using small independent services (microservices)'."
- **Fuente:** Plain Language Action and Information Network (2024). *Federal Plain Language Guidelines*. plainlanguage.gov
- **Complemento:** Cutts, M. (2020). *Oxford Guide to Plain English*, 5th Ed. Oxford University Press.

---

## 6. User Research y Journey Mapping

### Just Enough Research — Erika Hall (A Book Apart, 2nd Edition, 2019)
- **Relevancia:** Guia practica de investigacion de usuarios enfocada en obtener insights accionables con esfuerzo proporcional. Argumenta que la investigacion no necesita ser exhaustiva para ser valiosa — necesita ser suficiente.
- **Uso en el skill:** El skill aplica "just enough" user research al deliverable: no reescribe todo, propone micro-ajustes accionables (Top 5). La evaluacion es proporcional al impacto esperado.
- **Fuente:** Hall, E. (2019). *Just Enough Research*, 2nd Ed. A Book Apart.

### Mapping Experiences — Jim Kalbach (O'Reilly, 2nd Edition, 2021)
- **Relevancia:** Guia comprehensiva de journey mapping, service blueprints, y experience maps. Define como visualizar la experiencia del usuario a traves de touchpoints.
- **Uso en el skill:** D4 (Adoption Risks) simula el "journey" del lector a traves del deliverable: donde entra, que busca primero, donde abandona, donde actua. Esta simulacion de lectura identifica puntos de friccion.
- **Fuente:** Kalbach, J. (2021). *Mapping Experiences*, 2nd Ed. O'Reilly.

### Measuring the User Experience — Tom Tullis & Bill Albert (Morgan Kaufmann, 3rd Edition, 2022)
- **Relevancia:** Referencia para metricas de UX: SUS (System Usability Scale), NPS, task completion rate, time on task, error rate. Fundamenta la medicion cuantitativa de la experiencia.
- **Uso en el skill:** Las metricas de satisfaction (NPS, SUS) informan D4 cuando se tiene feedback de stakeholders sobre deliverables anteriores. El scorecard 0-10 del skill es un modelo simplificado de measurement framework.
- **Fuente:** Tullis, T. & Albert, B. (2022). *Measuring the User Experience*, 3rd Ed. Morgan Kaufmann.

---

## 7. Sesgos Cognitivos

### Thinking, Fast and Slow — Daniel Kahneman (Farrar, Straus and Giroux, 2011)
- **Relevancia:** Texto fundacional sobre sesgos cognitivos y los dos sistemas de pensamiento (System 1: rapido, intuitivo; System 2: lento, analitico). Fundamenta D5 (Bias Detection): los deliverables pueden activar sesgos tanto en el autor como en el lector.
- **Sesgos relevantes:**
  - *Optimism bias:* Subestimar riesgos en recomendaciones
  - *Anchoring:* El primer numero presentado sesga toda la evaluacion
  - *Availability heuristic:* Sobreponderar riesgos recientes o vividos
  - *Framing effect:* Como se presenta la informacion cambia la decision
- **Uso en el skill:** D5 (Detected Biases) identifica sesgos en el deliverable: technical bias (asumir que el lector sabe X), organizational bias (asumir autoridad Y), optimism bias (subestimar riesgos).
- **Fuente:** Kahneman, D. (2011). *Thinking, Fast and Slow*. Farrar, Straus and Giroux.

---

## 8. Bibliografia Practica

| Categoria | Libro/Recurso | Autor | Relevancia |
|---|---|---|---|
| Fundacional | *Don't Make Me Think* | Krug (2014) | Principio rector de usabilidad |
| Fundacional | *About Face* | Cooper et al. (2014) | Personas y Goal-Directed Design |
| Fundacional | *The Design of Everyday Things* | Norman (2013) | Affordances, signifiers, feedback |
| Heuristicas | *10 Usability Heuristics* | Nielsen (1994/2024) | Evaluacion heuristica estandar |
| Accesibilidad | *WCAG 2.1 AA* | W3C (2018) | Estandar de accesibilidad |
| Adopcion | *Competing Against Luck* | Christensen (2016) | Jobs-to-Be-Done framework |
| Adopcion | *Diffusion of Innovations* | Rogers (2003) | Teoria de adopcion |
| Cognicion | *Cognitive Load Theory* | Sweller et al. (2011) | Carga cognitiva y diseno instruccional |
| Lenguaje | *Federal Plain Language Guidelines* | plainlanguage.gov (2024) | Escritura en lenguaje claro |
| Research | *Just Enough Research* | Hall (2019) | User research proporcional |
| Journeys | *Mapping Experiences* | Kalbach (2021) | Journey mapping y touchpoints |
| Sesgos | *Thinking, Fast and Slow* | Kahneman (2011) | Sesgos cognitivos |

---

## 9. Glosario de Terminos

| Termino | Definicion |
|---|---|
| **Carga cognitiva** | Esfuerzo mental requerido para procesar informacion. Excederla causa abandono o mala comprension |
| **Heuristica de usabilidad** | Principio general de usabilidad usado para evaluar interfaces o documentos sin test formal |
| **Evaluacion heuristica** | Metodo de inspeccion donde un evaluador examina un producto contra heuristicas reconocidas |
| **Persona** | Representacion ficticia pero basada en datos de un usuario tipo, con objetivos, comportamientos y limitaciones |
| **Journey map** | Visualizacion de la experiencia del usuario a traves de pasos, touchpoints, emociones y pain points |
| **Pain point** | Momento de friccion o frustracion en la experiencia del usuario que reduce satisfaccion o bloquea progreso |
| **WCAG** | Web Content Accessibility Guidelines — estandar W3C para accesibilidad de contenido web |
| **POUR** | Perceivable, Operable, Understandable, Robust — los 4 principios de accesibilidad WCAG |
| **Jobs-to-Be-Done (JTBD)** | Framework que define productos/servicios por el "trabajo" que el usuario necesita completar |
| **SUS (System Usability Scale)** | Cuestionario de 10 items que mide usabilidad percibida en escala 0-100 |
| **NPS (Net Promoter Score)** | Metrica de lealtad basada en la pregunta "recomendaria esto?" (-100 a +100) |
| **Micro-ajuste** | Cambio especifico y accionable en copy, estructura, visual o navegacion de un deliverable |
| **Escaneabilidad** | Capacidad de un documento de transmitir el 80% de su valor en el 20% del tiempo de lectura |
| **Plain language** | Estilo de escritura que prioriza claridad: oraciones cortas, voz activa, sin jerga innecesaria |
| **Sesgo cognitivo** | Error sistematico de pensamiento que afecta juicio y decision (anchoring, framing, optimism bias) |
| **Adoption risk** | Probabilidad de que los stakeholders no actuen sobre las recomendaciones de un deliverable |
| **CTA (Call to Action)** | Indicacion clara de que accion se espera del lector despues de revisar el deliverable |
| **TL;DR** | "Too Long; Didn't Read" — resumen ejecutivo al inicio que captura la esencia del contenido |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
