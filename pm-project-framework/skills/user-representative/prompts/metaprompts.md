# Metaprompts — User Representative

> Estrategias de meta-nivel para maximizar la efectividad de esta skill.
> Los metaprompts no producen entregables — optimizan COMO se producen.

---

## 1. Cognitive Load Stress Test (Prueba de Estres de Carga Cognitiva)

**Proposito:** Antes de entregar el veredicto, simular la lectura del deliverable bajo condiciones de carga cognitiva realistas. Los stakeholders no leen en condiciones ideales — leen entre reuniones, en el telefono, cansados.

```
Toma el deliverable y simulalo bajo estas condiciones de lectura:

CONDICION 1 — Executive entre reuniones (5 minutos):
- Abre el documento en el telefono entre dos calls
- Lee solo los primeros 3 scrolls
- Que informacion obtuvo? Es suficiente para su decision?
- Si la respuesta es "necesito leerlo completo", el deliverable fallo para este usuario
- Check: hay TL;DR visible sin scroll? Los bullets capturan la esencia?

CONDICION 2 — Technical Lead revisando antes de standup (15 minutos):
- Abre en laptop, escanea TOC, salta a la seccion que le interesa
- Lee 2-3 secciones completas, escanea el resto
- Puede encontrar la seccion relevante sin leer todo?
- Los headings son descriptivos (no "Seccion 3" sino "Trade-offs de Migracion")?
- Las tablas tienen insight clave arriba (no necesita procesar toda la tabla)?

CONDICION 3 — Developer buscando especificaciones (30 minutos):
- Busca (Ctrl+F) terminos especificos
- Lee en detalle las secciones tecnicas
- Los terminos tecnicos son consistentes? (no "microservicio" y "micro-servicio" alternando)
- Los diagramas tienen suficiente detalle tecnico?
- Las especificaciones son precisas o ambiguas?

CONDICION 4 — Business Analyst preparando presentacion (20 minutos):
- Necesita extraer key findings para una presentacion propia
- Los findings estan explicitamente marcados o enterrados en prosa?
- Puede copiar-pegar una tabla o bullet list directamente?
- Los numeros tienen contexto (no solo "15%" sino "15% — triple del promedio de la industria")?

Para cada condicion, documentar:
- Informacion obtenida: {que entendio}
- Informacion perdida: {que no vio o no entendio}
- Momento de abandono: {donde dejo de leer y por que}
- Micro-ajuste: {que cambio haria la experiencia exitosa}

Si en la CONDICION 1 el executive no obtiene valor, es un blocker para D3.
Si en la CONDICION 3 el developer encuentra ambiguedades, es un flag para D1.
```

---

## 2. Bias Detection Framework (Framework de Deteccion de Sesgos)

**Proposito:** Recorrer sistematicamente el deliverable buscando sesgos cognitivos que puedan afectar la calidad de las decisiones del lector. Los sesgos en el deliverable se transfieren al lector.

```
Para cada seccion del deliverable, busca estos sesgos:

SESGO 1 — Optimism Bias (Sesgo de Optimismo):
- Las estimaciones de tiempo son realistas o aspiracionales?
- Los riesgos estan presentados con la misma prominencia que los beneficios?
- Hay frases como "facilmente", "rapidamente", "sin complicaciones"?
- Los costos incluyen contingencia o son best-case?
- El lenguaje de los beneficios es mas vivo que el de los riesgos?
- FIX: para cada beneficio mencionado, verificar que el riesgo correspondiente
  tiene la misma prominencia visual (mismo nivel de heading, callout, bold)

SESGO 2 — Technical Bias (Sesgo Tecnico):
- Se asume que el lector conoce una tecnologia especifica?
- Hay acronimos usados sin expansion en primera mencion?
- Las analogias requieren conocimiento tecnico para funcionar?
- Se usa jerga de una comunidad especifica (DevOps, Agile, Cloud)?
- FIX: para cada termino tecnico, agregar definicion o link a glosario.
  Para cada analogia tecnica, agregar una analogia de negocio equivalente.

SESGO 3 — Anchoring Bias (Sesgo de Anclaje):
- El primer numero presentado sesga toda la evaluacion?
  (ej: "el proyecto costara $2M" antes de explicar el valor)
- Las opciones estan ordenadas para sesgar hacia una?
  (opcion A presentada como inferior, opcion C como "la correcta")
- Los benchmarks seleccionados favorecen la recomendacion?
- FIX: presentar contexto ANTES del numero ("empresas similares
  invierten entre $1M-3M en este tipo de transformacion. Recomendamos $2M").
  Presentar opciones de forma neutral con trade-offs explicitos.

SESGO 4 — Organizational Bias (Sesgo Organizacional):
- Se asume que el lector tiene autoridad para decidir?
- Se asume que la organizacion tiene capacidad para ejecutar?
- Se asume cultura agil / DevOps / cloud-first?
- Se ignoran restricciones politicas o presupuestarias reales?
- FIX: explicitar asunciones organizacionales. "Esta recomendacion asume
  que el equipo de plataforma tiene >= 3 ingenieros dedicados."

SESGO 5 — Cultural Bias (Sesgo Cultural):
- Metaforas que no son universales? ("home run", "touchdown", "grand slam")
- Ejemplos centrados en una cultura? (solo empresas de Silicon Valley)
- Humor que puede no traducirse?
- Asunciones sobre horarios laborales, jerarquias, o comunicacion?
- FIX: usar metaforas universales. Incluir ejemplos de LATAM cuando sea
  relevante para la audiencia MetodologIA. Evitar humor en deliverables formales.

Para cada sesgo detectado, documentar:
- Seccion y parrafo donde ocurre
- Cita exacta del texto problematico
- Tipo de sesgo
- Impacto: bajo (molestia) / medio (confusion) / alto (decision erronea)
- Fix especifico (rewrite sugerido)

Si hay algun sesgo con impacto "alto", es un flag para D5 y puede afectar el Verdict.
```

