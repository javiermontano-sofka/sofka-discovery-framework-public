# Metaprompts: cost-estimation

> 4 estrategias metacognitivas para mejorar la calidad de estimacion. Se aplican como capas de razonamiento sobre cualquier prompt de estimacion.

---

## Estrategia 1: Reference-Class Anchoring

**Proposito:** Mitigar la Planning Fallacy anclando toda estimacion en datos de proyectos similares antes de hacer estimacion bottom-up.

**Metaprompt:**

```
Antes de estimar este proyecto, ejecuta el siguiente protocolo de anclaje:

PASO 1 — OUTSIDE VIEW (antes de mirar el proyecto)
Identifica la clase de referencia: "Proyectos de {tipo} en {industria} con {tamano_equipo}
personas durante {duracion_tipica}."
Establece el rango base de la clase: {X-Y} FTE-meses.
Documenta la fuente del benchmark (experiencia previa, datos publicos, analogia).

PASO 2 — INSIDE VIEW (ahora mira el proyecto)
Haz la estimacion bottom-up normal (WBS → features → tres puntos → PERT).
Calcula el total bottom-up.

PASO 3 — RECONCILIACION
Compara outside view vs inside view.
Si divergen >30%: STOP. Investiga por que.
  - Si bottom-up > reference class: hay complejidad genuina no capturada en el benchmark?
  - Si bottom-up < reference class: estas siendo optimista? Revisaste todos los drivers?
Ajusta la estimacion final documentando el razonamiento.

PASO 4 — DOCUMENTACION DEL ANCLA
En el output final, incluye una seccion "Reference-Class Anchoring" que muestre:
- Clase de referencia usada
- Rango de la clase
- Estimacion bottom-up
- Divergencia y justificacion
- Estimacion final ajustada

REGLA: Si no puedes identificar al menos 3 proyectos similares como referencia,
declara la estimacion como "alta incertidumbre" y amplia los rangos 50%.
```

**Cuando aplicar:** En toda estimacion, especialmente en fase de concepto donde el Cone of Uncertainty es mas amplio.

---

## Estrategia 2: Probabilistic Ranges

**Proposito:** Eliminar la estimacion puntual y forzar el pensamiento en distribuciones de probabilidad.

**Metaprompt:**

```
Toda estimacion en este analisis DEBE expresarse como distribucion, no como punto.

PROTOCOLO DE RANGOS:

1. NUNCA escribas "el proyecto requiere X FTE-meses."
   SIEMPRE escribe "el proyecto requiere X-Y FTE-meses (P80: Z)."

2. Para cada feature/componente, genera tres estimaciones:
   - Optimista (O): "Si todo sale bien y no hay sorpresas"
   - Mas Probable (M): "El escenario realista con friccion normal"
   - Pesimista (P): "Si se materializan los riesgos principales"
   Calcula PERT = (O + 4M + P) / 6

3. Agrega las distribuciones (no solo los promedios):
   - P50: mediana de la simulacion — "es igualmente probable terminar antes o despues"
   - P80: percentil 80 — "80% de probabilidad de completar dentro de este rango"
   - P95: percentil 95 — "solo 5% de probabilidad de exceder este valor"

4. COMUNICA LA INCERTIDUMBRE EXPLICITAMENTE:
   - Coeficiente de variacion < 15%: "Estimacion de alta confianza"
   - Coeficiente de variacion 15-30%: "Estimacion con incertidumbre moderada"
   - Coeficiente de variacion > 30%: "Estimacion exploratoria — requiere refinamiento"

5. RECOMIENDA un percentil para planificacion:
   - Proyectos internos sin penalidad: P50
   - Proyectos con compromiso contractual: P80
   - Proyectos criticos con penalidades: P95

ANTI-PATRON: Si te descubres escribiendo un solo numero sin rango, DETENTE.
Eso no es estimacion — es adivinacion con confianza injustificada.
```

**Cuando aplicar:** Siempre. No existe contexto donde una estimacion puntual sea aceptable.

---

## Estrategia 3: Bottom-Up Validation

**Proposito:** Validar la consistencia interna de la estimacion verificando que las partes sumen coherentemente al todo.

**Metaprompt:**

```
Despues de completar la estimacion, ejecuta las siguientes validaciones cruzadas:

CHECK 1 — COHERENCIA WBS ↔ FTE-MESES
Suma todas las tareas del WBS (en dias-persona).
Convierte a FTE-meses (dias / 20).
Compara con el total declarado en la seccion de magnitud.
Tolerancia: ±10%. Si diverge mas, hay items faltantes o duplicados.

CHECK 2 — COHERENCIA EQUIPO ↔ TIMELINE
Equipo pico × duracion de fase = capacidad disponible en FTE-meses.
Compara con el esfuerzo requerido por fase.
Si esfuerzo > capacidad: el equipo esta subdimensionado o el timeline es irreal.
Si capacidad > esfuerzo × 1.3: el equipo esta sobredimensionado (desperdicio).

CHECK 3 — COHERENCIA RAMP-UP ↔ PRODUCTIVIDAD
FTE-meses nominales × factor de ramp-up = FTE-meses ajustados.
Si no aplicaste ramp-up, tus primeros 2 meses estan sobreestimados en productividad.
Nuevo equipo: ramp-up factor mes 1 = 0.5, mes 2 = 0.8, mes 3+ = 1.0.

CHECK 4 — COHERENCIA CONTINGENCIA ↔ RIESGO
Contingencia total debe estar entre 10-25% del esfuerzo base.
Si < 10%: probablemente subestimando riesgo (Planning Fallacy).
Si > 40%: la estimacion base es demasiado incierta — necesita mas descomposicion.
Margen de innovacion (5%) es ADICIONAL a la contingencia — verificar que esta separado.

CHECK 5 — COHERENCIA MONTE CARLO ↔ PERT
P50 de Monte Carlo debe estar dentro de ±15% de la suma PERT.
Si diverge significativamente, las distribuciones de input tienen problemas
(rangos demasiado amplios o asimetricos).

FORMATO DE REPORTE DE VALIDACION:
| Check | Esperado | Actual | Status | Accion |
|-------|----------|--------|--------|--------|
| WBS ↔ FTE | ±10% | X% | OK/WARN/FAIL | ... |
| Equipo ↔ Timeline | ratio 0.7-1.3 | X | OK/WARN/FAIL | ... |
| Ramp-up | aplicado | si/no | OK/WARN/FAIL | ... |
| Contingencia | 10-25% | X% | OK/WARN/FAIL | ... |
| MC ↔ PERT | ±15% | X% | OK/WARN/FAIL | ... |

Si hay 2+ FAILs: la estimacion requiere revision antes de entregarla.
```

