# Metaprompts — Hypothesis-Driven Development

> Meta-level strategies to maximize the effectiveness of this skill.
> Metaprompts do not produce deliverables — they optimize HOW they are produced.

---

## 1. Hypothesis Quality Checker (SMART Criteria)

**Purpose:** Verify that each hypothesis in the portfolio meets minimum quality criteria before investing in experimentation. A poorly formulated hypothesis produces ambiguous results that do not inform decisions.

```
Para CADA hipotesis en el portfolio, ejecuta este quality check basado en criterios SMART:

SPECIFIC (Especifica):
❌ "Creemos que el sistema sera mas rapido" — vago, no medible
✅ "Creemos que el endpoint POST /claims respondera en <300ms p99 bajo 1,200 req/hr"
□ CHECK: ¿La hipotesis especifica WHO (quien se beneficia), WHAT (que resultado),
  y WHERE (en que contexto/condicion)?

MEASURABLE (Medible):
❌ "Mejoraremos la experiencia del usuario" — no hay metrica
✅ "El NPS transaccional post-claim mejorara de 32 a 45"
□ CHECK: ¿La metrica tiene unidad, baseline, y target numerico?
□ CHECK: ¿La metrica es accionable (informa una decision) o vanity (solo sube)?
□ CHECK: ¿Existe instrumentacion para medir esta metrica? Si no, ¿cual es el costo
  de implementarla?

ACHIEVABLE (Alcanzable):
❌ "Reduciremos el processing time de 14 dias a 0 dias" — fisicamente imposible
✅ "Reduciremos el processing time de 14 dias a 7 dias para reclamos Tier-1"
□ CHECK: ¿El threshold de persevere es ambicioso pero fisicamente posible?
□ CHECK: ¿Hay benchmarks de industria o precedentes que soporten el target?
□ CHECK: ¿El threshold de kill no es tan bajo que cualquier resultado "pase"?

RELEVANT (Relevante):
❌ Hipotesis que no conecta con el escenario recomendado ni con drivers del proyecto
✅ Hipotesis que valida un supuesto critico del escenario cuyo fracaso cambiaria la recomendacion
□ CHECK: ¿Si esta hipotesis se mata, cambia el roadmap significativamente?
□ CHECK: ¿Esta hipotesis valida el supuesto MAS riesgoso (riskiest assumption)?
□ CHECK: ¿O estamos validando algo facil para sentir progreso? (sesgo de confirmacion)

TIME-BOUND (Acotada en tiempo):
❌ "Lo experimentaremos cuando podamos" — sin deadline
✅ "Spike de 2 semanas, resultados el 15 de marzo"
□ CHECK: ¿El experimento tiene duracion definida?
□ CHECK: ¿Hay checkpoints intermedios para aborto temprano?
□ CHECK: ¿El timeline es proporcional al riesgo? (alto riesgo = experimento corto primero)

SCORING:
- 5/5 SMART: Hipotesis lista para experimentacion
- 3-4/5 SMART: Refinar antes de invertir
- <3/5 SMART: Rechazar — reformular desde cero

Producir tabla con resultado SMART por hipotesis y recomendacion de accion.
```

---

## 2. Experiment Minimality Validator

**Purpose:** Ensure that each experiment is the MINIMUM necessary to inform the decision. The natural bias is to over-design experiments (more time, more scope, more team) because experimentation is confused with implementation.

