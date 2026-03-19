---
name: input-analysis
description: "This skill should be used when the user's input is messy, vague, ambiguous, contains typos, spanglish, or abbreviations, or when you need to understand what the user really means before executing a complex task. Pre-processing layer that detects surface errors (dyslexia, haste, spelling, punctuation, syntax), performs root cause analysis (5 Whys), impact tracing (7 So-Whats), and intent gap analysis — reformulating into a precise, actionable prompt. Make sure to use this skill whenever the user writes in informal shorthand, voice-to-text produces garbled text, a message contains multiple questions that need decomposition, emotional undertones mask the real request, or when dangling references like 'that thing we discussed' need resolution — even if the user doesn't explicitly ask for input analysis."
allowed-tools:
  - Read
  - Grep
  - Glob
  - Bash
---

# Input Analysis

Pre-processing layer that captures what the user *meant*, not just what they *wrote*. Every human input may contain surface noise, intent gaps, or implicit context — this skill detects and resolves them before downstream skills execute.

## Assumptions & Limits

- Infers intent from textual signals. When inference confidence is low, flag the ambiguity instead of committing to a guess.
- Language detection is heuristic. Spanglish inputs may lose nuance in reformulation.
- The 5 Whys analysis works best with sufficient thread context. On cold-start (first message, no history), root cause depth is limited.
- Reformulation adds nothing the user did not express or imply. The reason: adding phantom requirements derails downstream skills and wastes cycles.
- For very short inputs (< 5 words), skip passes 2-3 and focus only on intent verification.

## Usage

```
/input-analysis "eso q hblamos ayer dl tema ese pa la reunion d mañna"
/input-analysis --mode superficie "ncsito el diganostico del legasy"
/input-analysis --mode intencion "Ayúdame con el proyecto del banco"
```

## Before Analyzing

1. Read the raw user input in full — including any attachments or referenced context.
2. Assess input quality against this activation table to determine which passes to run:

| Input Quality | Passes to Execute | Example |
|---|---|---|
| Clear + specific | Pass 4 only (intent verification) | "Crear análisis AS-IS del sistema de facturación SAP" |
| Clear + vague scope | Passes 2, 4, 5 | "Ayúdame con el proyecto del banco" |
| Messy + clear intent | Passes 1, 5 | "ncsito el diganostico del legasy" |
| Messy + vague | All 5 passes | "eso q hblamos ayer dl tema ese pa la reunion d mañna" |

Over-analyzing clear inputs wastes time and can introduce phantom intent. The activation table exists to prevent this — match depth to noise level.

## Parameters

| Parameter | Values | Default |
|---|---|---|
| `{MODO_OPERACIONAL}` | `integral`, `superficie`, `intencion`, `reformulacion` | `integral` |
| `{IDIOMA}` | `es`, `en`, `mixed` | `es` |
| `{PROFUNDIDAD}` | `express`, `standard`, `deep` | `standard` |

## The Five Passes

```
Raw Input → SURFACE → 5 WHYS → 7 SO-WHATS → INTENT → REFORMULATION → Structured Prompt
```

### Pass 1: Surface Analysis

Detect and catalog surface errors. **Always presume** that the input has noise.

**What to capture:**

| Category | Patterns | Examples |
|-----------|----------|----------|
| **Dyslexia** | Letter inversions (b/d, p/q), adjacent transpositions, missing vowels | "buil → build", "teh → the", "frm → from" |
| **Haste / speed** | Extreme abbreviations, merged words, no punctuation | "ncsito", "xfa", "q", "dl", "tmbn", "pa" |
| **Spelling** | Phonetic errors, missing accents, c/s/z confusion, b/v, omitted h | "aver si", "haber si", "desición", "exito" |
| **Punctuation** | Total absence, excessive, run-on sentences | No periods or commas across 3+ lines |
| **Syntax** | Fragments, incomplete sentences, implicit subject | "y entonces lo del tema ese" |
| **Autocorrect** | Keyboard substitutions, voice-to-text artifacts | "ducking", random words interspersed |
| **Spanglish** | Spanish-English mixing within the same sentence | "Necesito hacer un deploy del feature" |

**Detection patterns for Spanish:**

| Pattern | Signal | Confidence |
|--------|-------|-----------|
| Consonants without vowels (3+) | Haste abbreviation: "prblm", "cntrl" | HIGH |
| Total absence of accents | Fast typing or keyboard without accents | MEDIUM |
| Standalone "q" | Abbreviation of "que" | VERY HIGH |
| "x" as "por" | "xfa" = "por favor", "xq" = "porque" | VERY HIGH |
| Adjacent QWERTY letters swapped | "wirking", "teh" | HIGH |
| Spanish homophones: "a ver/haber", "hay/ahí/ay" | Phonetic confusion | MEDIUM (context) |

