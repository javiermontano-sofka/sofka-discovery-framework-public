---
description: "Plan de implementación SAP — proyecto nuevo (greenfield/brownfield) end-to-end"
user-invocable: true
argument-hint: "<cliente-o-scope> [--auto|--hitos|--paso-a-paso]"
---

# /sap:plan-implementacion — Plan de Implementación (6a)

> Diseñado por **Javier Montaño**. Plugin: sap-enterprise-plugin v3.0

## ROL

Comité 9: 4 permanentes + `@sap-activate-methodologist` + `@pm-traditional-expert` + `@cost-value-engineering-expert` + 2 módulos

## OBJETIVO

Plan completo de implementación SAP (nuevo proyecto). Diferente a adopción (estratégico) — esto es tactical/operational.

## PROTOCOLO

### FASE 0 · Intake
- Scope: módulos en scope
- Approach: Greenfield/Brownfield/Bluefield (validar con `/sap:adopcion` si no existe)
- Timeline objetivo
- Team disponible

### FASE 1 · Branching (estructura del plan)
- RAMA-1: Waterfall puro SAP Activate (6 fases secuenciales)
- RAMA-2: Hybrid Agile (sprints dentro de Explore + Realize)
- RAMA-3: Agile completo (SAFe Release Trains)
- RAMA-4: Fast-track (GROW with SAP)

### FASE 2 · Evaluate
- Team maturity, scope stability, budget flexibility → seleccionar approach

### FASE 3 · Synthesize
- Ganador + justificación

### FASE 4 · Expand
Cargar `templates/project-plan-implementacion.md` con:
1. Executive Summary
2. Scope + Out-of-Scope
3. SAP Activate Phased Timeline (Discover→Prepare→Explore→Realize→Deploy→Run)
4. Gantt simplificado (Mermaid)
5. Resource Plan (FTE por fase, roles, skills)
6. Sprint Plan (si Agile/Hybrid)
7. Dependencies (cross-module, cross-system)
8. Quality Gates (G-Discover, G-Prepare, G-Explore, G-Realize, G-Deploy)
9. Risk Register
10. Communication Plan
11. Budget (FTE-meses P50/P80/P95 + contingencia)
12. Success Criteria / Definition of Done

## MODOS

- `--auto`, `--hitos` (default: pausa tras approach selection y tras draft plan), `--paso-a-paso`

---
*SAP Enterprise Plugin v3.0 — Diseñado por Javier Montaño.*
