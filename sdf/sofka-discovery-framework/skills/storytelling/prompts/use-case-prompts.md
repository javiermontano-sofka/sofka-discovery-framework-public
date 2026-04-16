# Use Case Prompts — Storytelling

> Prompts listos para usar en los casos de uso mas frecuentes de esta skill.
> Cada prompt incluye contexto de cuando usarlo, el prompt exacto, y el output esperado.

---

## 1. Cross-Deliverable Master Arc

**Cuando:** Inicio del discovery. Se necesita diseñar el arco narrativo que conectara todos los entregables (00-14) en una historia coherente.

**Output esperado:** Tabla con momento narrativo y frase guia por entregable + identificacion de los 5 hilos narrativos principales.

```
Diseñar el master narrative arc para el discovery de {CLIENTE}.

Contexto del proyecto:
- Industria: {INDUSTRIA}
- Sistema principal: {SISTEMA}
- Dolor principal: {DOLOR} (ej: "procesamiento lento de claims", "time-to-market de 6 meses")
- Stakeholders clave: {STAKEHOLDERS} (ej: "CTO, Gerente de Ops, Dev Lead")
- Vision del cliente: {VISION} (ej: "resolver claims en <48 horas")

Para cada entregable (00-14), definir:
1. Momento narrativo (una palabra: Compromiso, Voces, Revelacion, etc.)
2. Frase guia (una oracion que capture la esencia narrativa del entregable)

Ademas, identificar los 5 hilos narrativos principales:
- ¿Donde se introduce cada hilo? (entregable + evidencia)
- ¿Donde se desarrolla?
- ¿Donde se resuelve?

El arco debe tener tension maxima en 03 AS-IS, punto de decision en 05 Scenarios,
y resolucion en 08 Pitch / 09 Handover.

Tipo: cross-deliverable
Audiencia: mixed
```

---

## 2. Transformation Narrative (3 Actos)

**Cuando:** Al producir cualquier entregable que necesite un arco narrativo de transformacion: AS-IS, Scenarios, Pitch, o Hallazgos.

**Output esperado:** Narrativa de 3 actos (Current State → Decision Point → Future State) con cuantificacion, personalizacion, y evidence tags.

```
Construir una transformation narrative de 3 actos para {HALLAZGO_O_AREA}.

Acto 1 — Estado Actual (Dolor):
- Contextualizar: ¿Que equipo/proceso esta afectado?
- Cuantificar: ¿Cuales son las metricas actuales vs benchmark?
- Personalizar: ¿Que dice un stakeholder real sobre esta situacion?
- Datos disponibles: {DATOS} (ej: performance logs, entrevistas, JIRA analytics)

Acto 2 — Punto de Decision (Tension):
- Fork: ¿Que pasa si no se actua? Proyectar COI a 12, 24, 36 meses.
- Opciones: ¿Cuales son los caminos posibles?
- Evidencia: ¿Que datos guian la recomendacion?

Acto 3 — Estado Futuro (Resolucion):
- Vision: ¿Como se ve el dia a dia en 12-18 meses?
- Metricas: ¿Que numeros cambian y cuanto?
- Primer paso: ¿Que se hace el lunes?

Reglas:
- Cada afirmacion lleva evidence tag: [CODIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- Tono calibrado para audiencia: {AUDIENCIA} (executive / technical / mixed)
- No adornar — los datos son la historia

Tipo: transformation
Audiencia: {AUDIENCIA}
```

---

## 3. Scenario Narratives (Deliverable 05)

**Cuando:** Al producir el deliverable 05_Escenarios_ToT. Cada escenario necesita no solo scoring sino una narrativa vivida de ese futuro.

**Output esperado:** 3 scenario narratives con estructura "Imagine que en N meses..." + dia a dia vivido + como llegamos + que ganamos/costo/arriesgamos.

