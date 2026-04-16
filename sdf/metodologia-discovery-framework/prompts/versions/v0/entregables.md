# Prompts por Entregable — MetodologIA Discovery Framework

> Un prompt por cada entregable del pipeline (00–14 + 05b).
> Compactos, tipo spec. Params ajustables + inputs al final.
> Cada prompt es autocontenido: ejecuta el skill correspondiente y genera el archivo de salida.

---

## 00 — Discovery Plan

**Cuándo:** Inicio de cualquier discovery. Primer entregable obligatorio que establece gobernanza, alcance, comité y cronograma.
**Dependencias:** Ninguna (entregable raíz).
**Criterio de aceptación:** Comité de expertos declarado con roles, cronograma con hitos y gates, registro de inputs clasificados, alcance delimitado con exclusiones explícitas.

```
/mao:generate-plan

Generar 00_Discovery_Plan: gobernanza del discovery, alcance con exclusiones,
comité de expertos (roles + justificación), cronograma con gates (G1–G3),
registro de inputs clasificados por tipo y fuente.
Si hay adjuntos, clasificarlos como inputs formales.

MODO=piloto-auto | FORMATO=markdown | VARIANTE=técnica
{RUTA}: .
```

---

## 01 — Stakeholder Map

**Cuándo:** Después del plan (00). Mapea el ecosistema humano del proyecto para orientar comunicación y priorización.
**Dependencias:** 00_Discovery_Plan (para contexto de alcance).
**Criterio de aceptación:** Matriz influencia/interés con ≥8 stakeholders, RACI completo para decisiones clave, plan de comunicación con cadencia, assessment de readiness por stakeholder.

```
/mao:map-stakeholders

Generar 01_Stakeholder_Map: matriz influencia/interés (4 cuadrantes),
RACI para decisiones arquitectónicas y comerciales,
plan de comunicación (canal + cadencia + mensaje por grupo),
readiness assessment (sponsor, champion, resistor, neutral).

MODO=piloto-auto | FORMATO=markdown
{RUTA}: .
```

---

## 02 — Brief Técnico

**Cuándo:** Necesitas un snapshot ejecutivo de máx 3 páginas. Ideal para alinear stakeholders antes de profundizar.
**Dependencias:** Análisis preliminar del código (puede ejecutarse standalone).
**Criterio de aceptación:** Semáforo 6D (Arquitectura, Seguridad, Calidad, Datos, Infra, Proceso), top 5 hallazgos con severidad, top 5 riesgos con probabilidad/impacto, recomendación Go/Pivot/No-Go. Máx 3 páginas.

```
/mao:generate-brief

Generar 02_Brief_Tecnico: snapshot ejecutivo ≤3 páginas.
Semáforo 6D con justificación por dimensión,
top 5 hallazgos (severidad + evidencia), top 5 riesgos (probabilidad × impacto),
recomendación ejecutiva con siguiente paso concreto.

MODO=piloto-auto | FORMATO=markdown | VARIANTE=ejecutiva
{RUTA}: .
```

---

## 03 — Análisis AS-IS

**Cuándo:** Deep-dive técnico del estado actual. El entregable más denso del pipeline — requiere acceso completo al código.
**Dependencias:** 00_Discovery_Plan (para alcance).
**Criterio de aceptación:** 10 secciones completas (S0–S10), cada hallazgo con evidencia etiquetada [CODIGO]/[CONFIG]/[DOC]/[INFERENCIA]/[SUPUESTO], diagramas C4 L1–L3 en Mermaid, deuda técnica cuantificada, ≥5 recomendaciones priorizadas.
**Caso borde:** Monorepos — analizar por bounded context, no por directorio.

```
/mao:diagnose-asis

Generar 03_Analisis_AS-IS exhaustivo: 10 secciones con evidencia de código.
S0-Executive Summary, S1-Stack Technology Radar, S2-C4 (L1-L3 Mermaid),
S3-Deuda Técnica (cuantificada), S4-Seguridad (OWASP scan),
S5-Calidad (métricas), S6-Infra (topología), S7-Observabilidad (gaps),
S8-Datos (modelo + flujos), S9-Integraciones (mapa), S10-Recomendaciones (priorizadas).
Cada hallazgo etiquetado con tipo de evidencia.

MODO=piloto-auto | FORMATO=markdown | VARIANTE=técnica | PROFUNDIDAD=exhaustivo
{RUTA}: .
```