**Output:** Corrected text + list of corrections + quality assessment.

Preserve intent when correcting. Correct only surface errors, not meaning — the reason: if a correction alters what the user meant, every downstream pass operates on a false premise.

### Pass 2: Five Whys (Root Cause)

Dig beneath the surface request to find the root need.

**Protocol:**
```
Usuario dice: "Necesito una presentación de los resultados Q4"
¿Por qué 1? → El jefe pidió una revisión trimestral
¿Por qué 2? → El equipo no cumplió objetivos, necesita realineamiento
¿Por qué 3? → Pivote de estrategia a mitad del trimestre
¿Por qué 4? → La planificación presupuestaria depende de ello
¿Por qué 5? → Necesitan justificar inversión continua

Necesidad raíz: Un caso persuasivo para inversión continua a pesar de incumplimientos Q4,
               formateado como revisión trimestral.
```

**Rules:**
- Stop before 5 if the root is clear. Do not force all 5.
- Each "why" must be answerable from context or reasonable inference.
- If a "why" requires unavailable information, note it as an **open question** — do not guess.

### Pass 3: Seven So-Whats (Impact Tracing)

Trace implications forward. If we solve this, what happens next?

**Purpose:** Calibrate response depth. A "presentation" that determines budget allocation deserves more investment than a casual summary.

**Calibration by depth:**

| Chain reaches... | Quality investment |
|-------------------|---------------------|
| So-what 2-3 | Standard |
| So-what 5-6 | Premium — strategic importance |
| So-what 7 | Flagship — competitive advantage |

**Rules:**
- Follow the highest-impact chain, not all branches.
- Stop when implications become speculative.
- Use the result to calibrate downstream skill quality.

### Pass 4: Intent Analysis

Compare what was written with what was meant. Identify the gap.

**Gap types:**

| Type | Signal | Example |
|------|-------|---------|
| **Vocabulary** | Incorrect technical term for the correct concept | "algorithm" meaning "workflow" |
| **Scope** | Underestimated need | "fix this" meaning "redesign the architecture" |
| **Expertise** | Wrong terminology for the correct concept | Asks for "microservices" for 2 endpoints |
| **Emotional** | Hedging, vagueness, hidden frustration | "make it better" meaning "I am frustrated with X" |
| **Context** | Dangling references, assumed knowledge | "that thing we discussed" without shared context |

**Protocol:**
1. List explicit statements (what they literally said).
2. List implicit signals (tone, word choice, what was NOT said).
3. Identify gaps between explicit and implicit.
4. Formulate the "real ask" — what they would say with perfect clarity.

### Pass 5: Reformulation

Synthesize all passes into a high-quality prompt.

**Reformulation template:**
```
OBJETIVO: [Verbo de acción + resultado medible]
CONTEXTO: [De 5 Porqués + 7 Entonces-qués]
INTENCIÓN: [Del análisis de brechas Pase 4]
RESTRICCIONES: [Explícitas + inferidas]
OUTPUT ESPERADO: [Tipo de entregable, estructura, longitud]
CALIBRACIÓN: [standard | premium | flagship]
```

## Operational Modes

| Mode | Passes | When to Use |
|------|-------|-------------|
| `integral` | 1-5 | Messy and vague input — full analysis |
| `superficie` | 1 only | Input with errors but clear intent — correction only |
| `intencion` | 4 only | Clean but ambiguous input — intent verification only |
| `reformulacion` | 2, 4, 5 | Clear input but vague scope — find root and reformulate |

## Integration with Discovery Pipeline

The reformulated prompt from Pass 5 becomes the input for downstream skills. Higher input quality leads to fewer downstream iterations.

```
[input-analysis] → [discovery-orchestrator] → [specific skill] → [excellence-loop]
```

## Workarounds

| Problem | Workaround |
|----------|-----------|
| Input in unsupported language | Detect language → flag for manual processing |
| Input with mixed code | Separate code blocks → analyze only natural text |
| Multiple questions in one message | Decompose into separate reformulated prompts, one per question |
| User self-corrects mid-message | Use the final version as intent. Ignore prior contradictions |
| Sarcasm or irony | Flag as uncertain intent → request clarification |

## Edge Cases

- **Intentionally informal input:** Some users write casually on purpose. Do not "fix" tone — correct only objective errors and preserve voice.
- **"Just do X":** Signal to skip deep analysis. Execute Pass 4 only to confirm, then pass-through with minimal reformulation.
- **Input with emojis as content:** Interpret emojis as emotional signals (fire = urgency, angry face = frustration, checkmark = confirmation).
- **Voice-to-text artifacts:** Random capitalization, absent punctuation, extreme homophony. Treat as Pass 1 with HIGH confidence in corrections.
- **Context only in attachments:** If the user says "review this" attaching a PDF, intent analysis is based on attachment content, not the text.

