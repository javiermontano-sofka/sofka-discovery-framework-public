# Use Case Prompts — Input Analysis

> **Skill:** input-analysis | **Framework:** MetodologIA Discovery Framework
> **Author:** Javier Montaño | **Date:** March 13, 2026
> © Comunidad MetodologIA

---

## TL;DR

- 7 parameterized prompts covering the most frequent use scenarios of the input-analysis skill.
- Each prompt includes activation context, parameters, ready-to-use template, and expected output section.
- Designed for direct use by the discovery-conductor or any pipeline agent.

---

## UC-01: Full Input Analysis (5 Passes)

**Activation context:** Messy AND vague input — the text has significant surface errors and the intent is unclear. This is the most complete case: executes all 5 passes sequentially.

**When:** First message from a user in a discovery thread, especially when writing from mobile, in a hurry, or under stress.

**Parameterized prompt:**

```
Ejecuta input-analysis en modo integral sobre el siguiente input crudo.

INPUT: {INPUT_CRUDO}
CONTEXTO PREVIO: {CONTEXTO_HILO | "Sin contexto previo — cold-start"}
ADJUNTOS: {LISTA_ADJUNTOS | "Ninguno"}
IDIOMA: {es | en | mixed}
PROFUNDIDAD: {express | standard | deep}

Ejecutar los 5 pases en orden:
1. SUPERFICIE: Detectar y catalogar TODOS los errores de superficie. Tabla con: original, corregido, categoría (dislexia/afán/ortografía/puntuación/sintaxis/autocorrect/spanglish), patrón específico, confianza. Producir texto corregido preservando voz e intención.
2. 5 PORQUÉS: Excavar debajo de la solicitud superficial. Parar antes de 5 si la raíz es clara. Declarar preguntas abiertas, no adivinar.
3. 7 ENTONCES-QUÉS: Trazar impacto hacia adelante. Calibrar profundidad (standard/premium/flagship) según dónde pare la cadena.
4. INTENCIÓN: Listar declaraciones explícitas, señales implícitas, brechas por tipo (vocabulario/alcance/expertise/emocional/contexto). Formular el "real ask".
5. REFORMULACIÓN: Sintetizar en prompt estructurado con OBJETIVO, CONTEXTO, INTENCIÓN, RESTRICCIONES, OUTPUT ESPERADO, CALIBRACIÓN.

Incluir tabla resumen final y preguntas de clarificación si la confianza es < 80%.
```

**Expected output:**
- Tabla de correcciones de superficie con conteo por categoría
- Cadena de porqués con parada natural y preguntas abiertas
- Cadena de entonces-qués con calibración de profundidad
- Tabla de brechas de intención con "real ask"
- Prompt reformulado completo en formato estandarizado
- Tabla resumen: errores, causa raíz, impacto, calibración, brechas, confianza

---

## UC-02: Surface Cleanup (Pass 1 Only)

**Activation context:** Input with many writing errors but the intent is perfectly clear. The user knows what they want — they simply wrote fast, with active dyslexia, or from a device with an uncomfortable keyboard.

**When:** When the discovery-conductor detects surface noise but the request is direct and actionable.

**Parameterized prompt:**

```
Ejecuta input-analysis en modo superficie sobre el siguiente input.

INPUT: {INPUT_CRUDO}
IDIOMA: {es | en | mixed}

Ejecutar SOLO el Pase 1 (Superficie):
1. Detectar y catalogar errores de superficie en tabla con columnas: original, corregido, categoría, patrón, confianza.
2. Clasificar cada error en exactamente una categoría: dislexia, afán, ortografía, puntuación, sintaxis, autocorrect, spanglish.
3. Producir texto corregido completo.
4. Evaluar calidad del input original (MUY BAJA / BAJA / MEDIA / ALTA).
5. Distribución porcentual de errores por categoría.

REGLAS CRÍTICAS:
- Preservar intención al corregir — NUNCA cambiar significado.
- Preservar voz del usuario — corregir errores, no estilo.
- Anglicismos técnicos aceptados en contexto de software (deploy, sprint, legacy, feature, etc.) se mantienen — corregir solo su escritura si tiene errores.
- Si un error es ambiguo (confianza BAJA), señalarlo sin corregir.
```

