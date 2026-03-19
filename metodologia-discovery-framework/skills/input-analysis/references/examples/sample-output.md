# Ejemplo Completo — Análisis de Input

> **Skill:** input-analysis | **Modo:** integral (5 pases)
> **Framework:** MetodologIA Discovery Framework
> **Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
> © Comunidad MetodologIA

---

## Análisis de Input

**Input original:**
> "ncsito q m ayuden cn el tema dl banco ese d la reunion xq el jefe sta presinando y no c q acer cn lo dl legasy ese q nadie entiende"

**Confianza general:** MEDIA
**Pases ejecutados:** 1, 2, 3, 4, 5
**Idioma detectado:** Español (informal, alta velocidad de escritura)
**Modo operacional:** integral — input desordenado y vago

---

### Pase 1: Análisis de Superficie

**Evaluación de calidad del input:** MUY BAJA — 14 errores de superficie detectados en una sola oración.

| # | Original | Corregido | Categoría | Patrón Específico | Confianza |
|---|----------|-----------|-----------|-------------------|-----------|
| 1 | ncsito | necesito | Afán | Vocales faltantes (e, e) | ALTA |
| 2 | q | que | Afán | Abreviación extrema de palabra función | MUY ALTA |
| 3 | m | me | Afán | Abreviación extrema de pronombre | MUY ALTA |
| 4 | cn | con | Afán | Vocales faltantes (o) | ALTA |
| 5 | dl | del | Afán | Vocales faltantes (e) | ALTA |
| 6 | d | de | Afán | Abreviación extrema de preposición | MUY ALTA |
| 7 | xq | porque | Afán | Patrón "x"="por" + "q"="que" | MUY ALTA |
| 8 | sta | está | Afán | Vocales faltantes (e) + tilde faltante | ALTA |
| 9 | presinando | presionando | Ortografía | Error fonético — "i" por "io" | ALTA |
| 10 | c | sé | Afán | Abreviación extrema de verbo | ALTA |
| 11 | q (2°) | qué | Afán | Repetición del patrón + tilde faltante | MUY ALTA |
| 12 | acer | hacer | Ortografía | H omitida — patrón de afán/fonética | ALTA |
| 13 | lo dl | lo del | Afán | Contracción con preposición | ALTA |
| 14 | legasy | legacy | Spanglish | Anglicismo con escritura fonética española | ALTA |

**Distribución de errores:**
- Afán / velocidad: 11 (79%)
- Ortografía: 2 (14%)
- Spanglish: 1 (7%)
- Puntuación: Ausencia total de puntos y comas (run-on sentence completa)

**Texto corregido (Pase 1):**
> "Necesito que me ayuden con el tema del banco, ese de la reunión, porque el jefe está presionando y no sé qué hacer con lo del legacy ese que nadie entiende."

**Nota:** Se preserva la estructura informal del usuario. Se agregaron comas para separar cláusulas y punto final. Se mantiene "legacy" como anglicismo técnico aceptado en el contexto de desarrollo de software.

---

### Pase 2: Cinco Porqués (Causa Raíz)

**Solicitud superficial:** "Necesito ayuda con el tema del banco, el del legacy."

**Cadena de porqués:**

| Nivel | Pregunta | Respuesta Inferida | Evidencia |
|-------|----------|--------------------|-----------|
| ¿Por qué 1? | ¿Por qué necesita ayuda con el legacy del banco? | Hay un sistema legado del cliente bancario que genera bloqueo en el equipo o en el discovery. | Señales: "nadie entiende" → el sistema es opaco; "ese de la reunión" → se discutió previamente sin resolución. |
| ¿Por qué 2? | ¿Por qué nadie entiende el sistema legacy? | El sistema carece de documentación, el conocimiento está concentrado en pocas personas, o la tecnología es obsoleta. | Señal: "legacy ese que nadie entiende" — frustración con opacidad del sistema. [INFERENCIA] |
| ¿Por qué 3? | ¿Por qué el jefe está presionando? | Hay un compromiso externo (entregable, reunión, deadline) que depende de avanzar con el análisis del legacy. | Señales: "el jefe está presionando" → presión de liderazgo; "de la reunión" → contexto de presentación/revisión próxima. |
| ¿Por qué 4? | ¿Por qué no sabe qué hacer? | Le falta una metodología o framework para abordar el análisis de un sistema opaco en contexto de discovery. | Señal: "no sé qué hacer" — no es incapacidad técnica sino falta de dirección estratégica. [INFERENCIA] |

