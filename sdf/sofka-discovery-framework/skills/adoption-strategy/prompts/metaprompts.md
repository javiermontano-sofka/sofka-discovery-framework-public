# Metaprompts — Adoption Strategy

> 4 meta-level strategies to maximize the effectiveness of the `adoption-strategy` skill. Each metaprompt defines a lens that transforms how the adoption strategy is designed.

---

## Meta-strategy 1: Audience Segmentation

### Philosophy

There is no "the organization" — there are people with different contexts, motivations, and barriers. This strategy takes segmentation to the extreme: each sub-group receives a personalized micro-adoption strategy.

### Prompt

```
Ejecuta la estrategia de adopcion con lente Audience Segmentation.

Para cada grupo de stakeholders, ANTES de disenar la estrategia:
1. Subdivide en sub-segmentos por: tenure, tech-savviness, attitude toward change,
   influencia social, rol especifico
2. Para cada sub-segmento, crea una PERSONA con:
   - Nombre ficticio, rol, anos en la empresa
   - "Un dia tipico" actual vs. post-cambio
   - Su pregunta principal sobre el cambio
   - Su mayor miedo y su mayor esperanza
   - Canal de comunicacion preferido
   - Quien le influye (no su jefe — quien REALMENTE le influye)

Luego:
- S3 (Communication): mensajes personalizados por persona, no por grupo generico
- S4 (Training): paths diferenciados por sub-segmento
- S6 (Champions): seleccionar champions que representen CADA sub-segmento
- S8 (KPIs): medir adopcion por sub-segmento, no promedios

Output: Persona cards (1 por sub-segmento) + estrategia micro-segmentada
```

### When to Use

