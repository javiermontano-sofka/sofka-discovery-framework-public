# Metaprompts — Risk & Controlling Dynamics

> **Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
> **© Comunidad MetodologIA** — Todos los derechos reservados

---

## Propósito

Estrategias de meta-prompting para amplificar la profundidad, honestidad y cobertura del análisis de riesgos. Cada metaprompt opera como un patrón reutilizable que desafía los sesgos cognitivos y fuerza una evaluación más rigurosa.

---

## MP-01: El Abogado del Diablo — Adversarial Risk Challenge

### Estrategia

Generar el risk assessment desde dos perspectivas opuestas: el "optimista informado" y el "pesimista informado". La tensión entre ambos produce un resultado más calibrado que cualquiera de los dos por separado.

### Metaprompt

```
Para el proyecto {PROYECTO}, ejecuta un adversarial risk challenge:

PERSPECTIVA 1 — EL OPTIMISTA INFORMADO:
Genera el risk assessment desde la perspectiva de alguien que CREE que el proyecto
va a ser exitoso, pero tiene razones legítimas (no ingenuas) para creerlo.
- ¿Por qué los riesgos identificados son manejables?
- ¿Qué evidencia soporta que las mitigaciones van a funcionar?
- ¿Por qué este equipo SÍ puede ejecutar esto?
- ¿Qué experiencias previas similares tuvieron buen resultado?

PERSPECTIVA 2 — EL PESIMISTA INFORMADO:
Genera el risk assessment desde la perspectiva de alguien que CREE que el proyecto
va a fracasar, pero tiene razones legítimas (no paranoicas) para creerlo.
- ¿Por qué los riesgos están subestimados?
- ¿Qué mitigaciones son wishful thinking?
- ¿Dónde están los blind spots que nadie quiere ver?
- ¿Qué patrones de fracaso en proyectos similares aplican aquí?

SÍNTESIS — EL CONTROLLER CALIBRADO:
Evalúa ambas perspectivas con evidencia. Para cada riesgo:
- ¿El optimista o el pesimista tiene mejor evidencia?
- ¿El nivel de confianza del optimista está justificado?
- ¿Las preocupaciones del pesimista tienen fundamento empírico?
- ¿Cuál es la evaluación calibrada HONESTA?

Output: Risk register con dos columnas adicionales — "argumento optimista"
y "argumento pesimista" — que documenten la tensión deliberada.
```

### Cuándo Usar

- Cuando se sospecha que el equipo tiene sesgo de confirmación (todo parece factible)
- Cuando el risk register tiene demasiados riesgos "Medium/Medium" (falta de calibración)
- Para proyectos donde el steering committee necesita ver ambos lados

### Output Esperado

Risk register con perspectiva dual documentada y calibración explícita entre optimismo y pesimismo.

---

## MP-02: Cascada de Consecuencias — "¿Y Luego Qué?"

### Estrategia

Para cada riesgo identificado, forzar la exploración de consecuencias de segundo, tercer y cuarto orden. Los riesgos directos son obvios — los peligrosos son los que causan.

### Metaprompt

```
Para cada riesgo en el risk register de {PROYECTO}, ejecuta la cascada:

RIESGO: {descripción del riesgo}

ORDEN 1 (Impacto Directo):
"Si {riesgo} se materializa, ¿qué pasa inmediatamente?"
→ {consecuencia directa}

ORDEN 2 (Consecuencia Secundaria):
"Si {consecuencia directa} ocurre, ¿qué causa eso?"
→ {consecuencia secundaria}

ORDEN 3 (Efecto Sistémico):
"Si {consecuencia secundaria} persiste, ¿qué se rompe en el sistema más amplio?"
→ {efecto sistémico}

ORDEN 4 (Consecuencia Irreversible):
"Si {efecto sistémico} no se controla, ¿qué daño es irreversible?"
→ {consecuencia irreversible}

Para cada cadena de cascada:
- Identifica el punto de intervención más temprano (cheapest fix)
- Identifica el punto de no retorno (past here, damage is permanent)
- Diseña la mitigación en el punto de intervención, no en la consecuencia final

Output: Diagrama flowchart (Mermaid) de cascadas de riesgo con puntos de intervención
marcados y puntos de no retorno señalados.
```

