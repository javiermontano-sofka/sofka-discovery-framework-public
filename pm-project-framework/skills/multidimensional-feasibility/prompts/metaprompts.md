# Metaprompts: multidimensional-feasibility

> 6 estrategias metacognitivas para auditar, optimizar y asegurar la calidad del protocolo Think Tank. Se aplican como capas de validación sobre cualquier output de factibilidad multidimensional.

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

---

## Estrategia 1: Evidence Strength Auditor

**Propósito:** Auditar la calidad y consistencia de los tags de evidencia en la Claim Evidence Matrix. Detectar claims sobre-confiadas o sub-etiquetadas.

**Metaprompt:**

```
Audita la calidad de evidencia en la Claim Evidence Matrix del Think Tank.

PROTOCOLO DE AUDITORÍA:

PASO 1 — INVENTARIO DE TAGS
Para cada claim, verifica:
- ¿Tiene al menos 1 tag de evidencia? (obligatorio)
- ¿El tag es correcto? (e.g., no etiquetar una opinión como [DOC])
- ¿El nivel de confianza (1-5) es coherente con los tags?
  - [CÓDIGO] o [CONFIG] = confianza mínima 4
  - [DOC] = confianza mínima 3
  - [INFERENCIA] = confianza máxima 3
  - [SUPUESTO] = confianza máxima 2
  - [STAKEHOLDER] = confianza máxima 3

PASO 2 — DETECCIÓN DE ANOMALÍAS
Identifica:
- Claims con confianza > 3 pero solo tags [INFERENCIA] o [SUPUESTO] (sobre-confiadas)
- Claims con confianza < 3 pero tags [CÓDIGO] o [CONFIG] (sub-confiadas)
- Claims sin tag alguno (violación del protocolo)
- Claims con tags contradictorios (e.g., [CÓDIGO] + [SUPUESTO] en la misma claim)

PASO 3 — RECOMENDACIONES
Para cada anomalía:
- Sugiere el nivel de confianza correcto
- Sugiere tags adicionales o corregidos
- Indica si la claim debería disparar un spike (confianza < 3 en claim crítica)

PASO 4 — SCORE DE CALIDAD
Calcula el Evidence Quality Score:
- % de claims con tags correctos y confianza coherente
- % de claims que requieren corrección
- Veredicto: APROBADO (>85%) / REQUIERE CORRECCIÓN (60-85%) / RECHAZADO (<60%)

REGLA: Este auditor NO modifica claims — solo diagnostica y recomienda.
```

**Cuándo aplicar:** Después de la fase de cross-validation, antes de la deliberación del Think Tank.

---

## Estrategia 2: Cross-Validation Gap Detector

**Propósito:** Identificar claims que no fueron cross-validadas entre sabios, revelando puntos ciegos en la deliberación.

**Metaprompt:**

```
Analiza la cobertura de cross-validation entre los 7 sabios del Think Tank.

PROTOCOLO DE DETECCIÓN DE GAPS:

PASO 1 — MATRIZ DE CROSS-VALIDATION
Construye una matriz 7x7 (sabio x sabio) que registre:
- ¿El sabio de la fila revisó alguna claim del sabio de la columna?
- ¿Se detectaron contradicciones?
- ¿Se reforzaron hallazgos?
Marca cada celda: ✅ (revisado, sin issues), ⚠️ (revisado, con contradicción),
🔴 (NO revisado — GAP).

PASO 2 — IDENTIFICACIÓN DE CLAIMS HUÉRFANAS
Una claim es "huérfana" si solo fue evaluada por 1 sabio y ningún otro la validó.
Lista todas las claims huérfanas y evalúa:
- ¿Es una claim crítica (impacta veredicto)?
- ¿Tiene confianza < 3?
- Si ambas: es un GAP CRÍTICO que invalida la calidad de la deliberación.

PASO 3 — CONTRADICCIONES NO RESUELTAS
Identifica claims donde 2 sabios llegan a conclusiones opuestas y la
contradicción no se resolvió en la deliberación.
Para cada contradicción:
- ¿Quién tiene mejor evidencia?
- ¿La contradicción debería disparar un spike?
- ¿Se documentó en el veredicto como disidencia?

PASO 4 — DIMENSIONES AISLADAS
Identifica dimensiones donde el sabio operó en silo total (0 cross-validations
recibidas, 0 dadas). Estas dimensiones son puntos ciegos sistémicos.

OUTPUT: Reporte de gaps con recomendaciones de cross-validation adicional.
```

**Cuándo aplicar:** Después del análisis individual, antes de la deliberación. Los gaps críticos deben resolverse antes de votar.

---

## Estrategia 3: Optimism Bias Detector

**Propósito:** Detectar sesgo optimista sistemático en el análisis de factibilidad. La Planning Fallacy de Kahneman aplica directamente al Think Tank.

**Metaprompt:**

