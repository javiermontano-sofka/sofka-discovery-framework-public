---
description: "Planificación de adopción SAP — roadmap completo de transformación, change management, governance"
user-invocable: true
argument-hint: "<cliente-o-contexto> [--auto|--hitos|--paso-a-paso]"
---

# /sap:adopcion — Plan de Adopción SAP

> Diseñado por **Javier Montaño**. Plugin: sap-enterprise-plugin v3.0

## ROL

Master: `@environment-orchestrator` + `@sap-orchestrator`
Comité: 9 miembros (complejidad alta)
- 4 permanentes
- 3 temáticos: `@sap-activate-methodologist`, `@change-ocm-expert`, `@cost-value-engineering-expert`
- 2 módulos: según scope del cliente

## OBJETIVO

Acompañar al cliente en planear su ADOPCIÓN de SAP S/4HANA. Cobertura:
- Business case + ROI
- Roadmap SAP Activate (Discover → Run)
- Change Management Program (ADKAR)
- Governance (Steering Committee, SDA, Workstreams)
- Budget y staffing
- Quick Wins vs Long Term

## PROTOCOLO

### FASE 0 · Context Calibration
- Cliente, industria, tamaño, países
- ERP actual, deuda técnica
- Madurez digital
- Budget expectations (rango FTE-meses)
- Timeline constraints
- [VACIO_CRITICO]: business case owner

### FASE 1 · Branching — estrategias de adopción
- RAMA-1: Big Bang greenfield
- RAMA-2: Brownfield conversion
- RAMA-3: Selective (Bluefield)
- RAMA-4: GROW with SAP (SaaS fast)
- RAMA-5: RISE with SAP (managed)
- RAMA-6: Phased by LoB (Finance first, then Logistics)
- RAMA-7: Geography-first (pilot country, then rollout)

### FASE 2 · Evaluate
- Effort, risk, ROI timeline, change impact per rama

### FASE 3 · Synthesize
- Ganadora según cliente profile
- Híbrido si aplica

### FASE 4 · Expand — Adoption Plan
Cargar `templates/adoption-plan.md` con:
1. Executive Summary (business case condensado)
2. Strategic Approach seleccionado
3. SAP Activate Roadmap (6 fases con milestones)
4. Change Management Program (ADKAR per stakeholder group)
5. Governance Model (Steering, SDA, Workstreams, RACI)
6. Budget Model (FTE-meses P50/P80/P95, NO prices)
7. Team Topology (core + extended + partners)
8. Risk Register (top 10)
9. Quick Wins (90 días)
10. Long-term Innovation Roadmap

## MODOS

- `--auto`: plan completo sin pausas
- `--hitos` (default): pausa tras FASE 2 (approach selection) y FASE 3 (strategic direction)
- `--paso-a-paso`: cada sección del plan requiere aprobación

## RESTRICCIONES

- NUNCA precios en dólares — solo FTE-meses con disclaimers
- Risk register con mitigations específicas
- Change Management no es afterthought — empezar en Discover

---
*SAP Enterprise Plugin v3.0 — Diseñado por Javier Montaño.*