### Cuándo Usar

- Para los top 5 riesgos del register (no para todos — sería excesivo)
- Cuando se necesita justificar inversión en mitigación (mostrar el costo de no actuar)
- Para proyectos con alta interdependencia entre componentes

### Output Esperado

Diagrama de cascadas con puntos de intervención y una tabla que mapea cada punto de intervención a su costo de mitigación vs costo de no actuar.

---

## MP-03: Auditoría de Sesgos Cognitivos — "¿Estamos Pensando Bien?"

### Estrategia

Revisar el risk assessment completo buscando sesgos cognitivos específicos que distorsionan la evaluación de riesgos. Cada sesgo tiene un antídoto concreto.

### Metaprompt

```
Audita el risk assessment de {PROYECTO} buscando estos sesgos específicos:

SESGO 1 — OPTIMISM BIAS:
"¿Las probabilidades de riesgo están artificialmente bajas?"
Evidencia: ¿Cuántos riesgos tienen probabilidad "Baja"? Si >60%, sospechoso.
Antídoto: Reference class forecasting — ¿qué porcentaje de proyectos similares
experimentaron este riesgo?

SESGO 2 — ANCHORING:
"¿Las estimaciones están ancladas a un número inicial sin ajuste suficiente?"
Evidencia: ¿Los rangos de magnitud son simétricos alrededor de un punto (±20%)?
Eso sugiere anchoring, no análisis real.
Antídoto: Estimar desde cero sin ver números previos, luego comparar.

SESGO 3 — AVAILABILITY BIAS:
"¿Los riesgos identificados son solo los que recordamos fácilmente?"
Evidencia: ¿Hay categorías del risk register vacías? Eso no significa que no hay
riesgos en esa categoría — significa que no los estamos buscando.
Antídoto: Scanning sistemático de las 8 categorías con checklist.

SESGO 4 — GROUPTHINK:
"¿El equipo está de acuerdo en todo porque nadie quiere disentir?"
Evidencia: ¿Hay riesgos con posiciones divergentes documentadas?
Si no hay ninguna divergencia, el proceso no fue genuino.
Antídoto: Votación anónima de probabilidad/impacto antes de discusión grupal.

SESGO 5 — PLANNING FALLACY:
"¿El timeline y budget asumen el best-case scenario como base?"
Evidencia: ¿La estimación base es cercana al P50 o al P20?
Antídoto: Usar P80 como base y P50 como stretch goal.

SESGO 6 — SUNK COST:
"¿Se están minimizando riesgos porque ya se invirtió mucho en este approach?"
Evidencia: ¿Hay kill criteria definidos? Si no, el equipo planea seguir pase lo que pase.
Antídoto: Pre-definir condiciones de pivot/kill ANTES de invertir.

Para cada sesgo detectado:
1. Documenta la evidencia de sesgo
2. Cuantifica el impacto potencial en la evaluación
3. Aplica el antídoto y documenta el ajuste
4. Re-evalúa los riesgos afectados con la corrección

Output: "Bias Audit Report" con sesgos detectados, correcciones aplicadas,
y risk register ajustado post-debiasing.
```

### Cuándo Usar

- Como paso obligatorio antes de finalizar cualquier risk assessment
- Cuando el risk register "se siente" demasiado limpio o demasiado manejable
- Para discovery workshops donde las mismas personas evaluaron riesgos y diseñaron soluciones

### Output Esperado

Bias Audit Report con antes/después del risk register, mostrando el impacto de cada corrección de sesgo.

---

## MP-04: Simulación de Escalación — "El Día que Sonó la Alarma"

### Estrategia

Simular el protocolo de escalación completo para el riesgo más crítico del register. Verificar que el pipeline de escalación funciona en la práctica, no solo en el papel.

### Metaprompt