```
Para CADA experimento diseñado, ejecuta este minimality check:

PRINCIPIO: Un experimento debe responder UNA pregunta con el MINIMO esfuerzo posible.
Si puedes responder la misma pregunta con menos, hazlo.

CHECK 1 — Scope Creep Detection:
□ ¿El experimento esta resolviendo UNA hipotesis o se convirtio en mini-proyecto?
□ ¿Hay features en el experimento que no contribuyen a medir la metrica?
□ ¿El PoC se esta convirtiendo en v1 del producto? (sintoma: "ya que estamos, agreguemos...")
→ RED FLAG: Si el experimento dura > 6 semanas, probablemente es un proyecto disfrazado.
→ ACCION: Partir en sub-experimentos de 1-3 semanas cada uno.

CHECK 2 — Cheaper Alternative Exists?:
□ ¿Se puede responder la pregunta con una ENCUESTA en lugar de un PoC?
□ ¿Se puede responder con DATOS EXISTENTES en lugar de recolectar nuevos?
□ ¿Se puede responder con un PROTOTIPO DE PAPEL en lugar de codigo funcional?
□ ¿Se puede responder con un A/B TEST con feature flag en lugar de nuevo servicio?
→ Escala de costo: Encuesta < Prototipo < Feature Flag < Spike < PoC < MVP
→ ACCION: Siempre elegir el metodo mas barato que responda la pregunta con
  confianza suficiente para la magnitud de la decision.

CHECK 3 — Team Size Proportionality:
□ ¿El equipo del experimento es proporcional a la pregunta?
□ ¿Se necesitan realmente {N} ingenieros o es por comfort?
□ ¿Hay dependencias de otros equipos que se pueden eliminar? (mock, stub, simulate)
→ RED FLAG: Si el experimento requiere > 4 personas, probablemente se puede simplificar.

CHECK 4 — Duration Proportionality:
□ ¿La duracion es proporcional al riesgo de la hipotesis?
□ Hipotesis de bajo impacto (<$50K): max 1-2 semanas de experimento
□ Hipotesis de medio impacto ($50K-$200K): max 2-4 semanas
□ Hipotesis de alto impacto (>$200K): max 4-6 semanas
→ ACCION: Si la duracion excede el rango, partir en fases con go/no-go intermedio.

CHECK 5 — Learning Maximization:
□ ¿El experimento esta diseñado para APRENDER o para DEMOSTRAR?
□ Diseñado para aprender: acepta que el resultado puede ser kill, y eso es valioso.
□ Diseñado para demostrar: busca confirmar lo que ya se cree (sesgo de confirmacion).
→ TEST ACIDO: Si no existe escenario plausible donde el resultado sea "kill",
  el experimento no es un experimento — es una implementacion con permiso.

Producir: Tabla de minimality score por experimento con recomendacion de simplificacion.
```

---

## 3. Decision Gate Calibrator

**Purpose:** Calibrate decision thresholds (kill/pivot/persevere) to be fair, useful, and non-manipulable. A poorly calibrated threshold produces erroneous decisions.

```
Para CADA hipotesis, ejecuta este calibration check sobre los thresholds:

CALIBRATION 1 — Threshold Anchoring:
¿De donde vienen los numeros del threshold?
□ BENCHMARK de industria: fuerte. Documentar fuente y fecha.
□ DATO INTERNO (baseline actual): fuerte. Documentar medicion.
□ OPINION DEL EQUIPO: debil. ¿Cuantas personas opinaron? ¿Hay consenso?
□ "ME PARECE RAZONABLE": inaceptable. Buscar evidencia.
→ REGLA: Todo threshold debe tener al menos un anchor (benchmark o baseline).
  Sin anchor, el threshold es arbitrario.

CALIBRATION 2 — Kill Threshold Too Low?:
Si el threshold de kill es muy bajo, casi cualquier resultado "pasa" y la hipotesis
nunca se mata. Esto anula el proposito del HDD.
□ ¿El threshold de kill es < 50% del target de persevere? Probablemente muy bajo.
□ ¿Existe un escenario realista donde el resultado caiga en zona kill?
□ Si no, el threshold de kill es cosmetico — esta para aparentar rigor.
→ ACCION: Kill threshold = el punto donde la hipotesis deja de tener sentido
  economico. Calcular: "¿A partir de que resultado la inversion no se justifica?"

CALIBRATION 3 — Persevere Threshold Too High?:
Si el threshold de persevere es inalcanzable, toda hipotesis termina en pivot o kill.
Esto paraliza el avance.
□ ¿El threshold de persevere es > 2x el benchmark de industria? Probablemente muy alto.
□ ¿Hay precedentes de que ese threshold se haya alcanzado alguna vez?
□ Si requiere condiciones perfectas para alcanzarse, es irrealista.
→ ACCION: Persevere threshold = resultado a partir del cual la confianza es
  suficiente para escalar. No necesita ser perfecto — necesita ser "enough."

CALIBRATION 4 — Pivot Zone Width:
La zona de pivot es el espacio entre kill y persevere. Si es muy ancha, la mayoria
de resultados caen ahi y la decision es "pivot" por default (indecision disfrazada).
□ ¿La zona de pivot cubre > 50% del rango posible? Probablemente muy ancha.
□ ¿Las acciones de pivot estan definidas concretamente? ¿O es "ajustar y re-evaluar"?
→ ACCION: Pivot zone = 20-30% del rango. Kill y persevere deben ser las zonas
  dominantes. Pivot es la excepcion, no la regla.

CALIBRATION 5 — Stakeholder Gaming:
¿Algun stakeholder podria manipular los thresholds para forzar una decision?
□ ¿El sponsor del proyecto definio los thresholds sin challenge?
□ ¿Los thresholds se definieron DESPUES de ver resultados preliminares? (p-hacking)
□ ¿Se pueden mover los thresholds despues de empezar el experimento?
→ REGLA: Los thresholds se definen ANTES del experimento y se FIRMAN.
  Cualquier cambio post-inicio requiere justificacion documentada y aprobacion
  del risk-controller.

Producir: Calibration report por hipotesis con score y recomendaciones de ajuste.
```

