# Body of Knowledge — Workshop Design

Fuentes fundacionales, estandares de referencia y glosario para el skill de Workshop Design: Collaborative Discovery & Design Techniques.

---

## Fuentes Primarias

### 1. Sam Kaner — Facilitator's Guide to Participatory Decision-Making (2014, 3rd ed.)

- **Relevancia:** Referencia definitiva para facilitacion de grupos. Define el modelo de "diamante de participacion" (diverge > groan zone > converge) que fundamenta el ritmo Diverge-Converge del skill.
- **Aporte clave:** El "groan zone" — el momento incomodo donde el grupo tiene demasiadas ideas y ninguna decision. Los facilitadores inexpertos escapan prematuramente de esta zona; los expertos la sostienen porque es donde emerge la innovacion genuina.
- **Referencia:** Kaner, S. et al. (2014). *Facilitator's Guide to Participatory Decision-Making*. Jossey-Bass.

### 2. Dave Gray, Sunni Brown, James Macanufo — Gamestorming (2010)

- **Relevancia:** Catalogo de >80 juegos y actividades de facilitacion organizados por fase (opening, exploring, closing). Base para la seleccion de energizers y actividades de divergencia/convergencia del skill.
- **Aporte clave:** Framework Opening-Exploring-Closing para disenar sesiones. Cada juego tiene proposito, duracion, materiales, y reglas claras. El concepto de "fuzzy goals" — objetivos que se clarifican durante la exploracion, no antes.
- **Referencia:** Gray, D., Brown, S., Macanufo, J. (2010). *Gamestorming: A Playbook for Innovators, Rulebreakers, and Changemakers*. O'Reilly Media.

### 3. Alberto Brandolini — Introducing EventStorming (2021)

- **Relevancia:** Metodo de modelado de dominio mediante eventos. Fundamenta la seccion S2 del skill. Permite descubrir bounded contexts, aggregates, y politicas de dominio en sesiones colaborativas.
- **Aporte clave:** El principio de "unlimited modeling space" — usar paredes completas, no pizarras limitadas. El proceso de discovery avanza por capas: eventos > comandos > aggregates > bounded contexts > hotspots. Los hotspots (stickies rosas) marcan conflictos y desconocimientos — son el output mas valioso.
- **Referencia:** Brandolini, A. (2021). *Introducing EventStorming*. Leanpub.

### 4. Jake Knapp — Sprint: How to Solve Big Problems and Test New Ideas in Just Five Days (2016)

- **Relevancia:** Metodologia de design sprint de 5 dias creada en Google Ventures. Fundamenta la seccion S5 del skill. Proceso comprimido para prototipar y validar con usuarios reales.
- **Aporte clave:** Estructura rigid de 5 dias (Understand > Sketch > Decide > Prototype > Test). El "Decider" — un stakeholder con autoridad para desempatar. Crazy 8s como tecnica de ideacion rapida. Prototipo de fachada realista (no MVP funcional).
- **Referencia:** Knapp, J., Zeratsky, J., Kowitz, B. (2016). *Sprint: How to Solve Big Problems and Test New Ideas in Just Five Days*. Simon & Schuster.

### 5. Sharon Bowman — Training from the Back of the Room (2009)

- **Relevancia:** Metodologia de diseno de sesiones de aprendizaje centrado en el participante. Informa la gestion de energia, los energizers, y el principio de que los participantes deben HACER, no solo escuchar.
- **Aporte clave:** Cuatro pasos: Connections (activar conocimiento previo), Concepts (contenido nuevo en chunks), Concrete Practice (aplicar), Conclusions (reflexion y compromiso). La regla 10-20: cada 10-20 minutos, cambiar la actividad para mantener atencion.
- **Referencia:** Bowman, S.L. (2009). *Training from the Back of the Room!*. Pfeiffer.

### 6. Jeff Patton — User Story Mapping (2014)

- **Relevancia:** Metodologia para organizar historias de usuario en un mapa bidimensional. Fundamenta la seccion S4 del skill. El backbone (horizontal) muestra el viaje del usuario; la profundidad (vertical) muestra prioridad.
- **Aporte clave:** El concepto de "walking skeleton" — el corte horizontal mas delgado que entrega valor end-to-end. Slicing vertical vs. horizontal. Release planning como lineas horizontales que cruzan el mapa.
- **Referencia:** Patton, J. (2014). *User Story Mapping*. O'Reilly Media.

### 7. Gojko Adzic — Impact Mapping (2012)

- **Relevancia:** Metodologia para conectar objetivos de negocio con entregables a traves de actores e impactos. Fundamenta la seccion S3 del skill. Herramienta para negociar scope sin perder alineamiento con el objetivo.
- **Aporte clave:** Estructura de arbol: Goal (WHY) > Actors (WHO) > Impacts (HOW) > Deliverables (WHAT). El mapa sirve para cortar scope: si un deliverable no conecta con un impacto que afecta un actor que contribuye al goal, se elimina.
- **Referencia:** Adzic, G. (2012). *Impact Mapping*. Provoking Thoughts.

### 8. Simon Wardley — Wardley Maps (2018+)

