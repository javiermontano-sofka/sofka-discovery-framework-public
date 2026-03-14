---
name: sofka-disaster-recovery
description: >
  DR/BCP planning — RPO/RTO definition, failover design, backup strategies, tabletop exercises.
  Use when the user asks to "plan disaster recovery", "define RPO/RTO", "design failover",
  "create BCP", or mentions business continuity, backup strategy, recovery runbook, tabletop exercise.
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

# Disaster Recovery: Business Continuity & Recovery Planning

Disaster recovery planning ensures organizational resilience through defined recovery objectives, failover designs, and tested recovery procedures. The skill produces DR plans, recovery runbooks, and test schedules that minimize downtime and data loss during disruptive events.

## TL;DR

- Define RPO (Recovery Point Objective) y RTO (Recovery Time Objective) por sistema y criticidad
- Disena estrategias de failover (active-active, active-passive, pilot light, warm standby)
- Produce runbooks de recuperacion paso a paso con roles, contactos y procedimientos
- Establece calendario de pruebas DR (tabletop, failover parcial, failover completo)
- Integra BCP (Business Continuity Plan) con analisis de impacto al negocio (BIA)

## Inputs

The user provides a system or organization context as `$ARGUMENTS`. Parse `$1` as the **system/organization name**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)
- `{TIER}`: `mission-critical` | `business-critical` | `business-operational` | `all` (default)

## Entregables

1. **Plan de DR** — Comprehensive disaster recovery plan with scope, roles, communication tree, and recovery procedures
2. **Runbook de recuperacion** — Step-by-step recovery procedures per system tier with validation checks
3. **Calendario de pruebas** — DR test schedule with exercise types, scope, and success criteria
4. **Analisis de impacto al negocio (BIA)** — Business impact analysis mapping systems to business processes with downtime cost
5. **Matriz RPO/RTO** — Recovery objectives per system with current vs. target gaps

## Proceso

1. **Realizar BIA** — Identify critical business processes, map supporting systems, quantify downtime impact per hour/day
2. **Clasificar sistemas por tier** — Assign criticality tiers: mission-critical (RPO<1h, RTO<1h), business-critical (RPO<4h, RTO<4h), operational (RPO<24h, RTO<24h)
3. **Definir RPO/RTO** — Set recovery objectives per system based on business impact and cost tolerance
4. **Disenar estrategia de failover** — Select failover pattern per tier: active-active, active-passive, pilot light, warm standby, cold standby
5. **Disenar estrategia de backup** — Define backup frequency, retention, encryption, off-site storage, and restoration procedures
6. **Crear runbooks** — Document step-by-step recovery procedures with roles, validation checks, and escalation paths
7. **Establecer comunicacion de crisis** — Define communication tree, notification channels, stakeholder updates, and public communication templates
8. **Planificar pruebas** — Schedule tabletop exercises (quarterly), partial failover (semi-annual), and full failover (annual)

## Criterios de Calidad

- [ ] BIA covers all critical business processes with quantified downtime impact
- [ ] RPO/RTO defined for every in-scope system with gap analysis (current vs. target)
- [ ] Failover strategy matched to system tier and budget constraints
- [ ] Runbooks tested or reviewed by operations team
- [ ] Communication tree includes backup contacts and external stakeholders
- [ ] Test schedule includes escalating complexity (tabletop → partial → full)
- [ ] Backup strategy includes encryption, off-site storage, and restoration validation
- [ ] Evidence tags applied: [DOC], [CONFIG], [INFERENCIA], [SUPUESTO]

## Supuestos y Limites

- Assumes infrastructure team can implement recommended failover patterns
- RPO/RTO targets must be validated against budget — lower targets cost more
- Does not implement DR infrastructure — produces plans and runbooks
- Regulatory requirements (data residency, retention) may constrain DR design

## Cross-References

- **sofka-cloud-architecture:** Cloud infrastructure that enables DR capabilities (multi-region, multi-AZ)
- **sofka-security-architecture:** Security controls for backup encryption and DR environment access
- **sofka-sla-design:** SLA commitments that drive RPO/RTO requirements

---
**Autor:** Equipo PreSales Sofka | **Version:** 1.0.0
