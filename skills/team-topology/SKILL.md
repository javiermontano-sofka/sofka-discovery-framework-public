---
name: sofka-team-topology
description: >
  Conway's Law analysis, team interaction modes, cognitive load assessment, organizational design.
  Use when the user asks to "design team structure", "assess cognitive load", "map team interactions",
  "apply Conway's Law", or mentions stream-aligned teams, platform teams, enabling teams, team-first thinking.
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

# Team Topology: Organizational Design for Fast Flow

Team topology designs organizational structures that optimize for fast flow of change while managing cognitive load. The skill produces team topology maps, interaction matrices, and evolution plans based on the Team Topologies framework (Skelton & Pais).

## TL;DR

- Analiza la ley de Conway: como la estructura organizacional actual condiciona la arquitectura del software
- Clasifica equipos en los 4 tipos fundamentales: stream-aligned, platform, enabling, complicated-subsystem
- Evalua carga cognitiva por equipo para detectar sobrecarga y dependencias excesivas
- Mapea modos de interaccion (colaboracion, X-as-a-service, facilitacion) con evolucion temporal
- Produce plan de evolucion organizacional alineado con la arquitectura objetivo

## Inputs

The user provides an organization or department name as `$ARGUMENTS`. Parse `$1` as the **organization/department name**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)
- `{HORIZONTE}`: `6m` | `12m` (default) | `24m`

## Entregables

1. **Mapa de topologia de equipos** — Visual map of all teams classified by type with ownership boundaries
2. **Matriz de interacciones** — Team-to-team interaction modes (collaboration, X-as-a-service, facilitating) with expected evolution
3. **Plan de evolucion** — Phased plan to evolve from current to target topology with milestones and change management
4. **Evaluacion de carga cognitiva** — Per-team cognitive load assessment with overload indicators and remediation
5. **Analisis de Conway** — Mapping of current org structure to software architecture with misalignment identification

## Proceso

1. **Mapear estructura actual** — Document current teams, their responsibilities, sizes, and reporting lines
2. **Analizar ley de Conway** — Map how current team boundaries reflect (or conflict with) the software architecture
3. **Clasificar equipos** — Categorize each team: stream-aligned (business capability), platform (internal services), enabling (capability uplift), complicated-subsystem (deep expertise)
4. **Evaluar carga cognitiva** — Assess each team's cognitive load: intrinsic (domain complexity), extraneous (tooling, process overhead), germane (learning, improvement)
5. **Identificar anti-patrones** — Detect: teams too large (>9), too many dependencies, shared ownership, siloed knowledge, handoff chains
6. **Disenar topologia objetivo** — Define target team structure aligned with desired architecture and value streams
7. **Mapear interacciones** — Define interaction mode per team pair: collaboration (temporary, high-bandwidth), X-as-a-service (API-like, low-coupling), facilitating (enabling team helps others)
8. **Planificar evolucion** — Create phased transition plan with organizational change management, communication, and success metrics

## Criterios de Calidad

- [ ] All teams classified into one of the 4 fundamental types
- [ ] Cognitive load assessed per team with quantitative indicators (domains owned, services maintained)
- [ ] Interaction modes defined for all significant team pairs
- [ ] Evolution plan includes intermediate states (not just current and target)
- [ ] Conway's Law analysis identifies architecture-organization misalignments
- [ ] Team sizes within recommended bounds (5-9 members)
- [ ] Dependencies between teams explicitly mapped and minimized
- [ ] Change management considerations included in evolution plan

## Supuestos y Limites

- Assumes leadership support for organizational restructuring
- Team topology is a model — real organizations have nuances the model simplifies
- Does not address HR, compensation, or formal reporting line changes
- Effectiveness depends on alignment between architecture evolution and team evolution

## Cross-References

- **sofka-software-architecture:** Architecture that team topology must align with (reverse Conway maneuver)
- **sofka-change-readiness-assessment:** Organizational readiness for team restructuring
- **sofka-product-strategy:** Value streams that drive stream-aligned team boundaries

---
**Autor:** Equipo PreSales Sofka | **Version:** 1.0.0
