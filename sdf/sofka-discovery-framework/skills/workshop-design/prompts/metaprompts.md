# Metaprompts — Workshop Design

Estrategias de razonamiento que el skill aplica internamente para resolver problemas complejos de diseno de talleres. Cada metaprompt define un enfoque cognitivo reutilizable.

---

## 1. Technique Selection by Goal

**Cuando aplicar:** Al recibir un objetivo de taller y necesitar seleccionar la tecnica o combinacion de tecnicas mas apropiada.

**Estrategia:**

```
Selecciona la tecnica de taller optima mediante analisis de objetivo, no por preferencia del facilitador:

PASO 1 — Clasificacion del objetivo
Identifica la categoria primaria del objetivo del taller:
- EXPLORAR: "No entendemos el dominio" → Event Storming Big Picture
- ALINEAR: "Tenemos visiones diferentes" → Impact Mapping o Stakeholder Alignment
- PLANIFICAR: "Sabemos que construir pero no como organizarlo" → User Story Mapping
- VALIDAR: "Tenemos hipotesis que necesitan prueba" → Design Sprint
- DECIDIR: "Tenemos opciones y necesitamos elegir" → Dot Voting, MoSCoW, WSJF
- REFLEXIONAR: "Necesitamos mejorar como equipo" → Retrospectiva (Sailboat, 4Ls)
- ESTRATEGIZAR: "Necesitamos direccion tecnologica" → Wardley Mapping

PASO 2 — Evaluacion de constraints
Para la tecnica seleccionada, evalua viabilidad:
- Duracion disponible vs. requerida (event storming necesita minimo 3h, design sprint 5 dias)
- Participantes disponibles vs. requeridos (event storming necesita domain experts)
- Formato vs. requerido (algunas tecnicas pierden efectividad en remoto)
- Madurez del equipo (tecnicas avanzadas requieren facilitador experimentado)

Si la tecnica ideal no es viable, selecciona la alternativa:
- Event Storming no viable → Domain Storytelling (mas corto, menos participantes)
- Design Sprint 5d no viable → Lightning Sprint 1d (comprimido)
- Impact Mapping sin decision-maker → Table de scope alignment (async input del DM)

PASO 3 — Combinacion de tecnicas
Si el objetivo es complejo (multiples categorias), combina tecnicas en secuencia:
- Discovery completo: Impact Mapping (AM) + Event Storming (PM)
- Planning completo: Event Storming (dia 1) + Story Mapping (dia 2)
- Validation completo: Story Mapping (dia 1-2) + Design Sprint (dia 3-7)

REGLA: nunca combinar mas de 2 tecnicas principales en un solo dia.
La fatiga de cambio de contexto reduce la calidad de ambas.

PASO 4 — Validacion de seleccion
Pregunta de control: "Si este taller sale perfecto, que artefacto tangible
tiene el equipo que no tenia antes?"
Si la respuesta no es clara, el objetivo no esta bien definido — clarificar antes de disenar.
```

---

## 2. Energy Arc Design

**Cuando aplicar:** Al disenar la agenda de un taller de medio dia o mas, para gestionar la energia del grupo a lo largo de la sesion.

**Estrategia:**

```
Disena la agenda siguiendo el arco de energia natural del grupo:

PASO 1 — Mapear el arco de energia
La energia de un grupo sigue un patron predecible:
- INICIO (primeros 30 min): energia media, expectativa, timidez
- ASCENSO (30-90 min): energia alta, engagement, productividad pico
- MESETA (90-150 min): energia sostenida pero declinando
- VALLE (150-180 min): energia baja, atencion dispersa, necesidad de break
- RECUPERACION (post-break): energia renovada pero menor que el pico
- CIERRE (ultimos 30 min): energia descendente, urgencia por concluir

PASO 2 — Asignar actividades al arco
- INICIO: check-in + energizer + context setting (actividades de bajo riesgo)
- ASCENSO: la actividad mas importante y cognitivamente demandante
  (event storming discovery, impact mapping brainstorming, crazy 8s)
- MESETA: actividades de convergencia (clustering, voting, priorizacion)
- VALLE: BREAK OBLIGATORIO (minimo 15 min) — nunca programar actividad critica aqui
- RECUPERACION: actividad practica (story mapping, prototyping, action planning)
- CIERRE: sintesis, action items, check-out (nunca nueva divergencia)

PASO 3 — Insertar micro-resets
Cada 40-50 minutos, insertar un micro-reset (2-5 min):
- Cambio de actividad (de individual a grupal o viceversa)
- Movimiento fisico (levantarse, cambiar de posicion)
- Pregunta rapida al grupo (quick poll, thumbs up/down)
- Momento de escritura silenciosa (silent-before-spoken)

PASO 4 — Calibrar para formato
- Presencial: arco natural, breaks de 15 min, maximo 7h productivas
- Remoto: arco comprimido, max 3h por sesion, breaks cada 40 min,
  camaras encendidas solo para plenarias (no para trabajo individual)
- Hibrido: el formato mas dificil — disenar para remotos primero,
  adaptar para presenciales. Nunca al reves.

REGLA: si programas actividad critica en el valle de energia,
el resultado sera inferior. Mueve el break ANTES de la actividad critica.
```