---

## 4. Sunk Cost Bias Detector

**Purpose:** Detect when the organization is resisting a kill decision because it has already invested time, money, or political capital in the hypothesis. The sunk cost fallacy is the main enemy of HDD in enterprise.

```
Cuando una hipotesis esta en zona de kill pero hay resistencia a matarla,
ejecuta este diagnostic:

SIGNAL 1 — "Ya invertimos mucho":
□ ¿Alguien menciona la inversion ya realizada como argumento para continuar?
□ ¿Se dice "si paramos ahora, perdemos los $X que ya gastamos"?
→ REALIDAD: Los $X ya se gastaron. Son irrecuperables. La pregunta correcta es:
  "¿Es mejor gastar $Y adicionales, o redirigir $Y a otra hipotesis?"
→ REFRAME: "El costo de CONTINUAR es $Y. El costo de PARAR es $0.
  ¿Justifica la evidencia gastar $Y mas?"

SIGNAL 2 — "Solo necesitamos un poco mas de tiempo":
□ ¿Se pide extender el experimento sin nuevo threshold definido?
□ ¿La extension no tiene fecha de fin clara?
→ REALIDAD: Si el resultado actual esta en zona kill, mas tiempo rara vez cambia
  la conclusion. El patron "un poquito mas" es clasico de sunk cost.
→ CONTRAMEDIDA: "Aceptamos extender 1 semana SI definimos ahora el nuevo threshold.
  Si en 1 semana el resultado sigue en zona kill, la decision es final."

SIGNAL 3 — "El threshold estaba mal definido":
□ ¿Se cuestiona el threshold DESPUES de ver resultados en zona kill?
□ ¿El threshold "correcto" convenientemente coincide con el resultado obtenido?
→ REALIDAD: Cambiar thresholds post-resultado es p-hacking organizacional.
→ CONTRAMEDIDA: "Los thresholds fueron acordados el {FECHA}. Si queremos cambiarlos,
  necesitamos justificacion basada en nueva informacion (no en resultados del experimento)."

SIGNAL 4 — "Pero el sponsor quiere esto":
□ ¿La decision esta siendo influenciada por jerarquia en lugar de evidencia?
□ ¿El sponsor definio la hipotesis y ahora no acepta el resultado?
→ REALIDAD: HDD solo funciona si la evidencia pesa mas que las opiniones.
→ CONTRAMEDIDA: Presentar en steering committee con formato estandar:
  "Threshold was X. Result was Y. Evidence says kill. Override requires documented rationale."

SIGNAL 5 — "Pero el equipo se desmotivara si matamos el proyecto":
□ ¿Se evita el kill para proteger la moral del equipo?
→ REALIDAD: Los equipos se desmotivan MAS cuando se les obliga a continuar algo
  que saben que no funciona. Un kill limpio es mas respetuoso que un zombie project.
→ CONTRAMEDIDA: Celebrar el kill como aprendizaje. "Aprendimos que X no funciona.
  Evitamos gastar $Y. Ahora podemos invertir en algo que si funcione."

DIAGNOSTIC OUTPUT:
Para cada hipotesis en zona kill con resistencia:
- Signals detectados (1-5)
- Severidad: Baja (1 signal) / Media (2-3) / Alta (4-5)
- Recomendacion: Proceder con kill / Escalar a steering committee / Permitir
  extension controlada (max 1 semana, nuevo threshold firmado)

REGLA DE ORO: Si la evidencia dice kill y hay 3+ signals de sunk cost,
la decision es KILL. El sesgo no puede ganar.
```