**Parada natural en nivel 4.** El nivel 5 requeriría información sobre el contexto organizacional del cliente que no está disponible.

**Causa raíz identificada:**
> El usuario necesita una estrategia metodológica para analizar un sistema legacy opaco del cliente bancario, con urgencia por presión de liderazgo y una reunión próxima como deadline implícito.

**Preguntas abiertas:**
- ¿Cuál es la reunión referida? ¿Es con el cliente o interna?
- ¿Qué tipo de sistema legacy? ¿Core bancario, sistema auxiliar, integración?
- ¿Hay acceso al código/documentación del legacy, o solo conocimiento verbal?
- ¿El jefe es del equipo de discovery o del cliente?

---

### Pase 3: Siete Entonces-Qués (Trazado de Impacto)

**Si resolvemos la necesidad raíz del usuario, ¿qué impacto tiene?**

| Nivel | Entonces-Qué | Tipo de Impacto |
|-------|-------------|-----------------|
| Entonces-qué 1 | El equipo tendrá un enfoque claro para abordar el análisis del sistema legacy del banco. | Operativo — desbloqueo de equipo |
| Entonces-qué 2 | El discovery del cliente bancario podrá avanzar con el análisis AS-IS, que probablemente está bloqueado por la opacidad del legacy. | Operativo — progreso de engagement |
| Entonces-qué 3 | La reunión con el jefe (y posiblemente con el cliente) tendrá contenido sustantivo: hallazgos, riesgos, y camino a seguir. | Táctico — gestión de stakeholders |
| Entonces-qué 4 | La presión del jefe se reduce porque hay evidencia de avance y dirección clara. | Relacional — dinámica de equipo |
| Entonces-qué 5 | El engagement con el cliente bancario mantiene credibilidad — MetodologIA demuestra capacidad de abordar complejidad legacy. | Estratégico — relación comercial |
| Entonces-qué 6 | El análisis del legacy informa el roadmap de modernización, que probablemente es el entregable clave del discovery. | Estratégico — valor del engagement |

**Parada en nivel 6.** El nivel 7 sería especulativo sin conocer el contrato y alcance del engagement.

**Calibración de profundidad:** PREMIUM — la cadena alcanza impacto estratégico (nivel 5-6). La respuesta merece inversión significativa porque afecta la credibilidad comercial de MetodologIA con un cliente bancario.

---

### Pase 4: Análisis de Intención

#### Declaraciones Explícitas (lo que literalmente dijo)

1. "Necesito que me ayuden" → Solicitud de soporte, no de entregable específico.
2. "Con el tema del banco" → Referencia a un proyecto/cliente bancario conocido en el contexto del equipo.
3. "Ese de la reunión" → Referencia a una discusión previa donde se trató este tema.
4. "El jefe está presionando" → Presión jerárquica con urgencia temporal.
5. "No sé qué hacer" → Admisión de bloqueo, busca dirección.
6. "El legacy ese que nadie entiende" → Frustración con sistema opaco, sensación de que el problema es compartido.

#### Señales Implícitas (tono, estructura, omisiones)

| Señal | Interpretación | Confianza |
|-------|---------------|-----------|
| Escritura extremadamente abreviada | Urgencia real — está escribiendo rápido, probablemente bajo presión | ALTA |
| "nadie entiende" | Busca validación de que el problema no es solo suyo; posible frustración acumulada | MEDIA |
| "ese que" (doble uso de deícticos vagos) | No tiene vocabulario técnico preciso para describir el sistema, o no le importa en este momento | MEDIA |
| Ausencia de pregunta concreta | No sabe qué preguntar — el bloqueo es a nivel de enfoque, no de ejecución | ALTA |
| "no sé qué hacer" | Señal emocional: vulnerabilidad ante presión. No es solo técnico, hay componente de estrés | ALTA |

#### Brechas de Intención

