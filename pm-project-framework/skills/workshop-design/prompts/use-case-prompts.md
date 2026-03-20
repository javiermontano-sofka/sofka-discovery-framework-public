# Use Case Prompts — Workshop Design

Prompts listos para invocar el skill en escenarios concretos. Cada prompt incluye contexto, parametros y resultado esperado.

---

## 1. Event Storming Workshop

```
Disena un taller de Event Storming para el proyecto: {NOMBRE_PROYECTO}.

Contexto del dominio: {DESCRIPCION_DOMINIO}.
Participantes: {NUMERO} personas ({ROLES}).
Formato: {presencial | remoto | hibrido}.
Duracion disponible: {DURACION}.

Genera:
1. Agenda detallada con time-boxes por actividad
2. Guia de facilitacion interna (script del facilitador con transiciones, preguntas clave, contingencias)
3. Pre-work para participantes (contexto, lectura previa, expectativas)
4. Template de board (zonas para eventos, comandos, aggregates, hotspots, bounded contexts)
5. Materiales necesarios (stickies por color, marcadores, pared/board digital)
6. Plan de sintesis post-taller (quien consolida, cuando, en que formato)
7. Criterios de exito: que debe estar claro al terminar el taller

Si formato es remoto, incluir: configuracion de Miro/FigJam, reglas de participacion remota, breakout plan.

MODO=piloto-auto FORMATO=markdown VARIANTE=tecnica
```

---

## 2. Impact Mapping Session

```
Disena una sesion de Impact Mapping para el objetivo de negocio: {OBJETIVO_NEGOCIO}.

Contexto: {DESCRIPCION_CONTEXTO}.
Decision-maker presente: {SI/NO}.
Participantes: {NUMERO} personas ({ROLES}).
Formato: {presencial | remoto}.
Duracion: {DURACION}.

Genera:
1. Preparacion del objetivo central: formulacion SMART del goal
2. Agenda con time-boxes: goal validation > actor discovery > impact brainstorming > deliverable mapping > scope negotiation
3. Guia de facilitacion con preguntas por nivel del mapa:
   - Goal: "Como mediremos exito? Cual es el horizonte temporal?"
   - Actors: "Quien puede ayudar o impedir el logro? Quien cambia su comportamiento?"
   - Impacts: "Que cambio de comportamiento necesitamos ver en cada actor?"
   - Deliverables: "Que podemos construir o hacer para producir ese cambio?"
4. Tecnica de priorizacion para cortar scope (dot voting en deliverables)
5. Template del impact map (arbol de 4 niveles)
6. Plan de follow-up: como usar el mapa para negociar scope en sprints futuros

MODO=piloto-auto FORMATO=markdown VARIANTE=tecnica
```

---

## 3. Design Sprint Planning

```
Disena un Design Sprint de {5 dias | 3 dias | 1 dia} para el reto: {DESCRIPCION_RETO}.

Equipo: {NUMERO} personas ({ROLES}).
Decider designado: {NOMBRE_ROL}.
Formato: {presencial | remoto | hibrido}.
Herramientas de prototipado disponibles: {Figma | HTML | Slides | otra}.

Genera:
1. Agenda dia a dia con actividades, duracion, y responsables:
   - Dia 1: Map + Ask (o equivalente comprimido)
   - Dia 2: Sketch (Lightning Demos, Crazy 8s, Solution Sketch)
   - Dia 3: Decide (Art Museum, Heat Map, Speed Critique, Storyboard)
   - Dia 4: Prototype (asignacion de roles, plan de construccion)
   - Dia 5: Test (guia de entrevista, protocolo de observacion)
2. Guia de facilitacion con instrucciones textuales por actividad
3. Pre-work: brief del reto, sprint questions, how-might-we compilation
4. Materiales y templates por dia
5. Plan de reclutamiento de usuarios para dia 5 (perfil, screening, compensacion)
6. Output esperado: prototipo validado + patron de respuestas + decision de next steps

Si formato comprimido (3 o 1 dia), especificar que se comprime y que se sacrifica.

MODO=supervisado FORMATO=markdown VARIANTE=tecnica
```

---

## 4. Stakeholder Alignment Workshop

```
Disena un taller de alineamiento de stakeholders para el proyecto: {NOMBRE_PROYECTO}.

Contexto: {hay conflictos de prioridad | hay ambiguedad de scope | hay resistencia al cambio | multiples areas involucradas}.
Stakeholders: {NUMERO} personas, niveles: {ejecutivo | gerencial | operativo | mixto}.
Formato: {presencial | remoto}.
Duracion: {DURACION}.

Genera:
1. Diagnostico de desalineamiento: que señales indican que se necesita este taller
2. Agenda diseñada para surfacer conflictos constructivamente:
   - Individual: cada stakeholder escribe su vision (silent-before-spoken)
   - Small group: compartir y identificar coincidencias/divergencias
   - Full group: consolidar, votar, y decidir
3. Tecnicas de facilitacion para manejar dinamicas de poder:
   - Anonymous voting para prioridades
   - 1-2-4-All para ideacion igualitaria
   - Explicit parking lot para temas fuera de scope
4. Artefactos de salida:
   - Shared vision statement (1 parrafo, aprobado por todos)
   - Priority stack rank (lista priorizada con votos visibles)
   - Decision log (que se decidio, por quien, con que trade-offs)
   - Parking lot items con owner y fecha de follow-up
5. Plan de comunicacion post-taller (como escalar alineamiento a no-asistentes)

MODO=piloto-auto FORMATO=markdown VARIANTE=tecnica
```

