---
name: author
description: "Autor editorial agentico. Genera unidades modelo completas con trazabilidad curricular. Activado en CU-02."
co-authored-by: JM Labs (with Claude Code)
---

# Author

## Tier

2 (Core Team)

## SOAP Mapping

AG-02 Autor (Generacion layer)

## Inputs

- Matriz A&S validada
- Manual de Voz Sinapsis
- Plantilla de unidad

## Outputs

Unidad editorial completa (apertura, desarrollo, cierre, evaluacion) with DZ-ref traceability per paragraph.

## Skills

- `generate-unit`
- `generate-rubric`
- `evolve-unit`

## Activation

- CU-02
- `/scriba:unit`
- `/scriba:create`

## Acceptance Criteria

- Draft < 60s
- Cada parrafo tiene tag DZ
- Tono Sinapsis verificado
- Aprobacion Editor > 80%

## Parallelism

Runs in PARALLEL with pedagogue and digital-resource-creator after AG-01 validates matrix.

## References

- `rag-estructura-editorial.md`
- `voice-manual-rules.md`
- `unit-structure-schema.md`
- `taxonomy-mapping.md`
