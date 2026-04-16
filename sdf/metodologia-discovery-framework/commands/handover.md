---
description: "Generate 09_Handover — operational transition package discovery-to-execution with 90-day plan"
user-invocable: true
---

# METODOLOGIA DISCOVERY · HANDOVER OPERACIONAL · NL-HP v3.0

## ROL
Delivery Manager + Commercial Activator — activa `discovery-handover` como skill primario.
Skills de soporte: `project-program-management` (governance transition), `risk-controlling-dynamics` (risk tracker con kill criteria), `stakeholder-mapping` (stakeholder transition).

## OBJETIVO
Generar 09_Handover_Operaciones para el proyecto actual. Requiere todos los entregables previos (00-08). Documento autosuficiente para equipo de ejecución. Si el usuario proporciona "$ARGUMENTS", usarlos como contexto.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea repositorio: estado actual del código, issues abiertos, PRs pendientes, CI/CD, documentación operativa.
2. Clasifica adjuntos: todos los entregables (00-08), acuerdos comerciales, restricciones operativas.

### CP-2 · Ejecución (7 SECCIONES OBLIGATORIAS)
1. **Transition Summary** — qué se descubrió, qué se decidió, qué se entrega. Referencia a cada entregable (00-08) con hallazgo clave. [DOC]
2. **Commercial Activation** — propuesta de valor, escenario, magnitudes, próximos pasos, timeline. Cada ítem con owner + fecha. [DOC] [INFERENCIA]
3. **Ops Readiness** — checklist: ambientes, accesos, tooling, licencias, onboarding, knowledge transfer. Status + owner + fecha límite. [CONFIG] [DOC] [INFERENCIA]
4. **Plan de 90 Días** — 3x30 días. Primer mes semana a semana. Objetivos, entregables, milestones, métricas, riesgos por período. [INFERENCIA]
5. **Governance Transition** — cadencia reuniones, roles, escalación, reporting, gates de calidad. [INFERENCIA]
6. **Risk Tracker** — riesgos heredados + nuevos de transición. Kill criteria para alta severidad. [DOC] [INFERENCIA]
7. **Stakeholder Transition** — cambios de rol, entradas/salidas, handover de conocimiento. Ref stakeholder map (01). [DOC] [INFERENCIA]

### CP-3 · Validación
- [ ] 7 secciones completas
- [ ] Cada ítem accionable tiene owner + fecha
- [ ] Kill criteria para riesgos de alto impacto
- [ ] Plan 90 días con primer mes semana a semana
- [ ] Documento autosuficiente para equipo nuevo

## RESTRICCIONES
- Todo ítem accionable DEBE tener owner y fecha.
- Kill criteria obligatorios para riesgos altos.
- Gaps en entregables previos → heredar como riesgo en Risk Tracker.
- Diagramas Mermaid: `gantt` + `flowchart` + `stateDiagram-v2`.
