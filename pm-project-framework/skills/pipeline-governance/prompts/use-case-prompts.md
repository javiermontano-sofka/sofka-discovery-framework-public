---
skill: pipeline-governance
type: use-case-prompts
version: 1.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Prompts de Caso de Uso — Pipeline Governance

Prompts listos para usar que activan el pipeline governance en escenarios específicos del ciclo de vida del discovery. Cada prompt incluye contexto de cuándo usarlo, el texto del prompt, y el formato de output esperado.

---

## Prompt 1: Inicializar Gobernanza al Arranque del Programa

**Nombre:** Program Charter Inicial

**Cuándo usar:** Al inicio de un discovery, antes de la Phase 0. Se necesita establecer el marco de gobernanza formal del programa.

**Prompt:**
```
Ejecutar pipeline-governance S1 para:

Proyecto: [NOMBRE_CLIENTE] — [NOMBRE_SISTEMA]
Fases en scope: [ej: 0, 1, 2, 3, 3b, 4, 4b, 5a, 5b, 6]
Variante: [full-pipeline / minimal / quick-reference]
Fecha de inicio: [FECHA]
Plazo objetivo de propuesta: [FECHA]
Decision makers: [LISTA DE STAKEHOLDERS CON ROLES EN GATES]

Producir:
1. Program Charter con scope declarado
2. Decision Rights Matrix (quién aprueba qué en cada gate)
3. Communication Plan (cadencia, canales, escalation)
4. Phase Dependency Map (Gantt con gates como milestones)

Formato: markdown
```

**Output esperado:** Sección S1 completa del `P-01_Program_Governance_{proyecto}.md` con charter, matriz de decisiones, plan de comunicación, y Gantt diagram del programa.

---

## Prompt 2: Evaluación Formal de Gate

**Nombre:** Gate Review Estructurado

**Cuándo usar:** Una fase acaba de completarse y necesitas evaluar formalmente el gate antes de autorizar el inicio de la siguiente fase.

**Prompt:**
```
Ejecutar pipeline-governance S2 — Gate Evaluation:

Gate: [G1 / G2 / G3 / Checkpoint-3b]
Proyecto: [NOMBRE_CLIENTE]
Fase completada: [NOMBRE Y NÚMERO]
Entregables producidos: [LISTAR ARCHIVOS]
Fecha de evaluación: [FECHA]

Evaluar contra los criterios del gate:
- Para cada criterio: estado (✅/⚠️/🔴) + evidencia específica
- Identificar dependencias resueltas y pendientes
- Listar riesgos que se transfieren a la siguiente fase
- Emitir veredicto: PASS / CONDITIONAL PASS / FAIL
- Si CONDITIONAL: listar condiciones específicas con fecha límite
- Si FAIL: proporcionar opciones de remediación con impacto en timeline

Formato: markdown
Modo: supervisado — presentar veredicto preliminar y esperar confirmación humana
```

**Output esperado:** Gate Evaluation Report completo con criterios verificados, cadena de evidencia, veredicto formal, y (si aplica) condiciones o opciones de remediación. El human-in-the-loop confirma el veredicto final.

---

## Prompt 3: Validación de Propuesta Pre-Envío (Proposal QA)

**Nombre:** QA Completo de Propuesta Antes de Entrega al Cliente

**Cuándo usar:** Las fases 5a y 5b están completadas, Gate 3 se acerca. Antes de presentar la propuesta al cliente, ejecutar la validación multidimensional.