- **Relevancia:** Metodologia de mapeo estrategico que posiciona componentes en ejes de visibilidad y evolucion. Complementa impact mapping para talleres de estrategia tecnologica.
- **Aporte clave:** El eje de evolucion (genesis > custom > product > commodity) permite decisiones de build vs. buy. Los mapas revelan dependencias ocultas y oportunidades de comoditizacion.
- **Referencia:** Wardley, S. *Wardley Maps*. https://learnwardleymapping.com/

---

## Fuentes Complementarias

| Fuente | Aporte | URL |
|--------|--------|-----|
| Liberating Structures | 33 micro-estructuras de facilitacion (1-2-4-All, Troika, TRIZ, 15% Solutions) | https://www.liberatingstructures.com/ |
| Keith McCandless & Henri Lipmanowicz | Autores de Liberating Structures, facilitacion distribuida | https://www.liberatingstructures.com/authors/ |
| Miro Templates | Biblioteca de templates para talleres remotos (event storming, sprint, retro) | https://miro.com/templates/ |
| FigJam Workshops | Templates de facilitacion integrados en Figma | https://www.figma.com/figjam/ |
| Retromat | Generador de actividades para retrospectivas con 150+ actividades | https://retromat.org/ |
| Fun Retrospectives | Catalogo de formatos de retrospectiva con instrucciones detalladas | https://www.funretrospectives.com/ |
| Domain-Driven Design Reference (Eric Evans) | Glosario DDD: bounded context, aggregate, domain event — base para event storming | https://www.domainlanguage.com/ddd/reference/ |

---

## Glosario

| Termino | Definicion |
|---------|-----------|
| **Event Storming** | Tecnica de modelado de dominio donde participantes descubren eventos de negocio (pasado), comandos (disparadores), y aggregates (entidades) usando stickies de colores en una pared. Creada por Alberto Brandolini. |
| **Impact Mapping** | Tecnica estrategica que conecta un objetivo de negocio (Goal) con actores (Actors), impactos deseados en su comportamiento (Impacts), y entregables que producen esos impactos (Deliverables). Creada por Gojko Adzic. |
| **User Story Mapping** | Tecnica de planificacion que organiza historias de usuario en un mapa 2D: horizontal = viaje del usuario (backbone), vertical = prioridad. Las lineas horizontales definen releases. Creada por Jeff Patton. |
| **Design Sprint** | Proceso de 5 dias para resolver problemas de diseno mediante prototipado y testing con usuarios. Etapas: Understand, Sketch, Decide, Prototype, Test. Creado por Jake Knapp en Google Ventures. |
| **Wardley Map** | Mapa estrategico que posiciona componentes de una cadena de valor en dos ejes: visibilidad al usuario (vertical) y fase de evolucion (horizontal: genesis > custom > product > commodity). |
| **Diverge-Converge** | Ritmo fundamental de facilitacion: primero generar muchas ideas (divergencia), luego agrupar y priorizar (convergencia). Patron: Generate > Cluster > Vote > Decide. Nunca saltar clustering. |
| **Silent-before-Spoken** | Regla de facilitacion: iniciar ideacion con 5-10 minutos de escritura individual silenciosa antes de discusion grupal. Produce ideas mas diversas y reduce el dominio de voces fuertes. |
| **Hotspot** | En event storming: sticky rosa que marca un conflicto, pregunta abierta, o area de desconocimiento. Los hotspots son el output mas valioso — revelan donde el equipo necesita mas exploracion. |
| **Walking Skeleton** | En story mapping: el corte horizontal mas delgado del mapa que entrega funcionalidad end-to-end. No es un MVP completo — es el esqueleto minimo que demuestra que la arquitectura funciona. |
| **Bounded Context** | En DDD y event storming: limite linguistico y de modelo donde un termino de dominio tiene un significado especifico y consistente. Cada bounded context es un candidato a microservicio o modulo autonomo. |
| **Facilitation Guide** | Documento interno del facilitador con script detallado: timing, instrucciones textuales, transiciones, preguntas clave, y contingencias. Diferente de la agenda publica que reciben los participantes. |
| **Energizer** | Actividad corta (2-5 min) disenada para resetear la atencion del grupo. Se usa al inicio de sesion y despues de cada break. Ejemplos: preguntas creativas rapidas, mini-juegos, movimiento fisico. |
| **Breakout Group** | Division del grupo grande (>8 personas) en sub-grupos de 4-6 para trabajo paralelo. Requiere: instrucciones claras, template, time-box, y sub-facilitador asignado. |
| **Retrospectiva** | Sesion de reflexion al final de un periodo de trabajo para identificar que funciono, que no, y que mejorar. Formatos comunes: Sailboat, 4Ls, Start/Stop/Continue. |
| **Agenda Design** | Proceso de disenar la secuencia de actividades de un taller con time-boxes, objetivos por bloque, transiciones, y breaks estrategicos. Una buena agenda es el 80% del exito de un taller. |
| **Groan Zone** | Concepto de Sam Kaner: momento incomodo en un proceso grupal donde hay demasiadas ideas y ninguna decision clara. Es una fase necesaria — saltar la groan zone produce consenso superficial. |
| **Dot Voting** | Tecnica de priorizacion rapida: cada participante recibe N puntos adhesivos y los distribuye entre las opciones que considera mas importantes. Simple, visual, y democratica. |

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026 | (c) Comunidad MetodologIA