---

## 04 — Mapeo de Flujos

**Cuándo:** Después del AS-IS (03). Traza los flujos end-to-end del negocio sobre la arquitectura diagnosticada.
**Dependencias:** 03_Analisis_AS-IS (para mapa de integraciones y bounded contexts).
**Criterio de aceptación:** Taxonomía DDD (dominios, bounded contexts, aggregates), 8–12 flujos E2E con diagrama de secuencia, matriz de integraciones (sistema × sistema), top 10 puntos de falla con severidad y mitigación propuesta.

```
/mao:trace-flows

Generar 04_Mapeo_Flujos: taxonomía DDD (dominios → bounded contexts → aggregates),
8–12 flujos E2E con diagramas de secuencia Mermaid,
matriz de integraciones (protocolo + SLA + acoplamiento),
top 10 puntos de falla (severidad + probabilidad + mitigación propuesta).

MODO=piloto-auto | FORMATO=markdown | VARIANTE=técnica
{RUTA}: .
```

---

## 05 — Escenarios ToT

**Cuándo:** Evaluación de alternativas de modernización/evolución. Usa Tree-of-Thought para explorar ≥3 caminos.
**Dependencias:** 03_Analisis_AS-IS + 04_Mapeo_Flujos (para informar escenarios con evidencia real).
**Criterio de aceptación:** ≥3 escenarios con nombre, descripción, scoring 6D normalizado, SWOT por escenario, árbol de decisión visual, lógica de switching (cuándo pivotar de un escenario a otro), escenario recomendado con justificación.

```
/mao:evaluate-scenarios

Generar 05_Escenarios: ≥3 escenarios de evolución con Tree-of-Thought.
Scoring 6D normalizado (0–10 por dimensión), SWOT por escenario,
árbol de decisión Mermaid, lógica de switching entre escenarios,
escenario recomendado con justificación basada en evidencia del AS-IS.

MODO=piloto-auto | FORMATO=markdown | VARIANTE=técnica
{RUTA}: .
```

---

## 05b — Feasibility Think Tank

**Cuándo:** Validación cruzada del escenario recomendado por 7 expertos independientes. Gate de calidad antes del roadmap.
**Dependencias:** 05_Escenarios (escenario a validar).
**Criterio de aceptación:** 7 dimensiones evaluadas (técnica, económica, organizacional, temporal, regulatoria, integración, escalabilidad), validación cruzada entre expertos, veredicto Go/No-Go (umbral ≥5/7), condiciones y riesgos residuales documentados.

```
/mao:validate-feasibility

Generar 05b_Feasibility: Think Tank de 7 Sabios.
7 dimensiones con score independiente y justificación,
validación cruzada (contraargumentos entre expertos),
veredicto consolidado (Go si ≥5/7, No-Go si <5/7),
condiciones de éxito y riesgos residuales por dimensión.

MODO=piloto-auto | FORMATO=markdown | PROFUNDIDAD=exhaustivo
{RUTA}: .
```

---

## 06 — Solution Roadmap

**Cuándo:** Planificación de la transformación. Traduce el escenario validado en fases ejecutables con proyecciones.
**Dependencias:** 05_Escenarios + 05b_Feasibility.
**Criterio de aceptación:** 5 fases con entregables por fase, Monte Carlo (P50/P80/P95) en FTE-meses, pivot points con criterios de decisión, burndown proyectado, modelo de equipo (roles + FTEs + ramp-up). CERO precios — solo magnitudes de esfuerzo.

```
/mao:chart-roadmap

Generar 06_Solution_Roadmap: 5 fases con entregables y dependencias.
Monte Carlo (P50/P80/P95) en FTE-meses — CERO precios.
Pivot points con criterios cuantitativos de switching,
burndown proyectado, modelo de equipo (roles × fases),
quick wins identificados para primeros 30 días.

MODO=piloto-auto | FORMATO=markdown | VARIANTE=técnica
{RUTA}: .
```