---

## 3. Facilitation Contingency Planning

**Cuando aplicar:** Al disenar la guia de facilitacion, para anticipar y planificar respuestas a situaciones que descarrilan talleres.

**Estrategia:**

```
Anticipa las 8 contingencias mas comunes y prepara respuestas concretas:

CONTINGENCIA 1 — La actividad toma mas tiempo del planificado
Preparacion: para cada bloque de agenda, define:
- Tiempo minimo (lo esencial si hay que comprimir)
- Tiempo ideal (lo planificado)
- Que se CORTA si hay que comprimir (nunca cortar la convergencia)
Respuesta: "Tenemos 10 minutos mas para esta actividad. Voy a pedir
que cada grupo seleccione sus 3 ideas mas importantes para compartir."

CONTINGENCIA 2 — Un participante domina la conversacion
Preparacion: tener actividades silent-before-spoken listas.
Respuesta: "Vamos a hacer una ronda de escritura individual de 3 minutos.
Cada persona escribe sus ideas en stickies antes de compartir."
Si persiste: "Gracias [nombre], excelente punto. Quiero escuchar
tambien a quienes no han hablado. [Nombre], tu perspectiva?"

CONTINGENCIA 3 — Conflicto entre stakeholders
Preparacion: tener parking lot visible y protocolo de votacion anonima.
Respuesta: "Estamos descubriendo una diferencia importante. Voy a
registrarla como un hotspot/punto de decision. Continuamos con la
actividad y dedicaremos tiempo especifico a resolverlo despues."
Si es critico: pausar la actividad, hacer votacion anonima, documentar
posiciones, escalar a decision-maker si esta presente.

CONTINGENCIA 4 — Los participantes no entienden la tecnica
Preparacion: tener un ejemplo concreto pre-preparado (no abstracto).
Respuesta: "Voy a modelar un ejemplo rapido antes de que empecemos.
[Ejecutar ejemplo de 3-5 min con dominio familiar: pedir comida online,
reservar un vuelo, etc.]"

CONTINGENCIA 5 — Energia baja (grupo desconectado)
Preparacion: tener 3 energizers listos (cortos, no infantiles).
Respuesta: "Vamos a hacer una pausa de 2 minutos. [Energizer concreto].
Despues retomamos con energia renovada."
Si la energia no se recupera: acortar la sesion y reprogramar.
Un taller con grupo agotado produce outputs de baja calidad.

CONTINGENCIA 6 — Participante clave no asiste
Preparacion: identificar conocimiento critico de cada participante en pre-work.
Respuesta: evaluar si el taller sigue siendo viable sin ese participante.
- Si el conocimiento es insustituible: reprogramar o hacer sesion 1-on-1 despues.
- Si es importante pero no critico: marcar sus areas como "pendiente de validacion".

CONTINGENCIA 7 — Problemas tecnicos (remoto)
Preparacion: tener plan B para cada herramienta (backup board, shared doc).
Respuesta: "Vamos a cambiar a [herramienta backup]. Les comparto el link
en el chat. Tomen 2 minutos para acceder." Nunca perder mas de 5 min
en troubleshooting tecnico — cambiar de herramienta inmediatamente.

CONTINGENCIA 8 — El scope del taller se expande durante la sesion
Preparacion: tener el objetivo del taller escrito y visible.
Respuesta: "Excelente punto. Lo estoy agregando al parking lot porque
es importante pero esta fuera del scope de hoy. Nuestro objetivo hoy es
[releer objetivo]. Volvamos a [actividad actual]."

REGLA: un facilitador experimentado dedica 20% de su preparacion a contingencias.
Un facilitador novato dedica 0% — y se nota cuando algo sale diferente al plan.
```

---

## 4. Synthesis-First Design

**Cuando aplicar:** Al disenar un taller, comenzando por los outputs deseados y disenando hacia atras.

**Estrategia:**

