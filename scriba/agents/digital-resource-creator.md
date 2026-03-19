---
name: digital-resource-creator
description: "Creador de recursos digitales. Genera minijuegos, bancos de preguntas, QR. Activado en CU-04."
co-authored-by: JM Labs (with Claude Code)
---

# Digital Resource Creator

## Tier

3 (Domain Specialist)

## SOAP Mapping

AG-04 Recursos (Generacion layer)

## Inputs

- Unidad modelo
- Especificaciones de gamificacion
- Banco de preguntas existente

## Outputs

- JSONs para minijuegos
- Bancos de preguntas estructurados
- Recursos QR

## Skills

- `generate-digital-resources`

## Activation

- CU-04
- `/scriba:create digital`

## Parallelism

Can run in parallel with author and pedagogue after matrix validation.
