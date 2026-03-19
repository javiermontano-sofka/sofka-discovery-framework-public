---
name: validate-comprehensibility
author: JM Labs
description: >
  Validate content comprehensibility using calibrated Student Simulator prompt-personas (alto rendimiento,
  promedio, necesidades especiales) for age-appropriate readability. Trigger on: comprensibilidad, legibilidad,
  student simulator, carga cognitiva, validar contenido, readability, age-appropriate, pre-filtro, perfiles
  estudiante, simulacion lectora, accesibilidad contenido. Runs 3-profile simulation scoring legibility,
  cognitive load, and engagement per section with quantitative thresholds and fragment-level flags.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# validate-comprehensibility

> If a 10-year-old cannot understand it, the content has not done its job. Student Simulator personas
> detect comprehensibility problems before human review — catching dense sentences, unfamiliar vocabulary,
> and cognitive overload that authors are blind to because they already understand the material.
> Test with all three profiles; the "promedio" student is the gatekeeper.

## Purpose

Validate content comprehensibility by running calibrated Student Simulator prompt-personas against
generated editorial content. Three profiles (alto rendimiento, promedio, necesidades especiales) simulate
the reading experience of the target student population, scoring legibility, cognitive load, and
engagement per section. The global score determines whether content advances to human review (Gate G2)
or returns for revision.

## Procedure

1. Read the generated editorial unit to be validated, because the simulation operates on actual content, not summaries.
2. Load the 3 Student Simulator profiles from `references/priming-rag/rag-student-simulator-personas.md`, because each profile is calibrated to a specific cognitive profile (reading speed, vocabulary range, attention span).
3. For each profile, simulate reading section by section (apertura, desarrollo tema 1, desarrollo tema 2, ..., cierre, evaluacion). Score each section on three dimensions:
   - **Legibilidad** (0-100): Lexical complexity (word frequency, syllable count), syntactic complexity (sentence length, subordination), informational density (new concepts per paragraph). Threshold: >85 for profile PR.
   - **Carga cognitiva** (Baja/Media/Alta): Number of new concepts per section, abstraction level, prior knowledge requirements. Target: Media for profile PR.
   - **Enganche** (Bajo/Medio/Alto): Perceived relevance, format variety, interactivity, emotional connection. Target: Medio-Alto for profile PR.
4. Flag problematic fragments at paragraph level. For each flag, specify: section, paragraph number, the problem (e.g., "28-word sentence with 2 subordinate clauses"), severity (alta/media/baja), and a concrete simplification suggestion.
5. Calculate the global comprehensibility score as the weighted average of section legibility scores for the PR (promedio) profile, because this profile represents the baseline — if the average student understands it, the content works.
6. Apply the decision threshold:
   - Score >85%: **APROBADO** — advances to Gate G2
   - Score 80-85%: **OBSERVACIONES** — advances with attention flags
   - Score <80%: **BLOQUEO** — does not advance, requires revision
7. Generate simplification suggestions for every flagged fragment, because actionable feedback enables rapid revision.
8. Compile the full comprehensibility report in YAML format (see Output Format).

## Inputs

| Name | Source | Required |
|------|--------|----------|
| Generated editorial unit | Output of `generate-unit` | Yes |
| Student Simulator profiles | `references/priming-rag/rag-student-simulator-personas.md` | Yes |
| Cognitive load reference | `references/priming-rag/rag-carga-cognitiva.md` | Yes |
| Target grado | Inferred from unit DZ codes or user request | Yes |

## Outputs

| Artifact | Format | Destination |
|----------|--------|-------------|
| Comprehensibility report | YAML | `output/reporte-comprensibilidad-<UNIT-ID>.yaml` |
| Flagged fragments list | Table within report | Embedded |
| Simplification suggestions | Per-fragment within report | Embedded |
| Decision (APROBADO/OBSERVACIONES/BLOQUEO) | Header field in report | Embedded |

## Acceptance Criteria

- All 3 profiles simulated (AR, PR, NEE)
- Every section scored on all 3 dimensions (legibilidad, carga cognitiva, enganche)
- Global score calculated from PR profile legibility scores
- Problematic fragments flagged with severity (alta/media/baja) and specific simplification suggestions
- Decision threshold applied correctly (>85 APROBADO, 80-85 OBSERVACIONES, <80 BLOQUEO)
- Flagged fragments include paragraph-level precision (section + paragraph number)
- Simplification suggestions are concrete ("Split into 2 sentences") not vague ("simplify")
- Report follows the YAML schema in Output Format