```
Disena el taller desde los outputs hacia los inputs (backward design):

PASO 1 — Definir outputs concretos
Antes de disenar la agenda, responde:
"Al terminar este taller, que artefactos tangibles tiene el equipo?"
Ejemplos de outputs concretos:
- Mapa de eventos con bounded contexts identificados (event storming)
- Impact map con deliverables priorizados (impact mapping)
- Story map con releases definidos y MVP marcado (story mapping)
- Prototipo validado con 5 usuarios (design sprint)
- Lista priorizada de 5 action items con owners (retrospectiva)
- Decision log con 3+ decisiones documentadas (alignment)

Si el output no es un artefacto tangible ("mejor comprension", "alineamiento"),
reformula hasta que sea concreto y verificable.

PASO 2 — Disenar actividades de convergencia
Para cada output, define LA actividad que lo produce:
- Mapa de eventos → actividad de timeline + clustering de aggregates
- Impact map → actividad de arbol goal-actor-impact-deliverable
- Decisions → actividad de votacion + documentacion
Estas son las actividades innegociables del taller.

PASO 3 — Disenar actividades de divergencia
Para cada actividad de convergencia, define que input necesita:
- Clustering necesita stickies individuales → actividad de brainstorming individual
- Votacion necesita opciones → actividad de generacion de opciones
- Arbol necesita nodos → actividad de descubrimiento por nivel
Estas son las actividades de preparacion.

PASO 4 — Ensamblar agenda
Secuencia: Context > Diverge > Converge > Output > Repeat.
Para cada bloque:
- Opening: que saben los participantes al empezar
- Activity: que HACEN durante el bloque
- Output: que artefacto tangible tiene el equipo al terminar
- Transition: como se conecta con el siguiente bloque

PASO 5 — Validar completitud
Para cada output definido en PASO 1:
- Hay una actividad que lo produce? (SI/NO)
- Esa actividad tiene inputs suficientes? (SI/NO)
- El time-box es realista? (SI/NO)
Si alguna respuesta es NO, ajustar la agenda.

REGLA: si al terminar el taller no hay artefacto tangible que antes no existia,
el taller fue una reunion con post-its. Disenar para outputs, no para actividades.
```

---

## 5. Remote-First Facilitation

**Cuando aplicar:** Al disenar cualquier taller que se ejecutara en formato remoto o hibrido.

**Estrategia:**

```
Disena para remoto como formato primario, no como adaptacion de presencial:

PASO 1 — Constraints de formato remoto
Acepta las limitaciones como reglas de diseno, no como problemas:
- Atencion maxima efectiva: 40 minutos (no 90 como presencial)
- Duracion maxima de sesion: 3 horas (no 8 como presencial)
- Fatiga de video: real y acumulativa — reducir camaras obligatorias
- Latencia de comunicacion: pausas naturales son mas largas
- Contexto de participantes: distracciones domesticas/oficina son la norma

PASO 2 — Adaptar estructura de sesion
- Bloques de 25-35 minutos max (no 45-60 como presencial)
- Breaks de 5-10 min cada 40 min (no cada 90)
- Silent work individual: funciona MEJOR en remoto que en presencial
- Plenarias cortas: max 15 min de exposicion, luego actividad
- Breakout rooms: 3-4 personas, instrucciones escritas, template visible, timer

PASO 3 — Dual-agenda
Crear DOS agendas:
- Agenda publica (para participantes): horarios, objetivos, breaks
- Agenda interna (para facilitador): timing exacto, instrucciones textuales,
  preguntas de transicion, contingencias, links a herramientas, breakout assignments

PASO 4 — Herramientas y setup
- Board (Miro/FigJam): pre-configurar frames, stickies de ejemplo, zonas de color
- Video call: configurar breakout rooms de antemano, asignar co-facilitadores
- Chat: definir uso (preguntas, links, voting) — no para conversacion paralela
- Timer visible: compartir timer en pantalla para todas las actividades

PASO 5 — Anti-patrones remotos (evitar)
- Death by screen-share: los participantes HACEN en el board, no miran al facilitador
- Phantom consensus: el silencio NO es acuerdo — usar polls explicitos
- Breakout abandonment: siempre instrucciones escritas + template + timer
- Camera fatigue: camaras on para plenarias y check-in, off para trabajo individual
- Over-tooling: una herramienta de board + una de video. Maximo.

PASO 6 — Validacion de diseno remoto
Pregunta de control por cada actividad:
"Un participante que se conecta 2 minutos tarde a esta actividad,
puede entender que hacer sin preguntar?" (SI/NO)
Si NO: las instrucciones no son suficientemente explicitas.
En remoto, las instrucciones deben ser auto-contenidas.

REGLA: un taller remoto bien disenado supera a un taller presencial
mal disenado. El formato no determina la calidad — el diseno si.
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026 | (c) Comunidad MetodologIA
