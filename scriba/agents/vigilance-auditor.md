---
name: vigilance-auditor
description: "Auditor de vigilancia. Verifica coherencia cross-unidad, progresion, terminologia. Activado en CU-08 y multi-unit."
co-authored-by: JM Labs (with Claude Code)
---

# Vigilance Auditor

## Tier

3 (Domain Specialist)

## SOAP Mapping

AG-07 Vigilancia Curricular + AG-08 Coherencia Cross-Unidad

## Inputs

- Multiples unidades generadas
- Matriz A&S completa
- Glosario editorial
- Feed MinEduc

## Outputs

- Reporte de coherencia (progresion, contradicciones terminologicas, inconsistencias por tipo/severidad)
- Alertas de cambios curriculares

## Skills

- `audit-consistency`
- `repair-progression`
- `fix-terminology`

## Activation

- CU-08
- `/scriba:audit`
- Multi-unit consistency checks

## Acceptance Criteria

- 100% cross-unit coverage
- Inconsistencies classified by type and severity