- Large organizations (>500 people) where "one group" hides significant diversity
- When adoption is uneven within the same group (some adopt, others don't)
- Transformations that affect roles in very different ways
- When previous "one-size-fits-all" strategies failed

---

## Meta-strategy 2: Channel Optimization

### Philosophy

The channel is the message. A perfect message on the wrong channel doesn't reach anyone. This strategy prioritizes the optimization of communication and delivery channels over message content.

### Prompt

```
Ejecuta la estrategia de adopcion con lente Channel Optimization.

Antes de disenar mensajes, AUDITAR canales:
1. Inventario completo de canales disponibles (formales e informales)
2. Para cada canal, medir:
   - Reach: que % de cada grupo lo usa realmente?
   - Engagement: tasa de apertura/lectura/respuesta historica?
   - Trust: los usuarios confian en lo que viene por este canal?
   - Richness: soporta interaccion, multimedia, feedback?
   - Saturation: esta el canal saturado? (email fatigue?)

3. Channel-Group Matrix: mapear el canal optimo por grupo Y por tipo de mensaje

Para S3 (Communication Plan):
- Disenar multichannel journeys: secuencia de toques por diferentes canales
- Regla: ningun mensaje critico por UN solo canal — minimo 2 canales (redundancia)
- A/B testing: para mensajes clave, probar 2 variantes y medir cual convierte mejor

Para S4 (Training):
- Evaluar canales de delivery: LMS vs. in-app (DAP) vs. peer vs. video vs. presencial
- Optimizar por sub-segmento: quien aprende mejor en que formato?

Output: Channel Audit Report + Optimized Channel Map + Multichannel Journeys
```

### When to Use

- Organizations where "we communicate but nobody finds out"
- When many channels are available but none are effective
- Distributed teams (multi-site, multi-timezone) where one channel doesn't reach everyone
- When previous communication has been exclusively top-down email

---

## Meta-strategy 3: Gamification Layer

### Philosophy

Humans are pattern-seeking, progress-tracking, recognition-craving machines. Gamification isn't "adding badges" — it's designing behavioral systems that make adoption intrinsically motivating.

### Prompt

```
Ejecuta la estrategia de adopcion con lente Gamification Layer.

Disenar un sistema de gamificacion INTEGRADO (no superpuesto) a la adopcion:

1. **Progression System:**
   - Niveles: Novato → Aprendiz → Competente → Experto → Maestro
   - Cada nivel tiene: criterios claros, beneficios tangibles, visibilidad
   - Progresion visible en perfil del usuario (dashboard, firma de email, badge)

2. **Quest System:**
   - Quests diarios: "Completa 1 transaccion en el nuevo sistema" (5 min)
   - Quests semanales: "Entrena a un companero en una feature" (30 min)
   - Quests de milestone: "Procesa 100 transacciones sin error" (recognition)
   - Quests de equipo: "Tu area alcanza 80% adoption" (team reward)

3. **Social Mechanics:**
   - Leaderboard por EQUIPO (no individual — evitar toxicidad)
   - Peer recognition: "Nomina a quien te ayudo esta semana"
   - Team achievements: badges de equipo cuando alcanzan milestone juntos
   - Storytelling: "Hall of Fame" con historias de usuarios que encontraron
     un mejor workflow

4. **Reward System:**
   - Intrinsic: progresion visible, mastery, autonomia
   - Social: reconocimiento publico, peer nomination
   - Tangible: acceso a training avanzado, time off, merchandise
   - NUNCA: castigos, shame boards, competencia individual forzada

5. **Anti-patterns a evitar:**
   - Badges sin significado ("Badge de login" — nadie lo valora)
   - Gamificacion obligatoria ("Debes completar 5 quests o...")
   - Leaderboards individuales que desmotivan al 80% que no esta arriba
   - Rewards que devaluan motivacion intrinseca (overjustification effect)

Output: Gamification Design Document integrado en S2-S7
```

### When to Use

- Voluntary adoption where you can't "force" it (productivity tools, methodologies)
- Organizations with competitive culture that respond to challenges
- Young or tech-savvy population that values progression systems
- When initial adoption is high but retention drops (reinforcement problem)

---

## Meta-strategy 4: Adoption Funnel Analysis

### Philosophy

Adoption is a funnel, not a switch. Each stage has a conversion rate and each conversion drop has a diagnosable cause. Apply the discipline of marketing/sales funnels to internal adoption.

### Prompt

```
Ejecuta la estrategia de adopcion con lente Adoption Funnel Analysis.

Definir y disenar el funnel de adopcion:

1. **Funnel Stages:**
   Awareness → Interest → Trial → Active Use → Proficiency → Advocacy

2. **Per stage, define:**
   - Definicion operativa (que comportamiento marca la entrada a esta etapa?)
   - Conversion rate target (que % debe pasar a la siguiente etapa?)
   - Tiempo maximo en stage (cuanto es aceptable antes de intervenir?)
   - Churn indicators (que senales predicen abandono?)
   - Interventions: que accion tomar cuando conversion < target?

3. **Funnel por segmento:**
   - Cada grupo de stakeholders tiene su propio funnel con rates diferentes
   - Early adopters: funnel rapido (Awareness → Advocacy en 2 semanas)
   - Late majority: funnel lento (Awareness → Active Use en 8 semanas)
   - Laggards: funnel con soporte (cada etapa tiene intervencion proactiva)

4. **Funnel Analytics Dashboard:**
   - Visualizacion: funnel con % de conversion por etapa y por grupo
   - Alertas: cuando conversion cae >10% vs. target
   - Cohort analysis: comparar waves (Wave 1 vs Wave 2 vs Wave 3)
   - Time-in-stage: identificar cuellos de botella

5. **Disenar la estrategia S2-S7 ALREDEDOR del funnel:**
   - S2 (Rollout): optimizar para conversion Awareness → Trial
   - S3 (Communication): mensajes diseñados para mover de etapa en etapa
   - S4 (Training): reducir drop-off entre Trial → Active Use
   - S5 (Resistance): diagnosticar en que etapa se atasca la resistencia
   - S6 (Champions): champions como "conversion optimizers" en cada etapa
   - S7 (Reinforcement): evitar churn en Active Use → Proficiency

Output: Adoption Funnel Model + Stage-specific strategy + Analytics Dashboard Spec
```

### When to Use

- Data-driven organizations that need granular metrics
- When adoption is currently measured as binary (adopted/not adopted) and nuance is needed
- Transformations with multiple waves where cohorts can be compared
- When you need to diagnose WHERE adoption fails (not just IF it fails)

---

## Combining Meta-strategies

| Combination | Result | Use Case |
|-------------|--------|----------|
| Audience Segmentation + Funnel Analysis | Personalized funnel per persona | Large org with uneven adoption |
| Channel Optimization + Audience Segmentation | Optimal channel per persona + message type | Multi-site/multi-channel org |
| Gamification + Funnel Analysis | Gamification designed to optimize conversion per stage | Voluntary adoption with metrics |
| Channel Optimization + Gamification | Quests delivered via optimal channel per segment | Tech-savvy orgs with multiple channels |

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
