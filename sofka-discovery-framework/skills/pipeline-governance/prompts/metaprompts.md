---
skill: pipeline-governance
type: metaprompts
version: 1.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Metaprompts — Pipeline Governance

Plantillas para generar prompts personalizados de gobernanza según el contexto del engagement. Cada metaprompt incluye el propósito, la plantilla con marcadores de posición, y una guía de uso.

---

## Metaprompt 1: Generador de Program Charter Personalizado

**Propósito:** Crear el prompt de inicialización de gobernanza adaptado al tamaño, complejidad, y restricciones del engagement específico, eligiendo el nivel de gobernanza proporcional al riesgo.

**Plantilla:**
```
Necesito inicializar la gobernanza para el siguiente engagement. Genera el prompt completo para el skill pipeline-governance.

CONTEXTO DEL PROGRAMA:
- Cliente: {NOMBRE_CLIENTE}
- Sistema(s) en scope: {SISTEMAS}
- Variante de pipeline: {FULL / MINIMAL / QUICK_REFERENCE}
- Duración estimada: {SEMANAS}
- Stakes del engagement: {BAJO / MEDIO / ALTO / MUY_ALTO}
  (ALTO = propuesta >$500K o transformación core del negocio del cliente)

EQUIPO DE DECISIÓN:
- Sponsor ejecutivo: {ROL Y NOMBRE}
- Decision makers en gates: {LISTA_CON_ROL_POR_GATE}
- Expertos disponibles del comité: {LISTA}
- Bottleneck conocido: {EXPERTO_CON_BAJA_DISPONIBILIDAD}

RESTRICCIONES DE GOVERNANCE:
- ¿El cliente requiere reportes formales de avance?: {SÍ/NO/FRECUENCIA}
- ¿Hay restricciones contractuales sobre los gates?: {SÍ/NO/DESCRIPCIÓN}
- ¿Es el primer discovery con este cliente?: {SÍ/NO}
- ¿Hay política de no-go/parálisis si un gate falla?: {SÍ/NO}

NIVEL DE GOVERNANCE REQUERIDO:
[ ] Full governance (7 secciones) — Alta confianza, alta trazabilidad
[ ] Lite governance (S1+S2+S5) — Balance velocidad/control
[ ] QA-only (S5) — Solo validación de propuesta
[ ] Gate-only (S2) — Solo control de transiciones de fase

Genera:
1. Recomendación del nivel de governance con justificación
2. Decision Rights Matrix adaptada al equipo de decisión declarado
3. El prompt completo para inicializar el Program Charter
4. Alertas de riesgo de governance específicas para este contexto
```

**Guía de uso:**
- El campo "Stakes del engagement" determina el nivel mínimo de governance: alto → full governance obligatorio
- Si "primer discovery con este cliente" = SÍ, el metaprompt siempre recomienda full governance — la primera impresión no tiene segunda oportunidad
- Para Quick Reference variant, el metaprompt aún incluye S5 (QA) obligatorio — la propuesta siempre se valida antes de enviarse

---

## Metaprompt 2: Generador de Prompt de Gate Evaluation Customizado

**Propósito:** Crear prompts de evaluación de gate adaptados al gate específico, al contexto del engagement, y a los deliverables reales producidos (no un template genérico).

**Plantilla:**
```
Necesito evaluar el gate {G1/G2/G3/3b-checkpoint} del engagement. Genera el prompt de gate evaluation específico para este contexto.

CONTEXTO DEL GATE:
- Gate: {G1 / G2 / G3 / CHECKPOINT_3B}
- Proyecto: {NOMBRE}
- Fecha planificada: {FECHA}
- Fecha real de evaluación: {FECHA} (si difiere)
- ¿Es la primera evaluación de este gate o un reintento?: {PRIMERA / REINTENTO_N}

DELIVERABLES DISPONIBLES PARA EVALUACIÓN:
- {ENTREGABLE_1}: {ARCHIVO} — {COMPLETO/PARCIAL}
- {ENTREGABLE_2}: {ARCHIVO} — {COMPLETO/PARCIAL}
(continuar para todos los deliverables del gate)

CONTEXTO DE RIESGO:
- Supuestos sin validar al momento del gate: {LISTA}
- Riesgos abiertos que impactan la decisión: {LISTA}
- ¿Hubo scope changes desde la última evaluación de gate?: {SÍ/NO/DESCRIPCIÓN}

RESTRICCIONES DEL GATE:
- ¿Hay presión para aprobar aunque no todos los criterios pasen?: {SÍ/NO — si SÍ, documentar}
- ¿El sponsor ha señalado criterios prioritarios?: {LISTA}
- ¿Hay fecha límite contractual que impacta la decisión?: {SÍ/NO}

Genera:
1. Gate Evaluation Report adaptado al gate específico con los deliverables reales
2. Tratamiento de los criterios que están "borderline" (entre ✅ y ⚠️)
3. El veredicto preliminar del skill con justificación
4. Si hay presión de aprobación sin criterios cumplidos: cómo documentar el riesgo formalmente
5. El prompt completo listo para ejecutar la evaluación
```

