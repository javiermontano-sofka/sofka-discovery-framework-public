# Use-Case Prompts: multidimensional-feasibility

> 7 prompts reutilizables para invocar el Think Tank (Consejo de Siete Sabios) en diferentes contextos. Todos producen veredictos basados en evidencia con claims trazables.

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

---

## Prompt 1: Full Think Tank Validation (Post-Gate 1)

```
Ejecuta multidimensional-feasibility para el proyecto {NOMBRE_PROYECTO}.

Contexto:
- Escenario a validar: {ESCENARIO_SELECCIONADO_EN_GATE_1}
- Repositorio/documentación: {RUTA_O_URL}
- Industria: {INDUSTRIA}
- Entregables previos: 05_Escenarios_ToT (Gate 1 aprobado)

Parámetros:
- {MODO} = piloto-auto
- {FORMATO} = markdown
- {VARIANTE} = técnica

Activa el Consejo de Siete Sabios completo (7 dimensiones):
D1: Investigación / TRL — madurez tecnológica por componente
D2: Cuantitativa — benchmarks ISBSG, Monte Carlo, PERT
D3: Sistémica — Conway's Law, Team Topologies, CAS
D4: Madurez Tecnológica — Hype Cycle, TW Radar, Wardley Map
D5: Infraestructura — platform readiness, cloud maturity
D6: Integración — APIs, event backbone, data contracts
D7: Económica — TCO, FinOps, costo de NO hacer

Protocolo completo:
1. Análisis individual por sabio (sin contaminación cruzada)
2. Cross-validation entre pares
3. Deliberación estructurada con devil's advocate
4. Votación ponderada (mayoría 5/7)
5. Veredicto con condiciones suspensivas

Entrega:
- Claim Evidence Matrix (mínimo 10 claims)
- 7 análisis dimensionales
- Veredicto del Think Tank (VIABLE / VIABLE CON CONDICIONES / NO VIABLE)
- Spike Catalog con criterios de éxito/fracaso
- Dependency Graph (Mermaid)
```

---

## Prompt 2: Fast Track — 4 Dimensiones

```
Necesito una validación rápida de factibilidad para {NOMBRE_PROYECTO}.

Solo 4 dimensiones (fast track):
D1: Investigación / TRL
D2: Cuantitativa
D4: Madurez Tecnológica
D7: Económica

Contexto:
- Escenario: {DESCRIPCION_BREVE}
- Stack propuesto: {TECNOLOGIAS}
- Equipo disponible: {TAMANO_Y_SENIORITY}
- Timeline target: {MESES}

{VARIANTE} = ejecutiva

Entrega:
- Claim Evidence Matrix (6-8 claims)
- 4 análisis dimensionales (abreviados)
- Veredicto rápido (mayoría 3/4)
- Top 3 riesgos con spikes si aplica

No necesito análisis sistémico, de infraestructura ni de integración en este fast track.
```

---

## Prompt 3: Single-Dimension Deep Dive (Un Sabio)

```
Necesito un análisis profundo de factibilidad en una sola dimensión.

Dimensión: {D1|D2|D3|D4|D5|D6|D7}
Sabio activo: {NOMBRE_DIMENSION}

Contexto:
- Proyecto: {NOMBRE_PROYECTO}
- Escenario: {ESCENARIO}
- Foco específico: {PREGUNTA_O_PREOCUPACION_ESPECIFICA}

Parámetros:
- {PROFUNDIDAD} = exhaustivo
- {VARIANTE} = técnica

Entrega el análisis completo del sabio:
1. Inventario de claims relevantes a esta dimensión (mínimo 5)
2. Evidencia por claim con tags y nivel de confianza
3. Análisis FMEA de las claims de mayor riesgo (RPN)
4. Veredicto dimensional (VIABLE / CONDICIÓN / NO VIABLE)
5. Spikes recomendados específicos a esta dimensión
6. Fitness functions propuestas para monitoreo continuo

Este es un deep dive — profundidad máxima en una sola dimensión.
```

---

## Prompt 4: Re-Validación Post-Spike