---

## 3. Adoption Readiness Simulation (Simulacion de Preparacion para Adopcion)

**Proposito:** Simular la "reunion de decision" donde el deliverable sera usado. Predecir si las recomendaciones seran adoptadas, modificadas, o rechazadas.

```
Simula la siguiente reunion y evalua si el deliverable sobrevive:

REUNION: {tipo de reunion} (ej: comite de arquitectura, steering committee, board review)
ASISTENTES: {lista de personas con roles y poder de decision}
OBJETIVO: {decision esperada} (ej: aprobar roadmap, asignar presupuesto, seleccionar opcion)
DELIVERABLE: {path al deliverable que se presentara}

FASE 1 — Pre-lectura (¿se lee antes de la reunion?):
- Es suficientemente corto para lectura previa? (max 10 paginas para executives)
- El TL;DR permite llegar preparado sin leer todo?
- Hay accion requerida antes de la reunion? (ej: "traer feedback sobre seccion 4")

FASE 2 — Presentacion (primeros 10 minutos):
- El presenter puede resumir en 3 slides / 5 minutos?
- Los key findings son defendibles con evidencia del documento?
- Los numeros estan contextualizados para la audiencia?
- Las recomendaciones son claras y ordenadas por prioridad?

FASE 3 — Preguntas y objeciones (10-20 minutos):
Para cada asistente, predecir la primera pregunta:

| Asistente | Rol | Primera pregunta probable | Respuesta en el deliverable? |
|---|---|---|---|
| CFO | Financial oversight | "Cuanto cuesta y en cuanto tiempo hay ROI?" | SI/NO/PARCIAL |
| CTO | Technical direction | "Que alternativas consideraron?" | SI/NO/PARCIAL |
| VP Ops | Operational impact | "Quien mantiene esto despues?" | SI/NO/PARCIAL |
| ... | ... | ... | ... |

- Si la respuesta es NO para alguna pregunta critica, el deliverable tiene un gap.
- Si la respuesta es PARCIAL, necesita un micro-ajuste (agregar seccion, callout, o dato).

FASE 4 — Decision (ultimos 5 minutos):
- Se puede tomar la decision en esta reunion?
- Si no, que informacion adicional se necesita?
- El CTA del deliverable alinea con la decision esperada?
- Hay alguien que podria vetar basado en informacion NO presente en el deliverable?

FASE 5 — Post-reunion:
- Los action items estan claros en el deliverable?
- El deliverable puede ser reenviado como "acta" de la decision?
- Los asistentes que no estuvieron pueden entender la decision leyendo el deliverable?

Resultado:
- ADOPTION PROBABILITY: Alta (>70%) / Media (40-70%) / Baja (<40%)
- Gaps criticos que reducen probabilidad
- Top 3 micro-ajustes que aumentarian probabilidad
- Objection playbook: objeciones probables + respuestas sugeridas
```

---

## 4. Plain Language Transformation (Transformacion a Lenguaje Claro)

**Proposito:** Aplicar sistematicamente principios de plain language a secciones del deliverable que tienen score bajo en D1 (Comprehension). No reescribir todo — transformar lo que importa.

