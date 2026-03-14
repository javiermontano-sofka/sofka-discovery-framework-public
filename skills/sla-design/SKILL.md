---
name: sofka-sla-design
description: >
  SLO/SLA/SLI definition — error budget policies, reliability targets, customer-facing commitments.
  Use when the user asks to "define SLAs", "design SLOs", "set reliability targets",
  "create error budget policy", or mentions SLI, service level, uptime, nines, error budgets.
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

# SLA Design: Service Level Objectives, Indicators & Agreements

SLA design establishes measurable reliability targets that balance user expectations with engineering investment. The skill produces SLO catalogs, error budget policies, and SLA templates following Google SRE principles for sustainable reliability management.

## TL;DR

- Define SLIs (Service Level Indicators) basados en la experiencia real del usuario, no en metricas internas
- Establece SLOs (Service Level Objectives) con targets de confiabilidad alineados al impacto de negocio
- Disena politicas de error budget que conectan confiabilidad con velocidad de desarrollo
- Produce templates de SLA (Service Level Agreements) para compromisos contractuales con clientes
- Crea framework de gobernanza para revision, ajuste y escalamiento de niveles de servicio

## Inputs

The user provides a service or platform name as `$ARGUMENTS`. Parse `$1` as the **service/platform name**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)
- `{ALCANCE}`: `single-service` | `platform` | `customer-facing` | `auto` (default)

## Entregables

1. **Catalogo de SLOs** — Per-service SLI definitions, SLO targets, measurement windows, and rationale
2. **Politica de error budget** — Error budget calculation, consumption tracking, escalation triggers, and development velocity consequences
3. **Template de SLA** — Customer-facing SLA template with commitments, exclusions, measurement methodology, and remedies
4. **Dashboard de confiabilidad** — Metrics specification for SLI measurement, SLO tracking, and error budget burn rate
5. **Guia de gobernanza** — Review cadence, SLO adjustment criteria, stakeholder RACI, and escalation procedures

## Proceso

1. **Identificar user journeys criticos** — Map the most important user-facing workflows that define perceived reliability
2. **Definir SLIs** — Select indicators that measure user experience: availability (successful requests / total), latency (p50, p95, p99), correctness, freshness, throughput
3. **Establecer SLO targets** — Set reliability targets per SLI based on user expectations, business impact, and engineering cost of each additional nine
4. **Calcular error budgets** — Derive error budget from SLO: 99.9% SLO = 0.1% error budget = 43.2 min/month or 8.76 h/year
5. **Disenar politica de error budget** — Define what happens when budget is consumed: freeze deployments, focus on reliability, postmortem triggers
6. **Crear template SLA** — Draft customer-facing agreement with: commitments (always looser than SLOs), measurement window, exclusions, service credits
7. **Especificar dashboard** — Define metrics collection, visualization, alerting on burn rate, and multi-window alerting strategy
8. **Establecer gobernanza** — Define quarterly SLO review, adjustment criteria, and escalation paths

## Criterios de Calidad

- [ ] SLIs measure user-facing experience (not internal metrics like CPU usage)
- [ ] SLO targets justified by business impact analysis (cost of each nine)
- [ ] Error budget policy has clear consequences for budget exhaustion
- [ ] SLA commitments are looser than internal SLOs (buffer for safety)
- [ ] Measurement methodology is unambiguous and reproducible
- [ ] Multi-window burn rate alerting configured (fast-burn + slow-burn)
- [ ] Governance includes periodic review and adjustment process
- [ ] Evidence tags applied: [DOC], [CONFIG], [INFERENCIA], [SUPUESTO]

## Supuestos y Limites

- SLO targets are starting points — expect iterative refinement over 2-3 quarters
- Error budget policy requires organizational buy-in from product and engineering leadership
- SLA service credits are business decisions outside the scope of technical design
- Effective SLO management requires observability infrastructure (metrics, tracing, logging)

## Cross-References

- **sofka-observability:** Monitoring infrastructure that measures SLIs and tracks SLOs
- **sofka-capacity-planning:** Capacity that underpins reliability targets
- **sofka-incident-management:** Incident response triggered by SLO violations

---
**Autor:** Equipo PreSales Sofka | **Version:** 1.0.0