## Trade-off Matrix

| Tension | Option A | Option B | Decision criterion |
|---------|----------|----------|---------------------|
| Depth vs speed | Full analysis (5 passes) | Surface only (1 pass) | Input quality determines |
| Correction vs preservation | Correct everything | Preserve user voice | Correct errors, preserve style |
| Inference vs question | Infer intent | Ask the user | Confidence >80% → infer; <80% → ask |
| Short vs full reformulation | Minimal prompt | Prompt with full context | Downstream task complexity |

## Example: Good vs Bad

**Input:** `"ncsito q m ayuden cn el tema dl banco ese d la reunion xq el jefe sta presinando"`

**Bad analysis:**
```
Corrected: "Necesito que me ayuden con el tema del banco de la reunión porque el jefe está presionando."
Intent: El usuario quiere ayuda con un proyecto bancario.
Recommendation: Crear un documento de análisis del banco.
```
Why it fails: Surface-only correction with no root cause analysis. "Proyecto bancario" is a guess — nothing says it's a project. Skipped emotional signals ("presionando" = stress). The recommendation invents a deliverable the user never requested.

**Good analysis:**
```
Surface: 11 corrections (79% haste, 14% spelling, 7% spanglish). Confidence: HIGH.
Root cause (4 whys): Methodological blockage analyzing an opaque legacy system under leadership pressure.
Impact: PREMIUM — chain reaches level 6 (commercial credibility).
Intent gaps: Scope (underestimated), Context (missing meeting details), Emotional (stress undertone).
Reformulated: OBJETIVO: Strategy for AS-IS analysis of opaque banking legacy system...
Open questions: 5 clarification items flagged for conductor.
```
Why it works: Every pass adds distinct value. Root cause goes beyond the literal ask. Emotional signals preserved. Open questions flagged instead of guessed. Calibration justified by impact chain.

See `references/examples/sample-output.md` for a complete 5-pass example with this input.

## Validation Gate

Before passing the reformulated prompt downstream, confirm:

- [ ] Surface corrections (if any) did not alter meaning
- [ ] Root cause analysis is grounded in available context, not speculation
- [ ] The "real ask" differs from the literal ask only where evidence supports it
- [ ] Reformulated prompt has: objective, constraints, context, and expected output
- [ ] Unresolvable ambiguities are explicitly flagged as open questions
- [ ] Analysis depth matches input quality (activation table was followed)
- [ ] Output language matches user language (or pipeline default)
- [ ] Emotional signals from the input are preserved in the CONTEXTO or INTENCIÓN fields

## Output Format Protocol

```markdown
## Análisis de Input

**Input original:** [raw text]
**Confianza:** ALTA | MEDIA | BAJA
**Pases ejecutados:** 1, 2, 3, 4, 5

### Correcciones de superficie
| Original | Corregido | Tipo | Confianza |
|----------|-----------|------|-----------|
| ncsito | necesito | Afán — vocales faltantes | ALTA |

### Causa raíz (5 Porqués)
[Chain with natural stop + open questions]

### Impacto (7 Entonces-qués)
[Impact chain with calibration level]

### Brechas de intención
| Tipo | Explícito | Implícito | Brecha |
|------|-----------|-----------|--------|

### Prompt reformulado
OBJETIVO: ...
CONTEXTO: ...
INTENCIÓN: ...
RESTRICCIONES: ...
OUTPUT ESPERADO: ...
CALIBRACIÓN: [standard | premium | flagship]
```

## Escalation Triggers

Escalate to the conductor when:
- Intent confidence < 50% after all passes
- Input contains irreconcilable contradictory information
- Multiple valid interpretations with divergent impact
- User appears to be in emotional mode (frustration, pressure) — conductor should validate before proceeding
- Input suggests significant scope change relative to ongoing discovery

## Additional Resources

- `references/knowledge-graph.mmd` — Skill relationship graph (read when tracing cross-skill dependencies)
- `references/body-of-knowledge.md` — Primary sources: linguistics, UX writing, NLP (read for theoretical grounding)
- `references/state-of-the-art.md` — NLP trends 2024-2028 (read for state-of-art context)
- `references/output-templates.md` — Format specs for MD, DOCX, HTML, XLSX, PPTX outputs
- `references/use-case-prompts.md` — Parameterized prompts UC-01 through UC-07 (read for prompt templates)
- `references/metaprompts.md` — Meta-analysis strategies MP-01 through MP-05 (read for advanced analysis patterns)
- `references/examples/sample-output.md` — Complete 5-pass input analysis example
- `references/examples/sample-output.html` — Branded HTML version of sample output