```
Para cada uno de los 3 escenarios del analysis de {SISTEMA}, construir una scenario narrative:

Escenario A ({NOMBRE_A}):
- Enfoque: {DESCRIPCION_A}
- Score: {SCORE_A}

Escenario B ({NOMBRE_B}):
- Enfoque: {DESCRIPCION_B}
- Score: {SCORE_B}

Escenario C ({NOMBRE_C}):
- Enfoque: {DESCRIPCION_C}
- Score: {SCORE_C}

Para CADA escenario, escribir:
1. "Imagine que estamos en {FECHA_FUTURA}..." — abrir con el futuro vivido
2. "Como es el dia a dia" — describir que hace un usuario/operador tipico
3. "Como llegamos aqui" — decisiones e inversiones clave
4. "Que ganamos" — beneficios cuantificados
5. "Que nos costo" — FTE-meses, trade-offs (NUNCA precios)
6. "Que arriesgamos" — riesgos y mitigaciones

Reglas:
- El escenario recomendado debe tener la narrativa mas vivida y detallada
- Los escenarios no recomendados deben ser honestos, no strawmen
- Usar perspectiva de stakeholders reales (nombres del 01_Stakeholder_Map)
- Evidence tags en cada afirmacion factual

Tipo: scenario
Audiencia: mixed
```

---

## 4. Risk Narrative (Pensamiento Consecuencial)

**Cuando:** Al construir narrativas de riesgo para AS-IS, Scenarios, o Pitch. El objetivo es cuantificar cascadas de consecuencias sin caer en alarmismo.

**Output esperado:** Cadena de consecuencias cuantificadas con timeline, punto de no retorno identificado, y tono factual.

```
Construir una risk narrative para el riesgo: "{RIESGO}".

Datos base:
- Metrica actual: {METRICA} = {VALOR_ACTUAL}
- Tendencia: {TENDENCIA} (ej: "+8% YoY", "4.2 issues criticos/trimestre")
- Capacidad actual: {CAPACIDAD} (ej: "equipo de 3 personas, capacidad maxima = X")
- Regulacion relevante: {REGULACION} (si aplica)

Construir la cascada:
1. ¿Que pasa en el proximo trimestre si no se actua?
2. ¿Que pasa en 6 meses?
3. ¿Que pasa en 12 meses?
4. ¿Cual es el punto de no retorno y cuando se estima?
5. ¿Que lo convierte en irreversible?

Reglas de tono:
- FACTUAL, no alarmista
- Cada paso de la cascada tiene evidence tag
- Cuantificar siempre que sea posible
- Usar condicionales ("si... entonces..."), no afirmaciones absolutas
- NUNCA: "El sistema colapsara"
- SI: "Con la tendencia actual de X, el equipo alcanzara capacidad maxima en QN"

Tipo: risk
Audiencia: {AUDIENCIA}
```

---

## 5. Success Reference Story (Analogia de Industria)

**Cuando:** Al construir credibilidad para una recomendacion. Usar cuando el sector-intelligence skill provee benchmarks de industria aplicables.

**Output esperado:** Historia breve de empresa comparable con dolor similar, enfoque similar, y resultados cuantificados.

```
Construir una success reference story para respaldar la recomendacion del Escenario {ESCENARIO}.

Contexto del cliente:
- Industria: {INDUSTRIA}
- Dolor: {DOLOR}
- Enfoque recomendado: {ENFOQUE}

Encontrar/construir una analogia:
- Empresa comparable en sector similar (puede ser anonimizada)
- Dolor similar al del cliente
- Enfoque similar al escenario recomendado
- Resultados cuantificados (metricas antes/despues)
- Timeline de implementacion

Estructura:
"[Empresa] enfrento [dolor similar]. Con [enfoque], logro [resultados cuantificados] en [plazo].
Nuestro escenario {ESCENARIO} sigue un patron similar, adaptado a [contexto del cliente]."

Incluir tabla: Metrica | Antes | Despues | Timeline

Reglas:
- Si la referencia es de conocimiento publico, citar fuente
- Si es anonimizada, indicar "[Empresa anonimizada, sector {X}]"
- Adaptar al contexto del cliente — no es copy-paste, es analogia
- [DOC] tag para fuentes verificables

Tipo: success
Audiencia: {AUDIENCIA}
```

---

## 6. Pitch Narrative (Call to Action)

**Cuando:** Al producir el deliverable 08_Pitch_Ejecutivo. Se necesita una narrativa que cierre el arco con urgencia y call to action.

**Output esperado:** Narrativa de 1-2 paginas que resume el arco completo, cuantifica la urgencia, y pide accion.