**Prompt:**
```
Ejecutar pipeline-governance S5 — Proposal QA Validation:

Proyecto: [NOMBRE_CLIENTE] — [NOMBRE_SISTEMA]
Propuesta v1 — Validación Pre-Envío

Entregables a validar (cross-referencia entre todos):
- AS-IS: [ARCHIVO]
- Escenario aprobado: [ARCHIVO]
- Solution Roadmap: [ARCHIVO]
- Spec Funcional: [ARCHIVO]
- Executive Pitch: [ARCHIVO]
- Feasibility Verdict: [ARCHIVO]

Ejecutar las 4 dimensiones de QA:
1. Coherencia Técnica: roadmap vs AS-IS vs escenario aprobado
2. Completitud: todos los deliverables del manifest presentes y sustantivos
3. Viabilidad: lo que promete el pitch está respaldado por spec y roadmap
4. Alineación: la propuesta aborda los problemas del AS-IS

Emitir Proposal QA Scorecard con composite score.
Threshold: 3.5/5.0 compuesto, ninguna dimensión <3.

Formato: markdown
Modo: supervisado
```

**Output esperado:** Proposal QA Scorecard completo con scores por dimensión, hallazgos específicos, acciones requeridas (si hay dimensiones <4), veredicto compuesto, y estado "LISTA PARA ENVÍO: SÍ/NO".

---

## Prompt 4: Análisis de Impacto de Cambio de Alcance

**Nombre:** Scope Change Impact Assessment

**Cuándo usar:** Durante el engagement aparece un cambio de alcance (nuevo sistema en scope, requerimiento no declarado, cambio organizacional del cliente).

**Prompt:**
```
Ejecutar pipeline-governance S4 — Scope Change Impact Assessment:

Proyecto: [NOMBRE_CLIENTE]
Fase actual: [FASE]

Cambio de alcance detectado:
Descripción: [DESCRIBIR EL CAMBIO]
Origen: [CLIENTE / HALLAZGO TÉCNICO / CAMBIO ORGANIZACIONAL]
Fase donde se detectó: [FASE]

Evaluar:
1. Impacto en la fase actual (¿requiere rework?)
2. Fases downstream afectadas y magnitud del impacto
3. Impacto en el timeline (días adicionales estimados)
4. Impacto en el Assumptions Log (¿invalida supuestos existentes?)
5. Opciones de respuesta: absorber / deferir / sub-discovery
6. Recomendación con rationale

Registrar en Scope Change Log con todos los campos.
Formato: markdown
Modo: supervisado — esperar aprobación del usuario antes de actualizar el plan
```

**Output esperado:** Scope Change Impact Report con análisis de impacto por dimensión, tres opciones con trade-offs, recomendación fundamentada, y registro formalizado en el Scope Change Log.

---

## Prompt 5: RAG Dashboard Update

**Nombre:** Actualización del Dashboard de Estado del Programa

**Cuándo usar:** Después de cada phase completion, o cuando el stakeholder solicita una foto del estado actual del engagement.

**Prompt:**
```
Ejecutar pipeline-governance S6 — Dashboard Update:

Proyecto: [NOMBRE_CLIENTE]
Fecha de actualización: [FECHA]

Estado por fase:
| Fase | Status | Planned End | Actual/Forecast | Notas |
|------|--------|-------------|-----------------|-------|
| [FASE 0] | [✅/🔄/⏳] | [FECHA] | [FECHA] | [NOTAS] |
| [continuar para cada fase] |

Riesgos nuevos identificados:
- [RIESGO 1]
- [RIESGO 2]

Decisiones tomadas desde el último update:
- [DECISIÓN 1 — fecha — aprobada por]

Generar:
1. RAG Dashboard actualizado con semáforo por fase
2. Decision Log entries para las decisiones nuevas
3. Risk Burn-Down actualizado
4. Alerta si alguna fase tiene variance >2 días o está en rojo

Formato: markdown
```

**Output esperado:** Dashboard RAG actualizado con semáforo visual por fase, Decision Log con entradas nuevas, Risk Burn-Down actualizado, y (si aplica) alertas de desviación con recomendación de acción.

---

## Prompt 6: Detección de Bottleneck de Recursos

**Nombre:** Análisis de Capacidad y Bottlenecks del Comité

**Cuándo usar:** Cuando el pipeline tiene múltiples fases en paralelo o cuando un experto está siendo sobre-demandado, amenazando el timeline.

