---
name: metodologia-capacity-planning
description: >
  Infrastructure and team capacity forecasting — load projections, scaling triggers, resource optimization.
  Use when the user asks to "plan capacity", "forecast load", "define scaling strategy",
  "optimize resources", or mentions autoscaling, bottleneck analysis, resource forecasting, sizing.
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

# Capacity Planning: Infrastructure & Team Forecasting

Capacity planning projects future resource needs for infrastructure and teams, defining scaling triggers and optimization strategies. The skill produces capacity models, scaling playbooks, and bottleneck analyses that prevent both under-provisioning (outages) and over-provisioning (waste).

## TL;DR

- Modela capacidad actual y proyecta demanda futura basada en metricas de crecimiento
- Define triggers de escalamiento automatico y manual con umbrales claros
- Identifica cuellos de botella en infraestructura, datos, y equipos humanos
- Produce playbook de escalamiento con procedimientos paso a paso
- Optimiza costos eliminando sobre-aprovisionamiento sin comprometer disponibilidad

## Inputs

The user provides a system or team context as `$ARGUMENTS`. Parse `$1` as the **system/team name**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)
- `{HORIZONTE}`: `3m` | `6m` | `12m` (default) | `24m`

## Entregables

1. **Modelo de capacidad** — Current utilization baseline, growth projections, and headroom analysis per resource type
2. **Playbook de escalamiento** — Step-by-step scaling procedures for each resource tier with triggers and validation
3. **Analisis de cuellos de botella** — Identified bottlenecks with impact assessment and remediation options
4. **Plan de optimizacion de costos** — Right-sizing recommendations, reserved capacity strategy, spot/preemptible usage
5. **Dashboard de metricas** — Key capacity indicators, thresholds, and alerting rules

## Proceso

1. **Establecer baseline** — Measure current utilization across compute, storage, network, database, and team capacity
2. **Analizar patrones de demanda** — Identify peak/off-peak patterns, seasonal trends, and growth drivers
3. **Proyectar demanda** — Forecast future demand using historical trends, business growth plans, and planned feature launches
4. **Identificar cuellos de botella** — Find resources approaching limits; analyze cascading failure scenarios
5. **Definir triggers de escalamiento** — Set autoscaling thresholds (CPU, memory, queue depth, latency) with hysteresis to prevent flapping
6. **Disenar playbook** — Document scaling procedures: automated triggers, manual escalation, validation checks, rollback
7. **Optimizar costos** — Recommend right-sizing, reserved instances, spot usage, and resource consolidation
8. **Planificar capacidad de equipo** — Project team staffing needs based on delivery velocity and planned initiatives

## Criterios de Calidad

- [ ] Baseline utilization measured with real data, not estimates
- [ ] Growth projections documented with assumptions and confidence levels
- [ ] Bottleneck analysis covers compute, storage, network, database, and external dependencies
- [ ] Scaling triggers include hysteresis to prevent oscillation
- [ ] Playbook tested or validated against historical scaling events
- [ ] Cost optimization quantified with projected savings
- [ ] Team capacity considers hiring lead times and ramp-up periods
- [ ] Evidence tags applied: [DOC], [CONFIG], [INFERENCIA], [SUPUESTO]

## Supuestos y Limites

- Accuracy depends on quality of historical utilization data
- Growth projections are estimates based on stated business assumptions
- Does not implement autoscaling — produces configuration recommendations
- Team capacity models assume stable velocity (adjust for ramp-up, attrition)

## Cross-References

- **metodologia-cloud-architecture:** Cloud infrastructure that provides scaling capabilities
- **metodologia-observability:** Monitoring data that feeds capacity models
- **metodologia-sla-design:** SLO targets that define minimum acceptable capacity

---
**Autor:** Javier Montaño · Comunidad MetodologIA | **Version:** 1.0.0
