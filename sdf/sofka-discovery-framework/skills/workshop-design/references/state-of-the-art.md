# State of the Art — Workshop Design

Tendencias, avances y direccion del ecosistema de diseno y facilitacion de talleres relevantes para el skill, periodo 2024-2026.

---

## 1. Talleres Hibridos y Remotos como Norma

**Estado:** La facilitacion remota y hibrida dejo de ser contingencia pandemica para convertirse en el formato predominante. Herramientas como Miro, FigJam, Mural, y Excalidraw maduraron con features especificos para facilitacion: timers, votacion, templates, y breakout boards.

**Impacto en el skill:**
- El skill ya contempla el edge case "Remote-Only Team" con adaptaciones especificas (sesiones mas cortas, breakout rooms, dual-agenda).
- Oportunidad: elevar remote/hybrid de edge case a patron primario. La mayoria de los talleres de discovery MetodologIA son remotos — el diseno deberia ser remote-first, no remote-adapted.
- El anti-patron "death by screen-share" sigue siendo la falla mas comun. La solucion: los participantes HACEN cosas en el board, no miran al facilitador compartir pantalla.

**Senales:**
- Miro reporta >60M usuarios en 2025 con features de facilitacion AI (auto-clustering, sentiment analysis).
- FigJam integro templates de event storming y design sprint con flow automatizado.
- Butter.us y SessionLab especializan en planificacion de sesiones con timing automatico.

---

## 2. Facilitacion Asistida por IA

**Estado:** La IA se integra en el flujo de facilitacion en tres niveles: pre-taller (generacion de agenda y materiales), durante-taller (transcripcion, clustering automatico, sintesis en tiempo real), y post-taller (consolidacion de outputs, action items, follow-up).

**Impacto en el skill:**
- El skill ya es un generador AI de diseno de taller — esta posicionado en el nivel pre-taller.
- Oportunidad: extender al nivel post-taller con el modo operacional `sintesis` que ya existe, integrando transcripciones de video calls (Otter.ai, Fireflies, Teams transcripts) como input.
- Riesgo: sobre-dependencia de AI clustering puede producir agrupaciones semanticamente incorrectas. El clustering humano con revision AI es el patron mas robusto.

**Senales:**
- Miro AI: clustering automatico de stickies, generacion de resumenes de boards, sugerencias de next steps.
- Otter.ai y Fireflies generan action items automaticos de reuniones.
- Notion AI consolida notas de multiples sesiones en documentos estructurados.
- Los facilitadores usan LLMs para generar preguntas de apertura, energizers, y actividades adaptadas al contexto.

---

## 3. Talleres Asincronos y Semi-Sincronos

**Estado:** El formato "todos al mismo tiempo en la misma sala" se complementa con talleres asincronos (cada participante contribuye en su horario) y semi-sincronos (actividad asincrona + sesion sincrona de convergencia). Herramientas como Loom, Miro async, y Notion habilitan contribucion distribuida en el tiempo.

**Impacto en el skill:**
- El skill asume talleres sincronos (time-boxed, agenda lineal). Los talleres asincronos requieren un diseno diferente: instrucciones auto-contenidas, deadlines por fase, y mecanismos de convergencia explicitos.
- Oportunidad: agregar un formato "async" a la seleccion de tecnica (S1) con patrones especificos: async brainstorming > sync clustering > async voting > sync decision.
- Caso de uso: equipos distribuidos en multiples zonas horarias donde reunir a todos es costoso o imposible.

**Senales:**
- Miro async: comments, mentions, y reactions para colaboracion no-sincrona en boards.
- GitLab y Basecamp modelan decision-making async con RFCs escritos (request for comments).
- Design sprints "distributed" de 2 semanas (async + 2 sesiones sincronas) reemplazan sprints de 5 dias co-locados.

---

## 4. Evolucion de Miro y FigJam

**Estado:** Miro y FigJam dominan el espacio de collaboration boards con features cada vez mas especializados para facilitacion. Miro AI clustering, FigJam widgets, y ambas plataformas ofrecen templates de la comunidad para event storming, impact mapping, y design sprints.

