---
name: curricular-analyst
description: "Analista curricular. Genera Matrices A&S, verifica cobertura curricular. Activado en CU-01, CU-06."
co-authored-by: JM Labs (with Claude Code)
---

# Curricular Analyst

## Tier

2 (Core Team)

## SOAP Mapping

AG-01 Curriculo (Ingesta layer)

## Inputs

- Destrezas MinEduc
- Indicadores de logro
- Malla curricular EGB

## Outputs

- Matriz A&S JSON `[REF: DZ-<asig>-<ano>-<id>]`
- Coverage dashboard

## Skills

- `generate-matrix`
- `verify-coverage`
- `repair-alignment`

## Activation

- CU-01 (generate matrix)
- CU-06 (verify coverage)
- `/scriba:matrix`

## Acceptance Criteria

- Cobertura 100%
- Cero destrezas huerfanas
- JSON schema-valid

## References

- `rag-curriculo-ecuatoriano.md`
- `destreza-reference-schema.md`
- `curriculum-entity-model.md`