**Guía de uso:**
- Si "presión para aprobar" = SÍ, el metaprompt genera siempre documentación explícita del riesgo asumido — el gateway siempre protege la trazabilidad aunque no pueda bloquear
- Para reintentos, el metaprompt incorpora los criterios de fallo del intento anterior como contexto obligatorio
- Para G3 (final), el metaprompt siempre incluye verificación cruzada del Proposal QA Score antes de la evaluación

---

## Metaprompt 3: Generador de Prompt de Proposal QA Contextual

**Propósito:** Crear prompts de Proposal QA adaptados al tipo de propuesta, industria del cliente, y nivel de exigencia del receptor, generando una validación más relevante que el template estándar.

**Plantilla:**
```
Necesito ejecutar el Proposal QA para el engagement {NOMBRE}. Genera un prompt de QA contextualizado.

CONTEXTO DE LA PROPUESTA:
- Tipo: {TRANSFORMACIÓN_COMPLETA / MODERNIZACIÓN_PARCIAL / MIGRACIÓN / REPLATFORMING / GREENFIELD}
- Industria del cliente: {SECTOR}
- Receptor de la propuesta: {CTO / CEO / CFO / COMITÉ_TÉCNICO / JUNTA_DIRECTIVA}
- Nivel de sofisticación técnica del receptor: {BAJO / MEDIO / ALTO}
- Monto estimado de la propuesta: {MAGNITUD: PEQUEÑO <$100K / MEDIO $100K-$500K / GRANDE >$500K}

DELIVERABLES PARA QA (cross-reference):
- AS-IS (03): {ARCHIVO}
- Escenarios (05): {ARCHIVO} — escenario aprobado: {NOMBRE_ESCENARIO}
- Feasibility (3b): {ARCHIVO} — veredicto: {FEASIBLE/FEASIBLE_CON_CONDICIONES}
- Roadmap (06): {ARCHIVO}
- Spec Funcional (07): {ARCHIVO}
- Pitch Ejecutivo (08): {ARCHIVO}

RIESGOS ESPECÍFICOS A VALIDAR:
- ¿El pitch hace promesas sobre tecnología con riesgo de viabilidad?: {SÍ/NO/CUÁLES}
- ¿Hay timeline muy agresivo que el QA debe cuestionar?: {SÍ/NO}
- ¿Hay supuestos críticos no validados en la propuesta?: {LISTA}

DIMENSIONES DE QA A INTENSIFICAR:
[ ] Coherencia Técnica — si hay tecnologías de alto riesgo en el roadmap
[ ] Viabilidad de Propuesta — si el receptor es CFO/CEO (cuestionará ROI agresivamente)
[ ] Completitud — si el receptor es CTO (revisará la profundidad técnica)
[ ] Alineación con Hallazgos — si hay riesgo de que la propuesta "olvidó" problemas del AS-IS

Genera:
1. Protocolo de QA adaptado al receptor y tipo de propuesta
2. Dimensiones intensificadas con criterios adicionales según el contexto
3. Red flags específicos a buscar en esta propuesta
4. El prompt completo de Proposal QA listo para ejecutar
5. La sección de "Propuesta Hardening" — cómo proteger la propuesta ante las objeciones más probables del receptor
```

**Guía de uso:**
- El receptor de la propuesta es el dato más crítico: para CFO, intensificar Viabilidad; para CTO, intensificar Coherencia Técnica; para Junta Directiva, intensificar Completitud y Narrativa
- Si el veredicto de Feasibility = FEASIBLE_CON_CONDICIONES, el metaprompt añade automáticamente verificación de que esas condiciones están documentadas en la propuesta
- "Propuesta Hardening" es el output diferencial: no solo valida, sino prepara la propuesta para las objeciones predecibles del receptor específico

---

## Metaprompt 4: Generador de Prompt de Governance Post-Mortem

**Propósito:** Crear prompts de análisis retrospectivo de la efectividad de la gobernanza, orientados a mejora continua del proceso para futuros engagements.