**Expected output:**
- Tabla de correcciones completa
- Texto corregido
- Evaluación de calidad
- Distribución de errores por categoría

---

## UC-03: Verificación de Intención (Solo Pase 4)

**Contexto de activación:** Input limpio, bien escrito, sin errores de superficie — pero la solicitud es ambigua, vaga, o tiene múltiples interpretaciones posibles. La forma es correcta; la sustancia necesita análisis.

**Cuándo usar:** Input tipo "Ayúdame con el proyecto del banco" — claro sintácticamente, ambiguo semánticamente.

**Parameterized prompt:**

```
Ejecuta input-analysis en modo intención sobre el siguiente input.

INPUT: {INPUT_LIMPIO}
CONTEXTO PREVIO: {CONTEXTO_HILO | "Sin contexto previo"}
ADJUNTOS: {LISTA_ADJUNTOS | "Ninguno"}

Ejecutar SOLO el Pase 4 (Análisis de Intención):
1. DECLARACIONES EXPLÍCITAS: Listar cada declaración literal del usuario con interpretación directa.
2. SEÑALES IMPLÍCITAS: Identificar tono, elección de palabras, lo que NO dijo, estructura, referencias colgantes. Asignar confianza a cada señal.
3. BRECHAS DE INTENCIÓN: Tabla con tipo (vocabulario/alcance/expertise/emocional/contexto), lo explícito, lo implícito, y la brecha identificada.
4. REAL ASK: Formular lo que el usuario diría con claridad perfecta y vocabulario técnico preciso.
5. CONFIANZA GENERAL: Evaluar confianza en la interpretación (ALTA / MEDIA / BAJA).

Si la confianza es BAJA (< 60%), generar lista de preguntas de clarificación priorizadas por impacto en la interpretación.
Si la confianza es ALTA (> 80%), declarar que el input puede pasar al pipeline sin reformulación adicional.
```

**Expected output:**
- Lista de declaraciones explícitas con interpretación
- Tabla de señales implícitas con confianza
- Tabla de brechas de intención
- "Real ask" formulado
- Evaluación de confianza con recomendación (pasar / clarificar)

---

## UC-04: Descomposición de Multi-preguntas

**Contexto de activación:** El usuario envía un mensaje largo que contiene múltiples solicitudes, preguntas o temas mezclados en un solo bloque de texto. Cada sub-solicitud necesita su propio prompt reformulado.

**Cuándo usar:** Mensajes tipo "Necesito el análisis AS-IS, también revisar los stakeholders, y de paso ver si el roadmap tiene sentido con lo que dijo el CTO ayer."

**Parameterized prompt:**

```
Ejecuta input-analysis en modo descomposición sobre el siguiente input multi-pregunta.

INPUT: {INPUT_MULTI_PREGUNTA}
CONTEXTO PREVIO: {CONTEXTO_HILO | "Sin contexto previo"}
IDIOMA: {es | en | mixed}

Protocolo de descomposición:
1. IDENTIFICACIÓN: Identificar cada solicitud/pregunta/tema distinto dentro del input. Numerarlos.
2. CLASIFICACIÓN: Para cada sub-solicitud, determinar:
   - Skill de destino probable en el pipeline (asis-analysis, stakeholder-mapping, roadmap-poc, etc.)
   - Prioridad inferida (ALTA / MEDIA / BAJA) basada en urgencia y dependencias
   - Dependencias entre sub-solicitudes (¿alguna requiere que otra se complete primero?)
3. SUPERFICIE (si necesario): Aplicar Pase 1 a cada sub-solicitud individualmente.
4. REFORMULACIÓN INDIVIDUAL: Generar un prompt reformulado separado para cada sub-solicitud con formato OBJETIVO/CONTEXTO/INTENCIÓN/RESTRICCIONES/OUTPUT ESPERADO/CALIBRACIÓN.
5. SECUENCIA RECOMENDADA: Proponer orden de ejecución basado en dependencias y prioridad.

REGLA: Cada sub-solicitud debe ser autónoma — su prompt reformulado debe ser ejecutable sin necesitar los otros.
```