```
Ejecuta detección de sesgo optimista sobre el análisis del Think Tank.

PROTOCOLO ANTI-OPTIMISMO:

PASO 1 — RATIO DE CLAIMS
Calcula:
- Total claims VALIDADAS vs NO VALIDADAS vs REFUTADAS
- Si > 80% son VALIDADAS: ALERTA de posible sesgo optimista.
  Un proyecto real raramente tiene > 70% de factibilidad sin condiciones.

PASO 2 — DISTRIBUCIÓN DE CONFIANZA
Analiza la distribución de niveles de confianza:
- Promedio de confianza > 4.0: ALERTA — ¿realmente hay tanta evidencia dura?
- Desviación estándar < 0.5: ALERTA — todos los sabios están de acuerdo
  en todo, lo cual es estadísticamente improbable en un análisis de 7 dimensiones.
- 0 claims con confianza 1: ALERTA — ¿no hay ningún supuesto sin validar?

PASO 3 — ANCHORING AL ESCENARIO
Verifica si el Think Tank está "anclado" al escenario que recibió:
- ¿Los sabios cuestionaron las premisas del escenario o las dieron por buenas?
- ¿Se exploraron modos de fallo no obvios?
- ¿Hay al menos 1 claim que diga "esto parece viable pero podría fallar por X"?
  Si no: los sabios están confirmando en lugar de investigando.

PASO 4 — TEST DEL DEVIL'S ADVOCATE
Para las 3 claims con mayor confianza, ejecuta:
"¿Qué tendría que ser verdad para que esta claim sea FALSA?"
Si no se puede articular un escenario de fallo, la claim es tautológica (no falsifiable)
y su confianza debería reducirse.

PASO 5 — REFERENCE-CLASS CHECK
¿El Think Tank comparó este proyecto con proyectos similares que FRACASARON?
Si solo se citaron ejemplos de éxito: sesgo de supervivencia confirmado.

OUTPUT:
- Optimism Bias Score (0-100, donde 100 = sesgo severo)
- Claims con sesgo detectado y ajuste recomendado
- Recomendación: ¿el veredicto necesita re-evaluación?
```

**Cuándo aplicar:** Siempre. Es el metaprompt más importante. Todo Think Tank que no pase este filtro tiene un vicio de origen.

---

## Estrategia 4: Conway's Law Alignment Checker

**Propósito:** Verificar que el análisis sistémico del sabio D3 realmente evaluó la alineación entre arquitectura propuesta y estructura organizacional.

**Metaprompt:**

```
Verifica la profundidad del análisis Conway en la dimensión sistémica.

CHECKLIST DE ALINEACIÓN:

1. MAPEO ARQUITECTURA → EQUIPOS
   □ ¿Se listaron todos los componentes/servicios de la arquitectura propuesta?
   □ ¿Se listaron todos los equipos actuales del cliente?
   □ ¿Se mapeó cada componente a un equipo responsable?
   □ ¿Se identificaron componentes sin equipo asignado? (= gap Conway)
   □ ¿Se identificaron equipos sin componente asignado? (= overhead)

2. TEAM TOPOLOGIES
   □ ¿Se clasificaron los equipos en los 4 tipos (stream, platform, enabling, complicated)?
   □ ¿Se evaluó cognitive load por equipo?
   □ ¿Se identificaron los modos de interacción actuales vs requeridos?
   □ ¿Se detectaron mismatches de interacción?

3. INVERSE CONWAY MANEUVER
   □ Si hay desalineamiento: ¿se propuso ICM?
   □ ¿Se evaluó la viabilidad del ICM con evidencia?
   □ ¿Se estimó el timeline y esfuerzo del ICM?
   □ ¿Se documentó la alternativa si ICM no es viable?

4. FEEDBACK LOOPS
   □ ¿Se identificó al menos 1 loop reforzante?
   □ ¿Se identificó al menos 1 loop balanceante?
   □ ¿Se evaluaron cascading failures organizacionales?

5. FAST FLOW METRICS
   □ ¿Se mencionaron métricas de velocidad del equipo (lead time, deploy freq)?
   □ ¿Se compararon métricas actuales vs requeridas por el diseño?

SCORING:
- 15/15 checks: Análisis Conway completo
- 10-14: Análisis aceptable con gaps menores
- < 10: Análisis Conway insuficiente — requiere profundización

OUTPUT: Score + gaps específicos + recomendación de profundización.
```

**Cuándo aplicar:** Después del análisis dimensional de D3. Si el score es < 10, el sabio sistémico debe profundizar antes de la deliberación.

---

## Estrategia 5: Spike Design Quality Checker

**Propósito:** Asegurar que los spikes recomendados por el Think Tank son accionables, específicos y tienen criterios binarios de éxito/fracaso.

**Metaprompt:**

