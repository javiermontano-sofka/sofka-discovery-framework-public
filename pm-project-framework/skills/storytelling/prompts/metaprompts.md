# Metaprompts — Storytelling

> Estrategias de meta-nivel para maximizar la efectividad de esta skill.
> Los metaprompts no producen entregables — optimizan COMO se producen.

---

## 1. Narrative Stress-Test (The Skeptic Reader)

**Proposito:** Someter la narrativa al escrutinio de un lector esceptico que cuestiona cada afirmacion, cada salto logico, y cada apelacion emocional. Si la narrativa sobrevive al esceptico, sobrevivira al steering committee.

```
Despues de completar la narrativa, ejecuta este stress-test con un "lector esceptico":

Para CADA afirmacion de la narrativa, el esceptico pregunta:

EVIDENCIA:
- "¿De donde sale ese dato?" → Verificar que tiene evidence tag
- "¿Es un hecho o una inferencia?" → Asegurar que [INFERENCIA] y [SUPUESTO] estan marcados
- "¿Es cherry-picking?" → ¿Se omitieron datos que contradicen la narrativa?

LOGICA:
- "¿Este paso sigue del anterior?" → Verificar que la cascada de consecuencias es logica
- "¿Hay un salto logico?" → Detectar "therefore" sin suficiente "because"
- "¿La conclusion es la unica posible?" → ¿Hay conclusiones alternativas no exploradas?

TONO:
- "¿Esto es factual o emocional?" → Las risk narratives deben ser factuales
- "¿El tono es consistente?" → ¿El documento cambia de tono sin razon?
- "¿Hay exageracion?" → "Siempre", "nunca", "colapsara" son red flags

COHERENCIA:
- "¿Esto se contradice con algo dicho en otro entregable?" → Cross-reference check
- "¿Los callbacks apuntan a contenido real?" → Verificar referencias
- "¿Los numeros son consistentes?" → El mismo dato debe tener el mismo valor en todos lados

Para cada issue encontrado:
- Clasificar: CRITICO (cambia la conclusion) / IMPORTANTE (debilita el argumento) / MENOR (pulido)
- Proponer correccion
- Si hay 2+ issues CRITICOS, la narrativa necesita rewrite parcial
```

---

## 2. Stakeholder Empathy Rotation

**Proposito:** Leer la narrativa desde la perspectiva de cada stakeholder clave. Lo que resuena con el CTO puede ser irrelevante para el CFO. Cada stakeholder debe encontrar "su" historia dentro de la narrativa general.

```
Para la narrativa completada, ejecuta una rotacion de empatia por stakeholder:

PERSPECTIVA 1 — CFO:
- ¿Encuentro los numeros que necesito para tomar una decision financiera?
- ¿Entiendo el COI sin tener que preguntar?
- ¿El call to action incluye magnitud de inversion necesaria?
- ¿La narrativa me respeta o me trata como alguien que "no entiende la tecnologia"?
- VEREDICTO: ¿Me siento informado y respetado? ¿Puedo actuar con esta informacion?

PERSPECTIVA 2 — CTO:
- ¿La narrativa refleja la complejidad real del problema?
- ¿Los hallazgos tecnicos estan bien fundamentados?
- ¿Me siento representado en la historia o esta escrita solo para el negocio?
- ¿Las recomendaciones son tecnicamente viables, no solo narrativamente atractivas?
- VEREDICTO: ¿Confio en la profundidad tecnica? ¿La narrativa me ayuda a defender la decision?

PERSPECTIVA 3 — HEAD OF OPS:
- ¿Entiendo que cambia en mi dia a dia?
- ¿La narrativa reconoce los riesgos de la transicion para mi equipo?
- ¿El roadmap es realista o es "narrativa bonita, ejecucion imposible"?
- ¿Mis preocupaciones (downtime, capacitacion, carga) estan reflejadas?
- VEREDICTO: ¿Me siento escuchado? ¿Confio en que la transicion es manejable?

PERSPECTIVA 4 — USUARIO FINAL (ajustador, operador, developer):
- ¿La narrativa habla de mi o habla de "recursos" y "FTEs"?
- ¿Entiendo como mejora mi trabajo?
- ¿Me da esperanza o me da miedo?
- VEREDICTO: ¿Me siento motivado o amenazado?

Para cada perspectiva donde el veredicto es negativo:
- Identificar que seccion falta o necesita ajuste
- Proponer adicion o rewrite
- Verificar que el ajuste no debilita la narrativa para otras perspectivas
```

---

## 3. Narrative Tension Calibration

**Proposito:** Verificar que la curva de tension narrativa tiene el perfil correcto: no plana (aburrida), no constante-alta (agotadora), sino con picos y valles estrategicos.

```
Para la narrativa o conjunto de entregables completados, evaluar la curva de tension:

PASO 1: Asignar nivel de tension (1-10) a cada seccion/entregable:
- 1-3: Exposicion, contexto, setup (necesario pero no tenso)
- 4-6: Desarrollo, evidencia acumulandose (tension creciente)
- 7-8: Revelacion, hallazgo impactante (pico parcial)
- 9-10: Climax, punto de decision, urgencia maxima (pico total)

PASO 2: Verificar el perfil esperado:
- 00 Plan: 2-3 (setup, compromiso)
- 01 Stakeholders: 4-5 (voces que empiezan a revelar tension)
- 02 Brief: 5-6 (panorama que preocupa)
- 03 AS-IS: 8-9 (TENSION MAXIMA — la revelacion)
- 04 Flows: 7-8 (la fractura visible en los flujos)
- 05 Scenarios: 9-10 (PUNTO DE DECISION — la encrucijada)
- 06 Roadmap: 5-6 (alivio — hay un camino)
- 07 Spec: 3-4 (precision, calma tecnica)
- 08 Pitch: 7-8 (re-pico de urgencia para call to action)
- 09 Handover: 2-3 (resolucion — el primer paso es claro)

PASO 3: Detectar anomalias:
- ¿Hay dos picos consecutivos sin valle? → El lector se agota. Insertar momento de alivio.
- ¿La tension es plana por 3+ secciones? → El lector se desconecta. Insertar hallazgo o perspectiva.
- ¿El climax (05 Scenarios) no es el punto mas tenso? → Ajustar — la decision debe ser el momento cumbre.
- ¿La resolucion (09 Handover) no baja la tension? → El lector termina agotado en lugar de motivado.

PASO 4: Ajustar secciones donde la tension esta des-calibrada.
```

