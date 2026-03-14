---
name: sofka-incident-management
description: >
  Incident response framework — severity classification, escalation paths, postmortem templates.
  Use when the user asks to "design incident process", "define severity levels", "create escalation paths",
  "build postmortem template", or mentions incident response, on-call, war room, blameless postmortem.
model: opus
context: fork
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Incident Management: Response Framework & Postmortem Culture

Incident management establishes structured response processes that minimize the impact of production incidents through clear severity classification, defined escalation paths, and blameless postmortem practices. The skill produces incident playbooks, severity matrices, and communication templates.

## TL;DR

- Define clasificacion de severidad (SEV1-SEV4) con criterios objetivos y tiempos de respuesta
- Disena flujo de respuesta a incidentes con roles claros (IC, comunicador, solucionador)
- Establece paths de escalamiento con contactos, tiempos maximos y criterios de escalada
- Produce templates de postmortem blameless con analisis de causa raiz y action items
- Crea templates de comunicacion para stakeholders internos y externos durante incidentes

## Inputs

The user provides an organization or service name as `$ARGUMENTS`. Parse `$1` as the **organization/service name**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)
- `{MADUREZ}`: `inicial` | `definido` | `gestionado` | `auto` (default)

## Entregables

1. **Playbook de incidentes** — End-to-end incident response process with roles, phases, and decision trees
2. **Matriz de severidad** — Severity classification (SEV1-SEV4) with objective criteria, response times, and escalation triggers
3. **Templates de comunicacion** — Pre-built templates for internal updates, customer notifications, and status page messages
4. **Template de postmortem** — Blameless postmortem structure with timeline, root cause analysis, impact assessment, and action items
5. **Guia de on-call** — On-call rotation design, handoff procedures, and responder wellness guidelines

## Proceso

1. **Definir severidad** — Establish severity levels with objective criteria: user impact (% affected), revenue impact, data integrity, security breach
2. **Disenar flujo de respuesta** — Map incident lifecycle: detection → triage → response → mitigation → resolution → postmortem
3. **Asignar roles** — Define incident roles: Incident Commander (IC), Communications Lead, Technical Lead, Scribe
4. **Crear escalamiento** — Build escalation matrix: who to contact per severity, maximum time at each level, automatic escalation triggers
5. **Disenar comunicacion** — Create templates for each phase: initial detection, ongoing updates (every 30/60 min), resolution, and postmortem summary
6. **Establecer postmortem** — Define postmortem trigger criteria, timeline format, 5-whys analysis, action item tracking, and blameless culture guidelines
7. **Planificar on-call** — Design rotation schedule, compensation model, handoff procedures, and burnout prevention measures
8. **Definir metricas** — Track: MTTD (detect), MTTA (acknowledge), MTTR (resolve), incident frequency, postmortem completion rate

## Criterios de Calidad

- [ ] Severity levels have objective, measurable criteria (not subjective judgment)
- [ ] Response time targets defined per severity level (acknowledge, update, resolve)
- [ ] Roles are clearly defined with backup assignments
- [ ] Escalation paths include time-based automatic escalation
- [ ] Communication templates cover internal and external audiences
- [ ] Postmortem template enforces blameless language and structural analysis
- [ ] On-call rotation considers team wellness and sustainable workload
- [ ] Metrics defined for continuous improvement of incident response

## Supuestos y Limites

- Assumes monitoring and alerting infrastructure exists to detect incidents
- Incident management process effectiveness depends on regular practice (game days, drills)
- Does not implement tooling — produces process and template artifacts
- Blameless culture requires organizational commitment beyond documentation

## Cross-References

- **sofka-observability:** Monitoring and alerting that triggers incident detection
- **sofka-sla-design:** SLO violations that define incident severity and impact
- **sofka-disaster-recovery:** DR procedures invoked during major incidents (SEV1)

---
**Autor:** Equipo PreSales Sofka | **Version:** 1.0.0
