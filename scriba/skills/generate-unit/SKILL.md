---
name: generate-unit
author: JM Labs
description: >
  Generate complete K-12 editorial unit with 4 sections (apertura, desarrollo, cierre, evaluacion)
  following Sinapsis constructivist model. Trigger on: generar unidad, crear capitulo, escribir unidad
  modelo, editorial unit, textbook chapter, contenido educativo, unidad editorial, texto alumno,
  redactar unidad, contenido Sinapsis. Produces DZ-traced content with 4-phase cognitive cycle per
  theme, inserciones curriculares, and Sinapsis voice compliance.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# generate-unit

> Every paragraph in a Sinapsis textbook has a cognitive function. Nothing is decorative — everything
> teaches. The unit structure implements a constructivist cycle (Experiencia, Conceptualizacion,
> Reflexion, Aplicacion) that scaffolds learning from prior knowledge to autonomous creation.

## Purpose

Generate a complete editorial unit for a K-12 textbook following the Sinapsis constructivist model.
The unit integrates four sections (apertura, desarrollo, cierre, evaluacion), each serving a distinct
pedagogical role, with full DZ-ref traceability linking every paragraph to curriculum destrezas.

## Procedure

1. Read the validated Matriz A&S for the target unit to identify assigned destrezas, indicadores, and taxonomy levels, because the matrix is the single source of truth for what the unit covers.
2. Load the Manual de Voz Sinapsis rules from `references/voice-manual-rules.md`, because tone and register consistency is a Gate G2 requirement.
3. Generate **Apertura** — the unit opening:
   - Title, module/theme listing, metacognitive opening questions
   - ODS link (icon + number), competencias listing, "Seguridad Integral" tip
   - "Piensa y Reflexiona" section to activate prior knowledge
   - Taxonomy: Recordar / Recuperacion level
4. Generate **Desarrollo** — for each theme in the unit, write 4 phases:
   - **Experiencia**: Connect to student's lived experience (Recordar/Recuperacion)
   - **Conceptualizacion**: Build the new concept with examples and definitions (Comprender/Comprension)
   - **Reflexion**: Critical analysis, comparisons, interdisciplinary connections (Analizar/Analisis)
   - **Aplicacion**: Practice exercises, projects, productions (Aplicar-Crear/Utilizacion)
5. Generate **Cierre** — synthesis and metacognition:
   - "Construyo mi Aprendizaje" (autonomous demonstration, Crear/Metacognicion)
   - "Mi emocion cuenta" (emotional connection, INS-SE)
   - "Ponte pilas" (attention reactivation, cognitive micro-challenges)
6. Generate **Evaluacion** — formative + summative assessment:
   - Formative items aligned to each theme's indicadores
   - Summative rubric-ready items with 3+ performance levels
   - DZ-ref on every evaluation item
7. Add `[REF: DZ-<ASIG>-<ANO>-<ID>]` traceability tag to every content paragraph, because traceability enables automated coverage verification at Gate G1.
8. Include at least 1 insercion curricular transversal (ODS, INS-SE, INS-SI are mandatory per unit).
9. Verify: every destreza from the matrix appears in at least one content paragraph and one evaluation item.

## Inputs

| Name | Source | Required |
|------|--------|----------|
| Validated Matriz A&S | Output of `generate-matrix` | Yes |
| Manual de Voz Sinapsis | `references/voice-manual-rules.md` | Yes |
| Unit template structure | `references/priming-rag/rag-estructura-editorial.md` | Yes |
| Taxonomy mapping | `references/taxonomy-mapping.md` | Yes |
| Target unit ID | User request (e.g., U-LENG-5-01) | Yes |

## Outputs

| Artifact | Format | Destination |
|----------|--------|-------------|
| Complete editorial unit | Markdown with DZ-ref tags | `output/unidad-<ID>.md` |
| Traceability summary | Table of DZ-codes per section | Appended to unit file |
| Insercion curricular log | List of inserciones included | Appended to unit file |

