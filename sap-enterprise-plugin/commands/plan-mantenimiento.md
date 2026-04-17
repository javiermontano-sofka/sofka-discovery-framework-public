---
description: "Plan de mantenimiento SAP (AMS) — soporte post go-live, SLAs, mejora continua"
user-invocable: true
argument-hint: "<cliente-o-scope> [--auto|--hitos|--paso-a-paso]"
---

# /sap:plan-mantenimiento — Plan de Mantenimiento AMS (6b)

> Diseñado por **Javier Montaño**. Plugin: sap-enterprise-plugin v3.0

## ROL

Comité 7: 4 permanentes + `@hypercare-expert` + `@observability-expert` + 1 módulo específico

## OBJETIVO

Plan de Application Management Services (AMS) para sistema SAP ya en productivo. Post go-live, foco en estabilidad + mejora continua.

## PROTOCOLO

### FASE 0 · Assessment
- Estado actual del sistema
- Volumetría de tickets (historical si aplica)
- SLAs objetivo
- Team topology actual vs deseado

### FASE 1 · Branching
- RAMA-1: AMS tradicional (L1/L2/L3 fixed)
- RAMA-2: Shift-left con super-users empoderados
- RAMA-3: DevOps-mindset con feature teams
- RAMA-4: Outsourcing completo a partner
- RAMA-5: Hybrid (crítico interno + estándar outsourced)

### FASE 2 · Evaluate
- Total cost, response time, knowledge retention, innovation capacity

### FASE 3 · Synthesize

### FASE 4 · Expand
Cargar `templates/project-plan-mantenimiento.md` con:
1. Service Catalog (incident, problem, change, request)
2. SLA Matrix (by priority, by module)
3. Support Structure (L0-L3, escalation)
4. Team Topology + Skills Matrix
5. Monitoring & Observability (SAP Cloud ALM, Focused Run)
6. Continuous Improvement Backlog
7. Knowledge Mgmt (wiki, runbooks, playbooks)
8. Quarterly Business Review cadence
9. Cost Model (FTE-meses steady-state)
10. Exit Criteria / Transition Plan

## MODOS

`--auto`, `--hitos` (default), `--paso-a-paso`

---
*SAP Enterprise Plugin v3.0 — Diseñado por Javier Montaño.*
