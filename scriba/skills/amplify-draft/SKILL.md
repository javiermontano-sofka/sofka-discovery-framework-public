---
name: amplify-draft
author: JM Labs
description: >
  Amplify a human author's draft to Scriba quality standards — add curriculum traceability, DUA adaptations, taxonomic annotations, and style corrections while preserving 100% of original content. Trigger on: amplificar borrador, amplify draft, mejorar borrador, enriquecer draft, version 1, draft humano, author draft, delegar version 1.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Amplificar Borrador Humano

> The human author's voice is the soul of the content. Amplification enriches without replacing — every word the author wrote stays, enhanced with structure and traceability.

## Purpose

Take a human-written draft and elevate it to Scriba editorial standards by adding curriculum traceability (DZ tags), DUA adaptations, taxonomic annotations (Bloom/Marzano), style corrections, and missing structural sections — all while preserving 100% of the original content.

## Procedure

1. Read the human draft (file path or pasted content).

2. Analyze structure against Sinapsis unit model:
   - Map existing content to sections: apertura, desarrollo, cierre, evaluacion
   - Identify which sections are present, partial, or absent
   - Classify existing activities by Bloom/Marzano level

3. Traceability pass:
   - For each paragraph, identify the most relevant destreza (DZ code)
   - Add [REF: DZ-xxx] tags — never remove existing content
   - If no matching destreza found, tag as [REF: PENDIENTE] for human review

4. DUA pass:
   - For each activity, check if 2+ DUA adaptations exist
   - If missing: generate adaptations (marked [GENERADO]) and insert after the activity
   - Cover at least 2 of 3 DUA principles

5. Style pass:
   - Check vocabulary against grade level (5to EGB = 9-10 years)
   - Flag sentences >20 words for simplification
   - Check tone against Manual de Voz Sinapsis
   - Generate changelog of suggested corrections (not auto-applied — human decides)

6. Gap-filling pass:
   - For each missing section (e.g., "Piensa y Reflexiona", "Mi emocion cuenta", "Ponte pilas"):
   - Generate section content (marked [GENERADO])
   - Place in correct position within unit structure

7. Validation:
   - Run student-simulator on the amplified draft
   - Report comprehensibility score
   - Flag any content below 85%

8. Present diff report:
   - What was preserved (100% of original)
   - What was added ([GENERADO] tags)
   - What was annotated (DZ tags, Bloom/Marzano levels)
   - What was suggested for change (style corrections — pending human approval)

## Inputs

| Name | Source | Required |
|------|--------|----------|
| Human draft | File or pasted text | Yes |
| Asignatura + grado | User input | Yes |
| Matriz A&S | Previous generation or manual | Recommended |

## Outputs

| Artifact | Format | Destination |
|----------|--------|-------------|
| Amplified draft | Markdown | units/ |
| Intervention changelog | Markdown | reports/ |
| Comprehensibility score | Console | User |

## Acceptance Criteria

- 100% of original human content preserved verbatim
- All generated additions marked with [GENERADO]
- DZ traceability tags added to every paragraph
- DUA adaptations meet 2+ per activity threshold
- Style changelog with cited rules (not auto-applied)
- Comprehensibility score reported for amplified version

## Output Format

```markdown
# Amplificacion — {Unit Title}

## Resumen de Intervenciones
| Tipo | Cantidad | Estado |
|------|----------|--------|
| Contenido original preservado | 100% | [ORIGINAL] |
| Secciones generadas | N | [GENERADO] |
| Tags DZ anadidos | N | [REF: DZ-xxx] |
| Adaptaciones DUA | N | [GENERADO] |
| Sugerencias de estilo | N | PENDIENTE aprobacion |

## Comprensibilidad
- Score: N%
- Perfil 1 (visual): N%
- Perfil 2 (kinestesico): N%
- Perfil 3 (TEA): N%

## Changelog Detallado
### Adiciones [GENERADO]
- Linea N: Seccion "Piensa y Reflexiona" generada
- Linea N: Adaptacion DUA para actividad 3

### Anotaciones
- Linea N: [REF: DZ-CN.3.1.1] anadido
- Linea N: Bloom nivel "Analizar" anotado

### Sugerencias de Estilo (pendiente aprobacion)
- Linea N: Oracion de 28 palabras — sugerir dividir
- Linea N: Vocabulario "fotosintesis" — verificar nivel grado
```

## Error Handling

- Draft has no recognizable structure: Map content as "desarrollo" and generate apertura/cierre/evaluacion from scratch
- Draft language too advanced for grade: Generate simplified version as alternative, preserve original
- No matching destrezas: Tag as [REF: PENDIENTE] — don't force incorrect mapping
- Matrix not available: Proceed with traceability pass using best-effort DZ matching, warn user
- Draft is empty or too short (<100 words): Warn user, suggest this is better suited for generate-unit

## Anti-Patterns

- Never delete or rewrite author's original text — only annotate, add, and suggest
- Never auto-apply style corrections — always present as suggestions for human approval
- Never force a destreza mapping that doesn't fit — use PENDIENTE tag
- Never mix [ORIGINAL] and [GENERADO] content without clear markers
- Never claim 100% preservation if any original text was modified

## References

- `references/amplification-patterns.md` — Amplification strategies and tagging conventions
