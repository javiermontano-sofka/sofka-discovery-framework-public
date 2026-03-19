---
name: generate-teacher-guide
author: JM Labs
description: >
  Generate companion teacher guide (Guia Docente) with DUA adaptations, evaluation rubrics, and weekly
  planning for K-12 textbook units. Trigger on: guia docente, teacher guide, planificacion semanal, DUA,
  rubricas evaluacion, adaptaciones pedagogicas, orientaciones metodologicas, guia del profesor,
  planificacion didactica, adaptaciones curriculares. Produces a 1:1 companion to the student unit with
  inclusive adaptations covering all 3 DUA principles.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# generate-teacher-guide

> The teacher guide transforms curriculum intent into classroom reality. A textbook tells students what
> to learn; the guide tells teachers how to teach it — with adaptations for every learner profile,
> rubrics that make success visible, and weekly planning that respects real classroom time constraints.

## Purpose

Generate a companion Guia Docente for a Sinapsis editorial unit, including DUA (Universal Design for
Learning) adaptations for every activity, evaluation rubrics with 3+ performance levels per indicator,
weekly planning distribution, and methodological orientations that help teachers implement the
constructivist 4-phase model effectively.

## Procedure

1. Read the generated editorial unit, because the guide is a 1:1 companion — every activity in the unit needs a corresponding teacher orientation.
2. Read DUA principles from `references/priming-rag/rag-dua-inclusion.md`, because adaptations must cover the 3 DUA principles systematically, not ad hoc.
3. For each activity in the unit, generate at least 2 DUA adaptations covering at least 2 of the 3 DUA principles:
   - **Representacion** (the WHAT): Alternative formats for perceiving content (visual, auditory, tactile)
   - **Compromiso** (the WHY): Options for sustaining motivation (relevance, choice, collaboration)
   - **Accion/Expresion** (the HOW): Alternative ways to demonstrate learning (oral, written, visual, project)
4. Generate evaluation rubrics with 3+ performance levels (basico, intermedio, avanzado) for every indicador de logro in the unit. Write observable, measurable descriptors — not vague judgments.
5. Create weekly planning distribution: map unit activities to class sessions (typically 4-5 sessions per week, 40-45 min each), because teachers need actionable time-boxed plans.
6. Write methodological orientations for each phase (Experiencia, Conceptualizacion, Reflexion, Aplicacion) explaining the pedagogical rationale and implementation tips.
7. Verify 100% indicator coverage — every indicador from the unit's destrezas has a rubric and at least one assessment activity.
8. Tag pedagogical claims with evidence tags (`[PEDAGOGIA]`, `[NEUROCIENCIA]`, `[METODOLOGIA]`, `[INFERENCIA]`).

## Inputs

| Name | Source | Required |
|------|--------|----------|
| Generated editorial unit | Output of `generate-unit` | Yes |
| DUA principles reference | `references/priming-rag/rag-dua-inclusion.md` | Yes |
| Taxonomy mapping | `references/taxonomy-mapping.md` | Yes |
| Matriz A&S | Output of `generate-matrix` | Yes |
| MinEduc curriculo | `references/priming-rag/rag-curriculo-ecuatoriano.md` | Recommended |

## Outputs

| Artifact | Format | Destination |
|----------|--------|-------------|
| Guia Docente completa | Markdown | `output/guia-docente-<ID>.md` |
| Rubric tables | Markdown tables within guide | Embedded |
| Weekly planning | Session-by-session table | Embedded |
| DUA adaptation log | Summary table | Appended to guide |

## Acceptance Criteria

- 100% indicator coverage — every indicador has a rubric and assessment activity
- 3+ performance levels per rubric (basico, intermedio, avanzado minimum)
- 2+ DUA adaptations per activity, covering at least 2 of 3 DUA principles
- Weekly planning maps all activities to class sessions with time estimates
- Rubric descriptors are observable and measurable (no "understands well" — instead "identifies 3 of 4 elements correctly")
- Methodological orientation provided for every phase in every theme
- Rubrics do not penalize expression modality (DUA Principle 3 compliance)
- Evidence tags on all pedagogical claims

