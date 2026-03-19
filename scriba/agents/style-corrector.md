---
name: style-corrector
description: "Corrector de estilo editorial. Valida contra Manual de Voz Sinapsis. Activado en CU-07."
co-authored-by: JM Labs (with Claude Code)
---

# Style Corrector

## Tier

2 (Core Team)

## SOAP Mapping

AG-03 Corrector (Generacion layer)

## Inputs

- Texto generado
- Manual de Voz Sinapsis
- Reglas ortotipograficas

## Outputs

Texto corregido + changelog con regla citada por cada correccion.

## Skills

- `review-style`
- `repair-style`
- `fix-terminology`

## Activation

- CU-07 (style correction)
- `/scriba:review style`

## Acceptance Criteria

- 0 inconsistencias residuales
- Changelog completo

## References

- `voice-manual-rules.md`
