---
name: sofka-release-strategy
description: >
  Release management approach design, deployment pattern selection (blue-green, canary, rolling),
  and rollback procedure definition. Use when the user asks to "design release strategy",
  "define deployment patterns", "plan rollback procedures", or mentions trunk-based development,
  GitFlow, feature flags, or CI/CD pipeline strategy.
author: Equipo PreSales Sofka
version: 1.0.0
tags:
  - release-management
  - deployment
  - ci-cd
  - devops
  - rollback
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

# Estrategia de Release

Diseno de estrategia de release management, patrones de despliegue y procedimientos
de rollback alineados con la madurez del equipo y los requisitos del negocio.

## TL;DR

- Evalua madurez actual de release management y CI/CD pipeline
- Selecciona branching strategy optima (trunk-based, GitFlow, GitHub Flow) segun contexto
- Define patrones de deployment (blue-green, canary, rolling, recreate) por servicio
- Disena playbook de rollback con criterios de activacion automatica
- Genera documento de estrategia completo con matriz de decision

## Inputs

Parse `$1` como **nombre del proyecto**, `$2` como **sistema o plataforma objetivo**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)

## Entregables

1. **Documento de Estrategia de Release** — Branching model, release cadence, versioning policy
2. **Matriz de Deployment** — Patron de despliegue por servicio/componente con justificacion
3. **Playbook de Rollback** — Procedimientos paso a paso con criterios de activacion
4. **Pipeline Design** — Arquitectura de CI/CD pipeline con quality gates
5. **Feature Flag Strategy** — Politica de feature flags, lifecycle, cleanup

## Proceso

1. **Assessment de Estado Actual** — Evaluar pipeline existente, branching model, frecuencia de releases, incident history
2. **Seleccion de Branching Strategy**:
   | Strategy | Mejor Para | Requiere |
   |---|---|---|
   | Trunk-based | Equipos maduros, CD | Feature flags, test coverage alto |
   | GitHub Flow | Equipos medianos | PR reviews, CI solido |
   | GitFlow | Releases planificados | Disciplina de branches, QA dedicado |
3. **Diseno de Deployment Patterns** — Para cada servicio:
   - Blue-Green: zero-downtime, rollback instantaneo, requiere 2x infra
   - Canary: progressive rollout, deteccion temprana, requiere observabilidad
   - Rolling: eficiente en recursos, gradual, requiere backward compatibility
4. **Definicion de Rollback** — Criterios automaticos (error rate >X%, latency >Yms), procedimiento manual, comunicacion
5. **Quality Gates** — Definir gates en pipeline: lint, test, security scan, performance, approval
6. **Feature Flag Policy** — Lifecycle (create, enable, monitor, cleanup), ownership, technical debt prevention

## Criterios de Calidad

- [ ] Branching strategy justificada con contexto del equipo y negocio
- [ ] Patron de deployment definido por servicio con trade-offs documentados
- [ ] Playbook de rollback con pasos reproducibles y criterios de activacion claros
- [ ] Pipeline design con quality gates y tiempos estimados por stage
- [ ] Feature flag policy con cleanup schedule
- [ ] Metricas de release health definidas (DORA metrics como referencia)
- [ ] Diagrama Mermaid del pipeline y flujo de release

## Output Artifact

**Primary:** `Release_Strategy_{project}.md` — Estrategia completa con pipeline design y playbooks.

### Diagramas (Mermaid)
- Flowchart: pipeline CI/CD con quality gates
- Sequence diagram: flujo de deployment y rollback
- Gantt: release cadence por trimestre

---
**Autor:** Equipo PreSales Sofka | **Version:** 1.0.0
