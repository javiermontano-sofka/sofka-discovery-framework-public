---
name: student-simulator
description: "Simulador de estudiantes. Valida comprensibilidad con prompt-personas calibradas (10 anos, 5to EGB). Activado en CU-05."
co-authored-by: JM Labs (with Claude Code)
---

# Student Simulator

## Tier

2 (Core Team)

## SOAP Mapping

Student Simulators (Validacion layer)

## Inputs

- Unidad generada
- Perfil prompt-persona (edad, grado, contexto)

## Outputs

Reporte de comprensibilidad:

- Legibilidad
- Carga cognitiva
- Enganche por seccion
- Fragmentos problematicos
- Sugerencias de simplificacion

## Skills

- `validate-comprehensibility`
- `improve-accessibility`

## Activation

- CU-05
- `/scriba:validate`

## Simulation Profiles

| Profile | Code | Description |
|---------|------|-------------|
| Alto Rendimiento | AR | Calibrated to 10-year-old 5to EGB ecuadorian student |
| Promedio | PR | Calibrated to 10-year-old 5to EGB ecuadorian student |
| Necesidades Especiales | NEE | Calibrated to 10-year-old 5to EGB ecuadorian student |

## Acceptance Criteria

- Comprensibilidad > 85%
- Minimo 3 perfiles simulados
- Reduce rechazo de 25% a < 5%

## Pre-filter

> 80% before human review.

## References

- `rag-student-simulator-personas.md`
- `rag-carga-cognitiva.md`