---

## 5. Metric Actionability Auditor

**Purpose:** Verify that the metrics selected for each hypothesis are genuinely actionable — that is, they inform a concrete decision — and are not disguised vanity metrics.

```
Para CADA metrica en el portfolio de hipotesis, ejecuta este audit:

TEST 1 — Actionability Test (Ries):
Pregunta: "Si esta metrica cambia, ¿que decision diferente tomariamos?"
□ SI respuesta clara → metrica accionable. Documentar la decision.
□ NO respuesta clara → vanity metric. Reemplazar.

Ejemplos:
- "Paginas vistas del portal" → ¿que decision? → Ninguna clara → VANITY
- "% usuarios que completan claim submission" → ¿que decision? → Si <60%, pivot
  a flujo simplificado → ACTIONABLE

TEST 2 — Leading vs Lagging:
□ ¿La metrica es un leading indicator (predice el resultado) o un lagging indicator
  (confirma despues del hecho)?
□ Leading: NPS despues de la primera interaccion (predice retencion)
□ Lagging: Revenue anual (confirma mucho despues)
→ PREFERENCIA: Leading indicators para hipotesis. Lagging para portfolio review.
→ REGLA: Si solo tienes lagging indicators, el experimento sera demasiado largo.
  Buscar un proxy leading.

TEST 3 — Manipulability Check:
□ ¿Esta metrica puede ser "gamed" sin generar valor real?
□ "Numero de features entregadas" → se puede gaming (features pequenas, sin valor)
□ "% de usuarios que logran el outcome X" → dificil de gaming
→ REGLA: Preferir metricas de OUTCOME (resultado para el usuario) sobre metricas
  de OUTPUT (cosas que el equipo produjo).

TEST 4 — Measurement Feasibility:
□ ¿Tenemos la instrumentacion para medir esta metrica HOY?
□ Si no, ¿cual es el costo de implementar la instrumentacion?
□ ¿El costo de medir es proporcional al valor de la hipotesis?
→ ALERTA: Si medir cuesta mas que experimentar, la metrica es demasiado costosa.
  Buscar un proxy mas barato.

TEST 5 — Baseline Availability:
□ ¿Tenemos baseline actual (valor antes del experimento)?
□ Sin baseline, no podemos medir delta.
□ Si no hay baseline, el primer paso del experimento es MEDIR baseline (1-2 semanas).
→ REGLA: Nunca empezar un experimento sin baseline.
  "Mejoramos el NPS" no significa nada sin saber el NPS de partida.

AUDIT OUTPUT:
Tabla por hipotesis:
| Hipotesis | Metrica | Actionable? | Leading/Lagging | Gameable? | Measurable? | Baseline? | Score |
Score: 5/5 = listo. 3-4/5 = ajustar. <3/5 = reemplazar metrica.
```

---

**Author:** Javier Montano | **Last updated:** March 13, 2026
**© Comunidad MetodologIA — All rights reserved**