```
Construir la narrativa del Pitch para {CLIENTE}.

Inputs disponibles:
- Master Arc: {PATH_MASTER_ARC} (o resumen del arco)
- Hallazgos clave: {TOP_5_HALLAZGOS}
- Escenario recomendado: {ESCENARIO} con score {SCORE}
- COI (Cost of Inaction): {COI_RESUMEN}
- Timeline recomendado: {TIMELINE}

Estructura del pitch narrative:
1. HOOK (1 parrafo): El dato mas impactante del discovery. Algo que el steering committee no sabia y no puede ignorar.
2. JOURNEY (2-3 parrafos): Resumen del arco — que descubrimos, que aprendimos, que concluimos. Callbacks a entregables anteriores.
3. URGENCY (1 parrafo): COI cuantificado. "Cada dia/semana/mes que pasa..." con numero concreto.
4. VISION (1 parrafo): El futuro del Acto 3. Vivido, concreto, alcanzable.
5. ASK (1 parrafo): Exactamente que necesitamos del comite: aprobacion de escenario, presupuesto, recursos, timeline.

Reglas:
- Audiencia: C-level. CERO jerga tecnica sin traduccion.
- Cada afirmacion se puede trazar a un entregable previo (callback)
- El pitch no introduce informacion nueva — sintetiza todo el discovery
- Urgencia factual, no emocional

Tipo: transformation
Audiencia: executive
```

---

## 7. Thread Continuity Audit

**Cuando:** Al hacer review de multiples entregables completados. Se necesita verificar que los hilos narrativos son consistentes y ningun hilo queda huerfano.

**Output esperado:** Mapa de continuidad de hilos + lista de inconsistencias o hilos huerfanos detectados.

```
Auditar la continuidad narrativa de los entregables completados:

Entregables a auditar:
- {LISTA_ENTREGABLES} (ej: "00 Plan, 01 Stakeholders, 02 Brief, 03 AS-IS, 04 Flows")

Para cada entregable, identificar:
1. ¿Que hilos narrativos se INTRODUCEN? (nuevo tema, nuevo dolor, nueva evidencia)
2. ¿Que hilos se DESARROLLAN? (tema previo con nueva profundidad)
3. ¿Que hilos se RESUELVEN? (conclusion, recomendacion, accion)

Verificar:
- ¿Hay hilos introducidos que no se desarrollan en entregables posteriores? → HUERFANO
- ¿Hay afirmaciones en un entregable que contradicen otro? → INCONSISTENCIA
- ¿Hay callbacks que referencian contenido inexistente? → REFERENCIA ROTA
- ¿El tono es consistente entre entregables? → DESALINEACION DE TONO

Producir:
1. Tabla de continuidad: Hilo | Introducido | Desarrollado | Resuelto | Estado (OK / Huerfano / Inconsistente)
2. Lista de issues encontrados con prioridad (Critico / Importante / Menor)
3. Recomendaciones para resolver cada issue

Tipo: cross-deliverable
```

---

## 8. Multi-Audience Narrative Adaptation

**Cuando:** Se necesita la misma narrativa adaptada para diferentes audiencias. El mismo hallazgo se cuenta diferente al CTO, al CFO, y al equipo tecnico.

**Output esperado:** 3 versiones de la misma narrativa calibradas por audiencia.

```
Adaptar la siguiente narrativa para 3 audiencias:

Narrativa base: {NARRATIVA} (ej: transformacion del sistema de claims)
Hallazgo clave: {HALLAZGO} (ej: "40% del tiempo de ajustadores en tareas manuales")

VERSION EJECUTIVA (CFO/CEO):
- Liderar con impacto financiero
- Metricas de negocio: costo, revenue, NPS, compliance
- Maximo 1 pagina
- Sin jerga tecnica

VERSION TECNICA (CTO/Dev Lead):
- Liderar con root cause tecnico
- Metricas tecnicas: latency, throughput, coupling, debt index
- Profundidad ilimitada
- Jerga tecnica bienvenida

VERSION MIXED (Steering Committee):
- Liderar con impacto humano (stakeholder perspective)
- Metricas de negocio + contexto tecnico traducido
- 1-2 paginas
- Jerga tecnica traducida ("lo que significa para el negocio es...")

Para cada version:
- Misma historia, diferente vocabulario
- Misma evidencia, diferente enfasis
- Mismo call to action, diferente framing

Tipo: transformation
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