```
Para cada seccion con D1 < 7, aplica esta transformacion sistematica:

PASO 1 — Jargon Audit:
- Listar TODOS los terminos tecnicos usados en la seccion
- Para cada uno: ¿el lector target lo conoce?
  - SI -> mantener
  - NO -> definir en primera mencion con patron: "termino (definicion breve)"
  - QUIZAS -> definir con patron + nota al pie para contexto

PASO 2 — Sentence Simplification:
- Identificar oraciones > 25 palabras
- Dividir en 2 oraciones cuando sea posible
- Convertir voz pasiva a voz activa:
  ANTES: "La migracion fue completada por el equipo de plataforma"
  DESPUES: "El equipo de plataforma completo la migracion"
- Eliminar nominalizaciones:
  ANTES: "La implementacion de la solucion requiere la consideracion de..."
  DESPUES: "Para implementar la solucion, considere..."

PASO 3 — Structure Improvement:
- Convertir parrafos con >3 items enumerados a listas con bullets
- Agregar heading descriptivo donde hay >4 parrafos consecutivos sin heading
- Asegurar que cada seccion comienza con 1 oracion que resume el contenido
  (el lector que lea SOLO la primera oracion de cada seccion deberia
  entender el mensaje general)

PASO 4 — Number Contextualization:
- Cada numero tiene comparador?
  ANTES: "Latencia p99: 450ms"
  DESPUES: "Latencia p99: 450ms (objetivo: <200ms, actual: 2.25x por encima)"
- Los porcentajes tienen base?
  ANTES: "Reduccion de 30%"
  DESPUES: "Reduccion de 30% (de $100K/mes a $70K/mes)"

PASO 5 — Analogy Injection:
- Para cada concepto complejo, agregar una analogia de negocio:
  ANTES: "El circuit breaker previene cascading failures"
  DESPUES: "El circuit breaker previene cascading failures — como un fusible
  electrico que se desconecta para evitar que un corto dañe toda la casa"

Para cada transformacion, documentar:
- Texto original (ANTES)
- Texto propuesto (DESPUES)
- Impacto esperado en D1 score: +{puntos}

No transformar secciones con D1 >= 7 — no arreglar lo que no esta roto.
El objetivo es elevar D1 a >= 7, no a 10 (perfection is the enemy of done).
```

---

## 5. Cross-Deliverable Consistency Check (Verificacion de Consistencia entre Deliverables)

**Proposito:** Cuando se producen multiples deliverables en un discovery, verificar que la terminologia, datos, y recomendaciones son consistentes. Inconsistencias entre deliverables destruyen credibilidad.

```
Comparar {NUM_DELIVERABLES} deliverables del mismo discovery:

DELIVERABLES:
1. {PATH_1} — {tipo} (ej: AS-IS Analysis)
2. {PATH_2} — {tipo} (ej: Solution Roadmap)
3. {PATH_3} — {tipo} (ej: Pitch Ejecutivo)

CHECK 1 — Terminologia consistente:
- El mismo concepto tiene el mismo nombre en todos los deliverables?
  (no "microservicios" en uno y "servicios independientes" en otro)
- Los acronimos se expanden igual en todos?
- Los nombres de sistemas/componentes son identicos?
- Listar inconsistencias encontradas con ubicacion exacta

CHECK 2 — Datos consistentes:
- Los numeros citados son iguales en todos los deliverables?
  (no "15 servicios" en el AS-IS y "18 servicios" en el Roadmap)
- Las fechas y timelines son coherentes?
- Los costos (magnitudes) son consistentes?
- Los riesgos listados son los mismos?
- Listar discrepancias con fuente probable de la version correcta

CHECK 3 — Recomendaciones consistentes:
- Las conclusiones del AS-IS fundamentan las recomendaciones del Roadmap?
- El Pitch Ejecutivo refleja las mismas prioridades del Roadmap?
- No hay recomendaciones en un deliverable que contradigan otro?
- Las opciones evaluadas son las mismas (no opciones fantasma)?

CHECK 4 — Narrativa coherente:
- La historia es la misma en todos? (problema -> analisis -> opciones -> recomendacion)
- El tono es consistente? (no alarmista en AS-IS y optimista en Pitch)
- Las evidences tags son coherentes? ([CODIGO] en AS-IS referenciado en Roadmap)

Para cada inconsistencia encontrada:
- Tipo: terminologia / dato / recomendacion / narrativa
- Deliverable A dice: {cita}
- Deliverable B dice: {cita}
- Version correcta probable: {cual}
- Fix: que deliverable ajustar y como

Si hay >3 inconsistencias de datos, el conjunto de deliverables NO pasa
quality gate. Corregir antes de entregar.
```

---

**Autor:** Javier Montaño | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
