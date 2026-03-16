---
name: metodologia-onboarding-playbook
description: >
  Developer and team onboarding program design, knowledge transfer framework, and ramp-up metrics
  definition. Use when the user asks to "design onboarding program", "create onboarding playbook",
  "plan knowledge transfer", or mentions onboarding checklist, 30-60-90 plan, ramp-up metrics,
  or knowledge map.
author: Javier Montaño · Comunidad MetodologIA
version: 1.0.0
tags:
  - onboarding
  - knowledge-transfer
  - ramp-up
  - team-building
  - developer-enablement
  - moat
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - WebFetch
---

# Playbook de Onboarding

Diseno de programa de onboarding para developers y equipos, framework de transferencia
de conocimiento y definicion de metricas de ramp-up.

## TL;DR

- Disena programa de onboarding estructurado con checkpoints medibles
- Crea knowledge map del sistema/organizacion para acelerar ramp-up
- Define plan 30-60-90 con objetivos claros y metricas de progreso
- Establece framework de knowledge transfer para reducir dependencia de conocimiento tribal
- Genera checklists reutilizables por rol y nivel de experiencia

## Inputs

Parse `$1` como **nombre del proyecto/organizacion**, `$2` como **rol o equipo target**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)
- `{ROL}`: `developer` (default) | `qa` | `devops` | `lead` | `manager`

## Entregables

1. **Onboarding Checklist** — Lista de actividades por dia/semana con responsables
2. **Knowledge Map** — Mapa visual de conocimiento critico del sistema/organizacion
3. **Plan 30-60-90** — Objetivos y metricas por periodo con checkpoints
4. **Knowledge Transfer Framework** — Proceso estructurado de transferencia de conocimiento
5. **Buddy/Mentor Guide** — Guia para el buddy o mentor asignado

## Proceso

1. **Mapeo de Conocimiento Critico** — Identificar conocimiento necesario por categoria:
   | Categoria | Ejemplos | Prioridad |
   |---|---|---|
   | Arquitectura | System overview, design decisions, patterns | Semana 1 |
   | Codebase | Estructura, convenciones, key modules | Semana 1-2 |
   | Procesos | Git workflow, PR review, deploy, on-call | Semana 1 |
   | Dominio | Business domain, key concepts, stakeholders | Semana 2-3 |
   | Herramientas | IDE setup, CI/CD, monitoring, communication | Dia 1 |
   | Cultura | Team norms, communication style, decision making | Continuo |
2. **Diseno del Plan 30-60-90**:
   - **30 dias (Absorber)**: Setup completo, primer commit, conocer equipo, entender arquitectura
   - **60 dias (Contribuir)**: Features independientes, participar en code reviews, on-call shadow
   - **90 dias (Liderar)**: Ownership de componente, mentoria a nuevos, propuestas de mejora
3. **Creacion de Checklists** — Actividades diarias/semanales con responsable y criterio de completitud
4. **Framework de Knowledge Transfer** — Estructura sesiones de KT:
   - Sesiones grabadas con outline previo
   - Documentacion write-up post-sesion
   - Ejercicios practicos por cada sesion
   - Q&A asincronico documentado
5. **Guia de Buddy/Mentor** — Responsabilidades, cadencia de check-ins, escalation
6. **Metricas de Ramp-up** — Definir indicadores de progreso:
   | Metrica | Target 30d | Target 60d | Target 90d |
   |---|---|---|---|
   | Primer commit productivo | Completado | — | — |
   | PRs mergeados sin rework | — | >70% | >85% |
   | Resolucion de incidentes | Shadow | Con soporte | Independiente |
   | Contribucion a code reviews | Observa | Participa | Lidera |

## Criterios de Calidad

- [ ] Knowledge map completo con priorizacion temporal
- [ ] Plan 30-60-90 con objetivos SMART por periodo
- [ ] Checklists con responsables y criterios de completitud claros
- [ ] Framework de KT con templates de sesion y follow-up
- [ ] Metricas de ramp-up definidas y medibles
- [ ] Guia de buddy/mentor con responsabilidades explicitas
- [ ] Adaptable por rol (developer, QA, DevOps, lead)

## Edge Cases

| Escenario | Respuesta |
|---|---|
| Equipo remoto/distribuido | Enfasis en documentacion asincrona, sesiones grabadas, overlap hours |
| Onboarding masivo (>5 personas) | Cohort-based onboarding, bootcamp format, peer learning |
| Legacy system sin documentacion | Sprint 0 de documentacion antes de onboarding, pair programming intensivo |
| Rotacion entre equipos | Playbook modular con base comun + extensiones por equipo |

## Output Artifact

**Primary:** `Onboarding_Playbook_{project}.md` — Checklist, knowledge map, plan 30-60-90.

### Diagramas (Mermaid)
- Timeline: plan 30-60-90 con milestones
- Mind map: knowledge map del sistema
- Flowchart: proceso de onboarding end-to-end

---
**Autor:** Javier Montaño · Comunidad MetodologIA | **Version:** 1.0.0
