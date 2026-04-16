# Prompts de Operaciones — MetodologIA Discovery Framework

> Rescate, auditoría y evolución de discoveries existentes.
> Estos prompts operan sobre entregables ya generados — requieren un discovery previo (parcial o completo).

---

## Rescatar Discovery Estancado

**Cuándo:** Un discovery se detuvo o perdió momentum. Entregables incompletos, pipeline roto, contexto disperso. Necesitas diagnosticar el estado real y restablecer la ruta.
**Dependencias:** ≥1 entregable previo en {RUTA} (puede estar incompleto).
**Criterio de aceptación:** Triage de entregables (completo/incompleto/faltante/corrupto), diagnóstico de punto de falla (qué falló y por qué), reparación de entregables incompletos, generación de faltantes críticos, pipeline restablecido con nuevo cronograma.
**Caso borde:** Si no hay ningún entregable previo, redirigir a run-auto en lugar de rescue.

```
/mao:rescue-stalled

Diagnosticar y rescatar discovery estancado en {RUTA}.
Triage de entregables: clasificar cada uno como completo/incompleto/faltante/corrupto.
Diagnóstico: identificar punto de falla y causa raíz.
Reparar entregables incompletos manteniendo consistencia con los existentes.
Generar entregables faltantes en ruta crítica.
Restablecer pipeline con cronograma actualizado y nuevo gate plan.
Si no hay entregables previos → recomendar /mao:run-auto en su lugar.

MODO=piloto-auto | FORMATO=markdown | PROFUNDIDAD=técnico
{RUTA}: .
```

---

## Auditar Calidad de Entregables

**Cuándo:** Discovery completo o parcial que necesita validación de calidad. Ideal antes de presentar al cliente o en checkpoint de revisión interna.
**Dependencias:** ≥3 entregables en {RUTA}.
**Criterio de aceptación:** Scorecard de calidad por entregable (10 criterios del excellence-loop), consistencia cruzada verificada (referencias entre entregables, datos que coinciden, conclusiones alineadas), gaps identificados con severidad, recomendaciones de mejora priorizadas por impacto.
**Trade-off:** Auditar es más rápido que regenerar, pero puede revelar que regenerar es necesario.

```
/mao:audit-quality

Auditoría de calidad sobre entregables en {RUTA}.
Scorecard por entregable (10 criterios: completitud, evidencia, consistencia,
trazabilidad, claridad, accionabilidad, formato, diagramas, cobertura, rigor).
Consistencia cruzada: verificar que datos, conclusiones y referencias entre
entregables son coherentes (sin contradicciones ni datos huérfanos).
Gaps: identificar ausencias con severidad (crítico/alto/medio/bajo).
Recomendaciones: priorizadas por impacto en calidad global del discovery.

MODO=piloto-auto | FORMATO=markdown
{RUTA}: .
```

---

## Mejorar Entregables Existentes

**Cuándo:** Entregables generados que necesitan evolución — más profundidad, mejor redacción, datos actualizados, o incorporar feedback del cliente.
**Dependencias:** Entregables existentes en {RUTA}.
**Criterio de aceptación:** Diagnóstico de debilidades por entregable, mejoras aplicadas (sin perder contenido valioso existente), consistencia cruzada mantenida post-mejora, changelog de cambios realizados.
**Límite:** No regenerar desde cero — evolucionar. Preservar estructura e insights existentes, enriquecer con valor adicional.

```
/mao:improve-deliverables

Evolucionar entregables existentes en {RUTA}.
Diagnosticar debilidades por entregable (profundidad, evidencia, formato, redacción).
Aplicar mejoras preservando contenido valioso — evolucionar, no reescribir.
Mantener consistencia cruzada post-mejora (actualizar referencias afectadas).
Generar changelog: [entregable] → [cambio realizado] → [justificación].
Si se incorpora feedback externo, etiquetar como [FEEDBACK_CLIENTE].

MODO=piloto-auto | FORMATO=markdown | PROFUNDIDAD=técnico
{RUTA}: .
```

---

## Simulación What-If

**Cuándo:** Necesitas proyecciones cuantitativas sobre escenarios alternativos. Útil para responder preguntas del tipo "¿qué pasa si...?" con datos, no intuición.
**Dependencias:** 05_Escenarios + 06_Roadmap (para variables base).
**Criterio de aceptación:** Variables de simulación declaradas con rangos, proyecciones Monte Carlo (P50/P80/P95) por escenario, análisis de sensibilidad (qué variables tienen mayor impacto), escenarios extremos (best case / worst case / most likely), recomendación basada en perfil de riesgo.
**Límite:** Simulación basada en estimaciones — no datos históricos reales. Etiquetar asunciones como [SUPUESTO] con nivel de confianza.

```
/mao:simulate-scenarios

Simulación Monte Carlo what-if sobre escenarios del discovery en {RUTA}.
Variables: declarar rangos (optimista/probable/pesimista) con justificación.
Proyecciones P50/P80/P95 por escenario simulado.
Sensibilidad: identificar top 5 variables con mayor impacto en resultado.
Escenarios extremos: best case, worst case, most likely con probabilidad.
Recomendación basada en perfil de riesgo (conservador/moderado/agresivo).
Asunciones etiquetadas [SUPUESTO] con nivel de confianza (alto/medio/bajo).

MODO=piloto-auto | FORMATO=markdown
{RUTA}: .
```

---

## Benchmark de Madurez

**Cuándo:** Comparar el estado actual del cliente contra estándares de industria reconocidos. Útil para justificar inversión mostrando el gap respecto a best practices.
**Dependencias:** 03_AS-IS o assessment específico como baseline.
**Criterio de aceptación:** Frameworks aplicados (CMMI, TMMi, DORA, DCAM — seleccionar los relevantes al contexto), score current state por dimensión, score target state justificado, gap analysis (current → target con esfuerzo estimado), comparativa con benchmarks de industria del mismo sector y tamaño, roadmap de madurez por dimensión.
**Trade-off:** Más frameworks ≠ mejor — seleccionar los 2–3 más relevantes al contexto del cliente.

```
/mao:benchmark-maturity

Benchmark de madurez del sistema en {RUTA} contra estándares de industria.
Frameworks: seleccionar 2–3 relevantes entre CMMI, TMMi, DORA, DCAM, ISO 25010.
Score current state por dimensión (evidencia del AS-IS o assessment).
Score target state con justificación (por qué ese nivel y no otro).
Gap analysis: current → target con esfuerzo estimado en FTE-meses.
Benchmarks de industria: comparar con empresas del mismo sector y tamaño.
Roadmap de madurez: priorizar dimensiones por valor de negocio.

MODO=piloto-auto | FORMATO=markdown | VARIANTE=técnica
{RUTA}: .
```
