# Use Case Prompts — Adoption Strategy

> 7 ready-to-use prompts for the `adoption-strategy` skill. Copy and adapt according to project context.

---

## Prompt 1: Full Adoption Strategy


```
Disena la estrategia de adopcion completa para {PROYECTO}.

Contexto:
- Cambio: {DESCRIPCION DEL CAMBIO}
- Stakeholders: {LISTA DE GRUPOS + TAMANO}
- Timeline: {FECHA GO-LIVE}
- Readiness assessment: {RUTA AL ASSESSMENT O RESUMEN}

Incluye las 8 secciones: rollout phases, communication plan, training curriculum,
resistance management, champion network, reinforcement, KPIs.

Formato: markdown (con diagramas Mermaid para Gantt de rollout y escalation path)
```

**When to use:** Comprehensive pre-go-live strategy. Ideally requires a prior readiness assessment as input.

---

## Prompt 2: Communication Plan Only


```
Disena el plan de comunicacion para la adopcion de {PROYECTO}.

Modo operacional: comunicacion
Grupos: {LISTA CON TAMANO Y CANAL PREFERIDO}
Cambio: {DESCRIPCION BREVE}

Para cada grupo, disenar:
- Mensajes por etapa ADKAR (Awareness → Reinforcement)
- Canal optimo (no "email para todo")
- Sender (quien envia importa tanto como el mensaje)
- Calendario de comunicacion (primeras 8 semanas)
- Feedback mechanism por canal

Output: Communication Plan + Calendar (tabla semanal)
```

**When to use:** When the overall strategy already exists but the detailed communication plan is missing. Or when the comms team needs a specific deliverable.

---

## Prompt 3: Training Plan Only


```
Disena el plan de training para la adopcion de {SISTEMA/HERRAMIENTA}.

Modo operacional: capacitacion
Roles afectados: {LISTA DE ROLES CON SKILLS ACTUALES}
Sistema nuevo: {DESCRIPCION + FEATURES CLAVE}
Infraestructura disponible: {LMS? Aulas? Budget?}

Para cada rol:
- Gap analysis (skills actuales vs. requeridas)
- Curriculum: modulos, formato, duracion, prerequisitos
- Metricas Kirkpatrick (L1 a L4)
- Recomendacion: classroom vs. micro-learning vs. on-the-job vs. DAP

Output: Training Needs Analysis + Curriculum Map + Measurement Plan
```

**When to use:** When training is managed separately from the overall adoption strategy. Ideal for sending to L&D or training providers.

---

## Prompt 4: Champion Network Design


```
Disena la red de champions para la adopcion de {PROYECTO}.

Usuarios totales: {NUMERO}
Grupos: {LISTA DE GRUPOS}
Cultura organizacional: {JERARQUICA/COLABORATIVA/MIXTA}

Disenar:
- Tamano optimo de la red (ratio champions:usuarios)
- Criterios de seleccion (NO solo gerentes — influencia social)
- Plan de enablement (train-the-trainer)
- Cadencia de comunicacion (diaria, semanal, mensual)
- Incentivos y reconocimiento (financieros y no financieros)
- Metricas de efectividad del champion
- Plan de sostenibilidad post-proyecto

Considerar: ¿como evitar que champions se conviertan en "help desk gratuito"?
```

**When to use:** When a robust champion network is needed. Especially useful in large (>200 users) or distributed organizations.

---

## Prompt 5: Resistance Management Plan


```
Disena el plan de gestion de resistencia para {PROYECTO}.

Resistencia identificada (del readiness assessment):
{TABLA: Grupo | Tipo de Resistencia | Score | Root Cause}

Para cada tipo de resistencia:
- Tactica especifica (no "comunicar mas" — SER ESPECIFICO)
- Responsable
- Timeline
- Criterio de exito
- Escalation path si no funciona

Incluir:
- Nudges para resistencia por inercia
- Abordaje empatico para resistencia emocional
- Escalation flowchart (Mermaid)
- "Resistance Review Board" como ceremonia quincenal
```

**When to use:** When the readiness assessment revealed significant resistance (score >3 in any group). Also useful as a preventive plan before rollout.

---

## Prompt 6: Adoption Metrics Dashboard


```
Disena el dashboard de metricas de adopcion para {PROYECTO}.

Metricas requeridas:
- Adoption rate, proficiency rate, utilization rate
- Satisfaction (CSAT/NPS)
- Training completion
- Support ticket volume
- Time-to-competency

Para cada metrica:
- Definicion precisa (que cuenta como "adoption"?)
- Target por fase de rollout
- Fuente de datos (manual? automatica? DAP?)
- Cadencia de medicion
- Intervention threshold (que valor dispara accion y que accion)

Disenar tambien:
- Adoption funnel con conversion rates entre etapas
- Alertas automaticas cuando metrica cruza threshold
- Vista ejecutiva (1 pagina) vs. vista operativa (detalle)
```

**When to use:** When the measurement system is needed as a standalone deliverable. Useful for BI teams that will build the actual dashboard.

---

## Prompt 7: Post-Go-Live Reinforcement Plan


```
Disena el plan de reinforcement post-go-live para {PROYECTO}.

Estado actual:
- Semanas desde go-live: {N}
- Adoption rate actual: {%}
- Issues principales: {LISTA}
- Soporte actual: {DESCRIPCION}

Disenar:
- Mecanismos de reinforcement (primeros 90 dias post-go-live)
- Coaching plan para usuarios con dificultad
- Knowledge base maintenance plan
- Feedback loop: usuarios → equipo de producto
- Sustainability plan: que pasa cuando el proyecto termina
- Quick win showcases: como celebrar exitos visibles
- Plan de decommission del sistema legacy

Target: Adoption rate ≥85% a 90 dias post-go-live
```

**When to use:** After go-live, when adoption needs to be sustained and grown. Complements the pre-go-live strategy.

---

## Usage Notes

- All prompts assume `piloto-auto` mode and `markdown` format unless otherwise specified
- Replace `{PLACEHOLDERS}` with project-specific data
- Prompt 1 (Full Strategy) includes elements from all others — use individual prompts when depth is needed in a specific area
- Recommended sequence: First `change-readiness-assessment`, then `adoption-strategy`

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