## Acceptance Criteria

- All 4 sections present (apertura, desarrollo, cierre, evaluacion)
- Every theme in desarrollo follows the 4-phase cycle (Experiencia, Conceptualizacion, Reflexion, Aplicacion)
- 100% DZ-ref traceability — every content paragraph has a `[REF: DZ-...]` tag
- Every destreza from the matrix appears in content and in evaluation
- At least 1 insercion curricular per mandatory category (ODS, INS-SE, INS-SI)
- Vocabulary appropriate to target grade (max 15-20 words per sentence for EGB Media)
- Sinapsis voice tone compliance (verified against Manual de Voz rules)
- Evidence tags on pedagogical claims

## Output Format

```markdown
# Unidad 1: [Titulo]

## Apertura

### Me preparo para mis competencias
- Competencia fundacional: [descripcion]
- Competencia transversal: [descripcion]

### Seguridad Integral
> [Tip de seguridad tematico] [REF: INS-SI]

### Piensa y Reflexiona
[Preguntas de activacion de conocimientos previos]
[REF: DZ-LENG-5-001]

---

## Desarrollo

### Tema 1: [Titulo del tema]

#### Experiencia
[Actividad vivencial conectada a experiencia del estudiante]
[REF: DZ-LENG-5-001]

#### Conceptualizacion
[Construccion del concepto, definiciones en contexto, ejemplos]
[REF: DZ-LENG-5-001]

#### Reflexion
[Analisis critico, preguntas abiertas, conexiones]
[REF: DZ-LENG-5-002]

#### Aplicacion
[Ejercicios practicos, proyectos, producciones]
[REF: DZ-LENG-5-002]

---

## Cierre

### Construyo mi Aprendizaje
[Actividad de sintesis autonoma]

### Mi emocion cuenta
[Conexion emocional con el aprendizaje] [REF: INS-SE]

### Ponte pilas
[Reto cognitivo ludico breve]

---

## Evaluacion

### Evaluacion Formativa
| Item | Destreza | Indicador | Tipo |
|------|----------|-----------|------|
| 1 | DZ-LENG-5-001 | Reconoce personajes | Seleccion multiple |

### Evaluacion Sumativa
[Items rubric-ready con niveles basico/intermedio/avanzado]
```

## Error Handling

- **No Matriz A&S available**: Do not generate blindly. Prompt the user to run `generate-matrix` first, because content without curricular alignment fails Gate G1.
- **Missing Manual de Voz**: Generate with neutral academic tone but add warning: "Tono Sinapsis no verificado — requiere revision AG-03."
- **Destreza not covered**: If a matrix destreza cannot be naturally integrated, flag it and suggest where it fits rather than forcing it into an unrelated section.
- **Vocabulary exceeds grade level**: Flag words >3 average syllables or technical terms lacking contextual definition. Suggest simpler alternatives.

## Anti-Patterns

- **Skipping phases**: Omitting Experiencia or Reflexion breaks the constructivist cycle. Each phase serves a distinct cognitive function — Experiencia activates prior knowledge, Reflexion enables transfer.
- **Decorative content**: Every paragraph needs a cognitive purpose. Filler text ("Es importante saber que...") without teaching function inflates page count without learning value.
- **Omitting DZ tags**: Untagged paragraphs are invisible to coverage verification. Tag everything, even transitional paragraphs that support a destreza indirectly.
- **Vocabulary above grade level without scaffolding**: Technical terms without contextual definitions create extraneous cognitive load. Define new terms on first use.
- **Copy-pasting between units**: Each unit's content should be original, because recycled examples break the novelty principle of engagement.

## References

- `references/priming-rag/rag-estructura-editorial.md`
- `references/voice-manual-rules.md`
- `references/ontology/unit-structure-schema.md`
- `references/taxonomy-mapping.md`
- `references/priming-rag/rag-inserciones-curriculares.md`
- `references/unit-generation-patterns.md` (local)
