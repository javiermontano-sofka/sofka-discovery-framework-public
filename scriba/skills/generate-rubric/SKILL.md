---
name: generate-rubric
author: JM Labs
description: >
  Generate structured evaluation rubrics with 3+ performance levels aligned to Bloom and Marzano
  taxonomies for K-12 educational content. Trigger on: rubrica, evaluacion, criterios desempeno,
  niveles de logro, assessment, grading criteria, performance levels, indicadores evaluacion,
  rubrica analitica, escala valorativa, instrumento evaluacion. Produces DUA-compatible rubrics with
  observable, measurable descriptors that do not penalize expression modality.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# generate-rubric

> Assessment reveals learning. A rubric makes success criteria visible and achievable for every student
> by defining what "basico", "intermedio", and "avanzado" look like in concrete, observable terms.
> Without rubrics, grading is subjective; with them, both teachers and students share a common map
> of what mastery means.

## Purpose

Generate structured evaluation rubrics with 3+ performance levels per indicator, aligned to Bloom
and Marzano taxonomy levels, for K-12 educational content. Rubrics use observable, measurable
descriptors and comply with DUA Principle 3 (multiple means of action and expression) by not
penalizing expression modality.

## Procedure

1. Read the unit's destrezas and indicadores de logro from the Matriz A&S or the generated unit, because rubric criteria derive directly from what students are expected to demonstrate.
2. Read the taxonomy mapping from `references/taxonomy-mapping.md` to identify the cognitive level of each indicator, because the rubric's complexity should match the taxonomy level — a "Recordar" indicator needs recognition-level descriptors, while a "Crear" indicator needs production-level descriptors.
3. For each indicador, define 3+ performance levels:
   - **Basico** ("En desarrollo", score 1-2): Student attempts but shows partial or incorrect performance. Describe what partial looks like concretely (e.g., "identifies 1 of 4 elements").
   - **Intermedio** ("Logrado", score 3-4): Student demonstrates competency with minor gaps. Describe the expected standard (e.g., "identifies 3 of 4 elements with brief description").
   - **Avanzado** ("Destacado", score 5): Student exceeds expectations with autonomy and depth. Describe the enriched performance (e.g., "identifies all 4 elements and explains their function").
4. Write descriptors using observable action verbs from the taxonomy level — "identifica", "clasifica", "produce", "compara" — not subjective terms like "understands well" or "shows good knowledge."
5. Include quantity thresholds in descriptors where applicable ("3 de 4 elementos", "al menos 2 ejemplos", "sin errores de concordancia"), because measurable thresholds reduce grading subjectivity.
6. Verify DUA compliance: no descriptor should require a specific expression modality as the only option. If a criterion says "writes a paragraph," add "(or presents orally, or creates a visual representation)" to allow alternative demonstration.
7. Map each rubric row to its DZ-ref and Bloom/Marzano level for traceability.
8. Generate a scoring summary showing how rubric scores translate to qualitative levels and course grades if applicable.

## Inputs

| Name | Source | Required |
|------|--------|----------|
| Indicadores de logro | Matriz A&S or generated unit | Yes |
| Taxonomy mapping | `references/taxonomy-mapping.md` | Yes |
| DUA principles | `references/priming-rag/rag-dua-inclusion.md` | Recommended |
| Target grado | User request | Yes |
| Asignatura | User request or inferred from DZ codes | Yes |

## Outputs

| Artifact | Format | Destination |
|----------|--------|-------------|
| Rubric tables | Markdown tables | `output/rubricas-<UNIT-ID>.md` |
| Scoring summary | Markdown | Appended to rubric file |
| DUA compliance checklist | Markdown checklist | Appended to rubric file |

## Acceptance Criteria

- Every indicador de logro has a rubric with 3+ performance levels
- All descriptors use observable action verbs (no "understands", "knows", "appreciates")
- Quantity thresholds present in at least 50% of descriptors
- No descriptor penalizes expression modality (DUA Principle 3)
- Each rubric row maps to a DZ-ref and taxonomy level
- Scoring summary explains how to calculate final grades
- Evidence tags on taxonomy-level claims

## Output Format

```markdown
# Rubricas de Evaluacion — Unidad [ID]: [Titulo]

## Rubrica 1: [Indicador description]
**Destreza**: [REF: DZ-LENG-5-001]
**Nivel taxonomico**: Bloom: Comprender / Marzano: Comprension

| Criterio | Basico (1-2) | Intermedio (3-4) | Avanzado (5) |
|----------|-------------|------------------|--------------|
| Identifica elementos narrativos | Identifica 1 de 4 elementos (personaje, escenario, trama, conflicto) | Identifica 2-3 de 4 elementos con descripcion parcial | Identifica los 4 elementos y explica su funcion en la narrativa |
| Secuencia eventos | Ordena menos del 50% de eventos correctamente | Ordena 50-80% de eventos en secuencia logica | Ordena 100% de eventos y justifica el orden |

**Modalidades aceptadas**: Escrita, oral, visual (diagrama, mapa de historia) [DUA P3]

---

## Rubrica 2: [Next indicador]
...

---

## Resumen de Puntuacion

| Nivel Cualitativo | Rango | Equivalencia |
|-------------------|-------|-------------|
| En desarrollo | 1-2 | Requiere refuerzo |
| Logrado | 3-4 | Cumple el estandar |
| Destacado | 5 | Supera el estandar |

## Checklist DUA

- [ ] Ningun criterio exige una unica modalidad de expresion
- [ ] Descriptores son observables y medibles
- [ ] Lenguaje de descriptores es accesible para estudiantes
- [ ] Rubrica puede ser compartida con estudiantes como guia de autoevaluacion
```

## Error Handling

- **No indicadores available**: Do not invent indicators. Prompt the user to provide the Matriz A&S or generated unit, because rubrics without curriculum-aligned indicators assess the wrong things.
- **Taxonomy level unclear**: If a destreza's Bloom/Marzano level is ambiguous, default to the level implied by the verb in the destreza description. Tag with `[INFERENCIA]`.
- **Subjective descriptors detected**: If a descriptor uses non-observable language during generation, rewrite immediately. "Good understanding" becomes "explains the concept using 2+ examples."
- **Single modality detected**: If a criterion prescribes only one response format, add alternatives and flag with `[DUA P3]` annotation.

## Anti-Patterns

- **Vague descriptors**: "Shows understanding" tells neither teacher nor student what to look for. Specify the observable behavior and quantity — "Identifies and labels 3 of 4 story elements on a graphic organizer."
- **Binary rubrics**: A rubric with only "correct/incorrect" is a checklist, not a rubric. Performance levels show the spectrum of mastery and give students a growth path.
- **Copy-paste across indicators**: Each indicator measures a different skill. Using identical descriptors with different header text suggests the rubric was not thoughtfully designed.
- **Penalizing modality**: Requiring "a written essay" as the only acceptable response excludes students with dyslexia or motor difficulties. Offer oral, visual, and digital alternatives per DUA Principle 3.
- **Disconnected from content**: A rubric criterion that does not correspond to any activity in the unit confuses teachers. Every criterion should map to specific content and exercises.

## References

- `references/taxonomy-mapping.md`
- `references/priming-rag/rag-taxonomias-bloom-marzano.md`
- `references/priming-rag/rag-dua-inclusion.md`
- `references/rubric-design-patterns.md` (local)