```
Simula la escalación del riesgo más crítico del proyecto {PROYECTO}:

SETUP:
Selecciona el riesgo con mayor exposure (Probabilidad × Impacto) del risk register.

SIMULACIÓN — TIEMPO REAL:

T+0h: {SEÑAL TEMPRANA DETECTADA}
- ¿Quién la detecta? ¿A través de qué mecanismo?
- ¿Cómo se documenta? ¿Dónde se registra?

T+2h: {SEÑAL CONFIRMADA — NO ES FALSA ALARMA}
- ¿Quién es notificado? ¿Cómo (Slack, email, llamada)?
- ¿Qué información se incluye en la notificación?
- ¿Quién tiene autoridad para activar la respuesta?

T+4h: {KILL CRITERION TRIGGERED}
- ¿Se activa el plan de mitigación? ¿Quién lo ejecuta?
- ¿Se para el sprint en curso? ¿Quién toma esa decisión?
- ¿Se convoca steering committee de emergencia?

T+8h: {DECISIÓN REQUERIDA — PIVOT/HOLD/PROCEED}
- ¿Quién presenta las opciones? ¿Con qué datos?
- ¿Quién decide? ¿Con qué autoridad?
- ¿Cómo se documenta la decisión?

T+24h: {POST-DECISIÓN — COMUNICACIÓN}
- ¿Cómo se comunica al equipo?
- ¿Cómo se comunica al cliente?
- ¿Cómo se actualiza el risk register?

EVALUACIÓN DE LA SIMULACIÓN:
- ¿El protocolo de escalación fue claro en cada paso?
- ¿Las autoridades de decisión estaban definidas?
- ¿Los tiempos de respuesta son realistas?
- ¿Falta algún paso o rol?
- ¿Qué pasaría si la persona clave no está disponible (backup)?

Output: Protocolo de escalación refinado + gaps identificados + playbook de respuesta.
```

### Cuándo Usar

- Para proyectos de alta criticidad donde el costo de una mala respuesta es alto
- Cuando el equipo nunca ha practicado un protocolo de escalación
- Como ejercicio de preparación antes de fases críticas del pipeline

### Output Esperado

Playbook de respuesta a incidentes con roles, tiempos, y canales de comunicación verificados.

---

## MP-05: Cross-Validation con Pipeline Completo — "El Controller que Todo lo Ve"

### Estrategia

Ejecutar un scan transversal de todo el pipeline de discovery, verificando que los riesgos identificados en cada fase son consistentes y que no hay gaps entre fases.

### Metaprompt

```
Ejecuta cross-validation del risk assessment contra todo el pipeline de {PROYECTO}:

Para CADA entregable del pipeline (00 a 09), verifica:

CONSISTENCIA INTERNA:
- ¿Los riesgos mencionados en el entregable están en el risk register? (completeness)
- ¿Los supuestos del entregable están en el assumption log? (traceability)
- ¿Las magnitudes del entregable son coherentes con S6 financial controls? (accuracy)

CONSISTENCIA CROSS-ENTREGABLE:
- ¿El AS-IS (03) identifica deuda técnica que el Roadmap (06) no aborda?
- ¿Los Flujos (04) tienen dependencias que los Escenarios (05) no consideran?
- ¿La Spec (07) promete features que el Roadmap (06) no tiene en scope?
- ¿El Pitch (08) hace claims que la Feasibility (05b) no respaldó?
- ¿El Handover (09) asume capacidades que el AS-IS (03) no confirmó?

GAPS DE RIESGO:
- ¿Hay riesgos mencionados en entregables pero no en el risk register?
- ¿Hay categorías del risk register sin riesgos? ¿Es legítimo o es blind spot?
- ¿Hay supuestos no validados que la propuesta trata como hechos?

Output: Cross-validation matrix con semáforos por entregable + lista de gaps
priorizados por impacto + recomendaciones de remediación.
```

### Cuándo Usar

- Como paso final antes de generar la propuesta (Pre-G3)
- Cuando múltiples personas trabajaron en diferentes fases (riesgo de desconexión)
- Cuando el pipeline fue largo (>3 semanas) y la información temprana puede estar desactualizada

### Output Esperado

Matrix de cross-validation con semáforos y lista accionable de gaps a cerrar antes del envío de propuesta.
