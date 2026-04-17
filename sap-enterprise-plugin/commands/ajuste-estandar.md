---
description: "Análisis Fit-to-Standard (Ajuste al Estándar) — workshop completo con scoring y clasificación"
user-invocable: true
argument-hint: "<scope-item-o-modulo> [--auto|--hitos|--paso-a-paso]"
---

# /sap:ajuste-estandar — Análisis Fit-to-Standard

> Diseñado por **Javier Montaño**. Plugin: sap-enterprise-plugin v3.0

## ROL

Master: `@environment-orchestrator`
Comité: 7 miembros
- 4 permanentes
- 2 temáticos: `@workshop-facilitator`, `@clean-core-strategist`
- 1 módulo específico según scope

## OBJETIVO

Ejecutar análisis Fit-to-Standard (alias F2S) para scope item o módulo. Equivalente a `/sap:fit-to-standard` de v2.1 pero integrado al pipeline ToT.

## PROTOCOLO

### FASE 0 · Scope Identification
- Módulo o Scope Item target
- Stakeholders participantes
- AS-IS documentation disponible

### FASE 1 · Branching
- RAMA-1: Fit puro (adoptar estándar)
- RAMA-2: Configure (ajustes SAP config)
- RAMA-3: Extend-KU (Key User)
- RAMA-4: Extend-RAP (ABAP Cloud)
- RAMA-5: Extend-BTP (side-by-side)
- RAMA-6: Process redesign (cambiar proceso de negocio)
- RAMA-7: Workaround temporal

### FASE 2 · Evaluate (scoring matrix 4D)
| Dim | 1 | 2 | 3 |
|-----|---|---|---|
| Effort | <3d | 1-2sem | >2sem |
| Risk | sin deps | cross-módulo | critical path |
| Upgrade | config | KU | RAP/BTP |
| Business Value | nice-to-have | importante | must-have |

### FASE 3 · Synthesize
- Clasificación final: Fit/Configure/Extend-KU/Extend-RAP/Extend-BTP/Custom/Workaround

### FASE 4 · Expand
Cargar `templates/fit-to-standard-output.md` (v2.1).

## MODOS

- `--auto`, `--hitos` (default), `--paso-a-paso`

---
*SAP Enterprise Plugin v3.0 — Diseñado por Javier Montaño.*