---

## 5. Retrospective Design

```
Disena una retrospectiva para el equipo: {NOMBRE_EQUIPO}.

Contexto del sprint/periodo: {DESCRIPCION_CONTEXTO}.
Participantes: {NUMERO} personas.
Formato: {presencial | remoto}.
Duracion: {DURACION} (tipico: 60-90 min).
Formato de retro solicitado: {Sailboat | 4Ls | Start-Stop-Continue | personalizado | automatico}.

Si formato es "automatico", selecciona el formato mas apropiado segun el contexto.

Genera:
1. Agenda con time-boxes:
   - Check-in / Energizer (5-10 min)
   - Data gathering / Exploration (20-30 min)
   - Insights / Clustering (15-20 min)
   - Action items / Decisions (15-20 min)
   - Check-out / Closing (5 min)
2. Instrucciones del energizer de apertura (actividad concreta, no "hagan un icebreaker")
3. Template visual del formato seleccionado con instrucciones por zona
4. Preguntas de profundizacion para el facilitador (cuando la conversacion se estanca)
5. Protocolo de action items: formato WHO-WHAT-WHEN, maximo 3 items accionables
6. Mecanismo de follow-up: como verificar progreso en los action items

MODO=piloto-auto FORMATO=markdown VARIANTE=tecnica
```

---

## 6. Wardley Mapping Workshop

```
Disena un taller de Wardley Mapping para explorar la estrategia tecnologica de: {CONTEXTO_ESTRATEGICO}.

Participantes: {NUMERO} personas ({ROLES}).
Conocimiento previo de Wardley Maps: {ninguno | basico | intermedio}.
Formato: {presencial | remoto}.
Duracion: {DURACION}.

Genera:
1. Mini-sesion educativa (15-20 min): que es un Wardley Map, ejes, fases de evolucion
2. Agenda del taller:
   - Identificacion de la cadena de valor (user need > capabilities > components)
   - Posicionamiento en eje de evolucion (genesis > custom > product > commodity)
   - Identificacion de movimientos estrategicos (build vs buy, commoditize, open-source)
   - Analisis de dependencias y riesgos
3. Template del mapa con ejes pre-etiquetados y ejemplos
4. Guia de facilitacion con preguntas por fase:
   - "Que necesita el usuario final?" (ancla superior)
   - "De que depende esa capacidad?" (cadena hacia abajo)
   - "En que fase de evolucion esta cada componente?" (posicionamiento horizontal)
   - "Que decisiones estrategicas habilita esta posicion?" (insights)
5. Output esperado: Wardley Map con anotaciones estrategicas + lista de decisiones a tomar

MODO=supervisado FORMATO=markdown VARIANTE=tecnica
```

---

## 7. Discovery Workshop Completo (Full-Day)

```
Disena un taller de discovery de dia completo para el proyecto: {NOMBRE_PROYECTO}.

Objetivo: extraer conocimiento de dominio, alinear stakeholders, y producir artefactos accionables en una sola sesion.
Participantes: {NUMERO} personas ({ROLES}).
Formato: {presencial | remoto | hibrido}.
Duracion: {6 | 8} horas.

Genera un diseno que combine multiples tecnicas en una sola sesion:
1. Bloque 1 (AM): Context setting + Impact Mapping (goal > actors > impacts > deliverables)
2. Bloque 2 (AM): Event Storming Big Picture (domain events > commands > aggregates > hotspots)
3. Almuerzo / Break largo (30-45 min)
4. Bloque 3 (PM): User Story Mapping (backbone > walking skeleton > release planning)
5. Bloque 4 (PM): Priorizacion + Decision + Action Items

Para cada bloque:
- Time-box detallado con actividades de 15-30 min max
- Energizer entre bloques
- Instrucciones de facilitacion
- Output esperado del bloque
- Materiales necesarios

Incluir:
- Gestion de energia (arco de energia del dia, breaks estrategicos)
- Plan de contingencia (si un bloque toma mas tiempo, que se sacrifica)
- Criterios de exito del taller completo
- Plan de sintesis post-taller

MODO=piloto-auto FORMATO=markdown VARIANTE=tecnica
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026 | (c) Comunidad MetodologIA