---

## 07 — Especificación Funcional

**Cuándo:** Detalle funcional para el equipo de desarrollo. Traduce hallazgos en requisitos implementables.
**Dependencias:** 03_Analisis_AS-IS + 04_Mapeo_Flujos + 05_Escenarios.
**Criterio de aceptación:** Módulos funcionales con responsabilidades, ≥8 casos de uso detallados (actor, precondición, flujo, excepciones), ≥6 reglas de negocio formalizadas, matriz complejidad-riesgo, NFRs cuantificados (latencia, disponibilidad, throughput).

```
/mao:write-spec

Generar 07_Especificacion_Funcional: módulos con responsabilidades y dependencias,
≥8 casos de uso (actor, precondición, flujo principal, excepciones, postcondición),
≥6 reglas de negocio (condición → acción → excepción),
matriz complejidad-riesgo por módulo,
NFRs cuantificados con métricas target y método de verificación.

MODO=piloto-auto | FORMATO=markdown | VARIANTE=técnica | PROFUNDIDAD=exhaustivo
{RUTA}: .
```

---

## 08 — Pitch Ejecutivo

**Cuándo:** Presentación al C-level. Lenguaje de negocio, orientado a decisión de inversión.
**Dependencias:** 06_Solution_Roadmap + idealmente todos los anteriores.
**Criterio de aceptación:** Cost-of-inaction cuantificado, 4 pilares de valor con métricas, inversión en FTE-meses (CERO precios), modelo financiero (drivers + magnitudes), CTA claro, disclaimer obligatorio de estimación. Máx 5 páginas.
**Límite:** NUNCA incluir precios, tarifas o montos monetarios. Solo FTE-meses y magnitudes relativas.

```
/mao:craft-pitch

Generar 08_Pitch_Ejecutivo ≤5 páginas, lenguaje C-level.
Cost-of-inaction (riesgo de no actuar cuantificado),
4 pilares de valor (métrica antes → después por pilar),
inversión en FTE-meses — CERO precios ni tarifas,
modelo financiero (solo drivers y magnitudes),
CTA con siguiente paso concreto. Disclaimer obligatorio.

MODO=piloto-auto | FORMATO=markdown | VARIANTE=ejecutiva
{RUTA}: .
```

---

## 09 — Handover Operativo

**Cuándo:** Cierre del discovery. Transición formal al equipo de ejecución. SIEMPRE el último entregable.
**Dependencias:** TODOS los anteriores (es el cierre del pipeline).
**Criterio de aceptación:** Resumen de transición (decisiones clave + compromisos), plan 90 días (semanas 1–4, 5–8, 9–12), gobernanza post-discovery, risk tracker vivo, criterios kill (cuándo abortar), stakeholder transition plan.

```
/mao:deliver-handover

Generar 09_Handover: resumen de transición (decisiones + compromisos),
plan 90 días con hitos semanales (semanas 1–4, 5–8, 9–12),
gobernanza post-discovery (roles + cadencia + escalamiento),
risk tracker (riesgo × impacto × owner × mitigación),
criterios kill con umbrales cuantitativos,
stakeholder transition (de discovery a ejecución).

MODO=piloto-auto | FORMATO=markdown | VARIANTE=técnica
{RUTA}: .
```

---

## 10 — Presentación de Hallazgos

**Cuándo:** Deck ejecutivo para presentar resultados del discovery a audiencia mixta (técnica + negocio).
**Dependencias:** 02_Brief + 03_AS-IS + 05_Escenarios.
**Criterio de aceptación:** Storytelling con arco narrativo (problema → hallazgos → recomendación), data visualization de métricas clave, top hallazgos con impacto cuantificado, recomendaciones priorizadas, siguiente paso concreto.

```
/mao:present-findings

Generar 10_Presentacion_Hallazgos: deck ejecutivo con storytelling.
Arco narrativo: contexto → hallazgos → impacto → recomendación → CTA.
Data viz para métricas clave (semáforo 6D, scoring de escenarios),
top hallazgos con severidad e impacto cuantificado,
recomendaciones ordenadas por valor/esfuerzo.

MODO=piloto-auto | FORMATO=markdown | VARIANTE=ejecutiva
{RUTA}: .
```

