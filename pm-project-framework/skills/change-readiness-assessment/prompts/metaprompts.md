# Metaprompts — Change Readiness Assessment

> 4 meta-level strategies to maximize the effectiveness of the `change-readiness-assessment` skill. Each metaprompt defines an interpretive lens that transforms how the assessment is executed.

---

## Meta-strategy 1: Empathy-First Assessment

### Philosophy

Before measuring, understand. This strategy prioritizes the human experience of change over quantitative metrics. It starts from the premise that people don't resist change — they resist loss.

### Prompt

```
Ejecuta el readiness assessment con lente Empathy-First.

Para cada grupo de stakeholders, ANTES de scoring ADKAR:
1. Describe la experiencia del cambio desde SU perspectiva (día a día actual vs. futuro)
2. Identifica qué PIERDEN con el cambio (expertise, relaciones, rutinas, identidad)
3. Identifica qué GANAN (y si ellos lo perciben como ganancia)
4. Solo entonces, score ADKAR con esta comprensión como base

En S3 (Resistance):
- Renombra "Resistance" como "Concerns & Needs"
- Clasifica cada concern como: pérdida real, pérdida percibida, incertidumbre, o falta de información
- Las intervenciones (S6) deben abordar la PÉRDIDA, no la RESISTENCIA

Tono del documento: respetuoso, humano, sin jerga de "gestionar resistencia".
```

### When to Use

- Organizations with a history of top-down imposed changes
- When high emotional resistance is detected (S3 emotional >3)
- Cultures where organizational trust is low
- When the sponsor tends to see resistance as a "problem to solve"

---

## Meta-strategy 2: Data-Driven Readiness

### Philosophy

Maximize quantifiable evidence. Each score must be backed by observable data, not inferences or assessor perception. If there's no data, the score is N/A with a collection plan.

### Prompt

```
Ejecuta el readiness assessment con lente Data-Driven.

Reglas de scoring:
- Score basado en DATO = tag [DATO] + fuente específica
- Score basado en OBSERVACIÓN = tag [OBS] + fecha y contexto
- Score basado en INFERENCIA = tag [INF] + lógica explícita + confidence level (alta/media/baja)
- Sin dato ni observación ni inferencia razonable = N/A + plan de recolección

Para cada dimensión ADKAR sin dato:
- Diseña la pregunta específica de survey/entrevista que obtendría el dato
- Estima el effort de recolección (horas)
- Prioriza: ¿este dato cambia una decisión? Si no, aceptar inferencia.

En S7 (Measurement):
- Cada KPI debe tener fuente de datos automatizada cuando sea posible
- Diseña el data pipeline: fuente → recolección → cálculo → visualización → alerta

Output adicional: Data Collection Plan como anexo.
```

### When to Use

- Data-driven organizations (tech companies, financial services)
- When the sponsor demands evidence before approving CM budget
- Assessments that will be audited or reviewed by third parties
- When a quantifiable baseline is needed to measure progress

---

## Meta-strategy 3: Resistance as Resource

### Philosophy

Resistance is not an obstacle — it's organizational intelligence. Each point of resistance reveals valuable information about risks the project hasn't considered, unmet needs, or designs that need improvement.

### Prompt

```
Ejecuta el readiness assessment con lente Resistance-as-Resource.

Reframeo de S3:
- En lugar de "resolver" resistencia, EXTRAER VALOR de ella
- Para cada punto de resistencia, responde:
  1. ¿Qué sabe este grupo que el proyecto NO sabe?
  2. ¿Qué riesgo real están señalando?
  3. ¿Cómo mejoraría el diseño de la solución si los escucháramos?

Clasificación de resistencia:
- 🟡 Signal: Resistencia que señala un riesgo legítimo → feedback al equipo de proyecto
- 🔵 Gap: Resistencia por falta de información → intervención de comunicación
- 🟣 Loss: Resistencia por pérdida real → intervención de compensación/reskilling
- ⚪ Habit: Resistencia por inercia → intervención de enablement + tiempo

En S6 (Interventions):
- Para cada Signal: diseñar un feedback loop hacia el equipo técnico
- Incluir "Resistance Review Board" — ceremonia donde resistencia se procesa como input

Output adicional: "Resistance Intelligence Report" — insights del proyecto
derivados de la resistencia encontrada.
```

### When to Use

- Projects where the technical team designs without end-user input
- When resistance is high but legitimate (not from misinformation)
- Mature organizations that value bottom-up feedback
- When the previous assessment was "everyone resists" without nuance

---

## Meta-strategy 4: Continuous Pulse

### Philosophy

Readiness is not a photo — it's a movie. A point-in-time assessment is necessary but insufficient for transformations >6 months. This strategy designs the continuous measurement system, not just the initial assessment.

### Prompt

```
Ejecuta el readiness assessment con lente Continuous Pulse.

Assessment inicial: S1-S7 estándar (baseline).

Adicional — diseña el sistema de pulso continuo:

1. **Pulse Survey Design:**
   - 5 preguntas (1 por dimensión ADKAR), escala 1-5, anónimo
   - Cadencia: quincenal (Sprint boundary si ágil)
   - Canal: herramienta más usada por cada grupo (Teams/Slack/email/WhatsApp)
   - Threshold de respuesta: >60% para validez estadística

2. **Trend Dashboard:**
   - Visualización de readiness score por grupo a lo largo del tiempo
   - Alertas automáticas cuando score cae >0.5 puntos entre pulsos
   - Comparación entre grupos: ¿quién avanza, quién retrocede?

3. **Intervention Triggers:**
   - Por cada KPI, definir: valor normal, valor de alerta, valor de crisis
   - Alerta → intervención leve (comunicación reforzada)
   - Crisis → intervención fuerte (workshop, 1:1 con sponsor, rediseño)

4. **Retrospectiva de Cambio (mensual):**
   - ¿Qué intervenciones funcionaron? ¿Cuáles no?
   - ¿Qué nueva resistencia emergió?
   - ¿El cambio técnico requiere ajuste basado en feedback de readiness?

Output: Assessment inicial + Continuous Pulse System Design (plantilla de
survey, dashboard spec, intervention trigger matrix, retro template).
```

### When to Use

- Transformations >6 months with multiple rollout phases
- Organizations with survey capability (survey tools)
- When the sponsor wants continuous visibility, not point-in-time reports
- `continuous` operational mode of the skill

---

## Combining Meta-strategies

Meta-strategies are combinable. Recommended combinations:

| Combination | Result | Use Case |
|-------------|--------|----------|
| Empathy-First + Continuous Pulse | Humanistic assessment with continuous tracking | Long transformations in people-centric cultures |
| Data-Driven + Continuous Pulse | Robust and automated measurement system | Tech-savvy organizations with analytics tooling |
| Resistance as Resource + Empathy-First | Maximum value extraction from resistance | Projects with high legitimate resistance |
| Data-Driven + Resistance as Resource | Quantified resistance as project input | Organizations that need "evidence" to listen |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