**Prompt:**
```
Ejecutar pipeline-governance S3 — Resource & Capacity Analysis:

Proyecto: [NOMBRE_CLIENTE]
Fases activas simultáneamente: [LISTAR]

Comité actual:
| Experto | Fase Actual | % Asignado | Próxima Fase Necesaria |
|---------|------------|------------|------------------------|
| [EXPERTO 1] | [FASE] | [%] | [FASE] |
| [continuar] |

Identificar:
1. Expertos con asignación >100% en algún período
2. Fases que dependen del mismo experto sin overlap
3. Skills no cubiertos por el comité actual
4. Opciones de redistribución o refuerzo del comité

Formato: markdown
```

**Output esperado:** Resource & Capacity Report con allocation matrix, identificación de bottlenecks con severidad (🔴/🟡/🟢), gaps de skills, y opciones de mitigación con impacto en timeline.

---

## Prompt 7: Verificación de Data Contract entre Fases

**Nombre:** Validar Contrato de Datos Antes de Iniciar Siguiente Fase

**Cuándo usar:** Una fase acaba de completar sus entregables. Antes de iniciar la siguiente fase, verificar que los outputs cumplen el data contract requerido.

**Prompt:**
```
Ejecutar pipeline-governance S4 — Data Contract Verification:

Proyecto: [NOMBRE_CLIENTE]
Transición: [FASE ORIGEN] → [FASE DESTINO]

Outputs de la fase origen:
- [OUTPUT 1]: [ARCHIVO] — [COMPLETO/PARCIAL/FALTANTE]
- [OUTPUT 2]: [ARCHIVO] — [COMPLETO/PARCIAL/FALTANTE]
- [continuar]

Verificar contra el Data Contract requerido para esta transición:
1. ¿Cada item del contrato está presente?
2. ¿Cada item tiene la profundidad mínima requerida (no stubs)?
3. ¿Hay items parciales que pueden pasarse como supuestos?
4. ¿Hay items faltantes que bloquean el inicio de la siguiente fase?

Emitir veredicto: CONTRATO CUMPLIDO / CONTRATO PARCIAL (con condiciones) / CONTRATO INCUMPLIDO (bloqueo)

Formato: markdown
```

**Output esperado:** Data Contract Verification Report con estado por item, análisis de suficiencia (¿el partial es aceptable?), veredicto de transición, y lista de supuestos si hay items parciales aceptados.

---

## Prompt 8: Generación de Lessons Learned Post-Engagement

**Nombre:** Retrospectiva de Governance y Mejoras para Próximos Discoveries

**Cuándo usar:** El engagement está completado (post-Gate 3 y handover). Momento de capturar aprendizajes del proceso de governance.

**Prompt:**
```
Ejecutar pipeline-governance S7 — Lessons Learned:

Proyecto: [NOMBRE_CLIENTE] — [NOMBRE_SISTEMA]
Duración total: [SEMANAS]
Variante ejecutada: [full/minimal/quick-reference]

Métricas del engagement:
- Cycle time por fase: [TABLA]
- Gate pass rate: [X de Y gates en primer intento]
- Proposal QA score final: [X.X/5.0]
- Issues detectados en QA vs post-envío: [NÚMEROS]
- Scope changes: [CANTIDAD] — [% del scope original]
- Supuestos no validados en propuesta final: [CANTIDAD]

Generar retrospectiva de governance:
1. ¿Qué funcionó bien? (por sección del skill)
2. ¿Qué no funcionó? (con causa raíz)
3. ¿Los gates atraparon los problemas correctos?
4. Recomendaciones de mejora para el próximo discovery
5. Patrones que deberían agregarse al template estándar

Formato: markdown
```

**Output esperado:** Lessons Learned Report con retrospectiva estructurada por sección, métricas comparadas contra benchmarks del framework, y recomendaciones accionables para el proceso de gobernanza en futuros engagements.

---
**Autor:** Javier Montaño | **© Comunidad MetodologIA** | **Actualización:** 13 de marzo de 2026