---

## 4. Evidence-to-Narrative Bridge (Anti-"Data Dump")

**Proposito:** Prevenir el anti-patron mas comun en discovery: presentar datos sin narrativa ("data dump"). Cada dato debe tener un puente a una historia. Cada historia debe tener un puente a un dato.

```
Para cada seccion de la narrativa, ejecuta este check bidireccional:

DIRECCION 1: DATO → HISTORIA
Para cada dato, metrica, o hallazgo tecnico presentado:
- ¿Tiene contexto? ("El p99 latency es 2.1s" → ¿Y eso que significa para el usuario?)
- ¿Tiene consecuencia? ("18 dias de resolucion" → ¿Y que pasa por eso? ¿Cuanto cuesta?)
- ¿Tiene personalizacion? ("40% tiempo manual" → ¿Quien sufre eso? ¿Como se ve su dia?)
- Si falta alguno: agregar el puente dato → historia

DIRECCION 2: HISTORIA → DATO
Para cada afirmacion narrativa, perspectiva, o vision:
- ¿Tiene evidence tag? ("Los ajustadores estan frustrados" → [STAKEHOLDER: encuesta, 89% favorable])
- ¿Tiene cuantificacion? ("El proceso es lento" → ¿Cuanto? ¿Comparado con que?)
- ¿Tiene fuente? ("El competidor resuelve en 48 horas" → [DOC: reporte de industria])
- Si falta alguno: agregar el puente historia → dato

RESULTADO:
- Lista de datos sin narrativa (data dumps a resolver)
- Lista de afirmaciones sin evidencia (narrativas a fundamentar)
- Score: % de datos con puente narrativo / % de afirmaciones con evidencia
- Target: >90% en ambas direcciones

Si el score es <80% en cualquier direccion, la narrativa necesita trabajo.
```

---

## 5. Anti-Patterns in Storytelling (Que NO Hacer)

**Proposito:** Detectar y corregir los errores mas comunes que debilitan o invalidan una narrativa de discovery. Auto-check antes de entregar.

```
Antes de entregar la narrativa, ejecuta este anti-pattern check:

ANTI-PATRON 1: "Data Dump Disfrazado"
❌ Seccion de "hallazgos" que lista 20 datos sin hilo conductor
❌ Tablas de metricas sin interpretacion narrativa
❌ Evidence tags presentes pero sin "so what?"
✅ CHECK: ¿Cada dato tiene contexto, consecuencia, y personalizacion?
✅ CHECK: ¿Puedo leer la seccion como una historia, no como un reporte?

ANTI-PATRON 2: "Narrativa sin Evidencia" (Fiction)
❌ Afirmaciones genericas sin datos: "el sistema es lento", "el equipo esta frustrado"
❌ Proyecciones sin base: "en 12 meses mejoraremos 50%" sin mostrar como
❌ Analogias forzadas: empresa referencia que no es comparable
✅ CHECK: ¿Cada afirmacion tiene evidence tag?
✅ CHECK: ¿Las proyecciones tienen modelo o base de calculo?
✅ CHECK: ¿La success reference es genuinamente comparable?

ANTI-PATRON 3: "Fear-Mongering" (Alarmismo)
❌ "El sistema colapsara", "la empresa perdera todo"
❌ Risk narratives con lenguaje apocaliptico
❌ COI inflado para justificar la venta
✅ CHECK: ¿Cada paso de la cascada de riesgo es factual?
✅ CHECK: ¿Usamos condicionales ("si... entonces...") en lugar de absolutos?
✅ CHECK: ¿Un auditor independiente validaria estos numeros?

ANTI-PATRON 4: "Protagonist Amnesia" (Olvidar al Humano)
❌ Toda la narrativa habla de sistemas, nunca de personas
❌ Los stakeholders se mencionan en 01 y desaparecen
❌ El "dia a dia futuro" no tiene nombres ni perspectivas
✅ CHECK: ¿Hay al menos 1 perspectiva de stakeholder por hallazgo mayor?
✅ CHECK: ¿Los personajes de Acto 1 reaparecen en Acto 3?
✅ CHECK: ¿La narrativa genera empatia, no solo comprension?

ANTI-PATRON 5: "Orphan Threads" (Hilos Huerfanos)
❌ Se introduce un tema en un entregable y nunca se retoma
❌ Un hallazgo del AS-IS no aparece en Scenarios ni en Pitch
❌ Un riesgo mencionado en 03 no tiene mitigacion en 06
✅ CHECK: ¿Todo hilo introducido se resuelve antes de 09 Handover?
✅ CHECK: ¿La tabla de thread continuity tiene 0 huerfanos?
✅ CHECK: ¿Los callbacks apuntan a contenido real?

Si 2+ anti-patrones se detectan, revisar antes de entregar.
Si el anti-patron 2 (Fiction) se detecta, la narrativa no es valida — fundamentar con evidencia.
Si el anti-patron 3 (Fear-Mongering) se detecta, reescribir con tono factual.
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
