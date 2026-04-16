# Metaprompts — Software Viability: Substance vs Smoke

> Meta-level strategies for maximizing the effectiveness of this skill.
> Metaprompts do not produce deliverables — they optimize HOW they are produced.

---

## 1. Smoke Detection Protocol

**Purpose:** Systematize the identification of smoke signals in technological claims. Apply BEFORE evaluating each technology.

```
Antes de asignar cualquier veredicto, aplica este protocolo de detección de humo:

CAPA 1 — SEÑALES LINGÜÍSTICAS (5 min):
- ¿Usa superlativos sin métricas? ("best-in-class", "state of the art", "revolutionary")
- ¿Los claims son vagos? ("enterprise-grade" sin definir qué significa)
- ¿Hay métricas sin contexto? ("99.9% accuracy" — ¿en qué dataset? ¿con qué distribución?)
- ¿Hay comparaciones sin baseline? ("50% faster" — ¿que qué? ¿medido cómo?)

CAPA 2 — SEÑALES DE EVIDENCIA (15 min):
- ¿Hay producción verificable? (no "trusted by 500 companies" sin nombres)
- ¿Los benchmarks son reproducibles? (¿código disponible? ¿datos accesibles?)
- ¿Hay postmortems o case studies con detalles técnicos?
- ¿La documentación técnica es profunda o es solo getting-started?

CAPA 3 — SEÑALES ESTRUCTURALES (30 min):
- ¿El repo tiene tests? ¿Coverage > 60%?
- ¿Hay CI/CD visible? ¿Los checks pasan?
- ¿Las issues se responden? ¿Hay triage?
- ¿La governance es clara? ¿Hay roadmap público?

SCORING:
- 0-2 red flags: Proceder con evaluación estándar
- 3-5 red flags: Elevar escrutinio, marcar como 🟡 techo máximo
- 6+ red flags: Marcar como 🟠 mínimo, documentar cada red flag
```

---

## 2. Context-Calibrated Verdict

**Purpose:** Avoid absolute verdicts. The same technology can be substance for one team and risk for another. Always calibrate to context.

```
Antes de emitir el veredicto final de cada tecnología, calibra contra el contexto:

FACTOR 1 — EQUIPO:
- "¿El equipo tiene experiencia con esta tecnología?"
  → Sin experiencia: bajar 1 nivel (🟢→🟡, 🟡→🟠)
  → Experiencia probada: mantener
- "¿Hay capacity para aprender?"
  → Si timeline < 6 meses y sin experiencia: 🟠 mínimo

FACTOR 2 — CRITICIDAD:
- "¿Qué pasa si esta tecnología falla?"
  → Misión-crítica: requiere 🟢 o PoC obligatorio
  → Soporte/interno: 🟡 aceptable
- "¿Hay alternativa si esto no funciona?"
  → Sin alternativa: bajar 1 nivel por lock-in implícito

FACTOR 3 — TIMELINE:
- "¿Cuánto tiempo hay para validar?"
  → Sprint 0 disponible: PoC factible
  → Sin Sprint 0: aceptar riesgo o elegir alternativa probada

FACTOR 4 — ESCALA:
- "¿La producción evidence es a la escala que necesitamos?"
  → 1K users ≠ 1M users. Evidence a escala menor es 🟡, no 🟢

Documenta los 4 factores en el scorecard. El veredicto = evaluación técnica + calibración contextual.
```

---

## 3. Evidence Hierarchy

**Purpose:** Not all evidence carries the same weight. Establish a clear hierarchy so that verdicts are reproducible and defensible.

```
Al evaluar cada claim, clasifica la evidencia según esta jerarquía (de mayor a menor peso):

NIVEL 1 — EVIDENCIA DIRECTA (peso: 5):
- Código fuente verificable (repo público, código del proyecto)
- Benchmarks reproducibles (datos + código + metodología disponibles)
- Postmortems públicos con datos técnicos
- Métricas de producción verificables (público o proporcionado por el cliente)
  Etiqueta: [CÓDIGO], [BENCHMARK]

NIVEL 2 — EVIDENCIA DOCUMENTADA (peso: 3):
- Documentación técnica detallada (API reference, architecture docs)
- Case studies con detalles técnicos (no solo "we used X and loved it")
- Artículos académicos peer-reviewed
- Conference talks con demos técnicos
  Etiqueta: [DOC], [VENDOR-DOC]

NIVEL 3 — EVIDENCIA INFERIDA (peso: 2):
- Adoption metrics (GitHub stars, npm downloads, StackOverflow activity)
- Ratings y reviews (G2, Gartner Peer Insights)
- ThoughtWorks Radar / Gartner Hype Cycle positioning
- Análisis de competidores y market share
  Etiqueta: [INFERENCIA]

NIVEL 4 — OPINIÓN / MARKETING (peso: 1):
- Vendor marketing materials (decks, landing pages)
- Testimonios de clientes sin detalles técnicos
- "Trusted by" logos sin case studies
- Self-reported metrics sin verificación independiente
  Etiqueta: [SUPUESTO]

REGLA: Un veredicto 🟢 requiere al menos 2 evidencias de Nivel 1 o 2.
Un veredicto 🟡 requiere al menos 1 evidencia de Nivel 2.
Un veredicto basado solo en Nivel 3-4 es 🟠 máximo.
```