**Expected output:**
- Lista numerada de sub-solicitudes identificadas
- Tabla de clasificación (skill destino, prioridad, dependencias)
- Prompt reformulado independiente para cada sub-solicitud
- Secuencia de ejecución recomendada con justificación

---

## UC-05: Limpieza de Artefactos Voice-to-Text

**Contexto de activación:** Input generado por dictado de voz (Siri, Google Assistant, Whisper, etc.) que presenta artefactos típicos: capitalización random, puntuación ausente o errática, homofonía extrema, palabras insertadas por el modelo de voz.

**Cuándo usar:** Cuando el usuario indica que dictó el mensaje o cuando los patrones de error son consistentes con voice-to-text (capitalización errática + puntuación ausente + homofonía).

**Parameterized prompt:**

```
Ejecuta input-analysis en modo superficie con enfoque voice-to-text.

INPUT: {INPUT_DICTADO}
FUENTE: {siri | google | whisper | desconocida}
IDIOMA: {es | en | mixed}

Protocolo específico para voice-to-text:
1. DETECCIÓN DE ARTEFACTOS: Identificar errores específicos de dictado:
   - Homofonía: palabras que suenan igual pero significado diferente ("haber/a ver", "echo/hecho", "hay/ahí/ay", "baya/vaya/valla")
   - Capitalización errática: mayúsculas en medio de oración sin justificación
   - Puntuación insertada como texto: "punto", "coma", "punto y coma" escritos literalmente
   - Palabras fantasma: palabras insertadas por el modelo de voz que no corresponden a la intención
   - Fragmentación: oraciones cortadas donde el modelo pausó y reinició
   - Números y abreviaciones: "tres por ciento" vs "3%", "doctor" vs "Dr."
2. CORRECCIÓN CON ALTA CONFIANZA: Los artefactos de voice-to-text se corrigen con confianza ALTA porque son errores del sistema, no del usuario.
3. RECONSTRUCCIÓN: Producir texto limpio con puntuación natural, capitalización correcta, y homofonía resuelta por contexto.
4. VERIFICACIÓN: Señalar cualquier ambigüedad homofonía que no pueda resolverse sin contexto adicional.

NO ejecutar pases 2-5 a menos que el texto reconstruido revele ambigüedad de intención.
```

**Expected output:**
- Tabla de artefactos de voice-to-text detectados con categoría específica
- Texto reconstruido con puntuación y capitalización natural
- Lista de ambigüedades homofonías no resolubles (si las hay)
- Evaluación: ¿el texto reconstruido necesita pases adicionales?

---

## UC-06: Normalización de Spanglish

**Contexto de activación:** Input que mezcla español e inglés dentro de las mismas oraciones, común en equipos técnicos latinoamericanos que usan terminología de software en inglés pero comunican en español.

**Cuándo usar:** Mensajes tipo "Hay que fixear el bug del deployment pipeline porque el stakeholder del sprint review nos va a challenge."

**Parameterized prompt:**

```
Ejecuta input-analysis en modo superficie con enfoque spanglish.

INPUT: {INPUT_SPANGLISH}
CONTEXTO TÉCNICO: {dominio_técnico | "software general"}
POLÍTICA DE ANGLICISMOS: {preservar-técnicos | normalizar-todo | solo-señalar}

Protocolo de normalización spanglish:
1. CLASIFICACIÓN DE ANGLICISMOS: Para cada término en inglés, clasificar:
   - TÉCNICO ACEPTADO: Términos sin equivalente práctico en español (deploy, sprint, API, framework, legacy, frontend, backend, pipeline, cluster, microservicio). ACCIÓN: Preservar.
   - TÉCNICO CON ALTERNATIVA: Términos con equivalente español usable (bug → defecto, fix → corregir, challenge → cuestionar, feature → funcionalidad). ACCIÓN: Según política.
   - INNECESARIO: Anglicismos con equivalente directo obvio ("meeting" → reunión, "deadline" → fecha límite, "issue" → problema). ACCIÓN: Normalizar al español.
   - CONJUGADO: Verbo inglés conjugado en español ("fixear", "deployar", "commitear", "pushear"). ACCIÓN: Normalizar al verbo español equivalente.

2. TABLA DE NORMALIZACIÓN: Original, clasificación, acción tomada, resultado.

3. TEXTO NORMALIZADO: Producir versión limpia según la política de anglicismos seleccionada.

4. GLOSARIO CONTEXTUAL: Si el input tiene 5+ anglicismos, generar mini-glosario técnico para referencia del pipeline.

REGLA: NUNCA forzar español para terminología técnica donde el anglicismo es el estándar de la industria (API, SQL, REST, CI/CD, etc.).
```