## Output Format

```yaml
reporte_comprensibilidad:
  unidad: "U-LENG-5-01"
  fecha: "2026-03-18"
  grado: 5
  asignatura: "LENG"
  perfiles_evaluados: ["AR", "PR", "NEE"]

  score_global: 87
  decision: "APROBADO"

  scores_por_seccion:
    apertura:
      legibilidad: 92
      carga_cognitiva: "baja"
      enganche: "alto"
    desarrollo_tema1:
      legibilidad: 84
      carga_cognitiva: "media"
      enganche: "medio"
    desarrollo_tema2:
      legibilidad: 88
      carga_cognitiva: "media"
      enganche: "medio-alto"
    cierre:
      legibilidad: 90
      carga_cognitiva: "baja"
      enganche: "alto"
    evaluacion:
      legibilidad: 85
      carga_cognitiva: "media"
      enganche: "medio"

  scores_por_perfil:
    AR:
      comprensibilidad: 96
      enganche: "alto"
      carga: "baja"
    PR:
      comprensibilidad: 87
      enganche: "medio-alto"
      carga: "media"
    NEE:
      comprensibilidad: 74
      enganche: "medio"
      carga: "alta (sin adaptaciones), media (con DUA)"

  fragmentos_problematicos:
    - seccion: "desarrollo_tema1"
      parrafo: 3
      texto_extracto: "[first 10 words of problematic paragraph]..."
      problema: "Oracion de 28 palabras con 2 clausulas subordinadas"
      severidad: "media"
      perfil_afectado: "PR, NEE"
      sugerencia: "Dividir en 2 oraciones: separar clausula causal con punto seguido"
    - seccion: "desarrollo_tema1"
      parrafo: 5
      texto_extracto: "[first 10 words]..."
      problema: "3 conceptos nuevos en un solo parrafo sin definicion contextual"
      severidad: "alta"
      perfil_afectado: "NEE"
      sugerencia: "Definir cada termino en primera aparicion. Distribuir en 2 parrafos."

  resumen:
    total_fragmentos_flagged: 2
    severidad_alta: 1
    severidad_media: 1
    severidad_baja: 0
    recomendacion: "Corregir fragmento de severidad alta antes de avanzar a Gate G2"
```

## Error Handling

- **No unit provided**: Do not simulate against hypothetical content. Prompt the user to provide or generate the unit first.
- **Incomplete unit (missing sections)**: Run simulation on available sections, but flag missing sections as "no evaluada" in the report and warn that the global score is partial.
- **Score exactly at threshold (80 or 85)**: Apply the inclusive boundary — 85 is APROBADO, 80 is OBSERVACIONES. Document this boundary rule in the report.
- **All sections score >90 but one scores <70**: The global average may still pass, but flag the outlier section as requiring attention. A single low-scoring section can block the learning sequence.
- **Profile calibration mismatch**: If the unit is for a grado not covered by the default profiles (e.g., BGU instead of EGB Media), warn that profile thresholds may need adjustment and tag scores with `[INFERENCIA]`.

## Anti-Patterns

- **Averaging away problems**: A global score of 86 can hide a section scoring 65 if other sections score 95+. Report both global and per-section scores, and flag any section below 80 regardless of the global score.
- **Vague suggestions**: "Simplify this paragraph" does not help the author. Specify what to change — "Split the 28-word sentence after 'porque' into two independent sentences" is actionable.
- **Skipping the NEE profile**: The NEE profile reveals accessibility barriers that AR and PR profiles miss. Even if the content is not designed specifically for NEE students, knowing the accessibility floor is important for DUA compliance.
- **Simulating without the full text**: Running comprehensibility checks on outlines or summaries misses the actual vocabulary, sentence structure, and density that determine readability. Validate the full draft.
- **Treating the score as pass/fail only**: The score is a diagnostic tool. A score of 83 with 1 high-severity fragment is more actionable than a score of 86 with no flags. Use the fragment-level data for revision.

## References

- `references/priming-rag/rag-student-simulator-personas.md`
- `references/priming-rag/rag-carga-cognitiva.md`
- `references/priming-rag/rag-dua-inclusion.md`
- `references/comprehensibility-metrics.md` (local)