---

## 11 — Hallazgos Técnicos

**Cuándo:** Deep-dive técnico separado para audiencia de ingeniería/arquitectura. Complementa la presentación ejecutiva.
**Dependencias:** 03_AS-IS + 04_Flujos + 05_Escenarios.
**Criterio de aceptación:** Recomendaciones arquitectónicas con ADRs formales (contexto, decisión, consecuencias), trade-offs explícitos por decisión, diagramas C4 TO-BE, deuda técnica priorizada con plan de remediación.

```
/mao:report-tech

Generar 11_Hallazgos_Tecnicos: deep-dive para audiencia técnica.
Recomendaciones arquitectónicas con ≥3 ADRs formales
(contexto → opciones → decisión → consecuencias),
trade-offs explícitos, C4 TO-BE en Mermaid,
deuda técnica priorizada (impacto × esfuerzo de remediación).

MODO=piloto-auto | FORMATO=markdown | VARIANTE=técnica | PROFUNDIDAD=exhaustivo
{RUTA}: .
```

---

## 12 — Hallazgos Funcionales

**Cuándo:** Análisis funcional para product owners, analistas de negocio y UX. Complementa los hallazgos técnicos.
**Dependencias:** 04_Flujos + 07_Spec_Funcional (si existe).
**Criterio de aceptación:** User journeys mapeados, gaps funcionales con impacto en usuario, UX findings con severidad, implicaciones de proceso (cambios organizacionales necesarios).

```
/mao:report-func

Generar 12_Hallazgos_Funcionales: análisis orientado a producto y UX.
User journeys (happy path + pain points),
gaps funcionales (feature esperada vs realidad, impacto en usuario),
UX findings con severidad (crítico/alto/medio/bajo),
implicaciones de proceso (cambios org necesarios para adopción).

MODO=piloto-auto | FORMATO=markdown | VARIANTE=técnica
{RUTA}: .
```

---

## 13 — Revisión de Negocio (INTERNO)

**Cuándo:** Validación comercial interna de MetodologIA. Evalúa el deal desde perspectiva de negocio.
**Dependencias:** 06_Roadmap + 08_Pitch.
**⚠️ NUNCA compartir con el cliente.** Documento interno exclusivo de MetodologIA.
**Criterio de aceptación:** Estructura del deal (tipo de contrato, modelo de facturación), riesgos comerciales (client concentration, scope creep, dependency), modelo de engagement (equipo, duración, governance), análisis de rentabilidad por fase.

```
/mao:review-business

Generar 13_Revision_Negocio: validación comercial INTERNA MetodologIA.
Estructura del deal (contrato + facturación + SLAs propuestos),
riesgos comerciales (probabilidad × impacto financiero),
modelo de engagement (equipo × duración × governance),
rentabilidad por fase (esfuerzo vs valor percibido).
⚠️ DOCUMENTO INTERNO — NUNCA compartir con el cliente.

MODO=piloto-auto | FORMATO=markdown | VARIANTE=técnica
{RUTA}: .
```

---

## 14 — Oportunidades IA

**Cuándo:** Identificar oportunidades de IA/ML en el ecosistema del cliente. Puede ejecutarse como standalone o como parte del pipeline.
**Dependencias:** 03_AS-IS (para entender el landscape tecnológico).
**Criterio de aceptación:** Use cases de IA/ML priorizados por valor/factibilidad, readiness AI SCALE (Strategy, Culture, Architecture, Literacy, Ethics), puntos de integración con sistemas existentes, quick wins (<30 días), governance de IA propuesto.

```
/mao:discover-ai

Generar 14_Oportunidades_IA: mapa de oportunidades de IA/ML.
Use cases priorizados (valor × factibilidad × riesgo),
AI readiness SCALE (5 dimensiones con score 1–5),
puntos de integración con sistemas existentes (API, datos, workflows),
quick wins implementables en <30 días,
governance de IA (ética, bias, explicabilidad, compliance).

MODO=piloto-auto | FORMATO=markdown | VARIANTE=técnica
{RUTA}: .
```