```
El Think Tank emitió veredicto VIABLE CON CONDICIONES para {NOMBRE_PROYECTO}.
Los spikes se han ejecutado. Necesito re-validar.

Resultados de spikes:
{Para cada spike ejecutado:}
- Spike: {NOMBRE_SPIKE}
  Resultado: {ÉXITO|FRACASO|PARCIAL}
  Evidencia: {DESCRIPCIÓN_DE_LO_QUE_SE_ENCONTRÓ}
  Datos: {MÉTRICAS_OBTENIDAS}

Condiciones suspensivas originales:
{Listar las CS del veredicto original}

Re-ejecuta el protocolo Think Tank con la nueva evidencia:
1. Actualizar nivel de confianza de claims afectadas por los spikes
2. Re-evaluar cada condición suspensiva (cumplida / no cumplida / parcial)
3. Recalcular Confidence Score
4. Emitir nuevo veredicto

Si algún spike falló: evaluar la alternativa documentada en el spike original.
Si todos los spikes pasaron: elevar veredicto a VIABLE (sin condiciones) si procede.
```

---

## Prompt 5: Pre-Gate Comparison (2 Escenarios)

```
Estamos en pre-Gate 1. Necesito validación de factibilidad comparada
para 2 escenarios del proyecto {NOMBRE_PROYECTO}.

Escenario A: {DESCRIPCION_ESCENARIO_A}
Escenario B: {DESCRIPCION_ESCENARIO_B}

Para cada escenario, ejecuta el Think Tank en modo fast track (4 dimensiones):
D1: Investigación / TRL
D2: Cuantitativa
D4: Madurez Tecnológica
D7: Económica

Entrega:
1. Claim Evidence Matrix comparada (claims lado a lado)
2. Tabla resumen: dimensión x escenario con semáforos
3. Veredicto comparado con recomendación
4. Qué escenario tiene menor riesgo de factibilidad
5. Qué spikes serían necesarios para cada escenario

{VARIANTE} = técnica
Formato de salida: tabla comparativa, no 2 documentos separados.
```

---

## Prompt 6: Stakeholder Confidence Report

```
El Think Tank completó la validación de factibilidad para {NOMBRE_PROYECTO}.
Necesito un reporte de confianza para stakeholders no técnicos.

Veredicto del Think Tank: {VIABLE|VIABLE_CON_CONDICIONES|NO_VIABLE}
Confidence Score: {SCORE}/100

{VARIANTE} = ejecutiva
{FORMATO} = {markdown|html}

Entrega un reporte ejecutivo que:
1. Traduzca el veredicto técnico a lenguaje de negocio
2. Presente las dimensiones como áreas de riesgo/oportunidad (sin jerga)
3. Explique las condiciones suspensivas como "qué necesitamos confirmar antes de proceder"
4. Presente los spikes como "inversiones de validación" con ROI (costo del spike vs costo del riesgo)
5. Incluya un semáforo visual de las 7 dimensiones
6. Cierre con una recomendación clara de GO / CONDITIONAL GO / NO GO

Audiencia: CTO, CFO, VP de Operaciones. Máximo 3 páginas.
No usar términos como TRL, FMEA, Conway, Monte Carlo sin explicación.
```

---

## Prompt 7: Technology Maturity Audit

```
Necesito una auditoría de madurez tecnológica del stack propuesto para {NOMBRE_PROYECTO}.

Stack a auditar:
{Lista de tecnologías, frameworks, plataformas y herramientas}

Para cada tecnología, produce:
1. TRL (1-9) con justificación
2. Posición en Gartner Hype Cycle (fase + years to mainstream)
3. Posición en ThoughtWorks Radar (Adopt/Trial/Assess/Hold)
4. Posición en Wardley Map (Genesis/Custom/Product/Commodity)
5. Posición en Rogers' Adoption Curve (categoría de adoptante típico)
6. Riesgo consolidado (Bajo/Medio/Alto/Crítico)

Formato de salida:
- Tabla resumen con semáforos
- Heatmap de madurez (Mermaid)
- Top 5 tecnologías de mayor riesgo con justificación
- Recomendaciones: qué mantener, qué sustituir, qué validar con spike

Esto es el análisis del sabio de Madurez Tecnológica (D4) como standalone.
{PROFUNDIDAD} = exhaustivo
```
