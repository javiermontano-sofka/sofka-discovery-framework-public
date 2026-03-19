# Meta-Prompts — Input Analysis

> **Skill:** input-analysis | **Framework:** MetodologIA Discovery Framework
> **Author:** Javier Montaño | **Date:** March 13, 2026
> © Comunidad MetodologIA

---

## TL;DR

- 5 meta-strategies that govern **how** and **when** to apply input-analysis passes.
- These are not direct execution prompts — they are orchestration strategies used by the conductor or the skill itself to make decisions.
- Each meta-prompt includes decision logic, activation signals, and application rules.

---

## MP-01: Depth Calibration

### Purpose

Determine how many passes to execute and at what intensity, avoiding both over-analysis of simple inputs and under-analysis of complex inputs. This is the most important meta-decision: the cost of over-analyzing is wasted time; the cost of under-analyzing is pipeline contamination.

### Decision Logic

```
EVALUAR input recibido contra las siguientes señales:

SEÑALES DE COMPLEJIDAD (cada una suma +1):
- Errores de superficie detectados > 5
- Ausencia total de puntuación
- Referencias colgantes ("eso", "lo de ayer", "el tema ese")
- Múltiples solicitudes mezcladas en un solo mensaje
- Señales emocionales detectadas (frustración, urgencia, presión)
- Vocabulario técnico usado incorrectamente
- Longitud > 100 palabras sin estructura
- Cold-start (primer mensaje, sin historial)
- Spanglish con mezcla de idiomas dentro de cláusulas

SEÑALES DE SIMPLICIDAD (cada una resta -1):
- Input < 15 palabras
- Pregunta directa con verbo de acción claro
- Vocabulario técnico preciso y consistente
- Puntuación adecuada
- Estructura sujeto-verbo-objeto reconocible
- Referencia explícita a un entregable o skill ("necesito el análisis AS-IS")
- Input es una confirmación o respuesta a pregunta del sistema

CÁLCULO:
  score = señales_complejidad - señales_simplicidad

DECISIÓN:
  score ≤ -2  → PASS-THROUGH: No ejecutar input-analysis. El input es claro.
  score = -1 a 1  → LIGERO: Solo Pase 4 (verificación de intención).
  score = 2 a 3  → STANDARD: Pases 1, 4, 5 (superficie + intención + reformulación).
  score = 4 a 5  → COMPLETO: Pases 1, 2, 4, 5 (incluir causa raíz).
  score ≥ 6  → INTEGRAL: Los 5 pases completos con máxima profundidad.

OVERRIDE:
  Si el usuario dice "solo haz X" → PASS-THROUGH independientemente del score.
  Si es el primer input de un discovery nuevo → mínimo STANDARD.
```

### Application Rules

1. Execute calibration BEFORE any pass. It is the first step of the skill.
2. Record the score and decision in the output for traceability.
3. If the conductor explicitly requests a mode (`integral`, `superficie`, `intencion`, `reformulacion`), respect the request and skip automatic calibration.
4. When in doubt between two levels, choose the deeper one. It is cheaper to over-analyze than to re-process due to under-analysis.

---

## MP-02: Dyslexia Pattern Detection in Spanish

### Purpose

Identify with high confidence writing patterns that originate from dyslexia, differentiating them from errors due to speed (haste), orthographic ignorance, or device artifacts. The difference matters because dyslexia patterns are consistent and predictable — once identified, correction confidence increases significantly.

### Detection Patterns

