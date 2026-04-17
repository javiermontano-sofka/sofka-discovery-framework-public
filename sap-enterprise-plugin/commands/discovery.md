---
description: "Pipeline completo de SAP discovery — landscape assessment, fit-to-standard, gap analysis, solution design, roadmap"
user-invocable: true
argument-hint: "<client-name> [--mode express|guided|deep]"
---

# /sap:discovery — Full SAP Discovery Pipeline

> Diseñado y desarrollado por **Javier Montaño**. Plugin: sap-enterprise-plugin v2.1

## ROL

Master conductor: `@sap-orchestrator`
Delegación: todos los 5 especialistas (`@functional-lead`, `@module-specialist`, `@abap-expert`, `@sap-docs-steward`, `@qa-validator`)

## OBJETIVO

Ejecutar un discovery SAP end-to-end para el cliente especificado en "$ARGUMENTS". Salida: 9 deliverables alineados a SAP Activate Discover + Prepare phases.

## PROTOCOLO

### CP-0 · Ingestion
1. `@sap-orchestrator` recolecta contexto del cliente.
2. Ejecuta `scripts/detect-sap-context.sh` para auto-detectar keywords SAP en cwd.
3. Declara gaps de información. Pide AS-IS docs al usuario.

### CP-1 · Landscape Assessment
- Template: `templates/landscape-assessment.md` + `templates/readiness-scorecard.md`
- Agente: `@sap-orchestrator` + `@sap-docs-steward` (validación de objetos actuales)
- Output: `00_SAP_Landscape_{cliente}_{WIP}.md`

### CP-2 · Module Selection
- Agente: `@functional-lead` (decision tree módulos)
- Output: `01_SAP_Scope_{cliente}_{WIP}.md`

### CP-3 · Fit-to-Standard Workshops
- Comando delegado: `/sap:fit-to-standard` por cada módulo en scope
- Agente: `@functional-lead` + `@sap-docs-steward`
- Output: `02_FitToStandard_{cliente}_{WIP}.md`

**GATE G1** — Scenarios Approval (bloqueante)

### CP-4 · Gap Analysis
- Comando delegado: `/sap:gap-analysis`
- Agente: `@functional-lead` + `@qa-validator`
- Output: `03_Gap_Registry_{cliente}_{WIP}.md`

### CP-5 · Solution Design
- Comando delegado: `/sap:solution-design`
- Agente: `@sap-orchestrator` + `@abap-expert`
- Output: `04_Solution_Architecture_{cliente}_{WIP}.md`

**GATE G2** — Architecture Approval (bloqueante)

### CP-6 · Migration & Integration
- Comando delegado: `/sap:migration-plan`
- Output: `05_Migration_Integration_{cliente}_{WIP}.md`

### CP-7 · Roadmap & Estimation
- Agente: `@sap-orchestrator`
- Output: `06_SAP_Roadmap_{cliente}_{WIP}.md`

### CP-8 · Pitch & Handover
- Output: `07_SAP_Pitch_{cliente}.html` + `08_SAP_Handover_{cliente}.md`

**GATE G3** — Final Closure (bloqueante)

### CP-F · QA Final
- `@qa-validator` ejecuta `scripts/validate-deliverable.sh` sobre cada output
- Si falla → devolver al agente origen

## RESTRICCIONES

- NUNCA precios finales → solo FTE-meses (P50/P80/P95)
- Clean Core enforcement en cada decisión de extensión
- Evidence tags en cada afirmación
- Templates mandatory desde `templates/`
- Spanish (Latin American) como idioma default

## MODOS

- `--mode express`: 1 sesión, 3 deliverables (Landscape + Scope + Gap Summary)
- `--mode guided`: Pipeline completo con facilitación en cada gate
- `--mode deep`: Pipeline + ADRs detallados + PoC scope

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