```
Evalúa la calidad de diseño de cada spike en el Spike Catalog.

CRITERIOS DE CALIDAD POR SPIKE:

1. OBJETIVO (¿es específico y medible?)
   □ Describe exactamente qué se valida
   □ No es genérico ("validar la tecnología") sino específico ("validar latencia < 500ms con 2,400 reglas")
   □ Vinculado a una claim específica de la Evidence Matrix

2. CRITERIO DE ÉXITO (¿es binario?)
   □ Expresado como condición booleana (P95 < 500ms = éxito)
   □ Sin ambigüedad: cualquier persona puede evaluar si se cumplió o no
   □ Incluye métricas cuantitativas cuando aplica

3. CRITERIO DE FRACASO (¿está definido?)
   □ No es simplemente "lo contrario del éxito"
   □ Incluye condiciones de abandono temprano (si X, cancelar el spike antes del timebox)
   □ Define qué datos se necesitan recolectar incluso en caso de fracaso

4. TIMEBOX (¿es realista?)
   □ Expresado en días-persona (no en días calendario)
   □ Incluye composición del equipo (quién ejecuta)
   □ Es < 10 días-persona (un spike no es un proyecto)
   □ Es > 1 día-persona (un spike no es un smoke test)

5. ALTERNATIVA (¿existe Plan B?)
   □ Documenta qué hacer si el spike falla
   □ El Plan B es viable (no otro spike que requiere otro spike)
   □ El impacto del Plan B en timeline/costo está estimado

6. EVIDENCIA DE ORIGEN
   □ El spike está vinculado a claims con confianza < 3
   □ La razón de la incertidumbre está documentada
   □ No es un spike "por si acaso" sino uno con justificación específica

SCORING POR SPIKE:
- 6/6: Spike bien diseñado
- 4-5: Aceptable con mejoras menores
- < 4: Spike mal diseñado — rediseñar antes de ejecutar

OUTPUT: Score por spike + defectos específicos + sugerencias de mejora.
```

**Cuándo aplicar:** Antes de entregar el Spike Catalog al cliente. Un spike mal diseñado desperdicia el timebox y no resuelve la incertidumbre.

---

## Estrategia 6: Verdict Consistency Validator

**Propósito:** Verificar que el veredicto final del Think Tank es lógicamente consistente con los análisis dimensionales, las claims y los votos.

**Metaprompt:**

```
Valida la consistencia lógica del veredicto del Think Tank.

PROTOCOLO DE CONSISTENCIA:

PASO 1 — ARITMÉTICA DE VOTOS
□ ¿La suma de votos = 7? (a favor + en contra + abstención = 7)
□ ¿El veredicto refleja la mayoría? (5/7 para VIABLE CON CONDICIONES)
□ ¿La disidencia está documentada con argumentos y evidencia?
□ ¿Las abstenciones están justificadas?

PASO 2 — COHERENCIA VEREDICTO ↔ DIMENSIONES
Para cada dimensión:
□ ¿El voto del sabio es coherente con su análisis dimensional?
  (Un sabio que reporta TRL 6 con Valley of Death no puede votar "A FAVOR" sin condiciones)
□ ¿Las condiciones suspensivas cubren TODAS las dimensiones con voto condicional?
  (Si D1 votó "CONDICIÓN", debe existir al menos 1 CS vinculada a D1)

PASO 3 — COHERENCIA VEREDICTO ↔ CLAIMS
□ ¿Toda claim REFUTADA tiene impacto documentado en el veredicto?
  (Una claim refutada que no afecta al veredicto es sospechosa)
□ ¿Toda claim con confianza 1 tiene un spike asociado o está descartada?
□ ¿El Confidence Score (0-100) es calculable a partir de las confianzas individuales?
  Fórmula esperada: promedio ponderado de confianzas por criticidad de claim.
  ¿El score reportado es ± 5 puntos del calculado?

PASO 4 — COHERENCIA CONDICIONES ↔ SPIKES
□ ¿Cada condición suspensiva tiene al menos 1 mecanismo de validación (spike, workshop, etc.)?
□ ¿Cada spike está vinculado a al menos 1 condición suspensiva?
□ ¿No hay spikes "flotantes" (sin condición asociada)?

PASO 5 — COHERENCIA TEMPORAL
□ ¿El timebox total de spikes es compatible con el timeline del proyecto?
  (Si el proyecto arranca en 30 días y los spikes suman 45 días-persona, hay un problema)
□ ¿Las condiciones suspensivas tienen deadlines implícitos o explícitos?

PASO 6 — FALSABILIDAD DEL VEREDICTO
□ ¿Está claro bajo qué condiciones el veredicto se revertiría?
  (Un veredicto VIABLE CON CONDICIONES debe especificar: "si CS-1 falla, el veredicto
  se degrada a NO VIABLE")
□ ¿El veredicto es falseable o es un sello de aprobación irrevocable?
  Si es irrevocable: el veredicto no tiene valor.

OUTPUT:
- Consistency Score (0-100)
- Inconsistencias detectadas con gravedad (menor/mayor/crítica)
- Correcciones necesarias antes de emitir el veredicto
```

**Cuándo aplicar:** Antes de finalizar el veredicto. Si el Consistency Score es < 80, el veredicto requiere revisión antes de entrega.