**Impacto en el skill:**
- El skill genera disenos de taller (agendas, guias de facilitacion, templates). Estos outputs necesitan materializarse en boards de Miro/FigJam para ejecucion.
- Oportunidad: generar instrucciones de setup especificas para Miro/FigJam como parte del output (que frames crear, que stickies pre-cargar, que timer configurar).
- Los templates de la comunidad son punto de partida pero raramente son suficientes — el skill agrega diseno de facilitacion sobre el template visual.

**Senales:**
- Miro introdujo "Intelligent Canvas" con auto-layout y AI-powered diagramming en 2025.
- FigJam se integra nativamente con Figma para transicion taller-diseno sin friccion.
- Excalidraw crece como alternativa open-source para equipos con restricciones de licenciamiento.
- Tldraw (open-source) gana traccion en contextos de desarrollo con integracion en VS Code.

---

## 5. Liberating Structures y Facilitacion Distribuida

**Estado:** Liberating Structures (33 micro-estructuras de facilitacion) gana adopcion como alternativa a formatos clasicos (brainstorming, mesa redonda). Estructuras como 1-2-4-All, Troika Consulting, TRIZ, y 15% Solutions democratizan la participacion y reducen el dominio de voces fuertes.

**Impacto en el skill:**
- El skill usa Diverge-Converge y Silent-before-Spoken como principios de facilitacion. Liberating Structures ofrece 33 implementaciones concretas de estos principios.
- Oportunidad: integrar un catalogo de Liberating Structures recomendadas por tipo de objetivo de taller. Ejemplo: 1-2-4-All para ideacion, TRIZ para eliminar barreras, Troika para consulta de pares.
- La facilitacion distribuida (multiples sub-facilitadores con la misma estructura) escala talleres a 50-100 personas sin perder calidad.

**Senales:**
- Mas de 100,000 practicantes certificados de Liberating Structures globalmente.
- Combinaciones de Liberating Structures ("strings") se documentan como recetas para objetivos especificos.
- Integracion con Miro: templates de Liberating Structures pre-disenados.

---

## 6. Event Storming Evolucion: Process Modeling y Software Design

**Estado:** Event Storming evoluciono de una tecnica de exploracion de dominio a una familia de formatos: Big Picture (exploracion), Process Modeling (flujo detallado), y Software Design (cercano a implementacion). Cada formato tiene participantes, duracion, y outputs diferentes.

**Impacto en el skill:**
- La seccion S2 del skill cubre Event Storming como tecnica unica. La evolucion hacia multiples formatos requiere seleccion explicita segun objetivo.
- Oportunidad: diferenciar los tres formatos en S2 con guidance para seleccionar el apropiado. Big Picture para discovery inicial, Process Modeling para flujos criticos, Software Design para equipos de desarrollo.
- EventStorming.com evoluciona con patrones para remote event storming (Miro boards con zonas de color pre-definidas).

**Senales:**
- La comunidad DDD consolida Event Storming como practica estandar de discovery (no solo modelado).
- Herramientas como Event Catalog y Context Mapper integran outputs de event storming en documentacion viva.
- Event Storming + Example Mapping + BDD forman un pipeline de discovery-to-specification.

---

## Horizonte 2026+

| Tendencia Emergente | Madurez | Relevancia para el Skill |
|---------------------|---------|--------------------------|
| AI co-facilitator (LLM en tiempo real sugiriendo preguntas y actividades) | Emergente | Alta — transforma el rol del facilitador de director a curador |
| VR/AR collaborative workshops (Spatial, Horizon Workrooms) | Experimental | Baja — adopcion limitada fuera de tech companies |
| Workshop analytics (engagement scoring, participation heatmaps) | Crecimiento | Media — metricas de efectividad de facilitacion |
| Automated synthesis (transcripcion > insights > action items) | Produccion | Alta — el modo `sintesis` del skill se beneficia directamente |
| Continuous discovery (Teresa Torres) como framework de talleres recurrentes | Produccion | Alta — talleres no como eventos sino como habito semanal |
| Domain storytelling (Stefan Hofer) como alternativa visual a event storming | Crecimiento | Media — complementa la familia de tecnicas de discovery |

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026 | (c) Comunidad MetodologIA
