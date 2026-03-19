---
name: generate-digital-resources
author: JM Labs
description: >
  Generate interactive digital resources (minigames, question banks, QR codes, multimedia) linked to
  editorial unit content. Trigger on: recursos digitales, minijuegos, banco de preguntas, QR, interactivo,
  gamificacion, multimedia educativo, recursos interactivos, actividades digitales, juegos educativos,
  evaluacion digital. Produces JSON specs for minigames, structured question banks, and QR content maps
  aligned to unit destrezas with DZ-ref traceability.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# generate-digital-resources

> Digital resources extend the textbook beyond the printed page. A well-designed minigame reinforces
> a destreza through active engagement; a question bank enables adaptive practice; a QR code bridges
> physical and digital learning. Each resource earns its place only by serving a specific learning
> objective — technology for its own sake is noise, not pedagogy.

## Purpose

Generate structured specifications for interactive digital resources that complement a Sinapsis editorial
unit. Each resource (minigame, question bank item, QR-linked content) must link to a specific destreza
and serve a clear pedagogical function — reinforcement, practice, assessment, or extension. Output is
machine-readable JSON that downstream development teams can implement directly.

## Procedure

1. Read the generated editorial unit to identify activities that benefit from digital extension, because not every activity needs a digital version — only those where interactivity adds pedagogical value beyond the printed exercise.
2. Read the Matriz A&S to verify destreza alignment, because every digital resource must trace back to a curriculum standard.
3. For each candidate activity, determine the resource type:
   - **Minigame**: For practice/reinforcement of a discrete skill (matching, sequencing, classification)
   - **Question bank**: For assessment items that can be randomized or adapted
   - **QR content**: For multimedia extension (video, audio, interactive diagram) that cannot exist in print
4. Design minigame specifications in JSON, including: game type, learning objective, DZ-ref, input/output mechanics, difficulty levels, success criteria, and feedback messages.
5. Create structured question bank items in JSON: stem, options (for multiple choice), correct answer, DZ-ref, Bloom level, and distractor rationale (why each wrong answer is plausible).
6. Generate QR content specifications: target URL pattern, content type (video, audio, interactive), description, DZ-ref, and fallback for offline use.
7. Verify that every resource maps to at least one destreza and that no destreza with a "digital extension recommended" flag in the unit is left without a resource.
8. Validate age-appropriateness: interaction complexity, reading load in game UI, and session duration should match EGB Media cognitive profiles (9-12 years, max 5-10 min per digital interaction).

## Inputs

| Name | Source | Required |
|------|--------|----------|
| Generated editorial unit | Output of `generate-unit` | Yes |
| Validated Matriz A&S | Output of `generate-matrix` | Yes |
| Gamification design patterns | `references/digital-resource-patterns.md` (local) | Recommended |
| Target grado | User request | Yes |
| Existing question bank | Previous outputs (if extending) | No |

## Outputs

| Artifact | Format | Destination |
|----------|--------|-------------|
| Minigame specifications | JSON array | `output/recursos-digitales-<UNIT-ID>/minigames.json` |
| Question bank | JSON array | `output/recursos-digitales-<UNIT-ID>/question-bank.json` |
| QR content map | JSON array | `output/recursos-digitales-<UNIT-ID>/qr-map.json` |
| Resource summary | Markdown table | Console output |

## Acceptance Criteria

- Every digital resource links to at least one destreza via DZ-ref
- Minigame specs include: game type, objective, mechanics, difficulty levels (min 2), success criteria, and feedback messages
- Question bank items include: stem, options, correct answer, DZ-ref, Bloom level, and distractor rationale
- QR content specs include: content type, description, DZ-ref, and offline fallback
- No resource exceeds 10-minute interaction time for target age group
- At least 3 different resource types per unit (variety prevents engagement fatigue)
- All JSON validates structurally (no null required fields, valid enums)
- Question bank has minimum 5 items per destreza to enable meaningful randomization

## Output Format

