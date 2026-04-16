# Metaprompts — AS-IS Technical Analysis

> Meta-level strategies to maximize the effectiveness of this skill.
> Metaprompts don't produce deliverables — they optimize HOW they are produced.

---

## 1. Chain-of-Evidence

**Purpose:** Ensure that every finding has complete traceability from source code to recommendation.

```
Antes de escribir cualquier hallazgo en S5-S10, aplica esta cadena:

1. OBSERVACIÓN: ¿Qué ves en el código/config/logs? [Cita archivo:línea]
2. MEDICIÓN: ¿Qué métrica cuantifica esto? [Valor numérico]
3. COMPARACIÓN: ¿Cómo se compara con el benchmark? [Fuente del benchmark]
4. IMPACTO: ¿Qué consecuencia tiene para el negocio? [Traducción no-técnica]
5. ETIQUETA: [CÓDIGO] | [CONFIG] | [DOC] | [INFERENCIA] | [SUPUESTO]

Si no puedes completar los 5 pasos, el hallazgo es INFERENCIA, no EVIDENCIA.
Documéntalo como tal y marca el nivel de confianza (Alta/Media/Baja).
```

---

## 2. Adversarial Review

**Purpose:** Avoid confirmation bias. After completing a section, challenge it.

```
Al completar cada sección del AS-IS, ejecuta este self-check adversarial:

Para cada hallazgo principal:
- "¿Qué evidencia contradice este hallazgo?"
- "¿Hay una explicación alternativa para lo que observo?"
- "¿Estoy confundiendo un workaround intencional con un anti-patrón?"
- "¿Mi hallazgo sobreviviría si un senior dev del equipo lo cuestiona?"

Para el health score general:
- "¿Estoy siendo demasiado generoso (sesgo de cortesía) o demasiado severo (sesgo de negatividad)?"
- "Si comparo con otros sistemas de tamaño y edad similar, ¿este score es justo?"

Documenta 1-2 contra-argumentos por sección. Esto fortalece el análisis.
```

---

## 3. Progressive Depth

**Purpose:** Avoid analysis paralysis in large systems. Go from general to specific.

```
Para sistemas >200K LOC, usa esta estrategia de profundidad progresiva:

PASADA 1 (30 min): Surface scan
- LOC total, languages, build system, deployment
- README, CONTRIBUTING, arquitectura docs
- git log --oneline -50 (últimos 50 commits para ver actividad)
- Estructura de directorios top-level

PASADA 2 (2h): Structural analysis
- Dependency tree (build file analysis)
- Module boundaries (package/namespace structure)
- API surface (endpoints, contracts)
- Configuration landscape (envs, feature flags)

PASADA 3 (4h+): Deep dives (solo en áreas de riesgo)
- Código más cambiado (git hotspots)
- Código más complejo (cyclomatic >20)
- Código sin tests
- Código con TODOs/FIXMEs/HACKs

Nunca intentes analizar 500K LOC con la misma profundidad.
El 80% de los hallazgos críticos está en el 20% del código.
```

---

## 4. Audience Calibration

**Purpose:** Adjust tone and depth based on who will read the output.

```
Antes de escribir, identifica la audiencia primaria:

AUDIENCIA TÉCNICA (dev lead, architects):
- Incluir: file paths, line numbers, code snippets, metric values
- Tono: directo, evidencia-heavy, sin suavizar hallazgos
- Formato preferido: Markdown con code blocks
- Nivel de detalle: exhaustivo en S2, S3, S4

AUDIENCIA MIXTA (CTO, tech-savvy PM):
- Incluir: métricas con explicación, diagramas C4, risk heatmap
- Tono: profesional, cada hallazgo técnico con "so what?" de negocio
- Formato preferido: HTML con visualizaciones
- Nivel de detalle: equilibrado

AUDIENCIA EJECUTIVA (CEO, CFO, board):
- Incluir: health score, top-5, semáforos, costos de inacción
- Tono: narrativo, impacto financiero, sin jerga técnica
- Formato preferido: PPTX outline o brief ejecutivo
- Nivel de detalle: solo S0, S9, S10

Ajusta CADA sección al audience mapping definido.
```

---

## 5. Invocation Anti-Patterns (What NOT to Do)

**Purpose:** Avoid the most common mistakes when using this skill.

```
ANTI-PATRÓN 1: "Analizar todo con igual profundidad"
❌ "Ejecutar AS-IS completo de los 500K LOC"
✅ "Ejecutar AS-IS con focus en el módulo de pagos (dominio crítico)"
Por qué: Analysis paralysis. El output será tan largo que nadie lo leerá.

ANTI-PATRÓN 2: "Solo métricas sin contexto"
❌ "Dame el cyclomatic complexity de todos los archivos"
✅ "Evaluar la mantenibilidad del código con métricas + evidencia cualitativa"
Por qué: Un número sin contexto no es accionable. CC=25 es terrible en una utilidad de 10 líneas pero normal en un parser de 500 líneas.

ANTI-PATRÓN 3: "Buscar problemas sin reconocer fortalezas"
❌ "Encuentra todos los problemas del código"
✅ "Evaluar el estado actual: fortalezas, debilidades, riesgos, oportunidades"
Por qué: Un AS-IS que solo lista problemas pierde credibilidad. Los equipos que leen solo críticas se ponen a la defensiva.

ANTI-PATRÓN 4: "Omitir el workaround table"
❌ "No tengo logs de producción, skip S8"
✅ "No tengo logs — usar heurísticas de código para inferir operational model + flag as [INFERENCIA]"
Por qué: La ausencia de datos ES un hallazgo. "No hay monitoring" es más grave que "el monitoring tiene gaps".

ANTI-PATRÓN 5: "Asumir que el código habla por sí solo"
❌ "El código no miente"
✅ "El código muestra CÓMO pero no POR QUÉ. Buscar ADRs, PRs, commit messages para contexto de decisiones."
Por qué: Un workaround feo puede ser una decisión brillante en contexto. Sin el "por qué", juzgar incorrectamente.
```

---

**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**