```
ANALIZAR el input buscando las siguientes señales en orden de confianza:

SEÑALES DE ALTA CONFIANZA (≥ 2 presentes → patrón de dislexia probable):

1. INVERSIONES DE LETRAS VISUALMENTE SIMILARES:
   - b ↔ d: "bato" por "dato", "bueno" escrito "dueno"
   - p ↔ q: infrecuente en español, más común en inglés
   - m ↔ n: "camino" escrito "canimo"
   - u ↔ n: "uno" escrito "nuo" (similitud visual en manuscrito/minúscula)

2. TRANSPOSICIONES ADYACENTES CONSISTENTES:
   - Letras contiguas intercambiadas: "perro" → "preo", "trabajo" → "tarbajo"
   - Si el mismo tipo de transposición aparece 2+ veces en el mensaje → ALTA confianza
   - Diferencia con typo: el typo es aleatorio, la transposición disléxica tiende
     a repetir el mismo tipo de error

3. OMISIÓN SISTEMÁTICA DE VOCALES:
   - No confundir con abreviación intencional de afán (q, xq, dl)
   - Dislexia: omite vocales DENTRO de palabras largas pero intenta escribir
     la palabra completa ("prgrama" por "programa", "prsonal" por "personal")
   - Afán: abrevia palabras función (preposiciones, conjunciones, pronombres)

4. CONFUSIÓN DE HOMOFONÍA CONSISTENTE:
   - a ver / haber — error en AMBAS direcciones en el mismo texto
   - hay / ahí / ay — uso intercambiable
   - hecho / echo — sin distinción
   - Si el mismo tipo de confusión aparece 2+ veces → no es descuido puntual

SEÑALES DE CONFIANZA MEDIA (complementan pero no confirman solas):

5. Omisión inconsistente de la H:
   - "acer" por "hacer", "oy" por "hoy", pero "historia" escrito correctamente
   - La inconsistencia sugiere procesamiento fonológico, no ignorancia

6. Errores de segmentación:
   - Palabras pegadas: "esque" por "es que", "aveces" por "a veces"
   - Palabras cortadas: "en tonces" por "entonces"

7. Escritura espejo de sílabas:
   - "sol" → "los" (raro en adultos pero detectable)
   - "pal" → "lap" (más frecuente en contexto técnico: "laptop"/"laptpo")

PROTOCOLO DE ACCIÓN:

  SI señales_alta_confianza ≥ 2:
    - Clasificar errores como "Dislexia" (no como "Ortografía" ni "Afán")
    - Aplicar correcciones con confianza ALTA
    - NO hacer referencia a dislexia en el output dirigido al usuario
    - Registrar el patrón internamente para mejorar correcciones futuras
      en el mismo hilo

  SI señales_alta_confianza = 1 AND señales_media ≥ 2:
    - Clasificar como "Dislexia (probable)"
    - Aplicar correcciones con confianza MEDIA-ALTA
    - Monitorear en mensajes siguientes para confirmar patrón

  SI señales_alta_confianza = 0:
    - No clasificar como dislexia — usar categorías estándar
      (afán, ortografía, typo)
```

### Critical Rules

1. NEVER mention "dyslexia" in user-facing outputs. It is an internal classification to improve correction quality.
2. NEVER condescend. Dyslexia patterns do not indicate intellectual deficit.
3. Dyslexia detection raises correction confidence because errors are predictable — this is an advantage, not a stigma.
4. In a long thread, if the dyslexia pattern is confirmed in the first 2-3 messages, proactively apply corrections in subsequent messages without re-analyzing from scratch.

---

## MP-03: Emotion-Content Separation

### Purpose

Isolate the emotional charge from technical content in an input so the downstream pipeline receives clean information, while the conductor retains the emotional context as metadata for managing the relationship with the user.

### Separation Logic