```json
{
  "recursos_digitales": {
    "unidad_id": "U-LENG-5-01",
    "minigames": [
      {
        "id": "MG-LENG-5-01-001",
        "tipo": "clasificacion",
        "titulo": "Ordena la historia",
        "objetivo": "Secuenciar eventos narrativos (inicio, nudo, desenlace)",
        "dz_ref": "DZ-LENG-5-001",
        "bloom": "Comprender",
        "mecanica": {
          "input": "Drag-and-drop de fragmentos de texto",
          "output": "Secuencia ordenada de 5 eventos",
          "intentos": 3,
          "feedback_correcto": "Excelente! Has ordenado la historia correctamente.",
          "feedback_incorrecto": "Revisa el orden. Recuerda: primero el inicio, luego el nudo, al final el desenlace."
        },
        "dificultad": [
          {"nivel": 1, "descripcion": "3 eventos, texto corto"},
          {"nivel": 2, "descripcion": "5 eventos, texto medio"},
          {"nivel": 3, "descripcion": "7 eventos, texto con distractores"}
        ],
        "duracion_estimada": "5 min",
        "criterio_exito": "80% eventos en orden correcto"
      }
    ],
    "question_bank": [
      {
        "id": "QB-LENG-5-01-001",
        "tipo": "opcion_multiple",
        "stem": "En la fabula 'Los tres ratones', cual es el conflicto principal?",
        "opciones": [
          {"texto": "Los ratones buscan comida", "correcta": false, "razon_distractor": "Evento secundario, no conflicto central"},
          {"texto": "Los ratones enfrentan al gato", "correcta": true},
          {"texto": "Los ratones construyen una casa", "correcta": false, "razon_distractor": "Confunde con otro cuento clasico"},
          {"texto": "Los ratones viajan al bosque", "correcta": false, "razon_distractor": "Elemento no presente en la fabula"}
        ],
        "dz_ref": "DZ-LENG-5-001",
        "bloom": "Comprender",
        "indicador": "Identifica el conflicto principal en un texto narrativo"
      }
    ],
    "qr_content": [
      {
        "id": "QR-LENG-5-01-001",
        "tipo": "video",
        "titulo": "Animacion: Estructura narrativa",
        "descripcion": "Video de 3 min mostrando inicio-nudo-desenlace con animacion",
        "dz_ref": "DZ-LENG-5-001",
        "url_pattern": "https://prolipa.edu.ec/recursos/qr/LENG-5-01-001",
        "duracion": "3 min",
        "fallback_offline": "Diagrama imprimible de estructura narrativa en Anexo A"
      }
    ]
  }
}
```

## Error Handling

- **No unit available**: Do not generate resources without the companion unit. Prompt the user to run `generate-unit` first, because resources without content context are disconnected from learning objectives.
- **Destreza mismatch**: If a resource references a DZ code not present in the unit's matrix, reject it and suggest the correct DZ codes from the matrix.
- **Insufficient question bank items**: If fewer than 5 items per destreza, warn that randomization will be limited and suggest additional items.
- **Interaction too complex for grade**: If a minigame requires reading comprehension above grade level or interactions lasting >10 min, flag and simplify.
- **No offline fallback for QR**: Every QR resource needs a print fallback, because not all classrooms have reliable internet access in Ecuador.

## Anti-Patterns

- **Technology for decoration**: A QR code that links to a static PDF adds no value over the printed page. Digital resources should offer interactivity, multimedia, or adaptivity that print cannot provide.
- **Trivial minigames**: "Click the correct answer" with no feedback or difficulty progression is a multiple-choice test disguised as a game. Include progressive difficulty, meaningful feedback, and retry mechanics.
- **Distractors without rationale**: Wrong answers in question banks should be plausible misconceptions, not random options. Document why each distractor exists, because this helps teachers understand common student errors.
- **Single resource type per unit**: Using only question banks (or only minigames) creates engagement fatigue. Mix at least 3 types per unit.
- **Ignoring offline contexts**: Assuming all students have devices and internet excludes rural and low-resource classrooms. Every digital resource needs a print-compatible fallback.

## References

- `references/priming-rag/rag-estructura-editorial.md`
- `references/priming-rag/rag-carga-cognitiva.md`
- `references/taxonomy-mapping.md`
- `references/digital-resource-patterns.md` (local)
