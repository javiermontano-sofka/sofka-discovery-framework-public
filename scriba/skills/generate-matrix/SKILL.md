---
name: generate-matrix
author: JM Labs
description: >
  Generate curriculum Matriz de Alcance y Secuencia from MinEduc destrezas. Trigger on: crear matriz,
  generar A&S, mapear destrezas, curriculum alignment, scope and sequence, planificacion curricular,
  cobertura destrezas, alineamiento curricular, matriz curricular, destrezas MinEduc, indicadores de logro.
  Produces a JSON matrix mapping every destreza to units, indicators, and taxonomy levels with 100% coverage
  guarantee and DZ-ref traceability. Essential first step in the Sinapsis editorial pipeline.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# generate-matrix

> The Matriz de Alcance y Secuencia is the backbone of curricular traceability. Without it, content
> generation operates blind — authors cannot guarantee coverage, reviewers cannot verify alignment, and
> orphaned destrezas slip through to production. Build the matrix first; everything downstream depends on it.

## Purpose

Generate a curriculum alignment matrix that maps every MinEduc destreza to editorial units, indicadores
de logro, and taxonomy levels. The matrix serves as the single source of truth for the entire editorial
pipeline — unit generation, teacher guides, rubrics, and digital resources all read from it.

## Procedure

1. Read the MinEduc curriculum destrezas for the target asignatura and grado from `references/priming-rag/rag-curriculo-ecuatoriano.md` and `references/ontology/destreza-reference-schema.md`, because the official DZ format and asignatura codes define valid identifiers.
2. Extract every destreza and its associated indicadores de logro. Tag each with its DZ code (`DZ-<ASIG>-<ANO>-<ID>`), because downstream traceability requires unique identifiers from the start.
3. Map each destreza to a taxonomy level (Bloom + Marzano) using `references/taxonomy-mapping.md`, because taxonomy alignment drives the cognitive progression within and across units.
4. Group destrezas into unit sequences following complexity progression (lower-order destrezas earlier, higher-order later), because Sweller's cognitive load theory requires scaffolded introduction of concepts.
5. Assign inserciones curriculares transversales (ODS, INS-SE, INS-SI, etc.) to units ensuring at least 1 per unit, because MinEduc requires cross-cutting themes in every unit.
6. Generate the JSON matrix following the schema in the Output Format section.
7. Run coverage verification: count destrezas in matrix vs. destrezas in source curriculum. The delta should be zero — every destreza appears at least once.
8. Tag every entry with an evidence tag (`[METODOLOGIA]`, `[INFERENCIA]`, `[SUPUESTO]`), because the quality gate G1 requires traceable claims.

## Inputs

| Name | Source | Required |
|------|--------|----------|
| Destrezas MinEduc | MinEduc curriculum document or `rag-curriculo-ecuatoriano.md` | Yes |
| Asignatura code | User request (e.g., LENG, MAT, CCNN) | Yes |
| Grado | User request (e.g., 5, 6, 7) | Yes |
| Indicadores de logro | MinEduc curriculum or derived from destrezas | Yes |
| Taxonomy mapping | `references/taxonomy-mapping.md` | Yes |

## Outputs

| Artifact | Format | Destination |
|----------|--------|-------------|
| Matriz A&S | JSON (schema below) | `output/matriz-as-<ASIG>-<ANO>.json` |
| Coverage report | Markdown summary | Console output |
| Evidence log | Inline tags per entry | Embedded in JSON |

## Acceptance Criteria

- 100% destreza coverage — zero orphaned destrezas (delta = 0 between source and matrix)
- Every entry has a valid `DZ-<ASIG>-<ANO>-<ID>` code
- Every destreza maps to at least one indicador de logro
- Taxonomy levels assigned to every destreza (both Bloom and Marzano)
- At least 1 insercion curricular transversal per unit
- JSON validates against the schema (no null required fields, valid enum values)
- Evidence tags present on 100% of entries; if >30% are `[SUPUESTO]`, include warning banner

## Output Format

```json
{
  "matriz_as": {
    "asignatura": "LENG",
    "grado": 5,
    "total_destrezas": 24,
    "total_unidades": 6,
    "unidades": [
      {
        "unidad_id": "U-LENG-5-01",
        "titulo": "Explorando la narrativa",
        "destrezas": [
          {
            "dz_code": "DZ-LENG-5-001",
            "descripcion": "Identificar elementos narrativos en textos literarios",
            "indicadores": [
              "Reconoce personajes, escenario y trama en un cuento",
              "Distingue inicio, nudo y desenlace"
            ],
            "bloom": "Comprender",
            "marzano": "Comprension",
            "evidence_tag": "[METODOLOGIA]"
          }
        ],
        "inserciones": ["INS-SE", "INS-DS"]
      }
    ],
    "coverage": {
      "destrezas_source": 24,
      "destrezas_mapped": 24,
      "orphaned": 0,
      "status": "COMPLETA"
    }
  }
}
```

## Error Handling

- **Missing asignatura or grado**: Prompt the user — these are required to identify the correct destreza set. Do not guess.
- **Destrezas source unavailable**: Fall back to `rag-curriculo-ecuatoriano.md` for known asignaturas. If the asignatura is not in scope (outside EGB Media 5-7), report the limitation and stop.
- **Coverage < 100%**: Do not mark as complete. List orphaned destrezas explicitly and suggest which units could absorb them.
- **>30% entries tagged [SUPUESTO]**: Add banner "ALTO CONTENIDO INFERIDO — Requiere validacion con fuentes primarias del MinEduc" at the top of the output.

## Anti-Patterns

- **Inventing destrezas**: Never create destrezas not present in the MinEduc source, because phantom destrezas create false coverage and misalign the entire downstream pipeline.
- **Leaving coverage gaps "for later"**: A partial matrix propagates gaps into units, guides, and rubrics. If a destreza cannot be mapped, flag it explicitly rather than omitting it silently.
- **Flat sequencing**: Dumping all destrezas into units without cognitive progression defeats the scaffolding purpose. Lower-order skills (Recordar, Comprender) should precede higher-order ones (Analizar, Crear) within and across units.
- **Skipping evidence tags**: Untagged entries cannot pass Gate G1. Tag everything, even obvious mappings.

## References

- `references/priming-rag/rag-curriculo-ecuatoriano.md`
- `references/ontology/destreza-reference-schema.md`
- `references/taxonomy-mapping.md`
- `references/priming-rag/rag-inserciones-curriculares.md`
- `references/curriculum-alignment-patterns.md` (local)