```
ESCANEAR el input buscando MARCADORES EMOCIONALES:

MARCADORES LÉXICOS:
- Amplificadores: "siempre", "nunca", "nadie", "todo el mundo", "otra vez"
- Intensificadores: "maldito", "bendito", "dichoso", "famoso" (irónico)
- Urgencia: "URGENTE", "YA", "AHORA", mayúsculas sostenidas
- Hedging: "creo que", "no sé si", "tal vez", "quizás", "a lo mejor"
- Frustración: "harto", "cansado de", "no aguanto", "qué carajo"
- Presión externa: "el jefe", "el cliente", "nos van a", "antes de que"

MARCADORES ESTRUCTURALES:
- Puntuación emocional: múltiples signos (!!!, ???, !!!???)
- Mayúsculas sostenidas en fragmentos (no todo-mayúsculas, que es afán de teclado)
- Repetición de palabras o frases para énfasis
- Oraciones cada vez más cortas al final del mensaje (escalada emocional)

MARCADORES CONTEXTUALES:
- Contraste con mensajes anteriores del mismo usuario (cambio de tono)
- Referencias a consecuencias negativas ("nos van a cortar", "vamos a perder")
- Auto-referencia negativa ("soy un desastre", "no sirvo para esto")

PROTOCOLO DE SEPARACIÓN:

  1. EXTRAER capa emocional:
     - Listar cada marcador emocional con su categoría
     - Evaluar INTENSIDAD: BAJA (frustración leve) / MEDIA (estrés visible) /
       ALTA (frustración significativa) / CRÍTICA (posible crisis emocional)
     - Formular INTERPRETACIÓN: qué emoción expresa y por qué

  2. PRODUCIR contenido técnico puro:
     - Eliminar marcadores emocionales del texto
     - Preservar TODOS los datos, requisitos y restricciones
     - Reconstruir oraciones si la eliminación las rompe sintácticamente
     - El contenido técnico puro debe ser procesable por cualquier skill
       sin contexto emocional

  3. GENERAR metadata emocional:
     - Emoción dominante + intensidad + interpretación
     - Recomendación para el conductor:
       * BAJA → Incluir como contexto, proceder normalmente
       * MEDIA → Tono empático en respuesta, reconocer situación
       * ALTA → Conductor valida antes de proceder — emoción puede
         distorsionar la solicitud real
       * CRÍTICA → Escalar a interacción humana directa

  4. VINCULAR contenido y emoción:
     - Señalar dónde la emoción MODIFICA el contenido técnico
       (ej: "urgente" cambia la prioridad real del entregable)
     - Señalar dónde la emoción es RUIDO que no afecta el contenido
       (ej: "maldito sistema" no cambia qué sistema es)
```

### Critical Rules

1. NEVER discard the emotional signal. Separating is not eliminating — emotion is data for the conductor.
2. NEVER psychologize the user. Do not diagnose, do not interpret beyond what signals support.
3. Emotion can be LEGITIMATE DATA: if the user says "I'm under a lot of pressure," that is a real constraint (deadline) disguised as emotion.
4. At CRITICAL intensity, the priority is the person, not the deliverable.

---

## MP-04: Pipeline Reformulation

### Purpose

Optimize the reformulated prompt (Pass 5) specifically for consumption by the MetodologIA Discovery Framework pipeline skills, ensuring the output is immediately actionable by the discovery-orchestrator without additional interpretation.

### Optimization Protocol