**Cuando aplicar:** Como paso final antes de entregar cualquier estimacion. Es el "quality gate" interno del estimador.

---

## Estrategia 4: Anti-Patterns in Estimation

**Proposito:** Detectar y corregir errores comunes de estimacion antes de que contaminen el output.

**Metaprompt:**

```
Revisa la estimacion buscando estos anti-patrones. Si detectas alguno, corrige ANTES de entregar.

ANTI-PATRON 1: PRECISION FALSA
Sintoma: "El proyecto requiere exactamente 147.3 FTE-meses."
Problema: Precision numerica no implica exactitud. Un rango de 120-180 FTE-meses es mas
honesto y util que un punto falso de 147.3.
Correccion: Redondear a rangos significativos. Usar ordenes de magnitud apropiados al
nivel de incertidumbre.

ANTI-PATRON 2: ESTIMACION POR DISPONIBILIDAD (NO POR NECESIDAD)
Sintoma: "Tenemos 10 personas, asi que el proyecto dura 12 meses = 120 FTE-meses."
Problema: Estas estimando cuanto recurso tienes, no cuanto necesitas. Son cosas diferentes.
Correccion: Estima primero el esfuerzo necesario (bottom-up). Luego modela como el equipo
disponible lo ejecuta (puede resultar en mas o menos tiempo).

ANTI-PATRON 3: OMISION DE TAREAS NO-FUNCIONALES
Sintoma: WBS solo tiene features funcionales. No hay testing, devops, documentacion,
capacitacion, migracion de datos, deployment, soporte post-launch.
Problema: Las tareas no-funcionales tipicamente representan 30-50% del esfuerzo total.
Correccion: Checklist obligatorio de categorias no-funcionales:
  [ ] Testing (unitario, integracion, E2E, performance, seguridad)
  [ ] DevOps (CI/CD, ambientes, monitoring)
  [ ] Documentacion (tecnica, usuario, operaciones)
  [ ] Migracion de datos
  [ ] Capacitacion
  [ ] Deployment y cutover
  [ ] Soporte post-launch (hypercare)
  [ ] Project management overhead

ANTI-PATRON 4: ANCHORING AL PRESUPUESTO DEL CLIENTE
Sintoma: "El cliente tiene presupuesto para 6 meses, asi que estimamos 6 meses."
Problema: Estas anchoring al target del cliente, no estimando el esfuerzo real.
McConnell: "Una estimacion es una prediccion, no una negociacion."
Correccion: Estima independientemente del presupuesto. Si el esfuerzo real es mayor que
el presupuesto, presenta opciones: reducir scope, fases, MVP, etc.
NUNCA ajustar la estimacion para que "quepa" — ajustar el scope.

ANTI-PATRON 5: VELOCIDAD HEROICA
Sintoma: Las estimaciones asumen productividad pico constante, cero interrupciones,
cero reuniones, cero context switching.
Problema: Un desarrollador tiene ~5-6 horas productivas por dia de 8. El resto es
comunicacion, reunion, context switching, aprendizaje, impedimentos.
Correccion: Aplicar factor de productividad realista:
  - Developer individual: 0.7 (70% del dia es codigo productivo)
  - En equipo de 5-8: 0.6 (overhead de comunicacion)
  - En equipo de 10+: 0.5 (Brooks's Law)

ANTI-PATRON 6: IGNORAR EL CONE OF UNCERTAINTY
Sintoma: Estimacion con la misma precision en fase de concepto que en fase de diseno.
Problema: En concepto, la varianza real es 0.25x-4x. Dar un rango de ±10% en
esta fase es irresponsable.
Correccion: Ajustar los rangos al Cone of Uncertainty de la fase:
  - Concepto: 0.25x - 4x
  - Requisitos: 0.67x - 1.5x
  - Diseno: 0.80x - 1.25x
  - Construccion: 0.90x - 1.10x

FORMATO DE REPORTE DE ANTI-PATRONES:
Para cada anti-patron detectado, documenta:
- Cual anti-patron
- Donde se detecto en la estimacion
- Que correccion se aplico
- Impacto en el estimado final (FTE-meses ajustados)

Si detectas 3+ anti-patrones: la estimacion necesita re-trabajo fundamental, no parches.
```

**Cuando aplicar:** Como revision critica antes de entregar. Idealmente, ejecutada por un segundo estimador (peer review) o por el agente estimation-calibrator.

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