**Expected output:**
- Tabla de clasificación de anglicismos (técnico aceptado / con alternativa / innecesario / conjugado)
- Texto normalizado según política seleccionada
- Mini-glosario contextual (si aplica)
- Estadística: proporción español/inglés original vs. normalizada

---

## UC-07: Detección y Separación de Estado Emocional

**Contexto de activación:** Input donde el usuario mezcla contenido técnico con señales emocionales (frustración, urgencia, inseguridad, presión, sarcasmo). La emoción contamina la solicitud técnica y necesita separarse para procesamiento limpio.

**Cuándo usar:** Mensajes tipo "Estoy harto de que nadie haga nada con el maldito sistema ese, necesito que POR FAVOR alguien me diga qué hacer antes de que el cliente nos mate."

**Parameterized prompt:**

```
Ejecuta input-analysis con enfoque en separación emoción-contenido.

INPUT: {INPUT_EMOCIONAL}
CONTEXTO PREVIO: {CONTEXTO_HILO | "Sin contexto previo"}
IDIOMA: {es | en | mixed}

Protocolo de separación emocional:
1. DETECCIÓN DE SEÑALES EMOCIONALES: Identificar marcadores de estado emocional:
   - FRUSTRACIÓN: Lenguaje fuerte, repetición, "nadie", "nunca", "siempre", "harto", exclamaciones
   - URGENCIA: Mayúsculas, "POR FAVOR", "URGENTE", "ya", "ahora", "antes de que"
   - INSEGURIDAD: Hedging ("creo que", "no sé si", "tal vez"), preguntas indirectas
   - PRESIÓN EXTERNA: Referencias a jefes, clientes, deadlines, consecuencias
   - SARCASMO/IRONÍA: Contradicciones tonales, exageración deliberada. NOTA: Marcar como intención incierta.

2. SEPARACIÓN: Producir dos versiones del input:
   - CONTENIDO TÉCNICO PURO: La solicitud despojada de carga emocional, preservando todos los datos y requisitos.
   - CONTEXTO EMOCIONAL: Las señales emocionales extraídas, con interpretación y nivel de intensidad (BAJA / MEDIA / ALTA / CRÍTICA).

3. RECOMENDACIÓN AL CONDUCTOR: Basado en la intensidad emocional:
   - BAJA: Proceder normalmente, incluir contexto emocional como metadata.
   - MEDIA: Proceder con tono empático en la respuesta, reconocer la situación.
   - ALTA: El conductor debe validar con el usuario antes de proceder — la emoción puede estar distorsionando la solicitud.
   - CRÍTICA: Escalar — el usuario puede necesitar soporte humano antes que técnico.

4. REFORMULACIÓN LIMPIA: Generar prompt reformulado del contenido técnico puro, con la metadata emocional como sección separada.

REGLA: NUNCA descartar la señal emocional — es dato valioso para el conductor. Separar, no eliminar.
```

**Expected output:**
- Lista de señales emocionales detectadas con categoría e intensidad
- Contenido técnico puro (despojado de carga emocional)
- Contexto emocional extraído con interpretación
- Recomendación al conductor con justificación
- Prompt reformulado con metadata emocional separada

---

## Matriz de Selección Rápida

| Situación del Input | UC Recomendado | Pases |
|---------------------|---------------|-------|
| Desordenado + vago | UC-01 Integral | 1-5 |
| Errores pero intención clara | UC-02 Superficie | 1 |
| Limpio pero ambiguo | UC-03 Intención | 4 |
| Múltiples preguntas mezcladas | UC-04 Descomposición | 1, 4, 5 |
| Dictado de voz | UC-05 Voice-to-Text | 1 |
| Spanglish técnico | UC-06 Spanglish | 1 |
| Cargado emocionalmente | UC-07 Emocional | 1, 4, 5 |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
© Comunidad MetodologIA