| Tipo de Brecha | Explícito | Implícito | Brecha Identificada |
|----------------|-----------|-----------|---------------------|
| **Alcance** | "Ayuda con el tema del legacy" | Necesita estrategia completa de análisis | Subestima la complejidad — pide "ayuda" pero necesita un framework de abordaje |
| **Contexto** | "El de la reunión" | Hay un hilo previo con decisiones y compromisos | Referencias colgantes — sin acceso al contexto de la reunión, la skill opera con información parcial |
| **Emocional** | "El jefe está presionando" | Estrés, urgencia, posible frustración con falta de soporte | La solicitud técnica tiene un subtexto emocional: necesita dirección Y contención |
| **Vocabulario** | "Legacy ese" | Probablemente un core bancario o sistema transaccional con deuda técnica significativa | Usa "legacy" genéricamente — podría ser monolito, mainframe, sistema distribuido obsoleto |
| **Expertise** | "No sé qué hacer" | Sabe que hay un problema pero no tiene el marco metodológico para abordarlo | No es falta de capacidad técnica sino de marco de referencia para discovery de sistemas opacos |

#### Real Ask

> "Necesito una guía metodológica para realizar un análisis AS-IS de un sistema legacy del cliente bancario que tiene poca documentación y cuyo funcionamiento no está claro para el equipo. Tengo urgencia porque hay presión de liderazgo y probablemente una reunión próxima donde debo presentar avances. Idealmente, el resultado me da un enfoque paso a paso que pueda seguir y presentar."

---

### Pase 5: Reformulación

```
OBJETIVO: Generar una estrategia de análisis AS-IS para un sistema legacy
bancario opaco, con enfoque paso a paso que sea ejecutable por el equipo
y presentable a liderazgo.

CONTEXTO: Engagement de discovery con cliente del sector bancario. El equipo
enfrenta un sistema legacy que carece de documentación adecuada y cuyo
funcionamiento interno no está claro ("nadie entiende"). Hay presión de
liderazgo con una reunión próxima como deadline implícito. El usuario
experimenta bloqueo metodológico, no técnico.

INTENCIÓN: El usuario busca dirección estratégica y metodológica — un
framework para abordar la opacidad del legacy — no una solución técnica
inmediata. Subtexto emocional: necesita también contención y validación
de que el problema es abordable.

RESTRICCIONES:
- Urgencia temporal: hay presión de jefe y reunión próxima [EXPLÍCITO]
- Opacidad del sistema: poca/nula documentación del legacy [EXPLÍCITO]
- Contexto incompleto: no se conoce tipo de sistema, stack, ni alcance [BRECHA]
- Información de reunión previa no disponible [BRECHA]

OUTPUT ESPERADO: Guía de análisis AS-IS para sistemas legacy opacos con:
(1) pasos de exploración cuando no hay documentación, (2) técnicas de
ingeniería inversa para discovery, (3) template de hallazgos presentable
a liderazgo, (4) estimación de esfuerzo para el análisis completo.

CALIBRACIÓN: PREMIUM — impacto estratégico en la credibilidad de MetodologIA
con cliente bancario. Cadena de impacto alcanza nivel 6.
```

**Preguntas de clarificación sugeridas (para el conductor):**

Antes de ejecutar el skill downstream, el conductor debería validar:

1. ¿El sistema legacy es un core bancario, sistema auxiliar o integración?
2. ¿Hay acceso al código fuente, bases de datos, o solo a la interfaz?
3. ¿La reunión mencionada es interna (equipo MetodologIA) o con el cliente?
4. ¿Qué entregable se espera para esa reunión — avance informal o documento formal?
5. ¿Hay personas en el cliente que conozcan el sistema legacy (knowledge holders)?

---

## Resumen de Análisis

| Dimensión | Resultado |
|-----------|----------|
| Errores de superficie | 14 detectados (79% afán, 14% ortografía, 7% spanglish) |
| Causa raíz | Bloqueo metodológico para analizar legacy opaco bajo presión temporal |
| Profundidad de impacto | Nivel 6 — afecta credibilidad comercial de MetodologIA |
| Calibración | PREMIUM |
| Brechas principales | Alcance (subestimado), Contexto (reunión), Emocional (estrés) |
| Confianza en reformulación | MEDIA — requiere clarificación de 5 preguntas abiertas |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
© Comunidad MetodologIA