```
DESPUÉS de completar los Pases 1-4, ANTES de generar el prompt reformulado:

1. IDENTIFICAR SKILL DE DESTINO:
   Mapear la intención del usuario al skill más probable del pipeline:

   | Señal en el Input | Skill de Destino |
   |-------------------|------------------|
   | "plan", "planificar", "alcance" | discovery-plan |
   | "stakeholders", "interesados", "RACI" | stakeholder-mapping |
   | "resumen", "brief", "ejecutivo" | brief-tecnico |
   | "AS-IS", "estado actual", "legacy", "diagnóstico" | asis-analysis |
   | "flujos", "procesos", "DDD", "eventos" | flow-mapping |
   | "opciones", "escenarios", "alternativas" | scenario-analysis |
   | "roadmap", "fases", "plan de ruta" | roadmap-poc |
   | "especificación", "requisitos", "casos de uso" | functional-spec |
   | "pitch", "presentación", "caso de negocio" | pitch-ejecutivo |
   | "transición", "handover", "90 días" | handover-ops |
   | Ambiguo / múltiple | discovery-orchestrator (para ruteo) |

2. AJUSTAR FORMATO AL SKILL DE DESTINO:
   Cada skill espera ciertos datos. Incluir explícitamente:

   - PARA asis-analysis: tipo de sistema, stack conocido/inferido,
     acceso a código/DB/documentación, personas de referencia
   - PARA stakeholder-mapping: nombres/roles mencionados,
     estructura organizacional inferida, relaciones de poder detectadas
   - PARA scenario-analysis: restricciones explícitas,
     criterios de decisión mencionados, preferencias del usuario
   - PARA roadmap-poc: horizonte temporal, presupuesto/recursos
     mencionados, dependencias externas
   - PARA pitch-ejecutivo: audiencia objetivo, tono requerido,
     métricas de éxito mencionadas

3. INCLUIR METADATA DE PIPELINE:
   Al final del prompt reformulado, agregar bloque de metadata:

   ```
   ---
   METADATA_PIPELINE:
     skill_destino: {skill identificada}
     skill_alternativa: {si hay ambigüedad}
     calibracion: {standard | premium | flagship}
     confianza_reformulacion: {ALTA | MEDIA | BAJA}
     preguntas_abiertas: {número}
     pases_ejecutados: [1, 2, 3, 4, 5]
     emocional_intensidad: {BAJA | MEDIA | ALTA | CRÍTICA | null}
     cold_start: {true | false}
   ```

4. VALIDACIÓN PRE-ENVÍO:
   Antes de enviar al pipeline, verificar:
   - [ ] El prompt reformulado tiene OBJETIVO con verbo de acción
   - [ ] CONTEXTO incluye todo lo descubierto en Pases 2-3
   - [ ] RESTRICCIONES incluye tanto explícitas como inferidas (etiquetadas)
   - [ ] OUTPUT ESPERADO especifica tipo de entregable, no solo el tema
   - [ ] Ambigüedades no resolubles están declaradas, no ocultas
   - [ ] La metadata de pipeline está completa
   - [ ] El prompt es autónomo — un agente que lo recibe puede actuar
     sin leer el input original
```

### Critical Rules

1. The reformulated prompt is a CONTRACT with the downstream skill. It must be precise, complete, and autonomous.
2. If reformulation confidence is LOW, include open questions WITHIN the prompt as an explicit section — not as a footnote.
3. NEVER add requirements that the user did not express or imply. Clarifying is acceptable; inventing is unacceptable.
4. Pipeline metadata is mandatory — it allows the orchestrator to make routing decisions without re-analyzing.

---

## MP-05: Cross-Validation of Intent

### Purpose

When there are multiple possible interpretations of the input, this meta-prompt implements a cross-validation process that contrasts the detected intent against different sources of evidence to converge on the most probable interpretation.

### Cross-Validation Protocol

