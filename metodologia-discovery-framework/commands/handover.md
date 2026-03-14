---
description: "Generate 09_Handover — operational transition package discovery-to-execution with 90-day plan"
user-invocable: true
---

# METODOLOGIA DISCOVERY · HANDOVER OPERACIONAL · NL-HP v3.0

## ROL
Delivery Manager — activa `discovery-handover` como skill primario.
Skills de soporte: `project-program-management` (governance transition), `risk-controlling-dynamics` (risk tracker con kill criteria), `stakeholder-mapping` (stakeholder transition).

## OBJETIVO
Generar 09_Handover_Operaciones para el proyecto actual. Requiere todos los entregables previos (00-08). Documento autosuficiente para equipo de ejecucion. Si el usuario proporciona "$ARGUMENTS", usarlos como contexto.

## PROTOCOLO

### CP-0 · Ingesta
1. Escanea repositorio: estado actual del codigo, issues abiertos, PRs pendientes, CI/CD, documentacion operativa.
2. Clasifica adjuntos: todos los entregables (00-08), acuerdos comerciales, restricciones operativas.

### CP-2 · Ejecucion (7 SECCIONES OBLIGATORIAS)
1. **Transition Summary** — que se descubrio, que se decidio, que se entrega. Referencia a cada entregable (00-08) con hallazgo clave. [DOC]
2. **Activation Plan** — propuesta de valor, escenario, magnitudes, proximos pasos, timeline. Cada item con owner + fecha. [DOC] [INFERENCIA]
3. **Ops Readiness** — checklist: ambientes, accesos, tooling, licencias, onboarding, knowledge transfer. Status + owner + fecha limite. [CONFIG] [DOC] [INFERENCIA]
4. **Plan de 90 Dias** — 3x30 dias. Primer mes semana a semana. Objetivos, entregables, milestones, metricas, riesgos por periodo. [INFERENCIA]
5. **Governance Transition** — cadencia reuniones, roles, escalacion, reporting, gates de calidad. [INFERENCIA]
6. **Risk Tracker** — riesgos heredados + nuevos de transicion. Kill criteria para alta severidad. [DOC] [INFERENCIA]
7. **Stakeholder Transition** — cambios de rol, entradas/salidas, handover de conocimiento. Ref stakeholder map (01). [DOC] [INFERENCIA]

### CP-3 · Validacion
- [ ] 7 secciones completas
- [ ] Cada item accionable tiene owner + fecha
- [ ] Kill criteria para riesgos de alto impacto
- [ ] Plan 90 dias con primer mes semana a semana
- [ ] Documento autosuficiente para equipo nuevo

## RESTRICCIONES
- Todo item accionable DEBE tener owner y fecha.
- Kill criteria obligatorios para riesgos altos.
- Gaps en entregables previos → heredar como riesgo en Risk Tracker.
- Diagramas Mermaid: `gantt` + `flowchart` + `stateDiagram-v2`.