---

## 4. Viability Anti-Patterns (What NOT to Do)

**Purpose:** Avoid the most common biases and errors when evaluating technological viability.

```
ANTI-PATRÓN 1: "Popularity Bias" (Sesgo de Popularidad)
❌ "Tiene 50K GitHub stars, por lo tanto es viable"
✅ "Tiene 50K stars — ahora verifico: ¿quién lo usa en producción? ¿con qué resultados?"
Por qué: Stars miden interés, no viabilidad. Muchos proyectos populares tienen
problemas graves de mantenimiento, seguridad, o performance a escala.

ANTI-PATRÓN 2: "Vendor Trust" (Confianza ciega en vendor)
❌ "Es de Google/Microsoft/Amazon, por lo tanto es viable"
✅ "Es de un major vendor — pero ¿tiene historial de discontinuar productos similares?"
Por qué: Google Killed 293+ products. Amazon retired multiple services. El backing
corporativo no garantiza continuidad.

ANTI-PATRÓN 3: "PoC Equals Production"
❌ "El PoC funcionó perfectamente, tecnología validada"
✅ "El PoC validó {X} — pero no validó: scaling, security, ops, cost at scale, edge cases"
Por qué: El gap PoC→producción es donde mueren las tecnologías. Documentar
explícitamente qué NO se validó.

ANTI-PATRÓN 4: "Binary Verdict" (Veredicto binario)
❌ "Esta tecnología es buena" / "Esta tecnología es mala"
✅ "Esta tecnología es 🟢 para {contexto A} y 🟠 para {contexto B}"
Por qué: Viabilidad es contextual. El veredicto siempre incluye para quién,
para qué, y bajo qué restricciones.

ANTI-PATRÓN 5: "Ignoring the Team"
❌ "La tecnología es madura, por lo tanto el proyecto es viable"
✅ "La tecnología es madura, pero el equipo no tiene experiencia — viabilidad
depende de training + hiring timeline"
Por qué: La mejor tecnología en las manos equivocadas es 🟠.
```

---

## 5. Comparative Evaluation Framework

**Purpose:** When there are multiple options, avoid analysis paralysis and produce a well-founded recommendation.

```
Cuando evalúas 2+ alternativas para el mismo rol en el stack:

PASO 1 — ELIMINACIÓN RÁPIDA (5 min por candidato):
- ¿Hay algún deal-breaker? (licencia incompatible, EOL, regulatorio)
- ¿Alguna es 🔴 HUMO por red flags obvios?
→ Eliminar y documentar razón.

PASO 2 — TABLA COMPARATIVA (15 min):
Construir tabla con dimensiones ponderadas por el contexto:
| Dimensión | Peso | Candidato A | Candidato B | Candidato C |
|---|---|---|---|---|
| Maturity | {peso}% | /5 | /5 | /5 |
| Community | {peso}% | /5 | /5 | /5 |
| Production Evidence | {peso}% | /5 | /5 | /5 |
| Team Fit | {peso}% | /5 | /5 | /5 |
| Vendor/Lock-in Risk | {peso}% | /5 | /5 | /5 |
| Cost (TCO estimado) | {peso}% | /5 | /5 | /5 |

PASO 3 — SENSITIVITY ANALYSIS (10 min):
- "¿Cambia la recomendación si ajusto los pesos?"
- "¿Qué peso necesitaría {dimensión X} para que gane otro candidato?"
→ Si la recomendación es robusta ante cambios de peso, confianza alta.
→ Si cambia fácilmente, documentar la sensibilidad.

PASO 4 — RECOMENDACIÓN:
"Recomendamos {X} porque es superior en {dimensiones dominantes}.
{Y} es alternativa viable si {condición}.
{Z} descartada por {razón}."
```

---

**Author:** Javier Montaño | **Last updated:** March 13, 2026
**© Comunidad MetodologIA — All rights reserved**