**Plantilla:**
```
El engagement {NOMBRE} ha concluido. Necesito generar un análisis post-mortem de la gobernanza. Crea el prompt completo.

DATOS DEL ENGAGEMENT COMPLETADO:
- Duración real: {SEMANAS} (planificada: {SEMANAS_PLAN})
- Variante ejecutada: {FULL/MINIMAL/QUICK}
- Nivel de governance aplicado: {FULL/LITE/QA_ONLY}
- Gates evaluados: {LISTA_DE_GATES_CON_RESULTADO: PASS/CONDITIONAL/FAIL}
- Reintentos de gate: {NÚMERO_Y_CUÁLES}
- Scope changes: {NÚMERO} — impacto total: {DÍAS/PORCENTAJE}
- Proposal QA final score: {X.X/5.0}
- Issues detectados en QA: {NÚMERO}
- Issues detectados post-envío por el cliente: {NÚMERO}
- ¿La propuesta resultó en contrato?: {SÍ/NO/PENDIENTE}

ÁREAS DE ANÁLISIS:
[ ] Efectividad de gates: ¿atraparon los problemas correctos?
[ ] Overhead de governance: ¿fue proporcional al riesgo?
[ ] Proposal QA: ¿el threshold 3.5 fue el correcto para este engagement?
[ ] Scope changes: ¿se detectaron a tiempo o tarde?
[ ] Decision Log: ¿fue útil para el cliente?

RESTRICCIONES DEL ANÁLISIS:
- ¿El cliente ha dado feedback sobre el proceso de governance?: {SÍ/NO/DESCRIPCIÓN}
- ¿Hubo conflicto entre la governance y el ritmo del cliente?: {SÍ/NO/DESCRIPCIÓN}

Genera:
1. Post-mortem estructurado por sección del skill (S1-S7)
2. Métricas comparadas: este engagement vs el promedio del framework
3. Top 3 prácticas de governance que funcionaron
4. Top 3 gaps o fricciones de governance
5. Recomendaciones específicas para el proceso de governance del equipo
6. El prompt completo para ejecutar el S7 (Lessons Learned) con este contexto
```

**Guía de uso:**
- El campo "Issues detectados post-envío por el cliente" es el indicador más importante: si hay >0 issues post-envío que el QA no detectó, hay una brecha en el proceso
- Para engagements donde la propuesta NO resultó en contrato, el post-mortem intensifica el análisis del Proposal QA — ¿el QA validó algo que el cliente luego rechazó?
- Las "Recomendaciones específicas para el equipo" son el output de mayor valor: no son mejoras al skill en abstracto sino mejoras al proceso concreto de este equipo

---

## Metaprompt 5: Generador de Prompt de Governance Express

**Propósito:** Crear prompts de gobernanza ligera para Quick Reference discoveries donde la governance completa sería un overhead desproporcionado, sin sacrificar la validación de la propuesta.

**Plantilla:**
```
Tengo un discovery Quick Reference (1-2 semanas, 3 fases). Necesito governance mínima pero sin comprometer la calidad de la propuesta. Genera el prompt de governance express.

CONTEXTO DEL QUICK REFERENCE:
- Cliente: {NOMBRE}
- Sistema: {SISTEMA}
- Fases: [AS-IS → Escenarios → Pitch]
- Timeline: {DÍAS_HÁBILES}
- Deadline de propuesta: {FECHA}
- ¿Habrá un discovery completo después si el go/no-go es positivo?: {SÍ/NO}

LIMITACIONES:
- Tiempo disponible para governance: {HORAS} (recomendado mínimo: 2h para QA)
- ¿Se ejecutarán gates formales o solo checkpoints?: {GATES_FORMALES / CHECKPOINTS_INFORMALES}
- ¿El cliente está involucrado en los gates o es solo interno?: {CLIENTE / INTERNO}

RIESGOS ESPECÍFICOS DEL QUICK REFERENCE:
- Alta dependencia de supuestos (no hay Phase 0 ni Phase 2)
- Timeline muy corto que puede llevar a deliverables superficiales
- Propuesta puede generar expectativas que un discovery completo posterior modificará

Genera:
1. Plan de governance express adaptado al Quick Reference
2. Los 3 controles de governance no negociables incluso en modo express
3. El checklist de supuestos críticos que DEBEN documentarse explícitamente
4. El prompt de Proposal QA express (dimensiones críticas, 45 minutos máximo de ejecución)
5. El disclaimer estándar que debe incluir la propuesta Quick Reference (expectativas correctas)
```

**Guía de uso:**
- Los "3 controles no negociables" son siempre los mismos en modo express: (1) Assumptions Log completo, (2) Proposal QA S5 ejecutado, (3) Scope del Quick Reference declarado explícitamente en la propuesta
- El "disclaimer estándar" es crítico: el cliente debe saber que está recibiendo una propuesta basada en 3 fases, no en el pipeline completo, y que sus conclusiones tienen más incertidumbre
- Si "¿Habrá un discovery completo después?" = SÍ, el metaprompt ajusta la propuesta para posicionar el Quick Reference como Fase 0 de un engagement más amplio

---
**Autor:** Javier Montaño | **© Comunidad MetodologIA** | **Actualización:** 13 de marzo de 2026