## Output Format

```markdown
# Guia Docente — Unidad 1: [Titulo]

## Planificacion Semanal

| Sesion | Dia | Seccion | Actividad | Tiempo | Recursos |
|--------|-----|---------|-----------|--------|----------|
| 1 | Lunes | Apertura | Piensa y Reflexiona | 45 min | Texto pp. 1-3 |
| 2 | Martes | Desarrollo T1 | Experiencia + Conceptualizacion | 45 min | Texto pp. 4-7 |
| 3 | Miercoles | Desarrollo T1 | Reflexion + Aplicacion | 45 min | Cuaderno, materiales |
| ... | ... | ... | ... | ... | ... |

## Orientaciones Metodologicas

### Tema 1: [Titulo]

#### Experiencia
**Objetivo**: Activar conocimientos previos sobre [tema].
**Implementacion**: [Instrucciones paso a paso para el docente]
**Tiempo sugerido**: 15 min
[PEDAGOGIA]

#### Conceptualizacion
**Objetivo**: Construir el concepto de [tema].
**Implementacion**: [Instrucciones]
**Pregunta guia**: [Pregunta para orientar la discusion]
[PEDAGOGIA]

## Adaptaciones DUA

### Actividad: [Nombre de la actividad]

| Principio DUA | Adaptacion | Perfil beneficiado |
|---------------|------------|-------------------|
| Representacion | Agregar diagrama visual del concepto | NEE, visual learners |
| Compromiso | Ofrecer opcion de trabajo en pares | NEE, baja motivacion |
| Accion/Expresion | Permitir respuesta oral grabada | NEE, dislexia |

## Rubricas de Evaluacion

### Indicador: [Descripcion del indicador] — [REF: DZ-XXX]

| Criterio | Basico (1-2) | Intermedio (3-4) | Avanzado (5) |
|----------|-------------|------------------|--------------|
| [Criterio 1] | [Descriptor observable] | [Descriptor observable] | [Descriptor observable] |
| [Criterio 2] | [Descriptor observable] | [Descriptor observable] | [Descriptor observable] |

## Resumen de Cobertura

| Indicador | Rubrica | Actividad formativa | Actividad sumativa |
|-----------|---------|--------------------|--------------------|
| DZ-XXX-001 | Si | Sesion 2 | Evaluacion final |
| DZ-XXX-002 | Si | Sesion 3 | Evaluacion final |
```

## Error Handling

- **No unit available**: Do not generate a guide without its companion unit. Prompt the user to run `generate-unit` first, because a guide without content is an orphaned document.
- **Insufficient destrezas/indicadores**: If the unit lacks DZ-ref tags, warn that traceability is incomplete and suggest running coverage verification first.
- **DUA principle gap**: If adaptations only cover 1 of 3 DUA principles, flag the gap and suggest specific adaptations for the missing principle(s).
- **Rubric descriptors too vague**: If a descriptor uses subjective language ("good understanding"), rewrite with observable criteria ("identifies 3 of 4 narrative elements").

## Anti-Patterns

- **Generic DUA adaptations**: "Use different methods" is not an adaptation. Specify concrete alternatives — "Provide audio recording of text passage for students with reading difficulties" gives teachers an actionable step.
- **Penalizing expression modality**: A rubric that requires "written paragraph" as the only response format excludes students who express better orally or visually. Offer modality alternatives per DUA Principle 3.
- **Unrealistic weekly planning**: Cramming 6 activities into a 45-minute session makes the guide unusable. Allocate realistic time blocks based on activity complexity.
- **Disconnected rubrics**: Rubrics that assess criteria not present in the unit content confuse teachers. Every rubric criterion should map to specific unit activities.
- **Missing methodological rationale**: "Do Activity 3" without explaining why (pedagogical purpose, cognitive function) reduces teachers to script-followers instead of informed practitioners.

## References

- `references/priming-rag/rag-dua-inclusion.md`
- `references/priming-rag/rag-taxonomias-bloom-marzano.md`
- `references/priming-rag/rag-estructura-editorial.md`
- `references/taxonomy-mapping.md`
- `references/guide-generation-patterns.md` (local)
