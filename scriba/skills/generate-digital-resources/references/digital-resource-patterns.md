# Digital Resource Patterns — Reference for generate-digital-resources

> JSON schemas, minigame types, question bank structure, QR content format.

## Minigame Types Catalog

| Type | Mechanic | Best For (Bloom) | Example |
|------|----------|------------------|---------|
| clasificacion | Drag items into categories | Comprender, Analizar | Sort words into noun/verb/adjective |
| secuenciacion | Order items in sequence | Comprender, Aplicar | Arrange story events in order |
| asociacion | Match pairs | Recordar, Comprender | Match vocabulary to definitions |
| completar | Fill in blanks | Aplicar | Complete sentences with correct verb form |
| seleccion | Choose correct answer with feedback | Recordar, Comprender | Identify the main idea |
| construccion | Build/assemble from parts | Crear | Construct a sentence from word blocks |
| busqueda | Find hidden elements | Recordar | Find all adjectives in a paragraph |
| simulacion | Interactive scenario | Analizar, Evaluar | Make decisions in a story branch |

## Minigame JSON Schema

```json
{
  "id": "string — MG-<ASIG>-<ANO>-<UNIT>-<SEQ>",
  "tipo": "enum — clasificacion|secuenciacion|asociacion|completar|seleccion|construccion|busqueda|simulacion",
  "titulo": "string — student-facing title",
  "objetivo": "string — learning objective in student language",
  "dz_ref": "string — DZ-<ASIG>-<ANO>-<ID>",
  "bloom": "enum — Recordar|Comprender|Aplicar|Analizar|Evaluar|Crear",
  "mecanica": {
    "input": "string — what the student does",
    "output": "string — what the result looks like",
    "intentos": "number — max attempts (recommend 2-3)",
    "feedback_correcto": "string — positive reinforcement message",
    "feedback_incorrecto": "string — constructive guidance message"
  },
  "dificultad": [
    {"nivel": 1, "descripcion": "string — what makes it easier"},
    {"nivel": 2, "descripcion": "string — standard difficulty"},
    {"nivel": 3, "descripcion": "string — challenge mode (optional)"}
  ],
  "duracion_estimada": "string — target time (max 10 min)",
  "criterio_exito": "string — minimum score/completion threshold"
}
```

## Question Bank JSON Schema

```json
{
  "id": "string — QB-<ASIG>-<ANO>-<UNIT>-<SEQ>",
  "tipo": "enum — opcion_multiple|verdadero_falso|completar|respuesta_corta|ordenamiento",
  "stem": "string — the question text",
  "opciones": [
    {
      "texto": "string — option text",
      "correcta": "boolean",
      "razon_distractor": "string — why this wrong answer is plausible (null for correct)"
    }
  ],
  "dz_ref": "string — DZ-<ASIG>-<ANO>-<ID>",
  "bloom": "enum — Recordar|Comprender|Aplicar|Analizar|Evaluar|Crear",
  "indicador": "string — the specific indicator being assessed"
}
```

### Distractor Design Rules

1. Each distractor represents a common misconception or partial understanding
2. Distractors should be plausible — not obviously wrong
3. Avoid "all of the above" and "none of the above"
4. Keep option length similar (long correct answer is a giveaway)
5. Minimum 5 items per destreza for meaningful randomization

## QR Content JSON Schema

```json
{
  "id": "string — QR-<ASIG>-<ANO>-<UNIT>-<SEQ>",
  "tipo": "enum — video|audio|interactivo|infografia|simulacion",
  "titulo": "string — resource title",
  "descripcion": "string — what it contains and how it helps",
  "dz_ref": "string — DZ-<ASIG>-<ANO>-<ID>",
  "url_pattern": "string — https://prolipa.edu.ec/recursos/qr/<ID>",
  "duracion": "string — estimated consumption time",
  "fallback_offline": "string — print alternative description"
}
```

## Age-Appropriateness Constraints (EGB Media)

| Parameter | Limit | Rationale |
|-----------|-------|-----------|
| Interaction duration | Max 10 min per resource | Attention span at 9-12 years |
| Reading load in UI | Max 15 words per instruction | Cognitive load in interactive context |
| Difficulty levels | Min 2, max 3 | Allow progression without overwhelming |
| Feedback delay | Immediate (< 2 seconds) | Reinforcement effectiveness |
| Retry attempts | 2-3 per item | Allow learning from errors without frustration |
| Visual complexity | Simple, high-contrast | Accessibility for NEE students |

## Resource Variety Rule

Each unit should include at least 3 different resource types from:
- Minigames (interactive practice)
- Question bank (assessment)
- QR video/audio (multimedia)
- QR interactive (digital manipulative)

Variety prevents engagement fatigue and accommodates different learning preferences (DUA Principle 2).

## Offline Fallback Requirements

Every digital resource needs a print-compatible fallback because internet access is unreliable in many Ecuadorian classrooms:

| Resource Type | Fallback Format |
|--------------|----------------|
| Video | Printable storyboard or key-frame summary |
| Audio | Transcript or teacher read-aloud script |
| Interactive | Paper-based version of the activity |
| Minigame | Equivalent board game or card activity |