```
ACTIVAR cuando:
- El Pase 4 produce ≥ 2 interpretaciones plausibles con confianza similar
- Hay contradicción entre lo explícito y lo implícito
- El contexto previo sugiere una intención diferente a la del mensaje actual
- Cold-start con input ambiguo

FUENTES DE VALIDACIÓN (usar todas las disponibles):

1. EVIDENCIA TEXTUAL DIRECTA:
   - Palabras y frases que soportan cada interpretación
   - Cuantificar: ¿cuántas señales textuales soportan interpretación A vs B?
   - Peso: ALTO

2. CONTEXTO DEL HILO:
   - Mensajes anteriores del usuario en la misma conversación
   - Tema dominante del hilo
   - Evolución de la solicitud (¿se ha refinado? ¿ha cambiado dirección?)
   - Peso: ALTO (si disponible), NULL (en cold-start)

3. CONTEXTO DEL PIPELINE:
   - ¿En qué fase del discovery estamos?
   - ¿Qué entregables ya se generaron?
   - ¿Qué skills ya se ejecutaron?
   - Si estamos en fase de AS-IS, un input ambiguo probablemente se refiere
     a análisis de estado actual, no a roadmap
   - Peso: MEDIO

4. PERFIL DEL USUARIO:
   - ¿Es técnico o no técnico? (inferido del vocabulario)
   - ¿Escribe formal o informalmente? (inferido del estilo)
   - ¿Tiende a ser específico o vago? (inferido del historial)
   - Peso: BAJO (solo complementa)

5. PLAUSIBILIDAD PRAGMÁTICA:
   - ¿Tiene sentido esta interpretación en el contexto de un discovery de MetodologIA?
   - ¿Es una solicitud que un miembro del equipo de pre-sales haría?
   - ¿El skill de destino inferido puede resolver lo que esta interpretación pide?
   - Peso: MEDIO

PROCESO DE CONVERGENCIA:

  PARA CADA interpretación candidata:
    1. Evaluar soporte en cada fuente (FUERTE / DÉBIL / CONTRADICE / N/A)
    2. Calcular peso ponderado:
       peso_total = (textual × 3) + (hilo × 3) + (pipeline × 2) + (perfil × 1) + (pragmática × 2)
    3. Normalizar a porcentaje

  SI la interpretación ganadora tiene > 70% de soporte ponderado:
    → Adoptar con confianza ALTA
    → Documentar evidencia de soporte
    → Proceder a reformulación

  SI la interpretación ganadora tiene 50-70%:
    → Adoptar con confianza MEDIA
    → Incluir interpretación alternativa como nota
    → Sugerir pregunta de clarificación al conductor

  SI ninguna interpretación supera 50%:
    → Confianza BAJA
    → Presentar las 2-3 interpretaciones candidatas al conductor
    → Generar prompt reformulado para la más plausible pragmáticamente
    → Marcar como "requiere validación antes de enviar al pipeline"

FORMATO DE OUTPUT DE VALIDACIÓN CRUZADA:

  | Interpretación | Textual | Hilo | Pipeline | Perfil | Pragmática | Total |
  |----------------|---------|------|----------|--------|------------|-------|
  | A: [descripción] | FUERTE | N/A | DÉBIL | DÉBIL | FUERTE | 64% |
  | B: [descripción] | DÉBIL | N/A | FUERTE | FUERTE | FUERTE | 58% |

  Decisión: Interpretación A con confianza MEDIA.
  Pregunta de clarificación: "..."
```

### Critical Rules

1. Cross-validation is a process of EVIDENCE, not opinion. Each evaluation (STRONG/WEAK/CONTRADICTS) must be grounded in concrete signals.
2. In cold-start, sources 2 (thread) and 4 (profile) are unavailable. Validation rests on textual evidence + pragmatic plausibility. Accept inherently lower confidence.
3. NEVER force a winning interpretation if evidence does not support it. It is preferable to declare uncertainty and ask for clarification than to commit to an incorrect interpretation.
4. Document the cross-validation process in the output when final confidence is MEDIUM or LOW — the conductor needs to see the evidence to make the decision.
5. If the user self-corrects mid-message ("no, better..." / "well, actually..."), use the final version as primary intent. User corrections are the strongest possible signal.

---

## Meta-Prompt Activation Matrix

| Situation | MP-01 Calibration | MP-02 Dyslexia | MP-03 Emotion | MP-04 Pipeline | MP-05 Validation |
|-----------|-------------------|----------------|---------------|----------------|-----------------|
| First input in thread | Always | If signals present | If signals present | Always | If ambiguous |
| Clean and clear input | Always (will result in pass-through) | No | No | If passing to pipeline | No |
| Messy input | Always | Evaluate | Evaluate | Always | If ambiguous post-correction |
| Emotional input | Always | If signals present | Always | Always | Frequent (emotion distorts) |
| Multiple interpretations | Always | Not relevant | Evaluate | After validation | Always |

---

**Author:** Javier Montaño | **Last updated:** March 13, 2026
© Comunidad MetodologIA
