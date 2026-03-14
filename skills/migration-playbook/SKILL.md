---
name: sofka-migration-playbook
description: >
  Detailed migration execution guide — strangler fig, parallel run, big bang, rollback procedures, data migration.
  Use when the user asks to "plan migration", "design cutover", "build migration playbook",
  "define rollback strategy", or mentions strangler fig, parallel run, data migration, legacy modernization.
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

# Migration Playbook: Execution Strategy & Cutover Planning

Migration playbook provides detailed execution guidance for system migrations, covering strategy selection, data migration, cutover choreography, and rollback procedures. The skill produces migration playbooks, cutover checklists, and rollback plans that minimize risk during system transitions.

## TL;DR

- Selecciona estrategia de migracion apropiada (strangler fig, parallel run, big bang) segun riesgo y contexto
- Disena plan de migracion de datos con validacion, reconciliacion y rollback
- Produce checklist de cutover con secuencia horaria, responsables y criterios go/no-go
- Define procedimientos de rollback con puntos de decision y tiempos maximos
- Establece metricas de exito post-migracion y periodo de estabilizacion

## Inputs

The user provides a migration context as `$ARGUMENTS`. Parse `$1` as the **migration/project name**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)
- `{ESTRATEGIA}`: `strangler-fig` | `parallel-run` | `big-bang` | `phased` | `auto` (default)

## Entregables

1. **Playbook de migracion** — Comprehensive migration guide with strategy, phases, dependencies, and risk mitigation
2. **Checklist de cutover** — Hour-by-hour cutover sequence with tasks, owners, validation checks, and go/no-go gates
3. **Plan de rollback** — Detailed rollback procedures with decision points, time limits, and data recovery steps
4. **Plan de migracion de datos** — Data extraction, transformation, loading, validation, and reconciliation procedures
5. **Plan de estabilizacion** — Post-migration monitoring, issue triage, and hypercare period definition

## Proceso

1. **Evaluar contexto de migracion** — Assess source/target systems, data volumes, integration dependencies, downtime tolerance, and team capability
2. **Seleccionar estrategia** — Choose migration approach based on risk tolerance, downtime window, and system complexity
3. **Disenar migracion de datos** — Plan ETL pipeline: extraction from source, transformation rules, loading into target, validation checksums
4. **Planificar wave structure** — Group migration items into waves by risk and dependency; pilot wave first
5. **Crear checklist de cutover** — Sequence all cutover activities: pre-cutover prep, DNS/traffic switch, validation, rollback window
6. **Disenar rollback** — Define rollback triggers, procedures, maximum time-to-decision, and data reconciliation after rollback
7. **Planificar comunicacion** — Stakeholder notifications: pre-migration, during cutover, post-migration, and incident escalation
8. **Definir hypercare** — Establish post-migration monitoring period with enhanced support, issue SLAs, and stabilization criteria

## Criterios de Calidad

- [ ] Migration strategy justified with risk-benefit analysis
- [ ] Data migration includes validation and reconciliation procedures
- [ ] Cutover checklist is time-sequenced with owners and validation gates
- [ ] Rollback plan tested or at minimum reviewed by operations team
- [ ] Rollback decision point defined with clear criteria and time limit
- [ ] Communication plan covers all stakeholder groups
- [ ] Hypercare period defined with specific monitoring and support levels
- [ ] Evidence tags applied: [DOC], [CONFIG], [INFERENCIA], [SUPUESTO]

## Supuestos y Limites

- Assumes source and target systems are documented or accessible for analysis
- Data migration timings are estimates until validated by dry-run
- Does not implement migration — produces planning and execution artifacts
- Rollback feasibility depends on data mutability during migration window

## Cross-References

- **sofka-software-architecture:** Target architecture that migration delivers
- **sofka-testing-strategy:** Migration validation testing strategy
- **sofka-disaster-recovery:** DR considerations during and after migration

---
**Autor:** Equipo PreSales Sofka | **Version:** 1.0.0
